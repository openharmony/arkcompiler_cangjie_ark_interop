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

import ohos.ffi.*
import ohos.labels.*

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class Stat <: RemoteDataLite {
    init(instanceId: Int64) {
        super(instanceId)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public prop ino: Int64 {
        get() {
            unsafe { Int64(FfiOHOSStatGetIno(getID())) }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public prop mode: Int64 {
        get() {
            unsafe { Int64(FfiOHOSStatGetMode(getID())) }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public prop uid: Int64 {
        get() {
            unsafe { Int64(FfiOHOSStatGetUid(getID())) }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public prop gid: Int64 {
        get() {
            unsafe { Int64(FfiOHOSStatGetGid(getID())) }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public prop size: Int64 {
        get() {
            unsafe { Int64(FfiOHOSStatGetSize(getID())) }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public prop atime: Int64 {
        get() {
            unsafe { Int64(FfiOHOSStatGetAtime(getID())) }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public prop mtime: Int64 {
        get() {
            unsafe { Int64(FfiOHOSStatGetMtime(getID())) }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public prop ctime: Int64 {
        get() {
            unsafe { Int64(FfiOHOSStatGetCtime(getID())) }
        }
    }

    /**
     *  @brief isBlockDevice(): boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func isBlockDevice(): Bool {
        unsafe { FfiOHOSStatIsBlockDevice(getID()) }
    }

    /**
     *  @brief isCharacterDevice(): boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func isCharacterDevice(): Bool {
        unsafe { FfiOHOSStatIsCharacterDevice(getID()) }
    }

    /**
     *  @brief isDirectory(): boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func isDirectory(): Bool {
        unsafe { FfiOHOSStatIsDirectory(getID()) }
    }

    /**
     *  @brief isFIFO(): boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func isFIFO(): Bool {
        unsafe { FfiOHOSStatIsFIFO(getID()) }
    }

    /**
     *  @brief isFile(): boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func isFile(): Bool {
        unsafe { FfiOHOSStatIsFile(getID()) }
    }

    /**
     *  @brief isSocket(): boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func isSocket(): Bool {
        unsafe { FfiOHOSStatIsSocket(getID()) }
    }

    /**
     *  @brief isSymbolicLink(): boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func isSymbolicLink(): Bool {
        unsafe { FfiOHOSStatIsSymbolicLink(getID()) }
    }
}
