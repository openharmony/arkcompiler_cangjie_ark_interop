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

package ohos.account.appAccount

import ohos.base.*
import ohos.ability.Want
import ohos.ffi.*
import std.collection.*

@C
struct CCreateAccountOptions {
    var customData: CHashStrStrArr = CHashStrStrArr()

    init(data: CreateAccountOptions) {
        this.customData = CHashStrStrArr(data.customData ?? HashMap<String, String>())
    }

    init() {}

    func free() {
        unsafe { customData.free() }
    }

    func asResource(): CTypeResource<CCreateAccountOptions> {
        return CTypeResource(this, free)
    }
}

@C
struct CHashStrStrPair {
    var key: CString = CString(CPointer())
    var value: CString = CString(CPointer())
    var isValid: Bool = false

    init(key: ?String, value: ?String) {
        unsafe {
            try {
                this.key = LibC.mallocCString(key ?? "")
                this.value = LibC.mallocCString(value ?? "")
                this.isValid = true
            } catch (e: Exception) {
                this.isValid = false
                LibC.free(this.key)
                LibC.free(this.value)
                throw e
            }
        }
    }

    mut func free(): Unit {
        unsafe {
            if (this.isValid) {
                LibC.free(key)
                LibC.free(value)
                this.isValid = false
            }
        }
    }
}

@C
struct CHashStrStrArr {
    var headers: CPointer<CHashStrStrPair> = CPointer<CHashStrStrPair>()
    var size: Int64 = 0

    init() {}

    init(headers: HashMap<String, String>) {
        if (headers.size == 0) {
            return
        }

        var res: CPointer<CHashStrStrPair> = safeMalloc<CHashStrStrPair>(count: headers.size)
        var index = 0
        try {
            for ((k, v) in headers) {
                unsafe { res.write(index, CHashStrStrPair(k, v)) }
                index++
            }
        } catch (e: Exception) {
            for (i in 0..index) {
                unsafe {
                    var data = res.read(i)
                    data.free()
                }
            }
            unsafe { LibC.free(res) }
            throw e
        }
        this.headers = res
        this.size = headers.size
    }

    func free(): Unit {
        if (headers.isNull()) {
            return
        }
        for (i in 0..size) {
            unsafe {
                var data = headers.read(i)
                data.free()
            }
        }
        unsafe { LibC.free(headers) }
    }
}

@C
struct CAppAccountInfo {
    var owner: CString = CString(CPointer())
    var name: CString = CString(CPointer())

    init() {}
    init(data: AppAccountInfo) {
        try {
            unsafe {
                this.name = LibC.mallocCString(data.name)
                this.owner = LibC.mallocCString(data.owner)
            }
        } catch (e: Exception) {
            unsafe {
                LibC.free(name)
                LibC.free(owner)
                throw BusinessException(ERR_PARAMETER_ERROR, e.toString())
            }
        }
    }

    func free() {
        unsafe {
            LibC.free(name)
            LibC.free(owner)
        }
    }
}

@C
struct CArrAppAccountInfo {
    var head: CPointer<CAppAccountInfo> = CPointer<CAppAccountInfo>()
    var size: Int64 = 0

    init(arr: Array<AppAccountInfo>) {
        unsafe {
            size = arr.size
            head = safeMalloc<CAppAccountInfo>(count: size)
            var i = 0
            for (v in arr) {
                try {
                    head.write(i, CAppAccountInfo(v))
                } catch (e: Exception) {
                    for (j in 0..i) {
                        head.read(j).free()
                    }
                    LibC.free(head)
                    throw e
                }
                i++
            }
        }
    }

    func toArray(): Array<AppAccountInfo> {
        if (head.isNull() || size <= 0) {
            return Array<AppAccountInfo>()
        }
        Array<AppAccountInfo>(size) {
            i =>
            let data = unsafe { head.read(i) }
            AppAccountInfo(data)
        }
    }

    func free(): Unit {
        if (head.isNull()) {
            return
        }
        for (i in 0..this.size) {
            unsafe {
                head.read(i).free()
            }
        }
        unsafe { LibC.free(head) }
    }
}

