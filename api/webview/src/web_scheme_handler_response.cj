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
import ohos.web.net_error_list.*

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class WebSchemeHandlerResponse <: RemoteDataLite {
    /**
     * Constructor.
     * @syscap SystemCapability.Web.Webview.Core
     * @atomicservice
     * @brief constructor()
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init() {
        super(unsafe { FfiWebSchemeHandlerResponseConstructor() })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Get the resolved URL after redirects or changed as a result of HSTS.
     * @returns { String } Return response url for redirects.
     * @syscap SystemCapability.Web.Webview.Core
     * @atomicservice
     * @brief getUrl(): String

     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getUrl(): String {
        unsafe {
            let ret = FfiWebSchemeHandlerResponseGetUrl(getID())
            throwIfNotSuccess(ret.code, "WebMessageExt", "get url")
            return getStringAndFree(ret.data)
        }
    }

    /**
     * Get status text.
     * @returns { String } Return http status text.
     * @syscap SystemCapability.Web.Webview.Core
     * @atomicservice
     * @brief getStatusText(): String
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getStatusText(): String {
        unsafe {
            let ret = FfiWebSchemeHandlerResponseGetStatusText(getID())
            throwIfNotSuccess(ret.code, "WebMessageExt", "get status text")
            return getStringAndFree(ret.data)
        }
    }

    /**
     * Get mime type.
     * @returns { String } Return mime type of response.
     * @syscap SystemCapability.Web.Webview.Core
     * @atomicservice
     * @brief getMimeType(): String
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getMimeType(): String {
        unsafe {
            let ret = FfiWebSchemeHandlerResponseGetMimeType(getID())
            throwIfNotSuccess(ret.code, "WebMessageExt", "get mimeType")
            return getStringAndFree(ret.data)
        }
    }

    /**
     * Get the response encoding.
     * @returns { String } Return encoding of response.
     * @syscap SystemCapability.Web.Webview.Core
     * @atomicservice
     * @brief getEncoding(): String
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getEncoding(): String {
        unsafe {
            let ret = FfiWebSchemeHandlerResponseGetEncoding(getID())
            throwIfNotSuccess(ret.code, "WebMessageExt", "get encoding")
            return getStringAndFree(ret.data)
        }
    }

    /**
     * Get the header value by name from the response.
     * @param { String } name - Header name.
     * @returns { String } Return header value by name.
     * @syscap SystemCapability.Web.Webview.Core
     * @atomicservice
     * @brief getHeaderByName(name: String): String
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getHeaderByName(name: String): String {
        unsafe {
            let cname = LibC.mallocCString(name)
            let ret = FfiWebSchemeHandlerResponseGetHeaderByName(getID(), cname)
            LibC.free(cname)
            throwIfNotSuccess(ret.code, "WebMessageExt", "get header by name")
            return getStringAndFree(ret.data)
        }
    }

    /**
     * Get net error code.
     * @returns { WebNetErrorList } Return response error code.
     * @syscap SystemCapability.Web.Webview.Core
     * @atomicservice
     * @brief getNetErrorCode(): WebNetErrorList
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getNetErrorCode(): WebNetErrorList {
        unsafe {
            var code: Int32 = 0
            let errcode = FfiWebSchemeHandlerResponseGetNetErrorCode(getID(), inout code)
            throwIfNotSuccess(code, "WebMessageExt", "get net errorCode")
            return WebNetErrorList.parse(errcode)
        }
    }

    /**
     * Get http status code.
     * @returns { Int32 } Return http status code.
     * @syscap SystemCapability.Web.Webview.Core
     * @atomicservice
     * @brief getStatus(): Int32
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getStatus(): Int32 {
        unsafe {
            var code: Int32 = 0
            let status = FfiWebSchemeHandlerResponseGetStatus(getID(), inout code)
            throwIfNotSuccess(code, "WebMessageExt", "get status")
            return status
        }
    }

    /**
     * Set http status code.
     * @param { Int32 } status - Http status code.
     * @throws { BuniessException} 401 - Invalid input parameter.
     * @syscap SystemCapability.Web.Webview.Core
     * @atomicservice
     * @brief setStatus(status: Int32): Unit
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setStatus(status: Int32): Unit {
        unsafe {
            let errCode = FfiWebSchemeHandlerResponseSetStatus(getID(), status)
            throwIfNotSuccess(errCode, "WebMessageExt", "set status")
        }
    }

    /**
     * Set net error code.
     * @param { WebNetErrorList } code - Set net error code.
     * @throws { BuniessException} 401 - Invalid input parameter.
     * @syscap SystemCapability.Web.Webview.Core
     * @atomicservice
     * @brief setNetErrorCode(code: WebNetErrorList): Unit
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setNetErrorCode(code: WebNetErrorList): Unit {
        unsafe {
            let setCode = code.getValue()
            let errCode = FfiWebSchemeHandlerResponseSetErrorCode(getID(), setCode)
            throwIfNotSuccess(errCode, "WebMessageExt", "set net errorCode")
        }
    }

    /**
     * Set status text.
     * @param { String } statusText - Status text.
     * @throws { BuniessException} 401 - Invalid input parameter.
     * @syscap SystemCapability.Web.Webview.Core
     * @atomicservice
     * @brief setStatusText(statusText: String): Unit
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setStatusText(statusText: String): Unit {
        unsafe {
            let cstatusText = LibC.mallocCString(statusText)
            let errCode = FfiWebSchemeHandlerResponseSetStatusText(getID(), cstatusText)
            LibC.free(cstatusText)
            throwIfNotSuccess(errCode, "WebMessageExt", "set status text")
        }
    }

    /**
     * Set the resolved URL after redirects or changed as a result of HSTS.
     * @param { String } url - Set response url for redirects.
     * @throws { BuniessException} 401 - Invalid input parameter.

     * @syscap SystemCapability.Web.Webview.Core
     * @atomicservice
     * @brief setUrl(url: String): Unit
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setUrl(url: String): Unit {
        unsafe {
            let curl = LibC.mallocCString(url)
            let errCode = FfiWebSchemeHandlerResponseSetUrl(getID(), curl)
            LibC.free(curl)
            throwIfNotSuccess(errCode, "WebMessageExt", "set url")
        }
    }

    /**
     * Set mime type.
     * @param { String } mimeType - Mime type.
     * @throws { BuniessException} 401 - Invalid input parameter.
     * @syscap SystemCapability.Web.Webview.Core
     * @atomicservice
     * @brief setMimeType(mimeType: String): Unit
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setMimeType(mimeType: String): Unit {
        unsafe {
            let cmimeType = LibC.mallocCString(mimeType)
            let errCode = FfiWebSchemeHandlerResponseSetMimeType(getID(), cmimeType)
            LibC.free(cmimeType)
            throwIfNotSuccess(errCode, "WebMessageExt", "set mimeType")
        }
    }

    /**
     * Set the response encoding.
     * @param { String } encoding - Encoding.
     * @throws { BuniessException} 401 - Invalid input parameter.
     * @syscap SystemCapability.Web.Webview.Core
     * @atomicservice
     * @brief setEncoding(encoding: String): Unit
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setEncoding(encoding: String): Unit {
        unsafe {
            let cencoding = LibC.mallocCString(encoding)
            let errCode = FfiWebSchemeHandlerResponseSetEncoding(getID(), cencoding)
            LibC.free(cencoding)
            throwIfNotSuccess(errCode, "WebMessageExt", "set encoding")
        }
    }

    /**
     * Set response hander value by name.
     * @param { String } name - Header name.
     * @param { String } value - Header value.
     * @param { Bool } overwrite - Whether to overwrite.
     * @throws { BuniessException} 401 - Invalid input parameter.
     * @syscap SystemCapability.Web.Webview.Core
     * @atomicservice
     * @brief setHeaderByName(name: String, value: String, overwrite: Bool): Unit
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setHeaderByName(name: String, value: String, overwrite: Bool): Unit {
        unsafe {
            try (
                cname = LibC.mallocCString(name).asResource(),
                cvalue = LibC.mallocCString(value).asResource()
            ) {
                let errCode = FfiWebSchemeHandlerResponseSetHeaderByName(getID(), cname.value, cvalue.value, overwrite)
                throwIfNotSuccess(errCode, "WebMessageExt", "set header by name")
            }
        }
    }
}
