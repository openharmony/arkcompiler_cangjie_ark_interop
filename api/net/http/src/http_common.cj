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

package ohos.net.http

import ohos.labels.*
import ohos.base.*
import ohos.ffi.*
import ohos.net.connection.{HttpProxy, CHttpProxy}
import std.collection.*

/**
 * Defines an HTTP request method.
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public enum RequestMethod {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    OPTIONS
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    GET
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    HEAD
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    POST
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    PUT
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    DELETE
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    TRACE
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    CONNECT
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func getValue(): String {
        match (this) {
            case OPTIONS => "OPTIONS"
            case GET => "GET"
            case HEAD => "HEAD"
            case POST => "POST"
            case PUT => "PUT"
            case DELETE => "DELETE"
            case TRACE => "TRACE"
            case CONNECT => "CONNECT"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates the response codes for an HTTP request.
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public enum ResponseCode {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    OK
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    CREATED
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    ACCEPTED
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NOT_AUTHORITATIVE
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NO_CONTENT
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    RESET
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    PARTIAL
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    MULT_CHOICE
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    MOVED_PERM
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    MOVED_TEMP
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    SEE_OTHER
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NOT_MODIFIED
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    USE_PROXY
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    BAD_REQUEST
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    UNAUTHORIZED
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    PAYMENT_REQUIRED
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    FORBIDDEN
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NOT_FOUND
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    BAD_METHOD
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NOT_ACCEPTABLE
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    PROXY_AUTH
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    CLIENT_TIMEOUT
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    CONFLICT
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    GONE
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    LENGTH_REQUIRED
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    PRECON_FAILED
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    ENTITY_TOO_LARGE
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    REQ_TOO_LONG
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    UNSUPPORTED_TYPE
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    REQUESTED_RANGE_NOT_SATISFIABLE
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    EXPECTATION_FAILED
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    TEAPOT
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    MISDIRECTED_REQUEST
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    UNPROCESSABLE_ENTITY
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    LOCKED
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    FAILED_DEPENDENCY
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    TOO_EARLY
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    UPGRADE_REQUIRED
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    PRECONDITION_REQUIRED
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    TOO_MANY_REQUESTS
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    REQUEST_HEADER_FIELDS_TOO_LARGE
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    UNAVAILABLE_FOR_LEGAL_REASONS
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    INTERNAL_ERROR
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NOT_IMPLEMENTED
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    BAD_GATEWAY
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    UNAVAILABLE
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    GATEWAY_TIMEOUT
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    VERSION
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    VARIANT_ALSO_NEGOTIATES
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    INSUFFICIENT_STORAGE
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    LOOP_DETECTED
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NOT_EXTENDED
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NETWORK_AUTHENTICATION_REQUIRED
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func getValue(): UInt32 {
        match (this) {
            case OK => 200
            case CREATED => 201
            case ACCEPTED => 202
            case NOT_AUTHORITATIVE => 203
            case NO_CONTENT => 204
            case RESET => 205
            case PARTIAL => 206
            case MULT_CHOICE => 300
            case MOVED_PERM => 301
            case MOVED_TEMP => 302
            case SEE_OTHER => 303
            case NOT_MODIFIED => 304
            case USE_PROXY => 305
            case BAD_REQUEST => 400
            case UNAUTHORIZED => 401
            case PAYMENT_REQUIRED => 402
            case FORBIDDEN => 403
            case NOT_FOUND => 404
            case BAD_METHOD => 405
            case NOT_ACCEPTABLE => 406
            case PROXY_AUTH => 407
            case CLIENT_TIMEOUT => 408
            case CONFLICT => 409
            case GONE => 410
            case LENGTH_REQUIRED => 411
            case PRECON_FAILED => 412
            case ENTITY_TOO_LARGE => 413
            case REQ_TOO_LONG => 414
            case UNSUPPORTED_TYPE => 415
            case REQUESTED_RANGE_NOT_SATISFIABLE => 416
            case EXPECTATION_FAILED => 417
            case TEAPOT => 418
            case MISDIRECTED_REQUEST => 421
            case UNPROCESSABLE_ENTITY => 422
            case LOCKED => 423
            case FAILED_DEPENDENCY => 424
            case TOO_EARLY => 425
            case UPGRADE_REQUIRED => 426
            case PRECONDITION_REQUIRED => 428
            case TOO_MANY_REQUESTS => 429
            case REQUEST_HEADER_FIELDS_TOO_LARGE => 431
            case UNAVAILABLE_FOR_LEGAL_REASONS => 451
            case INTERNAL_ERROR => 500
            case NOT_IMPLEMENTED => 501
            case BAD_GATEWAY => 502
            case UNAVAILABLE => 503
            case GATEWAY_TIMEOUT => 504
            case VERSION => 505
            case VARIANT_ALSO_NEGOTIATES => 506
            case INSUFFICIENT_STORAGE => 507
            case LOOP_DETECTED => 508
            case NOT_EXTENDED => 510
            case NETWORK_AUTHENTICATION_REQUIRED => 511
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public static func parse(code: UInt32): ResponseCode {
        match (code) {
            case 200 => OK
            case 201 => CREATED
            case 202 => ACCEPTED
            case 203 => NOT_AUTHORITATIVE
            case 204 => NO_CONTENT
            case 205 => RESET
            case 206 => PARTIAL
            case 300 => MULT_CHOICE
            case 301 => MOVED_PERM
            case 302 => MOVED_TEMP
            case 303 => SEE_OTHER
            case 304 => NOT_MODIFIED
            case 305 => USE_PROXY
            case 400 => BAD_REQUEST
            case 401 => UNAUTHORIZED
            case 402 => PAYMENT_REQUIRED
            case 403 => FORBIDDEN
            case 404 => NOT_FOUND
            case 405 => BAD_METHOD
            case 406 => NOT_ACCEPTABLE
            case 407 => PROXY_AUTH
            case 408 => CLIENT_TIMEOUT
            case 409 => CONFLICT
            case 410 => GONE
            case 411 => LENGTH_REQUIRED
            case 412 => PRECON_FAILED
            case 413 => ENTITY_TOO_LARGE
            case 414 => REQ_TOO_LONG
            case 415 => UNSUPPORTED_TYPE
            case 416 => REQUESTED_RANGE_NOT_SATISFIABLE
            case 417 => EXPECTATION_FAILED
            case 418 => TEAPOT
            case 421 => MISDIRECTED_REQUEST
            case 422 => UNPROCESSABLE_ENTITY
            case 423 => LOCKED
            case 424 => FAILED_DEPENDENCY
            case 425 => TOO_EARLY
            case 426 => UPGRADE_REQUIRED
            case 428 => PRECONDITION_REQUIRED
            case 429 => TOO_MANY_REQUESTS
            case 431 => REQUEST_HEADER_FIELDS_TOO_LARGE
            case 451 => UNAVAILABLE_FOR_LEGAL_REASONS
            case 500 => INTERNAL_ERROR
            case 501 => NOT_IMPLEMENTED
            case 502 => BAD_GATEWAY
            case 503 => UNAVAILABLE
            case 504 => GATEWAY_TIMEOUT
            case 505 => VERSION
            case 506 => VARIANT_ALSO_NEGOTIATES
            case 507 => INSUFFICIENT_STORAGE
            case 508 => LOOP_DETECTED
            case 510 => NOT_EXTENDED
            case 511 => NETWORK_AUTHENTICATION_REQUIRED
            case _ => throw IllegalArgumentException("Unknown code ${code}")
        }
    }
}

/**
 * Supported protocols.
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public enum HttpProtocol {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    HTTP1_1
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    HTTP2
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    HTTP3
    | ...

    func getValue(): Int32 {
        match (this) {
            case HTTP1_1 => 0
            case HTTP2 => 1
            case HTTP3 => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Indicates the type of the returned data.
 * 3 is not set
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public enum HttpDataType {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    STRING
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    ARRAY_BUFFER
    | ...

    func getValue(): Int32 {
        match (this) {
            case STRING => 0
            case ARRAY_BUFFER => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): HttpDataType {
        return if (val == 0) {
            STRING
        } else {
            ARRAY_BUFFER
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public enum HttpData <: ToString {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    STRING_DATA(String)
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    ARRAY_DATA(Array<Byte>)
    | ...

    func getData(): Array<UInt8> {
        match (this) {
            case STRING_DATA(str) => unsafe { str.rawData() }
            case ARRAY_DATA(arr) => arr
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    func getCData(): CArrUI8 {
        let data = getData()
        unsafe { CArrUI8(cjArr2CArr<UInt8, UInt8>(data, {i => i}), data.size) }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func toString(): String {
        match (this) {
            case STRING_DATA(str) => str
            case ARRAY_DATA(arr) => "${arr}"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public enum UsingProxy {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NOT_USE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    USE_DEFAULT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    USE_SPECIFIED(HttpProxy)
    | ...
}

@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public enum CertType {
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    PEM
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    DER
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    P12
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    func getValue(): String {
        match (this) {
            case PEM => "PEM"
            case DER => "DER"
            case P12 => "P12"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Specifies the type and value range of the optional parameters in the HTTP request.
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public class HttpRequestOptions {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public HttpRequestOptions(
        //default GET
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let method!: RequestMethod = RequestMethod.GET,

        //Additional data of the request.
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let extraData!: ?HttpData = None,

        // Data type to be returned. If this parameter is set, the system preferentially returns the specified type.
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let expectDataType!: ?HttpDataType = None,

        // default true
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let usingCache!: Bool = true,

        // default 1
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let priority!: UInt32 = 1,

        // default is 'content-type': 'application/json'
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let header!: ?HashMap<String, String> = None,

        // The default value is 60,000, in ms.
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let readTimeout!: UInt32 = 60000,

        // The default value is 60,000, in ms.
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let connectTimeout!: UInt32 = 60000,

        // default is automatically specified by the system.
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let usingProtocol!: ?HttpProtocol = None,

        // If this parameter is set as type of boolean, the system will use default proxy or not use proxy.
        // If this parameter is set as type of HttpProxy, the system will use the specified HttpProxy.
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let usingProxy!: UsingProxy = USE_DEFAULT,

        // If this parameter is set, the system will use ca path specified by user,
        // or else use preset ca by the system.
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let caPath!: ?String = None,

        // Used to set to uploading or downloading the start bytes. The default value is 0.
        // HTTP standard (RFC 7233 section 3.1) allows servers to ignore range requests.
        // For HTTP PUT uploads this option should not be used, since it may conflict with other options.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let resumeFrom!: ?Int64 = None,

        // Used to set to uploading or downloading the end bytes. Translate to the end if not set.
        // HTTP standard (RFC 7233 section 3.1) allows servers to ignore range requests.
        // For HTTP PUT uploads this option should not be used, since it may conflict with other options.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let resumeTo!: ?Int64 = None,

        // Support the application to pass in client certificates, allowing the server to verify the client's identity.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let clientCert!: ?ClientCert = None,

        // If this parameter is set, incoming DNS resolution server URL for the DoH server to use for name resolving.
        // The parameter must be URL-encoded in the following format: "https://host:port/path".
        // It MUST specify an HTTPS URL.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let dnsOverHttps!: ?String = None,

        // If this parameter is set, use the specified DNS server for DNS resolution.
        // Multiple DNS resolution servers can be set up, with a maximum of 3 servers.
        // Only take the first three if there are more than three.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let dnsServers!: ?Array<String> = None,

        // The maximum limit of the response body. The default value is 5 * 1024 * 1024, in Byte.
        // The maximum value is 100 * 1024 *1024, in Byte.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let maxLimit!: UInt32 = 5 * 1024 * 1024,

        // The data fields which is supported by the HTTP protocol to post
        // forms and by the SMTP and IMAP protocols to provide
        // the email data to send/upload.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let multiFormDataList!: ?Array<MultiFormData> = None
    ) {}
}

/**
 * Defines the response to an HTTP request.
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public class HttpResponse <: ToString {
    HttpResponse(
        // result can be a string (API 6) or an ArrayBuffer(API 8). Object is deprecated from API 8.
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let result: HttpData,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let resultType: HttpDataType,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let responseCode: ResponseCode,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let header: HashMap<String, String>,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let cookies: String,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let setCookie: Array<String>,

        //The time taken of various stages of HTTP request.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let performanceTiming: PerformanceTiming
    ) {}

    init(resp: CHttpResponse) {
        unsafe {
            this.responseCode = ResponseCode.parse(resp.responseCode)
            this.resultType = HttpDataType.parse(resp.resultType)
            this.result = match (resultType) {
                case STRING => STRING_DATA(CString(resp.result.head).toString())
                case ARRAY_BUFFER => ARRAY_DATA(cArr2cjArr<UInt8, UInt8>(resp.result.size, resp.result.head, {i => i}))
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
            this.header = cArrString2Map(resp.header)
            this.cookies = resp.cookies.toString()
            this.setCookie = cArr2cjArr<CString, String>(resp.setCookie.size, resp.setCookie.head,
                {cstr => cstr.toString()})
            this.performanceTiming = PerformanceTiming(resp.performanceTiming)
            resp.free()
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func toString(): String {
        "${responseCode.getValue()}\r\n${header}\r\n${cookies}\r\n${setCookie}\r\n${performanceTiming}"
    }
}

/**
 * Counting the time taken of various stages of HTTP request.
 */
