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
import std.math.numeric.BigInt

/**
 * GeneralName object
 *
 * @typedef GeneralName
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
public class GeneralName {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Cert"
    ]
    public GeneralName(
        /**
         * The general name type.
         *
         * @type { GeneralNameType }
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
        public var `type`: GeneralNameType,

        /**
         * The general name in DER format
         *
         * @type { ?Bytes }
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
        public var name: ?Bytes
    ) {}
    func toSubjectAlternaiveNameData(): SubjectAlternaiveNameData {
        match (this.name) {
            case Some(name) => SubjectAlternaiveNameData(this.`type`.getValue(), name.toCfBlob())
            case _ => SubjectAlternaiveNameData(this.`type`.getValue(), CfBlob())
        }
    }
}

/**
 * X509 Cert match parameters
 *
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
public class X509CertMatchParameters {
    /**
     * To match SubjectAlternativeNames of cert extensions:
     * [Rule]
     * null : Do not match.
     * NOT null : match after [matchAllSubjectAltNames]
     *
     * @type { ?Array<GeneralName> } SubjectAlternativeNames is in DER encoding format
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
    public var subjectAlternativeNames: ?Array<GeneralName> = Option.None

    /**
     * Indicate if match all subject alternate name:
     * [Rule]
     * true : match if [subjectAlternativeNames] is equal with all of [SubjectAlternativeNames of cert extensions]
     * false : match if [subjectAlternativeNames] is only equal with one of [SubjectAlternativeNames of cert extensions]
     *
     * @type { ?Bool }
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
    public var matchAllSubjectAltNames: ?Bool = Option.None

    /**
     * To match AuthorityKeyIdentifier of cert extensions in DER encoding:
     * [Rule]
     * null : Do not match.
     * NOT null : match if it is equal with [AuthorityKeyIdentifier of cert extensions] in DER encoding
     *
     * @type { ?Bytes } the key identifier
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
    public var authorityKeyIdentifier: ?Bytes = Option.None

    /**
     * To match BaseConstraints.pathLenConstraint of cert extensions:
     * [Rule]
     * >=0 : The certificate must contain BaseConstraints extension, and the cA field in the extension takes.
     * -2 : The cA field in the BaseConstraints extension of the certificate must be set to false or the certificate does not contain BaseConstraints extension.
     * other : Do not match.
     *
     * @type { ?Int32 }
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
    public var minPathLenConstraint: ?Int32 = Option.None

    /**
     * To match X509Cert:
     * [Rule]
     * null : Do not match.
     * NOT null : match if x509Cert.getEncoding is equal.
     *
     * @type { ?X509Cert }
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
    public var x509Cert: ?X509Cert = Option.None

    /**
     * To match the validDate of cert:
     * [Rule]
     * null : Do not match.
     * NOT null : match if [notBefore of cert] <= [validDate] <= [notAfter of cert].
     *
     * @type { ?String } format is YYMMDDHHMMSSZ or YYYYMMDDHHMMSSZ.
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
    public var validDate: ?String = Option.None

    /**
     * To match the issuer of cert:
     * [Rule]
     * null : Do not match.
     * NOT null : match if it is equal with [issuer of cert] in DER encoding.
     *
     * @type { ?Bytes }
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
    public var issuer: ?Bytes = Option.None

    /**
     * To match the ExtendedKeyUsage of cert extensions:
     * [Rule]
     * null : Do not match.
     * NOT null : match ok if [ExtendedKeyUsage of cert extensions] is null, or
     *    [ExtendedKeyUsage of cert extensions] include [extendedKeyUsage].
     *
     * @type { ?Array<String> } array of oIDs.
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
    public var extendedKeyUsage: ?Array<String> = Option.None

    /**
     * The X509Certificate must have subject and subject alternative names that meet the specified name constraints:
     * [Rule]
     * null : Do not match.
     * NOT null : match ok if [NameConstraints of cert extensions] is null, or
     *    [NameConstraints of cert extensions] include [nameConstraints].
     *
     * @type { ?Bytes } ASN.1 DER encoded form of nameConstraints
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
    public var nameConstraints: ?Bytes = Option.None

    /**
     * The X509Certificate must have subject and subject alternative names that meet the specified name constraints:
     * [Rule]
     * null : Do not match.
     * NOT null : match ok if [Certificate Policies of cert extensions] is null, or
     *    [Certificate Policies of cert extensions] include [certPolicy].
     *
     * @type { ?Array<String> } array of oIDs.
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
    public var certPolicy: ?Array<String> = Option.None

    /**
     * The specified date must fall within the private key validity period for the X509Certificate:
     * [Rule]
     * null : Do not match.
     * NOT null : match ok if [Private Key Valid Period of cert extensions] is null, or
     *    [privateKeyValid] fall in [Private Key Valid Period of cert extensions].
     *
     * @type { ?String } format is YYMMDDHHMMSSZ or YYYYMMDDHHMMSSZ
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
    public var privateKeyValid: ?String = Option.None

    /**
     * To match the KeyUsage of cert extensions:
     * [Rule]
     * null : Do not match.
     * NOT null : match ok if [KeyUsage of cert extensions] is null, or
     *    [KeyUsage of cert extensions] include [keyUsage].
     *
     * @type { ?Array<Bool> }
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
    public var keyUsage: ?Array<Bool> = Option.None

    /**
     * The specified serial number must match the serialnumber for the X509Certificate:
     * [Rule]
     * null : Do not match.
     * NOT null : match ok if it is equal with [serialNumber of cert].
     *
     * @type { ?bigint }
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
    public var serialNumber: ?BigInt = Option.None

    /**
     * The specified value must match the subject for the X509Certificate:
     * [Rule]
     * null : Do not match.
     * NOT null : match ok if it is equal with [subject of cert].
     *
     * @type { ?Bytes } subject in DER encoding format
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
    public var subject: ?Bytes = Option.None

    /**
     * The specified value must match the Subject Key Identifier extension for the X509Certificate:
     * [Rule]
     * null : Do not match.
     * NOT null : match ok if it is equal with [Subject Key Identifier of cert extensions].
     *
     * @type { ?Bytes } subjectKeyIdentifier in DER encoding format ??
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
    public var subjectKeyIdentifier: ?Bytes = Option.None

    /**
     * The specified value must match the publicKey for the X509Certificate:
     * [Rule]
     * null : Do not match.
     * NOT null : match ok if it is equal with [publicKey of cert].
     *
     * @type { ?DataBlob } publicKey
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
    public var publicKey: ?DataBlob = Option.None

    /**
     * The specified value must match the publicKey for the X509Certificate:
     * [Rule]
     * null : Do not match.
     * NOT null : match ok if it is equal with [publicKey of cert].
     *
     * @type { ?String } the object identifier (OID) of the signature algorithm to check.
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
    public var publicKeyAlgID: ?String = Option.None
    func toNative(): CjX509CertMatchParams {
        var ret = CjX509CertMatchParams()
        try {
            // handle subjectAlternativeNames
            if (this.subjectAlternativeNames.isSome()) {
                let subjectAlternativeNames = this.subjectAlternativeNames.getOrThrow()
                if (subjectAlternativeNames.size > 0) {
                    ret.subjectAlternativeNames = LibC.malloc(count: subjectAlternativeNames.size)
                    if (ret.subjectAlternativeNames.isNull()) {
                        throw IllegalMemoryException("Out of Memory!")
                    }
                    ret.subjectAlternativeNameCnt = UInt32(subjectAlternativeNames.size)
                    for (i in 0..subjectAlternativeNames.size) {
                        unsafe {
                            ret.subjectAlternativeNames.write(i,
                                subjectAlternativeNames[i].toSubjectAlternaiveNameData())
                        }
                    }
                }
            }
            // handle matchAllSubjectAltNames
            match (this.matchAllSubjectAltNames) {
                case Some(matchAllSubjectAltNames) => ret.matchAllSubjectAltNames = matchAllSubjectAltNames
                case _ => ()
            }
            // handle authorityKeyIdentifier
            match (this.authorityKeyIdentifier) {
                case Some(authorityKeyIdentifier) => ret.authorityKeyIdentifier = authorityKeyIdentifier.mallocCfBlob()
                case _ => ()
            }
            // handle minPathLenConstraint
            match (this.minPathLenConstraint) {
                case Some(minPathLenConstraint) => ret.minPathLenConstraint = minPathLenConstraint
                case _ => ()
            }
            // handle x509Cert
            match (this.x509Cert) {
                case Some(x509Cert) => ret.x509Cert = x509Cert.cert.cert
                case _ => ()
            }
            // handle validDate
            match (this.validDate) {
                case Some(validDate) => ret.validDate = validDate.mallocCfBlob()
                case _ => ()
            }
            // handle issuer
            match (this.issuer) {
                case Some(issuer) => ret.issuer = issuer.mallocCfBlob()
                case _ => ()
            }
            // handle extendedKeyUsage
            match (this.extendedKeyUsage) {
                case Some(extendedKeyUsage) => ret.extendedKeyUsage = extendedKeyUsage.mallocCfArray()
                case _ => ()
            }
            // handle nameConstraints
            match (this.nameConstraints) {
                case Some(nameConstraints) => ret.nameConstraints = nameConstraints.mallocCfBlob()
                case _ => ()
            }
            // handle certPolicy
            match (this.certPolicy) {
                case Some(certPolicy) => ret.certPolicy = certPolicy.mallocCfArray()
                case _ => ()
            }
            // handle certPolicy
            match (this.privateKeyValid) {
                case Some(privateKeyValid) => ret.privateKeyValid = privateKeyValid.mallocCfBlob()
                case _ => ()
            }
            // handle keyUsage
            match (this.keyUsage) {
                case Some(keyUsage) => ret.keyUsage = Array<Byte>(
                    keyUsage.size,
                    {
                        i => if (keyUsage[i]) {
                            1
                        } else {
                            0
                        }
                    }
                ).mallocCfBlob()
                case _ => ()
            }
            // handle certPolicy
            match (this.serialNumber) {
                case Some(serialNumber) => ret.serialNumber = serialNumber.mallocCfBlob()
                case _ => ()
            }
            // handle subject
            match (this.subject) {
                case Some(subject) => ret.subject = subject.mallocCfBlob()
                case _ => ()
            }
            // handle subjectKeyIdentifier
            match (this.subjectKeyIdentifier) {
                case Some(subjectKeyIdentifier) => ret.subjectKeyIdentifier = subjectKeyIdentifier.mallocCfBlob()
                case _ => ()
            }
            // handle publicKey
            match (this.publicKey) {
                case Some(publicKey) => ret.publicKey = publicKey.data.mallocCfBlob()
                case _ => ()
            }
            // handle publicKeyAlgID
            match (this.publicKeyAlgID) {
                case Some(publicKeyAlgID) => ret.publicKeyAlgID = publicKeyAlgID.mallocCfBlob()
                case _ => ()
            }
            ret
        } catch (e: Exception) {
            ret.free()
            throw e
        }
    }
}

/**
 * X509 CRL match parameters
 *
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
public class X509CRLMatchParameters {
    /**
     * To match the issuer of cert:
     * [Rule]
     * null : Do not match.
     * NOT null : match if it is equal with [issuer of cert] in DER encoding.
     *
     * @type { ?Array<Bytes> }
     * @syscap SystemCapability.Security.Cert
     * @crossplatform
     */
    /**
     * To match the issuer of cert:
     * [Rule]
     * null : Do not match.
     * NOT null : match if it is equal with [issuer of cert] in DER encoding.
     *
     * @type { ?Array<Bytes> }
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
    public var issuer: ?Array<Bytes> = Option.None

    /**
     * To match X509Cert:
     * [Rule]
     * null : Do not match.
     * NOT null : match if x509Cert.getEncoding is equal.
     *
     * @type { ?X509Cert }
     * @syscap SystemCapability.Security.Cert
     * @crossplatform
     */
    /**
     * To match X509Cert:
     * [Rule]
     * null : Do not match.
     * NOT null : match if x509Cert.getEncoding is equal.
     *
     * @type { ?X509Cert }
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
    public var x509Cert: ?X509Cert = Option.None

    /**
     * To match updateDateTime of CRL:
     * [Rule]
     * null : Do not verify.
     * NOT null : verify if [thisUpdate in CRL] <= updateDateTime <= [nextUpdate in CRL]
     *
     * @type { ?String }
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
    public var updateDateTime: ?String = Option.None

    /**
     * To match the maximum of CRL number extension:
     * [Rule]
     * null : Do not verify.
     * NOT null : verify if [CRL number extension] <= maxCRL.
     *
     * @type { ?bigint }
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
    public var maxCRL: ?BigInt = Option.None

    /**
     * To match the minimum of CRL number extension:
     * [Rule]
     * null : Do not verify.
     * NOT null : verify if [CRL number extension] >= minCRL.
     *
     * @type { ?bigint }
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
    public var minCRL: ?BigInt = Option.None
    func toNative(): CjX509CrlMatchParams {
        var ret = CjX509CrlMatchParams()
        try {
            // handle issuer
            match (this.issuer) {
                case Some(issuer) => ret.issuer = issuer.mallocBlobArray()
                case _ => ()
            }
            // handle x509Cert
            match (this.x509Cert) {
                case Some(x509Cert) => ret.x509Cert = x509Cert.cert.cert
                case _ => ()
            }
            // handle updateDateTime
            match (this.updateDateTime) {
                case Some(updateDateTime) => ret.updateDateTime = updateDateTime.mallocCfBlob()
                case _ => ()
            }
            // handle maxCRL
            match (this.maxCRL) {
                case Some(maxCRL) => ret.maxCRL = maxCRL.mallocCfBlob()
                case _ => ()
            }
            // handle minCRL
            match (this.minCRL) {
                case Some(minCRL) => ret.minCRL = minCRL.mallocCfBlob()
                case _ => ()
            }
            ret
        } catch (e: Exception) {
            ret.free()
            throw e
        }
    }
}
