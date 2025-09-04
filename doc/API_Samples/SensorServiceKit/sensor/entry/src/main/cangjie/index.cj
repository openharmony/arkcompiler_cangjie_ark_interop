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

import kit.SensorServiceKit.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.business_exception.*
import ohos.callback_invoke.*

class TestCallback <: Callback1Argument<AccelerometerResponse> {
    let lambda_: (AccelerometerResponse)->Unit
    public init(lambda: (AccelerometerResponse)->Unit) {
        lambda_ = lambda
    }
    public func invoke(e: ?BusinessException, data: AccelerometerResponse): Unit {
        lambda_(data)
    }
}

@Entry
@Component
class EntryView {
    @State
    var num = 0

    func build() {
        Row {
            Column {
                Button("Sensor info")
                    .onClick {
                        evt =>
                            try {
                                let sensors = getSensorList()
                                for (item in sensors) {
                                    Hilog.info(0, "cangjie", "sensorName: ${item.sensorName}, vendorName: ${item.vendorName},\n" +
                                        "firmwareVersion: ${item.firmwareVersion}, hardwareVersion: ${item.hardwareVersion},\n" +
                                        "sensorId: ${item.sensorId}, minSamplePeriod: ${item.minSamplePeriod},\n" +
                                        "maxSamplePeriod: ${item.maxSamplePeriod}")
                                }
                            } catch (e: BusinessException) {
                                Hilog.info(0, "cangjie", "Failed to get sensor list. Code: ${e.code}, message: ${e.message}")
                            }
                    }
                Button("registe")
                    .onClick {
                        evt =>
                            let callback = TestCallback({arg => Hilog.info(0, "cangjie", "Succeeded in getting SensorCallback arg: x: ${arg.x}, y: ${arg.y}, z: ${arg.z}")})
                            try {
                                on(SensorId.Accelerometer, callback, option: Options(interval: SensorNumber(100000000)))
                            } catch (e: BusinessException) {
                                Hilog.info(0, "cangjie", "Sensor on error code: ${e.code}, message: ${e.message}")
                            }
                    }
                Button("once")
                    .onClick {
                        evt =>
                            let callback = TestCallback({arg => Hilog.info(0, "cangjie", "Succeeded in getting SensorCallback arg: x: ${arg.x}, y: ${arg.y}, z: ${arg.z}")})
                            try {
                                once(SensorId.Accelerometer, callback)
                            } catch (e: BusinessException) {
                                Hilog.info(0, "cangjie", "Sensor once error code: ${e.code}, message: ${e.message}")
                            }
                    }
                Button("unregiste")
                    .onClick {
                        evt =>
                            try {
                                off(SensorId.Accelerometer)
                            } catch (e: BusinessException) {
                                Hilog.info(0, "cangjie", "Sensor off error code: ${e.code}, message: ${e.message}")
                            }
                    }
            }.width(100.percent)
        }.height(100.percent)
    }
}