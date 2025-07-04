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

package ohos.net.webSocket

import ohos.labels.*
import ohos.base.*
import ohos.ffi.*
import std.collection.*

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public class WebSocketHttpProxy {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public WebSocketHttpProxy(
        /**
         * Proxy server host name.
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let host!: ?String = None,
        /**
         * Host port.
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let port!: ?UInt16 = None,
        /**
         * Do not use a blocking list for proxy servers.
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let exclusionList!: ?Array<String> = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let username!: ?String = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let password!: ?String = None
    ) {}
}

/**
 * The clientCert field of the client certificate, which includes three attributes:
 * client certificate (certPath) and only support PEM format, certificate private key (keyPath),
 * and passphrase (keyPassword).
 * @interface WebSocketClientCert
 * @syscap SystemCapability.Communication.NetStack
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public class WebSocketClientCert {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public WebSocketClientCert(
        /**
         * The path to the client certificate file.
         * @type {String}
         * @syscap SystemCapability.Communication.NetStack
         * @crossplatform
         */
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let certPath: String,

        /**
         * The path of the client certificate private key file.
         * @type {String}
         * @syscap SystemCapability.Communication.NetStack
         * @crossplatform
         */
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let keyPath: String,

        /**
         * Client certificate password.
         * @type {?String}
         * @syscap SystemCapability.Communication.NetStack
         * @crossplatform
         */
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let keyPassword!: ?String = None
    ) {}

    func toCClientCert(): CClientCert {
        var cert = CClientCert(CString(CPointer()), CString(CPointer()), CString(CPointer()))
        try {
            unsafe {
                cert.certPath = LibC.mallocCString(certPath)
                cert.keyPath = LibC.mallocCString(keyPath)
                cert.keyPassword = mallocStringOp(keyPassword)
            }
        } catch (e: Exception) {
            cert.free()
            throw e
        }
        return cert
    }
}

