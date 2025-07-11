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

package ohos.file_fs

import ohos.base.*
import ohos.labels.*
import std.collection.*

const FILEIO_DOMAIN_ID = 0xD004388u32
const FILEIO_INVALID_ARGUMENT = 13900020i32
const INVALID_ARGS_CODE: Int32 = 13900020
let ERROR_CODE_MAP: HashMap<Int32, String> = HashMap<Int32, String>(
    (13900001, "Operation not permitted"),
    (13900002, "No such file or directory"),
    (13900003, "No such process"),
    (13900004, "Interrupted system call"),
    (13900005, "I/O error"),
    (13900006, "No such device or address"),
    (13900007, "Arg list too long"),
    (13900008, "Bad file descriptor"),
    (13900009, "No child processes"),
    (13900010, "Try again"),
    (13900011, "Out of memory"),
    (13900012, "Permission denied"),
    (13900013, "Bad address"),
    (13900014, "Device or resource busy"),
    (13900015, "File exists"),
    (13900016, "Cross-device link"),
    (13900017, "No such device"),
    (13900018, "Not a directory"),
    (13900019, "Is a directory"),
    (13900020, "Invalid argument"),
    (13900021, "File table overflow"),
    (13900022, "Too many open files"),
    (13900023, "Text file busy"),
    (13900024, "File too large"),
    (13900025, "No space left on device"),
    (13900026, "Illegal seek"),
    (13900027, "Read-only file system"),
    (13900028, "Too many links"),
    (13900029, "Resource deadlock would occur"),
    (13900030, "Filename too Long"),
    (13900031, "Function not implemented"),
    (13900032, "Directory not empty"),
    (13900033, "Too many symbolic links encountered"),
    (13900034, "Operation would block"),
    (13900035, "Invalid request descriptor"),
    (13900036, "Device not a stream"),
    (13900037, "No data available"),
    (13900038, "Value too large for defined data type"),
    (13900039, "File descriptor in bad state"),
    (13900040, "Interrupted system call should be restarted"),
    (13900041, "Quota exceeded"),
    (13900042, "Unknown error")
)

func getErrorInfo(code: Int32): String {
    if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error"
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class ConflictFileException <: BusinessException {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public let data: Array<ConflictFiles>
    init(code: Int32, msg: String, data: Array<ConflictFiles>) {
        super(code, msg)
        this.data = data
    }
}
