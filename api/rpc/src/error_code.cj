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

package ohos.rpc

import ohos.labels.*

import std.deriving.Derive

/**
 * The error code of rpc.
 *
 * @relation enum ErrorCode
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.IPC.Core"
]
public enum ErrorCode {
    /**
     * Parameter error.
     *
     * @relation CHECK_PARAM_ERROR = 401
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    CheckParamError
    |
    /**
     * Failed to call mmap.
     *
     * @relation OS_MMAP_ERROR = 1900001
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    OsMmapError
    |
    /**
     * Failed to call ioctl.
     *
     * @relation OS_IOCTL_ERROR = 1900002
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    OsIoctlError
    |
    /**
     * Failed to write data to the shared memory.
     *
     * @relation WRITE_TO_ASHMEM_ERROR = 1900003
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    WriteToAshmemError
    |
    /**
     * Failed to read data from the shared memory.
     *
     * @relation READ_FROM_ASHMEM_ERROR = 1900004
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    ReadFromAshmemError
    |
    /**
     * Operation allowed only for the proxy object.
     *
     * @relation ONLY_PROXY_OBJECT_PERMITTED_ERROR = 1900005
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    OnlyProxyObjectPermittedError
    |
    /**
     * Operation allowed only for the remote object.
     *
     * @relation ONLY_REMOTE_OBJECT_PERMITTED_ERROR = 1900006
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    OnlyRemoteObjectPermittedError
    |
    /**
     * Communication failed.
     *
     * @relation COMMUNICATION_ERROR = 1900007
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    CommunicationError
    |
    /**
     * The proxy or remote object is invalid.
     *
     * @relation PROXY_OR_REMOTE_OBJECT_INVALID_ERROR = 1900008
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    ProxyOrRemoteObjectInvalidError
    |
    /**
     * Failed to write data to the message sequence. 
     *
     * @relation WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR = 1900009
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    WriteDataToMessageSequenceError
    |
    /**
     * Failed to read data from the message sequence.
     *
     * @relation READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR = 1900010
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    ReadDataFromMessageSequenceError
    |
    /**
     * Memory allocation failed.
     *
     * @relation PARCEL_MEMORY_ALLOC_ERROR = 1900011
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    ParcelMemoryAllocError
    |
    /**
     * Call cj method failed
     *
     * @relation CALL_JS_METHOD_ERROR = 1900012
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    CallCjMethodError
    |
    /**
     * Os dup function failed.
     *
     * @relation OS_DUP_ERROR = 1900013
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    OsDupError

    prop value: Int32 {
        get() {
            match (this) {
                case CheckParamError => 401
                case OsMmapError => 1900001
                case OsIoctlError => 1900002
                case WriteToAshmemError => 1900003
                case ReadFromAshmemError => 1900004
                case OnlyProxyObjectPermittedError => 1900005
                case OnlyRemoteObjectPermittedError => 1900006
                case CommunicationError => 1900008
                case ProxyOrRemoteObjectInvalidError => 1900009
                case WriteDataToMessageSequenceError => 1900010
                case ReadDataFromMessageSequenceError => 1900011
                case ParcelMemoryAllocError => 1900012
                case CallCjMethodError => 1900013
                case OsDupError => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}

/**
 * Enumerates the types of the Array.
 *
 * @relation enum TypeCode
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.IPC.Core"
]
public enum TypeCode {
    /**
     * Int8Array
     *
     * @relation INT8_ARRAY = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    Int8Array
    |
    /**
     * Uint8Array
     *
     * @relation UINT8_ARRAY = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    Uint8Array
    |
    /**
     * Int16Array
     *
     * @relation INT16_ARRAY = 2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    Int16Array
    |
    /**
     * Uint16Array
     *
     * @relation UINT16_ARRAY = 3
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    Uint16Array
    |
    /**
     * Int32Array
     *
     * @relation INT32_ARRAY = 4
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    Int32Array
    |
    /**
     * Uint32Array
     *
     * @relation UINT32_ARRAY = 5
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    Uint32Array
    |
    /**
     * Float32Array
     *
     * @relation FLOAT32_ARRAY = 6
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    Float32Array
    |
    /**
     * Float64Array
     *
     * @relation FLOAT64_ARRAY = 7
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    Float64Array
    |
    /**
     * BigInt64Array
     *
     * @relation BIGINT64_ARRAY = 8
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    BigInt64Array
    |
    /**
     * BigUint64Array
     *
     * @relation BIGUINT64_ARRAY = 9
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    BigUint64Array
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case Int8Array => 0
                case Uint8Array => 1
                case Int16Array => 2
                case Uint16Array => 3
                case Int32Array => 4
                case Uint32Array => 5
                case Float32Array => 6
                case Float64Array => 7
                case BigInt64Array => 8
                case BigUint64Array => 9
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}
