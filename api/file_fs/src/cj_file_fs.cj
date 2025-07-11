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
import ohos.hilog.*
import ohos.base.*
import ohos.labels.*

let FS_LOG = HilogChannel(0, FILEIO_DOMAIN_ID, "CJ-fs")

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public enum OpenMode {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    ReadOnly
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    WriteOnly
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    ReadWrite
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    Create
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    Trunc
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    Append
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    NonBlock
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    Dir
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    NoFollow
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    Sync
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public prop mode: Int64 {
        get() {
            match (this) {
                case ReadOnly => 0o0
                case WriteOnly => 0o1
                case ReadWrite => 0o2
                case Create => 0o100
                case Trunc => 0o1000
                case Append => 0o2000
                case NonBlock => 0o4000
                case Dir => 0o200000
                case NoFollow => 0o400000
                case Sync => 0o4010000
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class Options {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var encoding: String

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public init(
        encoding!: String = "utf-8"
    ) {
        this.encoding = encoding
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class ReaderIterator <: RemoteDataLite {
    init(instanceId: Int64) {
        super(instanceId)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func next(): ReaderIteratorResult {
        let cValue = unsafe { FfiOHOSFileFsReaderIteratorNext(getID()) }
        if (cValue.code != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(cValue.code))
            throw BusinessException(cValue.code, getErrorInfo(cValue.code))
        }
        let str = cValue.value.toString()
        unsafe { LibC.free(cValue.value) }
        return ReaderIteratorResult(cValue.done, str)
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class ReaderIteratorResult {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var done: Bool
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var value: String

    init(
        done: Bool,
        value: String
    ) {
        this.done = done
        this.value = value
    }
}

@C
struct RetReaderIteratorResult {
    private RetReaderIteratorResult(
        let code: Int32,
        let done: Bool,
        let value: CString
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class WriteOptions {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var length: Option<UIntNative>
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var offset: Option<Int64>
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var encoding: String

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public init(
        length!: Option<UIntNative> = None,
        offset!: Option<Int64> = None,
        encoding!: String = "utf-8"
    ) {
        this.length = length
        this.offset = offset
        this.encoding = encoding
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class ReadOptions {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var offset: Option<Int64>
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var length: Option<UIntNative>
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]

    public init(
        offset!: Option<Int64> = None,
        length!: Option<UIntNative> = None
    ) {
        this.offset = offset
        this.length = length
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class ReadTextOptions {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var offset: Int64
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var length: Option<Int64>
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var encoding: String

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public init(
        offset!: Int64 = 0,
        length!: Option<Int64> = None,
        encoding!: String = "utf-8"
    ) {
        this.offset = offset
        this.length = length
        this.encoding = encoding
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public enum WhenceType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    SeekSet
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    SeekCur
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    SeekEnd
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public prop whenceType: Int32 {
        get() {
            match (this) {
                case SeekSet => 0
                case SeekCur => 1
                case SeekEnd => 2
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class ConflictFiles {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var srcFile: String
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var destFile: String

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public init(
        srcFile: String,
        destFile: String
    ) {
        this.srcFile = srcFile
        this.destFile = destFile
    }

    func toString(): String {
        return "srcFile: ${srcFile}, destFile: ${destFile}"
    }
}

@C
struct CConflictFiles {
    CConflictFiles(
        let srcFile: CString,
        let destFile: CString
    ) {}
}

@C
struct CArrConflictFiles {
    CArrConflictFiles(
        let head: CPointer<CConflictFiles>,
        let size: Int64
    ) {}
}

@C
struct RetDataCArrConflictFiles {
    RetDataCArrConflictFiles(
        let code: Int32,
        let data: CArrConflictFiles
    ) {}
}

unsafe func getArrConflictFilesAndFree(cArr: CArrConflictFiles): Array<ConflictFiles> {
    let ptr = cArr.head
    if (ptr.isNull()) {
        return Array<ConflictFiles>()
    }
    let size = cArr.size
    let ret = Array<ConflictFiles>(
        size,
        {
            i =>
            let cSrcFile = ptr.read(i).srcFile
            let cDestFile = ptr.read(i).destFile
            let srcFile = cSrcFile.toString()
            let destFile = cDestFile.toString()
            LibC.free(cSrcFile)
            LibC.free(cDestFile)
            ConflictFiles(srcFile, destFile)
        }
    )
    LibC.free<CConflictFiles>(ptr)
    return ret
}

@C
struct RetDataCArrStringN {
    RetDataCArrStringN(
        let code: Int32,
        let data: CArrString
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class Filter {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var suffix: Array<String>
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var displayName: Array<String>
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var mimeType: Array<String>
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var fileSizeOver: ?Int64
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var lastModifiedAfter: ?Float64
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var excludeMedia: Bool

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public init(
        suffix!: Array<String> = Array<String>(),
        displayName!: Array<String> = Array<String>(),
        mimeType!: Array<String> = Array<String>(),
        fileSizeOver!: ?Int64 = None,
        lastModifiedAfter!: ?Float64 = None,
        excludeMedia!: Bool = false
    ) {
        if (((fileSizeOver ?? 0) < 0) || ((lastModifiedAfter ?? 0.0) < 0.0)) {
            FS_LOG.error(getErrorInfo(FILEIO_INVALID_ARGUMENT))
            throw BusinessException(FILEIO_INVALID_ARGUMENT, getErrorInfo(FILEIO_INVALID_ARGUMENT))
        }
        this.suffix = suffix
        this.displayName = displayName
        this.mimeType = mimeType
        this.fileSizeOver = fileSizeOver
        this.lastModifiedAfter = lastModifiedAfter
        this.excludeMedia = excludeMedia
    }

    func toCFilter(): CFilter {
        var cFilter = CFilter(
            CArrString(CPointer<CString>(), 0),
            CArrString(CPointer<CString>(), 0),
            CArrString(CPointer<CString>(), 0),
            fileSizeOver ?? -1,
            lastModifiedAfter ?? -1.0,
            excludeMedia
        )

        try {
            unsafe {
                cFilter.suffix = toArrayCString(suffix)
                cFilter.displayName = toArrayCString(displayName)
                cFilter.mimeType = toArrayCString(mimeType)
            }
        } catch (e: Exception) {
            cFilter.free()
            throw e
        }
        return cFilter
    }
}

@C
struct CFilter {
    CFilter(
        var suffix: CArrString,
        var displayName: CArrString,
        var mimeType: CArrString,
        var fileSizeOver: Int64,
        var lastModifiedAfter: Float64,
        var excludeMedia: Bool
    ) {}

    func free(): Unit {
        unsafe {
            freeArrCString(suffix)
            freeArrCString(displayName)
            freeArrCString(mimeType)
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class ListFileOptions {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var recursion: Bool
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var listNum: Int32
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var filter: Filter

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public init(
        recursion!: Bool = false,
        listNum!: Int32 = 0,
        filter!: Filter = Filter()
    ) {
        this.recursion = recursion
        this.listNum = listNum
        this.filter = filter
    }

    func toCListFileOptions(): CListFileOptions {
        return unsafe { CListFileOptions(recursion, listNum, filter.toCFilter()) }
    }
}

@C
struct CListFileOptions {
    CListFileOptions(
        let recursion: Bool,
        let listNum: Int32,
        let filter: CFilter
    ) {}
}

unsafe func getArrStringAndFree(cArr: CArrString): Array<String> {
    let ptr = cArr.head
    if (ptr.isNull()) {
        return Array<String>()
    }
    let size = cArr.size
    let ret = Array<String>(
        size,
        {
            i =>
            let cString = ptr.read(i)
            let file = cString.toString()
            LibC.free(cString)
            file
        }
    )
    LibC.free<CString>(ptr)
    return ret
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class FileFs {

    /**
     *  @brief statSync(file: string | number): Stat
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func stat(file: Int32): Stat {
        let cValue = unsafe { FfiOHOSFileFsStatByID(file) }
        match {
            case cValue.code == SUCCESS_CODE =>
                let id = cValue.data
                return Stat(id)
            case _ =>
                FS_LOG.error(getErrorInfo(cValue.code))
                throw BusinessException(cValue.code, getErrorInfo(cValue.code))
        }
    }

    /**
     *  @brief statSync(file: string | number): Stat
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func stat(file: String): Stat {
        let cString = unsafe { LibC.mallocCString(file) }
        let cValue = unsafe { FfiOHOSFileFsStatByString(cString) }
        unsafe { LibC.free(cString) }
        if (cValue.code != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(cValue.code))
            throw BusinessException(cValue.code, getErrorInfo(cValue.code))
        }
        return Stat(cValue.data)
    }

    /**
     *  @brief createStreamSync(path: string, mode: string): Stream
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func createStream(path: String, mode: String): Stream {
        var id = 0
        unsafe {
            try (
                pathCString = LibC.mallocCString(path).asResource(),
                modeCString = LibC.mallocCString(mode).asResource()
            ) {
                let cValue = FfiOHOSFileFsCreateStream(pathCString.value, modeCString.value)
                if (cValue.code != SUCCESS_CODE) {
                    FS_LOG.error(getErrorInfo(cValue.code))
                    throw BusinessException(cValue.code, getErrorInfo(cValue.code))
                }
                id = cValue.data
            }
        }
        return Stream(id)
    }

    /**
     *  @brief fdopenStreamSync(fd: number, mode: string): Stream
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func fdopenStream(fd: Int32, mode: String): Stream {
        let modeCString = unsafe { LibC.mallocCString(mode) }
        let cValue = unsafe { FfiOHOSFileFsFdopenStream(fd, modeCString) }
        unsafe {
            LibC.free(modeCString)
        }
        if (cValue.code == SUCCESS_CODE) {
            let id = cValue.data
            return Stream(id)
        } else {
            FS_LOG.error(getErrorInfo(cValue.code))
            throw BusinessException(cValue.code, getErrorInfo(cValue.code))
        }
    }

    /**
     *  @brief lstatSync(path: string): Stat
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func lstat(path: String): Stat {
        let pathCString = unsafe { LibC.mallocCString(path) }
        let cValue = unsafe { FfiOHOSFileFsLstat(pathCString) }
        unsafe {
            LibC.free(pathCString)
        }
        if (cValue.code == SUCCESS_CODE) {
            let id = cValue.data
            return Stat(id)
        } else {
            FS_LOG.error(getErrorInfo(cValue.code))
            throw BusinessException(cValue.code, getErrorInfo(cValue.code))
        }
    }

    /**
     *  @brief accessSync(path: string): boolean
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func access(path: String): Bool {
        let pathCString = unsafe { LibC.mallocCString(path) }
        let cValue = unsafe { FfiOHOSFileFsAccess(pathCString) }
        unsafe {
            LibC.free(pathCString)
        }
        if (cValue.code != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(cValue.code))
            throw BusinessException(cValue.code, getErrorInfo(cValue.code))
        }
        let value = cValue.data
        return value
    }

    /**
     *  openSync(path: string, mode?: number): File
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func open(path: String, mode!: Int64 = ReadOnly.mode): File {
        let pathCString = unsafe { LibC.mallocCString(path) }
        let cValue = unsafe { FfiOHOSFileFsOpen(pathCString, mode) }
        unsafe {
            LibC.free(pathCString)
        }
        if (cValue.code != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(cValue.code))
            throw BusinessException(cValue.code, getErrorInfo(cValue.code))
        }
        return File(cValue.data)
    }

    /**
     *  dup(fd: number): File
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func dup(fd: Int32): File {
        let cValue = unsafe { FfiOHOSFileFsDup(fd) }
        if (cValue.code == SUCCESS_CODE) {
            let id = cValue.data
            return File(id)
        } else {
            FS_LOG.error(getErrorInfo(cValue.code))
            throw BusinessException(cValue.code, getErrorInfo(cValue.code))
        }
    }

    /**
     *  readSync(fd: number, buffer: ArrayBuffer, options?: ReadOptions): number
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func read(fd: Int32, buffer: Array<Byte>, options!: ReadOptions = ReadOptions()): Int64 {
        if (buffer.size == 0) {
            return 0
        }
        let cBuffer = safeMalloc<Byte>(count: buffer.size)
        let cValue = if (options.offset.isNone()) {
            unsafe { FfiOHOSFileFsReadCur(fd, cBuffer, buffer.size, options.length ?? UIntNative(buffer.size)) }
        } else {
            unsafe {
                FfiOHOSFileFsRead(fd, cBuffer, buffer.size, options.length ?? UIntNative(buffer.size),
                    options.offset ?? 0)
            }
        }
        for (index in 0..cValue.data) {
            let ch = unsafe { cBuffer.read(index) }
            buffer[index] = ch
        }
        unsafe { LibC.free(cBuffer) }
        if (cValue.code == SUCCESS_CODE) {
            return cValue.data
        } else {
            FS_LOG.error(getErrorInfo(cValue.code))
            throw BusinessException(cValue.code, getErrorInfo(cValue.code))
        }
    }

    /**
     *  writeSync(fd: number, buffer: ArrayBuffer | string, options?: WriteOptions): number
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func write(fd: Int32, buffer: Array<Byte>, options!: WriteOptions = WriteOptions()): Int64 {
        var writeBytes = 0
        let len = options.length ?? UIntNative(buffer.size)
        if (len > UIntNative(buffer.size)) {
            throw BusinessException(INVALID_ARGS_CODE, "Invalid argument")
        }
        unsafe {
            try (encodingCString = LibC.mallocCString(options.encoding).asResource()) {
                let data = acquireArrayRawData(buffer)
                let cValue = if (options.offset.isNone()) {
                    FfiOHOSFileFsWriteCur(fd, data.pointer, len, encodingCString.value)
                } else {
                    FfiOHOSFileFsWrite(fd, data.pointer, len, options.offset ?? 0, encodingCString.value)
                }
                releaseArrayRawData(data)
                if (cValue.code == SUCCESS_CODE) {
                    writeBytes = cValue.data
                } else {
                    FS_LOG.error(getErrorInfo(cValue.code))
                    throw BusinessException(cValue.code, getErrorInfo(cValue.code))
                }
            }
        }
        return writeBytes
    }

    /**
     *  writeSync(fd: number, buffer: ArrayBuffer | string, options?: WriteOptions): number
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func write(fd: Int32, buffer: String, options!: WriteOptions = WriteOptions()): Int64 {
        var writeBytes = 0
        let len = options.length ?? UIntNative(buffer.size)
        if (len > UIntNative(buffer.size)) {
            throw BusinessException(INVALID_ARGS_CODE, "Invalid argument")
        }
        unsafe {
            try (
                cBuffer = LibC.mallocCString(buffer).asResource(),
                encodingCString = LibC.mallocCString(options.encoding).asResource()
            ) {
                let cValue = if (options.offset.isNone()) {
                    FfiOHOSFileFsWriteCur(fd, cBuffer.value.getChars(), len, encodingCString.value)
                } else {
                    FfiOHOSFileFsWrite(fd, cBuffer.value.getChars(), len, options.offset ?? 0, encodingCString.value)
                }
                if (cValue.code == SUCCESS_CODE) {
                    writeBytes = cValue.data
                } else {
                    FS_LOG.error(getErrorInfo(cValue.code))
                    throw BusinessException(cValue.code, getErrorInfo(cValue.code))
                }
            }
        }
        return writeBytes
    }

    /**
     *  @brief mkdirSync(path: string): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func mkdir(path: String): Unit {
        let pathString = unsafe { LibC.mallocCString(path) }
        let code = unsafe { FfiOHOSFileFsMkdir(pathString, false, false) }
        unsafe { LibC.free(pathString) }
        if (code != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(code))
            throw BusinessException(code, getErrorInfo(code))
        }
        return
    }

    /**
     *  @brief mkdirSync(path: string, recursion: boolean): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func mkdir(path: String, recursion: Bool): Unit {
        let pathString = unsafe { LibC.mallocCString(path) }
        let code = unsafe { FfiOHOSFileFsMkdir(pathString, recursion, true) }
        unsafe { LibC.free(pathString) }
        if (code != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(code))
            throw BusinessException(code, getErrorInfo(code))
        }
        return
    }

    /**
     *  @brief rmdirSync(path: string): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func rmdir(path: String): Unit {
        let pathString = unsafe { LibC.mallocCString(path) }
        let code = unsafe { FfiOHOSFileFsRmdir(pathString) }
        unsafe { LibC.free(pathString) }
        if (code != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(code))
            throw BusinessException(code, getErrorInfo(code))
        }
        return
    }

    /**
     *  @brief moveDirSync(src: string, dest: string, mode?: number): void
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func moveDir(src: String, dest: String, mode!: Int32 = 0): Unit {
        unsafe {
            try (
                srcString = LibC.mallocCString(src).asResource(),
                destString = LibC.mallocCString(dest).asResource()
            ) {
                let ret = FfiOHOSFileFsMoveDir(srcString.value, destString.value, mode)
                let conflictFiles = getArrConflictFilesAndFree(ret.data)
                for (conflicFile in conflictFiles) {
                    FS_LOG.info("FileFs moveDir failed, conflicFile: ${conflicFile.toString()}")
                }
                if (ret.code != SUCCESS_CODE) {
                    FS_LOG.error(getErrorInfo(ret.code))
                    throw ConflictFileException(ret.code, getErrorInfo(ret.code), conflictFiles)
                }
            }
        }
    }

    /**
     *  @brief renameSync(oldPath: string, newPath: string): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func rename(oldPath: String, newPath: String): Unit {
        unsafe {
            try (
                oldString = LibC.mallocCString(oldPath).asResource(),
                newString = LibC.mallocCString(newPath).asResource()
            ) {
                let code = FfiOHOSFileFsRename(oldString.value, newString.value)
                if (code != SUCCESS_CODE) {
                    FS_LOG.error(getErrorInfo(code))
                    throw BusinessException(code, getErrorInfo(code))
                }
            }
        }
    }

    /**
     *  @brief unlinkSync(path: string): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func unlink(path: String): Unit {
        let str = unsafe { LibC.mallocCString(path) }
        let code = unsafe { FfiOHOSFileFsUnlink(str) }
        unsafe { LibC.free(str) }
        if (code != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(code))
            throw BusinessException(code, getErrorInfo(code))
        }
        return
    }

    /**
     *  @brief createRandomAccessFileSync(file: string | File, mode?: number): RandomAccessFile
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func createRandomAccessFile(file: String, mode!: Int64 = 0): RandomAccessFile {
        let cString = unsafe { LibC.mallocCString(file) }
        let cValue = unsafe { FfiOHOSFileFsCreateRandomAccessFileByString(cString, mode) }
        unsafe { LibC.free(cString) }
        if (cValue.code != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(cValue.code))
            throw BusinessException(cValue.code, getErrorInfo(cValue.code))
        }
        return RandomAccessFile(cValue.data)
    }

    /**
     *  @brief createRandomAccessFileSync(file: string | File, mode?: number): RandomAccessFile
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func createRandomAccessFile(file: File, mode!: Int64 = 0): RandomAccessFile {
        let cValue = unsafe { FfiOHOSFileFsCreateRandomAccessFileByID(file.getID(), mode) }
        if (cValue.code != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(cValue.code))
            throw BusinessException(cValue.code, getErrorInfo(cValue.code))
        }
        RandomAccessFile(cValue.data)
    }

    /**
     *  @brief copyDirSync(src: string, dest: string, mode?: number): void
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func copyDir(src: String, dest: String, mode!: Int32 = 0): Unit {
        FS_LOG.info("FileFs copyDir start")
        let srcToC = if (!src.isEmpty() && src[src.size - 1] == UInt8(UInt32(r'/'))) {
            src[..src.size - 1]
        } else {
            src
        }
        let destToC = if (!dest.isEmpty() && dest[dest.size - 1] == UInt8(UInt32(r'/'))) {
            dest[..dest.size - 1]
        } else {
            dest
        }
        unsafe {
            try (
                cStringSrc = LibC.mallocCString(srcToC).asResource(),
                cStringDest = LibC.mallocCString(destToC).asResource()
            ) {
                let ret = FfiOHOSFileFsCopyDir(cStringSrc.value, cStringDest.value, mode)
                let conflictFiles = getArrConflictFilesAndFree(ret.data)
                for (conflicFile in conflictFiles) {
                    FS_LOG.info("FileFs copyDir failed, conflicFile: ${conflicFile.toString()}")
                }
                if (ret.code != SUCCESS_CODE) {
                    FS_LOG.error(getErrorInfo(ret.code))
                    throw ConflictFileException(ret.code, getErrorInfo(ret.code), conflictFiles)
                }
            }
        }
    }

    /**
     *  @brief copyFileSync(src: string | number, dest: string | number, mode?: number): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func copyFile(src: String, dest: String, mode!: Int32 = 0): Unit {
        unsafe {
            try (
                cStringSrc = LibC.mallocCString(src).asResource(),
                cStringDest = LibC.mallocCString(dest).asResource()
            ) {
                let err = FfiOHOSFileFsCopyFile(cStringSrc.value, cStringDest.value, mode)
                if (err != SUCCESS_CODE) {
                    FS_LOG.error(getErrorInfo(err))
                    throw BusinessException(err, getErrorInfo(err))
                }
            }
        }
    }

    /**
     *  @brief copyFileSync(src: string | number, dest: string | number, mode?: number): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func copyFile(src: String, dest: Int32, mode!: Int32 = 0): Unit {
        let err: Int32
        unsafe {
            let cStringSrc = LibC.mallocCString(src)
            err = FfiOHOSFileFsCopyFileSI(cStringSrc, dest, mode)
            LibC.free(cStringSrc)
        }
        if (err != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(err))
            throw BusinessException(err, getErrorInfo(err))
        }
    }

    /**
     *  @brief copyFileSync(src: string | number, dest: string | number, mode?: number): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func copyFile(src: Int32, dest: String, mode!: Int32 = 0): Unit {
        let err: Int32
        unsafe {
            let cStringDest = LibC.mallocCString(dest)
            err = FfiOHOSFileFsCopyFileIS(src, cStringDest, mode)
            LibC.free(cStringDest)
        }
        if (err != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(err))
            throw BusinessException(err, getErrorInfo(err))
        }
    }

    /**
     *  @brief copyFileSync(src: string | number, dest: string | number, mode?: number): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func copyFile(src: Int32, dest: Int32, mode!: Int32 = 0): Unit {
        let err: Int32
        unsafe {
            err = FfiOHOSFileFsCopyFileII(src, dest, mode)
        }
        if (err != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(err))
            throw BusinessException(err, getErrorInfo(err))
        }
    }

    /**
     *  @brief moveFileSync(src: string, dest: string, mode?: number): void
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func moveFile(src: String, dest: String, mode!: Int32 = 0): Unit {
        FS_LOG.info("FileFs moveFile start")
        let srcFToC = if (!src.isEmpty() && src[src.size - 1] == UInt8(UInt32(r'/'))) {
            src[..src.size - 1]
        } else {
            src
        }
        let destFToC = if (!dest.isEmpty() && dest[dest.size - 1] == UInt8(UInt32(r'/'))) {
            dest[..dest.size - 1]
        } else {
            dest
        }
        unsafe {
            try (
                cStringSrc = LibC.mallocCString(srcFToC).asResource(),
                cStringDest = LibC.mallocCString(destFToC).asResource()
            ) {
                let err = FfiOHOSFileFsMoveFile(cStringSrc.value, cStringDest.value, mode)
                if (err != SUCCESS_CODE) {
                    FS_LOG.error(getErrorInfo(err))
                    throw BusinessException(err, getErrorInfo(err))
                }
            }
        }
    }

    /**
     *  @brief mkdtempSync(prefix: string): string
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func mkdtemp(prefix: String): String {
        let cValue: RetDataCString
        unsafe {
            let cStringPrefix = LibC.mallocCString(prefix)
            cValue = FfiOHOSFileFsMkdtemp(cStringPrefix)
            LibC.free(cStringPrefix)
        }
        if (cValue.code != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(cValue.code))
            throw BusinessException(cValue.code, getErrorInfo(cValue.code))
        }
        let ret = cValue.data.toString()
        unsafe { LibC.free(cValue.data) }
        return ret
    }

    /**
     *  @brief truncateSync(file: string | number, len?: number): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func truncate(file: String, len!: Int64 = 0): Unit {
        let code: Int32
        unsafe {
            let cString = LibC.mallocCString(file)
            code = FfiOHOSFileFsTruncateByString(cString, len)
            LibC.free(cString)
        }
        if (code != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(code))
            throw BusinessException(code, getErrorInfo(code))
        }
        return
    }

    /**
     *  @brief truncateSync(file: string | number, len?: number): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func truncate(file: Int32, len!: Int64 = 0): Unit {
        let code = unsafe { FfiOHOSFileFsTruncateByFd(file, len) }
        if (code != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(code))
            throw BusinessException(code, getErrorInfo(code))
        }
        return
    }

    /**
     *  @brief closeSync(file: number | File): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func close(file: Int32): Unit {
        let code = unsafe { FfiOHOSFileFsCloseByFd(file) }
        if (code != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(code))
            throw BusinessException(code, getErrorInfo(code))
        }
        return
    }

    /**
     *  @brief closeSync(file: number | File): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func close(file: File): Unit {
        try {
            let code = unsafe { FfiOHOSFileFsClose(file.getID()) }
            if (code != SUCCESS_CODE) {
                // The ffi interface returns an incorrect error code, which is temporarily avoided.
                if (code == -1) {
                    FS_LOG.error(getErrorInfo(FILEIO_INVALID_ARGUMENT))
                    throw BusinessException(FILEIO_INVALID_ARGUMENT, getErrorInfo(FILEIO_INVALID_ARGUMENT))
                }
                FS_LOG.error(getErrorInfo(code))
                throw BusinessException(code, getErrorInfo(code))
            }
        } catch (e: NoneValueException) {
            FS_LOG.error(getErrorInfo(FILEIO_INVALID_ARGUMENT))
            throw BusinessException(FILEIO_INVALID_ARGUMENT, getErrorInfo(FILEIO_INVALID_ARGUMENT))
        }
        return
    }

    /**
     *  @brief readLinesSync(filePath: string, options?: Options): ReaderIterator
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func readLines(filePath: String, options!: Options = Options()): ReaderIterator {
        var id = -1
        unsafe {
            try (
                pathCString = LibC.mallocCString(filePath).asResource(),
                encodingCString = LibC.mallocCString(options.encoding).asResource()
            ) {
                let cValue = FfiOHOSFileFsReadLines(pathCString.value, encodingCString.value)
                if (cValue.code != SUCCESS_CODE) {
                    FS_LOG.error(getErrorInfo(cValue.code))
                    throw BusinessException(cValue.code, getErrorInfo(cValue.code))
                }
                id = cValue.data
            }
        }
        ReaderIterator(id)
    }

    /**
     *  @brief lseek(fd: number, offset: number, whence?: WhenceType): number
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func lseek(fd: Int32, offset: Int64, whence!: WhenceType = SeekSet): Int64 {
        let ret: RetDataI64
        unsafe {
            ret = FfiOHOSFileFsLseek(fd, offset, whence.whenceType)
        }
        if (ret.code != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(ret.code))
            throw BusinessException(ret.code, getErrorInfo(ret.code))
        }
        return ret.data
    }

    /**
     *  @brief fdatasyncSync(fd: number): void
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func fdatasync(fd: Int32): Unit {
        let ret: Int32
        unsafe {
            ret = FfiOHOSFileFsFdatasync(fd)
        }
        if (ret != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(ret))
            throw BusinessException(ret, getErrorInfo(ret))
        }
    }

    /**
     *  @brief fsyncSync(fd: number): void
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func fsync(fd: Int32): Unit {
        let ret: Int32
        unsafe {
            ret = FfiOHOSFileFsFsync(fd)
        }
        if (ret != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(ret))
            throw BusinessException(ret, getErrorInfo(ret))
        }
    }

    /**
     *  @brief function listFileSync(path: string,
     *                               options?: {recursion?: boolean; listNum?: number; filter?: Filter;}): string[]
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func listFile(path: String, options!: ListFileOptions = ListFileOptions()): Array<String> {
        var ret: RetDataCArrStringN = RetDataCArrStringN(0, CArrString(CPointer(), 0))
        unsafe {
            let cOption = options.toCListFileOptions()
            try (cPath = LibC.mallocCString(path).asResource()) {
                ret = FfiOHOSFileListFile(cPath.value, cOption)
            } finally {
                cOption.filter.free()
            }
        }
        if (ret.code != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(ret.code))
            throw BusinessException(ret.code, getErrorInfo(ret.code))
        }
        return unsafe { getArrStringAndFree(ret.data) }
    }

    /**
     *  @brief readTextSync(filePath: string, options?: ReadTextOptions): string
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func readText(filePath: String, option!: ReadTextOptions = ReadTextOptions()): String {
        let hasLen: Bool
        let len: Int64
        var ret = ""
        unsafe {
            try (
                cPath = LibC.mallocCString(filePath).asResource(),
                encoding = LibC.mallocCString(option.encoding).asResource()
            ) {
                if (let Some(length) <- option.length) {
                    len = length
                    hasLen = true
                } else {
                    len = 0
                    hasLen = false
                }
                let cValue = FfiOHOSFileFsReadText(cPath.value, option.offset, hasLen, len, encoding.value)
                if (cValue.code != SUCCESS_CODE) {
                    FS_LOG.error(getErrorInfo(cValue.code))
                    throw BusinessException(cValue.code, getErrorInfo(cValue.code))
                }
                ret = cValue.data.toString()
                LibC.free(cValue.data)
            }
        }

        return ret
    }

    /**
     *  @brief utimes(path: string, mtime: number): void
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func utimes(path: String, mtime: Float64): Unit {
        let cPath = unsafe { LibC.mallocCString(path) }
        let code = unsafe { FfiOHOSFileFsUtimes(cPath, mtime) }
        unsafe { LibC.free(cPath) }
        if (code != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(code))
            throw BusinessException(code, getErrorInfo(code))
        }
        return
    }
}
