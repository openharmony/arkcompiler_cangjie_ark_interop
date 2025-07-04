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
import std.math.numeric.*

foreign {
    func FFiOHOSPubKeyGetAsyKeySpecByNum(id: Int64, itemType: Int32, errCode: CPointer<Int32>): IntNative

    func FFiOHOSPubKeyGetAsyKeySpecByStr(id: Int64, itemType: Int32, errCode: CPointer<Int32>): CString

    func FFiOHOSPubKeyGetAsyKeySpecByBigInt(id: Int64, itemType: Int32, errCode: CPointer<Int32>): HcfBigInteger

    func FFiOHOSPubKeyGetEncoded(id: Int64, errCode: CPointer<Int32>): HcfBlob

    func FFiOHOSPubKeyGetEncodedDer(id: Int64, format: CString, errCode: CPointer<Int32>): HcfBlob

    func FFiOHOSPubKeyGetEncodedPem(id: Int64, format: CString, errCode: CPointer<Int32>): CString

    func FfiOHOSPubKeyGetFormat(id: Int64, errCode: CPointer<Int32>): CString

    func FfiOHOSPubKeyGetRawPointer(id: Int64): CPointer<Unit>

    func FfiOHOSPubKeyFromRawPointer(ptr: CPointer<Unit>, retString: CPointer<CPointer<UInt8>>, errCode: CPointer<Int32>): Int64
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class PubKey <: RemoteDataLite & Key {
    private let _algName: String

    protected init(id: Int64, algName: String) {
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
        syscap: "SystemCapability.Security.CryptoFramework.Key"
    ]
    public prop algName: String {
        get() {
            return _algName
        }
    }

    protected func getRawPointer(): CPointer<Unit> {
        return unsafe { FfiOHOSPubKeyGetRawPointer(getID()) }
    }

    protected static func createFromRawPointer(ptr: CPointer<Unit>): PubKey {
        var errCode = 0i32
        var retString = CPointer<UInt8>()
        let id = unsafe { FfiOHOSPubKeyFromRawPointer(ptr, inout retString, inout errCode) }
        checkRet(errCode, "[PubKey] createFromRawPointer: ")
        // don't free `retString`, because it's constant
        return PubKey(id, CString(retString).toString())
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key"
    ]
    public prop format: String {
        get() {
            unsafe {
                var errCode: Int32 = 0
                let cstr = FfiOHOSPubKeyGetFormat(getID(), inout errCode)
                checkRet(errCode, "[PubKey] format: ")
                return cstr.toString()
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
    public func getAsyKeySpec(itemType: AsyKeySpecItem): ResultSpec {
        let asyKeySpecItemType = getAsyKeySpecType(itemType.value)
        if (asyKeySpecItemType == SPEC_ITEM_TYPE_BIG_INT) {
            var errCode = 0i32
            let returnBigInt = unsafe { FFiOHOSPubKeyGetAsyKeySpecByBigInt(getID(), itemType.value, inout errCode) }
            checkRet(errCode, "[PubKey] getAsyKeySpec: ")
            let res = BIGINT(BigInt(true, returnBigInt.toArray()))
            returnBigInt.free()
            return res
        } else if (asyKeySpecItemType == SPEC_ITEM_TYPE_NUM) {
            var errCode = 0i32
            let returnNum = unsafe { FFiOHOSPubKeyGetAsyKeySpecByNum(getID(), itemType.value, inout errCode) }
            checkRet(errCode, "[PubKey] getAsyKeySpec: ")
            return NUMBER(Int32(returnNum))
        } else if (asyKeySpecItemType == SPEC_ITEM_TYPE_STR) {
            var errCode = 0i32
            let returnStubng = unsafe { FFiOHOSPubKeyGetAsyKeySpecByStr(getID(), itemType.value, inout errCode) }
            checkRet(errCode, "[PubKey] getAsyKeySpec: ")
            let res = STRING(returnStubng.toString())
            unsafe { LibC.free(returnStubng) }
            return res
        }
        throw BusinessException(ERR_PARAMETER_ERROR, "AsyKeySpecItem not subport!")
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key"
    ]
    public func getEncoded(): DataBlob {
        var errCode: Int32 = 0
        let returnBlob: HcfBlob = unsafe { FFiOHOSPubKeyGetEncoded(getID(), inout errCode) }
        checkRet(errCode, "[PubKey] getEncoded: ")
        let blob = returnBlob.toDataBlob()
        returnBlob.free()
        return blob
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public func getEncodedDer(format: String): DataBlob {
        unsafe {
            let cformat = LibC.mallocCString(format)
            var errCode: Int32 = 0
            let returnBlob: HcfBlob = FFiOHOSPubKeyGetEncodedDer(getID(), cformat, inout errCode)
            LibC.free(cformat)
            checkRet(errCode, "[PubKey] getEncodedDer: ")
            let blob = returnBlob.toDataBlob()
            returnBlob.free()
            return blob
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public func getEncodedPem(format: String): String {
        unsafe {
            let cformat = LibC.mallocCString(format)
            var errCode: Int32 = 0
            let ret = FFiOHOSPubKeyGetEncodedPem(getID(), cformat, inout errCode)
            LibC.free(cformat)
            checkRet(errCode, "[PubKey] getEncodedPem: ")
            let str = ret.toString()
            LibC.free(ret)
            return str
        }
    }
}
