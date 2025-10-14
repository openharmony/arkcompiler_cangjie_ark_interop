/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package ohos_app_cangjie_entry

internal import ohos.base.LengthProp
internal import ohos.arkui.component.Column
internal import ohos.arkui.component.Row
internal import ohos.arkui.component.Text
internal import ohos.arkui.component.CustomView
internal import ohos.arkui.component.CJEntry
internal import ohos.arkui.component.loadNativeView
internal import ohos.arkui.component.FontWeight
internal import ohos.arkui.state_management.SubscriberManager
internal import ohos.arkui.state_management.ObservedProperty
internal import ohos.arkui.state_management.LocalStorage
import ohos.state_macro_manage.Entry
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.State
import ohos.state_macro_manage.r
import kit.CameraKit.*
import ohos.base.*
import kit.AbilityKit.*
import ohos.hilog.Hilog
import ohos.callback_invoke.*
import ohos.business_exception.*
import kit.BasicServicesKit.*
import kit.CoreFileKit.*
import kit.BasicServicesKit.{State as RState, Filter as RFilter, Action as RAction, Progress as RProgress, remove as rRemove}
import std.time.*
import std.collection.*
import std.sync.*

@Entry
@Component
class EntryView {
    @State
    var message: String = "Hello World"

    func build() {
        Row {
            Column {
                Text(this.message)
                    .fontSize(50)
                    .fontWeight(FontWeight.Bold)
                    .onClick {
                        evt => this.message = "Hello Cangjie"
                        Upload()
                        Download()
                    }
            }.width(100.percent)
        }.height(100.percent)
    }
}

func Upload(): Unit {
    // 获取应用文件路径
    let UiStageContext = globalContext.getOrThrow()
    let DefaultSandBoxCache = "/data/storage/el2/base/haps/entry/cache"
    // 新建一个本地应用文件
    let filePath = "${DefaultSandBoxCache}/test.txt"
    let file = FileIo.open(filePath, mode: (OpenMode.CREATE | OpenMode.READ_WRITE))
    FileIo.write(file.fd, "hello world")
    FileIo.fdatasync(file.fd)
    let randomAccessFile = FileIo.createRandomAccessFile(file)
    randomAccessFile.close()
    let responseCallback = ProgressCallback()

    let fileSpec = FileSpec(
        "./test.txt",
        filename: "test.txt",
        mimeType: "application/octet-stream"
    )
    let attachments = ConfigData.FormItems([
        FormItem(
            "taskOnTest",
            FormItemValue.FileItem(fileSpec)
        )
    ])

    let uploadConfig = Config(
        RAction.Upload,
        "http://xxx",
        title: "taskOnTest",
        mode: Mode.Foreground,
        description: "Sample code for event listening",
        overwrite: false,
        method: "POST",
        data: attachments,
        saveas: "./",
        network: Network.Cellular,
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
    let task = create(UiStageContext, uploadConfig)
    task.on(EventCallbackType.Progress, responseCallback)
    task.start()
}

public class ProgressCallback <: Callback1Argument<RProgress> {
    public ProgressCallback() {}

    public open func invoke(err: ?BusinessException, arg: RProgress): Unit {
        Hilog.info(0, "CangjieTest", "ProgressCallback Invoke")
    }
}

//下载的函数
func Download(): Unit {
    // 获取应用文件路径
    let UiStageContext = globalContext.getOrThrow()
    let DefaultSandBoxCache = "/data/storage/el2/base/haps/entry/cache"
    let fileName = "test.txt"
    let filePath = "${DefaultSandBoxCache}/${fileName}"

    // 下载url地址
    let fileURL = "https://xxx.txt"
    let responseCallback = HttpResponseCallback()

    let config = Config(
        RAction.Download,
        fileURL,
        saveas: fileName,
        headers: HashMap<String, String>([("headers", "http")]),
        metered: false,
        roaming: true,
        description: "download test",
        network: Network.AnyType,
        title: "download test title"
    )
    let task = create(UiStageContext, config)
    task.on(EventCallbackType.Response, responseCallback)

    task.start()
    requestWaitFor(Duration.second * 10) {
        =>
        let stat = FileIo.stat(filePath)
        let size = stat.size
        size > 0
    }
    //检查文件是否存在
    if (FileIo.access(filePath)) {
        //删除文件
        FileIo.unlink(filePath)
    }
    //结束任务
    rRemove(task.tid)
}


class HttpResponseCallback <: Callback1Argument<HttpResponse> {
    public HttpResponseCallback() {}
    public open func invoke(err: ?BusinessException, arg: HttpResponse): Unit {
        Hilog.info(0, "CangjieTest", "HttpResponse Invoke")
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