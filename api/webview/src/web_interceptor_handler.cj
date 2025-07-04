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

package ohos.webview

import ohos.labels.*
import ohos.ffi.*
import ohos.base.*
import std.deriving.*
import std.collection.*
import ohos.web.net_error_list.*

@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum WebResourceType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    MAIN_FRAME
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    SUB_FRAME
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    STYLE_SHEET
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    SCRIPT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    IMAGE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    FONT_RESOURCE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    SUB_RESOURCE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    OBJECT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    MEDIA
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    WORKER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    SHARED_WORKER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    PREFETCH
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    FAVICON
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    XHR
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    PING
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    SERVICE_WORKER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    CSP_REPORT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    PLUGIN_RESOURCE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    NAVIGATION_PRELOAD_MAIN_FRAME
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    NAVIGATION_PRELOAD_SUB_FRAME
    | ...

    static func fromInt32(code: Int32): WebResourceType {
        match (code) {
            case 0 => MAIN_FRAME
            case 1 => SUB_FRAME
            case 2 => STYLE_SHEET
            case 3 => SCRIPT
            case 4 => IMAGE
            case 5 => FONT_RESOURCE
            case 6 => SUB_RESOURCE
            case 7 => OBJECT
            case 8 => MEDIA
            case 9 => WORKER
            case 10 => SHARED_WORKER
            case 11 => PREFETCH
            case 12 => FAVICON
            case 13 => XHR
            case 14 => PING
            case 15 => SERVICE_WORKER
            case 16 => CSP_REPORT
            case 17 => PLUGIN_RESOURCE
            case 19 => NAVIGATION_PRELOAD_MAIN_FRAME
            case 20 => NAVIGATION_PRELOAD_SUB_FRAME
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class WebSchemeHandler <: RemoteDataLite {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init() {
        super(unsafe { FfiWebSchemeHandlerConstructor() })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Callback for handling the request.
     * @param { (WebSchemeHandlerRequest, WebResourceHandler) -> Bool } callback
     *          Callback of handling the request. If callback return false, it means no interception.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief onRequestStart(callback: (request: WebSchemeHandlerRequest,
     *                                  handler: WebResourceHandler) => boolean): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func onRequestStart(callback: (WebSchemeHandlerRequest, WebResourceHandler) -> Bool): Unit {
        WEBVIEW_LOG.info("WebSchemeHandler onRequestStart begin.")
        let wrapper = {
            WebSchemeHandlerRequestId: Int64, WebResourceHandlerId: Int64 =>
            let webResourceHandler = WebResourceHandler(WebResourceHandlerId)
            let webSchemeHandlerRequest = WebSchemeHandlerRequest(WebSchemeHandlerRequestId)
            callback(webSchemeHandlerRequest, webResourceHandler)
        }
        let beforeCall = Callback2Param<Int64, Int64, Bool>(wrapper)
        unsafe { FfiWebSchemeHandlerOnRequestStart(getID(), beforeCall.getID()) }
    }

    /**
     * Callback when the request is completed.
     * @param { (WebSchemeHandlerRequest) -> Unit } callback - Callback of request is completed.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief onRequestStop(callback: Callback<WebSchemeHandlerRequest>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func onRequestStop(callback: (WebSchemeHandlerRequest) -> Unit): Unit {
        let wrapper = {
            WebSchemeHandlerRequestId: Int64 =>
            let webSchemeHandlerRequest = WebSchemeHandlerRequest(WebSchemeHandlerRequestId)
            callback(webSchemeHandlerRequest)
        }
        let beforeCall = Callback1Param<Int64, Unit>(wrapper)
        unsafe { FfiWebSchemeHandlerOnRequestStop(getID(), beforeCall.getID()) }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class WebSchemeHandlerRequest <: RemoteDataLite {
    init() {
        super(unsafe { FfiWebSchemeHandlerRequestConstructor() })
    }

    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /** 
     * Get request's resource type.
     * @returns { WebResourceType } Return the request's resource type.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getRequestResourceType(): WebResourceType
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getRequestResourceType(): WebResourceType {
        unsafe {
            var code: Int32 = 0
            let result = FfiWebSchemeHandlerRequestGetRequestResourceType(getID(), inout code)
            throwIfNotSuccess(code, "WebSchemeHandlerRequest", "getRequestResourceType")
            return WebResourceType.fromInt32(result)
        }
    }

    /**
     * Check whether the request is associated with gesture.
     * @returns { Bool } Whether request has user gesture.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief hasGesture(): boolean
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func hasGesture(): Bool {
        unsafe {
            var code: Int32 = 0
            let result = FfiWebSchemeHandlerRequestHasGesture(getID(), inout code)
            throwIfNotSuccess(code, "WebSchemeHandlerRequest", "hasGesture")
            return result
        }
    }

    /**
     * Check whether the request is for getting the main frame.
     * @returns { Bool } Whether request is main frame.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief isMainFrame(): boolean
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func isMainFrame(): Bool {
        unsafe {
            var code: Int32 = 0
            let result = FfiWebSchemeHandlerRequestIsMainFrame(getID(), inout code)
            throwIfNotSuccess(code, "WebSchemeHandlerRequest", "isMainFrame")
            return result
        }
    }

    /**
     * Gets the request URL.
     * @returns { String } Return the request URL.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getRequestUrl(): string
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getRequestUrl(): String {
        unsafe {
            let ret = FfiWebSchemeHandlerRequestGetRequestUrl(getID())
            throwIfNotSuccess(ret.code, "WebSchemeHandlerRequest", "getRequestUrl")
            return getStringAndFree(ret.data)
        }
    }

    /**
     * Get request method.
     * @returns { String } Return the request method.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getRequestMethod(): string
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getRequestMethod(): String {
        unsafe {
            let ret = FfiWebSchemeHandlerRequestGetMethod(getID())
            throwIfNotSuccess(ret.code, "WebSchemeHandlerRequest", "getRequestMethod")
            return getStringAndFree(ret.data)
        }
    }

    /**
     * Get referrer of request.
     * @returns { String } Return referrer of request.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getReferrer(): string
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getReferrer(): String {
        unsafe {
            let ret = FfiWebSchemeHandlerRequestGetReferrer(getID())
            throwIfNotSuccess(ret.code, "WebSchemeHandlerRequest", "getReferrer")
            return getStringAndFree(ret.data)
        }
    }

    /**
     * Get frame url.
     * @returns { String } Return referrer of request.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getFrameUrl(): string
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getFrameUrl(): String {
        unsafe {
            let ret = FfiWebSchemeHandlerRequestGetFrameUrl(getID())
            throwIfNotSuccess(ret.code, "WebSchemeHandlerRequest", "getFrameUrl")
            return getStringAndFree(ret.data)
        }
    }

    /**
     * Gets request headers.
     * @returns { Array<WebHeader> } Return the request headers.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getHeader(): Array<WebHeader>
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getHeader(): Array<WebHeader> {
        var code: Int32 = 0
        let cheader = unsafe { FfiWebSchemeHandlerRequestGetHeader(getID(), inout code) }
        throwIfNotSuccess(code, "WebSchemeHandlerRequest", "getHeader")
        WEBVIEW_LOG.info("WebSchemeHandler getHeader size: ${cheader.size}")
        var webheader = WebHeader("", "")
        var header = Array<WebHeader>(cheader.size, repeat: webheader)
        var i: Int64 = 0
        try {
            while (i < cheader.size) {
                header[i] = unsafe { WebHeader(cheader.head.read(i).headerKey.toString(),
                    cheader.head.read(i).headerValue.toString()) }
                i += 1
            }
        } finally {
            freeArrWebHeader(cheader.head, cheader.size)
        }
        return header
    }

    /**
     * Get http body stream.
     * @returns { WebHttpBodyStream | None } Return http body stream. If request has no http body stream, return null.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getHttpBodyStream(): WebHttpBodyStream | null
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getHttpBodyStream(): WebHttpBodyStream {
        unsafe {
            var code: Int32 = 0
            let httpBodyStreamId = FfiWebSchemeHandlerRequestGetHttpBodyStream(getID(), inout code)
            throwIfNotSuccess(code, "WebSchemeHandlerRequest", "getHttpBodyStream")
            return WebHttpBodyStream(httpBodyStreamId)
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class WebHttpBodyStream <: RemoteDataLite {
    init() {
        super(unsafe { FfiWebHttpBodyStreamConstructor() })
    }

    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Initialize data stream.
     * @returns { Unit } The promise of data stream is initialized.
     * @throws { BusinessException } 17100022 - Data stream init failed.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief initialize(): Promise<void>
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func initialize(): Unit {
        unsafe {
            var code: Int32 = 0
            FfiWebHttpBodyStreaminitialize(getID(), inout code)
            throwIfNotSuccess(code, "WebHttpBodyStream", "initialize")
        }
    }

    /**
     * Read the data stream to the buffer.
     * @param { Int32 } size - Read size.
     * @returns { Unit } Read array buffer of result.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief read(size: number): Promise<ArrayBuffer>
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func read(bufLen: Int32): Unit {
        unsafe {
            var code: Int32 = FfiWebHttpBodyStreamRead(bufLen, getID())
            throwIfNotSuccess(code, "WebHttpBodyStream", "read")
        }
    }

    /**
     * Whether data stream is chunked.
     * @returns { Bool } Whether data stream is chunked.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief isChunked(): boolean
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func isChunked(): Bool {
        unsafe {
            var code: Int32 = 0
            let chunked = FfiWebHttpBodyStreamIsChunked(getID(), inout code)
            throwIfNotSuccess(code, "WebHttpBodyStream", "isChunked")
            return chunked
        }
    }

    /**
     * Whether all data stream has been consumed. For chunked uploads,
     * returns false until the first read attempt.
     * @returns { boolean } Whether data stream has been consumed.
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func isEof(): Bool {
        unsafe {
            var code: Int32 = 0
            let eof = FfiWebHttpBodyStreamIsEof(getID(), inout code)
            throwIfNotSuccess(code, "WebHttpBodyStream", "isEof")
            return eof
        }
    }

    /**
     * Returns true if the upload data in the stream is entirely in memory, and all read requests will succeed
     * synchronously. Expected to return false for chunked requests.
     * @returns { Bool } Whether the data stream is in memory.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief isInMemory(): boolean
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func isInMemory(): Bool {
        unsafe {
            var code: Int32 = 0
            let inMemory = FfiWebHttpBodyStreamIsInMemory(getID(), inout code)
            throwIfNotSuccess(code, "WebHttpBodyStream", "isInMemory")
            return inMemory
        }
    }

    /**
     * Get the current position of the data stream.
     * @returns { UInt64 } Return position in post data stream.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getPosition(): number
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getPosition(): UInt64 {
        unsafe {
            var code: Int32 = 0
            let postion = FfiWebHttpBodyStreamGetPostion(getID(), inout code)
            throwIfNotSuccess(code, "WebHttpBodyStream", "getPosition")
            return postion
        }
    }

    /**
     * Get the total size of the data stream. When data is chunked, always return zero.
     * @returns { UInt64 } Return size of data stream size.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getSize(): number
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getSize(): UInt64 {
        unsafe {
            var code: Int32 = 0
            let size = FfiWebHttpBodyStreamGetSize(getID(), inout code)
            throwIfNotSuccess(code, "WebHttpBodyStream", "getSize")
            return size
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class WebResourceHandler <: RemoteDataLite {
    init() {
        super(unsafe { FfiWebResourceHandlerConstructor() })
    }

    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Pass response headers to intercepted requests.
     * @param { WebSchemeHandlerResponse } response - Set response header to intercept.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @throws { BusinessException } 17100021 - Resource handler process failed.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief didReceiveResponse(response: WebSchemeHandlerResponse): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func didReceiveResponse(response: WebSchemeHandlerResponse): Unit {
        unsafe {
            var code: Int32 = 0
            let responseid = response.getID()
            FfiWebResourceHandlerDidReceiveResponse(getID(), inout code, responseid)
            throwIfNotSuccess(code, "WebResourceHandler", "didReceiveResponse")
        }
    }

    /**
     * Pass response body data to intercepted requests.
     * @param { Array<UInt8> } data - Set response body to intercept.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @throws { BusinessException } 17100021 - Resource handler process failed.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief didReceiveResponseBody(data: ArrayBuffer): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func didReceiveResponseBody(data: Array<UInt8>): Unit {
        unsafe {
            var code: Int32 = 0
            let size = data.size
            let dataPtr = acquireArrayRawData(data)
            let cdata = CArrUI8(dataPtr.pointer, data.size)
            FfiWebResourceHandlerDidReceiveResponseBody(getID(), inout code, cdata, size)
            releaseArrayRawData(dataPtr)
            throwIfNotSuccess(code, "WebResourceHandler", "didReceiveResponseBody")
        }
    }

    /**
     * Notify that this request should be finished and there is no more data available.
     * @throws { BusinessException } 17100021 - Resource handler process failed.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief didFinish(): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func didFinish(): Unit {
        unsafe {
            var code: Int32 = 0
            FfiWebResourceHandlerDidFinish(getID(), inout code)
            throwIfNotSuccess(code, "WebResourceHandler", "didFinish")
        }
    }

    /**
     * Notify that this request should be failed.
     * @param { WebNetErrorList } code - Set response error code to intercept.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @throws { BusinessException } 17100021 - Resource handler process failed.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief didFail(code: WebNetErrorList): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func didFail(code: WebNetErrorList): Unit {
        unsafe {
            var errcode: Int32 = 0
            FfiWebResourceHandlerDidFail(getID(), inout errcode, code.getValue())
            throwIfNotSuccess(errcode, "WebResourceHandler", "didFail")
        }
    }
}
