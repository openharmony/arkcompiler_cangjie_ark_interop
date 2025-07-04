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

/**
 * Provides the certificate chain validate parameters type.
 *
 * @typedef CertChainValidationParameters
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
public class CertChainValidationParameters {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Cert"
    ]
    public CertChainValidationParameters(
        /**
         * The trust ca certificates to verify the certificate chain.
         *
         * @type { Array<X509TrustAnchor> }
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
        public let trustAnchors!: Array<X509TrustAnchor>
    ) {
    }
    /**
     * The datetime to verify the certificate chain validity period.
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
    public var date: ?String = Option.None

    /**
     * The cert and CRL list to build cert chain and verify the certificate chain revocation state.
     *
     * @type { ?Array<CertCRLCollection> }
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
    public var certCRLs: ?Array<CertCRLCollection> = Option.None

    /**
     * The revocation parameters to verify the certificate chain revocation status.
     *
     * @type { ?RevocationCheckParameter }
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
    public var revocationCheckParam: ?RevocationCheckParameter = Option.None

    /**
     * The policy to verify the certificate chain validity.
     *
     * @type { ?ValidationPolicyType }
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
    public var policy: ?ValidationPolicyType = Option.None

    /**
     * The sslHostname to verify the certificate chain validity.
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
    public var sslHostname: ?String = Option.None

    /**
     * The keyUsage to verify the certificate chain validity.
     *
     * @type { ?Array<KeyUsageType> }
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
    public var keyUsage: ?Array<KeyUsageType> = Option.None

    func toNative(): CjX509CertChainValidateParams {
        var ret = CjX509CertChainValidateParams(this.trustAnchors)
        try {
            // handle date
            match (this.date) {
                case Some(date) => ret.date = date.mallocCfBlob()
                case _ => ()
            }
            // handle certCRLs
            if (this.certCRLs.isSome()) {
                let certCRLs = this.certCRLs.getOrThrow()
                ret.certCRLCollections = LibC.malloc(count: certCRLs.size)
                if (ret.certCRLCollections.isNull()) {
                    throw IllegalMemoryException("Out of Memory!")
                }
                ret.certCRLCollectionCnt = UInt32(certCRLs.size)
                fillCertCRLs(certCRLs, ret)
            }
            // handle revocationCheckParam
            if (this.revocationCheckParam.isSome()) {
                let revocationCheckParam = this.revocationCheckParam.getOrThrow()
                let ptr = LibC.malloc<CjRevocationCheckParam>()
                if (ptr.isNull()) {
                    throw IllegalMemoryException("Out of Memory!")
                }
                unsafe { ptr.write(revocationCheckParam.toNative()) }
                ret.revocationCheckParam = ptr
            }
            // handle policy
            match (this.policy) {
                case Some(policy) => ret.policy = policy.getValue()
                case _ => ()
            }
            // handle sslHostname
            match (this.sslHostname) {
                case Some(sslHostname) => ret.sslHostname = sslHostname.mallocCfBlob()
                case _ => ()
            }
            // handle keyUsage
            if (this.keyUsage.isSome()) {
                let keyUsage = this.keyUsage.getOrThrow()
                ret.keyUsage = LibC.malloc(count: keyUsage.size)
                if (ret.keyUsage.isNull()) {
                    throw IllegalMemoryException("Out of Memory!")
                }
                ret.keyUsageCnt = UInt32(keyUsage.size)
                fillKeyUsage(keyUsage, ret)
            }
            ret
        } catch (e: Exception) {
            ret.free()
            throw e
        }
    }

    func fillCertCRLs(certCRLs: Array<CertCRLCollection>, ret: CjX509CertChainValidateParams) {
        for (i in 0..certCRLs.size) {
            unsafe { ret.certCRLCollections.write(i, certCRLs[i].collection.collection) }
        }
    }

    func fillKeyUsage(keyUsage: Array<KeyUsageType>, ret: CjX509CertChainValidateParams) {
        for (i in 0..keyUsage.size) {
            unsafe { ret.keyUsage.write(i, keyUsage[i].getValue()) }
        }
    }
}

/**
 * Certification chain validate result.
 *
 * @typedef CertChainValidationResult
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
public class CertChainValidationResult {
    CertChainValidationResult(
        /**
         * The cert chain trust anchor.
         *
         * @type { X509TrustAnchor }
         * @readonly
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
        public let trustAnchor: X509TrustAnchor,
        /**
         * The target certificate.
         *
         * @type { X509Cert }
         * @readonly
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
        public let entityCert: X509Cert
    ) {}
}

/**
 * Provides the certificate chain validate revocation parameters.
 *
 * @typedef RevocationCheckParameter
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
public class RevocationCheckParameter {
    /**
     * The additional field for sending OCSP requests.
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
    public var ocspRequestExtension: ?Array<Bytes> = Option.None

    /**
     * The server URL address for sending requests to OCSP.
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
    public var ocspResponderURI: ?String = Option.None

    /**
     * The signing certificate for verifying OCSP response signatures.
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
    public var ocspResponderCert: ?X509Cert = Option.None

    /**
     * The OCSP response message returned by an OCSP server.
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
    public var ocspResponses: ?Bytes = Option.None

    /**
     * The URL address for downloading the CRL list.
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
    public var crlDownloadURI: ?String = Option.None

    /**
     * The certificate revocation status verification option.
     *
     * @type { ?Array<RevocationCheckOptions> }
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
    public var options: ?Array<RevocationCheckOptions> = Option.None

    /**
     * The digest used to generate the ocsp cert id.
     *
     * @type { ?String }
     * @default SHA256
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
    public var ocspDigest: ?String = Option.None

    func toNative(): CjRevocationCheckParam {
        var ret = CjRevocationCheckParam()
        try {
            // handle ocspRequestExtension
            match (this.ocspRequestExtension) {
                case Some(ocspRequestExtension) => ret.ocspRequestExtension = ocspRequestExtension.mallocBlobArray()
                case _ => ()
            }
            // handle ocspResponderURI
            match (this.ocspResponderURI) {
                case Some(ocspResponderURI) => ret.ocspResponderURI = ocspResponderURI.mallocCfBlob()
                case _ => ()
            }
            // handle ocspResponderCert
            match (this.ocspResponderCert) {
                case Some(ocspResponderCert) => ret.ocspResponderCert = ocspResponderCert.cert.cert
                case _ => ()
            }
            // handle ocspResponses
            match (this.ocspResponses) {
                case Some(ocspResponses) => ret.ocspResponses = ocspResponses.mallocCfBlob()
                case _ => ()
            }
            // handle crlDownloadURI
            match (this.crlDownloadURI) {
                case Some(crlDownloadURI) => ret.crlDownloadURI = crlDownloadURI.mallocCfBlob()
                case _ => ()
            }
            // handle options
            if (this.options.isSome()) {
                let options = this.options.getOrThrow()
                ret.options = LibC.malloc(count: options.size)
                if (ret.options.isNull()) {
                    throw IllegalMemoryException("Out of Memory!")
                }
                ret.optionCnt = UInt32(options.size)
                for (i in 0..options.size) {
                    unsafe { ret.options.write(i, options[i].getValue()) }
                }
            }
            // handle ocspDigest
            match (this.ocspDigest) {
                case Some(ocspDigest) => ret.ocspDigest = ocspDigest.mallocCfBlob()
                case _ => ()
            }
            ret
        } catch (e: Exception) {
            ret.free()
            throw e
        }
    }
}
