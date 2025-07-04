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

package ohos.pasteboard

import ohos.labels.*
import ohos.ffi.*
import ohos.base.*

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.Pasteboard"
]
public enum ShareOption {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    INAPP
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    LOCALDEVICE
    | @!APILevel[
        12,
        atomicservice: true,
        deprecated: 12,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    CROSSDEVICE
    | ...

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public func getValue(): Int32 {
        match (this) {
            case INAPP => 0
            case LOCALDEVICE => 1
            case CROSSDEVICE => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32) {
        match (val) {
            case 0 => INAPP
            case 1 => LOCALDEVICE
            case 2 => CROSSDEVICE
            case _ => throw IllegalArgumentException("Unknown value ${val}")
        }
    }
}
