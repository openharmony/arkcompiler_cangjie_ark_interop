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

package ohos.battery_info

foreign {
    func FfiBatteryInfoBatterySOC(): Int32

    func FfiBatteryInfoGetChargingState(): Int32

    func FfiBatteryInfoGetHealthState(): Int32

    func FfiBatteryInfoGetPluggedType(): Int32

    func FfiBatteryInfoGetVoltage(): Int32

    func FfiBatteryInfoGetBatteryNowCurrent(): Int32

    func FfiBatteryInfoGetTechnology(): CString

    func FfiBatteryInfoGetBatteryTemperature(): Int32

    func FfiBatteryInfoGetBatteryPresent(): Bool

    func FfiBatteryInfoGetCapacityLevel(): Int32
}
