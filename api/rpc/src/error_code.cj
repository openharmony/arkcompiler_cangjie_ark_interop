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

import std.deriving.*
import ohos.labels.*
import ohos.ffi.*

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.IPC.Core"
]
public class ErrorCode {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const CHECK_PARAM_ERROR: Int32 = 401
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const OS_MMAP_ERROR: Int32 = 1900001
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const OS_IOCTL_ERROR: Int32 = 1900002
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const WRITE_TO_ASHMEM_ERROR: Int32 = 1900003
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const READ_FROM_ASHMEM_ERROR: Int32 = 1900004
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const ONLY_PROXY_OBJECT_PERMITTED_ERROR: Int32 = 1900005
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const ONLY_REMOTE_OBJECT_PERMITTED_ERROR: Int32 = 1900006
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const COMMUNICATION_ERROR: Int32 = 1900007
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const PROXY_OR_REMOTE_OBJECT_INVALID_ERROR: Int32 = 1900008
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR: Int32 = 1900009
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR: Int32 = 1900010
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const PARCEL_MEMORY_ALLOC_ERROR: Int32 = 1900011
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const CALL_JS_METHOD_ERROR: Int32 = 1900012
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const OS_DUP_ERROR: Int32 = 1900013
}

@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.IPC.Core"
]
public enum TypeCode {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    INT8_ARRAY
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    UINT8_ARRAY
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    INT16_ARRAY
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    UINT16_ARRAY
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    INT32_ARRAY
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    UINT32_ARRAY
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    FLOAT32_ARRAY
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    FLOAT64_ARRAY
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    BIGINT64_ARRAY
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    BIGUINT64_ARRAY
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case INT8_ARRAY => 0
                case UINT8_ARRAY => 1
                case INT16_ARRAY => 2
                case UINT16_ARRAY => 3
                case INT32_ARRAY => 4
                case UINT32_ARRAY => 5
                case FLOAT32_ARRAY => 6
                case FLOAT64_ARRAY => 7
                case BIGINT64_ARRAY => 8
                case BIGUINT64_ARRAY => 9
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}
