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

package ohos.security_huks

import ohos.labels.*
import ohos.base.BusinessException

/**
 * Interface of huks param.
 *
 * @typedef HuksParam
 * @syscap SystemCapability.Security.Huks.Core
 */
@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public class HuksParam {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public HuksParam(
        @!APILevel[
            15,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.Huks.Core"
        ]
        public let tag: HuksTag,
        @!APILevel[
            15,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.Huks.Core"
        ]
        public let value: HuksParamValue
    ) {}
}

type Bytes = Array<UInt8>

@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public enum HuksParamValue {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    boolean(Bool)
    | @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    int32(Int32)
    | @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    uint32(UInt32)
    | @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    uint64(UInt64)
    | @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    bytes(Bytes)
    | ...

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public func toBool(): Option<Bool> {
        match (this) {
            case boolean(val) => val
            case _ => None
        }
    }
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public func toInt32(): Option<Int32> {
        match (this) {
            case int32(val) => val
            case _ => None
        }
    }
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public func toUInt32(): Option<UInt32> {
        match (this) {
            case uint32(val) => val
            case _ => None
        }
    }
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public func toUInt64(): Option<UInt64> {
        match (this) {
            case uint64(val) => val
            case _ => None
        }
    }
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public func toBytes(): Option<Bytes> {
        match (this) {
            case bytes(val) => val
            case _ => None
        }
    }
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public operator func |(other: HuksParamValue): HuksParamValue {
        match ((this.toUInt32(), other.toUInt32())) {
            case (Some(left), Some(right)) => HuksParamValue.uint32(left | right)
            case _ => throw BusinessException(
                HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
                "operator '|' only support uint32"
            )
        }
    }
}

/**
 * Interface of huks option.
 *
 * @typedef HuksOptions
 * @syscap SystemCapability.Security.Huks.Core
 */
@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public class HuksOptions {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public HuksOptions(
        @!APILevel[
            15,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.Huks.Core"
        ]
        public var properties: Option<Array<HuksParam>>,
        @!APILevel[
            15,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.Huks.Core"
        ]
        public var inData: Option<Bytes>
    ) {}
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public static let NONE: HuksOptions = HuksOptions(None, None)
}

/**
 * Interface of huks handle.
 *
 * @typedef HuksSessionHandle
 * @syscap SystemCapability.Security.Huks.Core
 */
@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public class HuksSessionHandle {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public HuksSessionHandle(
        @!APILevel[
            15,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.Huks.Core"
        ]
        public let handle: HuksHandle,
        @!APILevel[
            15,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.Huks.Core"
        ]
        public let challenge: Option<Bytes>
    ) {}
}

@!APILevel[
    15,
    deprecated: 9,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Extension"
]
public class HuksHandle {
    HuksHandle(let data: Bytes) {}
}

/**
 * Interface of huks result.
 *
 * @typedef HuksReturnResult
 * @syscap SystemCapability.Security.Huks.Core
 */
@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public class HuksReturnResult {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Huks.Core"
    ]
    public HuksReturnResult(
        @!APILevel[
            15,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.Huks.Core"
        ]
        public let outData: Option<Bytes>,
        @!APILevel[
            15,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.Huks.Core"
        ]
        public let properties: Option<Array<HuksParam>>,
        @!APILevel[
            15,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.Huks.Core"
        ]
        public let certChains: Option<Array<String>>
    ) {}
}
