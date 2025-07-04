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

package ohos.cert_manager

import std.collection.ArrayList
import ohos.base.BusinessException
import ohos.labels.*

type Bytes = Array<Byte>

/**
 * Install private application certificate.
 *
 * @permission ohos.permission.ACCESS_CERT_MANAGER
 * @param { Bytes } keystore - Indicates the keystore file with key pair and certificate.
 * @param { String } keystorePwd - Indicates the password of keystore file.
 * @param { String } certAlias - Indicates the certificate name inputted by the user.
 * @returns { String } - The uri of installed certificate.
 * @throws { BusinessException } 201 - Permission verification failed.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 17500001 - Internal error.
 * @throws { BusinessException } 17500003 - The keystore is in an invalid format or the keystore password is incorrect.
 * @throws { BusinessException } 17500004 - The number of certificates or credentials reaches the maximum allowed.
 * @syscap SystemCapability.Security.CertificateManager
 */
@!APILevel[
    19,
    permission: "ohos.permission.ACCESS_CERT_MANAGER",
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CertificateManager"
]
public func installPrivateCertificate(keystore: Bytes, keystorePwd: String, certAlias: String): String {
    var appCertBlob = CmBlob()
    var appCertPwdBlob = CmBlob()
    var certAliasBlob = CmBlob()
    var keyUriBlob = CmBlob()
    try {
        appCertBlob = keystore.toCmBlob()
        appCertPwdBlob = keystorePwd.toCmBlob()
        certAliasBlob = certAlias.toCmBlob()
        keyUriBlob = CmBlob.malloc(MAX_LEN_URI)
    } catch (e: Exception) {
        appCertBlob.free()
        appCertPwdBlob.free()
        certAliasBlob.free()
        keyUriBlob.free()
        throw e
    }

    let resCode: Int32 = unsafe {
        FfiCertManagerInstallAppCert(inout appCertBlob, inout appCertPwdBlob, inout certAliasBlob,
            APPLICATION_PRIVATE_CERTIFICATE_STORE, inout keyUriBlob)
    }
    appCertBlob.free()
    appCertPwdBlob.free()
    certAliasBlob.free()

    if (resCode != ErrorCode.CM_SUCCESS) {
        keyUriBlob.free()
        throw BusinessException(resCode.toEpt(), "Install private certificate failed")
    }

    keyUriBlob.toString(needFree: true)
}

/**
 * Uninstall the specified normal application certificate.
 *
 * @permission ohos.permission.ACCESS_CERT_MANAGER
 * @param { String } keyUri - Indicates key's name.
 * @throws { BusinessException } 201 - Permission verification failed.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 17500001 - Internal error.
 * @throws { BusinessException } 17500002 - The certificate does not exist.
 * @syscap SystemCapability.Security.CertificateManager
 */
@!APILevel[
    19,
    permission: "ohos.permission.ACCESS_CERT_MANAGER",
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CertificateManager"
]
public func uninstallPrivateCertificate(keyUri: String): Unit {
    var keyUriBlob: CmBlob = keyUri.toCmBlob()
    let resCode: Int32 = unsafe {
        FfiCertManagerUninstallAppCert(inout keyUriBlob, APPLICATION_PRIVATE_CERTIFICATE_STORE)
    }
    keyUriBlob.free()
    if (resCode != ErrorCode.CM_SUCCESS) {
        throw BusinessException(resCode.toEpt(), "Uninstall private certificate failed")
    }
}

/**
 * Get the detail of private application certificate.
 *
 * @permission ohos.permission.ACCESS_CERT_MANAGER
 * @param { String } keyUri - Indicates key's name.
 * @returns { Credential } The credential of certificate.
 * @throws { BusinessException } 201 - Permission verification failed.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 17500001 - Internal error.
 * @throws { BusinessException } 17500002 - The certificate does not exist.
 * @syscap SystemCapability.Security.CertificateManager
 */
