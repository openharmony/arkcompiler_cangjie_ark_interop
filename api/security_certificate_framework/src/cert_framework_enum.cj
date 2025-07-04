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

import std.deriving.*
import ohos.labels.*

/**
 * Enum for Encoding type.
 *
 * @syscap SystemCapability.Security.Cert
 * @crossplatform
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Cert"
]
public enum EncodingType {
    /**
     * Indicates to utf8 type.
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
    ENCODING_UTF8 | ...

    func getValue(): Int32 {
        match (this) {
            case ENCODING_UTF8 => 0
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enum for the certificate item type.
 *
 * @syscap SystemCapability.Security.Cert
 * @crossplatform
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Cert"
]
public enum CertItemType {
    /**
     * Indicates to get certificate TBS(to be signed) value.
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
    CERT_ITEM_TYPE_TBS
    |
        /**
         * Indicates to get certificate public key.
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
    CERT_ITEM_TYPE_PUBLIC_KEY
    |

        /**
         * Indicates to get certificate issuer unique id value.
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
    CERT_ITEM_TYPE_ISSUER_UNIQUE_ID
    |

        /**
         * Indicates to get certificate subject unique id value.
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
    CERT_ITEM_TYPE_SUBJECT_UNIQUE_ID
    |

        /**
         * Indicates to get certificate extensions value.
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
    CERT_ITEM_TYPE_EXTENSIONS
    | ...

    func getValue(): Int32 {
        match (this) {
            case CERT_ITEM_TYPE_TBS => 0
            case CERT_ITEM_TYPE_PUBLIC_KEY => 1
            case CERT_ITEM_TYPE_ISSUER_UNIQUE_ID => 2
            case CERT_ITEM_TYPE_SUBJECT_UNIQUE_ID => 3
            case CERT_ITEM_TYPE_EXTENSIONS => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates for the certificate extension object identifier (OID) types.
 *
 * @syscap SystemCapability.Security.Cert
 * @crossplatform
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Cert"
]
public enum ExtensionOidType {
    /**
     * Indicates to obtain all types of OIDs, including critical and uncritical types.
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
    EXTENSION_OID_TYPE_ALL
    |
        /**
         * Indicates to obtain OIDs of the critical type.
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
    EXTENSION_OID_TYPE_CRITICAL
    |

        /**
         * Indicates to obtain OIDs of the uncritical type.
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
    EXTENSION_OID_TYPE_UNCRITICAL
    | ...

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Cert"
    ]
    public func getValue(): Int32 {
        match (this) {
            case EXTENSION_OID_TYPE_ALL => 0
            case EXTENSION_OID_TYPE_CRITICAL => 1
            case EXTENSION_OID_TYPE_UNCRITICAL => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enum for the certificate extension entry type.
 *
 * @syscap SystemCapability.Security.Cert
 * @crossplatform
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Cert"
]
public enum ExtensionEntryType {
    /**
     * Indicates to get extension entry.
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
    EXTENSION_ENTRY_TYPE_ENTRY
    |
        /**
         * Indicates to get extension entry critical.
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
    EXTENSION_ENTRY_TYPE_ENTRY_CRITICAL
    |
        /**
         * Indicates to get extension entry value.
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
    EXTENSION_ENTRY_TYPE_ENTRY_VALUE
    | ...

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Cert"
    ]
    public func getValue(): Int32 {
        match (this) {
            case EXTENSION_ENTRY_TYPE_ENTRY => 0
            case EXTENSION_ENTRY_TYPE_ENTRY_CRITICAL => 1
            case EXTENSION_ENTRY_TYPE_ENTRY_VALUE => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enum for general name use type.
 *
 * @syscap SystemCapability.Security.Cert
 * @crossplatform
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Cert"
]
public enum GeneralNameType {
    /**
     * Indicates the name used for other.
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
    GENERAL_NAME_TYPE_OTHER_NAME
    |

        /**
         * Indicates the name used for RFC822.
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
    GENERAL_NAME_TYPE_RFC822_NAME
    |

        /**
         * Indicates the name used for DNS.
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
    GENERAL_NAME_TYPE_DNS_NAME
    |

        /**
         * Indicates the name used for X.400 address.
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
    GENERAL_NAME_TYPE_X400_ADDRESS
    |

        /**
         * Indicates the name used for X.500 directory.
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
    GENERAL_NAME_TYPE_DIRECTORY_NAME
    |

        /**
         * Indicates the name used for EDI.
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
    GENERAL_NAME_TYPE_EDI_PARTY_NAME
    |

        /**
         * Indicates the name used for URI.
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
    GENERAL_NAME_TYPE_UNIFORM_RESOURCE_ID
    |

        /**
         * Indicates the name used for IP address.
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
    GENERAL_NAME_TYPE_IP_ADDRESS
    |

        /**
         * Indicates the name used for registered ID.
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
    GENERAL_NAME_TYPE_REGISTERED_ID
    | ...

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Cert"
    ]
    public func getValue(): Int32 {
        match (this) {
            case GENERAL_NAME_TYPE_OTHER_NAME => 0
            case GENERAL_NAME_TYPE_RFC822_NAME => 1
            case GENERAL_NAME_TYPE_DNS_NAME => 2
            case GENERAL_NAME_TYPE_X400_ADDRESS => 3
            case GENERAL_NAME_TYPE_DIRECTORY_NAME => 4
            case GENERAL_NAME_TYPE_EDI_PARTY_NAME => 5
            case GENERAL_NAME_TYPE_UNIFORM_RESOURCE_ID => 6
            case GENERAL_NAME_TYPE_IP_ADDRESS => 7
            case GENERAL_NAME_TYPE_REGISTERED_ID => 8
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enum for validation keyusage type.
 *
 * @enum { Int32 }
 * @syscap SystemCapability.Security.Cert
 * @crossplatform
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Cert"
]
public enum KeyUsageType {
    /**
     * Indicates the certificate public key can be used for digital signature operations.
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
    KEYUSAGE_DIGITAL_SIGNATURE
    |
        /**
         * Indicates certificate public key can be used for non repudiation operations, preventing the signer from denying their signature.
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
    KEYUSAGE_NON_REPUDIATION
    |
        /**
         * Indicates certificate public key can be used for key encryption operations, for encrypting symmetric keys, etc.
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
    KEYUSAGE_KEY_ENCIPHERMENT
    |
        /**
         * Indicates certificate public key can be used for data encryption operations, to encrypt data.
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
    KEYUSAGE_DATA_ENCIPHERMENT
    |
        /**
         * Indicates certificate public key can be used for key negotiation operations, to negotiate shared keys.
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
    KEYUSAGE_KEY_AGREEMENT
    |
        /**
         * Indicates certificate public key can be used for certificate signing operations.
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
    KEYUSAGE_KEY_CERT_SIGN
    |
        /**
         * Indicates certificate public key can be used for signing operations on certificate revocation lists (CRLs).
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
    KEYUSAGE_CRL_SIGN
    |
        /**
         * Indicates the key can only be used for encryption operations and cannot be used for decryption operations.
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
    KEYUSAGE_ENCIPHER_ONLY
    |
        /**
         * Indicates the key can only be used for decryption operations and cannot be used for encryption operations.
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
    KEYUSAGE_DECIPHER_ONLY
    | ...

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Cert"
    ]
    public func getValue(): Int32 {
        match (this) {
            case KEYUSAGE_DIGITAL_SIGNATURE => 0
            case KEYUSAGE_NON_REPUDIATION => 1
            case KEYUSAGE_KEY_ENCIPHERMENT => 2
            case KEYUSAGE_DATA_ENCIPHERMENT => 3
            case KEYUSAGE_KEY_AGREEMENT => 4
            case KEYUSAGE_KEY_CERT_SIGN => 5
            case KEYUSAGE_CRL_SIGN => 6
            case KEYUSAGE_ENCIPHER_ONLY => 7
            case KEYUSAGE_DECIPHER_ONLY => 8
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enum for revocation check option.
 *
 * @enum { Int32 }
 * @syscap SystemCapability.Security.Cert
 * @crossplatform
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Cert"
]
public enum RevocationCheckOptions {
    /**
     * Indicates priority to use OCSP for verification.
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
    REVOCATION_CHECK_OPTION_PREFER_OCSP
    |
        /**
         * Indicates support for verifying revocation status by accessing the network to obtain CRL or OCSP responses.
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
    REVOCATION_CHECK_OPTION_ACCESS_NETWORK
    |
        /**
         * Indicates when the 'REVOCATION_CHECK_OPTION_ACCESS_NETWORK' option is turned on, it is effective.
         * If the preferred verification method is unable to verify the certificate status due to network reasons,
         * an alternative solution will be used for verification.
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
    REVOCATION_CHECK_OPTION_FALLBACK_NO_PREFER
    |
        /**
         * Indicates when the 'REVOCATION_CHECK_OPTION_ACCESS_NETWORK' option is turned on, it is effective.
         * If both the CRL and OCSP responses obtained online cannot verify the certificate status due to network reasons,
         * the locally set CRL and OCSP responses will be used for verification.
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
    REVOCATION_CHECK_OPTION_FALLBACK_LOCAL
    | ...

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Cert"
    ]
    public func getValue(): Int32 {
        match (this) {
            case REVOCATION_CHECK_OPTION_PREFER_OCSP => 0
            case REVOCATION_CHECK_OPTION_ACCESS_NETWORK => 1
            case REVOCATION_CHECK_OPTION_FALLBACK_NO_PREFER => 2
            case REVOCATION_CHECK_OPTION_FALLBACK_LOCAL => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enum for validation policy type.
 *
 * @enum { Int32 }
 * @syscap SystemCapability.Security.Cert
 * @crossplatform
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Cert"
]
public enum ValidationPolicyType {
    /**
     * Indicates not need to verify the sslHostname field in the certificate.
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
    VALIDATION_POLICY_TYPE_X509
    |
        /**
         * Indicates need to verify the sslHostname field in the certificate.
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
    VALIDATION_POLICY_TYPE_SSL
    | ...

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Cert"
    ]
    public func getValue(): Int32 {
        match (this) {
            case VALIDATION_POLICY_TYPE_X509 => 0
            case VALIDATION_POLICY_TYPE_SSL => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
