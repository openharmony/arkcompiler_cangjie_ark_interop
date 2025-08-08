# Application File Upload and Download

Applications can upload files to web servers and download network resource files to local application directories.

## Uploading Application Files

Developers can use the upload interface of the Upload-Download module ([ohos.request](../../../../API_Reference/source_en/apis/BasicServicesKit/cj-apis-request-agent.md)) to upload local files. The file upload process is completed through a system service proxy, supporting custom proxy address configuration.

> **Note:**
>
> The current file upload functionality only supports uploading files from the application cache directory (cacheDir).
>
> To use the Upload-Download module, please declare the permission: [ohos.permission.INTERNET](../../security/AccessToken/cj-declare-permissions.md).
> For Global definition, refer to [Usage Instructions](../../../../API_Reference/source_en/cj-development-intro.md)

The following example demonstrates how to upload files from the application cache directory to a web server:

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
    // Get application file path
    let stageContext = Global.getStageContext() // Context acquisition required, see usage instructions
    let DefaultSandBoxCache = "/data/storage/el2/base/haps/entry/cache"
    // Create a local application file
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

## Downloading Network Resource Files to Application Directory

Developers can use the download interface of the Upload-Download module ([ohos.request](../../../../API_Reference/source_en/apis/BasicServicesKit/cj-apis-request-agent.md)) to download network resource files to the application directory. For downloaded files, developers can access them using basic file I/O interfaces ([ohos.file_fs](../../../../API_Reference/source_en/apis/CoreFileKit/cj-apis-file_fs.md)), with usage consistent with [Application File Access](../../file-management/cj-app-file-access.md). The download process uses a system service proxy and supports custom proxy address configuration.

> **Note:**
>
> Currently, network resource files can only be downloaded to the application directory.
>
> To use the Upload-Download module, please declare the permission: [ohos.permission.INTERNET](../../security/AccessToken/cj-declare-permissions.md).

The following example demonstrates how to download network resource files to the application directory:

<!-- compile -->

```cangjie
// pages/xxx.cj
// Download network resource files to application directory
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

// Download function
func Download(): Unit {
    // Get application file path
    let stageContext = Global.getStageContext()
    let DefaultSandBoxCache = "/data/storage/el2/base/haps/entry/cache"
    let fileName = "test.txt"
    let filePath = "${DefaultSandBoxCache}/${fileName}"

    // Download URL
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
    // Check if file exists
    if (FileFs.access(filePath)) {
        // Delete file
        FileFs.unlink(filePath)
    }
    // Terminate task
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