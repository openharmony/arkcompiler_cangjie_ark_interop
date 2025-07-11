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
    func FFiOHOSCryptoSignConstructor(algName: CString, errCode: CPointer<Int32>): Int64

    func FFiOHOSSignInit(sid: Int64, pid: Int64): Int32

    func FFiOHOSSignUpdate(id: Int64, data: HcfBlob): Int32

    func FFiOHOSSignSign(id: Int64, input: CPointer<HcfBlob>, output: CPointer<HcfBlob>): Int32

    func FFiOHOSSignSetSignSpecByNum(id: Int64, itemValue: Int32): Int32

    func FFiOHOSSignSetSignSpecByArr(id: Int64, itemValue: HcfBlob): Int32

    func FFiOHOSSignGetSignSpecString(id: Int64, item: Int32, errCode: CPointer<Int32>): CString

    func FFiOHOSSignGetSignSpecNum(id: Int64, item: Int32, itemValue: CPointer<Int32>): Int32
}

/**
 * Create a sign object for generating signatures.
 *
 * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br>2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 801 - this operation is not supported.
 * @throws { BusinessException } 17620001 - memory error.
 * @relation function createSign(algName: string): Sign;
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Signature"
]
public func createSign(algName: String): Sign {
    unsafe {
        let cstr = LibC.mallocCString(algName)
        var errCode: Int32 = 0
        let id = FFiOHOSCryptoSignConstructor(cstr, inout errCode)
        LibC.free(cstr)
        checkRet(errCode, "[Sign] createSign: ")
        return Sign(id, algName)
    }
}

/**
 * Provides the Sign type, which is used for generating signatures.
 *
 * @relation interface Sign
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Signature"
]
public class Sign <: RemoteDataLite {
    private let _algName: String

    init(id: Int64, algName: String) {
        super(id)
        _algName = algName
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Indicates the algorithm name of the sign object.
     *
     * @type { String }
     * @relation algName : string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Signature"
    ]
    public prop algName: String {
        get() {
            return _algName
        }
    }
}
