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

protected package ohos.app.ability

import ohos.ffi.*
import ohos.labels.*

class BaseContextImpl {}

/**
 * The base context for Stage Mode.
 *
 * @relation export default abstract class BaseContext
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public open class BaseContext <: RemoteData {
    private let impl_: BaseContextImpl = BaseContextImpl()

    /**
    * Indicates the context is Stage Mode.
    *
    * @relation stageMode: boolean
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public let stageMode: Bool = true

    init(id: Int64) {
        super(id)
    }
}
