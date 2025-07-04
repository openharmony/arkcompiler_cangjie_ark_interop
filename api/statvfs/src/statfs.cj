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

package ohos.file_statvfs

import ohos.ffi.*
import ohos.base.*
import ohos.labels.*
import ohos.hilog.*

let FS_LOG = HilogChannel(0, FILEIO_DOMAIN_ID, "CJ-statvfs")

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class Statfs {

    /**
     * Get the number of free bytes on the specified path with sync interface.
     *
     * @param { String } path - path
     * @returns { Int64 } return the number of free bytes on the specified path
     * @throws { BusinessError } 13900002 - No such file or directory
     * @throws { BusinessError } 13900004 - Interrupted system call
     * @throws { BusinessError } 13900005 - I/O error
     * @throws { BusinessError } 13900008 - Bad file descriptor
     * @throws { BusinessError } 13900011 - Out of memory
     * @throws { BusinessError } 13900012 - Permission denied
     * @throws { BusinessError } 13900013 - Bad address
     * @throws { BusinessError } 13900018 - Not a directory
     * @throws { BusinessError } 13900030 - File name too long
     * @throws { BusinessError } 13900031 - Function not implemented
     * @throws { BusinessError } 13900033 - Too many symbolic links encountered
     * @throws { BusinessError } 13900038 - Value too large for defined data type
     * @throws { BusinessError } 13900042 - Unknown error
     * @syscap SystemCapability.FileManagement.File.FileIO
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func getFreeSize(path: String): Int64 {
        var ret: RetDataI64 = RetDataI64(0, 0)
        unsafe {
            try (pathCString = LibC.mallocCString(path).asResource()) {
                ret = FfiOHOSStatvfsGetFreeSize(pathCString.value)
            }
        }
        if (ret.code != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(ret.code))
            throw BusinessException(ret.code, getErrorInfo(ret.code))
        }
        return ret.data
    }

    /**
     * Get the number of total bytes on the specified path with sync interface.
     *
     * @param { String } path - path
     * @returns { Int64 } return the number of total bytes
     * @throws { BusinessError } 13900002 - No such file or directory
     * @throws { BusinessError } 13900004 - Interrupted system call
     * @throws { BusinessError } 13900005 - I/O error
     * @throws { BusinessError } 13900008 - Bad file descriptor
     * @throws { BusinessError } 13900011 - Out of memory
     * @throws { BusinessError } 13900012 - Permission denied
     * @throws { BusinessError } 13900013 - Bad address
     * @throws { BusinessError } 13900018 - Not a directory
     * @throws { BusinessError } 13900030 - File name too long
     * @throws { BusinessError } 13900031 - Function not implemented
     * @throws { BusinessError } 13900033 - Too many symbolic links encountered
     * @throws { BusinessError } 13900038 - Value too large for defined data type
     * @throws { BusinessError } 13900042 - Unknown error
     * @syscap SystemCapability.FileManagement.File.FileIO
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func getTotalSize(path: String): Int64 {
        var ret: RetDataI64 = RetDataI64(0, 0)
        unsafe {
            try (pathCString = LibC.mallocCString(path).asResource()) {
                ret = FfiOHOSStatvfsGetTotalSize(pathCString.value)
            }
        }
        if (ret.code != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(ret.code))
            throw BusinessException(ret.code, getErrorInfo(ret.code))
        }
        return ret.data
    }
}
