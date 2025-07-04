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
    func FfiBundleManagerChecksumInstCreate(): UIntNative

    func FfiBundleManagerChecksumInstDestroy(ffiInst: UIntNative): Unit

    func FfiBundleManagerChecksumCrc32(ffiInst: UIntNative, crc: UInt64, buf: CPointer<Byte>, len: UInt64,
        errCode: CPointer<Int32>): UInt64
}

/**
 * Calculate Adler-32 and CRC-32 checksum.
 *
 * @relation interface Checksum
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.Zlib"
]
public class Checksum {
    let ffiInst: UIntNative
    init() {
        this.ffiInst = unsafe { FfiBundleManagerChecksumInstCreate() }
    }

    ~init() {
        unsafe { FfiBundleManagerChecksumInstDestroy(this.ffiInst) }
    }

    /**
     * Update a running CRC-32 with the bytes buf.
     *
     * @throws { BusinessException } 17800009 - Internal structure error.
     * @relation crc32(crc: number, buf: ArrayBuffer): Promise<number>
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public func crc32(crc: UInt64, buf: Array<Byte>): UInt64 {
        var errCode: Int32 = 0
        let vp = unsafe { acquireArrayRawData(buf) }
        let ret = unsafe { FfiBundleManagerChecksumCrc32(ffiInst, crc, vp.pointer, UInt64(buf.size), inout errCode) }
        unsafe { releaseArrayRawData(vp) }
        checkAndThrow(errCode)
        return ret
    }
}

/**
 * Synchronize creation of verification objects.
 *
 * @relation function createChecksum(): Promise<Checksum>
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.Zlib"
]
public func createChecksum(): Checksum {
    return Checksum()
}
