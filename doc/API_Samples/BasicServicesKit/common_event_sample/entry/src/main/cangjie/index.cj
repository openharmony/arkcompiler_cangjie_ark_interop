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
import kit.BasicServicesKit.*
import ohos.hilog.Hilog
import ohos.business_exception.*

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
                        test()
                    }
            }.width(100.percent)
        }.height(100.percent)
    }
}

func test() {
   // 用于保存创建成功的订阅者对象，后续使用其完成订阅及退订的动作
   let subscriber: CommonEventSubscriber
   // 订阅者信息，其中的event字段需要替换为实际的事件名称
   let support1 = Support.COMMON_EVENT_SCREEN_ON
   let events = [support1]
   let subscribeInfo = CommonEventSubscribeInfo(events)
   // 创建订阅者回调
   subscriber = CommonEventManager.createSubscriber(subscribeInfo)

   // 订阅公共事件回调
   func callback(e: ?BusinessException, c: ?CommonEventData): Unit {
         Hilog.info(0, "TestCEM", "=======================================")
         Hilog.info(0, "TestCEM", "event of p is = ${c?.event}")
         Hilog.info(0, "TestCEM", "p of p is = ${c?.parameters.size}")
         Hilog.info(0, "TestCEM", "callback excute success!")
   }
   CommonEventManager.subscribe(subscriber, callback)
}