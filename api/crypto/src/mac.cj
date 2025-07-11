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

package ohos.crypto

import ohos.ffi.*
import ohos.labels.*

foreign {
    func FFiOHOSCryptoMacConstructor(algName: CString, errCode: CPointer<Int32>): Int64

    func FfiOHOSCryptoMacInit(id: Int64, symKeyId: Int64): Int32

    func FfiOHOSCryptoMacUpdate(id: Int64, input: CPointer<HcfBlob>): Int32

    func FfiOHOSCryptoMacDoFinal(id: Int64, errCode: CPointer<Int32>): HcfBlob

    func FfiOHOSCryptoGetMacLength(id: Int64): UInt32
}

/**
 * Provides the mac create func.
 *
 * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br>2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 17620001 - memory error.
 * @relation createMac(algName: string): Mac
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Mac"
]
public func createMac(algName: String): Mac {
    unsafe {
        let cstr = LibC.mallocCString(algName)
        var errCode: Int32 = 0
        let id = FFiOHOSCryptoMacConstructor(cstr, inout errCode)
        LibC.free(cstr)
        checkRet(errCode, "[Mac] createMd: ")
        return Mac(id, algName)
    }
}

/**
 * Provides the Mac type, which is used for Mac generation.
 *
 * @relation interface Mac
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Mac"
]
public class Mac <: RemoteDataLite {
    private let _algName: String

    init(id: Int64, algName: String) {
        super(id)
        _algName = algName
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Indicates the algorithm name.
     *
     * @relation algName: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Mac"
    ]
    public prop algName: String {
        get() {
            return _algName
        }
    }

    /**
     * Init hmac with given SymKey.
     *
     * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 17630001 - crypto operation error.
     * @relation initSync(key: SymKey): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Mac"
    ]
    public func `init`(key: SymKey): Unit {
        unsafe {
            let errCode = FfiOHOSCryptoMacInit(getID(), key.getID())
            checkRet(errCode, "[Mac] init: ")
        }
    }

    /**
     * Update hmac with DataBlob.
     *
     * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 17630001 - crypto operation error.
     * @relation updateSync(input: DataBlob): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Mac"
    ]
    public func update(input: DataBlob): Unit {
        unsafe {
            let cp = safeMalloc<HcfBlob>()
            let chb: HcfBlob
            try {
                chb = HcfBlob(input)
            } catch (e: Exception) {
                LibC.free(cp)
                throw e
            }
            cp.write(chb)
            let errCode = FfiOHOSCryptoMacUpdate(getID(), cp)
            chb.free()
            LibC.free(cp)
            checkRet(errCode, "[Mac] update: ")
        }
    }

    /**
     * Output the result of hmac calculation.
     *
     * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 17620001 - memory error.
     * @throws { BusinessException } 17620002 - runtime error.
     * @throws { BusinessException } 17630001 - crypto operation error.
     * @relation doFinalSync(): DataBlob;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Mac"
    ]
    public func doFinal(): DataBlob {
        unsafe {
            var errCode: Int32 = 0
            let returnBlob: HcfBlob = FfiOHOSCryptoMacDoFinal(getID(), inout errCode)
            checkRet(errCode, "[Mac] doFinal: ")
            let blob = returnBlob.toDataBlob()
            returnBlob.free()
            return blob
        }
    }

    /**
     * Output the length of hmac result.
     *
     * @throws { BusinessException } 17630001 - crypto operation error.
     * @relation getMacLength(): number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Mac"
    ]
    public func getMacLength(): UInt32 {
        unsafe {
            return FfiOHOSCryptoGetMacLength(getID())
        }
    }
}
