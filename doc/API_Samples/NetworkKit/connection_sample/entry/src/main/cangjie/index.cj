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

import kit.NetworkKit.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.business_exception.*
import ohos.callback_invoke.*

const TIME_OUT: UInt32 = 10 * 1000

let netSpecifier = NetSpecifier(NetCapabilities([NetBearType.BearerCellular], networkCap: [NetCap.NetCapabilityInternet]))
var connects = createNetConnection(netSpecifier: netSpecifier, timeout: TIME_OUT)

class TestCallback <: Callback1Argument<NetHandle> {
    let lambda_: (NetHandle)->Unit
    public init(lambda: (NetHandle)->Unit) {
        lambda_ = lambda
    }
    public func invoke(e: ?BusinessException, data: NetHandle): Unit {
        lambda_(data)
    }
}

@Entry
@Component
class EntryView {
    @State
    var num = 0
    var netType = "N/A"

    func build() {
        Row {
            Column {
                Text("Register connect")
                    .fontSize(50)
                    .fontWeight(FontWeight.Bold)
                    .onClick {
                        evt =>
                            connects.register()
                            connects.on(NetAvailable, TestCallback({ netHandle =>
                                Hilog.info(0, "cangjie", "net is available, netId is ${netHandle.netId}")
                            }))
                            connects.on(NetUnavailable, TestCallback({ _ =>
                                Hilog.info(0, "cangjie", "net is unavailable")
                            }))
                    }
                Text("Unregister connect")
                    .fontSize(50)
                    .fontWeight(FontWeight.Bold)
                    .onClick {
                        evt =>
                            connects.unregister()
                    }
                Text("Update net num: ${this.num}")
                    .fontSize(50)
                    .fontWeight(FontWeight.Bold)
                    .onClick {
                        evt =>
                            this.num = getAllNets().size
                    }
                Text("Default net info")
                    .fontSize(50)
                    .fontWeight(FontWeight.Bold)
                    .onClick {
                        evt =>
                            let netHandle = getDefaultNet()
                            if (netHandle.netId != 0) {
                                let caps = getNetCapabilities(netHandle)
                                for (item in caps.bearerTypes) {
                                    match (item) {
                                        case BearerCellular => Hilog.info(0, "cangjie", "BEARER_CELLULAR")
                                        case BearerWifi => Hilog.info(0, "cangjie", "BEARER_WIFI")
                                        case BearerEthernet => Hilog.info(0, "cangjie", "BEARER_ETHERNET")
                                        case _ => Hilog.info(0, "cangjie", "Unknow")
                                    }
                                }
                                for (item in caps.networkCap) {
                                    match (item) {
                                        case NetCap.NetCapabilityMms => Hilog.info(0, "cangjie", "NET_CAPABILITY_MMS")
                                        case NetCap.NetCapabilityNotMetered => Hilog.info(0, "cangjie", "NET_CAPABILITY_NOT_METERED")
                                        case NetCap.NetCapabilityInternet => Hilog.info(0, "cangjie", "NET_CAPABILITY_INTERNET")
                                        case NetCap.NetCapabilityNotVpn => Hilog.info(0, "cangjie", "NET_CAPABILITY_NOT_VPN")
                                        case NetCap.NetCapabilityValidated => Hilog.info(0, "cangjie", "NET_CAPABILITY_VALIDATED")
                                        case _ => Hilog.info(0, "cangjie", "Unknow cap")
                                    }
                                }
                            }
                    }
            }.width(100.percent)
        }.height(100.percent)
    }
}