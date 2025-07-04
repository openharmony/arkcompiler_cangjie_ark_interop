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

package ohos.asset_store

import ohos.base.BusinessException
import std.collection.*
import ohos.labels.*

type Bytes = Array<UInt8>

/**
 * An enumeration containing tag-value pairs that describe the attributes of an Asset.
 *
 * @syscap SystemCapability.Security.Asset
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Asset"
]
public enum AssetParam {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    SECRET(Bytes)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    ALIAS(Bytes)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    ACCESSIBILITY(UInt32)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    REQUIRE_PASSWORD_SET(Bool)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    AUTH_TYPE(UInt32)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    AUTH_VALIDITY_PERIOD(UInt32)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    AUTH_CHALLENGE(Bytes)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    AUTH_TOKEN(Bytes)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    SYNC_TYPE(UInt32)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    IS_PERSISTENT(Bool)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    CONFLICT_RESOLUTION(UInt32)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    DATA_LABEL_CRITICAL_1(Bytes)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    DATA_LABEL_CRITICAL_2(Bytes)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    DATA_LABEL_CRITICAL_3(Bytes)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    DATA_LABEL_CRITICAL_4(Bytes)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    DATA_LABEL_NORMAL_1(Bytes)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    DATA_LABEL_NORMAL_2(Bytes)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    DATA_LABEL_NORMAL_3(Bytes)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    DATA_LABEL_NORMAL_4(Bytes)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    DATA_LABEL_NORMAL_LOCAL_1(Bytes)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    DATA_LABEL_NORMAL_LOCAL_2(Bytes)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    DATA_LABEL_NORMAL_LOCAL_3(Bytes)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    DATA_LABEL_NORMAL_LOCAL_4(Bytes)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    RETURN_TYPE(UInt32)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    RETURN_LIMIT(UInt32)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    RETURN_OFFSET(UInt32)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    RETURN_ORDERED_BY(UInt32)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    UPDATE_TIME(Bytes)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    OPERATION_TYPE(UInt32)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    CJ_UNKNOWN_TYPE
    | ...

    /**
     * Return the tag of an attribute.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public func getTag(): UInt32 {
        match (this) {
            case SECRET(_) => AssetTag.SECRET
            case ALIAS(_) => AssetTag.ALIAS
            case ACCESSIBILITY(_) => AssetTag.ACCESSIBILITY
            case REQUIRE_PASSWORD_SET(_) => AssetTag.REQUIRE_PASSWORD_SET
            case AUTH_TYPE(_) => AssetTag.AUTH_TYPE
            case AUTH_VALIDITY_PERIOD(_) => AssetTag.AUTH_VALIDITY_PERIOD
            case AUTH_CHALLENGE(_) => AssetTag.AUTH_CHALLENGE
            case AUTH_TOKEN(_) => AssetTag.AUTH_TOKEN
            case SYNC_TYPE(_) => AssetTag.SYNC_TYPE
            case IS_PERSISTENT(_) => AssetTag.IS_PERSISTENT
            case CONFLICT_RESOLUTION(_) => AssetTag.CONFLICT_RESOLUTION
            case DATA_LABEL_CRITICAL_1(_) => AssetTag.DATA_LABEL_CRITICAL_1
            case DATA_LABEL_CRITICAL_2(_) => AssetTag.DATA_LABEL_CRITICAL_2
            case DATA_LABEL_CRITICAL_3(_) => AssetTag.DATA_LABEL_CRITICAL_3
            case DATA_LABEL_CRITICAL_4(_) => AssetTag.DATA_LABEL_CRITICAL_4
            case DATA_LABEL_NORMAL_1(_) => AssetTag.DATA_LABEL_NORMAL_1
            case DATA_LABEL_NORMAL_2(_) => AssetTag.DATA_LABEL_NORMAL_2
            case DATA_LABEL_NORMAL_3(_) => AssetTag.DATA_LABEL_NORMAL_3
            case DATA_LABEL_NORMAL_4(_) => AssetTag.DATA_LABEL_NORMAL_4
            case DATA_LABEL_NORMAL_LOCAL_1(_) => AssetTag.DATA_LABEL_NORMAL_LOCAL_1
            case DATA_LABEL_NORMAL_LOCAL_2(_) => AssetTag.DATA_LABEL_NORMAL_LOCAL_2
            case DATA_LABEL_NORMAL_LOCAL_3(_) => AssetTag.DATA_LABEL_NORMAL_LOCAL_3
            case DATA_LABEL_NORMAL_LOCAL_4(_) => AssetTag.DATA_LABEL_NORMAL_LOCAL_4
            case RETURN_TYPE(_) => AssetTag.RETURN_TYPE
            case RETURN_LIMIT(_) => AssetTag.RETURN_LIMIT
            case RETURN_OFFSET(_) => AssetTag.RETURN_OFFSET
            case RETURN_ORDERED_BY(_) => AssetTag.RETURN_ORDERED_BY
            case UPDATE_TIME(_) => AssetTag.UPDATE_TIME
            case OPERATION_TYPE(_) => AssetTag.OPERATION_TYPE
            case CJ_UNKNOWN_TYPE => 0
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    func getValue(): AssetBlob {
        match (this) {
            case SECRET(val) => AssetBlob(val)
            case ALIAS(val) => AssetBlob(val)
            case ACCESSIBILITY(val) => AssetBlob(val)
            case REQUIRE_PASSWORD_SET(val) => AssetBlob(val)
            case AUTH_TYPE(val) => AssetBlob(val)
            case AUTH_VALIDITY_PERIOD(val) => AssetBlob(val)
            case AUTH_CHALLENGE(val) => AssetBlob(val)
            case AUTH_TOKEN(val) => AssetBlob(val)
            case SYNC_TYPE(val) => AssetBlob(val)
            case IS_PERSISTENT(val) => AssetBlob(val)
            case CONFLICT_RESOLUTION(val) => AssetBlob(val)
            case DATA_LABEL_CRITICAL_1(val) => AssetBlob(val)
            case DATA_LABEL_CRITICAL_2(val) => AssetBlob(val)
            case DATA_LABEL_CRITICAL_3(val) => AssetBlob(val)
            case DATA_LABEL_CRITICAL_4(val) => AssetBlob(val)
            case DATA_LABEL_NORMAL_1(val) => AssetBlob(val)
            case DATA_LABEL_NORMAL_2(val) => AssetBlob(val)
            case DATA_LABEL_NORMAL_3(val) => AssetBlob(val)
            case DATA_LABEL_NORMAL_4(val) => AssetBlob(val)
            case DATA_LABEL_NORMAL_LOCAL_1(val) => AssetBlob(val)
            case DATA_LABEL_NORMAL_LOCAL_2(val) => AssetBlob(val)
            case DATA_LABEL_NORMAL_LOCAL_3(val) => AssetBlob(val)
            case DATA_LABEL_NORMAL_LOCAL_4(val) => AssetBlob(val)
            case RETURN_TYPE(val) => AssetBlob(val)
            case RETURN_LIMIT(val) => AssetBlob(val)
            case RETURN_OFFSET(val) => AssetBlob(val)
            case RETURN_ORDERED_BY(val) => AssetBlob(val)
            case UPDATE_TIME(val) => AssetBlob(val)
            case OPERATION_TYPE(val) => AssetBlob(val)
            case CJ_UNKNOWN_TYPE => throw BusinessException(ErrorCode.INVALID_ARGUMENT,
                "Cannot convert CJ_UNKNOWN_TYPE to AssetBlob")
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func fromAttr(attr: AssetAttr): AssetParam {
        return parse(attr.tag, attr.value)
    }

    static func parse(tag: UInt32, blob: AssetBlob): AssetParam {
        match (tag) {
            case 0x30000001 => AssetParam.SECRET(blob.toBytes())
            case 0x30000002 => AssetParam.ALIAS(blob.toBytes())
            case 0x20000003 => AssetParam.ACCESSIBILITY(blob.toUInt32())
            case 0x10000004 => AssetParam.REQUIRE_PASSWORD_SET(blob.toBool())
            case 0x20000005 => AssetParam.AUTH_TYPE(blob.toUInt32())
            case 0x20000006 => AssetParam.AUTH_VALIDITY_PERIOD(blob.toUInt32())
            case 0x30000007 => AssetParam.AUTH_CHALLENGE(blob.toBytes())
            case 0x30000008 => AssetParam.AUTH_TOKEN(blob.toBytes())
            case 0x20000010 => AssetParam.SYNC_TYPE(blob.toUInt32())
            case 0x10000011 => AssetParam.IS_PERSISTENT(blob.toBool())
            case 0x30000020 => AssetParam.DATA_LABEL_CRITICAL_1(blob.toBytes())
            case 0x30000021 => AssetParam.DATA_LABEL_CRITICAL_2(blob.toBytes())
            case 0x30000022 => AssetParam.DATA_LABEL_CRITICAL_3(blob.toBytes())
            case 0x30000023 => AssetParam.DATA_LABEL_CRITICAL_4(blob.toBytes())
            case 0x30000030 => AssetParam.DATA_LABEL_NORMAL_1(blob.toBytes())
            case 0x30000031 => AssetParam.DATA_LABEL_NORMAL_2(blob.toBytes())
            case 0x30000032 => AssetParam.DATA_LABEL_NORMAL_3(blob.toBytes())
            case 0x30000033 => AssetParam.DATA_LABEL_NORMAL_4(blob.toBytes())
            case 0x30000034 => AssetParam.DATA_LABEL_NORMAL_LOCAL_1(blob.toBytes())
            case 0x30000035 => AssetParam.DATA_LABEL_NORMAL_LOCAL_2(blob.toBytes())
            case 0x30000036 => AssetParam.DATA_LABEL_NORMAL_LOCAL_3(blob.toBytes())
            case 0x30000037 => AssetParam.DATA_LABEL_NORMAL_LOCAL_4(blob.toBytes())
            case 0x20000040 => AssetParam.RETURN_TYPE(blob.toUInt32())
            case 0x20000041 => AssetParam.RETURN_LIMIT(blob.toUInt32())
            case 0x30000042 => AssetParam.RETURN_OFFSET(blob.toUInt32())
            case 0x20000043 => AssetParam.RETURN_ORDERED_BY(blob.toUInt32())
            case 0x20000044 => AssetParam.CONFLICT_RESOLUTION(blob.toUInt32())
            case 0x30000045 => AssetParam.UPDATE_TIME(blob.toBytes())
            case 0x20000046 => AssetParam.OPERATION_TYPE(blob.toUInt32())
            case _ => AssetParam.CJ_UNKNOWN_TYPE
        }
    }
}
