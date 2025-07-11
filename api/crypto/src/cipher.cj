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
    func FfiOHOSCreateCipher(transformation: CString, errCode: CPointer<Int32>): Int64

    func FfiOHOSCipherInitByIv(id: Int64, opMode: Int32, key: CPointer<Unit>, blob1: HcfBlob): Int32

    func FfiOHOSCipherInitByGcm(id: Int64, opMode: Int32, key: CPointer<Unit>, spec: CParamsSpec): Int32

    func FfiOHOSCipherInitByCcm(id: Int64, opMode: Int32, key: CPointer<Unit>, spec: CParamsSpec): Int32

    func FfiOHOSCipherInitWithOutParams(id: Int64, opMode: Int32, key: CPointer<Unit>): Int32

    func FfiOHOSCipherUpdate(id: Int64, input: CPointer<HcfBlob>, output: CPointer<HcfBlob>): Int32

    func FfiOHOSCipherDoFinal(id: Int64, input: CPointer<HcfBlob>, output: CPointer<HcfBlob>): Int32

    func FfiOHOSSetCipherSpec(id: Int64, item: Int32, pSource: HcfBlob): Int32

    func FfiOHOSGetCipherSpecString(id: Int64, item: Int32, errCode: CPointer<Int32>): CString

    func FfiOHOSGetCipherSpecUint8Array(id: Int64, item: Int32, returnUint8Array: CPointer<HcfBlob>): Int32

    func FfiOHOSCipherGetAlgName(id: Int64, errCode: CPointer<Int32>): CString
}