@C
struct CAuthTokenInfo {
    var authType: CString = CString(CPointer())
    var token: CString = CString(CPointer())
    var account: CAppAccountInfo = CAppAccountInfo()

    init() {}
    init(data: AuthTokenInfo) {
        try {
            unsafe {
                this.authType = LibC.mallocCString(data.authType)
                this.token = LibC.mallocCString(data.token)
                this.account = match (data.account) {
                    case Some(v) => CAppAccountInfo(v)
                    case None => CAppAccountInfo()
                }
            }
        } catch (e: Exception) {
            unsafe {
                LibC.free(authType)
                LibC.free(token)
                account.free()
                throw BusinessException(ERR_PARAMETER_ERROR, e.toString())
            }
        }
    }

    func free() {
        unsafe {
            LibC.free(authType)
            LibC.free(token)
            account.free()
        }
    }
}

@C
struct CAuthenticatorInfo {
    var owner: CString = CString(CPointer())
    var iconId: Int32 = 0
    var labelId: Int32 = 0

    init() {}
    init(data: AuthenticatorInfo) {
        try {
            unsafe {
                this.owner = LibC.mallocCString(data.owner)
                this.iconId = data.iconId
                this.labelId = data.labelId
            }
        } catch (e: Exception) {
            unsafe {
                LibC.free(owner)
                throw BusinessException(ERR_PARAMETER_ERROR, e.toString())
            }
        }
    }

    func free() {
        unsafe {
            LibC.free(owner)
        }
    }
}

@C
struct CArrAuthTokenInfo {
    var head: CPointer<CAuthTokenInfo> = CPointer<CAuthTokenInfo>()
    var size: Int64 = 0

    init(arr: Array<AuthTokenInfo>) {
        unsafe {
            size = arr.size
            head = safeMalloc<CAuthTokenInfo>(count: size)
            var i = 0
            for (v in arr) {
                try {
                    head.write(i, CAuthTokenInfo(v))
                } catch (e: Exception) {
                    for (_ in 0..i) {
                        head.read(i).free()
                    }
                    LibC.free(head)
                    throw e
                }
                i++
            }
        }
    }

    func toArray(): Array<AuthTokenInfo> {
        if (head.isNull() || size <= 0) {
            return Array<AuthTokenInfo>()
        }
        Array<AuthTokenInfo>(size) {
            i =>
            let data = unsafe { head.read(i) }
            AuthTokenInfo(data)
        }
    }

    func free(): Unit {
        if (head.isNull()) {
            return
        }
        for (i in 0..this.size) {
            unsafe {
                head.read(i).free()
            }
        }
        unsafe { LibC.free(head) }
    }
}

@C
struct CSelectAccountsOptions {
    var allowedAccounts: CArrAppAccountInfo = CArrAppAccountInfo()
    var allowedOwners: CArrString = CArrString(CPointer(), 0)
    var requiredLabels: CArrString = CArrString(CPointer(), 0)

    init(data: SelectAccountsOptions) {
        this.allowedAccounts = match (data.allowedAccounts) {
            case Some(v) => CArrAppAccountInfo(v)
            case None => CArrAppAccountInfo()
        }
        this.allowedOwners = match (data.allowedOwners) {
            case Some(v) => unsafe { toArrayCString(v) }
            case None => CArrString(CPointer(), 0)
        }
        this.requiredLabels = match (data.requiredLabels) {
            case Some(v) => unsafe { toArrayCString(v) }
            case None => CArrString(CPointer(), 0)
        }
    }

    func free() {
        allowedAccounts.free()
        allowedOwners.free()
        requiredLabels.free()
    }
}

@C
struct ErrCArrAppAccountInfo {
    var err: Int32 = 0
    var cArrAppAccountInfoPtr: CArrAppAccountInfo = CArrAppAccountInfo()

    func free(): Unit {
        unsafe {
            cArrAppAccountInfoPtr.free()
        }
    }
}

@C
struct ErrCArrAuthTokenInfo {
    var err: Int32 = 0
    var cArrAuthTokenInfoPtr: CArrAuthTokenInfo = CArrAuthTokenInfo()