@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public class PerformanceTiming <: ToString {
    PerformanceTiming(
        // Time taken from startup to DNS resolution completion, in milliseconds.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let dnsTiming: Float64,

        // Time taken from startup to TCP connection completion, in milliseconds.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let tcpTiming: Float64,

        // Time taken from startup to TLS connection completion, in milliseconds.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let tlsTiming: Float64,

        // Time taken from startup to start sending the first byte, in milliseconds.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let firstSendTiming: Float64,

        // Time taken from startup to receiving the first byte, in milliseconds.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let firstReceiveTiming: Float64,

        // Time taken from startup to the completion of the request, in milliseconds.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let totalFinishTiming: Float64,

        // Time taken from startup to completion of all redirection steps, in milliseconds.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let redirectTiming: Float64,

        // Time taken from HTTP request to header completion, in milliseconds.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let responseHeaderTiming: Float64,

        // Time taken from HTTP Request to body completion, in milliseconds.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let responseBodyTiming: Float64,

        // Time taken from HTTP Request to callback to the application, in milliseconds.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let totalTiming: Float64
    ) {}

    init(timing: CPerformanceTiming) {
        this.dnsTiming = timing.dnsTiming
        this.tcpTiming = timing.tcpTiming
        this.tlsTiming = timing.tlsTiming
        this.firstSendTiming = timing.firstSendTiming
        this.firstReceiveTiming = timing.firstReceiveTiming
        this.totalFinishTiming = timing.totalFinishTiming
        this.redirectTiming = timing.redirectTiming
        this.responseHeaderTiming = timing.responseHeaderTiming
        this.responseBodyTiming = timing.responseBodyTiming
        this.totalTiming = timing.totalTiming
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func toString(): String {
        let sb = StringBuilder()
        sb.append("dnsTiming=${dnsTiming}\r\n")
        sb.append("tcpTiming=${tcpTiming},\r\n")
        sb.append("tlsTiming=${tlsTiming},\r\n")
        sb.append("firstSendTiming=${firstSendTiming},\r\n")
        sb.append("firstReceiveTiming=${firstReceiveTiming},\r\n")
        sb.append("totalFinishTiming=${totalFinishTiming},\r\n")
        sb.append("redirectTiming=${redirectTiming},\r\n")
        sb.append("responseHeaderTiming=${responseHeaderTiming},\r\n")
        sb.append("responseBodyTiming=${responseBodyTiming},\r\n")
        sb.append("totalTiming=${totalTiming},\r\n")
        sb.toString()
    }
}

/**
 * This interface is used to obtain the progress information of file upload or download.
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public class DataReceiveProgressInfo {
    DataReceiveProgressInfo(
        // Number of data bytes received.
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let receiveSize: UInt32,

        // Total number of bytes to receive.
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let totalSize: UInt32
    ) {}

    init(info: CDataReceiveProgressInfo) {
        this.receiveSize = info.receiveSize
        this.totalSize = info.totalSize
    }
}

/**
 * This interface is used to monitor the progress of sending data.
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public class DataSendProgressInfo {
    DataSendProgressInfo(
        // Used to specify the data size to be sent.
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let sendSize: UInt32,

        // Total number of bytes to send.
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let totalSize: UInt32
    ) {}

    init(info: CDataSendProgressInfo) {
        this.sendSize = info.sendSize
        this.totalSize = info.totalSize
    }
}

/**
 * The clientCert field of the client certificate, which includes 4 attributes:
 * client certificate (cert), client certificate type (certType), certificate private key (key),
 * and passphrase (keyPassword).
 */
@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public class ClientCert {
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public ClientCert(
        // The path to the client certificate file.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let certPath: String,

        // The path of the client certificate private key file.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let keyPath: String,

        // The type of the client certificate.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let certType!: CertType = CertType.PEM,

        // Password required to use the client certificate private key.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let keyPassword!: ?String = None
    ) {}

    func toCClientCert(): CClientCert {
        var cert = CClientCert(CString(CPointer()), CString(CPointer()), CString(CPointer()), CString(CPointer()))
        try {
            unsafe {
                cert.certPath = LibC.mallocCString(certPath)
                cert.keyPath = LibC.mallocCString(keyPath)
                cert.certType = LibC.mallocCString(certType.getValue())
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
 * Represents the properties of a form object.
 */
@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public class MultiFormData {
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public MultiFormData(
        // MIME name for the data field.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let name: String,

        // Content type of the data field.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let contentType: String,

        // Remote file name for the data field.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let remoteFileName!: ?String = None,

        // This parameter sets a mime part's body content from memory data.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let data!: ?HttpData = None,

        // This parameter sets a mime part's body content from the file's contents.
        // This is an alternative to curl_mime_data for setting data to a mime part.
        // If data is empty, filePath must be set.
        // If data has a value, filePath does not take effect.
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetStack"
        ]
        public let filePath!: ?String = None
    ) {}
}

func cArrString2Map(cArrString: CArrString): HashMap<String, String> {
    if (cArrString.head.isNull() || cArrString.size == 0) {
        return HashMap<String, String>(0)
    }
    let size = cArrString.size
    let ptr = cArrString.head
    let map = HashMap<String, String>(size / 2)
    for (i in 0..size : 2) {
        unsafe {
            map.add(ptr.read(i).toString(), ptr.read(i + 1).toString())
        }
    }
    map
}

unsafe func map2CArrString(map: HashMap<String, String>): CArrString {
    if (map.isEmpty()) {
        return CArrString(CPointer<CString>(), 0)
    }
    let arrLen = map.size * 2
    var index = 0
    let ptr = safeMalloc<CString>(count: arrLen)
    try {
        for ((k, v) in map) {
            let key = LibC.mallocCString(k)
            ptr.write(index, key)
            index++
            let value = LibC.mallocCString(v)
            ptr.write(index, value)
            index++
        }
    } catch (e: Exception) {
        for (i in 0..index) {
            LibC.free(ptr.read(i))
        }
        LibC.free(ptr)
        throw e
    }
    CArrString(ptr, arrLen)
}
