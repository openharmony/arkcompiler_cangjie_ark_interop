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
    func FfiBundleManagerZipInstCreate(): UIntNative

    func FfiBundleManagerZipInstDestroy(ffiInst: UIntNative): Unit

    func FfiBundleManagerZipCompress(ffiInst: UIntNative, param: CPointer<ZipCompressParam>, errCode: CPointer<Int32>): Unit

    func FfiBundleManagerZipCompress2(ffiInst: UIntNative, param: CPointer<ZipCompressParam>, errCode: CPointer<Int32>): Unit

    func FfiBundleManagerZipCompressBound(ffiInst: UIntNative, sourceLen: Int32, errCode: CPointer<Int32>): Int32

    func FfiBundleManagerZipDeflate(ffiInst: UIntNative, cStrm: CPointer<CZStream>, flush: Int32,
        errCode: CPointer<Int32>): Int32

    func FfiBundleManagerZipDeflateEnd(ffiInst: UIntNative, cStrm: CPointer<CZStream>, errCode: CPointer<Int32>): Int32

    func FfiBundleManagerZipDeflateInit2(ffiInst: UIntNative, cStrm: CPointer<CZStream>,
        param: CPointer<DeflateInit2Param>, errCode: CPointer<Int32>): Int32

    func FfiBundleManagerZipGetZStream(ffiInst: UIntNative, cStrm: CPointer<CZStream>, errCode: CPointer<Int32>): Unit

    func FfiBundleManagerZipInflate(ffiInst: UIntNative, cStrm: CPointer<CZStream>, flush: Int32,
        errCode: CPointer<Int32>): Int32

    func FfiBundleManagerZipInflateEnd(ffiInst: UIntNative, cStrm: CPointer<CZStream>, errCode: CPointer<Int32>): Int32

    func FfiBundleManagerZipInflateInit(ffiInst: UIntNative, cStrm: CPointer<CZStream>, errCode: CPointer<Int32>): Int32

    func FfiBundleManagerZipInflateInit2(ffiInst: UIntNative, cStrm: CPointer<CZStream>, windowBits: Int32,
        errCode: CPointer<Int32>): Int32

    func FfiBundleManagerZipUnCompress(ffiInst: UIntNative, param: CPointer<ZipCompressParam>, errCode: CPointer<Int32>): Unit
}

/**
 * Compression and decompression return value information.
 *
 * @relation interface ZipOutputInfo
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.Zlib"
]
public class ZipOutputInfo {
    /**
     * ReturnStatus the specific meaning is defined as enum.
     *
     * @relation status: ReturnStatus
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public let status: ReturnStatus

    /**
     * Total sizeof the destination buffer.
     *
     * @relation destLen: number
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public let destLen: Int64

    init(status: ReturnStatus, destLen: Int64) {
        this.status = status
        this.destLen = destLen
    }
}

/**
 * The deflate compression method (the only one supported in this version).
 *
 * @relation export enum CompressMethod
 */
