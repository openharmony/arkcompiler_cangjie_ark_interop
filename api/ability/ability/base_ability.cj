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

import ohos.ffi.*
import std.collection.*
import ohos.labels.*

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
abstract sealed class BaseAbility <: FFIData {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func onConfigurationUpdate(newConfig: AbilityConfiguration): Unit {}
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func onMemoryLevel(level: MemoryLevel): Unit {}

    private static let CREATORS = HashMap<String, () -> BaseAbility>()

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public static func registerCreator(name: String, creator: () -> BaseAbility): Unit {
        let optCreator = CREATORS.get(name)
        match (optCreator) {
            case None =>
                CREATORS.add(name, creator)
                ABILITY_LOG.info("Register creator of " + name + " successfully.")
            case Some(creatorFunc) => ABILITY_LOG.error(
                "Repeated registration for Ability in " + name + ", please check.")
        }
    }

    static func create(name: String): Option<BaseAbility> {
        let optCreator = CREATORS.get(name)
        match (optCreator) {
            case None =>
                ABILITY_LOG.error("No such create functions for BaseAbility: " + name)
                Option<BaseAbility>.None
            case Some(creator) => creator()
        }
    }
}
