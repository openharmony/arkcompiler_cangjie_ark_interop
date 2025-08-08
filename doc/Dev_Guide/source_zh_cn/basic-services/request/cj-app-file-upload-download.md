# 应用文件上传下载

应用可以将应用文件上传到网络服务器，也可以从网络服务器下载网络资源文件到本地应用文件目录。

## 上传应用文件

开发者可以使用上传下载模块（[ohos.request](../../../../API_Reference/source_zh_cn/apis/BasicServicesKit/cj-apis-request-agent.md)）的上传接口将本地文件上传。文件上传过程使用系统服务代理完成，支持用户设置自定义代理地址。

> **说明：**
>
> 当前上传应用文件功能，仅支持上传应用缓存文件路径（cacheDir）下的文件。
>
> 使用上传下载模块，请参见[声明权限](../../security/AccessToken/cj-declare-permissions.md)：ohos.permission.INTERNET。
> Global 定义请参见[使用说明](../../../../API_Reference/source_zh_cn/cj-development-intro.md)

以下示例代码演示将应用缓存文件路径下的文件上传至网络服务器的方式：

<!-- compile -->

```cangjie
// pages/xxx.cj
import ohos.file_fs.{FileFs, OpenMode}
import ohos.ability.{AbilityStageContext, UIAbilityContext, getStageContext, Want}
import ohos.base.Callback1Argument
import kit.BasicServicesKit.{State as RState, Filter as RFilter, Action as RAction, Progress as RProgress, remove as rRemove
    }
import kit.BasicServicesKit.*

func Upload(): Unit {
    // 获取应用文件路径
    let stageContext = Global.getStageContext() // 需获取 context 应用上下文，详见本文使用说明
    let DefaultSandBoxCache = "/data/storage/el2/base/haps/entry/cache"
    // 新建一个本地应用文件
    let filePath = "${DefaultSandBoxCache}/test.txt"
    let file = FileFs.open(filePath, mode: (OpenMode.CREATE.mode | READ_WRITE.mode))
    FileFs.write(file.fd, "hello world")
    FileFs.fdatasync(file.fd)
    let randomAccessFile = FileFs.createRandomAccessFile(file)
    randomAccessFile.close()
    let responseCallback = ProgressCallback()

    let fileSpec = FileSpec(
        path: "./test.txt",
        filename: "test.txt",
        mimeType: "application/octet-stream"
    )
    let attachments = ConfigDataType.FORMITEMS([
        FormItem(
            name: "taskOnTest",
            value: FormItemValueType.FILE(fileSpec)
        )
    ])

    let uploadConfig = Config(
        action: RAction.UPLOAD,
        url: "http://xxx",
        title: "taskOnTest",
        mode: Mode.FOREGROUND,
        description: "Sample code for event listening",
        overwrite: false,
        method: "POST",
        data: attachments,
        saveas: "./",
        network: Network.CELLULAR,
        metered: false,
        roaming: true,
        retry: true,
        redirect: true,
        index: 0,
        begins: 0,
        ends: -1,
        gauge: false,
        precise: false,
        token: "it is a secret"
    )
    let task = create(stageContext, uploadConfig)
    task.on("progress", responseCallback)
    task.start()
}

class ProgressCallback <: Callback1Argument<Progress> {
    public init() {}
    public open func invoke(arg: Progress): Unit {
        AppLog.info("progress callback.")
    }
}
```

## 下载网络资源文件至应用文件目录

开发者可以使用上传下载模块（[ohos.request](../../../../API_Reference/source_zh_cn/apis/BasicServicesKit/cj-apis-request-agent.md)）的下载接口将网络资源文件下载到应用文件目录。对已下载的网络资源文件，开发者可以使用基础文件IO接口（[ohos.file_fs](../../../../API_Reference/source_zh_cn/apis/CoreFileKit/cj-apis-file_fs.md)）对其进行访问，使用方式与[应用文件访问](../../file-management/cj-app-file-access.md)一致。文件下载过程使用系统服务代理完成，支持用户设置自定义代理地址。

> **说明：**
>
> 当前网络资源文件仅支持下载至应用文件目录。
>
> 使用上传下载模块，请参见[声明权限](../../security/AccessToken/cj-declare-permissions.md)：ohos.permission.INTERNET。

以下示例代码演示将网络资源文件下载到应用文件目录的方式：

<!-- compile -->

```cangjie
// pages/xxx.cj
// 将网络资源文件下载到应用文件目录
import ohos.file_fs.{FileFs, OpenMode}
import ohos.ability.{AbilityStageContext, UIAbilityContext, getStageContext, Want}
import kit.BasicServicesKit.{State as RState, Filter as RFilter, Action as RAction, Progress as RProgress, remove as rRemove
    }
import kit.BasicServicesKit.*
import std.time.*
import std.collection.*
import std.runtime.*
import std.sync.*
import ohos.base.Callback1Argument

//下载的函数
func Download(): Unit {
    // 获取应用文件路径
    let stageContext = Global.getStageContext()
    let DefaultSandBoxCache = "/data/storage/el2/base/haps/entry/cache"
    let fileName = "test.txt"
    let filePath = "${DefaultSandBoxCache}/${fileName}"

    // 下载url地址
    let fileURL = "https://xxx.txt"
    let responseCallback = HttpResponseMessageCallback()

    let config = Config(
        action: RAction.DOWNLOAD,
        url: fileURL,
        saveas: fileName,
        headers: HashMap<String, String>([("headers", "http")]),
        metered: false,
        roaming: true,
        description: "download test",
        network: Network.ANY,
        title: "download test title"
    )
    let task = create(stageContext, config)
    task.on("response", responseCallback)

    task.start()
    requestWaitFor(Duration.second * 10) {
        =>
        let stat = FileFs.stat(filePath)
        let size = stat.size
        AppLog.info("size = ${size}")
        size > 0
    }
    //检查文件是否存在
    if (FileFs.access(filePath)) {
        //删除文件
        FileFs.unlink(filePath)
    }
    //结束任务
    rRemove(task.tid)
}


class HttpResponseMessageCallback <: Callback1Argument<HttpResponseMessage> {
    public HttpResponseMessageCallback() {}
    public open func invoke(arg: HttpResponseMessage): Unit {
        logger.info("HttpResponseMessage is ${arg.toString()}")
    }
}

public func requestWaitFor(timeout: Duration, condition: () -> Bool) {
    let monitor = Monitor()
    let conditionIsMet = AtomicBool(false)
    let checkerTimer = Timer.repeatDuring(timeout, Duration.Zero, Duration.millisecond * 500,
        {
            => if (condition()) {
                conditionIsMet.store(true)
                synchronized(monitor) {
                    monitor.notify()
                }
            }
        })
    let cancellerTimer = Timer.once(timeout) {
        => synchronized(monitor) {
            monitor.notify()
        }
    }
    synchronized(monitor) {
        monitor.wait()
    }

    checkerTimer.cancel()
    cancellerTimer.cancel()
}
```
