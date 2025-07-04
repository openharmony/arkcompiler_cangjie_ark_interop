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

import ohos.labels.*

/**
 * Enumeration of different types of access mode.
 *
 * @relation declare enum AccessModeType
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public enum AccessModeType {
    /**
     * Check if the file exists.
     *
     * @relation EXIST = 0
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    EXIST
    /**
     * Check if the file has write permission.
     *
     * @relation WRITE = 2
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    WRITE
    /**
     * Check if the file has read permission.
     *
     * @relation READ = 4
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    READ
    /**
     * Check if the file has read and write permission.
     *
     * @relation READ_WRITE = 6
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    READ_AND_WRITE
    | ...

    func getValue(): Int32 {
        match (this) {
            case EXIST => 0
            case WRITE => 2
            case READ => 4
            case READ_AND_WRITE => 6
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

const DEFAULT_FLAG: Int32 = -1

/**
 * Enumeration of different types of access flag.
 *
 * @relation declare enum AccessFlagType
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public enum AccessFlagType {
    /**
     * Check if the file is on the local.
     *
     * @relation LOCAL = 0
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    LOCAL | ...

    func getValue(): Int32 {
        match (this) {
            case LOCAL => 0
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumeration of different types of file location.
 *
 * @relation declare enum LocationType
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public enum LocationType {
    /**
     * Local file.
     *
     * @relation LOCAL = 1 << 0
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    LOCAL
    /**
     * Cloud file.
     *
     * @relation CLOUD = 1 << 1
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    CLOUD
    | ...

    static func parse(value: Int32): LocationType {
        match (value) {
            case 1 => LOCAL
            case 2 => CLOUD
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
