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

package ohos.file.fs

import ohos.ffi.*
import ohos.base.*
import ohos.labels.*

/**
 * File object.
 *
 * @relation declare interface File
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class File <: RemoteDataLite {
    init(instanceId: Int64) {
        super(instanceId)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * FD of the file.
     *
     * @relation readonly fd: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public prop fd: Int32 {
        get() {
            unsafe { FfiOHOSFILEFsGetFD(getID()) }
        }
    }

    /**
     * Path of the file.
     *
     * @relation readonly path: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public prop path: String {
        get() {
            let cStr = unsafe { FfiOHOSFILEFsGetPath(getID()) }
            let ret = cStr.toString()
            unsafe { LibC.free(cStr) }
            return ret
        }
    }

    /**
     * Name of the file.
     *
     * @relation readonly name: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public prop name: String {
        get() {
            let cStr = unsafe { FfiOHOSFILEFsGetName(getID()) }
            let ret = cStr.toString()
            unsafe { LibC.free(cStr) }
            return ret
        }
    }

    /**
     * Applies an exclusive lock or a shared lock on this file in non-blocking mode.
     *
     * @throws { BusinessException } 13900004 - Interrupted system call
     * @throws { BusinessException } 13900008 - Bad file descriptor
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 13900034 - Operation would block
     * @throws { BusinessException } 13900042 - Unknown error
     * @throws { BusinessException } 13900043 - No record locks available
     * @relation tryLock(exclusive?: boolean): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func tryLock(exclusive!: Bool = false): Unit {
        let code = unsafe { FfiOHOSFILEFsTryLock(getID(), exclusive) }
        if (code != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(code))
            throw BusinessException(code, getErrorInfo(code))
        }
    }

    /**
     * Unlocks a file.
     *
     * @throws { BusinessException } 13900004 - Interrupted system call
     * @throws { BusinessException } 13900008 - Bad file descriptor
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 13900034 - Operation would block
     * @throws { BusinessException } 13900042 - Unknown error
     * @throws { BusinessException } 13900043 - No record locks available
     * @relation unlock(): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func unlock(): Unit {
        let code = unsafe { FfiOHOSFILEFsUnLock(getID()) }
        if (code != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(code))
            throw BusinessException(code, getErrorInfo(code))
        }
    }

    /**
     * Obtains the parent directory of this file object.
     *
     * @throws { BusinessException } 13900005 - I/O error
     * @throws { BusinessException } 13900042 - Unknown error
     * @throws { BusinessException } 14300002 - Invalid URI
     * @relation getParent(): string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func getParent(): String {
        let ret: RetDataCString
        unsafe {
            ret = FfiOHOSFILEFsGetParent(getID())
        }
        if (ret.code != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(ret.code))
            throw BusinessException(ret.code, getErrorInfo(ret.code))
        }
        let parent = ret.data.toString()
        unsafe {
            LibC.free(ret.data)
        }
        return parent
    }
}
