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

import ohos.labels.*

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CertificateManager"
]
public class CMSignatureSpec {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CertificateManager"
    ]
    public CMSignatureSpec(
        /**
         * Indicates the key purpose of CMSignatureSpec.
         *
         * @type { CmKeyPurpose }
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CertificateManager"
        ]
        public var purpose: CmKeyPurpose,
        /**
         * Indicates the key padding of CMSignatureSpec.
         *
         * @type { ?CmKeyPadding }
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CertificateManager"
        ]
        public var padding: ?CmKeyPadding,
        /**
         * Indicates the key digest of CMSignatureSpec.
         *
         * @type { ?CmKeyDigest }
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CertificateManager"
        ]
        public var digest: ?CmKeyDigest
    ) {}
}

@C
struct CCmSignatureSpec {
    CCmSignatureSpec(
        let purpose: UInt32,
        let padding: UInt32,
        let digest: UInt32
    ) {}

    init(spec: CMSignatureSpec) {
        this.purpose = spec.purpose.getValue()
        let pad: Option<UInt32> = spec.padding?.getValue()
        this.padding = match (pad) {
            case Some(v) => v
            case None => 0
        }
        let dig: Option<UInt32> = spec.digest?.getValue()
        this.digest = match (dig) {
            case Some(v) => v
            case None => 0
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CertificateManager"
]
public class CMHandle {
    CMHandle(let handle: Array<UInt8>) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CertificateManager"
]
public class CertAbstract {
    CertAbstract(
        /**
         * Indicates the uri of certificate.
         *
         * @type { String }
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CertificateManager"
        ]
        public let uri: String,
        /**
         * Indicates the alias of certificate.
         *
         * @type { String }
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CertificateManager"
        ]
        public let certAlias: String,
        /**
         * Indicates the state of certificate.
         *
         * @type { Bool }
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CertificateManager"
        ]
        public let state: Bool,
        /**
         * Indicates the subject name of certificate.
         *
         * @type { String }
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CertificateManager"
        ]
        public let subjectName: String
    ) {}

    init(cAbstract: CjCertAbstract) {
        this.uri = cAbstract.uri.toString()
        this.certAlias = cAbstract.certAlias.toString()
        this.state = cAbstract.status
        this.subjectName = cAbstract.subjectName.toString()
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CertificateManager"
]
public class CertInfo {
    CertInfo(
        /**
         * Indicates the uri of certificate.
         *
         * @type { String }
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CertificateManager"
        ]
        public let uri: String,
        /**
         * Indicates the alias of certificate.
         *
         * @type { String }
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CertificateManager"
        ]
        public let certAlias: String,
        /**
         * Indicates the state of certificate.
         *
         * @type { Bool }
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CertificateManager"
        ]
        public let state: Bool,
        /**
         * Indicates the issuer name of certificate.
         *
         * @type { String }
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CertificateManager"
        ]
        public let issuerName: String,
        /**
         * Indicates the subject name of certificate.
         *
         * @type { String }
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CertificateManager"
        ]
        public let subjectName: String,
        /**
         * Indicates the serial number of certificate.
         *
         * @type { String }
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CertificateManager"
        ]
        public let serial: String,
        /**
         * Indicates the not before time of certificate.
         *
         * @type { String }
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CertificateManager"
        ]
        public let notBefore: String,
        /**
         * Indicates the not after time of certificate.
         *
         * @type { String }
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CertificateManager"
        ]
        public let notAfter: String,
        /**
         * Indicates the fingerprint of certificate.
         *
         * @type { String }
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CertificateManager"
        ]
        public let fingerprintSha256: String,
        /**
         * Indicates the certificate binary data.
         *
         * @type { Array<UInt8> }
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CertificateManager"
        ]
        public let cert: Array<UInt8>
    ) {}

    init(cinfo: CjCertInfo) {
        this.uri = cinfo.uri.toString()
        this.certAlias = cinfo.certAlias.toString()
        this.state = cinfo.status
        this.issuerName = cinfo.issuerName.toString()
        this.subjectName = cinfo.subjectName.toString()
        this.serial = cinfo.serial.toString()
        this.notBefore = cinfo.notBefore.toString()
        this.notAfter = cinfo.notAfter.toString()
        this.fingerprintSha256 = cinfo.fingerprintSha256.toString()
        this.cert = cinfo.certInfo.toBytes()
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CertificateManager"
]
public class CredentialAbstract {
    CredentialAbstract(
        /**
         * Indicates the type of Credential.
         *
         * @type { String }
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CertificateManager"
        ]
        public let credentialType: String,
        /**
         * Indicates the alias of Credential.
         *
         * @type { String }
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CertificateManager"
        ]
        public let alias: String,
        /**
         * Indicates the uri of Credential.
         *
         * @type { String }
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CertificateManager"
        ]
        public let keyUri: String
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CertificateManager"
]
public class Credential {
    Credential(
        /**
         * Indicates the type of Credential.
         *
         * @type { String }
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CertificateManager"
        ]
        public let credentialType: String,
        /**
         * Indicates the alias of Credential.
         *
         * @type { String }
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CertificateManager"
        ]
        public let alias: String,
        /**
         * Indicates the uri of Credential.
         *
         * @type { String }
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CertificateManager"
        ]
        public let keyUri: String,
        /**
         * Indicates the number of certificates included in the credential.
         *
         * @type { Int32 }
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CertificateManager"
        ]
        public let certNum: Int32,
        /**
         * Indicates the number of key included in the credential.
         *
         * @type { Int32 }
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CertificateManager"
        ]
        public let keyNum: Int32,
        /**
         * Indicates the credential binary data.
         *
         * @type { Array<UInt8> }
         * @syscap SystemCapability.Security.CertificateManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.CertificateManager"
        ]
        public let credentialData: Array<UInt8>
    ) {}

    init(cCred: CjCredential) {
        this.credentialType = cCred._type.toString()
        this.alias = cCred.alias.toString()
        this.keyUri = cCred.keyUri.toString()
        this.certNum = Int32(cCred.certNum)
        this.keyNum = Int32(cCred.keyNum)
        this.credentialData = cCred.credData.toBytes()
    }
}

@C
struct CmBlob {
    CmBlob(
        let size: UInt32,
        let data: CPointer<UInt8>
    ) {}
    init() {
        this.size = 0
        this.data = CPointer()
    }

    static func malloc(size: UInt32): CmBlob {
        let data = unsafe { CPointer<UInt8>(calloc(UIntNative(size), 1)) }
        if (data.isNull()) {
            throw IllegalMemoryException("Out of Memory!")
        }
        return CmBlob(size, data)
    }

    func free() {
        unsafe { LibC.free(this.data) }
    }

    func toString(needFree!: Bool = false): String {
        let ret = CString(this.data).toString()
        if (needFree) {
            this.free()
        }
        ret
    }

    func toBytes(needFree!: Bool = false): Array<Byte> {
        let ret = Array<Byte>(Int64(this.size), repeat: 0)
        unsafe {
            let cph = acquireArrayRawData(ret)
            memcpy_s(cph.pointer, UIntNative(this.size), this.data, UIntNative(this.size))
            releaseArrayRawData(cph)
        }
        if (needFree) {
            this.free()
        }
        ret
    }
}
