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

/**
 * Process all the information required for compression and decompression.
 *
 * @relation interface ZStream
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.Zlib"
]
public class ZStream {
    /**
     * Next input byte.
     *
     * @relation nextIn?: ArrayBuffer
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public let nextIn: ?Array<Byte>

    /**
     * Number of bytes available at nextIn.
     *
     * @relation availableIn?: number
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public let availableIn: ?UInt32

    /**
     * Total number of input bytes read so far.
     *
     * @relation totalIn?: number
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public let totalIn: ?UInt64

    /**
     * Next output byte will go here.
     *
     * @relation nextOut?: ArrayBuffer
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public let nextOut: ?Array<Byte>

    /**
     * Remaining free space at nextOut.
     *
     * @relation availableOut?: number
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public let availableOut: ?UInt32

    /**
     * Total number of bytes output so far.
     *
     * @relation totalOut?: number
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public let totalOut: ?UInt64

    /**
     * Best guess about the data type.
     *
     * @relation dataType?: number
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public let dataType: ?Int32

    /**
     * Adler-32 or CRC-32 value of the uncompressed data.
     *
     * @relation adler?: number
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public let adler: ?UInt64

    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public init(nextIn!: ?Array<Byte> = None, availableIn!: ?UInt32 = None, totalIn!: ?UInt64 = None,
        nextOut!: ?Array<Byte> = None, availableOut!: ?UInt32 = None, totalOut!: ?UInt64 = None,
        dataType!: ?Int32 = None, adler!: ?UInt64 = None) {
        this.nextIn = nextIn
        this.availableIn = availableIn
        this.totalIn = totalIn
        this.nextOut = nextOut
        this.availableOut = availableOut
        this.totalOut = totalOut
        this.dataType = dataType
        this.adler = adler
    }

    init(availableIn: UInt32, totalIn: UInt64, availableOut: UInt32, totalOut: UInt64, dataType: Int32, adler: UInt64) {
        this.nextIn = None
        this.availableIn = availableIn
        this.totalIn = totalIn
        this.nextOut = None
        this.availableOut = availableOut
        this.totalOut = totalOut
        this.dataType = dataType
        this.adler = adler
    }

    static func parse(cStrm: CZStream): ZStream {
        return ZStream(availableIn: cStrm.availableIn, totalIn: cStrm.totalIn, availableOut: cStrm.availableOut,
            totalOut: cStrm.totalOut, dataType: cStrm.dataType, adler: cStrm.adler)
    }

    private func checkIn(): Unit {
        if (let Some(v) <- this.nextIn) {
            if (let Some(len) <- this.availableIn) {
                if (len < 0 || Int64(len) > v.size) {
                    throw IllegalArgumentException("The parameter check failed")
                }
            }
        }
    }

    private func checkOut(): Unit {
        if (let Some(v) <- this.nextOut) {
            if (let Some(len) <- this.availableOut) {
                if (len < 0 || Int64(len) > v.size) {
                    throw IllegalArgumentException("The parameter check failed")
                }
            }
        }
    }

    func checkAndThrow(): Unit {
        checkIn()
        checkOut()
    }
}

@C
struct CZStream {
    var nextIn: CPointer<Byte> = CPointer<Byte>()
    var availableIn: UInt32 = 0
    var totalIn: UInt64 = 0
    var nextOut: CPointer<Byte> = CPointer<Byte>()
    var availableOut: UInt32 = 0
    var totalOut: UInt64 = 0
    var dataType: Int32 = 0
    var adler: UInt64 = 0

    var hasNextIn: Bool = false
    var hasAvailableIn: Bool = false
    var hasTotalIn: Bool = false
    var hasNextOut: Bool = false
    var hasAvailableOut: Bool = false
    var hasTotalOut: Bool = false
    var hasDataType: Bool = false
    var hasAdler: Bool = false

    init() {}

    /**
     *  Caution: must directly call destroyRawPtr after initWithRawPtr
     */
    mut unsafe func initWithRawPtr(strm: ZStream): (CPointerHandle<Byte>, CPointerHandle<Byte>) {
        let nextInVp: CPointerHandle<Byte>
        let nextOutVp: CPointerHandle<Byte>
        if (let Some(v) <- strm.nextIn) {
            nextInVp = acquireArrayRawData(v)
            nextIn = nextInVp.pointer
            hasNextIn = true
        } else {
            nextInVp = CPointerHandle<Byte>()
        }
        if (let Some(v) <- strm.nextOut) {
            nextOutVp = acquireArrayRawData(v)
            nextOut = nextOutVp.pointer
            hasNextOut = true
        } else {
            nextOutVp = CPointerHandle<Byte>()
        }
        if (let Some(v) <- strm.availableIn) {
            availableIn = v
            hasAvailableIn = true
        }
        if (let Some(v) <- strm.totalIn) {
            totalIn = v
            hasTotalIn = true
        }
        if (let Some(v) <- strm.availableOut) {
            availableOut = v
            hasAvailableOut = true
        }
        if (let Some(v) <- strm.totalOut) {
            totalOut = v
            hasTotalOut = true
        }
        if (let Some(v) <- strm.dataType) {
            dataType = v
            hasDataType = true
        }
        if (let Some(v) <- strm.adler) {
            adler = v
            hasAdler = true
        }
        return (nextInVp, nextOutVp)
    }

    /**
     *  Caution: nextInVp and nextOutVp must come from initWithRawPtr
     */
    mut unsafe func destroyRawPtr(nextInVp: CPointerHandle<Byte>, nextOutVp: CPointerHandle<Byte>): Unit {
        if (hasNextIn) {
            releaseArrayRawData(nextInVp)
            nextIn = CPointer<Byte>()
        }
        if (hasNextOut) {
            releaseArrayRawData(nextOutVp)
            nextOut = CPointer<Byte>()
        }
    }
}
