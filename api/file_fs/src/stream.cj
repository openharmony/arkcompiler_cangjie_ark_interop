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

import ohos.hilog.*
import ohos.ffi.*
import ohos.base.*
import ohos.labels.*

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class Stream <: RemoteDataLite {
    init(instanceId: Int64) {
        super(instanceId)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     *  @brief closeSync(file: number | File): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func close(): Unit {
        let code = unsafe { FfiOHOSStreamClose(getID()) }
        match {
            case code != SUCCESS_CODE =>
                FS_LOG.error(getErrorInfo(code))
                throw BusinessException(code, getErrorInfo(code))
            case _ => return
        }
    }

    /**
     *  @brief flushSync(): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func flush(): Unit {
        let code = unsafe { FfiOHOSStreamFlush(getID()) }
        if (code != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(code))
            throw BusinessException(code, getErrorInfo(code))
        }
        return
    }

    /**
     *  @brief writeSync(fd: number, buffer: ArrayBuffer | string,
     *                   options?: { offset?: number; length?: number; encoding?: string; }): number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func write(buffer: String, options!: WriteOptions = WriteOptions()): Int64 {
        let length = options.length ?? UIntNative(buffer.size)
        if (length > UIntNative(buffer.size)) {
            throw BusinessException(INVALID_ARGS_CODE, "Invalid argument")
        }
        let encoding = options.encoding
        var writeBytes = 0
        unsafe {
            try (
                cString = LibC.mallocCString(buffer).asResource(),
                encodingCString = LibC.mallocCString(encoding).asResource()
            ) {
                let cValue = if (options.offset.isNone()) {
                    FfiOHOSStreamWriteCur(getID(), cString.value.getChars(), Int64(length), encodingCString.value)
                } else {
                    FfiOHOSStreamWrite(getID(), cString.value.getChars(), Int64(length), options.offset.getOrThrow(),
                        encodingCString.value)
                }
                if (cValue.code != SUCCESS_CODE) {
                    Hilog.error(0xD003900, "File-Fs", getErrorInfo(cValue.code))
                    throw BusinessException(cValue.code, getErrorInfo(cValue.code))
                }
                writeBytes = cValue.data
            }
        }
        return writeBytes
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func write(buffer: Array<Byte>, options!: WriteOptions = WriteOptions()): Int64 {
        let length = options.length ?? UIntNative(buffer.size)
        if (length > UIntNative(buffer.size)) {
            throw BusinessException(INVALID_ARGS_CODE, "Invalid argument")
        }
        let encoding = options.encoding
        var writeBytes = 0
        unsafe {
            try (encodingCString = LibC.mallocCString(encoding).asResource()) {
                let data = acquireArrayRawData(buffer)
                let cValue = if (options.offset.isNone()) {
                    FfiOHOSStreamWriteCur(getID(), data.pointer, Int64(length), encodingCString.value)
                } else {
                    FfiOHOSStreamWrite(getID(), data.pointer, Int64(length), options.offset.getOrThrow(),
                        encodingCString.value)
                }
                releaseArrayRawData(data)
                if (cValue.code != SUCCESS_CODE) {
                    Hilog.error(0xD003900, "File-Fs", getErrorInfo(cValue.code))
                    throw BusinessException(cValue.code, getErrorInfo(cValue.code))
                }
                writeBytes = cValue.data
            }
        }
        return writeBytes
    }

    /**
     *  @brief readSync(buffer: ArrayBuffer, options?: { offset?: number; length?: number; }): number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func read(arrayBuffer: Array<Byte>, options!: ReadOptions = ReadOptions()): Int64 {
        if (arrayBuffer.size == 0) {
            return 0
        }
        unsafe {
            let buffer = safeMalloc<UInt8>(count: arrayBuffer.size)
            let length = options.length ?? UIntNative(arrayBuffer.size)

            let cValue = if (options.offset.isNone()) {
                FfiOHOSStreamReadCur(getID(), buffer, arrayBuffer.size, Int64(length))
            } else {
                FfiOHOSStreamRead(getID(), buffer, arrayBuffer.size, Int64(length), options.offset.getOrThrow())
            }
            for (i in 0..cValue.data) {
                arrayBuffer[i] = buffer.read(i)
            }
            LibC.free(buffer)
            if (cValue.code != SUCCESS_CODE) {
                Hilog.error(0xD003900, "File-Fs", getErrorInfo(cValue.code))
                throw BusinessException(cValue.code, getErrorInfo(cValue.code))
            }
            return cValue.data
        }
    }
}