/**
 * Create a cipher object for encryption and decryption operations according to the given specifications.
 * Two different Cipher objects should be created when using RSA encryption and decryption,
 * even with the same specifications.
 *
 * @param { String } transformation - indicates the description to be transformed to cipher specifications.
 * @returns { Cipher } the cipher object returned by the function.
 * @throws { BusinessException } 401 - invalid parameters.
 * @throws { BusinessException } 801 - this operation is not supported.
 * @throws { BusinessException } 17620001 - memory error.
 * @relation createCipher(transformation: string): Cipher
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Cipher"
]
public func createCipher(transformation: String): Cipher {
    unsafe {
        let cstr = LibC.mallocCString(transformation)
        var errCode: Int32 = 0
        let id = FfiOHOSCreateCipher(cstr, inout errCode)
        LibC.free(cstr)
        checkRet(errCode, "[Cipher] createCipher: ")
        return Cipher(id, transformation)
    }
}

/**
 * Provides the Cipher type, which is used for encryption and decryption operations.
 *
 * @relation interface Cipher
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Cipher"
]
public class Cipher <: RemoteDataLite {
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
     * @relation algName : string
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    public prop algName: String {
        get() {
            return _algName
        }
    }

    func getCHcfBlobList(ivData: DataBlob, aadData: DataBlob, tagData: DataBlob): Array<HcfBlob> {
        let iv = HcfBlob(ivData)
        let aad: HcfBlob
        try {
            aad = HcfBlob(aadData)
        } catch (e: Exception) {
            iv.free()
            throw e
        }
        let tag: HcfBlob
        try {
            tag = HcfBlob(tagData)
        } catch (e: Exception) {
            iv.free()
            aad.free()
            throw e
        }
        return [iv, aad, tag]
    }

    /**
     * Init the crypto operation with the given crypto mode, key and parameters.
     *
     * @param { CryptoMode } opMode - indicates the crypto mode is encryption or decryption.
     * @param { Key } key - indicates the symmetric key or the asymmetric key.
     * @param { ParamsSpec } params - indicates the algorithm parameters such as IV.
     * @throws { BusinessException } 401 - invalid parameters.
     * @throws { BusinessException } 17620001 - memory error.
     * @throws { BusinessException } 17620002 - runtime error.
     * @throws { BusinessException } 17630001 - crypto operation error.
     * @relation init(opMode : CryptoMode, key : Key, params : ParamsSpec) : Promise<void>
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    public func `init`(opMode: CryptoMode, key: Key, params: ?ParamsSpec): Unit {
        unsafe {
            let k = match (key) {
                case v: SymKey => v.getKey()
                case _ => throw BusinessException(ERR_PARAMETER_ERROR, "[Cipher] init: invalid parameters.")
            }
            match (params) {
                case Some(v) => match (v) {
                    case spec: IvParamsSpec =>
                        let iv = HcfBlob(spec.iv)
                        let errCode = FfiOHOSCipherInitByIv(getID(), opMode.getValue(), k, iv)
                        iv.free()
                        checkRet(errCode, "[Cipher] init: ")
                    case spec: GcmParamsSpec =>
                        let list = getCHcfBlobList(spec.iv, spec.aad, spec.authTag)
                        let errCode = FfiOHOSCipherInitByGcm(getID(), opMode.getValue(), k,
                            CParamsSpec(list[0], list[1], list[2]))
                        list[0].free()
                        list[1].free()
                        list[2].free()
                        checkRet(errCode, "[Cipher] init: ")
                    case spec: CcmParamsSpec =>
                        let list = getCHcfBlobList(spec.iv, spec.aad, spec.authTag)
                        let errCode = FfiOHOSCipherInitByCcm(getID(), opMode.getValue(), k,
                            CParamsSpec(list[0], list[1], list[2]))
                        list[0].free()
                        list[1].free()
                        list[2].free()
                        checkRet(errCode, "[Cipher] init: ")
                    case _ => throw BusinessException(ERR_PARAMETER_ERROR, "[Cipher] init: invalid parameters.")
                }
                case None =>
                    let errCode = FfiOHOSCipherInitWithOutParams(getID(), opMode.getValue(), k)
                    checkRet(errCode, "[Cipher] init: ")
            }
        }
    }

    /**
     * Update the crypto operation with the input data, and feed back the encrypted or decrypted data
     * this time. RSA is not supported in this function.
     *
     * @param { DataBlob } data - indicates the data to be encrypted or decrypted.
     * @returns { DataBlob } the data returned by the function.
     * @throws { BusinessException } 401 - invalid parameters.
     * @throws { BusinessException } 17620001 - memory error.
     * @throws { BusinessException } 17620002 - runtime error.
     * @throws { BusinessException } 17630001 - crypto operation error.
     * @relation update(data : DataBlob) : Promise<DataBlob>
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    public func update(data: DataBlob): DataBlob {
        unsafe {
            var dataBlob = DataBlob(Array<UInt8>())
            var input: HcfBlob = HcfBlob(data)
            var output: HcfBlob = HcfBlob(CPointer<UInt8>(), 0)
            try {
                let errCode = FfiOHOSCipherUpdate(getID(), inout input, inout output)
                checkRet(errCode, "[Cipher] update: ")
                dataBlob = output.toDataBlob()
            } finally {
                input.free()
                output.free()
            }
            return dataBlob
        }
    }

    /**
     * Finish the crypto operation, encrypt or decrypt the input data, and then feed back the output data.
     * Data cannot be updated after the crypto operation is finished.
     *
     * @param { DataBlob } data - indicates the data to be finally encrypted or decrypted.
     * @returns { DataBlob } the data returned by the function.
     * @throws { BusinessException } 401 - invalid parameters.
     * @throws { BusinessException } 17620001 - memory error.
     * @throws { BusinessException } 17620002 - runtime error.
     * @throws { BusinessException } 17630001 - crypto operation error.
     * @relation doFinal(data : DataBlob) : Promise<DataBlob>
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Cipher"
    ]
    public func doFinal(data: ?DataBlob): DataBlob {
        unsafe {
            var dataBlob = DataBlob(Array<UInt8>())
            var input: HcfBlob
            match (data) {
                case Some(v) => input = HcfBlob(v)
                case None => input = HcfBlob(CPointer<UInt8>(), 0)
            }
            var output: HcfBlob = HcfBlob(CPointer<UInt8>(), 0)
            try {
                let errCode = FfiOHOSCipherDoFinal(getID(), inout input, inout output)
                checkRet(errCode, "[Cipher] doFinal: ")
                dataBlob = output.toDataBlob()
            } finally {
                input.free()
                output.free()
            }
            return dataBlob
        }
    }
}
