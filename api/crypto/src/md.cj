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
import ohos.base.*

foreign {
    func FfiOHOSCreateMd(algName: CString, errCode: CPointer<Int32>): Int64

    func FfiOHOSMdUpdate(id: Int64, input: CPointer<HcfBlob>): Int32

    func FfiOHOSDigest(id: Int64, errCode: CPointer<Int32>): HcfBlob

    func FfiOHOSGetMdLength(id: Int64, errCode: CPointer<Int32>): UInt32
}

/**
 * Provides the md create func.
 *
 * @param { String } algName - indicates the md algorithm name.
 * @returns { Md } returns the created md instance.
 * @throws { BusinessException } 401 - invalid parameters.
 * @throws { BusinessException } 17620001 - memory error.
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.MessageDigest"
]
public func createMd(algName: String): Md {
    unsafe {
        let cstr = LibC.mallocCString(algName)
        var errCode: Int32 = 0
        let id = FfiOHOSCreateMd(cstr, inout errCode)
        LibC.free(cstr)
        checkRet(errCode, "[Md] createMd: ")
        return Md(id, algName)
    }
}

/**
 * Provides the Md type, which is used for Md generation.
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.MessageDigest"
]
public class Md <: RemoteDataLite {
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
     * @type { String }
     * @brief algName : string
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.MessageDigest"
    ]
    public prop algName: String {
        get() {
            return _algName
        }
    }

    /**
     * Update md with DataBlob.
     *
     * @param { DataBlob } input - indicates the DataBlob.
     * @throws { BusinessException } 401 - invalid parameters.
     * @throws { BusinessException } 17630001 - crypto operation error.
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.MessageDigest"
    ]
    public func update(input: DataBlob): Unit {
        unsafe {
            let cptr = safeMalloc<HcfBlob>()
            let chb: HcfBlob
            try {
                chb = HcfBlob(input)
            } catch (e: Exception) {
                LibC.free(cptr)
                throw e
            }
            cptr.write(chb)
            let errCode = FfiOHOSMdUpdate(getID(), cptr)
            chb.free()
            LibC.free(cptr)
            checkRet(errCode, "[Md] update: ")
        }
    }

    /**
     * Output the result of md calculation.
     *
     * @throws { BusinessException } 17620001 - memory error.
     * @throws { BusinessException } 17630001 - crypto operation error.
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.MessageDigest"
    ]
    public func digest(): DataBlob {
        unsafe {
            var errCode: Int32 = 0
            let returnBlob: HcfBlob = FfiOHOSDigest(getID(), inout errCode)
            checkRet(errCode, "[Md] digest: ")
            let blob = returnBlob.toDataBlob()
            returnBlob.free()
            return blob
        }
    }

    /**
     * Output the length of md result.
     *
     * @returns { UInt32 } returns the length of the hmac result.
     * @throws { BusinessException } 17630001 - crypto operation error.
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.MessageDigest"
    ]
    public func getMdLength(): UInt32 {
        unsafe {
            var errCode: Int32 = 0
            let res = FfiOHOSGetMdLength(getID(), inout errCode)
            checkRet(errCode, "[Md] getMdLength: ")
            return res
        }
    }
}