@!APILevel[
    19,
    permission: "ohos.permission.ACCESS_CERT_MANAGER",
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CertificateManager"
]
public func getPrivateCertificate(keyUri: String): Credential {
    var keyUriBlob: CmBlob = keyUri.toCmBlob()
    var retObject = CjCredential()
    let resCode: Int32 = unsafe {
        FfiCertManagerGetAppCert(inout keyUriBlob, APPLICATION_PRIVATE_CERTIFICATE_STORE, inout retObject)
    }
    keyUriBlob.free()

    if (resCode != ErrorCode.CM_SUCCESS) {
        throw BusinessException(resCode.toEpt(), "Get the detail of private application certificate failed")
    }
    let cred = Credential(retObject)
    retObject.free()
    cred
}

/**
 * Get the detail of public application certificate.
 *
 * @permission ohos.permission.ACCESS_CERT_MANAGER
 * @param { String } keyUri - Indicates the key's name.
 * @returns { Credential } The credential of certificate.
 * @throws { BusinessException } 201 - Permission verification failed.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 17500001 - Internal error.
 * @throws { BusinessException } 17500002 - The certificate does not exist.
 * @throws { BusinessException } 17500005 - The application is not authorized by the user.
 * @syscap SystemCapability.Security.CertificateManager
 */
@!APILevel[
    19,
    permission: "ohos.permission.ACCESS_CERT_MANAGER",
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CertificateManager"
]
public func getPublicCertificate(keyUri: String): Credential {
    var keyUriBlob: CmBlob = keyUri.toCmBlob()
    var retObject = CjCredential()
    let resCode: Int32 = unsafe {
        FfiCertManagerGetAppCert(inout keyUriBlob, APPLICATION_CERTIFICATE_STORE, inout retObject)
    }
    keyUriBlob.free()
    if (resCode != ErrorCode.CM_SUCCESS) {
        throw BusinessException(resCode.toEpt(), "Get the detail of public application certificate failed")
    }
    let cred = Credential(retObject)
    retObject.free()
    cred
}

/** :
 * Whether the current application is authorized by the specified public application certificate.
 *
 * @permission ohos.permission.ACCESS_CERT_MANAGER
 * @param { String } keyUri - Indicates the key's name.
 * @returns { Bool } The result returned by the function.
 * @throws { BusinessException } 201 - Permission verification failed.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 17500001 - Internal error.
 * @syscap SystemCapability.Security.CertificateManager
 */
@!APILevel[
    19,
    permission: "ohos.permission.ACCESS_CERT_MANAGER",
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CertificateManager"
]
public func isAuthorizedApp(keyUri: String): Bool {
    var keyUriBlob: CmBlob = keyUri.toCmBlob()
    let resCode: Int32 = unsafe { FfiCertManagerIsAuthorizedApp(inout keyUriBlob) }
    keyUriBlob.free()
    if (resCode == ErrorCode.CM_SUCCESS) {
        true
    } else if (resCode == ErrorCode.NO_AUTHORIZATION) {
        false
    } else {
        throw BusinessException(resCode.toEpt(), "Check whether the current application is authorized failed")
    }
}

/**
 * Get a list of all user trusted CA certificates.
 *
 * @permission ohos.permission.ACCESS_CERT_MANAGER
 * @returns { Array<CertAbstract> } A list of all user trusted CA certificates.
 * @throws { BusinessException } 201 - Permission verification failed.
 * @throws { BusinessException } 17500001 - Internal error.
 * @syscap SystemCapability.Security.CertificateManager
 */
@!APILevel[
    19,
    permission: "ohos.permission.ACCESS_CERT_MANAGER",
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CertificateManager"
]
public func getAllUserTrustedCertificates(): Array<CertAbstract> {
    var retCount = 0_u32
    var retObject = CPointer<CjCertAbstract>()
    let resCode: Int32 = unsafe { FfiCertManagerGetUserCertList(CM_USER_TRUSTED_STORE, inout retCount, inout retObject) }
    if (resCode != ErrorCode.CM_SUCCESS) {
        throw BusinessException(resCode.toEpt(), "Get a list of all user trusted CA certificates failed")
    }
    let certList: ArrayList<CertAbstract> = ArrayList<CertAbstract>()
    for (i in 0..retCount) {
        let ptr = unsafe { retObject.read(Int64(i)) }
        certList.add(CertAbstract(ptr))
        ptr.free()
    }
    unsafe { LibC.free(retObject) }
    certList.toArray()
}

