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

import ohos.ffi.RemoteDataWithIdManager
import ohos.labels.APILevel

foreign {
    func FfiInsightIntentGetContext(executor: CJInsightIntentExecutorHandle, id: CPointer<Int64>): Int32

    func FfiInsightIntentContextStartAbility(id: Int64, wantHandle: WantHandle): Int32
}

/**
 * The context of insight intent executor.
 *
 * @relation export default class InsightIntentContext
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class InsightIntentContext <: RemoteDataWithIdManager {
    init(id: Int64) {
        super(id)
    }

    /**
     * Starts a new ability.
     * This interface only allows you to start abilities within the same bundle and specify the bundleName.
     * This interface only allows called in UIAbility insight intent execute mode.
     *
     * @throws { BusinessException } 16000001 - The specified ability does not exist.
     * @throws { BusinessException } 16000004 - Failed to start the invisible ability.
     * @throws { BusinessException } 16000005 - The specified process does not have the permission.
     * @throws { BusinessException } 16000006 - Cross-user operations are not allowed.
     * @throws { BusinessException } 16000008 - The crowdtesting application expires.
     * @throws { BusinessException } 16000009 - An ability cannot be started or stopped in Wukong mode.
     * @throws { BusinessException } 16000011 - The context does not exist.
     * @throws { BusinessException } 16000012 - The application is controlled.
     * @throws { BusinessException } 16000013 - The application is controlled by EDM.
     * @throws { BusinessException } 16000050 - Internal error.
     * @throws { BusinessException } 16000053 - The ability is not on the top of the UI.
     * @throws { BusinessException } 16000055 - Installation-free timed out.
     * @throws { BusinessException } 16000061 - Operation not supported.
     * @throws { BusinessException } 16200001 - The caller has been released.
     * @syscap SystemCapability.Ability.AbilityRuntime.Core
     * @relation startAbility(want: Want, callback: AsyncCallback<void>): void;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func startAbility(want: Want): Unit {
        let wantHandle = want.createWantHandle()
        let errorCode = unsafe { FfiInsightIntentContextStartAbility(this.getID(), wantHandle) }
        unsafe { Want.releaseWantHandle(wantHandle) }
        checkCodeAndThrow(errorCode)
    }
}
