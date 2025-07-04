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

package ohos.net.network_security

import ohos.base.*
import ohos.ffi.*
import ohos.hilog.HilogChannel
import ohos.labels.APILevel
import std.collection.HashMap

foreign {
    func FfiOHOSNetworkSecurityCertVerificationCert(cert: CCertBlob): Int64

    func FfiOHOSNetworkSecurityCertVerificationCaCert(cert: CCertBlob, caCert: CCertBlob): Int64
}

/**
 * Defines the certificate type.
 *
 * @relation enum CertType
 */
@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public enum CertType {
    /**
     * PEM type certificate.
     *
     * @relation CERT_TYPE_PEM = 0
     */
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    CertTypePem
    |
        /**
         * DER type certificate.
         *
         * @relation CERT_TYPE_DER = 1
         */
        @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    CertTypeDer
    | ...

    func getValue(): Int64 {
        match (this) {
            case CertTypePem => 0
            case CertTypeDer => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Define the certificate content.
 *
 * @relation interface CertBlob
 */
@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public class CertBlob {
    /**
     * Certificate type.
     *
     * @relation type: CertType
     */
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var `type`: CertType

    /**
     * Certificate data.
     *
     * @relation data: string | ArrayBuffer
     */
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var data: CertData

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public init(certType: CertType, certData: CertData) {
        this.`type` = certType
        this.data = certData
    }
}

@C
struct CCertBlob {
    var certType: Int64
    var certData: CArrUI8

    init(cb: CertBlob) {
        this.certType = cb.`type`.getValue()
        this.certData = cb.data.getCData()
    }

    func free(): Unit {
        this.certData.free
    }
}

@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public enum CertData <: ToString {
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    StringData(String)
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    ArrayData(Array<Byte>)
    | ...

    func getData(): Array<UInt8> {
        match (this) {
            case StringData(str) => unsafe { str.rawData() }
            case ArrayData(arr) => arr
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    func getCData(): CArrUI8 {
        let data = getData()
        unsafe { CArrUI8(cjArr2CArr<UInt8, UInt8>(data, {i => i}), data.size) }
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func toString(): String {
        match (this) {
            case StringData(str) => str
            case ArrayData(arr) => "${arr}"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Certificate verification to the server.
 * @param { CertBlob } cert - Certificates to be verified.
 * @param { ?CertBlob } [caCert] - Incoming custom CA cert.
 * @returns { Int64 } The code returned by the function.
 * Number equals 0 if verify of certification from server succeed, else verify failed.
 * @throws { IllegalArgumentException } - Parameter error.
 * @throws { BusinessException } 2305001 - Unspecified error.
 * @throws { BusinessException } 2305002 - Unable to get issuer certificate.
 * @throws { BusinessException } 2305003 - Unable to get certificate revocation list (CRL).
 * @throws { BusinessException } 2305004 - Unable to decrypt certificate signature.
 * @throws { BusinessException } 2305005 - Unable to decrypt CRL signature.
 * @throws { BusinessException } 2305006 - Unable to decode issuer public key.
 * @throws { BusinessException } 2305007 - Certificate signature failure.
 * @throws { BusinessException } 2305008 - CRL signature failure.
 * @throws { BusinessException } 2305009 - Certificate is not yet valid.
 * @throws { BusinessException } 2305010 - Certificate has expired.
 * @throws { BusinessException } 2305011 - CRL is not yet valid.
 * @throws { BusinessException } 2305012 - CRL has expired.
 * @throws { BusinessException } 2305018 - Self-signed certificate.
 * @throws { BusinessException } 2305023 - Certificate has been revoked.
 * @throws { BusinessException } 2305024 - Invalid certificate authority (CA).
 * @throws { BusinessException } 2305027 - Certificate is untrusted.
 * @throws { BusinessException } 2305069 - Invalid certificate verification context.
 * @syscap SystemCapability.Communication.NetStack
 * @relation function certVerificationSync(cert: CertBlob, caCert?: CertBlob): number;
 */
@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public func certVerification(cert: CertBlob, caCert!: ?CertBlob = None): Int64 {
    var ret: Int64 = 0
    checkCertTypeMatches(cert)
    if (let Some(v) <- caCert) {
        checkCertTypeMatches(v)
    }
    let cCert: CCertBlob = CCertBlob(cert)
    unsafe {
        try {
            match (caCert) {
                case Some(v) =>
                    let cCaCert = CCertBlob(v)
                    ret = FfiOHOSNetworkSecurityCertVerificationCaCert(cCert, cCaCert)
                    cCaCert.free()
                case None => ret = FfiOHOSNetworkSecurityCertVerificationCert(cCert)
            }
        } finally {
            cCert.free()
        }
    }
    checkCodeAndThrow(Int32(ret))
    return ret
}

func checkCertTypeMatches(cert: CertBlob) {
    match (cert.data) {
        case StringData(v) =>
            if (cert.`type`.getValue() != 0) {
                throw IllegalArgumentException("The cert type and content mismatch.")
            }
        case ArrayData(v) =>
            if (cert.`type`.getValue() != 1) {
                throw IllegalArgumentException("The cert type and content mismatch.")
            }
        case _ => throw IllegalArgumentException("The type is not supported.")
    }
}

let ERROR_MSG_MAP = HashMap<Int32, String>(
    [
        (2305001, "Unspecified error."),
        (2305002, "Unable to get issuer certificate."),
        (2305003, "Unable to get certificate revocation list (CRL)."),
        (2305004, "Unable to decrypt certificate signature."),
        (2305005, "Unable to decrypt CRL signature."),
        (2305006, "Unable to decode issuer public key."),
        (2305007, "Certificate signature failure."),
        (2305008, "CRL signature failure."),
        (2305009, "Certificate is not yet valid."),
        (2305010, "Certificate has expired."),
        (2305011, "CRL is not yet valid."),
        (2305012, "CRL has expired."),
        (2305018, "Self-signed certificate."),
        (2305023, "Certificate has been revoked."),
        (2305024, "Invalid certificate authority (CA)."),
        (2305027, "Certificate is untrusted."),
        (2305069, "Invalid certificate verification context.")
    ]
)

func getErrorMsg(code: Int32): String {
    match (ERROR_MSG_MAP.get(code)) {
        case Some(v) => v
        case None => "Unknown error. Error code is ${code}"
    }
}

func checkCodeAndThrow(code: Int32): Unit {
    if (code == 0) {
        return
    }
    if (code == ERR_PARAMETER_ERROR) {
        throw IllegalArgumentException("The cert content is invalid.")
    }
    throw BusinessException(code, getErrorMsg(code))
}
