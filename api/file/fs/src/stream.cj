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

import ohos.hilog.*
import ohos.ffi.*
import ohos.base.*
import ohos.labels.*

/**
 * Provides API for stream operations. Before calling any API of Stream,
 * you need to create a Stream instance by using createStream or fdopenStream.
 *
 * @relation declare interface Stream
 */
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
     * Close stream.
     *
     * @throws { BusinessException } 13900004 - Interrupted system call
     * @throws { BusinessException } 13900005 - I/O error
     * @throws { BusinessException } 13900008 - Bad file descriptor
     * @throws { BusinessException } 13900025 - No space left on device
     * @throws { BusinessException } 13900041 - Quota exceeded
     * @throws { BusinessException } 13900042 - Unknown error
     * @relation closeSync(): void
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
     * Flushes this stream.
     *
     * @throws { BusinessException } 13900001 - Operation not permitted
     * @throws { BusinessException } 13900004 - Interrupted system call
     * @throws { BusinessException } 13900005 - I/O error
     * @throws { BusinessException } 13900008 - Bad file descriptor
     * @throws { BusinessException } 13900010 - Try again
     * @throws { BusinessException } 13900013 - Bad address
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 13900024 - File too large
     * @throws { BusinessException } 13900025 - No space left on device
     * @throws { BusinessException } 13900034 - Operation would block
     * @throws { BusinessException } 13900041 - Quota exceeded
     * @throws { BusinessException } 13900042 - Unknown error
     * @relation flushSync(): void
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
     * Writes data to this stream.
     *
     * @throws { BusinessException } 13900001 - Operation not permitted
     * @throws { BusinessException } 13900004 - Interrupted system call
     * @throws { BusinessException } 13900005 - I/O error
     * @throws { BusinessException } 13900008 - Bad file descriptor
     * @throws { BusinessException } 13900010 - Try again
     * @throws { BusinessException } 13900013 - Bad address
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 13900024 - File too large
     * @throws { BusinessException } 13900025 - No space left on device
     * @throws { BusinessException } 13900034 - Operation would block
     * @throws { BusinessException } 13900041 - Quota exceeded
     * @throws { BusinessException } 13900042 - Unknown error
     * @relation writeSync(buffer: ArrayBuffer | string, options?: WriteOptions): number
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

    /**
     * Writes data to this stream.
     *
     * @throws { BusinessException } 13900001 - Operation not permitted
     * @throws { BusinessException } 13900004 - Interrupted system call
     * @throws { BusinessException } 13900005 - I/O error
     * @throws { BusinessException } 13900008 - Bad file descriptor
     * @throws { BusinessException } 13900010 - Try again
     * @throws { BusinessException } 13900013 - Bad address
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 13900024 - File too large
     * @throws { BusinessException } 13900025 - No space left on device
     * @throws { BusinessException } 13900034 - Operation would block
     * @throws { BusinessException } 13900041 - Quota exceeded
     * @throws { BusinessException } 13900042 - Unknown error
     * @relation writeSync(buffer: ArrayBuffer | string, options?: WriteOptions): number
     */
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
     * Reads data from this stream.
     *
     * @throws { BusinessException } 13900004 - Interrupted system call
     * @throws { BusinessException } 13900005 - I/O error
     * @throws { BusinessException } 13900008 - Bad file descriptor
     * @throws { BusinessException } 13900010 - Try again
     * @throws { BusinessException } 13900013 - Bad address
     * @throws { BusinessException } 13900019 - Is a directory
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 13900034 - Operation would block
     * @throws { BusinessException } 13900042 - Unknown error
     * @throws { BusinessException } 13900044 - Network is unreachable
     * @relation readSync(buffer: ArrayBuffer, options?: ReadOptions): number
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