/**
 * Get the detail of user trusted CA certificate.
 *
 * @permission ohos.permission.ACCESS_CERT_MANAGER
 * @param { String } certUri - Indicates the certificate's name.
 * @returns { CertInfo } The detail of an user trusted CA certificate.
 * @throws { BusinessException } 201 - Permission verification failed.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 17500001 - Internal error.
 * @throws { BusinessException } 17500002 - The certificate does not exist.
 * @syscap SystemCapability.Security.CertificateManager
 */
@!APILevel[
    19,
    permission: "ohos.permission.ACCESS_CERT_MANAGER",
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CertificateManager"
]
public func getUserTrustedCertificate(certUri: String): CertInfo {
    var uriBlob = CmBlob()
    var infoBlob = CmBlob()
    try {
        uriBlob = certUri.toCmBlob()
        infoBlob = CmBlob.malloc(MAX_LEN_CERTIFICATE)
    } catch (e: Exception) {
        uriBlob.free()
        infoBlob.free()
        throw e
    }
    var cjcertInfo: CjCertInfo = CjCertInfo()
    let resCode = unsafe { FfiCertManagerGetUserCertInfo(inout uriBlob, CM_USER_TRUSTED_STORE, inout cjcertInfo) }
    uriBlob.free()
    infoBlob.free()
    if (resCode != ErrorCode.CM_SUCCESS) {
        throw BusinessException(resCode.toEpt(), "Get the detail of user trusted CA certificate failed")
    }
    let certInfo: CertInfo = CertInfo(cjcertInfo)
    cjcertInfo.free()
    certInfo
}

/**
 * Use credentials to perform initial operations of signing and verifying signatures.
 *
 * @permission ohos.permission.ACCESS_CERT_MANAGER
 * @param { String } authUri - Indicates the authentication credentials's name.
 * @param { CMSignatureSpec } spec - Indicates the set of parameters used for signature and signature verification operations.
 * @returns { CMHandle } The handle of crypto context.
 * @throws { BusinessException } 201 - Permission verification failed.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 17500001 - Internal error.
 * @throws { BusinessException } 17500002 - The certificate does not exist.
 * @throws { BusinessException } 17500005 - The application is not authorized by the user.
 * @syscap SystemCapability.Security.CertificateManager
 */
@!APILevel[
    19,
    permission: "ohos.permission.ACCESS_CERT_MANAGER",
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CertificateManager"
]
public func `init`(authUri: String, spec: CMSignatureSpec): CMHandle {
    var cjSpec: CjSignatureSpec = CjSignatureSpec(spec)
    var authUriBlob = CmBlob()
    var handleBlob = CmBlob()
    try {
        authUriBlob = authUri.toCmBlob()
        handleBlob = CmBlob.malloc(OUT_HANLDE_SIZE)
    } catch (e: Exception) {
        authUriBlob.free()
        handleBlob.free()
        throw e
    }
    let retCode = unsafe { FfiCertManagerInit(inout authUriBlob, inout cjSpec, inout handleBlob) }
    authUriBlob.free()
    if (retCode != ErrorCode.CM_SUCCESS) {
        handleBlob.free()
        throw BusinessException(retCode.toEpt(), "Initial operations failed")
    }
    CMHandle(handleBlob.toBytes(needFree: true))
}

/**
 * Data update operations for signature and signature verification.
 *
 * @permission ohos.permission.ACCESS_CERT_MANAGER
 * @param { Bytes } handle - Indicates the handle returned by the initialization operation.
 * @param { Bytes } data - Indicates the data to be signed and verified.
 * @throws { BusinessException } 201 - Permission verification failed.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 17500001 - Internal error.
 * @syscap SystemCapability.Security.CertificateManager
 */
