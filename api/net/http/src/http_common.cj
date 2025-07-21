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
import ohos.ffi.*
import ohos.net.connection.HttpProxy
import std.collection.*

  /**
   * Defines an HTTP request method.
   * @relation export enum RequestMethod
   */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public enum RequestMethod {
    /**
     * OPTIONS method.
     * @relation OPTIONS = "OPTIONS"
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Options
    /**
     * GET method.
     * @relation GET = "GET"
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Get
    /**
     * HEAD method.
     * @relation HEAD = "HEAD"
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Head
    /**
     * POST method.
     * @relation POST = "POST"
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Post
    /**
     * PUT method.
     * @relation PUT = "PUT"
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Put
    /**
     * DELETE method.
     * @relation Delete = "Delete"
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Delete
    /**
     * TRACE method.
     * @relation TRACE = "TRACE"
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Trace
    /**
     * CONNECT method.
     * @relation CONNECT = "CONNECT"
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Connect
    | ...

    /**
     * get the RequestMethod
     */
    @!APILevel[
        21,
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
 * @relation export enum ResponseCode 
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public enum ResponseCode {
    /**
     * The request was successful. Typically used for GET and POST requests.
     * @relation OK = 200
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Ok
    /**
     * Successfully requested and created a new resource.
     * @relation CREATED
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Created
    /**
     * The request has been accepted but has not been processed completely.
     * @relation ACCEPTED
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Accepted
    /**
     * Unauthorized information. The request was successful.
     * @relation NOT_AUTHORITATIVE
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NotAuthoritative
    /**
     * No content. The server successfully processed, but did not return content.
     * @relation NO_CONTENT
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NoContent
    /**
     * Reset the content.
     * @relation RESET
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Reset
    /**
     * Partial content. The server successfully processed some GET requests.
     * @relation PARTIAL
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Partial
    /**
     * Multiple options.
     * @relation MULT_CHOICE
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    MultChoice
    /**
     * Permanently move. The requested resource has been permanently moved to a new URI,
     * and the returned information will include the new URI. The browser will automatically redirect to the new URI.
     * @relation MOVED_PERM
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    MovedPerm
    /**
     * Temporary movement.
     * @relation MOVED_TEMP
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    MovedTemp
    /**
     * View other addresses.
     * @relation SEE_OTHER
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    SeeOther
    /**
     * Not modified.
     * @relation NOT_MODIFIED
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NotModified
    /**
     * Using proxies.
     * @relation USE_PROXY
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    UseProxy
    /**
     * The server cannot understand the syntax error error requested by the client.
     * @relation BAD_REQUEST
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    BadRequest
    /**
     * Request for user authentication.
     * @relation UNAUTHORIZED
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Unauthorized
    /**
     * Reserved for future use.
     * @relation PAYMENT_REQUIRED
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    PaymentRequired
    /**
     * The server understands the request from the requesting client, but refuses to execute it.
     * @relation FORBIDDEN
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Forbidden
    /**
     * The server was unable to find resources (web pages) based on the client's request.
     * @relation NOT_FOUND
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NotFound
    /**
     * The method in the client request is prohibited.
     * @relation BAD_METHOD
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    BadMethod
    /**
     * The server is unable to complete the request based on the content characteristics requested by the client.
     * @relation NOT_ACCEPTABLE
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NotAcceptable
    /**
     * Request authentication of the proxy's identity.
     * @relation PROXY_AUTH
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    ProxyAuth
    /**
     * The request took too long and timed out.
     * @relation CLIENT_TIMEOUT
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    ClientTimeout
    /**
     * he server may have returned this code when completing the client's PUT request,
     * as there was a conflict when the server was processing the request.
     * @relation CONFLICT
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Conflict
    /**
     * The resource requested by the client no longer exists.
     * @relation GONE
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Gone
    /**
     * The server is unable to process request information sent by the client without Content Length.
     * @relation LENGTH_REQUIRED
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    LengthRequired
    /**
     * The prerequisite for requesting information from the client is incorrect.
     * @relation PRECON_FAILED
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    PreconFailed
    /**
     * The request was rejected because the requested entity was too large for the server to process.
     * @relation ENTITY_TOO_LARGE
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    EntityTooLarge
    /**
     * The requested URI is too long (usually a URL) and the server cannot process it.
     * @relation REQ_TOO_LONG
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    ReqTooLong
    /**
     * The server is unable to process the requested format.
     * @relation UNSUPPORTED_TYPE
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    UnsupportedType
    /**
     * The server cannot process the requested data range.
     * @relation RANGE_NOT_SATISFIABLE
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    RequestedRangeNotSatisfiable
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    ExpectationFailed
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Teapot
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    MisdirectedRequest
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    UnprocessableEntity
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Locked
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    FailedDependency
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    TooEarly
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    UpgradeRequired
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    PreconditionRequired
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    TooManyRequests
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    RequestHeaderFieldsTooLarge
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    UnavailableForLegalReasons
    /**
     * Internal server error, unable to complete the request.
     * @relation INTERNAL_ERROR
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    InternalError
    /**
     * @relation The server does not support the requested functionality and cannot complete the request.
     * @relation NOT_IMPLEMENTED
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NotImplemented
    /**
     * The server acting as a gateway or proxy received an invalid request from the remote server.
     * @relation BAD_GATEWAY
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    BadGateway
    /**
     * Due to overload or system maintenance, the server is temporarily unable to process client requests.
     * @relation UNAVAILABLE
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Unavailable
    /**
     * The server acting as a gateway or proxy did not obtain requests from the remote server in a timely manner.
     * @relation GATEWAY_TIMEOUT
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    GatewayTimeout
    /**
     * The version of the HTTP protocol requested by the server.
     * @relation VERSION
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Version
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    VariantAlsoNegotiates
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    InsufficientStorage
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    LoopDetected
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NotExtended
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NetworkAuthenticationRequired
    | ...

    /**
     * get the response code
     */
    @!APILevel[
        21,
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

    /**
     * parse the response code
     */
    @!APILevel[
        21,
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
  * @relation export enum HttpProtocol
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public enum HttpProtocol {
    /**
    * Protocol http1.1
    * @relation HTTP1_1
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Http1_1
    /**
     * Protocol http2
     * @relation HTTP2
    */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Http2
    /**
     * Protocol http3 for https only.
     * @relation HTTP3
    */
    | @!APILevel[
        21,
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
  * @relation export enum HttpDataType
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public enum HttpDataType {
    /**
     * The returned type is string.
     * @relation STRING
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    StringValue
    /**
     * The returned type is ArrayBuffer.
     * @relation ARRAY_BUFFER
    */
    | @!APILevel[
        21,
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

/**
  * Indicates the type of the returned data.
  * @relation export enum HttpDataType
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public enum HttpData <: ToString {
    /**
     * The returned type is string.
     * @relation STRING
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    StringData(String)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    /**
     * The returned type is ArrayBuffer.
     * @relation ARRAY_BUFFER
    */
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
        21,
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
 * Enum for proxy using
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public enum UsingProxy {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    NotUse
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    UseDefault
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    UseSpecified(HttpProxy)
    | ...
}
/**
 * Enum for certificate types
 * @relation export enum CertType
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public enum CertType {
    /**
     * PEM format certificate
     * @relation PEM
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Pem
    /**
     * DER format certificate
     * @relation DER
    */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    Der
    /**
     * P12 format certificate
     * @relation P12
    */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    P12
    | ...

    @!APILevel[
        21,
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
 * @relation export interface HttpRequestOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public class HttpRequestOptions {
    /**
     * Request method,default is GET.
     * @relation method?: RequestMethod
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var method: RequestMethod = RequestMethod.Get

    /**
     * Additional data of the request.
     * extraData can be a string or an Object (API 6) or an ArrayBuffer(API 8).
     * @relation extraData?: string | Object | ArrayBuffer
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var extraData: ?HttpData = None

    /**
     * Data type to be returned. If this parameter is set, the system preferentially returns the specified type.
     * @relation expectDataType?: HttpDataType
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var expectDataType: ?HttpDataType = None

    /**
     * default is true
     * @relation usingCache?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var usingCache: Bool = true

    /**
     * [1, 1000], default is 1.
     * @relation priority?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var priority: UInt32 = 1

    /**
     * HTTP request header. default is 'content-type': 'application/json'
     * @relation header?: Object
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var header: ?HashMap<String, String> = None

    /**
     * Read timeout period. The default value is 60,000, in ms.
     * @relation readTimeout?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var readTimeout: UInt32 = 60000

    /**
     * Connection timeout interval. The default value is 60,000, in ms.
     * @relation connectTimeout?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var connectTimeout: UInt32 = 60000

    /**
     * default is automatically specified by the system.
     * @relation usingProtocol?: HttpProtocol
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var usingProtocol: ?HttpProtocol = None

    /**
     * If this parameter is set as type of boolean, the system will use default proxy or not use proxy.
     * If this parameter is set as type of HttpProxy, the system will use the specified HttpProxy.
     * @relation usingProxy?: boolean | HttpProxy
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var usingProxy: UsingProxy = UseDefault

    /**
     * If this parameter is set, the system will use ca path specified by user, or else use preset ca by the system.
     * @relation caPath?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var caPath: ?String = None

    /**
     * Used to set to uploading or downloading the start bytes. The default value is 0.
     * HTTP standard (RFC 7233 section 3.1) allows servers to ignore range requests.
     * For HTTP PUT uploads this option should not be used, since it may conflict with other options.
     * @relation resumeFrom?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var resumeFrom: ?Int64 = None

    /**
     * Used to set to uploading or downloading the end bytes. Translate to the end if not set.
     * HTTP standard (RFC 7233 section 3.1) allows servers to ignore range requests.
     * For HTTP PUT uploads this option should not be used, since it may conflict with other options.
     * @relation resumeTo?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var resumeTo: ?Int64 = None

    /**
     * Support the application to pass in client certificates, allowing the server to verify the client's identity.
     * @relation clientCert?: ClientCert
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var clientCert: ?ClientCert = None

    /**
     * If this parameter is set, incoming DNS resolution server URL for the DoH server to use for name resolving.
     * The parameter must be URL-encoded in the following format: "https://host:port/path".
     * It MUST specify an HTTPS URL.
     * @relation dnsOverHttps?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var dnsOverHttps: ?String = None

    /**
     * If this parameter is set, use the specified DNS server for DNS resolution.
     * Multiple DNS resolution servers can be set up, with a maximum of 3 servers.
     * Only take the first three if there are more than three.
     * @relation dnsServers?: Array<string>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var dnsServers: ?Array<String> = None

    /**
     * The maximum limit of the response body. The default value is 5 * 1024 * 1024, in Byte.
     * The maximum value is 100 * 1024 *1024, in Byte.
     * @relation maxLimit?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var maxLimit: UInt32 = 5 * 1024 * 1024

    /**
     * The data fields which is supported by the HTTP protocol to post
     * forms and by the SMTP and IMAP protocols to provide
     * the email data to send/upload.
     * @relation multiFormDataList?: Array<MultiFormData>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var multiFormDataList: ?Array<MultiFormData> = None

    /**
     * init the HttpRequestOptions
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public init(method: RequestMethod, usingCache: Bool, priority: UInt32, readTimeout: UInt32, connectTimeout: UInt32,
        maxLimit: UInt32, usingProxy: UsingProxy, extraData!: ?HttpData = None, expectDataType!: ?HttpDataType = None,
        header!: ?HashMap<String, String> = None, usingProtocol!: ?HttpProtocol = None, caPath!: ?String = None,
        resumeFrom!: ?Int64 = None, resumeTo!: ?Int64 = None, clientCert!: ?ClientCert = None, dnsOverHttps!: ?String = None,
        dnsServers!: ?Array<String> = None, multiFormDataList!: ?Array<MultiFormData> = None) {
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
 * @relation export interface HttpResponse 
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public class HttpResponse <: ToString {
    /**
     * result can be a string (API 6) or an ArrayBuffer(API 8). Object is deprecated from API 8.
     * @relation result: string | Object | ArrayBuffer
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var result: HttpData
    /**
     * If the resultType is string, you can get result directly.
     * If the resultType is Object, you can get result such as this: result['key'].
     * If the resultType is ArrayBuffer, you can use ArrayBuffer to create the binary objects.
     * @relation resultType: HttpDataType
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var resultType: HttpDataType
    /**
     * Server status code.
     * @relation responseCode: ResponseCode | number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var responseCode: ResponseCode
    /**
     * All headers in the response from the server.
     * @relation header: Object
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var header: HashMap<String, String>
    /**
     * Cookies returned by the server.
     * @relation cookies: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var cookies: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var setCookie: Array<String>

    /**
     * The time taken of various stages of HTTP request.
     * @relation performanceTiming: PerformanceTiming
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var performanceTiming: PerformanceTiming

    /**
     * init the HttpResponse
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
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
                case StringValue => StringData(CString(resp.result.head).toString())
                case ArrayBuffer => ArrayData(cArr2cjArr<UInt8, UInt8>(resp.result.size, resp.result.head, {i => i}))
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
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func toString(): String {
        "${responseCode.getValue()}\r\n${header}\r\n${cookies}\r\n${setCookie}\r\n${performanceTiming}"
    }
}

/**
 * Counting the time taken of various stages of HTTP request.
 * @relation Counting the time taken of various stages of HTTP request.
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public class PerformanceTiming <: ToString {
    /**
     * Time taken from startup to DNS resolution completion, in milliseconds.
     * @relation dnsTiming: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var dnsTiming: Float64

    /**
     * Time taken from startup to TCP connection completion, in milliseconds.
     * @relation tcpTiming: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var tcpTiming: Float64

    /**
     * Time taken from startup to TLS connection completion, in milliseconds.
     * @relation tlsTiming: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var tlsTiming: Float64

    /**
     * Time taken from startup to start sending the first byte, in milliseconds.
     * @relation firstSendTiming: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var firstSendTiming: Float64

    /**
     * Time taken from startup to receiving the first byte, in milliseconds.
     * @relation firstReceiveTiming: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var firstReceiveTiming: Float64

    /**
     * Time taken from startup to the completion of the request, in milliseconds.
     * @relation totalFinishTiming: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var totalFinishTiming: Float64

    /**
     * Time taken from startup to completion of all redirection steps, in milliseconds.
     * @relation redirectTiming: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var redirectTiming: Float64

    /**
     * Time taken from HTTP request to header completion, in milliseconds.
     * @relation responseHeaderTiming: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var responseHeaderTiming: Float64

    /**
     * Time taken from HTTP Request to body completion, in milliseconds.
     * @relation responseBodyTiming: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var responseBodyTiming: Float64

    /**
     * Time taken from HTTP Request to callback to the application, in milliseconds.
     * @relation totalTiming: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var totalTiming: Float64

    /**
     * init PerformanceTiming
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
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
        21,
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
 * @relation export interface DataReceiveProgressInfo
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public class DataReceiveProgressInfo {
    /**
     * Number of data bytes received.
     * @relation receiveSize: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var receiveSize: UInt32

    /**
     * Total number of bytes to receive.
     * @relation totalSize: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var totalSize: UInt32

    /**
     * init the DataReceiveProgressInfo
    */
    @!APILevel[
        21,
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
 * @relation export interface DataSendProgressInfo
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public class DataSendProgressInfo {
    /**
     * Used to specify the data size to be sent.
     * @relation sendSize: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var sendSize: UInt32

    /**
     * Total number of bytes to receive.
     * @relation totalSize: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var totalSize: UInt32
    /**
     * init the DataSendProgressInfo
    */
    @!APILevel[
        21,
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
 * client certificate (cert), client certificate type (certType), certificate private key (key), and passphrase (keyPassword).
 * @relation export interface ClientCert
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public class ClientCert {
    /**
     * The path to the client certificate file.
     * @relation certPath: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var certPath: String

    /**
     * The path of the client certificate private key file.
     * @relation keyPath: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var keyPath: String

    /**
     * The type of the client certificate.
     * @relation certType?: CertType
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var certType: CertType = CertType.Pem

    /**
     * Password required to use the client certificate private key.
     * @relation keyPassword?: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var keyPassword: ?String = None

    /**
     * init the ClientCert
    */
    @!APILevel[
        21,
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
 * @relation export interface MultiFormData
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public class MultiFormData {
    /**
     * MIME name for the data field.
     * @relation name: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var name: String

    /**
     * Content type of the data field.
     * @relation contentType: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var contentType: String

    /**
     * Remote file name for the data field.
     * @relation remoteFileName?: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var remoteFileName: ?String = None

    /**
     * This parameter sets a mime part's body content from memory data.
     * @relation data?: string | Object | ArrayBuffer
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var data: ?HttpData = None

    /**
     * This parameter sets a mime part's body content from the file's contents.
     * This is an alternative to curl_mime_data for setting data to a mime part.
     * If data is empty, filePath must be set.
     * If data has a value, filePath does not take effect.
     * @relation filePath?: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public var filePath: ?String = None
    /**
     * init the MultiFormData
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public init(name: String, contentType: String,  remoteFileName!: ?String = None,
        data!: ?HttpData = None, filePath!: ?String = None) {
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
