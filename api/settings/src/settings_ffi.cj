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

package ohos.settings

import ohos.base.*
import ohos.ffi.*

type StageContext = CPointer<Unit>

foreign {
    func FfiSettingsSetValue(context: StageContext, name: CString, value: CString, domainName: CString,
        ret: CPointer<Int32>): Bool

    func FfiSettingsGetValue(context: StageContext, name: CString, value: CString, domainName: CString,
        ret: CPointer<Int32>): CString

    func FfiSettingsRegisterKeyObserver(context: StageContext, name: CString, domainName: CString, observer: Int64): Bool

    func FfiSettingsUnregisterKeyObserver(context: StageContext, name: CString, domainName: CString): Bool

    func FfiSettingsEnableAirplaneMode(enable: Bool, ret: CPointer<Int32>): Unit

    func FfiSettingsCanShowFloating(ret: CPointer<Int32>): Bool

    func FfiSettingsGetUriSync(name: CString, domainName: CString): CString
}
