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

const MAX_STRING_LENGTH: Int64 = 40960

/**
 * Provides methods for managing the web cookies.
 *
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class WebCookieManager {
    /**
     * Gets all cookies for the given URL.
     *
     * @param { String } url - The URL for which the cookies are requested.
     * @param { Bool } incognito - {@code true} gets all cookies for the given URL
     *                                in incognito mode; {@code false} otherwise.
     * @returns { string } - The cookie value for the given URL.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @throws { BusinessException } 17100002 - Invalid url.
     * @brief static fetchCookieSync(url: string, incognito?: boolean): string
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func fetchCookie(url: String, incognito!: Bool = false): String {
        if (url.size > MAX_STRING_LENGTH) {
            throw BusinessException(ERR_PARAMETER_ERROR,
                "WebCookieManager fetchCookieSync failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
        var cookie: String = ""
        var errCode: Int32 = 0
        unsafe {
            let curl = LibC.mallocCString(url)
            let cvalue = FfiOHOSCookieMgrFetchCookieSync(curl, incognito, inout errCode)
            try {
                throwIfNotSuccess(errCode, "WebCookieManager", "fetchCookie")
                cookie = cvalue.toString()
            } finally {
                LibC.free(curl)
                LibC.free(cvalue)
            }
        }
        return cookie
    }

    /**
     * Set a single cookie (key-value pair) for the given URL.
     *
     * @param { String } url - The URL for which the cookie is to be set.
     * @param { String } value - The cookie as a string, using the format of the 'Set-Cookie' HTTP response header.
     * @param { Bool } incognito - {@code true} gets all cookies for the given URL
     *                                in incognito mode; {@code false} otherwise.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @throws { BusinessException } 17100002 - Invalid url.
     * @throws { BusinessException } 17100005 - Invalid cookie value.
     * @brief static configCookieSync(url: string, value: string, incognito?: boolean): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func configCookie(url: String, value: String, incognito!: Bool = false): Unit {
        if (url.size > MAX_STRING_LENGTH || value.size > MAX_STRING_LENGTH) {
            throw BusinessException(ERR_PARAMETER_ERROR,
                "WebCookieManager configCookieSync failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
        unsafe {
            var errCode: Int32 = 0
            try (
                curl = LibC.mallocCString(url).asResource(),
                cvalue = LibC.mallocCString(value).asResource()
            ) {
                errCode = FfiOHOSCookieMgrConfigCookieSync(curl.value, cvalue.value, incognito)
            }
            throwIfNotSuccess(errCode, "WebCookieManager", "configCookie")
        }
    }

    /**
     * Set a single cookie (key-value pair) for the given URL.
     *
     * @param { String } url - The URL for which the cookie is to be set.
     * @param { String } value - The cookie as a string, using the format of the 'Set-Cookie' HTTP response header.
     * @param { Bool } incognito - {@code true} gets all cookies for the given URL
     *                                in incognito mode; {@code false} otherwise.
     * @param { Bool } includeHttpOnly - {@code true} HTTP-only cookies can also be overwritten;
     *                                      {@code false} otherwise.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @throws { BusinessException } 17100002 - Invalid url.
     * @throws { BusinessException } 17100005 - Invalid cookie value.
     * @relation static configCookieSync(url: string, value: string, incognito: boolean, includeHttpOnly: boolean): void;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func configCookie(url: String, value: String, incognito!: Bool, includeHttpOnly!: Bool): Unit {
        if (url.size > MAX_STRING_LENGTH || value.size > MAX_STRING_LENGTH) {
            throw BusinessException(ERR_PARAMETER_ERROR, "Invalid input parameter: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
        var errCode: Int32 = 0
        unsafe {
            try (curl = LibC.mallocCString(url).asResource(), cvalue = LibC.mallocCString(value).asResource()) {
                errCode = FfiOHOSCookieMgrCfgCookieSync(curl.value, cvalue.value, incognito, includeHttpOnly)
            }
        }
        throwIfNotSuccess(errCode, "WebCookieManager", "configCookie")
    }

    /**
     * Set whether the instance should send and accept cookies.
     * By default this is set to be true.
     *
     * @param { Bool } accept - Whether the instance should send and accept cookies.
     * @brief static putAcceptCookieEnabled(accept: boolean): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func putAcceptCookieEnabled(accept: Bool): Unit {
        unsafe {
            FfiOHOSCookieMgrPutAcceptCookieEnabled(accept)
        }
    }

    /**
     * Get whether the instance can send and accept cookies.
     *
     * @returns { Bool } True if the instance can send and accept cookies else false.
     * @brief static isCookieAllowed(): boolean
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func isCookieAllowed(): Bool {
        unsafe {
            return FfiOHOSCookieMgrIsCookieAllowed()
        }
    }

    /**
     * Set whether the instance should send and accept cookies.
     * By default this is set to be true.
     *
     * @param { Bool } accept - Whether the instance should send and accept cookies.
     * @brief static putAcceptCookieEnabled(accept: boolean): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func putAcceptThirdPartyCookieEnabled(accept: Bool): Unit {
        unsafe {
            FfiOHOSCookieMgrPutAcceptThirdPartyCookieEnabled(accept)
        }
    }

    /**
     * Get whether the instance can send and accept thirdparty cookies.
     *
     * @returns { Bool } True if the instance can send and accept thirdparty cookies else false.
     * @brief static isThirdPartyCookieAllowed(): boolean
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func isThirdPartyCookieAllowed(): Bool {
        unsafe {
            return FfiOHOSCookieMgrIsThirdPartyCookieAllowed()
        }
    }

    /**
     * Check whether exists any cookies.
     *
     * @param { Bool } incognito - {@code true} check whether exists any cookies.
     *                                in incognito mode; {@code false} otherwise.
     * @returns { Bool } True if exists more than one cookie else false;
     * @brief static existCookie(incognito?: boolean): boolean
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func existCookie(incognito!: Bool = false): Bool {
        unsafe {
            return FfiOHOSCookieMgrExistCookie(incognito)
        }
    }

    /**
     * Remove all cookies.
     *
     * @param { Bool } incognito - {@code true} remove all cookies in incognito mode;
     *                                {@code false} otherwise.
     * @brief static clearAllCookiesSync(incognito?: boolean): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func clearAllCookies(incognito!: Bool = false): Unit {
        unsafe {
            FfiOHOSCookieMgrClearAllCookiesSync(incognito)
        }
    }

    /**
     * Delete the session cookies.
     * @brief static clearSessionCookieSync(): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func clearSessionCookie(): Unit {
        unsafe {
            FfiOHOSCookieMgrClearSessionCookieSync()
        }
    }

    /**
     * Save the cookies Asynchronously.
     * @brief static saveCookieAsync(callback: AsyncCallback<void>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func saveCookie(callback: () -> Unit): Unit {
        unsafe {
            let lambdaData = Callback0Param<Unit>(callback)
            FfiOHOSCookieMgrSaveCookieAsync(lambdaData.getID())
        }
    }
}