/**
 * Defines the optional parameters carried in the request for establishing a WebSocket connection.
 * @interface WebSocketRequestOptions
 * @syscap SystemCapability.Communication.NetStack
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public class WebSocketRequestOptions {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public WebSocketRequestOptions(
        /**
         * HTTP request header.
         * @type {?HashMap<String, String>}
         * @syscap SystemCapability.Communication.NetStack
         * @crossplatform
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public var header!: ?HashMap<String, String> = None,

        /**
         * File path for client cert.
         * @type {?String}
         * @syscap SystemCapability.Communication.NetStack
         * @crossplatform
         */
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public var caPath!: String = "/etc/ssl/certs/cacert.pem",

        /**
         * Client cert.
         * @type {?WebSocketClientCert}
         * @syscap SystemCapability.Communication.NetStack
         * @crossplatform
         */
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public var clientCert!: ?WebSocketClientCert = None,

        /**
         * HTTP proxy configuration. Use 'system' if this filed is not set.
         * @type {?ProxyConfiguration}
         * @syscap SystemCapability.Communication.NetStack
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public var proxy!: ProxyConfiguration = SYSTEM,

        /**
         * Self defined protocol.
         * @type {?String}
         * @syscap SystemCapability.Communication.NetStack
         * @since 12
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public var protocol!: String = ""
    ) {}
}

/**
 * The result for closing a WebSocket connection.
 * @interface CloseResult
 * @syscap SystemCapability.Communication.NetStack
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public class CloseResult {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public CloseResult(
        /**
         * Error code.
         * @type {UInt32}
         * @syscap SystemCapability.Communication.NetStack
         * @crossplatform
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let code: UInt32,

        /**
         * Error cause.
         * @type {String}
         * @syscap SystemCapability.Communication.NetStack
         * @crossplatform
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let reason: String
    ) {}
}

/**
 * Defines the optional parameters carried in the request for closing a WebSocket connection.
 * @interface WebSocketCloseOptions
 * @syscap SystemCapability.Communication.NetStack
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public class WebSocketCloseOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public WebSocketCloseOptions(
        /**
         * Error code.
         * @type {?UInt32}
         * @syscap SystemCapability.Communication.NetStack
         * @crossplatform
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let code!: UInt32 = 1000,

        /**
         * Error cause.
         * @type {?String}
         * @syscap SystemCapability.Communication.NetStack
         * @crossplatform
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let reason!: String = ""
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public open class WebSocketAsyncCallback<T> <: Callback2Argument<Option<AsyncError>, Option<T>> {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public WebSocketAsyncCallback(let f: (Option<AsyncError>, Option<T>) -> Unit) {}

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public open func invoke(arg1: Option<AsyncError>, arg2: Option<T>): Unit {
        f(arg1, arg2)
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public open class WebSocketErrorCallback <: Callback1Argument<BusinessException> {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public WebSocketErrorCallback(let f: (BusinessException) -> Unit) {}

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public open func invoke(arg1: BusinessException): Unit {
        f(arg1)
    }
}

open class Response {
    Response(
        var code: Int32,
        var `type`: OnOffType
    ) {}

    init() {
        this(0, OnOffType.OPEN)
    }

    init(v: CWebSocketCallbackData) {
        this(v.code, OnOffType.parse(v.typeId))
    }

    static func parseCResponseData<T>(data: CPointer<UInt8>, dataLen: Int32): T where T <: CType {
        let size = Int32(unsafe { sizeOf<T>() })
        if (size < dataLen) {
            throw Exception("Data length mismatch, ${size}:${dataLen}.")
        }
        unsafe { CPointer<T>(data).read() }
    }
}

class OpenResponse <: Response {
    OpenResponse(var value: HashMap<UInt32, String>) {}

    init(v: CWebSocketCallbackData) {
        super(v.code, OnOffType.parse(v.typeId))
        let data = Response.parseCResponseData<COpenResponse>(v.data, v.dataLen)
        unsafe {
            this.value = HashMap<UInt32, String>(1)
            value.add(data.status, data.message.toString())
        }
    }
}

class MessageResponse <: Response {
    MessageResponse(var value: MessageData) {}

    init(v: CWebSocketCallbackData) {
        super(v.code, OnOffType.parse(v.typeId))
        let data = Response.parseCResponseData<CMessageResponse>(v.data, v.dataLen)
        let resultType = MessageDataType.parse(data.resultType)
        unsafe {
            value = match (resultType) {
                case STRING => STRING_DATA(CString(data.result.head).toString())
                case ARRAY_BUFFER => ARRAY_DATA(cArr2cjArr<UInt8, UInt8>(data.result.size, data.result.head, {i => i}))
            }
        }
    }
}

class ErrorResponse <: Response {
    ErrorResponse(
        var errCode: Int32,
        var httpResponse: UInt32
    ) {}

    init(v: CWebSocketCallbackData) {
        super(v.code, OnOffType.parse(v.typeId))
        let data = Response.parseCResponseData<CErrorResponse>(v.data, v.dataLen)
        unsafe {
            errCode = data.code
            httpResponse = data.httpResponse
        }
    }
}

class CloseResponse <: Response {
    CloseResponse(var value: CloseResult) {}

    init(v: CWebSocketCallbackData) {
        super(v.code, OnOffType.parse(v.typeId))
        let data = Response.parseCResponseData<CCloseResponse>(v.data, v.dataLen)
        unsafe {
            value = CloseResult(data.code, data.reason.toString())
        }
    }
}

class HeaderReceiveResponse <: Response {
    HeaderReceiveResponse(var value: ResponseHeaders) {}

    init(v: CWebSocketCallbackData) {
        super(v.code, OnOffType.parse(v.typeId))
        let data = Response.parseCResponseData<CReceiveResponse>(v.data, v.dataLen)
        let headerType = ResponseHeadersType.parse(data.headerType)
        unsafe {
            value = match (headerType) {
                case MAP => MAP_DATA(cArrString2Map(data.header))
                case ARRAY_STRING => ARRAY_STRING_DATA(
                    cArr2cjArr<CString, String>(data.header.size, data.header.head, {cstr => cstr.toString()}))
                case _ => ResponseHeaders.UNDEFINED_DATA
            }
        }
    }
}
