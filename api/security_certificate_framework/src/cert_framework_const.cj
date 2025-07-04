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

import std.collection.HashMap
import ohos.labels.*
import ohos.base.BusinessException

/**
 * Enum for supported cert encoding format.
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
public class EncodingFormat {
    /**
     * The value of cert DER format.
     *
     * @syscap SystemCapability.Security.Cert
     */
    /**
     * The value of cert DER format.
     *
     * @syscap SystemCapability.Security.Cert
     * @crossplatform
     */
    /**
     * The value of cert DER format.
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
    public static const FORMAT_DER: UInt32 = 0

    /**
     * The value of cert PEM format.
     *
     * @syscap SystemCapability.Security.Cert
     */
    /**
     * The value of cert PEM format.
     *
     * @syscap SystemCapability.Security.Cert
     * @crossplatform
     */
    /**
     * The value of cert PEM format.
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
    public static const FORMAT_PEM: UInt32 = 1

    /**
     * The value of cert chain PKCS7 format.
     *
     * @syscap SystemCapability.Security.Cert
     * @crossplatform
     */
    /**
     * The value of cert chain PKCS7 format.
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
    public static const FORMAT_PKCS7: UInt32 = 2
}

class CfResult {
    /* Indicates success. */
    static const CF_SUCCESS = 0_i32
    /* Indicates that input params is invalid . */
    static const CF_INVALID_PARAMS = -10001_i32
    /* Indicates that function or algorithm is not supported. */
    static const CF_NOT_SUPPORT = -10002_i32
    /* Indicates that input pointer is not null. */
    static const CF_NULL_POINTER = -10003_i32
    /* Indicates that something expected is not exist. */
    static const CF_NOT_EXIST = -10004_i32
    /* Indicates that memory malloc fails. */
    static const CF_ERR_MALLOC = -20001_i32
    /* Indicates that memory copy fails. */
    static const CF_ERR_COPY = -20002_i32
    /* Indicates that third part has something wrong. */
    static const CF_ERR_CRYPTO_OPERATION = -30001_i32
    /* Indicates that cert signature check fails. */
    static const CF_ERR_CERT_SIGNATURE_FAILURE = -30002_i32
    /* Indicates that cert is not yet valid. */
    static const CF_ERR_CERT_NOT_YET_VALID = -30003_i32
    /* Indicates that cert has expired. */
    static const CF_ERR_CERT_HAS_EXPIRED = -30004_i32
    /* Indicates that we can not get the untrusted cert's issuer. */
    static const CF_ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY = -30005_i32
    /* Indicates that key usage does not include certificate sign. */
    static const CF_ERR_KEYUSAGE_NO_CERTSIGN = -30006_i32
    /* Indicates that key usage does not include digital sign. */
    static const CF_ERR_KEYUSAGE_NO_DIGITAL_SIGNATURE = -30007_i32
    /* Indicates that cert data format is invalid. */
    static const CF_ERR_INVALID_CODE_FORMAT = -30008_i32
}

/**
 * Enum for result code
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
public class CertResult {
    /**
     * Success.
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
    public static const SUCCESS: Int32 = 0
    /**
     * Indicates that input parameters is invalid.
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
    public static const INVALID_PARAMS: Int32 = 401
    /**
     * Indicates that function or algorithm is not supported.
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
    public static const NOT_SUPPORT: Int32 = 801
    /**
     * Indicates the memory error.
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
    public static const ERR_OUT_OF_MEMORY: Int32 = 19020001
    /**
     * Indicates that runtime error.
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
    public static const ERR_RUNTIME_ERROR: Int32 = 19020002
    /**
     * Indicates the crypto operation error.
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
    public static const ERR_CRYPTO_OPERATION: Int32 = 19030001
    /**
     * Indicates that the certificate signature verification failed.
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
    public static const ERR_CERT_SIGNATURE_FAILURE: Int32 = 19030002
    /**
     * Indicates that the certificate has not taken effect.
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
    public static const ERR_CERT_NOT_YET_VALID: Int32 = 19030003
    /**
     * Indicates that the certificate has expired.
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
    public static const ERR_CERT_HAS_EXPIRED: Int32 = 19030004
    /**
     * Indicates a failure to obtain the certificate issuer.
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
    public static const ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY: Int32 = 19030005
    /**
     * The key cannot be used for signing a certificate.
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
    public static const ERR_KEYUSAGE_NO_CERTSIGN: Int32 = 19030006
    /**
     * The key cannot be used for digital signature.
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
    public static const ERR_KEYUSAGE_NO_DIGITAL_SIGNATURE: Int32 = 19030007
}

let ERROR_CODE_MAP = HashMap<Int32, Int32>(
    (CfResult.CF_SUCCESS, CertResult.SUCCESS),
    (CfResult.CF_INVALID_PARAMS, CertResult.INVALID_PARAMS),
    (CfResult.CF_NOT_SUPPORT, CertResult.NOT_SUPPORT),
    (CfResult.CF_ERR_MALLOC, CertResult.ERR_OUT_OF_MEMORY),
    (CfResult.CF_ERR_CRYPTO_OPERATION, CertResult.ERR_CRYPTO_OPERATION),
    (CfResult.CF_ERR_CERT_SIGNATURE_FAILURE, CertResult.ERR_CERT_SIGNATURE_FAILURE),
    (CfResult.CF_ERR_CERT_NOT_YET_VALID, CertResult.ERR_CERT_NOT_YET_VALID),
    (CfResult.CF_ERR_CERT_HAS_EXPIRED, CertResult.ERR_CERT_HAS_EXPIRED),
    (CfResult.CF_ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY, CertResult.ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY),
    (CfResult.CF_ERR_KEYUSAGE_NO_CERTSIGN, CertResult.ERR_KEYUSAGE_NO_CERTSIGN),
    (CfResult.CF_ERR_KEYUSAGE_NO_DIGITAL_SIGNATURE, CertResult.ERR_KEYUSAGE_NO_DIGITAL_SIGNATURE),
);
let ERROR_MESSAGE_MAP = HashMap<Int32, String>(
    (CertResult.SUCCESS, "success."),
    (CertResult.INVALID_PARAMS, "invalid parameters."),
    (CertResult.NOT_SUPPORT, "this operation is not supported."),
    (CertResult.ERR_OUT_OF_MEMORY, "memory error."),
    (CertResult.ERR_CRYPTO_OPERATION, "crypto operation error"),
    (CertResult.ERR_CERT_SIGNATURE_FAILURE, "the certificate signature verification failed."),
    (CertResult.ERR_CERT_NOT_YET_VALID, "the certificate has not taken effect."),
    (CertResult.ERR_CERT_HAS_EXPIRED, "the certificate has expired."),
    (CertResult.ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY, "failed to obtain the certificate issuer."),
    (CertResult.ERR_KEYUSAGE_NO_CERTSIGN, "the key cannot be used for signing a certificate."),
    (CertResult.ERR_KEYUSAGE_NO_DIGITAL_SIGNATURE, "the key cannot be used for digital signature."),
);

extend Int32 {
    func toEpt(extra: String): Exception {
        let errCode = ERROR_CODE_MAP.get(this).getOrDefault({=> CertResult.INVALID_PARAMS})
        let msg = ERROR_MESSAGE_MAP.get(errCode).getOrThrow()
        return BusinessException(errCode, "${msg} ${extra}")
    }
}
