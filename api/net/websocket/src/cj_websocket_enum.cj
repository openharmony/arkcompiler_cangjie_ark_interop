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

package ohos.net.webSocket

import std.deriving.*
import ohos.labels.*
import ohos.base.*
import ohos.ffi.*
import std.collection.*

/**
 * HTTP proxy configuration.
 * SYSTEM: means that use system proxy configuration.
 * NO_PROXY: means do not use proxy.
 * object of @type {connection.WebSocketHttpProxy} means providing custom proxy settings
 * @enum { 'SYSTEM' | 'NO_PROXY' | HTTPPROXY }
 * @syscap SystemCapability.Communication.NetStack
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public enum ProxyConfiguration {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NO_PROXY
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    SYSTEM
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    HTTPPROXY(WebSocketHttpProxy)
    | ...
}

/**
 * HTTP response headers.
 * @typedef { object }
 * @syscap SystemCapability.Communication.NetStack
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public enum ResponseHeaders {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    MAP_DATA(HashMap<String, String>)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    ARRAY_STRING_DATA(Array<String>)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    UNDEFINED_DATA
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func toString(): String {
        match (this) {
            case MAP_DATA(map) => map.toString()
            case ARRAY_STRING_DATA(arr) => "${arr}"
            case UNDEFINED_DATA => ""
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

enum ResponseHeadersType {
    MAP
    | ARRAY_STRING
    | UNDEFINED

    func getValue(): Int32 {
        match (this) {
            case MAP => 0
            case ARRAY_STRING => 1
            case UNDEFINED => 2
        }
    }

    static func parse(val: Int32): ResponseHeadersType {
        return if (val == 0) {
            MAP
        } else if (val == 1) {
            ARRAY_STRING
        } else {
            UNDEFINED
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public enum OnOffType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    OPEN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    MESSAGE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    CLOSE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    ERROR
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    DATAEND
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    HEADERRECEIVE
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case OPEN => 1
                case MESSAGE => 2
                case CLOSE => 3
                case ERROR => 4
                case DATAEND => 5
                case HEADERRECEIVE => 6
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(val: Int32) {
        match (val) {
            case 1 => OPEN
            case 2 => MESSAGE
            case 3 => CLOSE
            case 4 => ERROR
            case 5 => DATAEND
            case 6 => HEADERRECEIVE
            case _ => throw IllegalArgumentException("OsAccountType: unknown value ${val}")
        }
    }
}

enum MessageDataType {
    STRING
    | ARRAY_BUFFER

    func getValue(): Int32 {
        match (this) {
            case STRING => 0
            case ARRAY_BUFFER => 1
        }
    }

    static func parse(val: Int32): MessageDataType {
        return if (val == 0) {
            STRING
        } else {
            ARRAY_BUFFER
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public enum MessageData <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    STRING_DATA(String)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    ARRAY_DATA(Array<Byte>)
    | ...

    func getData(): Array<UInt8> {
        match (this) {
            case STRING_DATA(str) => unsafe { str.rawData() }
            case ARRAY_DATA(arr) => arr
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    func getCData(): CArrUI8 {
        let data = getData()
        unsafe { CArrUI8(cjArr2CArr<UInt8, UInt8>(data, {i => i}), data.size) }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func toString(): String {
        match (this) {
            case STRING_DATA(str) => str
            case ARRAY_DATA(arr) => "${arr}"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
