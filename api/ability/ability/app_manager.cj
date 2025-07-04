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

package ohos.ability

import ohos.labels.*

foreign {
    func FfiAppMgrIsRunningInStabilityTest(code: CPointer<Int32>): Bool

    func FfiAppMgrIsRamConstrainedDevice(code: CPointer<Int32>): Bool

    func FfiAppMgrGetAppMemorySize(code: CPointer<Int32>): Int32

    func FfiAppMgrGetRunningProcessInformation(code: CPointer<Int32>): CArrProcessInformation
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public func isRunningInStabilityTest(): Bool {
    var code: Int32 = 0
    unsafe {
        let res = FfiAppMgrIsRunningInStabilityTest(inout code)
        throwIfNotSuccess(code)
        return res
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public func isRamConstrainedDevice(): Bool {
    var code: Int32 = 0
    unsafe {
        let res = FfiAppMgrIsRamConstrainedDevice(inout code)
        throwIfNotSuccess(code)
        return res
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public func getAppMemorySize(): Int32 {
    var code: Int32 = 0
    unsafe {
        let res = FfiAppMgrGetAppMemorySize(inout code)
        throwIfNotSuccess(code)
        return res
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public func getRunningProcessInformation(): Array<ProcessInformation> {
    var code: Int32 = 0
    unsafe {
        let res = FfiAppMgrGetRunningProcessInformation(inout code)
        throwIfNotSuccess(code)
        let processInformations = res.toArrProcessInformation()
        res.free()
        return processInformations
    }
}
