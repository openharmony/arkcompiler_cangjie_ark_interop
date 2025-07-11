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

package ohos.common_event_manager

import ohos.base.*
import ohos.labels.*

const UNDEFINED_USER: Int32 = -3
const INT_TYPE: Int8 = 0
const F64_TYPE: Int8 = 1
const STRING_TYPE: Int8 = 2
const BOOL_TYPE: Int8 = 3
const FD_TYPE: Int8 = 4
const ARRSTRING_TYPE: Int8 = 5
const ARRAYI32_TYPE: Int8 = 6
const ARRAYI64_TYPE: Int8 = 7
const ARRAYBOOL_TYPE: Int8 = 8
const ARRAYF64_TYPE: Int8 = 9
const ARRAYFD_TYPE: Int8 = 10

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.CommonEvent"
]
public enum ValueType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    Int32Value(Int32)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    Float64Value(Float64)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    StringValue(String)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    BoolValue(Bool)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    FD(Int32)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    ArrayString(Array<String>)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    ArrayInt32(Array<Int32>)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    ArrayInt64(Array<Int64>)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    ArrayBool(Array<Bool>)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    ArrayFloat64(Array<Float64>)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    ArrayFD(Array<Int32>)
    | ...
}

struct Parameters {
    Parameters(
        let _key: String,
        let _value: ValueType
    ) {}

    init(c: CParameters) {
        this._key = c.key.toString()
        this._value = unsafe {
            match {
                case c.valueType == INT_TYPE => Int32Value(CPointer<Int32>(c.value).read())
                case c.valueType == F64_TYPE => Float64Value(CPointer<Float64>(c.value).read())
                case c.valueType == STRING_TYPE => StringValue(CString(CPointer<UInt8>(c.value)).toString())
                case c.valueType == BOOL_TYPE => BoolValue(CPointer<Bool>(c.value).read())
                case c.valueType == FD_TYPE => FD(CPointer<Int32>(c.value).read())
                case c.valueType == ARRSTRING_TYPE => ArrayString(c.toArrString())
                case c.valueType == ARRAYI32_TYPE => ArrayInt32(c.toArr<Int32>())
                case c.valueType == ARRAYI64_TYPE => ArrayInt64(c.toArr<Int64>())
                case c.valueType == ARRAYBOOL_TYPE => ArrayBool(c.toArr<Bool>())
                case c.valueType == ARRAYF64_TYPE => ArrayFloat64(c.toArr<Float64>())
                case _ => ArrayFD(c.toArr<Int32>())
            }
        }
    }

    prop key: String {
        get() {
            return _key
        }
    }

    prop value: ValueType {
        get() {
            return _value
        }
    }
}