@Derive[ToString, Equatable]
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.Zlib"
]
public enum CompressMethod {
    /**
     * Compression method.
     *
     * @relation DEFLATED = 8
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    Deflated
    | ...

    func getValue(): Int32 {
        match (this) {
            case Deflated => 8
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@C
struct ZipCompressParam {
    ZipCompressParam(
        var destBuf: CPointer<Byte>,
        var destBufLen: Int64,
        var srcBuf: CPointer<Byte>,
        var srcBufLen: Int64,
        var outStatus!: Int32 = 0,
        var outDestLen!: Int64 = 0,
        var level!: Int32 = 0
    ) {}
}

@C
struct DeflateInit2Param {
    DeflateInit2Param(
        let level: Int32,
        let method: Int32,
        let windowBits: Int32,
        let memLevel: Int32,
        let strategy: Int32
    ) {}
}

/**
 * Deflate and inflate interface.
 *
 * @relation interface Zip
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.Zlib"
]
public class Zip {
    let ffiInst: UIntNative
    init() {
        this.ffiInst = unsafe { FfiBundleManagerZipInstCreate() }
    }

    ~init() {
        unsafe { FfiBundleManagerZipInstDestroy(this.ffiInst) }
    }

    /**
     * Compresses the source buffer into the destination buffer.
     *
     * @throws { BusinessException } 17800007 - Buffer error.
     * @throws { BusinessException } 17800009 - Internal structure error.
     * @throws { IllegalArgumentException } - The parameter check failed.
     * @relation compress(dest: ArrayBuffer, source: ArrayBuffer, sourceLen?: number): Promise<ZipOutputInfo>;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public func compress(dest: Array<Byte>, source: Array<Byte>, sourceLen!: Int64 = 0): ZipOutputInfo {
        var errCode: Int32 = 0
        if (sourceLen > source.size || sourceLen < 0) {
            throw IllegalArgumentException("The parameter check failed")
        }
        let trueSrcSize = if (sourceLen == 0) {
            source.size
        } else {
            sourceLen
        }
        let vpDest = unsafe { acquireArrayRawData(dest) }
        let vpSource = unsafe { acquireArrayRawData(source) }
        var param = ZipCompressParam(vpDest.pointer, dest.size, vpSource.pointer, trueSrcSize)
        unsafe {
            FfiBundleManagerZipCompress(ffiInst, inout param, inout errCode)
            releaseArrayRawData(vpDest)
            releaseArrayRawData(vpSource)
        }
        checkAndThrow(errCode)
        return ZipOutputInfo(ReturnStatus.parse(param.outStatus), param.outDestLen)
    }

    /**
     * Compresses the source buffer into the destination buffer.
     *
     * @throws { BusinessException } 17800004 - ZStream error.
     * @throws { BusinessException } 17800007 - Buffer error.
     * @throws { BusinessException } 17800009 - Internal structure error.
     * @throws { IllegalArgumentException } - The parameter check failed.
     * @relation compress2(dest: ArrayBuffer, source: ArrayBuffer, level: CompressLevel,
     *     sourceLen?: number,): Promise<ZipOutputInfo>;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public func compress2(dest: Array<Byte>, source: Array<Byte>, level: CompressLevel, sourceLen!: Int64 = 0): ZipOutputInfo {
        var errCode: Int32 = 0
        if (sourceLen > source.size || sourceLen < 0) {
            throw IllegalArgumentException("The parameter check failed")
        }
        let trueSrcSize = if (sourceLen == 0) {
            source.size
        } else {
            sourceLen
        }
        let vpDest = unsafe { acquireArrayRawData(dest) }
        let vpSource = unsafe { acquireArrayRawData(source) }
        var param = ZipCompressParam(vpDest.pointer, dest.size, vpSource.pointer, trueSrcSize)
        param.level = level.getValue()
        unsafe {
            FfiBundleManagerZipCompress2(ffiInst, inout param, inout errCode)
            releaseArrayRawData(vpDest)
            releaseArrayRawData(vpSource)
        }
        checkAndThrow(errCode)
        return ZipOutputInfo(ReturnStatus.parse(param.outStatus), param.outDestLen)
    }

    /**
     * Calculate the upper limit of the return compression size.
     *
     * @throws { BusinessException } 17800009 - Internal structure error.
     * @throws { IllegalArgumentException } - The parameter check failed.
     * @relation compressBound(sourceLen: number): Promise<number>;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public func compressBound(sourceLen: Int32): Int32 {
        var errCode: Int32 = 0
        if (sourceLen < 0) {
            throw IllegalArgumentException("The parameter check failed")
        }
        let ret = unsafe { FfiBundleManagerZipCompressBound(ffiInst, sourceLen, inout errCode) }
        checkAndThrow(errCode)
        return ret
    }

    /**
     * Compresses as much data as possible, and stops when the input buffer becomes empty or the output buffer
     * becomes full.
     *
     * @throws { BusinessException } 17800004 - ZStream error.
     * @throws { BusinessException } 17800007 - Buffer error.
     * @throws { BusinessException } 17800009 - Internal structure error.
     * @throws { IllegalArgumentException } - The parameter check failed.
     * @relation deflate(strm: ZStream, flush: CompressFlushMode): Promise<ReturnStatus>
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public func deflate(strm: ZStream, flush: CompressFlushMode): ReturnStatus {
        strm.checkAndThrow()
        var errCode: Int32 = 0
        var cStrm = CZStream()
        let (nextInVp, nextOutVp) = unsafe { cStrm.initWithRawPtr(strm) }
        let ret = unsafe { FfiBundleManagerZipDeflate(ffiInst, inout cStrm, flush.getValue(), inout errCode) }
        unsafe { cStrm.destroyRawPtr(nextInVp, nextOutVp) }
        checkAndThrow(errCode)
        return ReturnStatus.parse(ret)
    }

    /**
     * All dynamically allocated data structures for this stream are freed.
     *
     * @throws { BusinessException } 17800004 - ZStream error.
     * @throws { BusinessException } 17800009 - Internal structure error.
     * @throws { IllegalArgumentException } - The parameter check failed.
     * @relation deflateEnd(strm: ZStream): Promise<ReturnStatus>
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public func deflateEnd(strm: ZStream): ReturnStatus {
        strm.checkAndThrow()
        var errCode: Int32 = 0
        var cStrm = CZStream()
        let (nextInVp, nextOutVp) = unsafe { cStrm.initWithRawPtr(strm) }
        let ret = unsafe { FfiBundleManagerZipDeflateEnd(ffiInst, inout cStrm, inout errCode) }
        unsafe { cStrm.destroyRawPtr(nextInVp, nextOutVp) }
        checkAndThrow(errCode)
        return ReturnStatus.parse(ret)
    }

    /**
     * Initializes the internal stream state for compression.
     *
     * @throws { BusinessException } 17800004 - ZStream error.
     * @throws { BusinessException } 17800009 - Internal structure error.
     * @throws { IllegalArgumentException } - The parameter check failed.
     * @relation deflateInit2(strm: ZStream, level: CompressLevel, method: CompressMethod, windowBits: number,
     *      memLevel: MemLevel, strategy: CompressStrategy): Promise<ReturnStatus>
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public func deflateInit2(strm: ZStream, level: CompressLevel, method: CompressMethod, windowBits: Int32,
        memLevel: MemLevel, strategy: CompressStrategy): ReturnStatus {
        strm.checkAndThrow()
        var errCode: Int32 = 0
        var cStrm = CZStream()
        let (nextInVp, nextOutVp) = unsafe { cStrm.initWithRawPtr(strm) }
        var param = DeflateInit2Param(level.getValue(), method.getValue(), windowBits, memLevel.getValue(),
            strategy.getValue())
        let ret = unsafe { FfiBundleManagerZipDeflateInit2(ffiInst, inout cStrm, inout param, inout errCode) }
        unsafe { cStrm.destroyRawPtr(nextInVp, nextOutVp) }
        checkAndThrow(errCode)
        return ReturnStatus.parse(ret)
    }

    /**
     * Get ZStream.
     *
     * @throws { BusinessException } 17800009 - Internal structure error.
     * @relation getZStream(): Promise<ZStream>
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public func getZStream(): ZStream {
        var errCode: Int32 = 0
        var cStrm = CZStream()
        unsafe { FfiBundleManagerZipGetZStream(ffiInst, inout cStrm, inout errCode) }
        checkAndThrow(errCode)
        return ZStream.parse(cStrm)
    }

    /**
     * Decompresses as much data as possible, and stops when the input buffer becomes empty or the output buffer
     * becomes full.
     *
     * @throws { BusinessException } 17800004 - ZStream error.
     * @throws { BusinessException } 17800005 - Data error.
     * @throws { BusinessException } 17800009 - Internal structure error.
     * @throws { IllegalArgumentException } - The parameter check failed.
     * @relation inflate(strm: ZStream, flush: CompressFlushMode): Promise<ReturnStatus>
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public func inflate(strm: ZStream, flush: CompressFlushMode): ReturnStatus {
        strm.checkAndThrow()
        var errCode: Int32 = 0
        var cStrm = CZStream()
        let (nextInVp, nextOutVp) = unsafe { cStrm.initWithRawPtr(strm) }
        let ret = unsafe { FfiBundleManagerZipInflate(ffiInst, inout cStrm, flush.getValue(), inout errCode) }
        unsafe { cStrm.destroyRawPtr(nextInVp, nextOutVp) }
        checkAndThrow(errCode)
        return ReturnStatus.parse(ret)
    }

    /**
     * All dynamically allocated data structures for this stream are freed.
     *
     * @throws { BusinessException } 17800004 - ZStream error.
     * @throws { BusinessException } 17800009 - Internal structure error.
     * @throws { IllegalArgumentException } - The parameter check failed.
     * @relation inflateEnd(strm: ZStream): Promise<ReturnStatus>
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public func inflateEnd(strm: ZStream): ReturnStatus {
        strm.checkAndThrow()
        var errCode: Int32 = 0
        var cStrm = CZStream()
        let (nextInVp, nextOutVp) = unsafe { cStrm.initWithRawPtr(strm) }
        let ret = unsafe { FfiBundleManagerZipInflateEnd(ffiInst, inout cStrm, inout errCode) }
        unsafe { cStrm.destroyRawPtr(nextInVp, nextOutVp) }
        checkAndThrow(errCode)
        return ReturnStatus.parse(ret)
    }

    /**
     * Initializes the internal stream state for decompression.
     *
     * @throws { BusinessException } 17800009 - Internal structure error.
     * @throws { IllegalArgumentException } - The parameter check failed.
     * @relation inflateInit(strm: ZStream): Promise<ReturnStatus>
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public func inflateInit(strm: ZStream): ReturnStatus {
        strm.checkAndThrow()
        var errCode: Int32 = 0
        var cStrm = CZStream()
        let (nextInVp, nextOutVp) = unsafe { cStrm.initWithRawPtr(strm) }
        let ret = unsafe { FfiBundleManagerZipInflateInit(ffiInst, inout cStrm, inout errCode) }
        unsafe { cStrm.destroyRawPtr(nextInVp, nextOutVp) }
        checkAndThrow(errCode)
        return ReturnStatus.parse(ret)
    }

    /**
     * Initializes the internal stream state for decompression.
     *
     * @throws { BusinessException } 17800004 - ZStream error.
     * @throws { BusinessException } 17800009 - Internal structure error.
     * @throws { IllegalArgumentException } - The parameter check failed.
     * @relation inflateInit2(strm: ZStream, windowBits: number): Promise<ReturnStatus>
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public func inflateInit2(strm: ZStream, windowBits: Int32): ReturnStatus {
        strm.checkAndThrow()
        var errCode: Int32 = 0
        var cStrm = CZStream()
        let (nextInVp, nextOutVp) = unsafe { cStrm.initWithRawPtr(strm) }
        let ret = unsafe { FfiBundleManagerZipInflateInit2(ffiInst, inout cStrm, windowBits, inout errCode) }
        unsafe { cStrm.destroyRawPtr(nextInVp, nextOutVp) }
        checkAndThrow(errCode)
        return ReturnStatus.parse(ret)
    }

    /**
     * Decompress the compressed data into its original uncompressed form.
     *
     * @throws { BusinessException } 17800005 - Data error.
     * @throws { BusinessException } 17800007 - Buffer error.
     * @throws { BusinessException } 17800009 - Internal structure error.
     * @throws { IllegalArgumentException } - The parameter check failed.
     * @relation uncompress(dest:ArrayBuffer, source: ArrayBuffer, sourceLen?: number): Promise<ZipOutputInfo>
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public func uncompress(dest: Array<Byte>, source: Array<Byte>, sourceLen!: Int64 = 0): ZipOutputInfo {
        var errCode: Int32 = 0
        if (sourceLen > source.size || sourceLen < 0) {
            throw IllegalArgumentException("The parameter check failed")
        }
        let trueSrcSize = if (sourceLen == 0) {
            source.size
        } else {
            sourceLen
        }
        let vpDest = unsafe { acquireArrayRawData(dest) }
        let vpSource = unsafe { acquireArrayRawData(source) }
        var param = ZipCompressParam(vpDest.pointer, dest.size, vpSource.pointer, trueSrcSize)
        unsafe {
            FfiBundleManagerZipUnCompress(ffiInst, inout param, inout errCode)
            releaseArrayRawData(vpDest)
            releaseArrayRawData(vpSource)
        }
        checkAndThrow(errCode)
        return ZipOutputInfo(ReturnStatus.parse(param.outStatus), param.outDestLen)
    }
}

/**
 * Synchronize creation of zip objects.
 *
 * @relation function createZip(): Promise<Zip>
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.Zlib"
]
public func createZip(): Zip {
    return Zip()
}