@!APILevel[
    19,
    permission: "ohos.permission.ACCESS_CERT_MANAGER",
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CertificateManager"
]
public func update(handle: CMHandle, data: Bytes): Unit {
    var handleBlob = CmBlob()
    var dataBlob = CmBlob()
    try {
        handleBlob = handle.handle.toCmBlob()
        dataBlob = data.toCmBlob()
    } catch (e: Exception) {
        handleBlob.free()
        dataBlob.free()
        throw e
    }
    let retCode = unsafe { FfiCertManagerUpdate(inout handleBlob, inout dataBlob) }
    handleBlob.free()
    dataBlob.free()
    if (retCode != ErrorCode.CM_SUCCESS) {
        throw BusinessException(retCode.toEpt(), "Update operations failed")
    }
}

/**
 * Verification operations.
 *
 * @permission ohos.permission.ACCESS_CERT_MANAGER
 * @param { Bytes } handle - Indicates the handle returned by the initialization operation.
 * @param { Bytes } handle - Indicates the signature data.
 * @throws { BusinessException } 201 - Permission verification failed.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 17500001 - Internal error.
 * @syscap SystemCapability.Security.CertificateManager
 */
@!APILevel[
    19,
    permission: "ohos.permission.ACCESS_CERT_MANAGER",
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CertificateManager"
]
public func finish(handle: CMHandle, signature: Bytes): Unit {
    var handleBlob = CmBlob()
    var signBlob = CmBlob()
    var outData: CmBlob = CmBlob()
    try {
        handleBlob = handle.handle.toCmBlob()
        signBlob = signature.toCmBlob()
    } catch (e: Exception) {
        handleBlob.free()
        signBlob.free()
        throw e
    }
    let retCode = unsafe { FfiCertManagerFinish(inout handleBlob, inout signBlob, inout outData) }
    handleBlob.free()
    signBlob.free()
    // `outData` is a place holder, after signature verified, don't free it.
    if (retCode != ErrorCode.CM_SUCCESS) {
        throw BusinessException(retCode.toEpt(), "Verification operations failed")
    }
}

/**
 * Complete signature operations.
 *
 * @permission ohos.permission.ACCESS_CERT_MANAGER
 * @param { Bytes } handle - Indicates the handle returned by the initialization operation.
 * @param { Bytes } handle - Indicates the signature data.
 * @returns { Bytes } The signature result.
 * @throws { BusinessException } 201 - Permission verification failed.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 17500001 - Internal error.
 * @syscap SystemCapability.Security.CertificateManager
 */
@!APILevel[
    19,
    permission: "ohos.permission.ACCESS_CERT_MANAGER",
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CertificateManager"
]
public func finish(handle: CMHandle): Bytes {
    var handleBlob = CmBlob()
    var inData = CmBlob()
    var outData = CmBlob()
    try {
        handleBlob = handle.handle.toCmBlob()
        outData = CmBlob.malloc(OUT_SIGNATURE_SIZE)
    } catch (e: Exception) {
        handleBlob.free()
        outData.free()
        throw e
    }
    let retCode = unsafe { FfiCertManagerFinish(inout handleBlob, inout inData, inout outData) }
    // `inData` is a place holder, after signature verified, don't free it.
    handleBlob.free()
    if (retCode != ErrorCode.CM_SUCCESS) {
        outData.free()
        throw BusinessException(retCode.toEpt(), "Complete signature operations failed")
    }
    outData.toBytes(needFree: true)
}

/**
 * Stop signing and verifying operations.
 *
 * @permission ohos.permission.ACCESS_CERT_MANAGER
 * @param { Bytes } handle - Indicates the handle returned by the initialization operation.
 * @throws { BusinessException } 201 - Permission verification failed.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 17500001 - Internal error.
 * @syscap SystemCapability.Security.CertificateManager
 */
@!APILevel[
    19,
    permission: "ohos.permission.ACCESS_CERT_MANAGER",
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CertificateManager"
]
public func abort(handle: CMHandle): Unit {
    var handleBlob: CmBlob = handle.handle.toCmBlob()
    let retCode = unsafe { FfiCertManagerAbort(inout handleBlob) }
    handleBlob.free()
    if (retCode != ErrorCode.CM_SUCCESS) {
        throw BusinessException(retCode.toEpt(), "Stop signing and verifying operations failed")
    }
}
