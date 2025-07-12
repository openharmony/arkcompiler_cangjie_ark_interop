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

/**
 * Mode Indicates the open flags.
 *
 * @relation namespace OpenMode
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public enum OpenMode {
    /**
     * Read only Permission.
     *
     * @relation const READ_ONLY = 0o0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    ReadOnly
    | 
    /**
     * Write only Permission.
     *
     * @relation const WRITE_ONLY = 0o1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    WriteOnly
    | 
    /**
     * Write and Read Permission.
     *
     * @relation const READ_WRITE = 0o2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    ReadWrite
    | 
    /**
     * If not exist, create file.
     *
     * @relation const CREATE = 0o100
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    Create
    | 
    /**
     * File truncate len 0.
     *
     * @relation const TRUNC = 0o1000
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    Trunc
    | 
    /**
     * File append write.
     *
     * @relation const APPEND = 0o2000
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    Append
    | 
    /**
     * File open in nonblocking mode.
     *
     * @relation const NONBLOCK = 0o4000
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    NonBlock
    | 
    /**
     * File is Dir.
     *
     * @relation const DIR = 0o200000
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    Dir
    | 
    /**
     * File is not symbolic link.
     *
     * @relation const NOFOLLOW = 0o400000
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    NoFollow
    | 
    /**
     * SYNC IO.
     *
     * @relation const SYNC = 0o4010000
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    Sync
    | ...

    /**
     * Get the corresponding mapping value.
     */
    @!APILevel[
        21,
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

/**
 * Defines the options used in readLines().
 *
 * @relation interface Options
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class Options {
    /**
     * File encoding format.
     *
     * @relation encoding?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var encoding: String

    /**
     * Options constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public init(
        encoding!: String = "utf-8"
    ) {
        this.encoding = encoding
    }
}

/**
 * Provides a ReaderIterator object.
 *
 * @relation interface ReaderIterator
 */
@!APILevel[
    21,
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

    /**
     * Obtains the ReaderIterator result.
     *
     * @throws { BusinessExecption } 13900005 - I/O error
     * @throws { BusinessExecption } 13900037 - No data available
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @relation next(): ReaderIteratorResult
     */
    @!APILevel[
        21,
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

/**
 * Represents the information obtained by the ReaderIterator object.
 *
 * @relation interface ReaderIteratorResult
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class ReaderIteratorResult {
    /**
     * Whether the iteration is complete.
     * The value true means the iteration is complete; the value false means the iteration is not complete.
     *
     * @relation done: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var done: Bool
    /**
     * File text content read line by line.
     *
     * @relation value: string
     */
    @!APILevel[
        21,
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

/**
 * Defines the options use din write().
 *
 * @relation interface WriteOptions extends Options
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class WriteOptions {
    /**
     * Length of the data to write, in bytes.
     *
     * @relation length?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var length: Option<UIntNative>
    /**
     * Start position of the file to write (current filePointer plus offset), in bytes.
     *
     * @relation offset?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var offset: Option<Int64>
    /**
     * File encoding format.
     *
     * @relation encoding?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var encoding: String

    /**
     * WriteOptions constructor.
     */
    @!APILevel[
        21,
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

/**
 * Defines the options used in read().
 *
 * @relation interface ReadOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class ReadOptions {
    /**
     * Start position of the file to read (current filePointer plus offset), in bytes.
     *
     * @relation offset?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var offset: Option<Int64>
    /**
     * Length of the data to read, in bytes.
     *
     * @relation length?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var length: Option<UIntNative>
    /**
     * ReadOptions constructor.
     */
    @!APILevel[
        21,
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

/**
 * Defines the options used in readText().
 *
 * @relation interface ReadTextOptions extends ReadOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class ReadTextOptions {
    /**
     * Start position of the file to read (current filePointer plus offset), in bytes.
     *
     * @relation offset?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var offset: Int64
    /**
     * Length of the data to read, in bytes.
     *
     * @relation length?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var length: Option<Int64>
    /**
     * File encoding format.
     *
     * @relation encoding?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var encoding: String

    /**
     * ReadTextOptions constructor.
     */
    @!APILevel[
        21,
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

/**
 * Enumerates the types of the relative offset position used in lseek().
 *
 * @relation enum WhenceType
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public enum WhenceType {
    /**
     * Starting position of the file offset.
     *
     * @relation SEEK_SET = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    SeekSet
    | 
    /**
     * Current position of the file offset.
     *
     * @relation SEEK_CUR = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    SeekCur
    | 
    /**
     * Ending position of the file offset.
     *
     * @relation SEEK_END = 2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    SeekEnd
    | ...

    /**
     * Get the corrsponding mapping value.
     */
    @!APILevel[
        21,
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

/**
 * EDefines conflicting file information used in copyDir() or moveDir().
 *
 * @relation interface ConflictFiles
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class ConflictFiles {
    /**
     * The path of the source file.
     *
     * @relation srcFile: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var srcFile: String
    /**
     * The path of the destination file.
     *
     * @relation destFile: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var destFile: String

    /**
     * ConflictFiles constructor.
     */
    @!APILevel[
        21,
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

/**
 * Defines the file filtering configuration used by listFile().
 *
 * @relation interface Filter
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class Filter {
    /**
     * Locate files that fully match the specified file name extensions, which are of the OR relationship.
     *
     * @relation suffix?: Array<string>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var suffix: Array<String>
    /**
     * Locate files that fuzzy match the specified file names, which are of the OR relationship.
     * Currently, only the wildcard * is supported.
     *
     * @relation displayName?: Array<string>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var displayName: Array<String>
    /**
     * Locate files that fully match the specified MIME types, which are of the OR relationship.
     *
     * @relation mimeType?: Array<string>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var mimeType: Array<String>
    /**
     * Locate files that are greater than or equal to the specified size.
     *
     * @relation fileSizeOver?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var fileSizeOver: ?Int64
    /**
     * Locate files whose last modification time is the same or later than the specified time.
     *
     * @relation lastModifiedAfter?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var lastModifiedAfter: ?Float64
    /**
     * Whether to exclude the files already in Media. The value true means to exclude the files already in Media;
     * the value false means not to exclude the files already in Media.
     *
     * @relation excludeMedia?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var excludeMedia: Bool

    /**
     * Filter constructor.
     */
    @!APILevel[
        21,
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

/**
 * ListFileOptions type
 *
 * @relation interface ListFileOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class ListFileOptions {
    /**
     * Whether to list all files in the subdirectories recursively. This parameter is optional.
     * The default value is false. If recursion is false, the names of files and directories that meet the filtering
     * requirements in the current directory are returned. If recursion is true, relative paths (starting with /)
     * of all files that meet the specified conditions in the current directory are returned.
     *
     * @relation recursion?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var recursion: Bool
    /**
     * Number of file names to list. This parameter is optional. The default value is 0, which means to list all files.
     *
     * @relation listNum?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var listNum: Int32
    /**
     * File filtering configuration. This parameter is optional. It specifies the file filtering conditions.
     *
     * @relation filter?: Filter
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public var filter: Filter

    /**
     * ListFileOptions constructor.
     */
    @!APILevel[
        21,
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


/**
 * FileFs
 *
 * @relation namespace fileIo
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class FileFs {

    /**
     *  Obtains detailed attribute information of a file or directory.
     *
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900004 - Interrupted system call
     * @throws { BusinessExecption } 13900005 - I/O error
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900011 - Out of memory
     * @throws { BusinessExecption } 13900012 - Permission denied
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900018 - Not a directory
     * @throws { BusinessExecption } 13900030 - File name too long
     * @throws { BusinessExecption } 13900031 - Function not implemented
     * @throws { BusinessExecption } 13900033 - Too many symbolic links encountered
     * @throws { BusinessExecption } 13900038 - Value too large for defined data type
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @relation function statSync(file: string | number): Stat
     */
    @!APILevel[
        21,
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
     *  Obtains detailed attribute information of a file or directory.
     *
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900004 - Interrupted system call
     * @throws { BusinessExecption } 13900005 - I/O error
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900011 - Out of memory
     * @throws { BusinessExecption } 13900012 - Permission denied
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900018 - Not a directory
     * @throws { BusinessExecption } 13900030 - File name too long
     * @throws { BusinessExecption } 13900031 - Function not implemented
     * @throws { BusinessExecption } 13900033 - Too many symbolic links encountered
     * @throws { BusinessExecption } 13900038 - Value too large for defined data type
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @relation function statSync(file: string | number): Stat
     */
    @!APILevel[
        21,
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
     *  Creates a stream based on a file path.
     *
     * @param { String } mode - r: Open a file for reading. The file must exist.
     * r+: Open a file for both reading and writing. The file must exist.
     * w: Open a file for writing. If the file exists, clear its content. If the file does not exist, create a file.
     * w+: Open a file for both reading and writing. If the file exists, clear its content. If the file does not exist, create a file.
     * a: Open a file in append mode for writing at the end of the file. If the file does not exist, create a file.
     * If the file exists, write data to the end of the file (the original content of the file is reserved).
     * a+: Open a file in append mode for reading or updating at the end of the file.
     * If the file does not exist, create a file.
     * If the file exists, write data to the end of the file (the original content of the file is reserved).
     * @throws { BusinessExecption } 13900001 - Operation not permitted
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900004 - Interrupted system call
     * @throws { BusinessExecption } 13900006 - No such device or address
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900011 - Out of memory
     * @throws { BusinessExecption } 13900012 - Permission denied
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900014 - Device or resource busy
     * @throws { BusinessExecption } 13900015 - File exists
     * @throws { BusinessExecption } 13900017 - No such device
     * @throws { BusinessExecption } 13900018 - Not a directory
     * @throws { BusinessExecption } 13900019 - Is a directory
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900022 - Too many open files
     * @throws { BusinessExecption } 13900023 - Text file busy
     * @throws { BusinessExecption } 13900024 - File too large
     * @throws { BusinessExecption } 13900025 - No space left on device
     * @throws { BusinessExecption } 13900027 - Read-only file system
     * @throws { BusinessExecption } 13900029 - Resource deadlock would occur
     * @throws { BusinessExecption } 13900030 - File name too long
     * @throws { BusinessExecption } 13900033 - Too many symbolic links encountered
     * @throws { BusinessExecption } 13900034 - Operation would block
     * @throws { BusinessExecption } 13900038 - Value too large for defined data type
     * @throws { BusinessExecption } 13900041 - Quota exceeded
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @throws { BusinessExecption } 13900042 - Network is unreachable
     * @relation function createStreamSync(path: string, mode: string): Stream
     */
    @!APILevel[
        21,
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
     *  Opens a stream based on an FD.
     *
     * @param { String } mode - r: Open a file for reading. The file must exist.
     * r+: Open a file for both reading and writing. The file must exist.
     * w: Open a file for writing. If the file exists, clear its content. If the file does not exist, create a file.
     * w+: Open a file for both reading and writing. If the file exists, clear its content. If the file does not exist, create a file.
     * a: Open a file in append mode for writing at the end of the file. If the file does not exist, create a file.
     * If the file exists, write data to the end of the file (the original content of the file is reserved).
     * a+: Open a file in append mode for reading or updating at the end of the file. If the file does not exist,
     * create a file. If the file exists, write data to the end of the file (the original content of the file is reserved).
     * @throws { BusinessExecption } 13900001 - Operation not permitted
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900004 - Interrupted system call
     * @throws { BusinessExecption } 13900006 - No such device or address
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900010 - Try again
     * @throws { BusinessExecption } 13900011 - Out of memory
     * @throws { BusinessExecption } 13900012 - Permission denied
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900014 - Device or resource busy
     * @throws { BusinessExecption } 13900015 - File exists
     * @throws { BusinessExecption } 13900017 - No such device
     * @throws { BusinessExecption } 13900018 - Not a directory
     * @throws { BusinessExecption } 13900019 - Is a directory
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900022 - Too many open files
     * @throws { BusinessExecption } 13900023 - Text file busy
     * @throws { BusinessExecption } 13900024 - File too large
     * @throws { BusinessExecption } 13900025 - No space left on device
     * @throws { BusinessExecption } 13900027 - Read-only file system
     * @throws { BusinessExecption } 13900029 - Resource deadlock would occur
     * @throws { BusinessExecption } 13900030 - File name too long
     * @throws { BusinessExecption } 13900033 - Too many symbolic links encountered
     * @throws { BusinessExecption } 13900034 - Operation would block
     * @throws { BusinessExecption } 13900038 - Value too large for defined data type
     * @throws { BusinessExecption } 13900041 - Quota exceeded
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @relation function fdopenStreamSync(fd: number, mode: string): Stream
     */
    @!APILevel[
        21,
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
     *  Obtains information about a symbolic link that is used to refer to a file or directory.
     *
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900011 - Out of memory
     * @throws { BusinessExecption } 13900012 - Permission denied
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900018 - Not a directory
     * @throws { BusinessExecption } 13900030 - File name too long
     * @throws { BusinessExecption } 13900033 - Too many symbolic links encountered
     * @throws { BusinessExecption } 13900038 - Value too large for defined data type
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @relation function lstatSync(path: string): Stat
     */
    @!APILevel[
        21,
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
     *  Checks whether a file or directory exists or has the operation permission.
     *
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900005 - I/O error
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900011 - Out of memory
     * @throws { BusinessExecption } 13900012 - Permission denied
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900018 - Not a directory
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900023 - Text file busy
     * @throws { BusinessExecption } 13900030 - File name too long
     * @throws { BusinessExecption } 13900033 - Too many symbolic links encountered
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @relation ffunction accessSync(path: string, mode?: AccessModeType): boolean
     */
    @!APILevel[
        21,
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
     *  Opens a file or directory.
     *
     * @throws { BusinessExecption } 13900001 - Operation not permitted
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900004 - Interrupted system call
     * @throws { BusinessExecption } 13900006 - No such device or address
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900011 - Out of memory
     * @throws { BusinessExecption } 13900012 - Permission denied
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900014 - Device or resource busy
     * @throws { BusinessExecption } 13900015 - File exists
     * @throws { BusinessExecption } 13900017 - No such device
     * @throws { BusinessExecption } 13900018 - Not a directory
     * @throws { BusinessExecption } 13900019 - Is a directory
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900022 - Too many open files
     * @throws { BusinessExecption } 13900023 - Text file busy
     * @throws { BusinessExecption } 13900024 - File too large
     * @throws { BusinessExecption } 13900025 - No space left on device
     * @throws { BusinessExecption } 13900027 - Read-only file system
     * @throws { BusinessExecption } 13900029 - Resource deadlock would occur
     * @throws { BusinessExecption } 13900030 - File name too long
     * @throws { BusinessExecption } 13900033 - Too many symbolic links encountered
     * @throws { BusinessExecption } 13900034 - Operation would block
     * @throws { BusinessExecption } 13900038 - Value too large for defined data type
     * @throws { BusinessExecption } 13900041 - Quota exceeded
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @throws { BusinessExecption } 13900044 - Network is unreachable
     * @relation function openSync(path: string, mode?: number): File
     */
    @!APILevel[
        21,
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
     *  Opens a File object based on an FD.
     *
     * @throws { BusinessExecption } 13900004 - Interrupted system call
     * @throws { BusinessExecption } 13900005 - I/O error
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900014 - Device or resource busy
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900022 - Too many open files
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @relation function dup(fd: number): File
     */
    @!APILevel[
        21,
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
     *  Reads data from a file.
     *
     * @throws { BusinessExecption } 13900004 - Interrupted system call
     * @throws { BusinessExecption } 13900005 - I/O error
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900010 - Try again
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900019 - Is a directory
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900034 - Operation would block
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @throws { BusinessExecption } 13900044 - Network is unreachable
     * @relation function readSync(fd: number, buffer: ArrayBuffer, options?: ReadOptions): number
     */
    @!APILevel[
        21,
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
     *  Writes data to a file.
     *
     * @throws { BusinessExecption } 13900001 - Operation not permitted
     * @throws { BusinessExecption } 13900004 - Interrupted system call
     * @throws { BusinessExecption } 13900005 - I/O error
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900010 - Try again
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900024 - File too large
     * @throws { BusinessExecption } 13900025 - No space left on device
     * @throws { BusinessExecption } 13900034 - Operation would block
     * @throws { BusinessExecption } 13900041 - Quota exceeded
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @relation function writeSync(fd: number, buffer: ArrayBuffer | string, options?: WriteOptions): number;
     */
    @!APILevel[
        21,
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
     *  Writes data to a file.
     *
     * @throws { BusinessExecption } 13900001 - Operation not permitted
     * @throws { BusinessExecption } 13900004 - Interrupted system call
     * @throws { BusinessExecption } 13900005 - I/O error
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900010 - Try again
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900024 - File too large
     * @throws { BusinessExecption } 13900025 - No space left on device
     * @throws { BusinessExecption } 13900034 - Operation would block
     * @throws { BusinessExecption } 13900041 - Quota exceeded
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @relation function writeSync(fd: number, buffer: ArrayBuffer | string, options?: WriteOptions): number;
     */
    @!APILevel[
        21,
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
     *  Creates a directory.
     *
     * @throws { BusinessExecption } 13900001 - Operation not permitted
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900011 - Out of memory
     * @throws { BusinessExecption } 13900012 - Permission denied
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900015 - File exists
     * @throws { BusinessExecption } 13900018 - Not a directory
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900025 - No space left on device
     * @throws { BusinessExecption } 13900028 - Too many links
     * @throws { BusinessExecption } 13900030 - File name too long
     * @throws { BusinessExecption } 13900033 - Too many symbolic links encountered
     * @throws { BusinessExecption } 13900041 - Quota exceeded
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @relation function mkdirSync(path: string): void
     */
    @!APILevel[
        21,
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
     *  Creates a directory.
     *
     * @throws { BusinessExecption } 13900001 - Operation not permitted
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900011 - Out of memory
     * @throws { BusinessExecption } 13900012 - Permission denied
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900015 - File exists
     * @throws { BusinessExecption } 13900018 - Not a directory
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900025 - No space left on device
     * @throws { BusinessExecption } 13900028 - Too many links
     * @throws { BusinessExecption } 13900030 - File name too long
     * @throws { BusinessExecption } 13900033 - Too many symbolic links encountered
     * @throws { BusinessExecption } 13900041 - Quota exceeded
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @relation function mkdirSync(path: string, recursion: boolean): void
     */
    @!APILevel[
        21,
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
     *  Removes a directory.
     *
     * @throws { BusinessExecption } 13900001 - Operation not permitted
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900011 - Out of memory
     * @throws { BusinessExecption } 13900012 - Permission denied
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900014 - Device or resource busy
     * @throws { BusinessExecption } 13900018 - Not a directory
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900027 - Read-only file system1
     * @throws { BusinessExecption } 13900030 - File name too long
     * @throws { BusinessExecption } 13900032 - Directory not empty
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @relation function rmdirSync(path: string): void
     */
    @!APILevel[
        21,
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
     *  Moves the source directory to the destination directory.
     *
     * @param { Int32 } [mode!: Int32 = 0] - Move mode. The default value is 0.
     * 0: Throw an exception if a directory conflict occurs.
     * An exception will be thrown if the destination directory contains a non-empty directory with the same name as the source directory.
     * 1: Throw an exception if a file conflict occurs.
     * An exception will be thrown if the destination directory contains a directory with the same name as the source directory,
     * and a file with the same name exists in the conflict directory. All the non-conflicting files in the source directory
     * will be moved to the destination directory, and the non-conflicting files in the destination directory will be retained.
     * The data attribute in the error returned provides information about the conflicting files in the Array<ConflictFiles> format.
     * 2: Forcibly overwrite the conflicting files in the destination directory.
     * When the destination directory contains a directory with the same name as the source directory,
     * the files with the same names in the destination directory are overwritten forcibly;
     * the files without conflicts in the destination directory are retained.
     * 3: Forcibly overwrite the conflicting directory.
     * The source directory is moved to the destination directory, and the content of the moved directory is the
     * same as that of the source directory. If the destination directory contains a directory with the same name
     * as the source directory, all original files in the directory will be deleted.
     * @throws { BusinessExecption } 13900001 - Operation not permitted
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900011 - Out of memory
     * @throws { BusinessExecption } 13900012 - Permission denied
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900014 - Device or resource busy
     * @throws { BusinessExecption } 13900015 - File exists
     * @throws { BusinessExecption } 13900016 - Cross-device link
     * @throws { BusinessExecption } 13900018 - Not a directory
     * @throws { BusinessExecption } 13900019 - Is a directory
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900025 - No space left on device
     * @throws { BusinessExecption } 13900027 - Read-only file system
     * @throws { BusinessExecption } 13900028 - Too many links
     * @throws { BusinessExecption } 13900032 - Directory not empty
     * @throws { BusinessExecption } 13900033 - Too many symbolic links encountered
     * @throws { BusinessExecption } 13900041 - Quota exceeded
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @relation function moveDirSync(src: string, dest: string, mode?: number): void
     */
    @!APILevel[
        21,
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
     *  Renames a file or directory.
     *
     * @throws { BusinessExecption } 13900001 - Operation not permitted
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900011 - Out of memory
     * @throws { BusinessExecption } 13900012 - Permission denied
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900014 - Device or resource busy
     * @throws { BusinessExecption } 13900015 - File exists
     * @throws { BusinessExecption } 13900016 - Cross-device link
     * @throws { BusinessExecption } 13900018 - Not a directory
     * @throws { BusinessExecption } 13900019 - Is a directory
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900025 - No space left on device
     * @throws { BusinessExecption } 13900027 - Read-only file system
     * @throws { BusinessExecption } 13900028 - Too many links
     * @throws { BusinessExecption } 13900032 - Directory not empty
     * @throws { BusinessExecption } 13900033 - Too many symbolic links encountered
     * @throws { BusinessExecption } 13900041 - Quota exceeded
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @relation function renameSync(oldPath: string, newPath: string): void
     */
    @!APILevel[
        21,
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
     *  Deletes a file.
     *
     * @throws { BusinessExecption } 13900001 - Operation not permitted
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900005 - I/O error
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900011 - Out of memory
     * @throws { BusinessExecption } 13900012 - Permission denied
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900014 - Device or resource busy
     * @throws { BusinessExecption } 13900018 - Not a directory
     * @throws { BusinessExecption } 13900019 - Is a directory
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900027 - Read-only file system
     * @throws { BusinessExecption } 13900030 - File name too long
     * @throws { BusinessExecption } 13900033 - Too many symbolic links encountered
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @relation function unlinkSync(path: string): void
     */
    @!APILevel[
        21,
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
     *  Creates a RandomAccessFile instance based on a file path or file object.
     *
     * @throws { BusinessExecption } 13900001 - Operation not permitted
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900004 - Interrupted system call
     * @throws { BusinessExecption } 13900006 - No such device or address
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900011 - Out of memory
     * @throws { BusinessExecption } 13900012 - Permission denied
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900014 - Device or resource busy
     * @throws { BusinessExecption } 13900015 - File exists
     * @throws { BusinessExecption } 13900017 - No such device
     * @throws { BusinessExecption } 13900018 - Not a directory
     * @throws { BusinessExecption } 13900019 - Is a directory
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900022 - Too many open files
     * @throws { BusinessExecption } 13900023 - Text file busy
     * @throws { BusinessExecption } 13900024 - File too large
     * @throws { BusinessExecption } 13900025 - No space left on device
     * @throws { BusinessExecption } 13900027 - Read-only file system
     * @throws { BusinessExecption } 13900029 - Resource deadlock would occur
     * @throws { BusinessExecption } 13900030 - File name too long
     * @throws { BusinessExecption } 13900033 - Too many symbolic links encountered
     * @throws { BusinessExecption } 13900034 - Operation would block
     * @throws { BusinessExecption } 13900038 - Value too large for defined data type
     * @throws { BusinessExecption } 13900041 - Quota exceeded
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @throws { BusinessExecption } 13900044 - Network is unreachable
     * @relation function createRandomAccessFileSync(file: string | File, mode?: number, options?: RandomAccessFileOptions): RandomAccessFile
     */
    @!APILevel[
        21,
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
     *  Creates a RandomAccessFile instance based on a file path or file object.
     *
     * @throws { BusinessExecption } 13900001 - Operation not permitted
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900004 - Interrupted system call
     * @throws { BusinessExecption } 13900006 - No such device or address
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900011 - Out of memory
     * @throws { BusinessExecption } 13900012 - Permission denied
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900014 - Device or resource busy
     * @throws { BusinessExecption } 13900015 - File exists
     * @throws { BusinessExecption } 13900017 - No such device
     * @throws { BusinessExecption } 13900018 - Not a directory
     * @throws { BusinessExecption } 13900019 - Is a directory
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900022 - Too many open files
     * @throws { BusinessExecption } 13900023 - Text file busy
     * @throws { BusinessExecption } 13900024 - File too large
     * @throws { BusinessExecption } 13900025 - No space left on device
     * @throws { BusinessExecption } 13900027 - Read-only file system
     * @throws { BusinessExecption } 13900029 - Resource deadlock would occur
     * @throws { BusinessExecption } 13900030 - File name too long
     * @throws { BusinessExecption } 13900033 - Too many symbolic links encountered
     * @throws { BusinessExecption } 13900034 - Operation would block
     * @throws { BusinessExecption } 13900038 - Value too large for defined data type
     * @throws { BusinessExecption } 13900041 - Quota exceeded
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @throws { BusinessExecption } 13900044 - Network is unreachable
     * @relation function createRandomAccessFileSync(file: string | File, mode?: number, options?: RandomAccessFileOptions): RandomAccessFile
     */
    @!APILevel[
        21,
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
     *  Copies the source directory to the destination directory.
     *
     * @param { Int32 } [mode!: Int32 = 0] - Copy mode. The default value is 0.
     * 0: Throw an exception if a file conflict occurs.
     * An exception will be thrown if the destination directory contains a directory with the same name as the source directory,
     * and a file with the same name exists in the conflict directory. All the non-conflicting files in the source directory will be moved
     * to the destination directory, and the non-conflicting files in the destination directory will be retained.
     * The data attribute in the error returned provides information about the conflicting files in the Array<ConflictFiles> format.
     * 1: Forcibly overwrite the files with the same name in the destination directory.
     * When the destination directory contains a directory with the same name as the source directory,
     * the files with the same names in the destination directory are overwritten forcibly;
     * the files without conflicts in the destination directory are retained.
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900004 - Interrupted system call
     * @throws { BusinessExecption } 13900005 - I/O error
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900010 - Try again
     * @throws { BusinessExecption } 13900011 - Out of memory
     * @throws { BusinessExecption } 13900012 - Permission denied
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900015 - File exists
     * @throws { BusinessExecption } 13900018 - Not a directory
     * @throws { BusinessExecption } 13900019 - Is a directory
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900030 - File name too long
     * @throws { BusinessExecption } 13900031 - Function not implemented
     * @throws { BusinessExecption } 13900033 - Too many symbolic links encountered
     * @throws { BusinessExecption } 13900034 - Operation would block
     * @throws { BusinessExecption } 13900038 - Value too large for defined data type
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @throws { BusinessExecption } 13900044 - Network is unreachable
     * @relation function copyDirSync(src: string, dest: string, mode?: number): void
     */
    @!APILevel[
        21,
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
     *  Copies a file.
     *
     * @param { number } [mode = 0] - Whether to overwrite the file with the same name in the destination directory.
     * The default value is 0, which is the only value supported.
     * 0: overwrite the file with the same name and truncate the part that is not overwritten.
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900004 - Interrupted system call
     * @throws { BusinessExecption } 13900005 - I/O error
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900010 - Try again
     * @throws { BusinessExecption } 13900011 - Out of memory
     * @throws { BusinessExecption } 13900012 - Permission denied
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900018 - Not a directory
     * @throws { BusinessExecption } 13900019 - Is a directory
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900030 - File name too long
     * @throws { BusinessExecption } 13900031 - Function not implemented
     * @throws { BusinessExecption } 13900033 - Too many symbolic links encountered
     * @throws { BusinessExecption } 13900034 - Operation would block
     * @throws { BusinessExecption } 13900038 - Value too large for defined data type
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @throws { BusinessExecption } 13900044 - Network is unreachable
     * @relation function copyFileSync(src: string | number, dest: string | number, mode?: number): void
     */
    @!APILevel[
        21,
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
     *  Copies a file.
     *
     * @param { number } [mode = 0] - Whether to overwrite the file with the same name in the destination directory.
     * The default value is 0, which is the only value supported.
     * 0: overwrite the file with the same name and truncate the part that is not overwritten.
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900004 - Interrupted system call
     * @throws { BusinessExecption } 13900005 - I/O error
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900010 - Try again
     * @throws { BusinessExecption } 13900011 - Out of memory
     * @throws { BusinessExecption } 13900012 - Permission denied
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900018 - Not a directory
     * @throws { BusinessExecption } 13900019 - Is a directory
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900030 - File name too long
     * @throws { BusinessExecption } 13900031 - Function not implemented
     * @throws { BusinessExecption } 13900033 - Too many symbolic links encountered
     * @throws { BusinessExecption } 13900034 - Operation would block
     * @throws { BusinessExecption } 13900038 - Value too large for defined data type
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @throws { BusinessExecption } 13900044 - Network is unreachable
     * @relation function copyFileSync(src: string | number, dest: string | number, mode?: number): void
     */
    @!APILevel[
        21,
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
     *  Copies a file.
     *
     * @param { number } [mode = 0] - Whether to overwrite the file with the same name in the destination directory.
     * The default value is 0, which is the only value supported.
     * 0: overwrite the file with the same name and truncate the part that is not overwritten.
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900004 - Interrupted system call
     * @throws { BusinessExecption } 13900005 - I/O error
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900010 - Try again
     * @throws { BusinessExecption } 13900011 - Out of memory
     * @throws { BusinessExecption } 13900012 - Permission denied
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900018 - Not a directory
     * @throws { BusinessExecption } 13900019 - Is a directory
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900030 - File name too long
     * @throws { BusinessExecption } 13900031 - Function not implemented
     * @throws { BusinessExecption } 13900033 - Too many symbolic links encountered
     * @throws { BusinessExecption } 13900034 - Operation would block
     * @throws { BusinessExecption } 13900038 - Value too large for defined data type
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @throws { BusinessExecption } 13900044 - Network is unreachable
     * @relation function copyFileSync(src: string | number, dest: string | number, mode?: number): void
     */
    @!APILevel[
        21,
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
     *  Copies a file.
     *
     * @param { number } [mode = 0] - Whether to overwrite the file with the same name in the destination directory.
     * The default value is 0, which is the only value supported.
     * 0: overwrite the file with the same name and truncate the part that is not overwritten.
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900004 - Interrupted system call
     * @throws { BusinessExecption } 13900005 - I/O error
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900010 - Try again
     * @throws { BusinessExecption } 13900011 - Out of memory
     * @throws { BusinessExecption } 13900012 - Permission denied
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900018 - Not a directory
     * @throws { BusinessExecption } 13900019 - Is a directory
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900030 - File name too long
     * @throws { BusinessExecption } 13900031 - Function not implemented
     * @throws { BusinessExecption } 13900033 - Too many symbolic links encountered
     * @throws { BusinessExecption } 13900034 - Operation would block
     * @throws { BusinessExecption } 13900038 - Value too large for defined data type
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @throws { BusinessExecption } 13900044 - Network is unreachable
     * @relation function copyFileSync(src: string | number, dest: string | number, mode?: number): void
     */
    @!APILevel[
        21,
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
     *  Moves a file.
     *
     * @param { Int32 } [mode!: Int32 = 0] - Move mode.
     * The value 0 means to overwrite the file with the same name in the destination directory;
     * the value 1 means to throw an exception. The default value is 0.
     * @throws { BusinessExecption } 13900001 - Operation not permitted
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900011 - Out of memory
     * @throws { BusinessExecption } 13900012 - Permission denied
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900014 - Device or resource busy
     * @throws { BusinessExecption } 13900015 - File exists
     * @throws { BusinessExecption } 13900016 - Cross-device link
     * @throws { BusinessExecption } 13900018 - Not a directory
     * @throws { BusinessExecption } 13900019 - Is a directory
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900025 - No space left on device
     * @throws { BusinessExecption } 13900027 - Read-only file system
     * @throws { BusinessExecption } 13900028 - Too many links
     * @throws { BusinessExecption } 13900032 - Directory not empty
     * @throws { BusinessExecption } 13900033 - Too many symbolic links encountered
     * @throws { BusinessExecption } 13900041 - Quota exceeded
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @relation function moveFileSync(src: string, dest: string, mode?: number): void
     */
    @!APILevel[
        21,
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
     *  Creates a temporary directory.
     *
     * @throws { BusinessExecption } 13900001 - Operation not permitted
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900011 - Out of memory
     * @throws { BusinessExecption } 13900012 - Permission denied
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900015 - File exists
     * @throws { BusinessExecption } 13900018 - Not a directory
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900025 - No space left on device
     * @throws { BusinessExecption } 13900028 - Too many links
     * @throws { BusinessExecption } 13900030 - File name too long
     * @throws { BusinessExecption } 13900033 - Too many symbolic links encountered
     * @throws { BusinessExecption } 13900041 - Quota exceeded
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @relation function mkdtempSync(prefix: string): string
     */
    @!APILevel[
        21,
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
     *  Creates a stream based on a file path.
     *
     * @param { Int64 } [len!: Int64 = 0] - File length, in bytes, after truncation. The default value is 0.
     * @throws { BusinessExecption } 13900001 - Operation not permitted
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900004 - Interrupted system call
     * @throws { BusinessExecption } 13900005 - I/O error
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900012 - Permission denied
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900018 - Not a directory
     * @throws { BusinessExecption } 13900019 - Is a directory
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900023 - Text file busy
     * @throws { BusinessExecption } 13900024 - File too large
     * @throws { BusinessExecption } 13900027 - Read-only file system
     * @throws { BusinessExecption } 13900030 - File name too long
     * @throws { BusinessExecption } 13900033 - Too many symbolic links encountered
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @relation function truncateSync(file: string | number, len?: number): void
     */
    @!APILevel[
        21,
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
     *  Creates a stream based on a file path.
     *
     * @param { Int64 } [len!: Int64 = 0] - File length, in bytes, after truncation. The default value is 0.
     * @throws { BusinessExecption } 13900001 - Operation not permitted
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900004 - Interrupted system call
     * @throws { BusinessExecption } 13900005 - I/O error
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900012 - Permission denied
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900018 - Not a directory
     * @throws { BusinessExecption } 13900019 - Is a directory
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900023 - Text file busy
     * @throws { BusinessExecption } 13900024 - File too large
     * @throws { BusinessExecption } 13900027 - Read-only file system
     * @throws { BusinessExecption } 13900030 - File name too long
     * @throws { BusinessExecption } 13900033 - Too many symbolic links encountered
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @relation function truncateSync(file: string | number, len?: number): void
     */
    @!APILevel[
        21,
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
     *  Closes a file or directory.
     *
     * @throws { BusinessExecption } 13900004 - Interrupted system call
     * @throws { BusinessExecption } 13900005 - I/O error
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900025 - No space left on device
     * @throws { BusinessExecption } 13900041 - Quota exceeded
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @relation function closeSync(file: number | File): void
     */
    @!APILevel[
        21,
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
     *  Closes a file or directory.
     *
     * @throws { BusinessExecption } 13900004 - Interrupted system call
     * @throws { BusinessExecption } 13900005 - I/O error
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900025 - No space left on device
     * @throws { BusinessExecption } 13900041 - Quota exceeded
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @relation function closeSync(file: number | File): void
     */
    @!APILevel[
        21,
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
     *  Reads the text content of a file line by line.
     *
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900012 - Permission denied
     * @throws { BusinessExecption } 13900015 - File exists
     * @throws { BusinessExecption } 13900019 - Is a directory
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900022 - Too many open files
     * @throws { BusinessExecption } 13900025 - No space left on device
     * @throws { BusinessExecption } 13900027 - Read-only file system
     * @throws { BusinessExecption } 13900030 - File name too long
     * @throws { BusinessExecption } 13900033 - Too many symbolic links encountered
     * @throws { BusinessExecption } 13900041 - Quota exceeded
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @throws { BusinessExecption } 13900044 - Network is unreachable
     * @relation function readLinesSync(filePath: string, options?: Options): ReaderIterator
     */
    @!APILevel[
        21,
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
     *  Adjusts the position of the file offset pointer.
     *
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900026 - Illegal seek
     * @throws { BusinessExecption } 13900038 - Value too large for defined data type
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @relation function lseek(fd: number, offset: number, whence?: WhenceType): number
     */
    @!APILevel[
        21,
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
     *  Synchronizes the data of a file.
     *
     * @throws { BusinessExecption } 13900005 - I/O error
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900025 - No space left on device
     * @throws { BusinessExecption } 13900027 - Read-only file system
     * @throws { BusinessExecption } 13900041 - Quota exceeded
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @relation function fdatasyncSync(fd: number): void
     */
    @!APILevel[
        21,
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
     *  Synchronizes the cached data of a file to storage.
     *
     * @throws { BusinessExecption } 13900005 - I/O error
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900025 - No space left on device
     * @throws { BusinessExecption } 13900027 - Read-only file system
     * @throws { BusinessExecption } 13900041 - Quota exceeded
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @relation function fsyncSync(fd: number): void
     */
    @!APILevel[
        21,
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
     *  Lists all file names in a directory.
     *
     * @param { String } path - Application sandbox path of the directory.
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900011 - Out of memory
     * @throws { BusinessExecption } 13900018 - Not a directory
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @relation declare function listFileSync(path: string, options?: ListFileOptions): string[]
     */
    @!APILevel[
        21,
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
     *  Reads the text of a file.
     *
     * @throws { BusinessExecption } 13900001 - Operation not permitted
     * @throws { BusinessExecption } 13900004 - Interrupted system call
     * @throws { BusinessExecption } 13900005 - I/O error
     * @throws { BusinessExecption } 13900008 - Bad file descriptor
     * @throws { BusinessExecption } 13900010 - Try again
     * @throws { BusinessExecption } 13900013 - Bad address
     * @throws { BusinessExecption } 13900019 - Is a directory
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900024 - File too large
     * @throws { BusinessExecption } 13900025 - No space left on device
     * @throws { BusinessExecption } 13900034 - Operation would block
     * @throws { BusinessExecption } 13900041 - Quota exceeded
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @throws { BusinessExecption } 13900044 - Network is unreachable
     * @relation function readTextSync(filePath: string, options?: ReadTextOptions): string
     */
    @!APILevel[
        21,
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
     *  Updates the latest access timestamp of a file.
     *
     * @param { number } mtime - New timestamp. The value is the number of milliseconds elapsed since the Epoch time (00:00:00 UTC on January 1, 1970)
     * @throws { BusinessExecption } 13900001 - Operation not permitted
     * @throws { BusinessExecption } 13900002 - No such file or directory
     * @throws { BusinessExecption } 13900012 - Permission denied
     * @throws { BusinessExecption } 13900020 - Invalid argument
     * @throws { BusinessExecption } 13900027 - Read-only file system
     * @throws { BusinessExecption } 13900042 - Unknown error
     * @relation function utimes(path: string, mtime: number): void
     */
    @!APILevel[
        21,
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