    func free(): Unit {
        unsafe {
            cArrAuthTokenInfoPtr.free()
        }
    }
}

@C
struct ErrCAuthenticatorInfo {
    var err: Int32 = 0
    var cAuthenticatorInfo: CAuthenticatorInfo = CAuthenticatorInfo()

    func free(): Unit {
        unsafe {
            cAuthenticatorInfo.free()
        }
    }
}

@C
struct CAuthResult {
    var account: CAppAccountInfo = CAppAccountInfo()
    var tokenInfo: CAuthTokenInfo = CAuthTokenInfo()
    var flag: Bool = false

    init() {}
    init(data: AuthResult) {
        this.account = match (data.account) {
            case Some(v) => CAppAccountInfo(v)
            case None => CAppAccountInfo()
        }
        this.tokenInfo = match (data.tokenInfo) {
            case Some(v) => CAuthTokenInfo(v)
            case None => CAuthTokenInfo()
        }
        this.flag = true
    }

    func free() {
        unsafe {
            account.free()
            tokenInfo.free()
        }
    }
}

@C
struct CParameters {
    let valueType: Int8
    let key: CString
    let value: CPointer<Unit>
    let size: Int64

    init(p: Parameters) {
        this.key = unsafe { LibC.mallocCString(p.key) }
        (valueType, this.value, this.size) = try {
            getValue(p.value)
        } catch (e: Exception) {
            unsafe { LibC.free(this.key) }
            throw e
        }
    }

    func free(): Unit {
        unsafe {
            if (valueType == ARRSTRING_TYPE) {
                let csValue = CPointer<CString>(value)
                for (i in 0..size) {
                    LibC.free(csValue.read(i))
                }
            }
            LibC.free<Unit>(value)
            LibC.free(key)
        }
    }

    func toArrString(): Array<String> {
        unsafe {
            Array<String>(
                size,
                {
                    i =>
                    let ptr = CPointer<CString>(value).read(i)
                    return ptr.toString()
                }
            )
        }
    }

    func toArr<T>(): Array<T> where T <: CType {
        unsafe {
            Array<T>(size, {i => CPointer<T>(value).read(i)})
        }
    }
}

@C
struct CArrParameters {
    CArrParameters(
        let head: CPointer<CParameters>,
        let size: Int64
    ) {}

    func free() {
        unsafe {
            for (i in 0..size) {
                head.read(i).free()
            }
            LibC.free(head)
        }
    }
}

@C
struct CVerifyCredentialOptions {
    var credentialType: CString = CString(CPointer())
    var credential: CString = CString(CPointer())
    var parameters: CArrParameters = CArrParameters(CPointer<CParameters>(), 0)

    init(data: VerifyCredentialOptions) {
        unsafe {
            this.credentialType = LibC.mallocCString(data.credentialType)
            this.credential = LibC.mallocCString(data.credential)
            if (data.parameters.size != 0) {
                this.parameters = createCArrParam(data.parameters)
            }
        }
    }

    init() {
        unsafe {
            this.credentialType = CString(CPointer())
            this.credential = CString(CPointer())
            this.parameters = CArrParameters(CPointer<CParameters>(), 0)
        }
    }

    func free(): Unit {
        unsafe {
            LibC.free(credentialType)
            LibC.free(credential)
            parameters.free()
        }
    }

    func asResource(): VCOResource {
        return VCOResource(this)
    }
}

@C
struct CAuthCallbackId {
    let onResultId_: Int64
    let onRequestRedirectedId_: Int64
    let onRequestContinuedId_: Int64

    init(data: AuthCallbackId) {
        this.onResultId_ = data.onResultId_
        this.onRequestRedirectedId_ = data.onRequestRedirectedId_
        this.onRequestContinuedId_ = data.onRequestContinuedId_
    }
}

@C
struct CSetPropertiesOptions {
    var properties: CArrParameters = CArrParameters(CPointer<CParameters>(), 0)
    var parameters: CArrParameters = CArrParameters(CPointer<CParameters>(), 0)

