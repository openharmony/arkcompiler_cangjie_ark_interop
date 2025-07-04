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

@C
struct CProgress {
    CProgress(
        var processedSize: UInt64,
        var totalSize: UInt64
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public struct Progress {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public let processedSize: UInt64
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public let totalSize: UInt64

    init(cProgress: CProgress) {
        this.processedSize = cProgress.processedSize
        this.totalSize = cProgress.totalSize
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class ProgressListener <: Callback1Argument<Progress> {
    let callback_: (Progress) -> Unit
    let callbackObj: BaseCallBack
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public init(callback: (Progress) -> Unit) {
        callback_ = callback
        let wrapper = {
            cProgress: CProgress =>
            let val = Progress(cProgress)
            callback(val)
        }
        callbackObj = Callback1Param<CProgress, Unit>(wrapper)
    }
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func invoke(val: Progress): Unit {
        callback_(val)
    }
    func getWapperId(): Int64 {
        return callbackObj.getID()
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class TaskSignal <: RemoteDataLite {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public init() {
        super(unsafe { FfiOHOSFileFsCreateTaskSignal() })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func cancel(): Unit {
        unsafe { FfiOHOSFileFsTaskSignalCancel(getID()) }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class CopyOptions <: RemoteDataLite {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public init(progressListener: ProgressListener, copySignal: TaskSignal) {
        super(unsafe { FfiOHOSFileFsCreateCopyOptions(progressListener.getWapperId(), copySignal.getID()) })
        this.progressListener_ = progressListener
        this.copySignal_ = copySignal
    }
    ~init() {
        releaseFFIData(myDataId)
    }
    var progressListener_: ProgressListener
    var copySignal_: TaskSignal

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public prop progressListener: ProgressListener {
        get() {
            progressListener_
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public prop copySignal: TaskSignal {
        get() {
            copySignal_
        }
    }
}
