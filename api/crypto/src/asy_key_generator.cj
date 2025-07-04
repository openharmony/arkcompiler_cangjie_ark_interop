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
    func FFiOHOSAsyKeyGeneratorConstructor(algName: CString, errCode: CPointer<Int32>): Int64

    func FFiOHOSAsyKeyGeneratorGenerateKeyPair(id: Int64, errCode: CPointer<Int32>): Int64

    func FFiOHOSAsyKeyGeneratorConvertKey(id: Int64, pubKey: CPointer<HcfBlob>, priKey: CPointer<HcfBlob>,
        errCode: CPointer<Int32>): Int64

    func FFiOHOSAsyKeyGeneratorConvertPemKey(id: Int64, pubKey: CString, priKey: CString, errCode: CPointer<Int32>): Int64
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public func createAsyKeyGenerator(algName: String): AsyKeyGenerator {
    unsafe {
        let cstr = LibC.mallocCString(algName)
        var errCode: Int32 = 0
        let id = FFiOHOSAsyKeyGeneratorConstructor(cstr, inout errCode)
        LibC.free(cstr)
        checkRet(errCode, "[AsyKeyGenerator] createAsyKeyGenerator: ")
        return AsyKeyGenerator(id, algName)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class AsyKeyGenerator <: RemoteDataLite {
    private let _algName: String

    init(id: Int64, algName: String) {
        super(id)
        _algName = algName
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public prop algName: String {
        get() {
            return _algName
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public func generateKeyPair(): KeyPair {
        unsafe {
            var errCode: Int32 = 0
            let id = FFiOHOSAsyKeyGeneratorGenerateKeyPair(getID(), inout errCode)
            checkRet(errCode, "[AsyKeyGenerator] generateKeyPair: ")
            return KeyPair(id, _algName)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public func convertKey(pubKey: ?DataBlob, priKey: ?DataBlob): KeyPair {
        unsafe {
            let pub: CPointer<HcfBlob> = match (pubKey) {
                case Some(v) =>
                    let ptr = safeMalloc<HcfBlob>()
                    let blob = HcfBlob(v)
                    ptr.write(blob)
                    ptr
                case None => CPointer<HcfBlob>()
            }
            let pri: CPointer<HcfBlob> = try {
                match (priKey) {
                    case Some(v) =>
                        let ptr = safeMalloc<HcfBlob>()
                        let blob = HcfBlob(v)
                        ptr.write(blob)
                        ptr
                    case None => CPointer<HcfBlob>()
                }
            } catch (e: Exception) {
                if (pub.isNotNull()) {
                    pub.read().free()
                    LibC.free(pub)
                }
                throw e
            }
            var errCode: Int32 = 0
            let id = FFiOHOSAsyKeyGeneratorConvertKey(getID(), pub, pri, inout errCode)
            try {
                checkRet(errCode, "[AsyKeyGenerator] convertKey: ")
                return KeyPair(id, _algName)
            } finally {
                if (pub.isNotNull()) {
                    pub.read().free()
                    LibC.free(pub)
                }
                if (pri.isNotNull()) {
                    pri.read().free()
                    LibC.free(pri)
                }
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public func convertPemKey(pubKey: ?String, priKey: ?String): KeyPair {
        unsafe {
            try (
                pub = mallocCString(pubKey).asResource(),
                pri = mallocCString(priKey).asResource()
            ) {
                var errCode: Int32 = 0
                let id = FFiOHOSAsyKeyGeneratorConvertPemKey(getID(), pub.value, pri.value, inout errCode)
                checkRet(errCode, "[AsyKeyGenerator] convertPemKey: ")
                return KeyPair(id, _algName)
            }
            throw BusinessException(0, "[AsyKeyGenerator] convertPemKey: unreachable branch.")
        }
    }
}