    init(data: SetPropertiesOptions) {
        unsafe {
            if (data.properties.size != 0) {
                this.properties = createCArrParam(data.properties)
            }
            if (data.parameters.size != 0) {
                this.parameters = createCArrParam(data.parameters)
            }
        }
    }

    init() {
        unsafe {
            this.properties = CArrParameters(CPointer<CParameters>(), 0)
            this.parameters = CArrParameters(CPointer<CParameters>(), 0)
        }
    }

    func free(): Unit {
        unsafe {
            properties.free()
            parameters.free()
        }
    }

    func asResource(): SPOResource {
        return SPOResource(this)
    }
}

foreign {
    func FfiAppAccountCreateAppAccountManager(): RetDataI64

    func FfiAppAccountAppAccountManagerCreateAccount(id: Int64, name: CString, options: CCreateAccountOptions): Int32

    func FfiAppAccountAppAccountManagerRemoveAccount(id: Int64, name: CString): Int32

    func FfiAppAccountAppAccountManagerSetAppAccess(id: Int64, name: CString, bundleName: CString, isAccessible: Bool): Int32

    func FfiAppAccountAppAccountManagerCheckAppAccess(id: Int64, name: CString, bundleName: CString): RetDataBool

    func FfiAppAccountAppAccountManagerCheckDataSyncEnabled(id: Int64, name: CString): RetDataBool

    func FfiAppAccountAppAccountManagerSetCredential(id: Int64, name: CString, credentialType: CString,
        credential: CString): Int32

    func FfiAppAccountAppAccountManagerSetDataSyncEnabled(id: Int64, name: CString, isEnabled: Bool): Int32

    func FfiAppAccountAppAccountManagerSetCustomData(id: Int64, name: CString, key: CString, value: CString): Int32

    func FfiAppAccountAppAccountManagerGetAllAccounts(id: Int64): ErrCArrAppAccountInfo

    func FfiAppAccountAppAccountManagerGetAccountsByOwner(id: Int64, owner: CString): ErrCArrAppAccountInfo

    func FfiAppAccountAppAccountManagerGetCredential(id: Int64, name: CString, credentialType: CString): RetDataCString

    func FfiAppAccountAppAccountManagerGetCustomData(id: Int64, name: CString, key: CString): RetDataCString

    func FfiAppAccountAppAccountManagerOn(id: Int64, `type`: CString, owners: CArrString, callbackId: Int64): Int32

    func FfiAppAccountAppAccountManagerOff(id: Int64, `type`: CString, callbackId: Int64): Int32

    func FfiAppAccountAppAccountManagerGetAuthToken(id: Int64, name: CString, owner: CString, authType: CString): RetDataCString

    func FfiAppAccountAppAccountManagerSetAuthToken(id: Int64, name: CString, authType: CString, token: CString): Int32

    func FfiAppAccountAppAccountManagerDeleteAuthToken(id: Int64, name: CString, owner: CString, authType: CString,
        token: CString): Int32

    func FfiAppAccountAppAccountManagerSetAuthTokenVisibility(id: Int64, name: CString, authType: CString,
        bundleName: CString, isVisible: Bool): Int32

    func FfiAppAccountAppAccountManagerCheckAuthTokenVisibility(id: Int64, name: CString, authType: CString,
        bundleName: CString): RetDataBool

    func FfiAppAccountAppAccountManagerGetAllAuthTokens(id: Int64, name: CString, owner: CString): ErrCArrAuthTokenInfo

    func FfiAppAccountAppAccountManagerGetAuthList(id: Int64, name: CString, authType: CString): RetDataCArrString

    func FfiAppAccountAppAccountManagerQueryAuthenticatorInfo(id: Int64, owner: CString): ErrCAuthenticatorInfo

    func FfiAppAccountAppAccountManagerCheckAccountLabels(id: Int64, name: CString, owner: CString, labels: CArrString,
        callbackId: Int64): Int32

    func FfiAppAccountAppAccountManagerDeleteCredential(id: Int64, name: CString, credentialType: CString): Int32

    func FfiAppAccountAppAccountManagerSelectAccountsByOptions(id: Int64, options: CSelectAccountsOptions,
        callbackId: Int64): Int32

    func FfiAppAccountAppAccountManagerVerifyCredential(id: Int64, name: CString, owner: CString,
        callbackId: CAuthCallbackId, options: CVerifyCredentialOptions): Int32

    func FfiAppAccountAppAccountManagerSetAuthenticatorProperties(id: Int64, owner: CString,
        callbackId: CAuthCallbackId, options: CSetPropertiesOptions): Int32
}

