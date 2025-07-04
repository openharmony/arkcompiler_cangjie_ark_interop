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

package ohos.account.appAccount

import std.collection.*
import ohos.ffi.*
import ohos.labels.*

func readArrStr(cArr: CArrString): Array<String> {
    var result = ArrayList<String>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(cArr.head.read(i).toString()) }
        }
    }
    return result.toArray()
}
/*
借鉴 frameworks/common_event_manager/src/utils.cj
 */
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
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Account.AppAccount"
]
public enum AppAccountValueType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    INT(Int32)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    FLOAT64(Float64)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    STRING(String)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    BOOL(Bool)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    FD(Int32)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    ARRSTRING(Array<String>)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    ARRAYI32(Array<Int32>)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    ARRAYI64(Array<Int64>)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    ARRAYBOOL(Array<Bool>)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    ARRAYF64(Array<Float64>)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    ARRAYFD(Array<Int32>)
    | ...
}

struct Parameters {
    Parameters(
        let _key: String,
        let _value: AppAccountValueType
    ) {}

    init(c: CParameters) {
        this._key = c.key.toString()
        this._value = unsafe {
            match {
                case c.valueType == INT_TYPE => INT(CPointer<Int32>(c.value).read())
                case c.valueType == F64_TYPE => FLOAT64(CPointer<Float64>(c.value).read())
                case c.valueType == STRING_TYPE => STRING(CString(CPointer<UInt8>(c.value)).toString())
                case c.valueType == BOOL_TYPE => BOOL(CPointer<Bool>(c.value).read())
                case c.valueType == FD_TYPE => FD(CPointer<Int32>(c.value).read())
                case c.valueType == ARRSTRING_TYPE => ARRSTRING(c.toArrString())
                case c.valueType == ARRAYI32_TYPE => ARRAYI32(c.toArr<Int32>())
                case c.valueType == ARRAYI64_TYPE => ARRAYI64(c.toArr<Int64>())
                case c.valueType == ARRAYBOOL_TYPE => ARRAYBOOL(c.toArr<Bool>())
                case c.valueType == ARRAYF64_TYPE => ARRAYF64(c.toArr<Float64>())
                case _ => ARRAYFD(c.toArr<Int32>())
            }
        }
    }

    prop key: String {
        get() {
            return _key
        }
    }

    prop value: AppAccountValueType {
        get() {
            return _value
        }
    }
}

struct VCOResource <: Resource {
    let value: CVerifyCredentialOptions
    let isFree: Box<Bool> = Box(false)

    init(value: CVerifyCredentialOptions) {
        this.value = value
    }

    public func isClosed(): Bool {
        return isFree.value
    }

    public func close(): Unit {
        if (isFree.value) {
            return
        }
        value.free()
        isFree.value = true
    }
}

struct SPOResource <: Resource {
    let value: CSetPropertiesOptions
    let isFree: Box<Bool> = Box(false)

    init(value: CSetPropertiesOptions) {
        this.value = value
    }

    public func isClosed(): Bool {
        return isFree.value
    }

    public func close(): Unit {
        if (isFree.value) {
            return
        }
        value.free()
        isFree.value = true
    }
}
