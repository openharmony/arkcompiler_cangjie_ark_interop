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
    Options
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Get
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Head
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Post
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Put
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Delete
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Trace
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Connect
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func getValue(): String {
        match (this) {
            case Options => "OPTIONS"
            case Get => "GET"
            case Head => "HEAD"
            case Post => "POST"
            case Put => "PUT"
            case Delete => "DELETE"
            case Trace => "TRACE"
            case Connect => "CONNECT"
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
    Ok
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Created
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Accepted
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NotAuthoritative
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NoContent
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Reset
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Partial
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    MultChoice
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    MovedPerm
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    MovedTemp
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    SeeOther
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NotModified
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    UseProxy
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    BadRequest
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Unauthorized
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    PaymentRequired
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Forbidden
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NotFound
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    BadMethod
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NotAcceptable
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    ProxyAuth
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    ClientTimeout
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Conflict
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Gone
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    LengthRequired
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    PreconFailed
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    EntityTooLarge
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    ReqTooLong
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    UnsupportedType
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    RequestedRangeNotSatisfiable
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    ExpectationFailed
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Teapot
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    MisdirectedRequest
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    UnprocessableEntity
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Locked
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    FailedDependency
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    TooEarly
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    UpgradeRequired
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    PreconditionRequired
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    TooManyRequests
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    RequestHeaderFieldsTooLarge
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    UnavailableForLegalReasons
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    InternalError
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NotImplemented
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    BadGateway
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Unavailable
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    GatewayTimeout
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Version
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    VariantAlsoNegotiates
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    InsufficientStorage
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    LoopDetected
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NotExtended
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NetworkAuthenticationRequired
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func getValue(): UInt32 {
        match (this) {
            case Ok => 200
            case Created => 201
            case Accepted => 202
            case NotAuthoritative => 203
            case NoContent => 204
            case Reset => 205
            case Partial => 206
            case MultChoice => 300
            case MovedPerm => 301
            case MovedTemp => 302
            case SeeOther => 303
            case NotModified => 304
            case UseProxy => 305
            case BadRequest => 400
            case Unauthorized => 401
            case PaymentRequired => 402
            case Forbidden => 403
            case NotFound => 404
            case BadMethod => 405
            case NotAcceptable => 406
            case ProxyAuth => 407
            case ClientTimeout => 408
            case Conflict => 409
            case Gone => 410
            case LengthRequired => 411
            case PreconFailed => 412
            case EntityTooLarge => 413
            case ReqTooLong => 414
            case UnsupportedType => 415
            case RequestedRangeNotSatisfiable => 416
            case ExpectationFailed => 417
            case Teapot => 418
            case MisdirectedRequest => 421
            case UnprocessableEntity => 422
            case Locked => 423
            case FailedDependency => 424
            case TooEarly => 425
            case UpgradeRequired => 426
            case PreconditionRequired => 428
            case TooManyRequests => 429
            case RequestHeaderFieldsTooLarge => 431
            case UnavailableForLegalReasons => 451
            case InternalError => 500
            case NotImplemented => 501
            case BadGateway => 502
            case Unavailable => 503
            case GatewayTimeout => 504
            case Version => 505
            case VariantAlsoNegotiates => 506
            case InsufficientStorage => 507
            case LoopDetected => 508
            case NotExtended => 510
            case NetworkAuthenticationRequired => 511
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
            case 200 => Ok
            case 201 => Created
            case 202 => Accepted
            case 203 => NotAuthoritative
            case 204 => NoContent
            case 205 => Reset
            case 206 => Partial
            case 300 => MultChoice
            case 301 => MovedPerm
            case 302 => MovedTemp
            case 303 => SeeOther
            case 304 => NotModified
            case 305 => UseProxy
            case 400 => BadRequest
            case 401 => Unauthorized
            case 402 => PaymentRequired
            case 403 => Forbidden
            case 404 => NotFound
            case 405 => BadMethod
            case 406 => NotAcceptable
            case 407 => ProxyAuth
            case 408 => ClientTimeout
            case 409 => Conflict
            case 410 => Gone
            case 411 => LengthRequired
            case 412 => PreconFailed
            case 413 => EntityTooLarge
            case 414 => ReqTooLong
            case 415 => UnsupportedType
            case 416 => RequestedRangeNotSatisfiable
            case 417 => ExpectationFailed
            case 418 => Teapot
            case 421 => MisdirectedRequest
            case 422 => UnprocessableEntity
            case 423 => Locked
            case 424 => FailedDependency
            case 425 => TooEarly
            case 426 => UpgradeRequired
            case 428 => PreconditionRequired
            case 429 => TooManyRequests
            case 431 => RequestHeaderFieldsTooLarge
            case 451 => UnavailableForLegalReasons
            case 500 => InternalError
            case 501 => NotImplemented
            case 502 => BadGateway
            case 503 => Unavailable
            case 504 => GatewayTimeout
            case 505 => Version
            case 506 => VariantAlsoNegotiates
            case 507 => InsufficientStorage
            case 508 => LoopDetected
            case 510 => NotExtended
            case 511 => NetworkAuthenticationRequired
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
    Http1_1
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Http2
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Http3
    | ...

    func getValue(): Int32 {
        match (this) {
            case Http1_1 => 0
            case Http2 => 1
            case Http3 => 2
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
    StringValue
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    ArrayBuffer
    | ...

    func getValue(): Int32 {
        match (this) {
            case StringValue => 0
            case ArrayBuffer => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): HttpDataType {
        return if (val == 0) {
            StringValue
        } else {
            ArrayBuffer
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
    StringData(String)
    | @!APILevel[
        12,
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
        12,
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
    NotUse
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    UseDefault
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    UseSpecified(HttpProxy)
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
    Pem
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Der
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
            case Pem => "PEM"
            case Der => "DER"
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
    public var method: RequestMethod = RequestMethod.Get

    //Additional data of the request.
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var extraData: ?HttpData = None

    // Data type to be returned. If this parameter is set, the system preferentially returns the specified type.
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var expectDataType: ?HttpDataType = None

    // default true
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var usingCache: Bool = true

    // default 1
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var priority: UInt32 = 1

    // default is 'content-type': 'application/json'
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var header: ?HashMap<String, String> = None

    // The default value is 60,000, in ms.
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var readTimeout: UInt32 = 60000

    // The default value is 60,000, in ms.
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var connectTimeout: UInt32 = 60000

    // default is automatically specified by the system.
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var usingProtocol: ?HttpProtocol = None

    // If this parameter is set as type of boolean, the system will use default proxy or not use proxy.
    // If this parameter is set as type of HttpProxy, the system will use the specified HttpProxy.
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var usingProxy: UsingProxy = UseDefault

    // If this parameter is set, the system will use ca path specified by user,
    // or else use preset ca by the system.
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var caPath: ?String = None

    // Used to set to uploading or downloading the start bytes. The default value is 0.
    // HTTP standard (RFC 7233 section 3.1) allows servers to ignore range requests.
    // For HTTP PUT uploads this option should not be used, since it may conflict with other options.
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var resumeFrom: ?Int64 = None

    // Used to set to uploading or downloading the end bytes. Translate to the end if not set.
    // HTTP standard (RFC 7233 section 3.1) allows servers to ignore range requests.
    // For HTTP PUT uploads this option should not be used, since it may conflict with other options.
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var resumeTo: ?Int64 = None

    // Support the application to pass in client certificates, allowing the server to verify the client's identity.
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var clientCert: ?ClientCert = None

    // If this parameter is set, incoming DNS resolution server URL for the DoH server to use for name resolving.
    // The parameter must be URL-encoded in the following format: "https://host:port/path".
    // It MUST specify an HTTPS URL.
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var dnsOverHttps: ?String = None

    // If this parameter is set, use the specified DNS server for DNS resolution.
    // Multiple DNS resolution servers can be set up, with a maximum of 3 servers.
    // Only take the first three if there are more than three.
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var dnsServers: ?Array<String> = None

    // The maximum limit of the response body. The default value is 5 * 1024 * 1024, in Byte.
    // The maximum value is 100 * 1024 *1024, in Byte.
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var maxLimit: UInt32 = 5 * 1024 * 1024

    // The data fields which is supported by the HTTP protocol to post
    // forms and by the SMTP and IMAP protocols to provide
    // the email data to send/upload.
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var multiFormDataList: ?Array<MultiFormData> = None

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public init(method: RequestMethod, extraData!: ?HttpData = None, expectDataType!: ?HttpDataType = None,
        usingCache: Bool = true, priority: UInt32, header!: ?HashMap<String, String> = None, readTimeout: UInt32,
        connectTimeout: UInt32, usingProtocol!: ?HttpProtocol = None, usingProxy: UsingProxy, caPath!: ?String = None,
        resumeFrom!: ?Int64 = None, resumeTo!: ?Int64 = None, clientCert!: ?ClientCert = None,
        dnsOverHttps!: ?String = None, dnsServers!: ?Array<String> = None, maxLimit: UInt32
        multiFormDataList!: ?Array<MultiFormData> = None) {
        this.method = method
        this.extraData = extraData
        this.expectDataType = expectDataType
        this.usingCache = usingCache
        this.priority = priority
        this.header = header
        this.readTimeout = readTimeout
        this.connectTimeout = connectTimeout
        this.usingProtocol = usingProtocol
        this.usingProxy = usingProxy
        this.caPath = caPath
        this.resumeFrom = resumeFrom
        this.resumeTo = resumeTo
        this.clientCert = clientCert
        this.dnsOverHttps = dnsOverHttps
        this.dnsServers = dnsServers
        this.maxLimit = maxLimit
        this.multiFormDataList = multiFormDataList
    }
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
    // result can be a string (API 6) or an ArrayBuffer(API 8). Object is deprecated from API 8.
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var result: HttpData
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var resultType: HttpDataType
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var responseCode: ResponseCode
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var header: HashMap<String, String>
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var cookies: String
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var setCookie: Array<String>

    //The time taken of various stages of HTTP request.
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var performanceTiming: PerformanceTiming

    public init(result: HttpData, resultType: HttpDataType, responseCode: ResponseCode,
        header: HashMap<String, String>, cookies: String, setCookie: Array<String>,
        performanceTiming: PerformanceTiming) {
        this.result = result
        this.resultType = resultType
        this.responseCode = responseCode
        this.header = header
        this.cookies = cookies
        this.setCookie = setCookie
        this.performanceTiming = performanceTiming
    }

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
    // Time taken from startup to DNS resolution completion, in milliseconds.
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var dnsTiming: Float64

    // Time taken from startup to TCP connection completion, in milliseconds.
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var tcpTiming: Float64

    // Time taken from startup to TLS connection completion, in milliseconds.
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var tlsTiming: Float64

    // Time taken from startup to start sending the first byte, in milliseconds.
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var firstSendTiming: Float64

    // Time taken from startup to receiving the first byte, in milliseconds.
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var firstReceiveTiming: Float64

    // Time taken from startup to the completion of the request, in milliseconds.
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var totalFinishTiming: Float64

    // Time taken from startup to completion of all redirection steps, in milliseconds.
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var redirectTiming: Float64

    // Time taken from HTTP request to header completion, in milliseconds.
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var responseHeaderTiming: Float64

    // Time taken from HTTP Request to body completion, in milliseconds.
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var responseBodyTiming: Float64

    // Time taken from HTTP Request to callback to the application, in milliseconds.
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var totalTiming: Float64

    public init(dnsTiming: Float64, tcpTiming: Float64, tlsTiming: Float64,
        firstSendTiming: Float64, firstReceiveTiming: Float64, totalFinishTiming: Float64,
        redirectTiming: Float64, responseHeaderTiming: Float64, responseBodyTiming: Float64,
        totalTiming: Float64) {
        this.dnsTiming = dnsTiming
        this.tcpTiming = tcpTiming
        this.tlsTiming = tlsTiming
        this.firstSendTiming = firstSendTiming
        this.firstReceiveTiming = firstReceiveTiming
        this.totalFinishTiming = totalFinishTiming
        this.redirectTiming = redirectTiming
        this.responseHeaderTiming = responseHeaderTiming
        this.responseBodyTiming = responseBodyTiming
        this.totalTiming = totalTiming
    }

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
    // Number of data bytes received.
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var receiveSize: UInt32

    // Total number of bytes to receive.
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var totalSize: UInt32

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public init(receiveSize: UInt32, totalSize: UInt32) {
        this.receiveSize = receiveSize
        this.totalSize = totalSize
    }

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
    // Used to specify the data size to be sent.
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var sendSize: UInt32

    // Total number of bytes to send.
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var totalSize: UInt32

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public init(sendSize: UInt32, totalSize: UInt32) {
        this.sendSize = sendSize
        this.totalSize = totalSize
    }

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
    // The path to the client certificate file.
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var certPath: String

    // The path of the client certificate private key file.
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var keyPath: String

    // The type of the client certificate.
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var certType: CertType = CertType.Pem

    // Password required to use the client certificate private key.
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var keyPassword: ?String = None

    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public init(certPath: String, keyPath: String, certType: CertType, keyPassword!: ?String = None) {
        this.certPath = certPath
        this.keyPath = keyPath
        this.certType = certType
        this.keyPassword = keyPassword
    }

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
    // MIME name for the data field.
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var name: String

    // Content type of the data field.
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var contentType: String

    // Remote file name for the data field.
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var remoteFileName: ?String = None

    // This parameter sets a mime part's body content from memory data.
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var data: ?HttpData = None

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
    public var filePath: ?String = None

    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public init(name: String, contentType: String,  remoteFileName!: ?String = None,
        data: ?HttpData = None, filePath!: ?String = None) {
        this.name = name
        this.contentType = contentType
        this.remoteFileName = remoteFileName
        this.data = data
        this.filePath = filePath
    }
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
