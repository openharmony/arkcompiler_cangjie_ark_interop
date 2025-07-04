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
import std.math.numeric.*
import ohos.base.*

foreign {
    func FFiOHOSPriKeyGetAsyKeySpecByNum(id: Int64, itemType: Int32, errCode: CPointer<Int32>): IntNative

    func FFiOHOSPriKeyGetAsyKeySpecByStr(id: Int64, itemType: Int32, errCode: CPointer<Int32>): CString

    func FFiOHOSPriKeyGetAsyKeySpecByBigInt(id: Int64, itemType: Int32, errCode: CPointer<Int32>): HcfBigInteger

    func FFiOHOSPriKeyGetEncoded(id: Int64, errCode: CPointer<Int32>): HcfBlob

    func FFiOHOSPriKeyGetEncodedDer(id: Int64, format: CString, errCode: CPointer<Int32>): HcfBlob

    func FFiOHOSPriKeyGetEncodedPem(id: Int64, format: CString, errCode: CPointer<Int32>): CString

    func FFiOHOSPriKeyClearMem(id: Int64): Int32

    func FfiOHOSPriKeyGetFormat(id: Int64, errCode: CPointer<Int32>): CString
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class PriKey <: RemoteDataLite & Key {
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
        syscap: "SystemCapability.Security.CryptoFramework.Key"
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
        syscap: "SystemCapability.Security.CryptoFramework.Key"
    ]
    public prop format: String {
        get() {
            unsafe {
                var errCode: Int32 = 0
                let cstr = FfiOHOSPriKeyGetFormat(getID(), inout errCode)
                checkRet(errCode, "[PriKey] format: ")
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
            let returnBigInt = unsafe { FFiOHOSPriKeyGetAsyKeySpecByBigInt(getID(), itemType.value, inout errCode) }
            checkRet(errCode, "[PriKey] getAsyKeySpec: ")
            let res = BIGINT(BigInt(true, returnBigInt.toArray()))
            returnBigInt.free()
            return res
        } else if (asyKeySpecItemType == SPEC_ITEM_TYPE_NUM) {
            var errCode = 0i32
            let returnNum = unsafe { FFiOHOSPriKeyGetAsyKeySpecByNum(getID(), itemType.value, inout errCode) }
            checkRet(errCode, "[PriKey] getAsyKeySpec: ")
            return NUMBER(Int32(returnNum))
        } else if (asyKeySpecItemType == SPEC_ITEM_TYPE_STR) {
            var errCode = 0i32
            let returnString = unsafe { FFiOHOSPriKeyGetAsyKeySpecByStr(getID(), itemType.value, inout errCode) }
            checkRet(errCode, "[PriKey] getAsyKeySpec: ")
            let res = STRING(returnString.toString())
            unsafe { LibC.free(returnString) }
            return res
        }
        throw BusinessException(ERR_PARAMETER_ERROR, "AsyKeySpecItem not support!")
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public func getEncoded(): DataBlob {
        var errCode: Int32 = 0
        let returnBlob: HcfBlob = unsafe { FFiOHOSPriKeyGetEncoded(getID(), inout errCode) }
        checkRet(errCode, "[PriKey] getEncoded: ")
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
            let returnBlob: HcfBlob = FFiOHOSPriKeyGetEncodedDer(getID(), cformat, inout errCode)
            LibC.free(cformat)
            checkRet(errCode, "[PriKey] getEncodedDer: ")
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
            let ret: CString = FFiOHOSPriKeyGetEncodedPem(getID(), cformat, inout errCode)
            LibC.free(cformat)
            checkRet(errCode, "[PriKey] getEncodedPem: ")
            let str = ret.toString()
            LibC.free(ret)
            return str
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public func clearMem(): Unit {
        unsafe {
            let errCode = FFiOHOSPriKeyClearMem(getID())
            checkRet(errCode, "[PriKey] clearMem: ")
        }
    }
}
