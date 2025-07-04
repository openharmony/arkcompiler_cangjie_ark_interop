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

import std.collection.HashMap
import ohos.ffi.*
import ohos.base.BusinessException

let ERR_CODE_MAP = HashMap<Int32, String>(
    [
        (ErrorCode.CHECK_PARAM_ERROR, "Parameter error."),
        (ErrorCode.OS_MMAP_ERROR, "Call mmap function failed."),
        (ErrorCode.OS_IOCTL_ERROR, "Call os ioctl function failed."),
        (ErrorCode.WRITE_TO_ASHMEM_ERROR, "Write to ashmem failed."),
        (ErrorCode.READ_FROM_ASHMEM_ERROR, "Read from ashmem failed."),
        (ErrorCode.ONLY_PROXY_OBJECT_PERMITTED_ERROR, "Only proxy object permitted."),
        (ErrorCode.ONLY_REMOTE_OBJECT_PERMITTED_ERROR, "Only remote object permitted."),
        (ErrorCode.COMMUNICATION_ERROR, "Communication failed."),
        (ErrorCode.PROXY_OR_REMOTE_OBJECT_INVALID_ERROR, "Proxy or remote object is invalid."),
        (ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR, "Write data to message sequence failed."),
        (ErrorCode.READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR, "Read data from message sequence failed."),
        (ErrorCode.PARCEL_MEMORY_ALLOC_ERROR, "Sequence memory alloc failed."),
        (ErrorCode.CALL_JS_METHOD_ERROR, "Call JS callback function failed."),
        (ErrorCode.OS_DUP_ERROR, "Call os dup function failed.")
    ]
)

func checkRet(errCode: Int32): Unit {
    if (errCode != 0) {
        let msg = ERR_CODE_MAP[errCode]
        throw BusinessException(errCode, msg)
    }
}
