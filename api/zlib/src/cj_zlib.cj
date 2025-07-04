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

package ohos.zlib

import ohos.labels.APILevel
import ohos.ffi.*
import ohos.base.*
import std.deriving.Derive

foreign {
    func FfiBundleManagerCompressFile(inFile: CString, outFile: CString, options: RetOptions): Int32

    func FfiBundleManagerDeCompressFileOptions(inFile: CString, outFile: CString, options: RetOptions): Int32

    func FfiBundleManagerDeCompressFile(inFile: CString, outFile: CString): Int32

    func FfiBundleManagerCompressFiles(args: CArrString, outFile: CString, options: RetOptions): Int32

    func FfiBundleManagerGetOriginalSize(compressedFile: CString, errCode: CPointer<Int32>): Int64
}

/**
 * CompressLevel
 *
 * @relation export enum CompressLevel
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.Zlib"
]
public enum CompressLevel {
    /**
     * Indicates the no compression mode.
     *
     * @relation COMPRESS_LEVEL_NO_COMPRESSION = 0
     */
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    COMPRESS_LEVEL_NO_COMPRESSION

    /**
     * Indicates the best speed mode.
     *
     * @relation COMPRESS_LEVEL_BEST_SPEED = 1
     */
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    COMPRESS_LEVEL_BEST_SPEED

    /**
     * Indicates the best compression mode.
     *
     * @relation COMPRESS_LEVEL_BEST_COMPRESSION = 9
     */
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    COMPRESS_LEVEL_BEST_COMPRESSION

    /**
     * Indicates the default compression mode.
     *
     * @relation COMPRESS_LEVEL_DEFAULT_COMPRESSION = -1
     */
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    COMPRESS_LEVEL_DEFAULT_COMPRESSION
    | ...

    func getValue(): Int32 {
        match (this) {
            case COMPRESS_LEVEL_NO_COMPRESSION => 0
            case COMPRESS_LEVEL_BEST_SPEED => 1
            case COMPRESS_LEVEL_BEST_COMPRESSION => 9
            case COMPRESS_LEVEL_DEFAULT_COMPRESSION => -1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * MemLevel
 *
 * @relation export enum MemLevel
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.Zlib"
]
public enum MemLevel {
    /**
     * Uses the least amount of memory.
     *
     * @relation MEM_LEVEL_MIN = 1
     */
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    MEM_LEVEL_MIN

    /**
     * Uses the default amount of memory.
     *
     * @relation MEM_LEVEL_DEFAULT = 8
     */
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    MEM_LEVEL_DEFAULT

    /**
     * Uses the maximum amount of memory.
     *
     * @relation MEM_LEVEL_MAX = 9
     */
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    MEM_LEVEL_MAX
    | ...

    func getValue(): Int32 {
        match (this) {
            case MEM_LEVEL_MIN => 1
            case MEM_LEVEL_DEFAULT => 8
            case MEM_LEVEL_MAX => 9
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * CompressStrategy
 *
 * @relation export enum CompressStrategy
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.Zlib"
]
public enum CompressStrategy {
    /**
     * Indicates the default strategy.
     *
     * @relation COMPRESS_STRATEGY_DEFAULT_STRATEGY = 0
     */
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    COMPRESS_STRATEGY_DEFAULT_STRATEGY

    /**
     * Indicates the filtered strategy.
     *
     * @relation COMPRESS_STRATEGY_FILTERED = 1
     */
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    COMPRESS_STRATEGY_FILTERED

    /**
     * Indicates the huffman-only strategy.
     *
     * @relation COMPRESS_STRATEGY_HUFFMAN_ONLY = 2
     */
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    COMPRESS_STRATEGY_HUFFMAN_ONLY

    /**
     * Indicates the RLE strategy.
     *
     * @relation COMPRESS_STRATEGY_RLE = 3
     */
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    COMPRESS_STRATEGY_RLE

    /**
     * Indicates the fixed strategy.
     *
     * @relation COMPRESS_STRATEGY_FIXED = 4
     */
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    COMPRESS_STRATEGY_FIXED
    | ...

    func getValue(): Int32 {
        match (this) {
            case COMPRESS_STRATEGY_DEFAULT_STRATEGY => 0
            case COMPRESS_STRATEGY_FILTERED => 1
            case COMPRESS_STRATEGY_HUFFMAN_ONLY => 2
            case COMPRESS_STRATEGY_RLE => 3
            case COMPRESS_STRATEGY_FIXED => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Return codes for the compression/decompression functions.
 *
 * @relation export enum ReturnStatus
 */
@Derive[ToString, Equatable]
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.Zlib"
]
public enum ReturnStatus {
    /**
     * Indicates success.
     *
     * @relation OK = 0
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    Ok

    /**
     * Indicates that the entire data has been processed.
     *
     * @relation STREAM_END = 1
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    StreamEnd

    /**
     * Indicates preset dictionary is required to continue decompression.
     *
     * @relation NEED_DICT = 2
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    NeedDict
    | ...

    func getValue(): Int32 {
        match (this) {
            case Ok => 0
            case StreamEnd => 1
            case NeedDict => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): ReturnStatus {
        match (val) {
            case 0 => Ok
            case 1 => StreamEnd
            case 2 => NeedDict
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * ParallelStrategy
 *
 * @syscap export enum ParallelStrategy
 */
@Derive[ToString, Equatable]
@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.Zlib"
]
public enum ParallelStrategy {
    /**
     * Indicates the sequential strategy, compress and decompress sequentially.
     *
     * @syscap PARALLEL_STRATEGY_SEQUENTIAL = 0
     */
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    ParallelStrategySequential

    /**
     * Indicates the parallel decompression strategy.
     *
     * @syscap PARALLEL_STRATEGY_PARALLEL_DECOMPRESSION = 1
     */
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    ParallelStrategyParallelDecompression
    | ...

    func getValue(): Int32 {
        match (this) {
            case ParallelStrategySequential => 0
            case ParallelStrategyParallelDecompression => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * CompressFlushMode
 *
 * @relation export enum CompressFlushMode
 */
@Derive[ToString, Equatable]
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.Zlib"
]
public enum CompressFlushMode {
    /**
     * Default value, indicating normal operation.
     *
     * @relation NO_FLUSH = 0
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    NoFlush

    /**
     * Generate partial refresh points in compressed streams.
     *
     * @relation PARTIAL_FLUSH = 1
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    PartialFlush

    /**
     * Force output of all compressed data while maintaining the compressed stream state.
     *
     * @relation SYNC_FLUSH = 2
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    SyncFlush

    /**
     * the compression state is reset.
     *
     * @relation FULL_FLUSH = 3
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    FullFlush

    /**
     * The compression or decompression process ends.
     *
     * @relation FINISH = 4
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    Finish

    /**
     * Allow for finer grained control.
     *
     * @relation BLOCK = 5
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    Block

    /**
     * There are special purposes in implementation.
     *
     * @relation TREES = 6
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    Trees
    | ...

    func getValue(): Int32 {
        match (this) {
            case NoFlush => 0
            case PartialFlush => 1
            case SyncFlush => 2
            case FullFlush => 3
            case Finish => 4
            case Block => 5
            case Trees => 6
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Compress the specified file.
 *
 * @param { String } inFile - Indicates the path of the file to be compressed.
 * @param { String } outFile - Indicates the path of the output compressed file.
 * @param { ZipOptions } options - Indicates the options of compressing file.
 * @throws { BusinessException } 401 - The parameter check failed.
 * @throws { BusinessException } 900001 - The input source file is invalid.
 * @throws { BusinessException } 900002 - The input destination file is invalid.
 * @relation compressFile(inFile: string, outFile: string, options: Options, callback: AsyncCallback<void>): void;
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.Zlib"
]
public func compressFile(inFile: String, outFile: String, options: ZipOptions): Unit {
    unsafe {
        try (
            cInFile = LibC.mallocCString(inFile).asResource(),
            cOutFile = LibC.mallocCString(outFile).asResource()
        ) {
            let cOptions = RetOptions(options)
            let code = FfiBundleManagerCompressFile(cInFile.value, cOutFile.value, cOptions)

            if (code != SUCCESS_CODE) {
                throw BusinessException(code, getErrorMsg(code))
            }
        }
    }
}

/**
 * Decompress the specified file.
 *
 * @param { String } inFile - Indicates the path of the file to be decompressed.
 * @param { String } outFile - Indicates the path of the output decompressed file.
 * @param { Option<ZipOptions> } options - Indicates the options of decompressing file.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
 *     2. Incorrect parameter types.
 * @throws { BusinessException } 900001 - The input source file is invalid.
 * @throws { BusinessException } 900002 - The input destination file is invalid.
 * @throws { BusinessException } 900003 - The input source file is not in ZIP format or is damaged.
 * @relation decompressFile(inFile: string, outFile: string, options: Options, callback: AsyncCallback<void>): void;
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.Zlib"
]
public func deCompressFile(inFile: String, outFile: String, options!: Option<ZipOptions> = None): Unit {
    unsafe {
        try (
            cInFile = LibC.mallocCString(inFile).asResource(),
            cOutFile = LibC.mallocCString(outFile).asResource()
        ) {
            let code = if (let Some(v) <- options) {
                let cOptions = RetOptions(v)
                FfiBundleManagerDeCompressFileOptions(cInFile.value, cOutFile.value, cOptions)
            } else {
                FfiBundleManagerDeCompressFile(cInFile.value, cOutFile.value)
            }
            if (code != SUCCESS_CODE) {
                throw BusinessException(code, getErrorMsg(code))
            }
        }
    }
}

/**
 * Compress the specified multiple files.
 *
 * @throws { BusinessException } 17800009 - Internal structure error.
 * @throws { BusinessException } 900001 - The input source file is invalid.
 * @throws { BusinessException } 900002 - The input destination file is invalid.
 * @relation function compressFiles(inFiles: Array<string>, outFile: string, options: Options): Promise<void>
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.Zlib"
]
public func compressFiles(inFiles: Array<String>, outFile: String, options: ZipOptions): Unit {
    let ptr = unsafe { cjArr2CArr<String, CString>(inFiles, {cstr => LibC.mallocCString(cstr)}) {
        cstr => LibC.free(cstr)
    } }
    let cargs = CArrString(ptr, inFiles.size)
    try (cOutFile = unsafe { LibC.mallocCString(outFile) }.asResource()) {
        let cOptions = RetOptions(options)
        let errCode = unsafe { FfiBundleManagerCompressFiles(cargs, cOutFile.value, cOptions) }
        checkAndThrow(errCode)
    } finally {
        cargs.free()
    }
}

/**
 * Get the original size of the compressed zip file, the size is the meta data stored in zip file.
 *
 * @throws { BusinessException } 17800009 - Internal structure error.
 * @throws { BusinessException } 900001 - The input source file is invalid.
 * @throws { BusinessException } 900003 - The input source file is not in ZIP format or is damaged.
 * @relation function getOriginalSize(compressedFile: string): Promise<number>
 */
@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.Zlib"
]
public func getOriginalSize(compressedFile: String): Int64 {
    let cStr = unsafe { LibC.mallocCString(compressedFile) }
    var errCode: Int32 = 0
    let ret = unsafe { FfiBundleManagerGetOriginalSize(cStr, inout errCode) }
    unsafe { LibC.free(cStr) }
    checkAndThrow(errCode)
    return ret
}