unsafe func createCArrParam(parameters: HashMap<String, AppAccountValueType>): CArrParameters {
    let cp = safeMalloc<CParameters>(count: parameters.size)
    let ptr = CArrParameters(cp, parameters.size)
    var count = 0
    for ((k, v) in parameters) {
        let value = try {
            CParameters(Parameters(k, v))
        } catch (e: Exception) {
            freeCArrParam(ptr.head, count)
            LibC.free(cp)
            throw e
        }
        ptr.head.write(count, value)
        count++
    }
    return ptr
}

unsafe func freeCArrParam(cp: CPointer<CParameters>, index: Int64): Unit {
    for (i in 0..index) {
        cp.read(i).free()
    }
}

unsafe func createPtr<T>(value: T): CPointer<Unit> where T <: CType {
    let ptr = safeMalloc<T>()
    ptr.write(value)
    return CPointer<Unit>(ptr)
}

unsafe func createArrPtr<T>(value: Array<T>): CPointer<Unit> where T <: CType {
    let ptr = safeMalloc<T>(count: value.size)
    for (i in 0..value.size) {
        ptr.write(i, value[i])
    }
    return CPointer<Unit>(ptr)
}

unsafe func createCpCString(value: Array<String>): CPointer<CString> {
    let ptr = safeMalloc<CString>(count: value.size)
    for (i in 0..value.size) {
        try {
            ptr.write(i, LibC.mallocCString(value[i]))
        } catch (e: Exception) {
            freeCpCString(ptr, i)
            LibC.free(ptr)
            throw e
        }
    }
    return ptr
}

unsafe func freeCpCString(cp: CPointer<CString>, index: Int64): Unit {
    for (i in 0..index) {
        LibC.free(cp.read(i))
    }
}

func throwIfEmpty<T>(arr: Array<T>): Unit {
    if (arr.size == 0) {
        throw BusinessException(ERR_PARAMETER_ERROR, "Invalid input parameter.")
    }
}

func getValue(value: AppAccountValueType): (Int8, CPointer<Unit>, Int64) {
    unsafe {
        match (value) {
            case INT(v) => return (INT_TYPE, createPtr<Int32>(v), 1)
            case FLOAT64(v) => return (F64_TYPE, createPtr<Float64>(v), 1)
            case STRING(v) =>
                let ptr = LibC.mallocCString(v).getChars()
                return (STRING_TYPE, CPointer<Unit>(ptr), 1)
            case BOOL(v) => return (BOOL_TYPE, createPtr<Bool>(v), 1)
            case FD(v) => return (FD_TYPE, createPtr<Int32>(v), 1)
            case ARRSTRING(v) =>
                throwIfEmpty(v)
                let ptr = createCpCString(v)
                return (ARRSTRING_TYPE, CPointer<Unit>(ptr), v.size)
            case ARRAYI32(v) =>
                throwIfEmpty(v)
                return (ARRAYI32_TYPE, createArrPtr<Int32>(v), v.size)
            case ARRAYI64(v) =>
                throwIfEmpty(v)
                return (ARRAYI64_TYPE, createArrPtr<Int64>(v), v.size)
            case ARRAYBOOL(v) =>
                throwIfEmpty(v)
                return (ARRAYBOOL_TYPE, createArrPtr<Bool>(v), v.size)
            case ARRAYF64(v) =>
                throwIfEmpty(v)
                return (ARRAYF64_TYPE, createArrPtr<Float64>(v), v.size)
            case ARRAYFD(v) =>
                throwIfEmpty(v)
                return (ARRAYFD_TYPE, createArrPtr<Int32>(v), v.size)
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
