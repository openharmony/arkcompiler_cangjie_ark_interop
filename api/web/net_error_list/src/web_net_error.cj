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

package ohos.web.net_error_list

import std.deriving.*
import ohos.labels.*

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum WebNetErrorList {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    NET_OK
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_IO_PENDING
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_ABORTED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_INVALID_ARGUMENT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_INVALID_HANDLE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_FILE_NOT_FOUND
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_TIMED_OUT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_FILE_TOO_LARGE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_UNEXPECTED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_ACCESS_DENIED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_NOT_IMPLEMENTED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_INSUFFICIENT_RESOURCES
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_OUT_OF_MEMORY
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_UPLOAD_FILE_CHANGED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SOCKET_NOT_CONNECTED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_FILE_EXISTS
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_FILE_PATH_TOO_LONG
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_FILE_NO_SPACE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_FILE_VIRUS_INFECTED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_BLOCKED_BY_CLIENT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_NETWORK_CHANGED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_BLOCKED_BY_ADMINISTRATOR
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SOCKET_CONNECTED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CONTEXT_SHUT_DOWN
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_BLOCKED_BY_RESPONSE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CLEARTEXT_NOT_PERMITTED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_BLOCKED_BY_CSP
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_H2_OR_QUIC_REQUIRED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_BLOCKED_BY_ORB
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CONNECTION_CLOSED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CONNECTION_RESET
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CONNECTION_REFUSED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CONNECTION_ABORTED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CONNECTION_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_NAME_NOT_RESOLVED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_INTERNET_DISCONNECTED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SSL_PROTOCOL_ERROR
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_ADDRESS_INVALID
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_ADDRESS_UNREACHABLE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SSL_CLIENT_AUTH_CERT_NEEDED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_TUNNEL_CONNECTION_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_NO_SSL_VERSIONS_ENABLED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SSL_VERSION_OR_CIPHER_MISMATCH
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SSL_RENEGOTIATION_REQUESTED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_PROXY_AUTH_UNSUPPORTED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_BAD_SSL_CLIENT_AUTH_CERT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CONNECTION_TIMED_OUT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_HOST_RESOLVER_QUEUE_TOO_LARGE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SOCKS_CONNECTION_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SOCKS_CONNECTION_HOST_UNREACHABLE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_ALPN_NEGOTIATION_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SSL_NO_RENEGOTIATION
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_WINSOCK_UNEXPECTED_WRITTEN_BYTES
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SSL_DECOMPRESSION_FAILURE_ALERT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SSL_BAD_RECORD_MAC_ALERT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_PROXY_AUTH_REQUESTED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_PROXY_CONNECTION_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_MANDATORY_PROXY_CONFIGURATION_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_PRECONNECT_MAX_SOCKET_LIMIT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SSL_CLIENT_AUTH_PRIVATE_KEY_ACCESS_DENIED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SSL_CLIENT_AUTH_CERT_NO_PRIVATE_KEY
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_PROXY_CERTIFICATE_INVALID
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_NAME_RESOLUTION_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_NETWORK_ACCESS_DENIED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_TEMPORARILY_THROTTLED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_HTTPS_PROXY_TUNNEL_RESPONSE_REDIRECT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SSL_CLIENT_AUTH_SIGNATURE_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_MSG_TOO_BIG
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_WS_PROTOCOL_ERROR
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_ADDRESS_IN_USE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SSL_HANDSHAKE_NOT_COMPLETED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SSL_BAD_PEER_PUBLIC_KEY
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SSL_PINNED_KEY_NOT_IN_CERT_CHAIN
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CLIENT_AUTH_CERT_TYPE_UNSUPPORTED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SSL_DECRYPT_ERROR_ALERT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_WS_THROTTLE_QUEUE_TOO_LARGE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SSL_SERVER_CERT_CHANGED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SSL_UNRECOGNIZED_NAME_ALERT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SOCKET_SET_RECEIVE_BUFFER_SIZE_ERROR
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SOCKET_SET_SEND_BUFFER_SIZE_ERROR
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SOCKET_RECEIVE_BUFFER_SIZE_UNCHANGEABLE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_ICANN_NAME_COLLISION
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SSL_SERVER_CERT_BAD_FORMAT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CT_STH_PARSING_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CT_STH_INCOMPLETE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SSL_OBSOLETE_CIPHER
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_WS_UPGRADE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_READ_IF_READY_NOT_IMPLEMENTED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_NO_BUFFER_SPACE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_EARLY_DATA_REJECTED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_WRONG_VERSION_ON_EARLY_DATA
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_TLS13_DOWNGRADE_DETECTED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SSL_KEY_USAGE_INCOMPATIBLE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_INVALID_ECH_CONFIG_LIST
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_ECH_NOT_NEGOTIATED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_ECH_FALLBACK_CERTIFICATE_INVALID
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CERT_COMMON_NAME_INVALID
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CERT_DATE_INVALID
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CERT_AUTHORITY_INVALID
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CERT_CONTAINS_ERRORS
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CERT_NO_REVOCATION_MECHANISM
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CERT_UNABLE_TO_CHECK_REVOCATION
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CERT_REVOKED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CERT_INVALID
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CERT_WEAK_SIGNATURE_ALGORITHM
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CERT_NON_UNIQUE_NAME
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CERT_WEAK_KEY
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CERT_NAME_CONSTRAINT_VIOLATION
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CERT_VALIDITY_TOO_LONG
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CERTIFICATE_TRANSPARENCY_REQUIRED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CERT_SYMANTEC_LEGACY
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CERT_KNOWN_INTERCEPTION_BLOCKED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SSL_OBSOLETE_VERSION_OR_CIPHER
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CERT_END
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_INVALID_URL
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_DISALLOWED_URL_SCHEME
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_UNKNOWN_URL_SCHEME
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_INVALID_REDIRECT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_TOO_MANY_REDIRECTS
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_UNSAFE_REDIRECT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_UNSAFE_PORT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_INVALID_RESPONSE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_INVALID_CHUNKED_ENCODING
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_METHOD_UNSUPPORTED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_UNEXPECTED_PROXY_AUTH
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_EMPTY_RESPONSE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_RESPONSE_HEADERS_TOO_BIG
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_PAC_SCRIPT_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_REQUEST_RANGE_NOT_SATISFIABLE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_MALFORMED_IDENTITY
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CONTENT_DECODING_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_NETWORK_IO_SUSPENDED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SYN_REPLY_NOT_RECEIVED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_ENCODING_CONVERSION_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_NO_SUPPORTED_PROXIES
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_HTTP2_PROTOCOL_ERROR
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_INVALID_AUTH_CREDENTIALS
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_UNSUPPORTED_AUTH_SCHEME
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_ENCODING_DETECTION_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_MISSING_AUTH_CREDENTIALS
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_MISCONFIGURED_AUTH_ENVIRONMENT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_LENGTH
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_INCOMPLETE_HTTP2_HEADERS
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_PAC_NOT_IN_DHCP
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_HTTP2_SERVER_REFUSED_STREAM
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_HTTP2_PING_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CONTENT_LENGTH_MISMATCH
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_INCOMPLETE_CHUNKED_ENCODING
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_QUIC_PROTOCOL_ERROR
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_RESPONSE_HEADERS_TRUNCATED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_QUIC_HANDSHAKE_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_HTTP2_FLOW_CONTROL_ERROR
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_HTTP2_FRAME_SIZE_ERROR
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_HTTP2_COMPRESSION_ERROR
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_HTTP_1_1_REQUIRED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_PROXY_HTTP_1_1_REQUIRED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_PAC_SCRIPT_TERMINATED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_INVALID_HTTP_RESPONSE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CONTENT_DECODING_INIT_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_TOO_MANY_RETRIES
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_HTTP2_STREAM_CLOSED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_HTTP2_CLIENT_REFUSED_STREAM
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_HTTP_RESPONSE_CODE_FAILURE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_QUIC_UNKNOWN_CERT_ROOT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_TOO_MANY_ACCEPT_CH_RESTARTS
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_INCONSISTENT_IP_ADDRESS_SPACE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CACHED_IP_ADDRESS_SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CACHE_MISS
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CACHE_READ_FAILURE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CACHE_WRITE_FAILURE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CACHE_OPERATION_UNSUPPORTED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CACHE_OPEN_FAILURE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CACHE_CREATE_FAILURE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CACHE_RACE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CACHE_CHECKSUM_READ_FAILURE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CACHE_CHECKSUM_MISMATCH
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CACHE_LOCK_TIMEOUT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CACHE_AUTH_FAILURE_AFTER_READ
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CACHE_ENTRY_NOT_SUITABLE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CACHE_DOOM_FAILURE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CACHE_OPEN_OR_CREATE_FAILURE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_INSECURE_RESPONSE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_NO_PRIVATE_KEY_FOR_CERT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_ADD_USER_CERT_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_INVALID_SIGNED_EXCHANGE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_INVALID_WEB_BUNDLE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_TRUST_TOKEN_OPERATION_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_FTP_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_FTP_SERVICE_UNAVAILABLE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_FTP_TRANSFER_ABORTED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_FTP_FILE_BUSY
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_FTP_SYNTAX_ERROR
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_FTP_COMMAND_UNSUPPORTED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_FTP_BAD_COMMAND_SEQUENCE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_PKCS12_IMPORT_BAD_PASSWORD
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_PKCS12_IMPORT_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_IMPORT_CA_CERT_NOT_CA
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_IMPORT_CERT_ALREADY_EXISTS
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_IMPORT_CA_CERT_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_IMPORT_SERVER_CERT_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_PKCS12_IMPORT_INVALID_MAC
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_PKCS12_IMPORT_INVALID_FILE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_PKCS12_IMPORT_UNSUPPORTED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_KEY_GENERATION_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_PRIVATE_KEY_EXPORT_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_SELF_SIGNED_CERT_GENERATION_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CERT_DATABASE_CHANGED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_CERT_VERIFIER_CHANGED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_DNS_MALFORMED_RESPONSE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_DNS_SERVER_REQUIRES_TCP
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_DNS_SERVER_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_DNS_TIMED_OUT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_DNS_CACHE_MISS
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_DNS_SEARCH_EMPTY
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_DNS_SORT_ERROR
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_DNS_NAME_HTTPS_ONLY
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_DNS_REQUEST_CANCELED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERR_DNS_NO_MATCHING_SUPPORTED_ALPN
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case NET_OK => 0
            case ERR_IO_PENDING => -1
            case ERR_FAILED => -2
            case ERR_ABORTED => -3
            case ERR_INVALID_ARGUMENT => -4
            case ERR_INVALID_HANDLE => -5
            case ERR_FILE_NOT_FOUND => -6
            case ERR_TIMED_OUT => -7
            case ERR_FILE_TOO_LARGE => -8
            case ERR_UNEXPECTED => -9
            case ERR_ACCESS_DENIED => -10
            case ERR_NOT_IMPLEMENTED => -11
            case ERR_INSUFFICIENT_RESOURCES => -12
            case ERR_OUT_OF_MEMORY => -13
            case ERR_UPLOAD_FILE_CHANGED => -14
            case ERR_SOCKET_NOT_CONNECTED => -15
            case ERR_FILE_EXISTS => -16
            case ERR_FILE_PATH_TOO_LONG => -17
            case ERR_FILE_NO_SPACE => -18
            case ERR_FILE_VIRUS_INFECTED => -19
            case ERR_BLOCKED_BY_CLIENT => -20
            case ERR_NETWORK_CHANGED => -21
            case ERR_BLOCKED_BY_ADMINISTRATOR => -22
            case ERR_SOCKET_CONNECTED => -23
            case ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED => -25
            case ERR_CONTEXT_SHUT_DOWN => -26
            case ERR_BLOCKED_BY_RESPONSE => -27
            case ERR_CLEARTEXT_NOT_PERMITTED => -29
            case ERR_BLOCKED_BY_CSP => -30
            case ERR_H2_OR_QUIC_REQUIRED => -31
            case ERR_BLOCKED_BY_ORB => -32
            case ERR_CONNECTION_CLOSED => -100
            case ERR_CONNECTION_RESET => -101
            case ERR_CONNECTION_REFUSED => -102
            case ERR_CONNECTION_ABORTED => -103
            case ERR_CONNECTION_FAILED => -104
            case ERR_NAME_NOT_RESOLVED => -105
            case ERR_INTERNET_DISCONNECTED => -106
            case ERR_SSL_PROTOCOL_ERROR => -107
            case ERR_ADDRESS_INVALID => -108
            case ERR_ADDRESS_UNREACHABLE => -109
            case ERR_SSL_CLIENT_AUTH_CERT_NEEDED => -110
            case ERR_TUNNEL_CONNECTION_FAILED => -111
            case ERR_NO_SSL_VERSIONS_ENABLED => -112
            case ERR_SSL_VERSION_OR_CIPHER_MISMATCH => -113
            case ERR_SSL_RENEGOTIATION_REQUESTED => -114
            case ERR_PROXY_AUTH_UNSUPPORTED => -115
            case ERR_BAD_SSL_CLIENT_AUTH_CERT => -117
            case ERR_CONNECTION_TIMED_OUT => -118
            case ERR_HOST_RESOLVER_QUEUE_TOO_LARGE => -119
            case ERR_SOCKS_CONNECTION_FAILED => -120
            case ERR_SOCKS_CONNECTION_HOST_UNREACHABLE => -121
            case ERR_ALPN_NEGOTIATION_FAILED => -122
            case ERR_SSL_NO_RENEGOTIATION => -123
            case ERR_WINSOCK_UNEXPECTED_WRITTEN_BYTES => -124
            case ERR_SSL_DECOMPRESSION_FAILURE_ALERT => -125
            case ERR_SSL_BAD_RECORD_MAC_ALERT => -126
            case ERR_PROXY_AUTH_REQUESTED => -127
            case ERR_PROXY_CONNECTION_FAILED => -130
            case ERR_MANDATORY_PROXY_CONFIGURATION_FAILED => -131
            case ERR_PRECONNECT_MAX_SOCKET_LIMIT => -133
            case ERR_SSL_CLIENT_AUTH_PRIVATE_KEY_ACCESS_DENIED => -134
            case ERR_SSL_CLIENT_AUTH_CERT_NO_PRIVATE_KEY => -135
            case ERR_PROXY_CERTIFICATE_INVALID => -136
            case ERR_NAME_RESOLUTION_FAILED => -137
            case ERR_NETWORK_ACCESS_DENIED => -138
            case ERR_TEMPORARILY_THROTTLED => -139
            case ERR_HTTPS_PROXY_TUNNEL_RESPONSE_REDIRECT => -140
            case ERR_SSL_CLIENT_AUTH_SIGNATURE_FAILED => -141
            case ERR_MSG_TOO_BIG => -142
            case ERR_WS_PROTOCOL_ERROR => -145
            case ERR_ADDRESS_IN_USE => -147
            case ERR_SSL_HANDSHAKE_NOT_COMPLETED => -148
            case ERR_SSL_BAD_PEER_PUBLIC_KEY => -149
            case ERR_SSL_PINNED_KEY_NOT_IN_CERT_CHAIN => -150
            case ERR_CLIENT_AUTH_CERT_TYPE_UNSUPPORTED => -151
            case ERR_SSL_DECRYPT_ERROR_ALERT => -153
            case ERR_WS_THROTTLE_QUEUE_TOO_LARGE => -154
            case ERR_SSL_SERVER_CERT_CHANGED => -156
            case ERR_SSL_UNRECOGNIZED_NAME_ALERT => -159
            case ERR_SOCKET_SET_RECEIVE_BUFFER_SIZE_ERROR => -160
            case ERR_SOCKET_SET_SEND_BUFFER_SIZE_ERROR => -161
            case ERR_SOCKET_RECEIVE_BUFFER_SIZE_UNCHANGEABLE => -162
            case ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE => -163
            case ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT => -164
            case ERR_ICANN_NAME_COLLISION => -166
            case ERR_SSL_SERVER_CERT_BAD_FORMAT => -167
            case ERR_CT_STH_PARSING_FAILED => -168
            case ERR_CT_STH_INCOMPLETE => -169
            case ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH => -170
            case ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED => -171
            case ERR_SSL_OBSOLETE_CIPHER => -172
            case ERR_WS_UPGRADE => -173
            case ERR_READ_IF_READY_NOT_IMPLEMENTED => -174
            case ERR_NO_BUFFER_SPACE => -176
            case ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS => -177
            case ERR_EARLY_DATA_REJECTED => -178
            case ERR_WRONG_VERSION_ON_EARLY_DATA => -179
            case ERR_TLS13_DOWNGRADE_DETECTED => -180
            case ERR_SSL_KEY_USAGE_INCOMPATIBLE => -181
            case ERR_INVALID_ECH_CONFIG_LIST => -182
            case ERR_ECH_NOT_NEGOTIATED => -183
            case ERR_ECH_FALLBACK_CERTIFICATE_INVALID => -184
            case ERR_CERT_COMMON_NAME_INVALID => -200
            case ERR_CERT_DATE_INVALID => -201
            case ERR_CERT_AUTHORITY_INVALID => -202
            case ERR_CERT_CONTAINS_ERRORS => -203
            case ERR_CERT_NO_REVOCATION_MECHANISM => -204
            case ERR_CERT_UNABLE_TO_CHECK_REVOCATION => -205
            case ERR_CERT_REVOKED => -206
            case ERR_CERT_INVALID => -207
            case ERR_CERT_WEAK_SIGNATURE_ALGORITHM => -208
            case ERR_CERT_NON_UNIQUE_NAME => -210
            case ERR_CERT_WEAK_KEY => -211
            case ERR_CERT_NAME_CONSTRAINT_VIOLATION => -212
            case ERR_CERT_VALIDITY_TOO_LONG => -213
            case ERR_CERTIFICATE_TRANSPARENCY_REQUIRED => -214
            case ERR_CERT_SYMANTEC_LEGACY => -215
            case ERR_CERT_KNOWN_INTERCEPTION_BLOCKED => -217
            case ERR_SSL_OBSOLETE_VERSION_OR_CIPHER => -218
            case ERR_CERT_END => -219
            case ERR_INVALID_URL => -300
            case ERR_DISALLOWED_URL_SCHEME => -301
            case ERR_UNKNOWN_URL_SCHEME => -302
            case ERR_INVALID_REDIRECT => -303
            case ERR_TOO_MANY_REDIRECTS => -310
            case ERR_UNSAFE_REDIRECT => -311
            case ERR_UNSAFE_PORT => -312
            case ERR_INVALID_RESPONSE => -320
            case ERR_INVALID_CHUNKED_ENCODING => -321
            case ERR_METHOD_UNSUPPORTED => -322
            case ERR_UNEXPECTED_PROXY_AUTH => -323
            case ERR_EMPTY_RESPONSE => -324
            case ERR_RESPONSE_HEADERS_TOO_BIG => -325
            case ERR_PAC_SCRIPT_FAILED => -327
            case ERR_REQUEST_RANGE_NOT_SATISFIABLE => -328
            case ERR_MALFORMED_IDENTITY => -329
            case ERR_CONTENT_DECODING_FAILED => -330
            case ERR_NETWORK_IO_SUSPENDED => -331
            case ERR_SYN_REPLY_NOT_RECEIVED => -332
            case ERR_ENCODING_CONVERSION_FAILED => -333
            case ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT => -334
            case ERR_NO_SUPPORTED_PROXIES => -336
            case ERR_HTTP2_PROTOCOL_ERROR => -337
            case ERR_INVALID_AUTH_CREDENTIALS => -338
            case ERR_UNSUPPORTED_AUTH_SCHEME => -339
            case ERR_ENCODING_DETECTION_FAILED => -340
            case ERR_MISSING_AUTH_CREDENTIALS => -341
            case ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS => -342
            case ERR_MISCONFIGURED_AUTH_ENVIRONMENT => -343
            case ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS => -344
            case ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN => -345
            case ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_LENGTH => -346
            case ERR_INCOMPLETE_HTTP2_HEADERS => -347
            case ERR_PAC_NOT_IN_DHCP => -348
            case ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION => -349
            case ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION => -350
            case ERR_HTTP2_SERVER_REFUSED_STREAM => -351
            case ERR_HTTP2_PING_FAILED => -352
            case ERR_CONTENT_LENGTH_MISMATCH => -354
            case ERR_INCOMPLETE_CHUNKED_ENCODING => -355
            case ERR_QUIC_PROTOCOL_ERROR => -356
            case ERR_RESPONSE_HEADERS_TRUNCATED => -357
            case ERR_QUIC_HANDSHAKE_FAILED => -358
            case ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY => -360
            case ERR_HTTP2_FLOW_CONTROL_ERROR => -361
            case ERR_HTTP2_FRAME_SIZE_ERROR => -362
            case ERR_HTTP2_COMPRESSION_ERROR => -363
            case ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION => -364
            case ERR_HTTP_1_1_REQUIRED => -365
            case ERR_PROXY_HTTP_1_1_REQUIRED => -366
            case ERR_PAC_SCRIPT_TERMINATED => -367
            case ERR_INVALID_HTTP_RESPONSE => -370
            case ERR_CONTENT_DECODING_INIT_FAILED => -371
            case ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED => -372
            case ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE => -373
            case ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER => -374
            case ERR_TOO_MANY_RETRIES => -375
            case ERR_HTTP2_STREAM_CLOSED => -376
            case ERR_HTTP2_CLIENT_REFUSED_STREAM => -377
            case ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH => -378
            case ERR_HTTP_RESPONSE_CODE_FAILURE => -379
            case ERR_QUIC_UNKNOWN_CERT_ROOT => -380
            case ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED => -381
            case ERR_TOO_MANY_ACCEPT_CH_RESTARTS => -382
            case ERR_INCONSISTENT_IP_ADDRESS_SPACE => -383
            case ERR_CACHED_IP_ADDRESS_SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY => -384
            case ERR_CACHE_MISS => -400
            case ERR_CACHE_READ_FAILURE => -401
            case ERR_CACHE_WRITE_FAILURE => -402
            case ERR_CACHE_OPERATION_UNSUPPORTED => -403
            case ERR_CACHE_OPEN_FAILURE => -404
            case ERR_CACHE_CREATE_FAILURE => -405
            case ERR_CACHE_RACE => -406
            case ERR_CACHE_CHECKSUM_READ_FAILURE => -407
            case ERR_CACHE_CHECKSUM_MISMATCH => -408
            case ERR_CACHE_LOCK_TIMEOUT => -409
            case ERR_CACHE_AUTH_FAILURE_AFTER_READ => -410
            case ERR_CACHE_ENTRY_NOT_SUITABLE => -411
            case ERR_CACHE_DOOM_FAILURE => -412
            case ERR_CACHE_OPEN_OR_CREATE_FAILURE => -413
            case ERR_INSECURE_RESPONSE => -501
            case ERR_NO_PRIVATE_KEY_FOR_CERT => -502
            case ERR_ADD_USER_CERT_FAILED => -503
            case ERR_INVALID_SIGNED_EXCHANGE => -504
            case ERR_INVALID_WEB_BUNDLE => -505
            case ERR_TRUST_TOKEN_OPERATION_FAILED => -506
            case ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST => -507
            case ERR_FTP_FAILED => -601
            case ERR_FTP_SERVICE_UNAVAILABLE => -602
            case ERR_FTP_TRANSFER_ABORTED => -603
            case ERR_FTP_FILE_BUSY => -604
            case ERR_FTP_SYNTAX_ERROR => -605
            case ERR_FTP_COMMAND_UNSUPPORTED => -606
            case ERR_FTP_BAD_COMMAND_SEQUENCE => -607
            case ERR_PKCS12_IMPORT_BAD_PASSWORD => -701
            case ERR_PKCS12_IMPORT_FAILED => -702
            case ERR_IMPORT_CA_CERT_NOT_CA => -703
            case ERR_IMPORT_CERT_ALREADY_EXISTS => -704
            case ERR_IMPORT_CA_CERT_FAILED => -705
            case ERR_IMPORT_SERVER_CERT_FAILED => -706
            case ERR_PKCS12_IMPORT_INVALID_MAC => -707
            case ERR_PKCS12_IMPORT_INVALID_FILE => -708
            case ERR_PKCS12_IMPORT_UNSUPPORTED => -709
            case ERR_KEY_GENERATION_FAILED => -710
            case ERR_PRIVATE_KEY_EXPORT_FAILED => -712
            case ERR_SELF_SIGNED_CERT_GENERATION_FAILED => -713
            case ERR_CERT_DATABASE_CHANGED => -714
            case ERR_CERT_VERIFIER_CHANGED => -716
            case ERR_DNS_MALFORMED_RESPONSE => -800
            case ERR_DNS_SERVER_REQUIRES_TCP => -801
            case ERR_DNS_SERVER_FAILED => -802
            case ERR_DNS_TIMED_OUT => -803
            case ERR_DNS_CACHE_MISS => -804
            case ERR_DNS_SEARCH_EMPTY => -805
            case ERR_DNS_SORT_ERROR => -806
            case ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED => -808
            case ERR_DNS_NAME_HTTPS_ONLY => -809
            case ERR_DNS_REQUEST_CANCELED => -810
            case ERR_DNS_NO_MATCHING_SUPPORTED_ALPN => -811
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parse(val: Int32): WebNetErrorList {
        match (val) {
            case 0 => NET_OK
            case -1 => ERR_IO_PENDING
            case -2 => ERR_FAILED
            case -3 => ERR_ABORTED
            case -4 => ERR_INVALID_ARGUMENT
            case -5 => ERR_INVALID_HANDLE
            case -6 => ERR_FILE_NOT_FOUND
            case -7 => ERR_TIMED_OUT
            case -8 => ERR_FILE_TOO_LARGE
            case -9 => ERR_UNEXPECTED
            case -10 => ERR_ACCESS_DENIED
            case -11 => ERR_NOT_IMPLEMENTED
            case -12 => ERR_INSUFFICIENT_RESOURCES
            case -13 => ERR_OUT_OF_MEMORY
            case -14 => ERR_UPLOAD_FILE_CHANGED
            case -15 => ERR_SOCKET_NOT_CONNECTED
            case -16 => ERR_FILE_EXISTS
            case -17 => ERR_FILE_PATH_TOO_LONG
            case -18 => ERR_FILE_NO_SPACE
            case -19 => ERR_FILE_VIRUS_INFECTED
            case -20 => ERR_BLOCKED_BY_CLIENT
            case -21 => ERR_NETWORK_CHANGED
            case -22 => ERR_BLOCKED_BY_ADMINISTRATOR
            case -23 => ERR_SOCKET_CONNECTED
            case -25 => ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED
            case -26 => ERR_CONTEXT_SHUT_DOWN
            case -27 => ERR_BLOCKED_BY_RESPONSE
            case -29 => ERR_CLEARTEXT_NOT_PERMITTED
            case -30 => ERR_BLOCKED_BY_CSP
            case -31 => ERR_H2_OR_QUIC_REQUIRED
            case -32 => ERR_BLOCKED_BY_ORB
            case -100 => ERR_CONNECTION_CLOSED
            case -101 => ERR_CONNECTION_RESET
            case -102 => ERR_CONNECTION_REFUSED
            case -103 => ERR_CONNECTION_ABORTED
            case -104 => ERR_CONNECTION_FAILED
            case -105 => ERR_NAME_NOT_RESOLVED
            case -106 => ERR_INTERNET_DISCONNECTED
            case -107 => ERR_SSL_PROTOCOL_ERROR
            case -108 => ERR_ADDRESS_INVALID
            case -109 => ERR_ADDRESS_UNREACHABLE
            case -110 => ERR_SSL_CLIENT_AUTH_CERT_NEEDED
            case -111 => ERR_TUNNEL_CONNECTION_FAILED
            case -112 => ERR_NO_SSL_VERSIONS_ENABLED
            case -113 => ERR_SSL_VERSION_OR_CIPHER_MISMATCH
            case -114 => ERR_SSL_RENEGOTIATION_REQUESTED
            case -115 => ERR_PROXY_AUTH_UNSUPPORTED
            case -117 => ERR_BAD_SSL_CLIENT_AUTH_CERT
            case -118 => ERR_CONNECTION_TIMED_OUT
            case -119 => ERR_HOST_RESOLVER_QUEUE_TOO_LARGE
            case -120 => ERR_SOCKS_CONNECTION_FAILED
            case -121 => ERR_SOCKS_CONNECTION_HOST_UNREACHABLE
            case -122 => ERR_ALPN_NEGOTIATION_FAILED
            case -123 => ERR_SSL_NO_RENEGOTIATION
            case -124 => ERR_WINSOCK_UNEXPECTED_WRITTEN_BYTES
            case -125 => ERR_SSL_DECOMPRESSION_FAILURE_ALERT
            case -126 => ERR_SSL_BAD_RECORD_MAC_ALERT
            case -127 => ERR_PROXY_AUTH_REQUESTED
            case -130 => ERR_PROXY_CONNECTION_FAILED
            case -131 => ERR_MANDATORY_PROXY_CONFIGURATION_FAILED
            case -133 => ERR_PRECONNECT_MAX_SOCKET_LIMIT
            case -134 => ERR_SSL_CLIENT_AUTH_PRIVATE_KEY_ACCESS_DENIED
            case -135 => ERR_SSL_CLIENT_AUTH_CERT_NO_PRIVATE_KEY
            case -136 => ERR_PROXY_CERTIFICATE_INVALID
            case -137 => ERR_NAME_RESOLUTION_FAILED
            case -138 => ERR_NETWORK_ACCESS_DENIED
            case -139 => ERR_TEMPORARILY_THROTTLED
            case -140 => ERR_HTTPS_PROXY_TUNNEL_RESPONSE_REDIRECT
            case -141 => ERR_SSL_CLIENT_AUTH_SIGNATURE_FAILED
            case -142 => ERR_MSG_TOO_BIG
            case -145 => ERR_WS_PROTOCOL_ERROR
            case -147 => ERR_ADDRESS_IN_USE
            case -148 => ERR_SSL_HANDSHAKE_NOT_COMPLETED
            case -149 => ERR_SSL_BAD_PEER_PUBLIC_KEY
            case -150 => ERR_SSL_PINNED_KEY_NOT_IN_CERT_CHAIN
            case -151 => ERR_CLIENT_AUTH_CERT_TYPE_UNSUPPORTED
            case -153 => ERR_SSL_DECRYPT_ERROR_ALERT
            case -154 => ERR_WS_THROTTLE_QUEUE_TOO_LARGE
            case -156 => ERR_SSL_SERVER_CERT_CHANGED
            case -159 => ERR_SSL_UNRECOGNIZED_NAME_ALERT
            case -160 => ERR_SOCKET_SET_RECEIVE_BUFFER_SIZE_ERROR
            case -161 => ERR_SOCKET_SET_SEND_BUFFER_SIZE_ERROR
            case -162 => ERR_SOCKET_RECEIVE_BUFFER_SIZE_UNCHANGEABLE
            case -163 => ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE
            case -164 => ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT
            case -166 => ERR_ICANN_NAME_COLLISION
            case -167 => ERR_SSL_SERVER_CERT_BAD_FORMAT
            case -168 => ERR_CT_STH_PARSING_FAILED
            case -169 => ERR_CT_STH_INCOMPLETE
            case -170 => ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH
            case -171 => ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED
            case -172 => ERR_SSL_OBSOLETE_CIPHER
            case -173 => ERR_WS_UPGRADE
            case -174 => ERR_READ_IF_READY_NOT_IMPLEMENTED
            case -176 => ERR_NO_BUFFER_SPACE
            case -177 => ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS
            case -178 => ERR_EARLY_DATA_REJECTED
            case -179 => ERR_WRONG_VERSION_ON_EARLY_DATA
            case -180 => ERR_TLS13_DOWNGRADE_DETECTED
            case -181 => ERR_SSL_KEY_USAGE_INCOMPATIBLE
            case -182 => ERR_INVALID_ECH_CONFIG_LIST
            case -183 => ERR_ECH_NOT_NEGOTIATED
            case -184 => ERR_ECH_FALLBACK_CERTIFICATE_INVALID
            case -200 => ERR_CERT_COMMON_NAME_INVALID
            case -201 => ERR_CERT_DATE_INVALID
            case -202 => ERR_CERT_AUTHORITY_INVALID
            case -203 => ERR_CERT_CONTAINS_ERRORS
            case -204 => ERR_CERT_NO_REVOCATION_MECHANISM
            case -205 => ERR_CERT_UNABLE_TO_CHECK_REVOCATION
            case -206 => ERR_CERT_REVOKED
            case -207 => ERR_CERT_INVALID
            case -208 => ERR_CERT_WEAK_SIGNATURE_ALGORITHM
            case -210 => ERR_CERT_NON_UNIQUE_NAME
            case -211 => ERR_CERT_WEAK_KEY
            case -212 => ERR_CERT_NAME_CONSTRAINT_VIOLATION
            case -213 => ERR_CERT_VALIDITY_TOO_LONG
            case -214 => ERR_CERTIFICATE_TRANSPARENCY_REQUIRED
            case -215 => ERR_CERT_SYMANTEC_LEGACY
            case -217 => ERR_CERT_KNOWN_INTERCEPTION_BLOCKED
            case -218 => ERR_SSL_OBSOLETE_VERSION_OR_CIPHER
            case -219 => ERR_CERT_END
            case -300 => ERR_INVALID_URL
            case -301 => ERR_DISALLOWED_URL_SCHEME
            case -302 => ERR_UNKNOWN_URL_SCHEME
            case -303 => ERR_INVALID_REDIRECT
            case -310 => ERR_TOO_MANY_REDIRECTS
            case -311 => ERR_UNSAFE_REDIRECT
            case -312 => ERR_UNSAFE_PORT
            case -320 => ERR_INVALID_RESPONSE
            case -321 => ERR_INVALID_CHUNKED_ENCODING
            case -322 => ERR_METHOD_UNSUPPORTED
            case -323 => ERR_UNEXPECTED_PROXY_AUTH
            case -324 => ERR_EMPTY_RESPONSE
            case -325 => ERR_RESPONSE_HEADERS_TOO_BIG
            case -327 => ERR_PAC_SCRIPT_FAILED
            case -328 => ERR_REQUEST_RANGE_NOT_SATISFIABLE
            case -329 => ERR_MALFORMED_IDENTITY
            case -330 => ERR_CONTENT_DECODING_FAILED
            case -331 => ERR_NETWORK_IO_SUSPENDED
            case -332 => ERR_SYN_REPLY_NOT_RECEIVED
            case -333 => ERR_ENCODING_CONVERSION_FAILED
            case -334 => ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT
            case -336 => ERR_NO_SUPPORTED_PROXIES
            case -337 => ERR_HTTP2_PROTOCOL_ERROR
            case -338 => ERR_INVALID_AUTH_CREDENTIALS
            case -339 => ERR_UNSUPPORTED_AUTH_SCHEME
            case -340 => ERR_ENCODING_DETECTION_FAILED
            case -341 => ERR_MISSING_AUTH_CREDENTIALS
            case -342 => ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS
            case -343 => ERR_MISCONFIGURED_AUTH_ENVIRONMENT
            case -344 => ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS
            case -345 => ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN
            case -346 => ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_LENGTH
            case -347 => ERR_INCOMPLETE_HTTP2_HEADERS
            case -348 => ERR_PAC_NOT_IN_DHCP
            case -349 => ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION
            case -350 => ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION
            case -351 => ERR_HTTP2_SERVER_REFUSED_STREAM
            case -352 => ERR_HTTP2_PING_FAILED
            case -354 => ERR_CONTENT_LENGTH_MISMATCH
            case -355 => ERR_INCOMPLETE_CHUNKED_ENCODING
            case -356 => ERR_QUIC_PROTOCOL_ERROR
            case -357 => ERR_RESPONSE_HEADERS_TRUNCATED
            case -358 => ERR_QUIC_HANDSHAKE_FAILED
            case -360 => ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY
            case -361 => ERR_HTTP2_FLOW_CONTROL_ERROR
            case -362 => ERR_HTTP2_FRAME_SIZE_ERROR
            case -363 => ERR_HTTP2_COMPRESSION_ERROR
            case -364 => ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION
            case -365 => ERR_HTTP_1_1_REQUIRED
            case -366 => ERR_PROXY_HTTP_1_1_REQUIRED
            case -367 => ERR_PAC_SCRIPT_TERMINATED
            case -370 => ERR_INVALID_HTTP_RESPONSE
            case -371 => ERR_CONTENT_DECODING_INIT_FAILED
            case -372 => ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED
            case -373 => ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE
            case -374 => ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER
            case -375 => ERR_TOO_MANY_RETRIES
            case -376 => ERR_HTTP2_STREAM_CLOSED
            case -377 => ERR_HTTP2_CLIENT_REFUSED_STREAM
            case -378 => ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH
            case -379 => ERR_HTTP_RESPONSE_CODE_FAILURE
            case -380 => ERR_QUIC_UNKNOWN_CERT_ROOT
            case -381 => ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED
            case -382 => ERR_TOO_MANY_ACCEPT_CH_RESTARTS
            case -383 => ERR_INCONSISTENT_IP_ADDRESS_SPACE
            case -384 => ERR_CACHED_IP_ADDRESS_SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY
            case -400 => ERR_CACHE_MISS
            case -401 => ERR_CACHE_READ_FAILURE
            case -402 => ERR_CACHE_WRITE_FAILURE
            case -403 => ERR_CACHE_OPERATION_UNSUPPORTED
            case -404 => ERR_CACHE_OPEN_FAILURE
            case -405 => ERR_CACHE_CREATE_FAILURE
            case -406 => ERR_CACHE_RACE
            case -407 => ERR_CACHE_CHECKSUM_READ_FAILURE
            case -408 => ERR_CACHE_CHECKSUM_MISMATCH
            case -409 => ERR_CACHE_LOCK_TIMEOUT
            case -410 => ERR_CACHE_AUTH_FAILURE_AFTER_READ
            case -411 => ERR_CACHE_ENTRY_NOT_SUITABLE
            case -412 => ERR_CACHE_DOOM_FAILURE
            case -413 => ERR_CACHE_OPEN_OR_CREATE_FAILURE
            case -501 => ERR_INSECURE_RESPONSE
            case -502 => ERR_NO_PRIVATE_KEY_FOR_CERT
            case -503 => ERR_ADD_USER_CERT_FAILED
            case -504 => ERR_INVALID_SIGNED_EXCHANGE
            case -505 => ERR_INVALID_WEB_BUNDLE
            case -506 => ERR_TRUST_TOKEN_OPERATION_FAILED
            case -507 => ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST
            case -601 => ERR_FTP_FAILED
            case -602 => ERR_FTP_SERVICE_UNAVAILABLE
            case -603 => ERR_FTP_TRANSFER_ABORTED
            case -604 => ERR_FTP_FILE_BUSY
            case -605 => ERR_FTP_SYNTAX_ERROR
            case -606 => ERR_FTP_COMMAND_UNSUPPORTED
            case -607 => ERR_FTP_BAD_COMMAND_SEQUENCE
            case -701 => ERR_PKCS12_IMPORT_BAD_PASSWORD
            case -702 => ERR_PKCS12_IMPORT_FAILED
            case -703 => ERR_IMPORT_CA_CERT_NOT_CA
            case -704 => ERR_IMPORT_CERT_ALREADY_EXISTS
            case -705 => ERR_IMPORT_CA_CERT_FAILED
            case -706 => ERR_IMPORT_SERVER_CERT_FAILED
            case -707 => ERR_PKCS12_IMPORT_INVALID_MAC
            case -708 => ERR_PKCS12_IMPORT_INVALID_FILE
            case -709 => ERR_PKCS12_IMPORT_UNSUPPORTED
            case -710 => ERR_KEY_GENERATION_FAILED
            case -712 => ERR_PRIVATE_KEY_EXPORT_FAILED
            case -713 => ERR_SELF_SIGNED_CERT_GENERATION_FAILED
            case -714 => ERR_CERT_DATABASE_CHANGED
            case -716 => ERR_CERT_VERIFIER_CHANGED
            case -800 => ERR_DNS_MALFORMED_RESPONSE
            case -801 => ERR_DNS_SERVER_REQUIRES_TCP
            case -802 => ERR_DNS_SERVER_FAILED
            case -803 => ERR_DNS_TIMED_OUT
            case -804 => ERR_DNS_CACHE_MISS
            case -805 => ERR_DNS_SEARCH_EMPTY
            case -806 => ERR_DNS_SORT_ERROR
            case -808 => ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED
            case -809 => ERR_DNS_NAME_HTTPS_ONLY
            case -810 => ERR_DNS_REQUEST_CANCELED
            case -811 => ERR_DNS_NO_MATCHING_SUPPORTED_ALPN
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
