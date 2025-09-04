package ohos_app_cangjie_entry

internal import ohos.arkui.base.LengthProp
internal import ohos.arkui.component.Column
internal import ohos.arkui.component.Row
internal import ohos.arkui.component.Button
internal import ohos.arkui.component.Text
internal import ohos.arkui.component.CustomView
internal import ohos.arkui.component.CJEntry
internal import ohos.arkui.component.loadNativeView
internal import ohos.arkui.state_manage.SubscriberManager
internal import ohos.arkui.state_manage.ObservedProperty
internal import ohos.arkui.state_manage.LocalStorage
import ohos.arkui.state_macro_manage.Entry
import ohos.arkui.state_macro_manage.Component
import ohos.arkui.state_macro_manage.State
import ohos.arkui.state_macro_manage.r

import kit.TelephonyKit.*
import ohos.business_exception.*
import ohos.callback_invoke.*

@Entry
@Component
class EntryView {
    @State
    var num = 0
    var netType = "N/A"

    func build() {
        Row {
            Column {
                Button("Telephony")
                    .onClick {
                        evt =>
                            let isSupport = Call.hasVoiceCapability()
                            if (isSupport) {
                                Call.makeCall(Global.getAbilityContext(), "13000000000")
                            }
                    }
            }.width(100.percent)
        }.height(100.percent)
    }
}