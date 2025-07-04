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

package ohos.thermal

import ohos.base.*
import ohos.ffi.*
import ohos.labels.*

const NO_CALLBACK_FUNC = 0i64

/**
 * Obtains the current thermal level.
 *
 * @relation function getLevel(): ThermalLevel
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.ThermalManager"
]
public func getLevel(): ThermalLevel {
    let ret = unsafe { FfiOHOSThermalGetLevel() }
    return ThermalLevel.parse(ret)
}

/**
 * Registers to callbacks of thermal level changes.
 *
 * @relation function registerThermalLevelCallback(callback: Callback<ThermalLevel>): void
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.ThermalManager"
]
public func registerThermalLevelCallback(callback: Callback1Argument<ThermalLevel>): Unit {
    let wrapper = {
        ctype: Int32 => callback.invoke(ThermalLevel.parse(ctype))
    }

    let registerCall = Callback1Param<Int32, Unit>(wrapper)
    unsafe { FfiOHOSRegisterThermalLevelCallback(registerCall.getID()) }
}

/**
 * Unregisters from the callbacks of thermal level changes.
 *
 * @relation function unregisterThermalLevelCallback(callback?: Callback<void>): void
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.ThermalManager"
]
public func unregisterThermalLevelCallback(callback!: ?Callback0Argument = None): Unit {
    if (let Some(cb) <- callback) {
        let wrapper = {=> cb.invoke()}
        let registerCall = Callback0Param<Unit>(wrapper)
        unsafe { FfiOHOSUnregisterThermalLevelCallback(registerCall.getID()) }
    } else {
        unsafe { FfiOHOSUnregisterThermalLevelCallback(NO_CALLBACK_FUNC) }
    }
}
