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
import ohos.base.*

foreign {
    func FfiBundleManagerGZipInstCreate(): UIntNative

    func FfiBundleManagerGZipInstDestroy(ffiInst: UIntNative): Unit

    func FfiBundleManagerGZipDopen(ffiInst: UIntNative, fd: Int32, mode: CString, errCode: CPointer<Int32>): Unit

    func FfiBundleManagerGZipOpen(ffiInst: UIntNative, path: CString, mode: CString, errCode: CPointer<Int32>): Unit

    func FfiBundleManagerGZipEof(ffiInst: UIntNative, errCode: CPointer<Int32>): Int32

    func FfiBundleManagerGZipClose(ffiInst: UIntNative, errCode: CPointer<Int32>): Int32

    func FfiBundleManagerGZipWrite(ffiInst: UIntNative, buf: CPointer<Byte>, len: Int64, errCode: CPointer<Int32>): Int64

    func FfiBundleManagerGZipRead(ffiInst: UIntNative, buf: CPointer<Byte>, len: Int64, errCode: CPointer<Int32>): Int64

    func FfiBundleManagerGZipPuts(ffiInst: UIntNative, cstr: CString, errCode: CPointer<Int32>): Int32

    func FfiBundleManagerGZipGets(ffiInst: UIntNative, buf: CPointer<Byte>, len: Int64, errCode: CPointer<Int32>): CString
}

/**
 * Gzip related interfaces.
 *
 * @relation interface GZip
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.Zlib"
]
public class GZip {
    let ffiInst: UIntNative
    init() {
        this.ffiInst = unsafe { FfiBundleManagerGZipInstCreate() }
    }

    ~init() {
        unsafe { FfiBundleManagerGZipInstDestroy(this.ffiInst) }
    }
    /**
     * Associate a gzFile with the file descriptor fd.
     *
     * @throws { BusinessException } 17800002 - No such file or access mode error.
     * @throws { BusinessException } 17800009 - Internal structure error.
     * @relation gzdopen(fd: number, mode: string): Promise<void>
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public func gzdopen(fd: Int32, mode: String): Unit {
        try (cMode = unsafe { LibC.mallocCString(mode) }.asResource()) {
            var errCode: Int32 = 0
            unsafe { FfiBundleManagerGZipDopen(ffiInst, fd, cMode.value, inout errCode) }
            checkAndThrow(errCode)
            return
        }
    }

    /**
     * Open the gzip (.gz) file at path for reading and decompressing, or compressing and writing.
     *
     * @throws { BusinessException } 17800002 - No such file or access mode error.
     * @throws { BusinessException } 17800009 - Internal structure error.
     * @relation gzopen(path: string, mode: string): Promise<void>
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public func gzopen(path: String, mode: String): Unit {
        try (
            cPath = unsafe { LibC.mallocCString(path) }.asResource(),
            cMode = unsafe { LibC.mallocCString(mode) }.asResource()
        ) {
            var errCode: Int32 = 0
            unsafe { FfiBundleManagerGZipOpen(ffiInst, cPath.value, cMode.value, inout errCode) }
            checkAndThrow(errCode)
            return
        }
    }

    /**
     * Check if the reading position of the gzip compressed file has reached the end of the file.
     *
     * @throws { BusinessException } 17800009 - Internal structure error.
     * @relation gzeof(): Promise<number>
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public func gzeof(): Int32 {
        var errCode: Int32 = 0
        let ret = unsafe { FfiBundleManagerGZipEof(ffiInst, inout errCode) }
        checkAndThrow(errCode)
        return ret
    }

    /**
     * Flush all pending output for file, if necessary, close file and deallocate the (de)compression state.
     *
     * @throws { BusinessException } 17800004 - ZStream error.
     * @throws { BusinessException } 17800006 - Memory allocation failed.
     * @throws { BusinessException } 17800009 - Internal structure error.
     * @relation gzclose(): Promise<ReturnStatus>
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public func gzclose(): ReturnStatus {
        var errCode: Int32 = 0
        let ret = unsafe { FfiBundleManagerGZipClose(ffiInst, inout errCode) }
        checkAndThrow(errCode)
        return ReturnStatus.parse(ret)
    }

    /**
     * Compress and write the len uncompressed bytes at buf to file.
     *
     * @throws { IllegalArgumentException } - The parameter check failed.
     * @throws { BusinessException } 17800009 - Internal structure error.
     * @relation gzwrite(buf: ArrayBuffer, len: number): Promise<number>
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public func gzwrite(buf: Array<Byte>, len: Int64): Int64 {
        if (len > buf.size || len < 0) {
            throw IllegalArgumentException("The parameter check failed")
        }
        var errCode: Int32 = 0
        let vp = unsafe { acquireArrayRawData(buf) }
        let ret = unsafe { FfiBundleManagerGZipWrite(ffiInst, vp.pointer, len, inout errCode) }
        unsafe { releaseArrayRawData(vp) }
        checkAndThrow(errCode)
        return ret
    }

    /**
     * Read and decompress up to len uncompressed bytes from file into buf.
     *
     * @throws { BusinessException } 17800009 - Internal structure error.
     * @relation gzread(buf: ArrayBuffer): Promise<number>
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public func gzread(buf: Array<Byte>): Int64 {
        var errCode: Int32 = 0
        let vp = unsafe { acquireArrayRawData(buf) }
        let ret = unsafe { FfiBundleManagerGZipRead(ffiInst, vp.pointer, buf.size, inout errCode) }
        unsafe { releaseArrayRawData(vp) }
        checkAndThrow(errCode)
        return ret
    }

    /**
     * Compress and write the given null-terminated string s to file, excluding the terminating null character.
     *
     * @throws { BusinessException } 17800009 - Internal structure error.
     * @relation gzputs(str: string): Promise<number>
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public func gzputs(str: String): Int32 {
        var errCode: Int32 = 0
        let cstr = unsafe { LibC.mallocCString(str) }
        let ret = unsafe { FfiBundleManagerGZipPuts(ffiInst, cstr, inout errCode) }
        unsafe { LibC.free(cstr) }
        checkAndThrow(errCode)
        return ret
    }

    /**
     * Read and decompress bytes from file into buf, until len-1 characters are read, or until a newline character
     * is read and transferred to buf, or an end-of-file condition is encountered.
     *
     * @throws { BusinessException } 17800009 - Internal structure error.
     * @relation gzgets(buf: ArrayBuffer): Promise<string>
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public func gzgets(buf: Array<Byte>): String {
        var errCode: Int32 = 0
        let vp = unsafe { acquireArrayRawData(buf) }
        let cstr = unsafe { FfiBundleManagerGZipGets(ffiInst, vp.pointer, buf.size, inout errCode) }
        unsafe { releaseArrayRawData(vp) }
        checkAndThrow(errCode)
        let ret = cstr.toString()
        // Do not release the cstr memory because it points to the buf!
        return ret
    }
}

/**
 * Synchronize creation of gzip objects.
 *
 * @relation function createGZip(): Promise<GZip>
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.Zlib"
]
public func createGZip(): GZip {
    return GZip()
}
