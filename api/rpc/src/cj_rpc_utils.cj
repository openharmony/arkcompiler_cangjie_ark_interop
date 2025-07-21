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
import ohos.base.BusinessException

let ERR_CODE_MAP = HashMap<Int32, String>(
    [
        (ErrorCode.CheckParamError.value, "Parameter error."),
        (ErrorCode.OsMmapError.value, "Call mmap function failed."),
        (ErrorCode.OsIoctlError.value, "Call os ioctl function failed."),
        (ErrorCode.WriteToAshmemError.value, "Write to ashmem failed."),
        (ErrorCode.ReadFromAshmemError.value, "Read from ashmem failed."),
        (ErrorCode.OnlyProxyObjectPermittedError.value, "Only proxy object permitted."),
        (ErrorCode.OnlyRemoteObjectPermittedError.value, "Only remote object permitted."),
        (ErrorCode.CommunicationError.value, "Communication failed."),
        (ErrorCode.ProxyOrRemoteObjectInvalidError.value, "Proxy or remote object is invalid."),
        (ErrorCode.WriteDataToMessageSequenceError.value, "Write data to message sequence failed."),
        (ErrorCode.ReadDataFromMessageSequenceError.value, "Read data from message sequence failed."),
        (ErrorCode.ParcelMemoryAllocError.value, "Sequence memory alloc failed."),
        (ErrorCode.CallCjMethodError.value, "Call CJ callback function failed."),
        (ErrorCode.OsDupError.value, "Call os dup function failed.")
    ]
)

func checkRet(errCode: Int32): Unit {
    if (errCode != 0) {
        let msg = ERR_CODE_MAP[errCode]
        throw BusinessException(errCode, msg)
    }
}
