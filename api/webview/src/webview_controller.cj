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

import ohos.ui_resource.*
import ohos.resource_manager.AppResource
import ohos.web.net_error_list.*
import ohos.labels.*
import ohos.ffi.*
import ohos.base.*
import std.collection.*
import ohos.image.*
import ohos.cert

/**
 * Subscribe to a callback of a specified type of web event once.
 *
 * @param {String} type Types of web event.
 * @param {() -> Unit} callback Indicate callback used to receive the web event.
 *
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
 * <br>2. Incorrect parameter types. 3.Parameter verification failed.
 * @syscap SystemCapability.Web.Webview.Core
 * @brief function once(type: string, callback: Callback<void>): void
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public func once(onceType: String, callback: () -> Unit): Unit {
    unsafe {
        let onceCall = Callback0Param<Unit>(callback)
        var code: Int32 = 0
        try (cType = LibC.mallocCString(onceType).asResource()) {
            code = FfiOHOSWebviewOnce(cType.value, onceCall.getID())
        }
        throwIfNotSuccess(code, "webview", "once")
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class WebviewController <: RemoteDataLite {
    /**
     * A constructor used to create a WebviewController object.
     *
     * @syscap SystemCapability.Web.Webview.Core
     * @brief constructor(webTag?: string)
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init() {
        super(unsafe { FfiOHOSWebviewCtlConstructor() })
    }

    /**
     * A constructor used to create a WebviewController object.
     *
     * @param { String } [webTag] - specified the name of the web component, Empty by default.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief constructor(webTag?: string)
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init(webTag: String) {
        super(createWebviewControllerWithWebTag(webTag))
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Initialize the web engine before loading the Web components.
     * This is a global static API that must be called on the UI thread, and it will have no effect if any
     * Web components are loaded.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief static initializeWebEngine(): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func initializeWebEngine(): Unit {
        WEBVIEW_LOG.info("WebviewController initializeWebEngine start.")
        unsafe { FfiOHOSWebviewCtlInitializeWebEngine() }
        WEBVIEW_LOG.info("WebviewController initializeWebEngine success.")
    }

    /**
     * Set web engine to use HttpDns server to resolve dns.
     * @param { SecureDnsMode } secureDnsMode - using HttpDns.
     * @param { String } secureDnsConfig - The configuration of the HttpDns server.
     *                   Must be https protocol and only allow one server to be configured.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief static setHttpDns(secureDnsMode:SecureDnsMode, secureDnsConfig:String): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func setHttpDns(secureDnsMode: SecureDnsMode, secureDnsConfig: String): Unit {
        WEBVIEW_LOG.info("WebviewController setHttpDns start.")
        if (!(secureDnsConfig.startsWith("https") || secureDnsConfig.startsWith("HTTPS"))) {
            WEBVIEW_LOG.error("WebviewController setHttpDns failed: Parameter error.")
            throw BusinessException(ERR_PARAMETER_ERROR, "WebviewController setHttpDns failed: Parameter error.")
        }
        unsafe {
            let secureDnsConfigCStr = LibC.mallocCString(secureDnsConfig)
            FfiOHOSWebviewCtlSetHttpDns(secureDnsMode.getValue(), secureDnsConfigCStr)
            LibC.free(secureDnsConfigCStr)
        }
        WEBVIEW_LOG.info("WebviewController setHttpDns success.")
    }

    /**
     * Enables debugging of web contents.
     * @param { boolean } webDebuggingAccess {@code true} enables debugging of web contents; {@code false} otherwise.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief static setWebDebuggingAccess(webDebuggingAccess: boolean): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func setWebDebuggingAccess(webDebuggingAccess: Bool): Unit {
        WEBVIEW_LOG.info("WebviewController setWebDebuggingAccess start.")
        unsafe {
            FfiOHOSWebviewCtlSetWebDebuggingAccess(webDebuggingAccess)
        }
        WEBVIEW_LOG.info("WebviewController setWebDebuggingAccess success.")
    }

    /**
     * Loads the data or URL.
     *
     * @param { String } url - The URL to load.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @throws { BusinessException } 17100002 - Invalid url.
     * @throws { BusinessException } 17100003 - Invalid resource path or file type.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief loadUrl(url: string | Resource, headers?: Array<WebHeader>): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func loadUrl(url: String): Unit {
        unsafe {
            let cUrl = LibC.mallocCString(url)
            let errCode = FfiOHOSWebviewCtlLoadUrl(getID(), cUrl)
            LibC.free(cUrl)
            throwIfNotSuccess(errCode, "WebviewController", "loadUrl")
        }
    }

    /**
     * Loads the data or URL.
     *
     * @param { String } url - The URL to load.
     * @param { Array<WebHeader> } [headers] - Additional HTTP request header for URL.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @throws { BusinessException } 17100002 - Invalid url.
     * @throws { BusinessException } 17100003 - Invalid resource path or file type.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief loadUrl(url: string | Resource, headers?: Array<WebHeader>): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func loadUrl(url: AppResource): Unit {
        loadUrl(getResourceMedia(url))
    }

    /**
     * Loads the data or URL.
     *
     * @param { String } url - The URL to load.
     * @param { Array<WebHeader> } [headers] - Additional HTTP request header for URL.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @throws { BusinessException } 17100002 - Invalid url.
     * @throws { BusinessException } 17100003 - Invalid resource path or file type.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief loadUrl(url: string | Resource, headers?: Array<WebHeader>): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func loadUrl(url: String, headers: Array<WebHeader>): Unit {
        if (headers.size == 0) {
            return loadUrl(url)
        }
        unsafe {
            let cUrl = LibC.mallocCString(url)
            let cHeaders = ArrWebHeader(headers) {
                LibC.free(cUrl)
            }
            let errCode = FfiOHOSWebviewCtlLoadUrlWithHeaders(getID(), cUrl, cHeaders)
            freeArrWebHeader(cHeaders.head, cHeaders.size)
            LibC.free(cUrl)
            throwIfNotSuccess(errCode, "WebviewController", "loadUrl")
        }
    }

    /**
     * Loads the data or URL.
     *
     * @param { String } url - The URL to load.
     * @param { Array<WebHeader> } [headers] - Additional HTTP request header for URL.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @throws { BusinessException } 17100002 - Invalid url.
     * @throws { BusinessException } 17100003 - Invalid resource path or file type.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief loadUrl(url: string | Resource, headers?: Array<WebHeader>): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func loadUrl(url: AppResource, headers: Array<WebHeader>): Unit {
        unsafe {
            let cUrl = LibC.mallocCString(getResourceMedia(url))
            let cHeaders = ArrWebHeader(headers) {
                LibC.free(cUrl)
            }
            let errCode = FfiOHOSWebviewCtlLoadUrlWithHeaders(getID(), cUrl, cHeaders)
            freeArrWebHeader(cHeaders.head, cHeaders.size)
            LibC.free(cUrl)
            throwIfNotSuccess(errCode, "WebviewController", "loadUrl")
        }
    }

    /**
     * Loads the data or URL.
     *
     * @param { String } data - A string encoded according to "Base64" or "URL".
     * @param { String } mimeType - Media type. For example: "text/html".
     * @param { String } encoding - Encoding type. For example: "UTF-8".
     * @param { String } [baseUrl] - A specified URL path ("http"/"https"/"data" protocol),
     *                             which is assigned to window.origin by the Web component.
     * @param { String } [historyUrl] - History URL. When it is not empty, it can be managed by
     *                                history records to realize the back and forth function.
     *                                This property is invalid when baseUrl is empty.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief loadData(data: string, mimeType: string, encoding: string, baseUrl?: string, historyUrl?: string): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func loadData(data: String, mimeType: String, encoding: String, baseUrl!: String = "",
        historyUrl!: String = ""): Unit {
        unsafe {
            var errCode: Int32 = 0
            try (
                cData = LibC.mallocCString(data).asResource(),
                cMimeType = LibC.mallocCString(mimeType).asResource(),
                cEncoding = LibC.mallocCString(encoding).asResource(),
                cBaseUrl = LibC.mallocCString(baseUrl).asResource(),
                cHistoryUrl = LibC.mallocCString(historyUrl).asResource()
            ) {
                errCode = FfiOHOSWebviewCtlLoadData(getID(),
                    LoadDatas(cData.value, cMimeType.value, cEncoding.value, cBaseUrl.value, cHistoryUrl.value))
            }
            throwIfNotSuccess(errCode, "WebviewController", "loadData")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func prefetchPage(url: String): Unit {
        unsafe {
            let cUrl = LibC.mallocCString(url)
            let errCode = FfiOHOSWebviewCtlPreFetchPage(getID(), cUrl)
            LibC.free(cUrl)
            throwIfNotSuccess(errCode, "WebviewController", "prefetchPage")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func prefetchPage(url: String, headers: Array<WebHeader>): Unit {
        unsafe {
            let cUrl = LibC.mallocCString(url)
            let cHeaders = ArrWebHeader(headers) {
                LibC.free(cUrl)
            }
            let errCode = FfiOHOSWebviewCtlPreFetchPageWithHeaders(getID(), cUrl, cHeaders)
            freeArrWebHeader(cHeaders.head, cHeaders.size)
            LibC.free(cUrl)
            throwIfNotSuccess(errCode, "WebviewController", "prefetchPage")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func slideScroll(vx: Float32, vy: Float32): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlSlideScroll(getID(), vx, vy);
            throwIfNotSuccess(errCode, "WebviewController", "slideScroll")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setNetworkAvailable(enable: Bool): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlSetNetworkAvailable(getID(), enable);
            throwIfNotSuccess(errCode, "WebviewController", "setNetworkAvailable")
        }
    }

    /**
     * Refreshes the current URL.
     *
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief refresh(): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func refresh(): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlRefresh(getID())
            throwIfNotSuccess(errCode, "WebviewController", "refresh")
        }
    }

    /**
     * Gets the default user agent.
     * @returns { String } Return user agent information.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getUserAgent(): string
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getUserAgent(): String {
        unsafe {
            var code: Int32 = 0
            let userAgent = FfiOHOSWebviewCtlGetUserAgent(getID(), inout code)
            throwIfNotSuccess(code, "WebviewController", "getUserAgent")
            return getStringAndFree(userAgent)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getWebId(): Int32 {
        unsafe {
            var code: Int32 = 0
            let webId = FfiOHOSWebviewCtlGetWebId(getID(), inout code)
            throwIfNotSuccess(code, "WebviewController", "getWebId")
            return webId
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getFavicon(): ?PixelMap {
        unsafe {
            var code: Int32 = 0
            let icon = FfiOHOSWebviewCtlGetFavicon(getID(), inout code)
            throwIfNotSuccess(code, "WebviewController", "getFavicon")
            let pixelIcon: ?PixelMap
            if (icon > 0) {
                pixelIcon = PixelMap(icon)
            } else {
                pixelIcon = None
            }
            return pixelIcon
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func prepareForPageLoad(url: String, preconnectable: Bool, numSockets: Int32): Unit {
        unsafe {
            let url = LibC.mallocCString(url)
            let errCode = FfiOHOSWebviewCtlPrepareForPageLoad(url, preconnectable, numSockets)
            LibC.free(url)
            throwIfNotSuccess(errCode, "WebviewController", "prepareForPageLoad")
        }
    }

    /**
     * Checks whether the web page can go forward.
     * @returns { Bool } True if the web page can go forward else false.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief accessForward(): boolean
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func accessForward(): Bool {
        unsafe {
            var code: Int32 = 0
            let result = FfiOHOSWebviewCtlAccessForward(getID(), inout code)
            throwIfNotSuccess(code, "WebviewController", "accessForward")
            return result
        }
    }

    /**
     * Checks whether the web page can go back.
     * @returns { Bool } True if the web page can go back else false.
     *                           The WebviewController must be associated with a Web component.
     * @throws { BusinessException } 17100001 - Init error.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief accessBackward(): boolean
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func accessBackward(): Bool {
        unsafe {
            var code: Int32 = 0
            let result = FfiOHOSWebviewCtlAccessBackward(getID(), inout code)
            throwIfNotSuccess(code, "WebviewController", "accessBackward")
            return result
        }
    }

    /**
     * Set custom user agent.
     * @param { String } userAgent - User custom agent information.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief setCustomUserAgent(userAgent: string): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setCustomUserAgent(userAgent: String): Unit {
        unsafe {
            let cUserAgent = LibC.mallocCString(userAgent)
            let errCode = FfiOHOSWebviewCtlSetCustomUserAgent(getID(), cUserAgent)
            LibC.free(cUserAgent)
            throwIfNotSuccess(errCode, "WebviewController", "setCustomUserAgent")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setAudioMuted(mute: Bool): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlSetAudioMuted(getID(), mute)
            throwIfNotSuccess(errCode, "WebviewController", "setAudioMuted")
        }
    }

    /**
     * Get custom user agent.
     * @returns { String } Get custom User agent information.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getCustomUserAgent(): string
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getCustomUserAgent(): String {
        unsafe {
            let ret = FfiOHOSWebviewCtlGetCustomUserAgent(getID())
            throwIfNotSuccess(ret.code, "WebviewController", "getCustomUserAgent")
            return getStringAndFree(ret.data)
        }
    }

    /**
     * Loads a piece of code and execute JS code in the context of the currently displayed page.
     *
     * @param { String } script - JavaScript Script.
     * @param { AsyncCallback<String> } callback - Callbacks execute JavaScript script results.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief runJavaScript(script: string, callback: AsyncCallback<string>): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func runJavaScript(script: String, callback: AsyncCallback<String>): Unit {
        unsafe {
            let cScript = LibC.mallocCString(script)
            let wrapper = {
                value: RetDataCString => if (value.code == 0) {
                    let data = value.data.toString()
                    LibC.free(value.data)
                    callback(None, data)
                } else {
                    callback(AsyncError(value.code), None)
                }
            }
            let lambdaData = Callback1Param<RetDataCString, Unit>(wrapper)
            let errCode = FfiOHOSWebviewCtlRunJavaScript(getID(), cScript, lambdaData.getID())
            LibC.free(cScript)
            throwIfNotSuccess(errCode, "WebviewController", "runJavaScript")
        }
    }

    /**
     * Execute JavaScript code in the context of the currently displayed page, and return the result.
     *
     * @param { String | Array<UInt8> } script - JavaScript Script.
     * @param { AsyncCallback<JsMessageExt> } callback - Callbacks execute JavaScript script results.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief runJavaScriptExt(script: string | ArrayBuffer, callback: AsyncCallback<JsMessageExt>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func runJavaScriptExt(script: String, callback: AsyncCallback<JsMessageExt>): Unit {
        unsafe {
            let cScript = LibC.mallocCString(script)
            let wrapper = {
                value: RetDataI64 => if (value.code == 0) {
                    let data = JsMessageExt(value.data)
                    callback(None, data)
                } else {
                    callback(AsyncError(value.code), None)
                }
            }
            let lambdaData = Callback1Param<RetDataI64, Unit>(wrapper)
            let errCode = FfiOHOSWebviewCtlRunJavaScriptExt(getID(), cScript, lambdaData.getID())
            LibC.free(cScript)
            throwIfNotSuccess(errCode, "WebviewController", "runJavaScriptExt")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func runJavaScriptExt(script: Array<UInt8>, callback: AsyncCallback<JsMessageExt>): Unit {
        unsafe {
            let dataPtr = acquireArrayRawData(script)
            let cScript = CArrUI8(dataPtr.pointer, script.size)
            let wrapper = {
                value: RetDataI64 => if (value.code == 0) {
                    let data = JsMessageExt(value.data)
                    callback(None, data)
                } else {
                    callback(AsyncError(value.code), None)
                }
            }
            let lambdaData = Callback1Param<RetDataI64, Unit>(wrapper)
            let errCode = FfiOHOSWebviewCtlRunJavaScriptExtArr(getID(), cScript, lambdaData.getID())
            releaseArrayRawData(dataPtr)
            throwIfNotSuccess(errCode, "WebviewController", "runJavaScriptExt")
        }
    }

    /**
     * Registers the JavaScript object and method list.
     *
     * @param { Array<(String) -> String>} funcs - Application side CJ funcs participating in registration.
     * @param { String } name - The name of the registered CJ funcs, which is consistent with the
     *                          object name called in the window.
     * @param { Array<String> } methodList - The method of the application side CJ funcs participating
     *                                       in the registration.
     * @throws { BusinessException } 401 - Invalid input parameter. Possible causes: 1.the funcs and methodList must have the same size.
     * <br>2. the funcs' size be greater than 0.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief registerJavaScriptProxy(object: object, name: string, methodList: Array<string>): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func registerJavaScriptProxy(funcs: Array<(String) -> String>, name: String, methodList: Array<String>): Unit {
        if (funcs.size != methodList.size) {
            WEBVIEW_LOG.error(
                "WebviewController registerJavaScriptProxy failed: the funcs and methodList must have the same size.")
            throw BusinessException(ERR_PARAMETER_ERROR,
                "WebviewController registerJavaScriptProxy failed: the funcs and methodList must have the same size.")
        }
        if (funcs.size == 0) {
            throw BusinessException(ERR_PARAMETER_ERROR,
                "WebviewController registerJavaScriptProxy failed: the funcs' size be greater than 0.")
        }
        unsafe {
            let cName = LibC.mallocCString(name)
            let cMethodList: CArrString
            try {
                cMethodList = toArrayCString(methodList)
            } catch (e: IllegalMemoryException) {
                LibC.free(cName)
                throw BusinessException(OUT_MEMEORY,
                    "WebviewController registerJavaScriptProxy failed: ${getErrorMsg(OUT_MEMEORY)}")
            }
            let cFuncIdsPtr = LibC.malloc<Int64>(count: funcs.size)
            if (cFuncIdsPtr.isNull()) {
                LibC.free(cName)
                freeArrCString(cMethodList)
                throw BusinessException(OUT_MEMEORY,
                    "WebviewController registerJavaScriptProxy failed: ${getErrorMsg(OUT_MEMEORY)}")
            }
            for (i in 0..funcs.size) {
                let wrapper = {
                    value: CString =>
                    let data = value.toString()
                    LibC.free(value)
                    let result = funcs[i](data)
                    let resultCString = LibC.mallocCString(result)
                    return resultCString
                }
                let lambdaData = Callback1Param<CString, CString>(wrapper)
                cFuncIdsPtr.write(i, lambdaData.getID())
            }
            let cFuncIds = CArrI64(cFuncIdsPtr, funcs.size)
            let errCode = FfiOHOSWebviewCtlRegisterJavaScriptProxy(getID(), cFuncIds, cName, cMethodList)
            LibC.free(cName)
            freeArrCString(cMethodList)
            LibC.free(cFuncIdsPtr)

            throwIfNotSuccess(errCode, "WebviewController", "registerJavaScriptProxy")
        }
    }

    /**
     * Registers the JavaScript object and method list.
     *
     * @param { Array<(String) -> String>} funcs - Application side CJ funcs participating in registration.
     * @param { String } name - The name of the registered CJ funcs, which is consistent with the
     *                          object name called in the window.
     * @param { Array<String> } methodList - The method of the application side CJ funcs participating
     *                                       in the registration.
     * @param { String } [permission] - permission configuration defining web page URLs that can access JavaScriptProxy methods.
     *                                The configuration can be defined at two levels, object level and method level.
     * @throws { BusinessException } 401 - Invalid input parameter. Possible causes: 1.the funcs and methodList must have the same size.
     * <br>2. the funcs' size be greater than 0.
     * <br>3. parameter of call back function must be encoded by utf8.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @relation registerJavaScriptProxy(object: object, name: string, methodList: Array<string>, asyncMethodList?: Array<string>, permission?: string): void;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func registerJavaScriptProxy(funcs: Array<(String) -> String>, name: String, methodList: Array<String>,
        permission: String): Unit {
        if (funcs.size != methodList.size) {
            throw BusinessException(ERR_PARAMETER_ERROR,
                "WebviewController registerJavaScriptProxy failed: the funcs and methodList must have the same size.")
        }
        if (funcs.size == 0) {
            throw BusinessException(ERR_PARAMETER_ERROR,
                "WebviewController registerJavaScriptProxy failed: the funcs' size be greater than 0.")
        }
        var cName: CString = CString(CPointer())
        var cPermission: CString = CString(CPointer())
        var cMethodList: CArrString = CArrString(CPointer(), 0)
        var cFuncIdsPtr: CPointer<Int64> = CPointer()
        var errCode: Int32 = 0
        unsafe {
            try {
                cName = LibC.mallocCString(name)
                cPermission = LibC.mallocCString(permission)
                cMethodList = toArrayCString(methodList)
                cFuncIdsPtr = LibC.malloc<Int64>(count: funcs.size)
                for (i in 0..funcs.size) {
                    let wrapper = wrapperJsFunc(funcs[i])
                    let lambdaData = Callback1Param<CString, CString>(wrapper)
                    cFuncIdsPtr.write(i, lambdaData.getID())
                }
                let cFuncIds = CArrI64(cFuncIdsPtr, funcs.size)
                errCode = FfiOHOSWebviewCtlRegisterJavaScriptProxyEx(getID(), cFuncIds, cName, cMethodList, cPermission)
            } catch (e: Exception) {
                throw BusinessException(OUT_MEMEORY,
                    "WebviewController registerJavaScriptProxy failed: ${getErrorMsg(OUT_MEMEORY)}")
            } finally {
                LibC.free(cName)
                LibC.free(cPermission)
                LibC.free(cFuncIdsPtr)
                freeArrCString(cMethodList)
            }
            throwIfNotSuccess(errCode, "WebviewController", "registerJavaScriptProxy")
        }
    }

    private unsafe func wrapperJsFunc(function: (String) -> String): (CString) -> CString {
        {
            value: CString =>
            let data = value.toString()
            unsafe {
                LibC.free(value)
                let result = function(data)
                let resultCString = LibC.mallocCString(result)
                return resultCString
            }
        }
    }

    /**
     * Gets the url of current Web page.
     * @returns { String } Return the url of the current page.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief runJavaScript(script: string, callback: AsyncCallback<string>): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getUrl(): String {
        unsafe {
            let ret = FfiOHOSWebviewCtlGetUrl(getID())
            throwIfNotSuccess(ret.code, "WebviewController", "getUrl")
            return getStringAndFree(ret.data)
        }
    }

    /**
     * Gets the original url of current Web page.
     * @returns { String } Return the original url of the current page.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief runJavaScript(script: string, callback: AsyncCallback<string>): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getOriginalUrl(): String {
        unsafe {
            let ret = FfiOHOSWebviewCtlGetOriginalUrl(getID())
            throwIfNotSuccess(ret.code, "WebviewController", "getOriginalUrl")
            return getStringAndFree(ret.data)
        }
    }

    /**
     * Scroll the contents of this Webview up by half the view size.
     *
     * @param { Bool } top - Whether to jump to the top of the page, if set to false,
     *                          the page content will scroll up half the size of the viewframe,
     *                          and when set to true, it will jump to the top of the page.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * brief pageUp(top: boolean): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func pageUp(top: Bool): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlPageUp(getID(), top)
            throwIfNotSuccess(errCode, "WebviewController", "pageUp")
        }
    }

    /**
     * Scroll the contents of this Webview down by half the view size.
     *
     * @param { Bool } bottom - Whether to jump to the top of the page, if set to false,
     *                             the page content will scroll up half the size of the viewframe,
     *                             and when set to true, it will jump to the top of the page.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * brief pageDown(bottom: boolean): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func pageDown(bottom: Bool): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlPageDown(getID(), bottom)
            throwIfNotSuccess(errCode, "WebviewController", "pageDown")
        }
    }

    /**
     * Scroll to the position.
     *
     * @param { Float32 } x - the x of the position.
     * @param { Float32 } y - the y of the position.
     * @param { Int32 } duration - the scroll animation duration. Unit: millisecond.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief scrollTo(x: number, y: number): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func scrollTo(x: Float32, y: Float32, duration!: Int32 = 0): Unit {
        unsafe {
            let errCode = if (duration > 0) {
                FfiOHOSWebviewCtlScrollToWithAnime(getID(), x, y, duration)
            } else {
                FfiOHOSWebviewCtlScrollTo(getID(), x, y)
            }
            throwIfNotSuccess(errCode, "WebviewController", "scrollTo")
        }
    }

    /**
     * Scroll by the delta position.
     *
     * @param { Float32 } deltaX - the delta x of the position.
     * @param { Float32 } deltaY - the delta y of the position.
     * @param { Int32 } duration - the scroll animation duration. Unit: millisecond.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief scrollBy(deltaX: number, deltaY: number): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func scrollBy(deltaX: Float32, deltaY: Float32, duration!: Int32 = 0): Unit {
        unsafe {
            let errCode = if (duration > 0) {
                FfiOHOSWebviewCtlScrollByWithAnime(getID(), deltaX, deltaY, duration)
            } else {
                FfiOHOSWebviewCtlScrollBy(getID(), deltaX, deltaY)
            }
            throwIfNotSuccess(errCode, "WebviewController", "scrollBy")
        }
    }

    /**
     * Goes forward in the history of the web page.
     *
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief forward(): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func forward(): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlForward(getID())
            throwIfNotSuccess(errCode, "WebviewController", "forward")
        }
    }

    /**
     * Goes back in the history of the web page.
     *
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief backward(): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func backward(): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlBackward(getID())
            throwIfNotSuccess(errCode, "WebviewController", "backward")
        }
    }

    /**
     * Goes forward or back backOrForward in the history of the web page.
     *
     * @param { Int32 } step - Steps to go forward or backward.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief backOrForward(step: number): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func backOrForward(step: Int32): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlBackOrForward(getID(), step)
            throwIfNotSuccess(errCode, "WebviewController", "backOrForward")
        }
    }

    /**
     * Gets the content height of current Web page.
     * @returns { Int32 } Returns the page height of the current page.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getPageHeight(): number
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getPageHeight(): Int32 {
        unsafe {
            var code: Int32 = 0
            let pageHeight = FfiOHOSWebviewCtlGetPageHeight(getID(), inout code)
            throwIfNotSuccess(code, "WebviewController", "getPageHeight")
            return pageHeight
        }
    }

    /**
     * Gets the title of current Web page.
     * @returns { String } Return to File Selector Title.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getTitle(): string
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getTitle(): String {
        unsafe {
            let ret = FfiOHOSWebviewCtlGetTitle(getID())
            throwIfNotSuccess(ret.code, "WebviewController", "getTitle")
            return getStringAndFree(ret.data)
        }
    }

    /**
     * Let the Web zoom by.
     *
     * @param { Int32 } factor - The zoom factor.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @throws { BusinessException } 17100004 - Function not enable.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief zoom(factor: number): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func zoom(factor: Float32): Unit {
        if (factor <= 0.0) {
            throw BusinessException(ERR_PARAMETER_ERROR,
                "WebviewController zoom failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
        unsafe {
            let errCode = FfiOHOSWebviewCtlZoom(getID(), factor)
            throwIfNotSuccess(errCode, "WebviewController", "zoom")
        }
    }

    /**
     * Let the Web zoom in.
     *
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @throws { BusinessException } 17100004 - Function not enable.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief zoomIn(): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func zoomIn(): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlZoomIn(getID())
            throwIfNotSuccess(errCode, "WebviewController", "zoomIn")
        }
    }

    /**
     * Let the Web zoom out.
     *
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @throws { BusinessException } 17100004 - Function not enable.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief zoomOut(): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func zoomOut(): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlZoomOut(getID())
            throwIfNotSuccess(errCode, "WebviewController", "zoomOut")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func requestFocus(): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlRequestFocus(getID())
            throwIfNotSuccess(errCode, "WebviewController", "requestFocus")
        }
    }
    /**
     * Gets the hit test value of HitTest.
     * @returns { HitTestValue } Return the element information of the clicked area.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getHitTestValue(): HitTestValue
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getHitTestValue(): HitTestValue {
        var code: Int32 = 0
        let ret = unsafe { FfiOHOSWebviewCtlGetHitTestValue(getID(), inout code) }
        throwIfNotSuccess(code, "WebviewController", "getHitTestValue")
        let hitType = WebHitTestType.fromInt32(ret.code)
        let extra = getStringAndFree(ret.data)
        return HitTestValue(hitType, extra)
    }

    /**
     * Clears the history in the Web.
     *
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief clearHistory(): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func clearHistory(): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlClearHistory(getID())
            throwIfNotSuccess(errCode, "WebviewController", "clearHistory")
        }
    }

    /**
     * Checks whether the web page can go back or forward the given number of steps.
     *
     * @param { Int32 } step - The number of steps.
     * @returns { Bool } True if the web page can go back else false.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief accessStep(step: number): boolean
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func accessStep(step: Int32): Bool {
        unsafe {
            var code: Int32 = 0
            let result = FfiOHOSWebviewCtlAccessStep(getID(), inout code, step)
            throwIfNotSuccess(code, "WebviewController", "accessStep")
            return result
        }
    }

    /**
     * Let the Web active.
     *
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief onActive(): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func onActive(): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlOnActive(getID())
            throwIfNotSuccess(errCode, "WebviewController", "onActive")
        }
    }

    /**
     * Let the Web inactive.
     *
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief onInactive(): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func onInactive(): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlOnInactive(getID())
            throwIfNotSuccess(errCode, "WebviewController", "onInactive")
        }
    }

    /**
     * Gets the type of HitTest.
     * @returns { WebHitTestType } The type of HitTest.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getHitTest(): WebHitTestType
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getHitTest(): WebHitTestType {
        unsafe {
            var code: Int32 = 0
            let hitTestType = FfiOHOSWebviewCtlGetHitTest(getID(), inout code)
            throwIfNotSuccess(code, "WebviewController", "getHitTest")
            return WebHitTestType.fromInt32(hitTestType)
        }
    }

    /**
     * Stores the current page as a web archive.
     *
     * @param { String } baseName - Where the generated offline webpage is stored, This value cannot be null.
     * @param { Bool } autoName - Decide whether to automatically generate the file name. If false, it is
     *                               stored by the file name of baseName. If true, the file name is
     *                               automatically generated based on the current URL and stored in the file
     *                               directory of baseName.
     * @param { AsyncCallback<String> } callback - called after the web archive has been stored. The parameter
     *                                             will either be the filename under which the file was stored,
     *                                             or empty if storing the file failed.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @throws { BusinessException } 17100003 - Invalid resource path or file type.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief storeWebArchive(baseName: string, autoName: boolean, callback: AsyncCallback<string>): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func storeWebArchive(baseName: String, autoName: Bool, callback: AsyncCallback<String>): Unit {
        unsafe {
            let cBaseName = LibC.mallocCString(baseName)
            let wrapper = {
                value: RetDataCString => if (value.code == 0) {
                    let data = value.data.toString()
                    LibC.free(value.data)
                    callback(None, data)
                } else {
                    callback(AsyncError(value.code), None)
                }
            }
            let lambdaData = Callback1Param<RetDataCString, Unit>(wrapper)
            let errCode = FfiOHOSWebviewCtlStoreWebArchive(getID(), cBaseName, autoName, lambdaData.getID())
            LibC.free(cBaseName)
            throwIfNotSuccess(errCode, "WebviewController", "storeWebArchive")
        }
    }

    /**
     * Enable the ability to check website security risks.
     * Illegal and fraudulent websites are mandatory enabled and can't be disabled by this function.
     * @param { Bool } enable - {@code true} enable check the website security risks; {@code false} otherwise.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief enableSafeBrowsing(enable: boolean): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func enableSafeBrowsing(enable: Bool): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlEnableSafeBrowsing(getID(), enable)
            throwIfNotSuccess(errCode, "WebviewController", "enableSafeBrowsing")
        }
    }

    /**
     * Get whether checking website security risks is enabled.
     * @returns { Bool } True if enable the ability to check website security risks else false.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief isSafeBrowsingEnabled(): boolean
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func isSafeBrowsingEnabled(): Bool {
        unsafe {
            var code: Int32 = 0
            let result = FfiOHOSWebviewCtlIsSafeBrowsingEnabled(getID(), inout code)
            throwIfNotSuccess(code, "WebviewController", "isSafeBrowsingEnabled")
            return result
        }
    }

    /**
     * Get the security level of the current page.
     *
     * @returns { SecurityLevel } the security level of current page.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getSecurityLevel(): SecurityLevel
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getSecurityLevel(): SecurityLevel {
        unsafe {
            var code: Int32 = 0
            let result = FfiOHOSWebviewCtlGetSecurityLevel(getID(), inout code)
            throwIfNotSuccess(code, "WebviewController", "getSecurityLevel")
            return SecurityLevel.fromInt32(result)
        }
    }

    /**
     * Whether the incognito mode is set.
     *
     * @returns { Bool } {@code true} has been set the incognito mode; {@code false} otherwise.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief isIncognitoMode(): boolean
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func isIncognitoMode(): Bool {
        unsafe {
            var code: Int32 = 0
            let result = FfiOHOSWebviewCtlIsIncognitoMode(getID(), inout code)
            throwIfNotSuccess(code, "WebviewController", "isIncognitoMode")
            return result
        }
    }

    /**
     * Remove resource cache in application. So this method will remove all cache for all web components in the
     * same application.
     *
     * @param { Bool } clearRom - Remove cache in both rom and ram if true. Otherwise only clear cache
     *                               in ram.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief removeCache(clearRom: boolean): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func removeCache(clearRom: Bool): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlRemoveCache(getID(), clearRom)
            throwIfNotSuccess(errCode, "WebviewController", "removeCache")
        }
    }

    /**
     * Get back forward stack list from current webview.
     * @returns { BackForwardList } Back forward list for current webview.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getBackForwardEntries(): BackForwardList
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getBackForwardEntries(): BackForwardList {
        unsafe {
            var code: Int32 = 0
            let backForwardListId = FfiOHOSWebviewCtlGetBackForwardEntries(getID(), inout code)
            throwIfNotSuccess(code, "WebviewController", "getBackForwardEntries")
            return BackForwardList(backForwardListId)
        }
    }

    /**
     * Stops the current load.
     *
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief stop(): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func stop(): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlStop(getID())
            throwIfNotSuccess(errCode, "WebviewController", "stop")
        }
    }

    /**
     * Loads the URL use "POST" method with post data.
     *
     * @param { String } url - Request the URL use "POST" method.
     * @param { Array<UInt8> } postData - This data will passed to "POST" request.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @throws { BusinessException } 17100002 - Invalid url.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief postUrl(url: string, postData: ArrayBuffer): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func postUrl(url: String, postData: Array<UInt8>): Unit {
        unsafe {
            let cUrl = LibC.mallocCString(url)
            let dataPtr = acquireArrayRawData(postData)
            let bytes = CArrUI8(dataPtr.pointer, postData.size)
            let errCode = FfiOHOSWebviewCtlPostUrl(getID(), cUrl, bytes)
            LibC.free(cUrl)
            releaseArrayRawData(dataPtr)
            throwIfNotSuccess(errCode, "WebviewController", "postUrl")
        }
    }

    /**
     * Set delegate for download.
     * Used to notify the progress of the download triggered from web.
     * @param { WebDownloadDelegate } delegate - Delegate used for download triggered from web.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief setDownloadDelegate(delegate: WebDownloadDelegate): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setDownloadDelegate(delegate: WebDownloadDelegate): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlSetDownloadDelegate(getID(), delegate.getID())
            throwIfNotSuccess(errCode, "WebviewController", "setDownloadDelegate")
        }
    }

    /**
     * Start a download.
     * @param { String } url - The download url.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @throws { BusinessException } 17100002 - Invalid url.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief startDownload(url: string): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func startDownload(url: String): Unit {
        unsafe {
            let cUrl = LibC.mallocCString(url)
            let errCode = FfiOHOSWebviewCtlStartDownload(getID(), cUrl)
            LibC.free(cUrl)
            throwIfNotSuccess(errCode, "WebviewController", "startDownload")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func setConnectionTimeout(timeout: Int32): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlSetConnectionTimeout(timeout)
            throwIfNotSuccess(errCode, "WebviewController", "setConnectionTimeout")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func clearClientAuthenticationCache(): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlClearClientAuthenticationCache(getID());
            throwIfNotSuccess(errCode, "WebviewController", "clearClientAuthenticationCache")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func clearSslCache(): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlClearSslCache(getID())
            throwIfNotSuccess(errCode, "WebviewController", "clearSslCache")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func searchNext(foward: Bool): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlSearchNext(getID(), foward)
            throwIfNotSuccess(errCode, "WebviewController", "searchNext")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func clearMatches(): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlClearMatches(getID())
            throwIfNotSuccess(errCode, "WebviewController", "clearMatches")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func searchAllAsync(searchString: String): Unit {
        unsafe {
            let cString = LibC.mallocCString(searchString)
            let errCode = FfiOHOSWebviewCtlSearchAllAsync(getID(), cString)
            LibC.free(cString)
            throwIfNotSuccess(errCode, "WebviewController", "searchAllAsync")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func deleteJavaScriptRegister(name: String): Unit {
        unsafe {
            let cString = LibC.mallocCString(name)
            let errCode = FfiOHOSWebviewCtlDeleteJavaScriptRegister(getID(), cString)
            LibC.free(cString)
            throwIfNotSuccess(errCode, "WebviewController", "deleteJavaScriptRegister")
        }
    }

    /**
     * Create web message ports
     * @param { Bool } isExtentionType - Set whether the web message port supports extention type.
     * @returns { Array<WebMessagePort> } An array represent 2 WebMessagePort, then can use
     *                                    those ports to communication with html pages.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief createWebMessagePorts(isExtentionType?: boolean): Array<WebMessagePort>
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func createWebMessagePorts(isExtentionType!: Bool = false): Array<WebMessagePort> {
        unsafe {
            var code: Int32 = 0
            let result = FfiOHOSWebviewCtlCreateWebMessagePorts(getID(), isExtentionType, inout code)
            throwIfNotSuccess(code, "WebviewController", "createWebMessagePorts")
            let size = result.size
            let ptr = result.head
            let arrayWebMessagePort = Array<WebMessagePort>(
                size,
                {
                    i => WebMessagePort(ptr.read(i))
                }
            )
            LibC.free<Int64>(ptr)
            return arrayWebMessagePort
        }
    }

    /**
     * Post web message port to html
     *
     * @param { String } name - Data name information to send.
     * @param { Array<WebMessagePort> } ports - Port number array information to send.
     * @param { String } uri - URI to receive this information.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief postMessage(name: string, ports: Array<WebMessagePort>, uri: string): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func postMessage(name: String, ports: Array<WebMessagePort>, uri: String): Unit {
        unsafe {
            var errCode: Int32 = 0
            let cPortsPtr = LibC.malloc<Int64>(count: ports.size)
            if (cPortsPtr.isNull()) {
                throw BusinessException(
                    OUT_MEMEORY,
                    "WebviewController postMessage failed: ${getErrorMsg(OUT_MEMEORY)}"
                )
            }
            for (i in 0..ports.size) {
                cPortsPtr.write(i, ports[i].getID())
            }
            let cPortsId = CArrI64(cPortsPtr, ports.size)
            try (
                cName = LibC.mallocCString(name).asResource(),
                cUri = LibC.mallocCString(uri).asResource()
            ) {
                errCode = FfiOHOSWebviewCtlPostMessage(getID(), cName.value, cPortsId, cUri.value)
            }
            LibC.free(cPortsPtr)
            throwIfNotSuccess(errCode, "WebviewController", "postMessage")
        }
    }

    /**
     * Query if current document has image.
     *
     * @param { AsyncCallback<Bool> } callback - Called after query image has finished.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief hasImage(callback: AsyncCallback<boolean>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func hasImage(callback: AsyncCallback<Bool>): Unit {
        unsafe {
            let wrapper = {
                value: RetDataBool => if (value.code == 0) {
                    callback(None, value.data)
                } else {
                    callback(AsyncError(value.code), None)
                }
            }
            let lambdaData = Callback1Param<RetDataBool, Unit>(wrapper)
            let errCode = FfiOHOSWebviewCtlHasImage(getID(), lambdaData.getID())
            throwIfNotSuccess(errCode, "WebviewController", "hasImage")
        }
    }

    /**
     * Serialize the access stack of the web, that is, the history of access.
     * @returns { Array<UInt8> } Web access stack after serialization.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief serializeWebState(): Uint8Array
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func serializeWebState(): Array<UInt8> {
        var code: Int32 = 0
        let stateBuffer: CArrUI8
        unsafe {
            stateBuffer = FfiOHOSWebviewCtlSerializeWebState(getID(), inout code)
            throwIfNotSuccess(code, "WebviewController", "serializeWebState")
            return toAndfreeArrayUInt8(stateBuffer)
        }
    }

    /**
     * Restoring the web access stack, that is, the history of access.
     * @param { Array<UInt8> } state - Web access stack after serialization.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief restoreWebState(state: Uint8Array): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func restoreWebState(state: Array<UInt8>): Unit {
        unsafe {
            let dataPtr = acquireArrayRawData(state)
            let cState = CArrUI8(dataPtr.pointer, state.size)
            let errCode = FfiOHOSWebviewCtlRestoreWebState(getID(), cState)
            releaseArrayRawData(dataPtr)
            throwIfNotSuccess(errCode, "WebviewController", "restoreWebState")
        }
    }

    /**
     * Terminate render process associated with this controller of the ArkWeb.
     *
     * @returns { Bool } true if it was possible to terminate the render process, otherwise false.
     *         Calling this on a not yet started, or an already terminated render will have no effect.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief terminateRenderProcess(): Bool
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func terminateRenderProcess(): Bool {
        unsafe {
            var errCode: Int32 = 0
            let result = FfiOHOSWebviewCtlTerminateRenderProcess(getID(), inout errCode)
            throwIfNotSuccess(errCode, "WebviewController", "terminateRenderProcess")
            return result
        }
    }

    /**
     * Close fullscreen video.
     *
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @atomicservice
     * @brief closeAllMediaPresentations(): Unit
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func closeAllMediaPresentations(): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlCloseAllMediaPresentations(getID())
            throwIfNotSuccess(errCode, "WebviewController", "closeAllMediaPresentations")
        }
    }

    /**
     * Pause all audio and video playback on the web page.
     *
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @atomicservice
     * @brief pauseAllMedia(): Unit
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func pauseAllMedia(): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlPauseAllMedia(getID())
            throwIfNotSuccess(errCode, "WebviewController", "pauseAllMedia")
        }
    }

    /**
     * Restart playback of all audio and video on the web page.
     *
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @atomicservice
     * @brief resumeAllMedia(): Unit
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func resumeAllMedia(): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlResumeAllMedia(getID())
            throwIfNotSuccess(errCode, "WebviewController", "resumeAllMedia")
        }
    }

    /**
     * Stop all audio and video playback on the web page.
     *
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @atomicservice
     * @brief stopAllMedia(): Unit
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func stopAllMedia(): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlStopAllMedia(getID())
            throwIfNotSuccess(errCode, "WebviewController", "stopAllMedia")
        }
    }

    /**
     * Resumes all layout, parsing, and JavaScript timers for all WebViews.
     *
     * @syscap SystemCapability.Web.Webview.Core
     * @atomicservice
     * @brief resumeAllTimers(): Unit
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func resumeAllTimers(): Unit {
        unsafe {
            FfiOHOSWebviewCtlResumeAllTimers()
        }
    }

    /**
     * Pauses all layout, parsing, and JavaScript timers for all WebViews.
     *
     * @syscap SystemCapability.Web.Webview.Core
     * @atomicservice
     * @brief pauseAllTimers(): Unit
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func pauseAllTimers(): Unit {
        unsafe {
            FfiOHOSWebviewCtlPauseAllTimers()
        }
    }

    /**
     * Get whether print web page background.
     * @returns { Boolean } Get whether print web page background.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getPrintBackground(): Bool
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getPrintBackground(): Bool {
        unsafe {
            var errCode: Int32 = 0
            let result = FfiOHOSWebviewCtlGetPrintBackground(getID(), inout errCode)
            throwIfNotSuccess(errCode, "WebviewController", "getPrintBackground")
            return result
        }
    }

    /**
     * Set whether print web page background.
     *
     * @param { Bool } enable - Set whether print web page background
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief setPrintBackground(enable: Bool): Unit
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setPrintBackground(enable: Bool): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlSetPrintBackground(getID(), enable)
            throwIfNotSuccess(errCode, "WebviewController", "setPrintBackground")
        }
    }

    /**
     * Get whether scrolling is allowed.
     * @returns { Bool } Get scrolling is allowed information.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getScrollable(): Bool
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getScrollable(): Bool {
        unsafe {
            var errCode: Int32 = 0
            let result = FfiOHOSWebviewCtlGetScrollable(getID(), inout errCode)
            throwIfNotSuccess(errCode, "WebviewController", "getScrollable")
            return result
        }
    }

    /**
     * Set whether scroll is allowed
     *
     * @param { Bool } enable - Set whether scrolling is allowed
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief setScrollable(enable: Bool): Unit
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setScrollable(enable: Bool): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlSetScrollable(getID(), enable)
            throwIfNotSuccess(errCode, "WebviewController", "setScrollable")
        }
    }

    /**
     * Get whether Ads block is enabled for current Webpage
     * @returns { Bool } True if the ability of AdsBlock is enabled for current Webpage; else false.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief isAdsBlockEnabledForCurPage(): boolean
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func isAdsBlockEnabledForCurPage(): Bool {
        unsafe {
            return FfiOHOSWebviewCtlIsAdsBlockEnabledForCurPage(getID())
        }
    }

    /**
     * Enable the ability to block Ads, default disabled.
     * @param { Bool } enable {@code true} enable Ads block; {@code false) otherwise.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief enableAdsBlock(enable: Bool): Unit
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func enableAdsBlock(enable: Bool): Unit {
        unsafe {
            FfiOHOSWebviewCtlEnableAdsBlock(getID(), enable)
        }
    }

    /**
     * Get whether Ads block is enabled.
     * @returns { Bool } True if the ability of AdsBlock is enabled; else false.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief isAdsBlockEnabled(): Bool
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func isAdsBlockEnabled(): Bool {
        unsafe {
            return FfiOHOSWebviewCtlIsAdsBlockEnabled(getID())
        }
    }

    /**
     * Get whether Intelligent Tracking Prevention is enabled.
     *
     * @returns { Bool } True if enable the Intelligent Tracking Prevention; else false.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief isIntelligentTrackingPreventionEnabled(): Bool
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func isIntelligentTrackingPreventionEnabled(): Bool {
        unsafe {
            var errCode: Int32 = 0
            let result = FfiOHOSWebviewCtlIsIntelligentTrackingPreventionEnabled(getID(), inout errCode)
            throwIfNotSuccess(errCode, "WebviewController", "isIntelligentTrackingPreventionEnabled")
            return result
        }
    }

    /**
     * Enable the ability to use Intelligent Tracking Prevention; default is disabled.
     *
     * @param { boolean } enable {@code true} enable Intelligent Tracking Prevention; {@code false} otherwise.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief enableIntelligentTrackingPrevention(enable: Bool): Unit
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func enableIntelligentTrackingPrevention(enable: Bool): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlEnableIntelligentTrackingPrevention(getID(), enable)
            throwIfNotSuccess(errCode, "WebviewController", "enableIntelligentTrackingPrevention")
        }
    }

    /**
     * Get render process mode of the ArkWeb.
     *
     * @returns { RenderProcessMode } mode - The render process mode of the ArkWeb.
     * @syscap SystemCapability.Web.Webview.Core
     * @atomicservice
     * @brief static getRenderProcessMode(): RenderProcessMode
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func getRenderProcessMode(): RenderProcessMode {
        unsafe {
            let code = FfiOHOSWebviewCtlGetRenderProcessMode()
            WEBVIEW_LOG.info("WebviewController getRenderProcessMode success.")
            return RenderProcessMode.fromInt32(code)
        }
    }

    /**
     * Set render process mode of the ArkWeb.
     *
     * @param { RenderProcessMode } mode - The render process mode for the ArkWeb.
     * @syscap SystemCapability.Web.Webview.Core
     * @atomicservice
     * @brief static setRenderProcessMode(mode: RenderProcessMode): Unit
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func setRenderProcessMode(mode: RenderProcessMode): Unit {
        unsafe {
            let code: Int32 = mode.getValue()
            FfiOHOSWebviewCtlSetRenderProcessMode(code)
            WEBVIEW_LOG.info("WebviewController setRenderProcessMode success.")
        }
    }

    /**
     * View the playback status of all audio and video on the web page.
     *
     * @returns { MediaPlaybackState } The playback status of all audio and video.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getMediaPlaybackState(): MediaPlaybackState
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getMediaPlaybackState(): MediaPlaybackState {
        unsafe {
            var errCode: Int32 = 0
            let result = FfiOHOSWebviewCtlGetMediaPlaybackState(getID(), inout errCode)
            throwIfNotSuccess(errCode, "WebviewController", "getMediaPlaybackState")
            return MediaPlaybackState.fromInt32(result)
        }
    }

    /**
     * Warmup the registered service worker associated the url.
     * @param { String } url - The url.
     * @throws { BusinessException } 17100002 - Invalid url.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief warmupServiceWorker(url: String): Unit
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func warmupServiceWorker(url: String): Unit {
        unsafe {
            var errCode: Int32 = 0
            try (curl = LibC.mallocCString(url).asResource()) {
                errCode = FfiOHOSWebviewCtlWarmupServiceWorker(curl.value)
            }
            throwIfNotSuccess(errCode, "WebviewController", "warmupServiceWorker")
        }
    }

    /**
     * Clear the host name IP address.
     *
     * @param { String } hostName - Which host name to be cleared.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief clearHostIP(hostName: string): Unit
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func clearHostIP(hostName: String): Unit {
        unsafe {
            var errCode: Int32 = 0
            try (cHostName = LibC.mallocCString(hostName).asResource()) {
                errCode = FfiOHOSWebviewCtlClearHostIP(cHostName.value)
            }
            throwIfNotSuccess(errCode, "WebviewController", "clearHostIP")
        }
    }

    /**
     * Set IP address for host name.
     *
     * @param { String } hostName - Which host name to be resolved.
     * @param { String } address - Resolved IP address.
     * @param { Int32 } aliveTime - The validity seconds for resolve cache.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief setHostIP(hostName: String, address: String, aliveTime: Int32):voUnitid
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func setHostIP(hostName: String, address: String, aliveTime: Int32): Unit {
        unsafe {
            var errCode: Int32 = 0
            try (
                cHostName = LibC.mallocCString(hostName).asResource(),
                cAddress = LibC.mallocCString(address).asResource()
            ) {
                errCode = FfiOHOSWebviewCtlSetHostIP(cHostName.value, cAddress.value, aliveTime)
            }
            throwIfNotSuccess(errCode, "WebviewController", "setHostIP")
        }
    }

    /**
     * Get the url of the last frame that calls the JavaScriptProxy.
     * This should be called on the UI thread.
     *
     * @returns { String } The url of the last frame that calls the JavaScriptProxy.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @atomicservice
     * @brief getLastJavascriptProxyCallingFrameUrl(): String
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getLastJavascriptProxyCallingFrameUrl(): String {
        unsafe {
            let ret = FfiOHOSWebviewCtlGetLastJavascriptProxyCallingFrameUrl(getID())
            throwIfNotSuccess(ret.code, "WebviewController", "getLastJavascriptProxyCallingFrameUrl")
            WEBVIEW_LOG.info("WebviewController getLastJavascriptProxyCallingFrameUrl success.")
            return getStringAndFree(ret.data)
        }
    }

    /**
     * Set enable overall web caching
     *
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func enableWholeWebPageDrawing(): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlEnableWholeWebPageDrawing()
            throwIfNotSuccess(errCode, "WebviewController", "enableWholeWebPageDrawing")
        }
    }

    /**
     * Clear the resource that you prefetch to the memory cache using API{@link prefetchResource}.
     * @param { Array<string> } cacheKeyList - The keys for memory cache.
     *    The key in cacheKeyList only support number and letters.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief clearPrefetchedResource(cacheKeyList: Array<String>): Unit
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func clearPrefetchedResource(cacheKeyList: Array<String>): Unit {
        unsafe {
            let cCacheKeyList = toArrayCString(cacheKeyList)
            let errCode = FfiOHOSWebviewCtlClearPrefetchedResource(cCacheKeyList)
            freeArrCString(cCacheKeyList)
            throwIfNotSuccess(errCode, "WebviewController", "clearPrefetchedResource")
        }
    }

    /**
     * Close current camera.
     *
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief closeCamera(): Unit
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func closeCamera(): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlCloseCamera(getID())
            throwIfNotSuccess(errCode, "WebviewController", "closeCamera")
        }
    }

    /**
     * Stop current camera.
     *
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief stopCamera(): Unit
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func stopCamera(): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlStopCamera(getID())
            throwIfNotSuccess(errCode, "WebviewController", "stopCamera")
        }
    }

    /**
     * Start current camera.
     *
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief startCamera(): Unit
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func startCamera(): Unit {
        unsafe {
            let errCode = FfiOHOSWebviewCtlStartCamera(getID())
            throwIfNotSuccess(errCode, "WebviewController", "startCamera")
        }
    }

    /**
     * Add bypassing hosts for Intelligent Tracking Prevention.
     *
     * @param { Array<string> } hostList - Hosts that bypass the Intelligent Tracking Prevention.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func addIntelligentTrackingPreventionBypassingList(hostList: Array<String>): Unit {
        unsafe {
            let cHostList = toArrayCString(hostList)
            let errCode = FfiOHOSWebviewCtlAddIntelligentTrackingPreventionBypassingList(cHostList)
            freeArrCString(cHostList)
            throwIfNotSuccess(errCode, "WebviewController", "addIntelligentTrackingPreventionBypassingList")
        }
    }

    /**
     * Clear bypassing hosts for Intelligent Tracking Prevention.
     *
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func clearIntelligentTrackingPreventionBypassingList(): Unit {
        unsafe {
            FfiOHOSWebviewCtlClearIntelligentTrackingPreventionBypassingList()
        }
    }

    /**
     * Enable the BackForwardCache and indicate features that are allowed to enter BackForwardCache.
     * Default is disabled.
     *
     * @param { BackForwardCacheSupportedFeatures } features - The features that supports BackForwardCache.
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func enableBackForwardCache(features: BackForwardCacheSupportedFeatures): Unit {
        unsafe {
            FfiOHOSWebviewCtlEnableBackForwardCache(features.nativeEmbed, features.mediaTakeOver)
        }
    }

    /**
     * Get the ID of the surface created by ArkWeb. This ID can be used for web page screenshots.
     *
     * @returns { string } The ID of the surface created by ArkWeb.
     * @syscap SystemCapability.Web.Webview.Core
     * @since 12
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getSurfaceId(): String {
        unsafe {
            let ret = FfiOHOSWebviewCtlGetSurfaceId(getID())
            throwIfNotSuccess(ret.code, "WebviewController", "getSurfaceId")
            return getStringAndFree(ret.data)
        }
    }

    /**
     * Inject offline resources into cache.
     *
     * @param { Array<OfflineResourceMap> } resourceMaps - Array of offline resource info maps.
     *    The count of array must between 1 and 30.
     * @throws { BusinessException } 401 - Invalid input parameter.
     *    Possible causes: 1. Mandatory parameters are left unspecified.
     *    2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessException } 17100001 - Init error.
     *    The WebviewController must be associated with a Web component.
     * @throws { BusinessException } 17100002 - Invalid url.
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func injectOfflineResources(resourceMaps: Array<OfflineResourceMap>): Unit {
        unsafe {
            var cResourceMaps = CArrOfflineResourceMap(resourceMaps)
            let ret = FfiOHOSWebviewCtlInjectOfflineResources(getID(), cResourceMaps)
            freeArrOfflineResourceMap(cResourceMaps.head, cResourceMaps.size)
            throwIfNotSuccess(ret, "WebviewController", "injectOfflineResources")
            return
        }
    }

    /**
     * Remove bypassing hosts for Intelligent Tracking Prevention.
     *
     * @param { Array<String> } hostList - Hosts needs to remove from bypass list.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types.
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func removeIntelligentTrackingPreventionBypassingList(hostList: Array<String>): Unit {
        unsafe {
            let cHostList: CArrString = toArrayCString(hostList)
            FfiOHOSWebviewCtlRemoveIntelligentTrackingPreventionBypassingList(cHostList)
            freeArrCString(cHostList)
        }
    }

    /**
     * Configure the BackForwardCache.
     *
     * @param { BackForwardCacheOptions } options - The configuration of BackForwardCache.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setBackForwardCacheOptions(options: BackForwardCacheOptions): Unit {
        unsafe {
            let ret = FfiOHOSWebviewCtlSetBackForwardCacheOptions(getID(), options.size, options.timeToLive)
            throwIfNotSuccess(ret, "WebviewController", "setBackForwardCacheOptions")
        }
    }

    /**
     * Set the URL trust list for the ArkWeb.
     * When the URL trust list has been set, only the URLs in the list can be accessed.
     *
     * @param { String } urlTrustList - the URL trust list in JSON format.
     *     An empty string means that all URLs are allowed to access.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Parameter string is too long. 3.Parameter verification failed.
     * @throws { BusinessException } 17100001 - Init error.
     *     The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setUrlTrustList(urlTrustList: String): Unit {
        unsafe {
            let cUrl: CString = LibC.mallocCString(urlTrustList)
            let ret = FfiOHOSWebviewCtlSetUrlTrustList(getID(), cUrl)
            LibC.free(cUrl)
            throwIfNotSuccess(ret, "WebviewController", "setUrlTrustList")
        }
    }

    /**
     * Set a path list, allowing cross-origin request access any origin when the file scheme URLs access resources in this
     * path list.
     * @param { Array<String> } pathList - The path list allow universal access.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Parameter string is too long. 3.Parameter verification failed.
     * @throws { BusinessException } 17100001 - Init error.
     *     The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setPathAllowingUniversalAccess(pathList: Array<String>): Unit {
        unsafe {
            let cPathList: CArrString = toArrayCString(pathList)
            let ret = FfiOHOSWebviewCtlSetPathAllowingUniversalAccess(getID(), cPathList)
            freeArrCString(cPathList)
            throwIfNotSuccess(ret, "WebviewController", "setPathAllowingUniversalAccess")
        }
    }

    /**
     * Prefetch the resources request and save it to the memory cache. Only support post request and its Content-Type
     * is application/x-www-form-urlencoded now.
     * You can prefetch no more than 6 resources. If you want to prefetch the seventh resource, you can clear one of
     * the prefetched resources that you won't use any more. Otherwise the oldest resource you prefetched will be
     * cleared.
     * @param { RequestInfo } request - The information of the request.
     * @param { Array<WebHeader> } [additionalHeaders] - Additional HTTP request header of the request.
     * @param { string } [cacheKey] - The key for memory cache. Default value is the url of the request.
     *    Only support number and letters.
     * @param { Int32 } [cacheValidTime] - The valid time of the cache for request, ranges greater than 0.
     *    The unit is second. Default value is 300s.
     *    The value of cacheValidTime must between 1 and 2147483647.
     * @throws { BusinessError } 401 - Invalid input parameter.Possible causes: 1. Mandatory parameters are left unspecified.
     *    2. Incorrect parameter types. 3. Parameter verification failed.
     * @throws { BusinessError } 17100002 - Invalid url.
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func prefetchResource(request: RequestInfo, additionalHeaders!: Array<WebHeader> = Array<WebHeader>(),
        cacheKey!: String = "", cacheValidTime!: Int32 = 0): Unit {
        unsafe {
            let cHeaders: ArrWebHeader = ArrWebHeader(additionalHeaders) {}
            var errCode: Int32 = 0
            try (
                cUrl = LibC.mallocCString(request.url).asResource(),
                cMethod = LibC.mallocCString(request.method).asResource(),
                cData = LibC.mallocCString(request.formData).asResource(),
                cKey = LibC.mallocCString(cacheKey).asResource()
            ) {
                errCode = FfiOHOSWebviewCtlPrefetchResource(CRequestInfo(cUrl.value, cMethod.value, cData.value),
                    cHeaders, cKey.value, cacheValidTime)
            } catch (e: IllegalMemoryException) {
                freeArrWebHeader(cHeaders.head, cHeaders.size)
                throw e
            }
            freeArrWebHeader(cHeaders.head, cHeaders.size)
            if (errCode != 0) {
                WEBVIEW_LOG.error("WebviewController prefetchResource failed: ${getErrorMsg(errCode)}")
                throw BusinessException(errCode, "WebviewController prefetchResource failed: ${getErrorMsg(errCode)}")
            }
        }
    }

    /**
     * Compile javascript and generate code cache.
     * @param { String } url - Url of the javascript.
     * @param { String } script - javascript source code.
     * @param { CacheOptions } cacheOptions - generate code cache option.
     * @returns { Int32 } - the promise returned by the function.
     *                                0 means generate code cache successfully, -1 means internal error.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief precompileJavaScript(url: String, script: String, cacheOptions: CacheOptions): Promise<number>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func precompileJavaScript(url: String, script: String, cacheOptions: CacheOptions): Int32 {
        unsafe {
            var errCode: Int32 = 0
            let cCacheOptions: CCacheOptions
            try (
                cUrl = LibC.mallocCString(url).asResource(),
                cScript = LibC.mallocCString(script).asResource()
            ) {
                cCacheOptions = CCacheOptions(cacheOptions)
                errCode = FfiOHOSWebviewCtlPrecompileJavaScript(getID(), cUrl.value, cScript.value, cCacheOptions)
                cCacheOptions.free()
            }
            throwIfNotSuccess(errCode, "WebviewController", "precompileJavaScript")
            return errCode
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func precompileJavaScript(url: String, script: Array<UInt8>, cacheOptions: CacheOptions): Int32 {
        return precompileJavaScript(url, script.toString(), cacheOptions)
    }

    /**
     * Web page snapshot.
     *
     * @param { SnapshotInfo } info - The snapshot info.
     * @param { AsyncCallback<SnapshotResult> } callback - the callback of snapshot.
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func webPageSnapshot(info: SnapshotInfo, callback: AsyncCallback<SnapshotResult>): Unit {
        unsafe {
            let wrapper = {
                value: RetDataCSnapshotResult => if (value.code == 0) {
                    let data = value.data
                    callback(None, Some(data.toSnapshotResult()))
                    data.free()
                } else {
                    callback(AsyncError(value.code), None)
                }
            }
            let cinfo = CSnapshotInfo(info)
            let lambdaData = Callback1Param<RetDataCSnapshotResult, Unit>(wrapper)
            let errCode = FfiOHOSWebviewCtlWebPageSnapshot(getID(), cinfo, lambdaData.getID())
            cinfo.free()
            if (errCode != 0) {
                throwIfNotSuccess(errCode, "WebviewController", "webPageSnapshot")
            }
        }
    }

    /**
     * Clear all web service worker scheme handlers.
     * @syscap SystemCapability.Web.Webview.Core
     * @atomicservice
     * @brief static clearServiceWorkerWebSchemeHandler(): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func clearServiceWorkerWebSchemeHandler(): Unit {
        unsafe {
            FfiOHOSWebviewCtlClearServiceWorkerWebSchemeHandler()
            WEBVIEW_LOG.info("WebviewController clearServiceWorkerWebSchemeHandler success.")
        }
    }

    /**
     * Clear all web scheme handlers for related web component.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @atomicservice
     * @brief clearWebSchemeHandler(): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func clearWebSchemeHandler(): Unit {
        unsafe {
            var code: Int32 = 0
            FfiOHOSWebviewCtlClearWebSchemeHandler(getID(), inout code)
            if (code != 0) {
                throwIfNotSuccess(code, "WebviewController", "clearServiceWorkerWebSchemeHandler")
            }
        }
    }

    /**
     * Set web scheme handler for specific scheme. This is used for service worker.
     * @param { String } scheme - String value for url scheme.
     * @param { WebSchemeHandler } handler - Web scheme handler.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief static setServiceWorkerWebSchemeHandler(scheme: string, handler: WebSchemeHandler): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func setServiceWorkerWebSchemeHandler(scheme: String, handler: WebSchemeHandler): Unit {
        unsafe {
            let cScheme = LibC.mallocCString(scheme)
            let cHandler = handler.getID()
            var code: Int32 = 0
            FfiOHOSWebviewCtlSetServiceWorkerWebSchemeHandler(cScheme, cHandler, inout code)
            LibC.free(cScheme)
            throwIfNotSuccess(code, "WebviewController", "setServiceWorkerWebSchemeHandler")
        }
    }

    /**
     * Set web scheme handler for specific scheme. This is only used for related web component.
     *
     * @param { String } scheme - String value for url scheme.
     * @param { WebSchemeHandler } handler - Web scheme handler.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief setWebSchemeHandler(scheme: string, handler: WebSchemeHandler): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setWebSchemeHandler(scheme: String, handler: WebSchemeHandler): Unit {
        unsafe {
            let cScheme = LibC.mallocCString(scheme)
            let cHandler = handler.getID()
            var code: Int32 = 0
            FfiOHOSWebviewCtlSetWebSchemeHandler(getID(), cScheme, cHandler, inout code)
            LibC.free(cScheme)
            throwIfNotSuccess(code, "WebviewController", "setWebSchemeHandler")
        }
    }

    /**
     * Register a callback to intercept web pages playing media.
     *
     * @param { CreateNativeMediaPlayerCallback } callback - Called everytime when web pages try to play media.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief onCreateNativeMediaPlayer(callback: CreateNativeMediaPlayerCallback): Unit
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func onCreateNativeMediaPlayer(callback: CreateNativeMediaPlayerCallback): Unit {
        let wrapper = {
            handlerId: Int64, cMediaInfo: CMediaInfo =>
            let handler = NativeMediaPlayerHandler(handlerId)
            let mediaInfo = cMediaInfo.toMediaInfoAndFree()
            let mediaPlayerBridge = callback(handler, mediaInfo)
            FFIDataManager.getInstance().register(mediaPlayerBridge)
            return mediaPlayerBridge.getID()
        }
        let beforeCall = Callback2Param<Int64, CMediaInfo, Int64>(wrapper)
        unsafe {
            FfiOHOSWebviewCtlOnCreateNativeMediaPlayer(getID(), beforeCall.getID())
        }
    }

    /**
     * Get the scroll offset of the webpage in view port, the coordinates of the top left corner of the view port are X: 0, Y: 0.
     * And the unit is virtual pixel.
     *
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a web component.
     * @returns { ScrollOffset } scroll offset
     * @relation getScrollOffset(): ScrollOffset
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getScrollOffset(): ScrollOffset {
        var code: Int32 = 0
        let offset: CScrollOffset = unsafe {
            FfiOHOSWebviewCtlGetScrollOffset(getID(), inout code)
        }
        throwIfNotSuccess(code, "WebviewController", "getScrollOffset")
        return ScrollOffset(offset.x, offset.y)
    }

    /**
     * Scrolls by the specified delta position and returns a result indicating whether the scrolling operation was successful or not.
     *
     * @param { Float32 } deltaX - the delta x of the position.
     * @param { Float32 } deltaY - the delta y of the position.
     * @returns { Bool } true if the scroll operation is successful, otherwise false.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @relation scrollByWithResult(deltaX: number, deltaY: number): boolean
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func scrollByWithResult(deltaX: Float32, deltaY: Float32): Bool {
        var code: Int32 = 0
        let result: Bool = unsafe {
            FfiOHOSWebviewCtlScrollByWithResult(getID(), deltaX, deltaY, inout code)
        }
        throwIfNotSuccess(code, "WebviewController", "ScrollByWithResult")
        return result
    }

    /**
     * Register Web custom schemes.
     * @param { Array<WebCustomScheme> } schemes - Configuration of web custom scheme.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException } 17100020 - Failed to register custom schemes.
     * @relation static customizeSchemes(schemes: Array<WebCustomScheme>): void
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func customizeSchemes(schemes: Array<WebCustomScheme>): Unit {
        let cArrScheme: CArrScheme = CArrScheme(schemes)
        let code = unsafe {
            FfiWebviewCtlCustomizeSchemes(cArrScheme)
        }
        cArrScheme.free()
        throwIfNotSuccess(code, "WebviewController", "customizeSchemes")
    }

    /**
     * Get certificate for the current website.
     *
     * @returns { Array<cert.X509Cert> } the promise of the current website's certificate.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a web component.
     * @relation getCertificate(): Promise<Array<cert.X509Cert>>
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getCertificate(): Array<cert.X509Cert> {
        var code: Int32 = 0
        unsafe {
            let cCertBytes = FfiOHOSWebviewCtlGetCertificateByte(getID(), inout code)
            throwIfNotSuccess(code, "WebviewController", "getCertificate")
            try {
                cArr2cjArr<CArrUI8, cert.X509Cert>(cCertBytes.size, cCertBytes.head) {
                    cCertByte: CArrUI8 =>
                    let certByte: Array<Byte> = cArr2cjArr<UInt8, Byte>(cCertByte.size, cCertByte.head, {b => b})
                    cert.createX509Cert(cert.EncodingBlob(certByte, cert.EncodingFormat.FORMAT_DER))
                }
            } finally {
                cCertBytes.free()
            }
        }
    }

    /**
     * Set whether scroll is allowed
     *
     * @param { Bool } enable - Set whether scrolling is allowed
     * @param { ScrollType } type - Enable scrolling type
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 17100001 - Init error.
     *                           The WebviewController must be associated with a Web component.
     * @relation setScrollable(enable: boolean, type?: ScrollType): void
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setScrollable(enable: Bool, `type`!: ScrollType): Unit {
        let code: Int32 = unsafe {
            FfiOHOSWebviewCtlSetScrollableEx(getID(), enable, `type`.getValue())
        }
        throwIfNotSuccess(code, "WebviewController", "setCrollable")
    }
}
