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

package ohos.values_bucket

import ohos.base.*
import ohos.ffi.*
import ohos.labels.*

/**
 * Indicates possible value types
 * @relation export type ValueType = number | string | boolean;
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.DataShare.Core"
]
public enum ValueType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.DataShare.Core"
    ]
    Null
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.DataShare.Core"
    ]
    Integer(Int64)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.DataShare.Core"
    ]
    Double(Float64)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.DataShare.Core"
    ]
    Str(String)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.DataShare.Core"
    ]
    Boolean(Bool)
    | ...

    protected func get(): Int32 {
        match (this) {
            case Integer(v) => 1
            case Double(v) => 2
            case Str(v) => 3
            case Boolean(v) => 4
            case _ => 0
        }
    }
}

@C
protected struct CValueType {
    var integer: Int64 = 0
    var double: Float64 = 0.0
    var boolean: Bool = false
    var string: CPointer<UInt8> = CPointer<UInt8>()
    var tag: UInt8 = 0

    protected init(value: ValueType) {
        match (value) {
            case Integer(n) =>
                tag = 1
                integer = n
            case Double(n) =>
                tag = 2
                double = n
            case Str(str) =>
                tag = 3
                unsafe { string = LibC.mallocCString(str).getChars() }
            case Boolean(b) =>
                tag = 4
                boolean = b
            case _ => tag = 0
        }
    }

    protected func free() {
        if (this.tag == 3) {
            if (!string.isNull()) {
                unsafe { LibC.free<UInt8>(string) }
            }
            return
        }
    }

    protected func asResource(): CTypeResource<CValueType> {
        return CTypeResource(this, free)
    }
}
