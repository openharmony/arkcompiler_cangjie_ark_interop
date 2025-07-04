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

import ohos.labels.*
import ohos.ffi.*
import ohos.base.*

foreign {
    func FFiOHOSVerifyConstructor(algName: CString, errCode: CPointer<Int32>): Int64

    func FFiOHOSVerifyInit(vid: Int64, pid: Int64): Int32

    func FFiOHOSVerifyUpdate(id: Int64, data: HcfBlob): Int32

    func FFiOHOSVerifyVerify(id: Int64, data: CPointer<HcfBlob>, signatureData: HcfBlob, errCode: CPointer<Int32>): Bool

    func FFiOHOSVerifyRecover(id: Int64, input: HcfBlob, output: CPointer<HcfBlob>): Int32

    func FFiOHOSVerifySetVerifySpecByNum(id: Int64, itemValue: Int32): Int32

    func FFiOHOSVerifySetVerifySpecByArr(id: Int64, itemValue: HcfBlob): Int32

    func FFiOHOSVerifyGetVerifySpecString(id: Int64, item: Int32, errCode: CPointer<Int32>): CString

    func FFiOHOSVerifyGetVerifySpecNum(id: Int64, item: Int32, itemValue: CPointer<Int32>): Int32
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Signature"
]
public func createVerify(algName: String): Verify {
    unsafe {
        let cstr = LibC.mallocCString(algName)
        var errCode: Int32 = 0
        let id = FFiOHOSVerifyConstructor(cstr, inout errCode)
        LibC.free(cstr)
        checkRet(errCode, "[Verify] createVerify: ")
        return Verify(id, algName)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Signature"
]
public class Verify <: RemoteDataLite {
    private let _algName: String

    init(id: Int64, algName: String) {
        super(id)
        _algName = algName
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * @brief algName: string
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Signature"
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
        syscap: "SystemCapability.Security.CryptoFramework.Signature"
    ]
    public func initialize(pubKey: PubKey): Unit {
        let errCode = unsafe { FFiOHOSVerifyInit(getID(), pubKey.getID()) }
        checkRet(errCode, "[Verify] initialize: ")
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Signature"
    ]
    public func update(data: DataBlob): Unit {
        let blob = HcfBlob(data)
        let errCode = unsafe { FFiOHOSVerifyUpdate(getID(), blob) }
        blob.free()
        checkRet(errCode, "[Verify] update: ")
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Signature"
    ]
    public func verify(data: ?DataBlob, signatureData: DataBlob): Bool {
        unsafe {
            let blob: CPointer<HcfBlob> = match (data) {
                case Some(v) =>
                    let ptr = safeMalloc<HcfBlob>()
                    let blob = HcfBlob(v)
                    ptr.write(blob)
                    ptr
                case None => CPointer<HcfBlob>()
            }
            let signatureblob: HcfBlob = try {
                HcfBlob(signatureData)
            } catch (e: Exception) {
                if (blob.isNotNull()) {
                    blob.read().free()
                    LibC.free(blob)
                }
                throw e
            }
            var errCode = 0i32
            let ret = FFiOHOSVerifyVerify(getID(), blob, signatureblob, inout errCode)
            try {
                checkRet(errCode, "[Verify] verify: ")
                return ret
            } finally {
                if (blob.isNotNull()) {
                    blob.read().free()
                    LibC.free(blob)
                }
                signatureblob.free()
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Signature"
    ]
    public func recover(signatureData: DataBlob): ?DataBlob {
        unsafe {
            let input: HcfBlob = HcfBlob(signatureData)
            var output: HcfBlob = HcfBlob(CPointer<UInt8>(), 0)
            let errCode = FFiOHOSVerifyRecover(getID(), input, inout output)
            try {
                checkRet(errCode, "[Verify] recover: ")
                if (output.size == 0) {
                    return None
                } else {
                    let blob: DataBlob = output.toDataBlob()
                    return blob
                }
            } finally {
                input.free()
                output.free()
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Signature"
    ]
    public func setVerifySpec(itemType: SignSpecItem, itemValue: Int32): Unit {
        match (itemType) {
            case PSS_SALT_LEN_NUM =>
                let errCode = unsafe { FFiOHOSVerifySetVerifySpecByNum(getID(), itemValue) }
                checkRet(errCode, "[Verify] setVerifySpec: ")
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "[Verify] setVerifySpec: specItem not support.")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Signature"
    ]
    public func setVerifySpec(itemType: SignSpecItem, itemValue: Array<UInt8>): Unit {
        match (itemType) {
            case SM2_USER_ID_UINT8ARR =>
                let blob = HcfBlob(DataBlob(itemValue))
                let errCode = unsafe { FFiOHOSVerifySetVerifySpecByArr(getID(), blob) }
                blob.free()
                checkRet(errCode, "[Verify] setVerifySpec: ")
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "[Verify] setVerifySpec: specItem not support.")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Signature"
    ]
    public func getVerifySpec(itemType: SignSpecItem): ResultSpec {
        match (itemType) {
            case PSS_MD_NAME_STR | PSS_MGF_NAME_STR | PSS_MGF1_MD_STR =>
                var errCode = 0i32
                let returnString = unsafe { FFiOHOSVerifyGetVerifySpecString(getID(), itemType.value, inout errCode) }
                checkRet(errCode, "")
                let res = returnString.toString()
                unsafe { LibC.free(returnString) }
                return STRING(res)
            case PSS_SALT_LEN_NUM | PSS_TRAILER_FIELD_NUM =>
                var returnInt = 0i32
                let errCode = unsafe { FFiOHOSVerifyGetVerifySpecNum(getID(), itemType.value, inout returnInt) }
                checkRet(errCode, "")
                return NUMBER(returnInt)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "specItem not support.")
        }
    }
}
