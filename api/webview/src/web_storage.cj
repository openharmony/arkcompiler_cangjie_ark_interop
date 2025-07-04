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
import std.collection.*

/**
 * Provides methods for managing web storage
 *
 * @syscap SystemCapability.Web.Webview.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class WebStorage {
    /**
     * Delete the storage data with the origin.
     *
     * @param { String } origin - The origin which to be deleted.
     * @throws { BusinessException } 17100011 - Invalid origin.
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func deleteOrigin(origin: String): Unit {
        unsafe {
            let c_origin = LibC.mallocCString(origin)
            let errCode = FfiWebStorageDeleteOrigin(c_origin)
            LibC.free(c_origin)
            if (errCode != 0) {
                throw BusinessException(errCode, "Failed to delete origin: ${getErrorMsg(errCode)}")
            }
        }
    }

    /**
     * Delete all the storage data.
     *
     * @param { Bool } incognito - {@code true} delete all the storage data in incognito mode;
     *                                {@code false} otherwise.
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func deleteAllData(incognito!: Bool = false): Unit {
        unsafe {
            FfiWebStorageDeleteAllData(incognito)
        }
    }

    /**
     * Get the web amount of storage with the origin.
     * @param { String } origin -  The origin which to be inquired.
     * @param { Int64 } callback - the callback of getOriginUsage.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 17100011 - Invalid origin.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief static getOriginUsage(origin: string, callback: AsyncCallback<number>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func getOriginUsage(origin: String, callback: AsyncCallback<Int64>): Unit {
        unsafe {
            spawn {
                var code: Int32 = 0
                var result: Int64 = 0
                try (cOrigin = LibC.mallocCString(origin).asResource()) {
                    result = FfiWebStorageGetOriginUsage(cOrigin.value, inout code)
                }
                if (code != 0) {
                    callback(AsyncError(code), None)
                } else {
                    callback(None, result)
                }
            }
        }
    }

    /**
     * Get the web storage quota with the origin.
     * @param { String } origin -  The origin which to be inquired.
     * @param { Int64 } callback - the callback of getOriginUsage.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 17100011 - Invalid origin.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief static getOriginQuota(origin: string, callback: AsyncCallback<number>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func getOriginQuota(origin: String, callback: AsyncCallback<Int64>): Unit {
        unsafe {
            spawn {
                var code: Int32 = 0
                var result: Int64 = 0
                try (cOrigin = LibC.mallocCString(origin).asResource()) {
                    result = FfiWebStorageGetOriginQuota(cOrigin.value, inout code)
                }
                if (code != 0) {
                    callback(AsyncError(code), None)
                } else {
                    callback(None, result)
                }
            }
        }
    }

    /**
     * Get current all the web storage origins.
     * @returns { Promise<Array<WebStorageOrigin>> } - returns all the WebStorageOrigin.
     * @throws { BusinessError } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessError } 17100012 - Invalid web storage origin.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief static getOrigins(): Promise<Array<WebStorageOrigin>>
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func getOrigins(callback: AsyncCallback<Array<WebStorageOrigin>>): Unit {
        unsafe {
            spawn {
                var code: Int32 = 0
                let result = FfiWebStorageGetOrigins(inout code)
                if (code != 0) {
                    callback(AsyncError(code), None)
                } else {
                    callback(None, result.toArrWebStorageOriginAndFree())
                }
            }
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class WebStorageOrigin {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public WebStorageOrigin(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public var origin: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public var quota: Int64,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public var usage: Int64
    ) {}
}
