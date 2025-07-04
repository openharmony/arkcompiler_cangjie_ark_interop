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
import ohos.base.*
import ohos.labels.*

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class WatchEventListener <: Callback1Argument<WatchEvent> {
    let callback_: (WatchEvent) -> Unit
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public init(callback: (WatchEvent) -> Unit) {
        callback_ = callback
    }
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func invoke(val: WatchEvent): Unit {
        callback_(val)
    }
}

@C
struct CWatchEvent {
    private CWatchEvent(
        let fileName: CString,
        let event: UInt32,
        let cookie: UInt32
    ) {}

    func free(): Unit {
        unsafe { LibC.free(fileName) }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class WatchEvent {
    WatchEvent(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.File.FileIO"
        ]
        public let fileName: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.File.FileIO"
        ]
        public let event: UInt32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.File.FileIO"
        ]
        public let cookie: UInt32
    ) {}

    init(cWatchEvent: CWatchEvent) {
        this.fileName = cWatchEvent.fileName.toString()
        this.event = cWatchEvent.event
        this.cookie = cWatchEvent.cookie
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class Watcher <: RemoteDataLite {
    init(instanceId: Int64) {
        super(instanceId)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func start(): Unit {
        let code = unsafe { FfiOHOSFileFsWatcherStart(getID()) }
        if (code != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(code))
            throw BusinessException(code, getErrorInfo(code))
        }
        return
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func stop(): Unit {
        let code = unsafe { FfiOHOSFileFsWatcherStop(getID()) }
        if (code != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(code))
            throw BusinessException(code, getErrorInfo(code))
        }
        return
    }
}
