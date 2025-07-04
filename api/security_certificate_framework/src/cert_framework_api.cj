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

package ohos.cert

import ohos.base.BusinessException
import ohos.labels.*

/**
 * Provides to create X509 certificate object.
 * The returned object provides the data parsing or verification capability.
 *
 * @param { EncodingBlob } inStream - indicate the input cert data.
 * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br>2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 801 - this operation is not supported.
 * @throws { BusinessException } 19020001 - memory error.
 * @syscap SystemCapability.Security.Cert
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Cert"
]
public func createX509Cert(inStream: EncodingBlob): X509Cert {
    var retObj = CjX509Certificate()
    var cph = unsafe { acquireArrayRawData(inStream.data) }
    var blob = CfEncodingBlob(cph.pointer, UIntNative(inStream.data.size), inStream.encodingFormat)
    var retCode = unsafe { FfiCertCjX509CertificateNewInstance(inout blob, inout retObj) }
    unsafe { releaseArrayRawData(cph) }
    if (retCode != CfResult.CF_SUCCESS) {
        throw retCode.toEpt("Failed to create X509Cert class")
    }

    X509Cert(retObj)
}

/**
 * Provides to create certificate extension object.
 * The returned object provides the data parsing or verification capability.
 *
 * @param { EncodingBlob } inStream - indicate the input cert extensions data.
 * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br>2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 801 - this operation is not supported.
 * @throws { BusinessException } 19020001 - memory error.
 * @syscap SystemCapability.Security.Cert
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Cert"
]
public func createCertExtension(inStream: EncodingBlob): CertExtension {
    var retObj = CjCfObject()
    var cph = unsafe { acquireArrayRawData(inStream.data) }
    var blob = CfEncodingBlob(cph.pointer, UIntNative(inStream.data.size), inStream.encodingFormat)
    var retCode = unsafe { FfiCertCjCfObjectNewInstance(inout blob, inout retObj) }
    unsafe { releaseArrayRawData(cph) }

    if (retCode != CfResult.CF_SUCCESS) {
        throw retCode.toEpt("Failed to create CfObject class")
    }

    CertExtension(retObj)
}

/**
 * Provides to create certificate extension object.
 * The returned object provides the data parsing or verification capability.
 *
 * @param { EncodingBlob } inStream - indicate the input cert extensions data.
 * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br>2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 801 - this operation is not supported.
 * @throws { BusinessException } 19020001 - memory error.
 * @syscap SystemCapability.Security.Cert
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Cert"
]
public func createX509CRL(inStream: EncodingBlob): X509CRL {
    var retObj = CjX509Crl()
    var cph = unsafe { acquireArrayRawData(inStream.data) }
    var blob = CfEncodingBlob(cph.pointer, UIntNative(inStream.data.size), inStream.encodingFormat)
    var retCode = unsafe { FfiCertCjX509CrlNewInstance(inout blob, inout retObj) }
    unsafe { releaseArrayRawData(cph) }
    if (retCode != CfResult.CF_SUCCESS) {
        throw retCode.toEpt("Failed to create X509CRL class")
    }

    X509CRL(retObj)
}

/**
 * Provides to create certificate chain object. The returned object provides the verification capability.
 *
 * @param { String } algorithm - indicates the cert chain validator type.
 * @returns { CertChainValidator } the cert chain validator instance.
 * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br>2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 801 - this operation is not supported.
 * @throws { BusinessException } 19020001 - memory error.
 * @throws { BusinessException } 19020002 - runtime error.
 * @throws { BusinessException } 19030001 - crypto operation error.
 * @syscap SystemCapability.Security.Cert
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Cert"
]
public func createCertChainValidator(algorithm: String): CertChainValidator {
    var retObj = CjCertChainValidator()
    try (cAlg = unsafe { LibC.mallocCString(algorithm).asResource() }) {
        let retCode = unsafe { FfiCertCjCertChainValidatorNewInstance(cAlg.value, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("Failed to create CertChainValidator class")
        }
    }

    CertChainValidator(retObj, algorithm)
}

/**
 * create object CertCRLCollection
 *
 * @param { Array<X509Cert> } certs - array of X509Cert.
 * @param { Array<X509CRL> } [crls] - array of X509CRL.
 * @returns { CertCRLCollection }
 * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br>2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 19020001 - memory error.
 * @syscap SystemCapability.Security.Cert
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Cert"
]
public func createCertCRLCollection(certs: Array<X509Cert>, crls: ?Array<X509CRL>): CertCRLCollection {
    var retObj = CjCertCrlCollection()
    let _crl = crls.getOrDefault({=> Array()})
    var retCode: Int32 = 0
    unsafe {
        let cphCert = acquireArrayRawData(Array(certs.size, {i => certs[i].cert.cert}))
        var inCerts = HcfX509CertificateArray(cphCert.pointer, UInt32(certs.size))
        if (_crl.isEmpty()) {
            var inCrls = HcfX509CrlArray(CPointer(), 0)
            retCode = FfiCertCjCertCrlCollectionNewInstance(inout inCerts, inout inCrls, inout retObj)
        } else {
            let cphCrl = acquireArrayRawData(Array(_crl.size, {i => _crl[i].crl.crl}))
            var inCrls = HcfX509CrlArray(cphCrl.pointer, UInt32(certs.size))
            retCode = FfiCertCjCertCrlCollectionNewInstance(inout inCerts, inout inCrls, inout retObj)
            releaseArrayRawData(cphCrl)
        }
        releaseArrayRawData(cphCert)
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("Failed to create CertCrlCollection class")
        }
    }

    CertCRLCollection(retObj)
}

/**
 * Provides to create X509 certificate chain object.
 * The returned object provides the data parsing or verification capability.
 *
 * @param { EncodingBlob } inStream - indicate the input cert data.
 * @returns { X509CertChain }
 * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br>2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 19020001 - memory error.
 * @throws { BusinessException } 19030001 - crypto operation error.
 * @syscap SystemCapability.Security.Cert
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Cert"
]
public func createX509CertChain(inStream: EncodingBlob): X509CertChain {
    var retObj = CjX509CertChain()
    var cph = unsafe { acquireArrayRawData(inStream.data) }
    var blob = CfEncodingBlob(cph.pointer, UIntNative(inStream.data.size), inStream.encodingFormat)
    let retCode = unsafe { FfiCertCjX509CertChainNewInstanceBlob(inout blob, inout retObj) }
    unsafe { releaseArrayRawData(cph) }
    if (retCode != CfResult.CF_SUCCESS) {
        throw retCode.toEpt("Failed to create CertChain class")
    }

    X509CertChain(retObj)
}

/**
 * Create certificate chain object with certificate array.
 *
 * @param { Array<X509Cert> } certs - indicate the certificate array.
 * @returns { X509CertChain } the certificate chain object.
 * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br>2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 19020001 - memory error.
 * @throws { BusinessException } 19030001 - crypto operation error.
 * @syscap SystemCapability.Security.Cert
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Cert"
]
public func createX509CertChain(certs: Array<X509Cert>): X509CertChain {
    var retObj = CjX509CertChain()
    let hcfCerts = Array<CPointer<HcfX509Certificate>>(certs.size, {i => certs[i].cert.cert})
    let cph = unsafe { acquireArrayRawData(hcfCerts) }
    var hcfCertArray = HcfX509CertificateArray(cph.pointer, UInt32(certs.size))
    let retCode = unsafe { FfiCertCjX509CertChainNewInstanceArray(inout hcfCertArray, inout retObj) }
    unsafe { releaseArrayRawData(cph) }
    if (retCode != CfResult.CF_SUCCESS) {
        throw retCode.toEpt("Failed to create CertChain class")
    }

    X509CertChain(retObj)
}

/**
 * Create and validate a certificate chain with the build parameters.
 *
 * @param { CertChainBuildParameters } param - indicate the certificate chain build parameters.
 * @returns { CertChainBuildResult } the result of cert chain build.
 * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br>2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 19020001 - memory error.
 * @throws { BusinessException } 19020002 - runtime error.
 * @throws { BusinessException } 19030001 - crypto operation error.
 * @throws { BusinessException } 19030002 - the certificate signature verification failed.
 * @throws { BusinessException } 19030003 - the certificate has not taken effect.
 * @throws { BusinessException } 19030004 - the certificate has expired.
 * @throws { BusinessException } 19030005 - failed to obtain the certificate issuer.
 * @throws { BusinessException } 19030006 - the key cannot be used for signing a certificate.
 * @throws { BusinessException } 19030007 - the key cannot be used for digital signature.
 * @syscap SystemCapability.Security.Cert
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Cert"
]
public func buildX509CertChain(buildParams: CertChainBuildParameters): CertChainBuildResult {
    var returnObj = CjX509CertChain()
    var maxLength = buildParams.maxLength.getOrDefault({=> Int32.Max})
    var matchParams = buildParams.certMatchParameters.toNative()
    var validParams = try {
        buildParams.validationParameters.toNative()
    } catch (e: Exception) {
        matchParams.free()
        throw e
    }
    let retCode = unsafe {
        FfiCertBuildX509CertChain(inout matchParams, inout validParams, maxLength, inout returnObj)
    }
    matchParams.free()
    validParams.free()

    if (retCode != CfResult.CF_SUCCESS) {
        throw retCode.toEpt("Failed to create CertChain class")
    }
    let certChain = X509CertChain(returnObj)
    return CertChainBuildResult(certChain, certChain.validate(buildParams.validationParameters))
}

/**
 * Get trust anchor array from specified P12.
 *
 * @param { Array<Byte> } keystore - the file path of the P12.
 * @param { String } pwd - the password of the P12.
 * @returns { Array<X509TrustAnchor> } the trust anchor array.
 * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br>2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 19020001 - memory error.
 * @throws { BusinessException } 19020002 - runtime error.
 * @throws { BusinessException } 19030001 - crypto operation error.
 * @throws { BusinessException } 19030002 - the certificate signature verification failed.
 * @throws { BusinessException } 19030003 - the certificate has not taken effect.
 * @throws { BusinessException } 19030004 - the certificate has expired.
 * @throws { BusinessException } 19030005 - failed to obtain the certificate issuer.
 * @throws { BusinessException } 19030006 - the key cannot be used for signing a certificate.
 * @throws { BusinessException } 19030007 - the key cannot be used for digital signature.
 * @syscap SystemCapability.Security.Cert
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Cert"
]
public func createTrustAnchorsWithKeyStore(keystore: Bytes, pwd: String): Array<X509TrustAnchor> {
    var returnObj = CjX509TrustAnchorArray()
    var keyBlob = keystore.toCfBlob()
    var pwdBlob = try {
        pwd.toCfBlob()
    } catch (e: Exception) {
        keyBlob.free()
        throw e
    }
    let retCode = unsafe { FfiCertCreateTrustAnchorWithKeyStore(inout keyBlob, inout pwdBlob, inout returnObj) }
    keyBlob.free()
    pwdBlob.free()
    if (retCode != CfResult.CF_SUCCESS) {
        throw retCode.toEpt("Failed to create X509TrustAnchor class")
    }
    let trustArray = returnObj
    let _data = trustArray.data
    let ret = Array(
        Int64(trustArray.count),
        {
            // no exception thrown!
            i => X509TrustAnchor(unsafe { _data.read(i) }, needFree: true)
        }
    )
    unsafe { LibC.free(trustArray.data) }
    ret
}

/**
 * Create X500DistinguishedName object with the name in string format.
 *
 * @param { String } nameStr - the string format of the Name type defined by X509.
 * @returns { X500DistinguishedName } the distinguished name.
 * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br>2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 19020001 - memory error.
 * @throws { BusinessException } 19020002 - runtime error.
 * @throws { BusinessException } 19030001 - crypto operation error.
 * @throws { BusinessException } 19030002 - the certificate signature verification failed.
 * @throws { BusinessException } 19030003 - the certificate has not taken effect.
 * @throws { BusinessException } 19030004 - the certificate has expired.
 * @throws { BusinessException } 19030005 - failed to obtain the certificate issuer.
 * @throws { BusinessException } 19030006 - the key cannot be used for signing a certificate.
 * @throws { BusinessException } 19030007 - the key cannot be used for digital signature.
 * @syscap SystemCapability.Security.Cert
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Cert"
]
public func createX500DistinguishedName(nameStr: String): X500DistinguishedName {
    var retObj = CjX500DistinguishedName()
    var blob = nameStr.toCfBlob()
    let retCode = unsafe { FfiCertCjX500DistinguishedNameNewInstance(inout blob, true, inout retObj) }
    blob.free()
    if (retCode != CfResult.CF_SUCCESS) {
        throw retCode.toEpt("Failed to create X500DistinguishedName class")
    }

    X500DistinguishedName(retObj)
}

/**
 * Create X500DistinguishedName object with the name in DER format.
 *
 * @param { Array<Byte> } nameDer - the DER format of the Name type defined by X509.
 * @returns { X500DistinguishedName } the distinguished name.
 * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br>2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 19020001 - memory error.
 * @throws { BusinessException } 19020002 - runtime error.
 * @throws { BusinessException } 19030001 - crypto operation error.
 * @throws { BusinessException } 19030002 - the certificate signature verification failed.
 * @throws { BusinessException } 19030003 - the certificate has not taken effect.
 * @throws { BusinessException } 19030004 - the certificate has expired.
 * @throws { BusinessException } 19030005 - failed to obtain the certificate issuer.
 * @throws { BusinessException } 19030006 - the key cannot be used for signing a certificate.
 * @throws { BusinessException } 19030007 - the key cannot be used for digital signature.
 * @syscap SystemCapability.Security.Cert
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Cert"
]
public func createX500DistinguishedName(nameDer: Bytes): X500DistinguishedName {
    var retObj = CjX500DistinguishedName()
    var blob = nameDer.toCfBlob()
    let retCode = unsafe { FfiCertCjX500DistinguishedNameNewInstance(inout blob, false, inout retObj) }
    blob.free()
    if (retCode != CfResult.CF_SUCCESS) {
        throw retCode.toEpt("Failed to create X500DistinguishedName class")
    }

    X500DistinguishedName(retObj)
}
