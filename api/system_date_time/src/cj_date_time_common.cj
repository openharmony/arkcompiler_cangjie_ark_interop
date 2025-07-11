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

package ohos.system_date_time

import ohos.ffi.*
import ohos.hilog.*
import ohos.labels.*
import ohos.base.*

/**
 * Indicates time type.
 *
 * @relation enum TimeType
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.Time"
]
public enum TimeType {
    /**
     * Indicates the time elapsed since the system was booted, including deep sleep time.
     *
     * @relation STARTUP
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Time"
    ]
    StartUp
    /**
     * Indicates the time elapsed since the system was booted, including deep sleep time.
     *
     * @relation ACTIVE
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Time"
    ]
    Active
    | ...

    func getValue(): Int32 {
        match (this) {
            case StartUp => 0
            case Active => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
