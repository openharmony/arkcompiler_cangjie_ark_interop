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

package ohos.security.huks

import ohos.labels.*
import ohos.base.BusinessException

/**
 * Defines the param field in the properties array of options used in the APIs.
 *
 * @relation export interface HuksParam
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public class HuksParam {
    /**
     * Tag.
     *
     * @relation tag: HuksTag
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public var tag: HuksTag
    /**
     * Value of the tag.
     *
     * @relation value: boolean | number | bigint | Uint8Array
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public var value: HuksParamValue

    /**
     *HuksParam constructor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public init(tag: HuksTag, value: HuksParamValue) {
        this.tag = tag
        this.value = value
    }
}

type Bytes = Array<UInt8>

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public enum HuksParamValue {
    /**
     * The returned type is Bool.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    BooleanValue(Bool)
    | 
        /**
         * The returned type is Int32.
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    Int32Value(Int32)
    | 
        /**
         * The returned type is UInt32.
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    Uint32Value(UInt32)
    | 
        /**
         * The returned type is UInt64.
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    Uint64Value(UInt64)
    | 
        /**
         * The returned type is Bytes.
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    BytesValue(Bytes)
    | ...

    /**
     * The returned type is Option<Bool>.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public func toBool(): Option<Bool> {
        match (this) {
            case BooleanValue(val) => val
            case _ => None
        }
    }
    /**
     * The returned type is Option<Int32>.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public func toInt32(): Option<Int32> {
        match (this) {
            case Int32Value(val) => val
            case _ => None
        }
    }
    /**
     * The returned type is Option<UInt32>.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public func toUInt32(): Option<UInt32> {
        match (this) {
            case Uint32Value(val) => val
            case _ => None
        }
    }
    /**
     * The returned type is Option<UInt64>.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public func toUInt64(): Option<UInt64> {
        match (this) {
            case Uint64Value(val) => val
            case _ => None
        }
    }
    /**
     * The returned type is Option<Bytes>.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public func toBytes(): Option<Bytes> {
        match (this) {
            case BytesValue(val) => val
            case _ => None
        }
    }
    /**
     * The returned type is HuksParamValue.
     * @throws { BusinessException } 401 - operator '|' only support uint32
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public operator func |(other: HuksParamValue): HuksParamValue {
        match ((this.toUInt32(), other.toUInt32())) {
            case (Some(left), Some(right)) => HuksParamValue.Uint32Value(left | right)
            case _ => throw BusinessException(
                HuksExceptionErrCode.HuksErrCodeIllegalArgument.getValue(),
                "operator '|' only support uint32"
            )
        }
    }
}

/**
 * Defines options used in the APIs.
 *
 * @relation export interface HuksOptions 
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public class HuksOptions {
    /**
     * Properties used to hold the HuksParam array.
     *
     * @relation properties?: Array<HuksParam>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public var properties: Option<Array<HuksParam>>
    /**
     * Input data.
     *
     * @relation inData?: Uint8Array
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public var inData: Option<Bytes>

    /**
     *HuksOptions constructor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public init(properties: Option<Array<HuksParam>>, inData: Option<Bytes>) {
        this.properties = properties
        this.inData = inData
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static let NONE: HuksOptions = HuksOptions(None, None)
}

/**
 * Defines the struct for a HUKS handle.
 *
 * @relation export interface HuksSessionHandle 
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public class HuksSessionHandle {
    /**
     * Value of the handle.
     *
     * @relation handle: number
     */
     @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public var handle: HuksHandle
    /**
     * Challenge obtained after the initSession operation.
     *
     * @relation challenge?: Uint8Array
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public var challenge: Option<Bytes>

    /**
     * HuksOptions constructor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public init(handle: HuksHandle, challenge: Option<Bytes>) {
        this.handle = handle
        this.challenge = challenge
    }
}

/**
 * Interface of huks handle.
 *
 * @relation export interface HuksHandle
 */
@!APILevel[
    21,
    deprecated: 9,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Extension"
]
public class HuksHandle {
    var data: Bytes
    init(data: Bytes){
        this.data = data
    }
}

/**
 * Represents the result returned.
 *
 * @relation export interface HuksHandle
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public class HuksReturnResult {
    /**
     * Output data. Atomic service API: This API can be used in atomic services since API version 11.
     *
     * @relation outData?: Uint8Array
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public var outData: Option<Bytes>
    /**
     * Property information. Atomic service API: This API can be used in atomic services since API version 11.
     *
     * @relation properties?: Array<HuksParam>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public var properties: Option<Array<HuksParam>>
    /**
     * Certificate chain information. Atomic service API: This API can be used in atomic services since API version 12.
     *
     * @relation certChains?: Array<string>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public var certChains: Option<Array<String>>
    
    /**
     * HuksReturnResult constructor
     */
    public init(outData: Option<Bytes>, properties: Option<Array<HuksParam>>, certChains: Option<Array<String>>) {
        this.outData = outData
        this.properties = properties
        this.certChains = certChains
    }
}
