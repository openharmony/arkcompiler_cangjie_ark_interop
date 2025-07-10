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
}
