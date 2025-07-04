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
 * @brief createSign(algName: string): Sign
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
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
     * @brief algName: string
     */
    @!APILevel[
        12,
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
    public func initialize(priKey: PriKey): Unit {
        let errCode = unsafe { FFiOHOSSignInit(getID(), priKey.getID()) }
        checkRet(errCode, "[Sign] initialize: ")
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
        let errCode = unsafe { FFiOHOSSignUpdate(getID(), blob) }
        blob.free()
        checkRet(errCode, "[Sign] update: ")
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Signature"
    ]
    public func sign(data: ?DataBlob): DataBlob {
        unsafe {
            let input: CPointer<HcfBlob> = match (data) {
                case Some(v) =>
                    let ptr = safeMalloc<HcfBlob>()
                    let blob = HcfBlob(v)
                    ptr.write(blob)
                    ptr
                case None => CPointer<HcfBlob>()
            }
            let output: CPointer<HcfBlob> = try {
                safeMalloc<HcfBlob>()
            } catch (e: Exception) {
                if (input.isNotNull()) {
                    input.read().free()
                    LibC.free(input)
                }
                throw e
            }
            let errCode = FFiOHOSSignSign(getID(), input, output)
            try {
                checkRet(errCode, "[Sign] sign: ")
                let blob: DataBlob = output.read().toDataBlob()
                output.read().free()
                return blob
            } finally {
                if (input.isNotNull()) {
                    input.read().free()
                    LibC.free(input)
                }
                LibC.free(output)
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
    public func setSignSpec(itemType: SignSpecItem, itemValue: Int32): Unit {
        match (itemType) {
            case PSS_SALT_LEN_NUM =>
                let errCode = unsafe { FFiOHOSSignSetSignSpecByNum(getID(), itemValue) }
                checkRet(errCode, "[Sign] setSignSpec: ")
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "[Sign] setSignSpec: specItem not support.")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Signature"
    ]
    public func setSignSpec(itemType: SignSpecItem, itemValue: Array<UInt8>): Unit {
        match (itemType) {
            case SM2_USER_ID_UINT8ARR =>
                let blob = HcfBlob(DataBlob(itemValue))
                let errCode = unsafe { FFiOHOSSignSetSignSpecByArr(getID(), blob) }
                blob.free()
                checkRet(errCode, "[Sign] setSignSpec: ")
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "[Sign] setSignSpec: specItem not support.")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Signature"
    ]
    public func getSignSpec(itemType: SignSpecItem): ResultSpec {
        match (itemType) {
            case PSS_MD_NAME_STR | PSS_MGF_NAME_STR | PSS_MGF1_MD_STR =>
                var errCode = 0i32
                let returnString = unsafe { FFiOHOSSignGetSignSpecString(getID(), itemType.value, inout errCode) }
                checkRet(errCode, "")
                let res = returnString.toString()
                unsafe { LibC.free(returnString) }
                return STRING(res)
            case PSS_SALT_LEN_NUM | PSS_TRAILER_FIELD_NUM =>
                var returnInt = 0i32
                let errCode = unsafe { FFiOHOSSignGetSignSpecNum(getID(), itemType.value, inout returnInt) }
                checkRet(errCode, "")
                return NUMBER(returnInt)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "specItem not support.")
        }
    }
}
