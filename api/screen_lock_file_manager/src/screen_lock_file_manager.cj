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

package ohos.screen_lock_file_manager

import ohos.ffi.*
import ohos.hilog.*
import ohos.base.*
import std.deriving.*
import ohos.labels.*

foreign {
    func FfiOHOSScreenLockFileManagerAcquireAccess(): Int32

    func FfiOHOSScreenLockFileManagerReleaseAccess(): Int32
}

let SCREEN_LOCK_FILE_MGR_LOG = HilogChannel(0, 0xD005A08, "CJ-ScreenLockFileManager")

@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.ScreenLockFileManager"
]
public enum AccessStatus {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.ScreenLockFileManager"
    ]
    ACCESS_DENIED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.ScreenLockFileManager"
    ]
    ACCESS_GRANTED
    | ...

    static func parse(val: Int32): AccessStatus {
        match (val) {
            case 0 => ACCESS_GRANTED
            case -1 => ACCESS_DENIED
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.ScreenLockFileManager"
]
public enum ReleaseStatus {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.ScreenLockFileManager"
    ]
    RELEASE_DENIED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.ScreenLockFileManager"
    ]
    RELEASE_GRANTED
    | ...

    static func parse(val: Int32): ReleaseStatus {
        match (val) {
            case 0 => RELEASE_GRANTED
            case -1 => RELEASE_DENIED
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.ScreenLockFileManager"
]
public class ScreenLockFileManager {
    /**
     * Acquire the access of the caller data under the lock screen.
     *
     * @returns { AccessStatus } Returns acquire the access result.
     * @throws { BusinessException } 801 - The specified SystemCapability name was not found.
     * @throws { BusinessException } 29300002 - The system ability work abnormally.
     * @throws { BusinessException } 29300003 - The application is not enabled the data protection under lock screen.
     * @throws { BusinessException } 29300004 - File access is denied.
     * @syscap SystemCapability.Security.ScreenLockFileManager
     *
     * @bref acquireAccess(): AccessStatus
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.ScreenLockFileManager"
    ]
    public static func acquireAccess(): AccessStatus {
        unsafe {
            let ret = FfiOHOSScreenLockFileManagerAcquireAccess()
            if (ret != SUCCESS_CODE) {
                SCREEN_LOCK_FILE_MGR_LOG.error("acquireAccess error: ${ret}")
                throw BusinessException(ret, getErrorInfo(ret))
            }
            return AccessStatus.parse(ret)
        }
    }

    /**
     * Release the access of the caller data and do not allow data access under the lock screen.
     *
     * @returns { ReleaseStatus } Returns release the access result.
     * @throws { BusinessException } 801 - The specified SystemCapability name was not found.
     * @throws { BusinessException } 29300002 - The system ability work abnormally.
     * @throws { BusinessException } 29300003 - The application is not enabled the data protection under lock screen.
     * @throws { BusinessException } 29300005 - File access was not acquired.
     * @syscap SystemCapability.Security.ScreenLockFileManager
     *
     * @bref releaseAccess(): ReleaseStatus
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.ScreenLockFileManager"
    ]
    public static func releaseAccess(): ReleaseStatus {
        unsafe {
            let ret = FfiOHOSScreenLockFileManagerReleaseAccess()
            if (ret != SUCCESS_CODE) {
                SCREEN_LOCK_FILE_MGR_LOG.error("releaseAccess error: ${ret}")
                throw BusinessException(ret, getErrorInfo(ret))
            }
            return ReleaseStatus.parse(ret)
        }
    }
}
