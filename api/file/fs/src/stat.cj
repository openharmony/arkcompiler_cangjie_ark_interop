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
import ohos.labels.*

/**
 * Represents detailed file information. Before calling any API of the Stat() class,
 * use stat() to create a Stat instance.
 *
 * @relation declare interface Stat
 */
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

    /**
     * File identifier, which varies with files on the same device.
     *
     * @relation readonly ino: bigint
     */
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

    /**
     * File permissions. The meaning of each bit is as follows:
     * The following values are in octal format. The return values are in decimal format. You need to convert the values.
     * 0o400: The user has the read permission on a regular file or a directory entry.
     * 0o200: The user has the permission to write a regular file or create and delete a directory entry.
     * 0o100: The user has the permission to execute a regular file or search for the specified path in a directory.
     * 0o040: The user group has the read permission on a regular file or a directory entry.
     * 0o020: The user group has the permission to write a regular file or create and delete a directory entry.
     * 0o010: The user group has the permission to execute a regular file or search for the specified path in a directory.
     * 0o004: Other users have the permission to read a regular file or read a directory entry.
     * 0o002: Other users have the permission to write a regular file or create and delete a directory entry.
     * 0o001: Other users have the permission to execute a regular file or search for the specified path in a directory.
     *
     * @relation readonly mode: number
     */
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

    /**
     * ID of the file owner.
     *
     * @relation readonly uid: number
     */
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

    /**
     * ID of the user group of the file.
     *
     * @relation readonly gid: number
     */
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

    /**
     * File size, in bytes. This parameter is valid only for regular files.
     *
     * @relation readonly size: number
     */
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

    /**
     * Time when the file was last accessed. The value is the number of seconds elapsed since 00:00:00 on January 1, 1970.
     * NOTE: Currently, user data partitions are mounted in noatime mode by default, and atime update is disabled.
     *
     * @relation readonly atime: number
     */
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

    /**
     * Time when the file content was last modified. The value is the number of seconds elapsed
     * since 00:00:00 on January 1, 1970.
     *
     * @relation readonly mtime: number
     */
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

    /**
     * Time when the file metadata was last modified. The value is the number of seconds elapsed
     * since 00:00:00 on January 1, 1970.
     *
     * @relation readonly ctime: number
     */
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
     * Checks whether this file is a block special file. A block special file supports access by block only, and it is cached when accessed.
     *
     * @relation isBlockDevice(): boolean
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
     * Checks whether this file is a character special file. A character special device supports random access, and it is not cached when accessed.
     *
     * @relation isCharacterDevice(): boolean
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
     * Checks whether this file is a directory.
     *
     * @relation isDirectory(): boolean
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
     * Checks whether this file is a named pipe (or FIFO). Named pipes are used for inter-process communication.
     *
     * @relation isFIFO(): boolean
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
     * Checks whether this file is a regular file.
     *
     * @relation isFile(): boolean
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
     * Checks whether this file is a socket.
     *
     * @relation isSocket(): boolean
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
     * Checks whether this file is a symbolic link.
     *
     * @relation isSymbolicLink(): boolean
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
