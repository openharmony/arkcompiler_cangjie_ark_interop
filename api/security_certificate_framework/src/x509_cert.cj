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

import ohos.labels.*
import ohos.base.BusinessException
import std.math.numeric.BigInt
import ohos.crypto.PubKey

/**
 * Provides the x509 cert type.
 *
 * @typedef X509Cert
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
public class X509Cert <: ToString {
    X509Cert(let cert: CjX509Certificate) {}

    ~init() {
        unsafe { FfiCertCjX509CertificateDeleteInstance(this.cert) }
    }

    /**
     * Verify the X509 cert.
     *
     * @param { crypto.PubKey } key - public key to verify cert.
     * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
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
    public func verify(key: PubKey): Unit {
        let retCode = unsafe { FfiCertCjX509CertificateVerify(this.cert, key.getRawPointer()) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("verify cert failed")
        }
    }

    /**
     * Get X509 cert encoded data.
     *
     * @param { EncodingBlob } blob - cert encoded data.
     * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types;
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
    public func getEncoded(): EncodingBlob {
        var retObj = CfEncodingBlob()
        let retCode = unsafe { FfiCertCjX509CertificateGetEncoded(this.cert, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get cert encoded failed")
        }
        return retObj.toEncodingBlob(needFree: true)
    }

    /**
     * Get X509 cert public key.
     *
     * @returns { cryptoFramework.PubKey } X509 cert pubKey.
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
    public func getPublicKey(): PubKey {
        var retPtr = CPointer<Unit>()
        let retCode = unsafe { FfiCertCjX509CertificateGetPublicKey(this.cert, inout retPtr) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get public key failed")
        }
        return PubKey.createFromRawPointer(retPtr)
    }

    /**
     * Check the X509 cert validity with date.
     *
     * @param { String } date - indicates the cert date.
     * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 19020001 - memory error.
     * @throws { BusinessException } 19030001 - crypto operation error.
     * @throws { BusinessException } 19030003 - the certificate has not taken effect.
     * @throws { BusinessException } 19030004 - the certificate has expired.
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
    public func checkValidityWithDate(date: String): Unit {
        try (cDate = unsafe { LibC.mallocCString(date).asResource() }) {
            let retCode = unsafe { FfiCertCjX509CertificateCheckValidityWithDate(this.cert, cDate.value) }
            if (retCode != CfResult.CF_SUCCESS) {
                throw retCode.toEpt("check cert validity failed")
            }
        }
    }

    /**
     * Get X509 cert version.
     *
     * @returns { Int32 } X509 cert version.
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
    public func getVersion(): Int32 {
        return unsafe { FfiCertCjX509CertificateGetVersion(this.cert) }
    }

    /**
     * Get X509 cert serial number.
     *
     * @returns { BigInt } X509 cert serial number.
     * @throws { BusinessException } 19020002 - runtime error.
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
    public func getCertSerialNumber(): BigInt {
        var retObj = CfBlob()
        let retCode = unsafe { FfiCertCjX509CertificateGetSerialNumber(this.cert, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("cert get serial num failed")
        }
        return retObj.toBigInt(needFree: true)
    }

    /**
     * Get X509 cert issuer name.
     *
     * @returns { DataBlob } X509 cert issuer name.
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
    public func getIssuerName(): DataBlob {
        var retObj = CfBlob()
        let retCode = unsafe { FfiCertCjX509CertificateGetIssuerName(this.cert, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get issuer name failed")
        }
        return retObj.toDataBlob(needFree: true)
    }

    /**
     * Get X509 cert subject name.
     *
     * @returns { DataBlob } X509 cert subject name.
     * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Incorrect parameter types;
     * <br>2. Parameter verification failed.
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
    public func getSubjectName(): DataBlob {
        var retObj = CfBlob()
        let retCode = unsafe { FfiCertCjX509CertificateGetSubjectName(this.cert, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get subject name failed")
        }
        return retObj.toDataBlob(needFree: true)
    }

    /**
     * Get X509 cert subject name.
     *
     * @param { EncodingType } [encodingType] indicates the encoding type.
     * @returns { DataBlob } X509 cert subject name.
     * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Incorrect parameter types;
     * <br>2. Parameter verification failed.
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
    public func getSubjectName(encodingType: EncodingType): DataBlob {
        var retObj = CfBlob()
        let retCode = unsafe {
            FfiCertCjX509CertificateGetSubjectNameEx(this.cert, encodingType.getValue(), inout retObj)
        }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get subject name failed")
        }
        return retObj.toDataBlob(needFree: true)
    }

    /**
     * Get X509 cert not before time.
     *
     * @returns { String } X509 cert not before time.
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
    public func getNotBeforeTime(): String {
        var retObj = CfBlob()
        let retCode = unsafe { FfiCertCjX509CertificateGetNotBeforeTime(this.cert, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get not before time failed")
        }
        return retObj.toStringCstr(needFree: true)
    }

    /**
     * Get X509 cert not after time.
     *
     * @returns { String } X509 cert not after time.
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
    public func getNotAfterTime(): String {
        var retObj = CfBlob()
        let retCode = unsafe { FfiCertCjX509CertificateGetNotAfterTime(this.cert, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get not after time failed")
        }
        return retObj.toStringCstr(needFree: true)
    }

    /**
     * Get X509 cert signature.
     *
     * @returns { DataBlob } X509 cert signature.
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
    public func getSignature(): DataBlob {
        var retObj = CfBlob()
        let retCode = unsafe { FfiCertCjX509CertificateGetSignature(this.cert, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get signature failed")
        }
        return retObj.toDataBlob(needFree: true)
    }

    /**
     * Get X509 cert signature's algorithm name.
     *
     * @returns { String } X509 cert signature's algorithm name.
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
    public func getSignatureAlgName(): String {
        var retObj = CfBlob()
        let retCode = unsafe { FfiCertCjX509CertificateGetSignatureAlgName(this.cert, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get signature alg name failed")
        }
        return retObj.toStringCstr(needFree: true)
    }

    /**
     * Get X509 cert signature's algorithm oid.
     *
     * @returns { String } X509 cert signature's algorithm oid.
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
    public func getSignatureAlgOid(): String {
        var retObj = CfBlob()
        let retCode = unsafe { FfiCertCjX509CertificateGetSignatureAlgOid(this.cert, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get signature alg oid failed")
        }
        return retObj.toStringCstr(needFree: true)
    }

    /**
     * Get X509 cert signature's algorithm name.
     *
     * @returns { DataBlob } X509 cert signature's algorithm name.
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
    public func getSignatureAlgParams(): DataBlob {
        var retObj = CfBlob()
        let retCode = unsafe { FfiCertCjX509CertificateGetSignatureAlgParams(this.cert, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get signature alg params failed")
        }
        return retObj.toDataBlob(needFree: true)
    }

    /**
     * Get X509 cert key usage.
     *
     * @returns { DataBlob } X509 cert key usage.
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
    public func getKeyUsage(): DataBlob {
        var retObj = CfBlob()
        let retCode = unsafe { FfiCertCjX509CertificateGetKeyUsage(this.cert, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get key usage failed")
        }
        return retObj.toDataBlob(needFree: true)
    }

    /**
     * Get X509 cert extended key usage.
     *
     * @returns { Array<DataBlob> } X509 cert extended key usage.
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
    public func getExtKeyUsage(): Array<DataBlob> {
        var retObj = CfArray()
        let retCode = unsafe { FfiCertCjX509CertificateGetExtKeyUsage(this.cert, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get ext key usage failed")
        }
        return retObj.toDataBlobArray(needFree: true)
    }

    /**
     * Get X509 cert basic constraints path len.
     *
     * @returns { Int32 } X509 cert basic constraints path len.
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
    public func getBasicConstraints(): Int32 {
        unsafe { FfiCertCjX509CertificateGetBasicConstraints(this.cert) }
    }

    /**
     * Get X509 cert subject alternative name.
     *
     * @returns { Array<DataBlob> } X509 cert subject alternative name.
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
    public func getSubjectAltNames(): Array<DataBlob> {
        var retObj = CfArray()
        let retCode = unsafe { FfiCertCjX509CertificateGetSubjectAltNames(this.cert, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get subject alt names failed")
        }
        return retObj.toDataBlobArray(needFree: true)
    }

    /**
     * Get X509 cert issuer alternative name.
     *
     * @returns { Array<DataBlob> } X509 cert issuer alternative name.
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
    public func getIssuerAltNames(): Array<DataBlob> {
        var retObj = CfArray()
        let retCode = unsafe { FfiCertCjX509CertificateGetIssuerAltNames(this.cert, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get issuer alt names failed")
        }
        return retObj.toDataBlobArray(needFree: true)
    }

    /**
     * Get certificate item value.
     *
     * @param { CertItemType } itemType
     * @returns { DataBlob } cert item value.
     * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
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
    public func getItem(itemType: CertItemType): DataBlob {
        var retObj = CfBlob()
        let retCode = unsafe { FfiCertCjX509CertificateGetItem(this.cert, itemType.getValue(), inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get item failed")
        }

        return retObj.toDataBlob(needFree: true)
    }

    /**
     * Check the X509 cert if match the parameters.
     *
     * @param { X509CertMatchParameters } param - indicate the match parameters.
     * @returns { Bool } true - match X509Cert, false - not match.
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
    public func isMatch(param: X509CertMatchParameters): Bool {
        var ret: Bool = false
        var matchParams: CjX509CertMatchParams = param.toNative()
        let retCode = unsafe { FfiCertCjX509CertificateMatch(this.cert, inout matchParams, inout ret) }
        // `matchParams` contains inner ptr, keep param alive to avoid finilization
        matchParams.free()
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("is match failed")
        }
        ret
    }

    /**
     * Obtain CRL distribution points.
     *
     * @returns { Array<DataBlob> } X509 cert CRL distribution points.
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
    public func getCRLDistributionPoint(): Array<DataBlob> {
        var retObj = CfArray()
        let retCode = unsafe { FfiCertCjX509CertificateGetCRLDistributionPointsURI(this.cert, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get crl distribution points URI failed")
        }
        return retObj.toDataBlobArray(needFree: true)
    }

    /**
     * Get X500 distinguished name of the issuer.
     *
     * @returns { X500DistinguishedName } X500 distinguished name object.
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
    public func getIssuerX500DistinguishedName(): X500DistinguishedName {
        var blob = CfBlob()
        var retCode = unsafe { FfiCertCjX509CertificateGetIssuerName(this.cert, inout blob) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get issuer name failed")
        }
        var x509Name = CjX500DistinguishedName()
        retCode = unsafe { FfiCertCjX500DistinguishedNameNewInstance(inout blob, true, inout x509Name) }
        blob.free()
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("create X500DistinguishedName class failed")
        }
        X500DistinguishedName(x509Name)
    }

    /**
     * Get X500 distinguished name of the subject.
     *
     * @returns { X500DistinguishedName } X500 distinguished name object.
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
    public func getSubjectX500DistinguishedName(): X500DistinguishedName {
        var blob = CfBlob()
        var retCode = unsafe { FfiCertCjX509CertificateGetSubjectName(this.cert, inout blob) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get subject name failed")
        }
        var x509Name = CjX500DistinguishedName()
        retCode = unsafe { FfiCertCjX500DistinguishedNameNewInstance(inout blob, true, inout x509Name) }
        blob.free()
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("create X500DistinguishedName class failed")
        }
        X500DistinguishedName(x509Name)
    }

    /**
     * Get the string type data of the object.
     *
     * @returns { String } the string type data of the object.
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
    public func toString(): String {
        var retObj = CfBlob()
        let retCode = unsafe { FfiCertCjX509CertificateToString(this.cert, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("toString failed")
        }
        return retObj.toStringUtf8(needFree: true)
    }

    /**
     * Get the hash value of DER format data.
     *
     * @returns { Array<Byte> } the hash value of DER format data.
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
    public func hashCode(): Bytes {
        var retObj = CfBlob()
        let retCode = unsafe { FfiCertCjX509CertificateHashCode(this.cert, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("hashCode failed")
        }
        return retObj.toBytes(needFree: true)
    }

    /**
     * Get the extension der encoding data for the corresponding entity.
     *
     * @returns { CertExtension } the certExtension object.
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
    public func getExtensionsObject(): CertExtension {
        var retObj = CfBlob()
        let retCode = unsafe { FfiCertCjX509CertificateGetExtensionsObject(this.cert, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get extensions object failed")
        }
        let inStream = EncodingBlob(retObj.toBytes(needFree: true), EncodingFormat.FORMAT_DER)
        createCertExtension(inStream)
    }
}
