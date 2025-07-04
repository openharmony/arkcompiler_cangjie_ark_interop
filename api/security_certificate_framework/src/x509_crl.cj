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
 * Interface of X509CRLEntry.
 *
 * @typedef X509CRLEntry
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
public class X509CRL <: ToString {
    X509CRL(let crl: CjX509Crl) {}

    ~init() {
        unsafe { FfiCertCjX509CrlDeleteInstance(this.crl) }
    }
    /**
     * Check if the given certificate is on this CRL.
     *
     * @param { X509Cert } cert - input cert data.
     * @returns { Bool } result of Check cert is revoked or not.
     * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
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
    public func isRevoked(cert: X509Cert): Bool {
        return unsafe { FfiCertCjX509CrlIsRevoked(this.crl, cert.cert.cert) }
    }

    /**
     * Returns the type of this CRL.
     *
     * @returns { String } string of CRL type.
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
    public func getType(): String {
        // don't free constant string
        return unsafe { FfiCertCjX509CrlGetType(this.crl).toString() }
    }

    /**
     * Get the der coding format.
     *
     * @returns { EncodingBlob } the CRL blob data.
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
        let retCode = unsafe { FfiCertCjX509CrlGetEncoded(this.crl, inout retObj) }

        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get cert encoded failed")
        }
        return retObj.toEncodingBlob(needFree: true)
    }

    /**
     * Use the public key to verify the signature of CRL.
     *
     * @param { cryptoFramework.PubKey } key - input public Key.
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
        let retCode = unsafe { FfiCertCjX509CrlVerify(this.crl, key.getRawPointer()) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("verify cert failed")
        }
    }

    /**
     * Get version number from CRL.
     *
     * @returns { Int32 } version of CRL.
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
        return unsafe { FfiCertCjX509CrlGetVersion(this.crl) }
    }

    /**
     * Get the issuer name from CRL. Issuer means the entity that signs and publishes the CRL.
     *
     * @returns { DataBlob } issuer name of CRL.
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
        let retCode = unsafe { FfiCertCjX509CrlGetIssuerName(this.crl, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get issuer name failed")
        }
        return retObj.toDataBlob(needFree: true)
    }
    /**
     * Get lastUpdate value from CRL.
     *
     * @returns { String } last update of CRL.
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
    public func getLastUpdate(): String {
        var retObj = CfBlob()
        let retCode = unsafe { FfiCertCjX509CrlGetLastUpdate(this.crl, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get last update failed")
        }
        return retObj.toStringCstr(needFree: true)
    }

    /**
     * Get nextUpdate value from CRL.
     *
     * @returns { String } next update of CRL.
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
    public func getNextUpdate(): String {
        var retObj = CfBlob()
        let retCode = unsafe { FfiCertCjX509CrlGetNextUpdate(this.crl, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get next update failed")
        }
        return retObj.toStringCstr(needFree: true)
    }

    /**
     * This method can be used to find CRL entries in specified CRLs.
     *
     * @param { BigInt } serialNumber - serial number of CRL.
     * @returns { X509CRLEntry } next update of CRL.
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
    public func getRevokedCert(serialNumber: BigInt): X509CRLEntry {
        var retObj = CjX509CrlEntry()
        var bigint = serialNumber.toCfBlob()
        let retCode = unsafe { FfiCertCjX509CrlGetRevokedCert(this.crl, inout bigint, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get revoked cert failed")
        }
        return X509CRLEntry(retObj)
    }

    /**
     * This method can be used to find CRL entries in specified cert.
     *
     * @param { X509Cert } cert - cert of x509.
     * @returns { X509CRLEntry } X509CRLEntry instance.
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
    public func getRevokedCertWithCert(cert: X509Cert): X509CRLEntry {
        var retObj = CjX509CrlEntry()
        let retCode = unsafe { FfiCertCjX509CrlGetRevokedCertWithCert(this.crl, cert.cert.cert, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get revoked cert with cert failed")
        }
        return X509CRLEntry(retObj)
    }

    /**
     * Get all entries in this CRL.
     *
     * @returns { Array<X509CRLEntry> } the X509CRLEntry instance.
     * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types;
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
    public func getRevokedCerts(): Array<X509CRLEntry> {
        var retObj = CfArray()
        let retCode = unsafe { FfiCertCjX509CrlGetRevokedCerts(this.crl, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get revoked certs failed")
        }
        return retObj.toX509CRLEntryArray(needFree: true)
    }

    /**
     * Get the CRL information encoded by Der from this CRL.
     *
     * @returns { DataBlob } DataBlob of tbs info.
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
    public func getTBSInfo(): DataBlob {
        var retObj = CfBlob()
        let retCode = unsafe { FfiCertCjX509CrlGetTbsInfo(this.crl, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get tbs info failed")
        }
        return retObj.toDataBlob(needFree: true)
    }

    /**
     * Get signature value from CRL.
     *
     * @returns { DataBlob } DataBlob of signature.
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
        let retCode = unsafe { FfiCertCjX509CrlGetSignature(this.crl, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get signature failed")
        }
        return retObj.toDataBlob(needFree: true)
    }

    /**
     * Get the signature algorithm name of the CRL signature algorithm.
     *
     * @returns { String } string of signature algorithm name.
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
        let retCode = unsafe { FfiCertCjX509CrlGetSignatureAlgName(this.crl, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get signature alg name failed")
        }
        return retObj.toStringCstr(needFree: true)
    }

    /**
     * Get the signature algorithm oid string from CRL.
     *
     * @returns { String } string of signature algorithm oid.
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
        let retCode = unsafe { FfiCertCjX509CrlGetSignatureAlgOid(this.crl, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get signature alg oid failed")
        }
        return retObj.toStringCstr(needFree: true)
    }

    /**
     * Get the der encoded signature algorithm parameters from the CRL signature algorithm.
     *
     * @returns { DataBlob } DataBlob of signature algorithm params.
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
        let retCode = unsafe { FfiCertCjX509CrlGetSignatureAlgParams(this.crl, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get signature alg params failed")
        }
        return retObj.toDataBlob(needFree: true)
    }

    /**
     * Get Extensions of CRL Entry.
     *
     * @returns { DataBlob } DataBlob of extensions
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
    public func getExtensions(): DataBlob {
        var retObj = CfBlob()
        let retCode = unsafe { FfiCertCjX509CrlGetExtensions(this.crl, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get extensions failed")
        }
        return retObj.toDataBlob(needFree: true)
    }

    /**
     * Check if the X509 CRL match the parameters.
     *
     * @param { X509CRLMatchParameters } param - indicate the X509CRLMatchParameters object.
     * @returns { Bool } true - match X509CRL, false - not match.
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
    public func isMatch(param: X509CRLMatchParameters): Bool {
        var ret: Bool = false
        var arg1 = param.toNative()
        let retCode = unsafe { FfiCertCjX509CrlMatch(this.crl, inout arg1, inout ret) }
        arg1.free()
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("match failed")
        }
        ret
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
        var retCode = unsafe { FfiCertCjX509CrlGetIssuerName(this.crl, inout blob) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get issuer name failed")
        }
        var x509Name = CjX500DistinguishedName()
        retCode = unsafe { FfiCertCjX500DistinguishedNameNewInstance(inout blob, true, inout x509Name) }
        blob.free()
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("HcfX509DistinguishedNameCreate failed")
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
        let retCode = unsafe { FfiCertCjX509CrlToString(this.crl, inout retObj) }
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
        let retCode = unsafe { FfiCertCjX509CrlHashCode(this.crl, inout retObj) }
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
        let retCode = unsafe { FfiCertCjX509CrlGetExtensionsObject(this.crl, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get extensions object failed")
        }
        let inStream = EncodingBlob(retObj.toBytes(needFree: true), EncodingFormat.FORMAT_DER)
        createCertExtension(inStream)
    }
}

/**
 * Interface of X509CRLEntry.
 *
 * @typedef X509CRLEntry
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
public class X509CRLEntry <: ToString {
    X509CRLEntry(let cruEntry: CjX509CrlEntry) {}

    ~init() {
        unsafe { FfiCertCjX509CrlEntryDeleteInstance(this.cruEntry) }
    }
    /**
     * Returns the ASN of this CRL entry 1 der coding form, i.e. internal sequence.
     *
     * @return { EncodingBlob } the data of CRLEntry.
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
        let retCode = unsafe { FfiCertCjX509CrlEntryGetEncoded(this.cruEntry, inout retObj) }

        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get cert encoded failed")
        }
        return retObj.toEncodingBlob(needFree: true)
    }
    /**
     * Get the serial number from this x509CRL entry.
     *
     * @returns { BigInt } serial number of CRL entry.
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
    public func getSerialNumber(): BigInt {
        var retObj = CfBlob()
        let retCode = unsafe { FfiCertCjX509CrlEntryGetSerialNumber(this.cruEntry, inout retObj) }

        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get cert encoded failed")
        }
        return retObj.toBigInt(needFree: true)
    }
    /**
     * Get the issuer of the x509 certificate described by this entry.
     *
     * @returns { DataBlob } DataBlob of issuer.
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
    public func getCertIssuer(): DataBlob {
        var retObj = CfBlob()
        let retCode = unsafe { FfiCertCjX509CrlEntryGetCertIssuer(this.cruEntry, inout retObj) }

        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get cert encoded failed")
        }
        return retObj.toDataBlob(needFree: true)
    }
    /**
     * Get the revocation date from x509CRL entry.
     *
     * @returns { String } string of revocation date.
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
    public func getRevocationDate(): String {
        var retObj = CfBlob()
        let retCode = unsafe { FfiCertCjX509CrlEntryGetRevocationDate(this.cruEntry, inout retObj) }

        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get cert encoded failed")
        }
        return retObj.toStringCstr(needFree: true)
    }
    /**
     * Get Extensions of CRL Entry.
     *
     * @returns { DataBlob } DataBlob of extensions
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
    public func getExtensions(): DataBlob {
        var retObj = CfBlob()
        let retCode = unsafe { FfiCertCjX509CrlEntryGetExtensions(this.cruEntry, inout retObj) }

        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get cert encoded failed")
        }
        return retObj.toDataBlob(needFree: true)
    }
    /**
     * Check if CRL Entry has extension .
     *
     * @returns { boolean } true - CRL Entry has extension,  false - else.
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
    public func hasExtensions(): Bool {
        var ret: Bool = false
        let retCode = unsafe { FfiCertCjX509CrlEntryHasExtensions(this.cruEntry, inout ret) }

        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get cert encoded failed")
        }
        return ret
    }

    /**
     *  Get X500 distinguished name of the issuer.
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
    public func getCertIssuerX500DistinguishedName(): X500DistinguishedName {
        var blob = CfBlob()
        var retCode = unsafe { FfiCertCjX509CrlEntryGetCertIssuer(this.cruEntry, inout blob) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get issuer name failed")
        }
        var x509Name = CjX500DistinguishedName()
        retCode = unsafe { FfiCertCjX500DistinguishedNameNewInstance(inout blob, true, inout x509Name) }
        blob.free()
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("HcfX509DistinguishedNameCreate failed")
        }
        X500DistinguishedName(x509Name)
    }
    /**
     *  Get the string type data of the object.
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
        let retCode = unsafe { FfiCertCjX509CrlEntryToString(this.cruEntry, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("toString failed")
        }
        return retObj.toStringUtf8(needFree: true)
    }
    /**
     *  Get the hash value of DER format data.
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
        let retCode = unsafe { FfiCertCjX509CrlEntryHashCode(this.cruEntry, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("hashCode failed")
        }
        return retObj.toBytes(needFree: true)
    }
    /**
     *  Get the extension der encoding data for the corresponding entity.
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
        let retCode = unsafe { FfiCertCjX509CrlEntryGetExtensionsObject(this.cruEntry, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get extensions object failed")
        }
        let inStream = EncodingBlob(retObj.toBytes(needFree: true), EncodingFormat.FORMAT_DER)
        createCertExtension(inStream)
    }
}
