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

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class GeolocationPermissions {
    /**
     * Allow geolocation permissions for specifies source.
     * @param { String } origin - Url source.
     * @param { Bool } incognito - {@code true} Allow geolocation permissions for specifies source
     *                                in incognito mode; {@code false} otherwise.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 17100011 - Invalid origin.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief static allowGeolocation(origin: string, incognito?: boolean): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func allowGeolocation(origin: String, incognito!: Bool = false): Unit {
        var code: Int32 = 0
        unsafe {
            try (cOrigin = LibC.mallocCString(origin).asResource()) {
                FfiOHOSGeolocationAllowGeolocation(cOrigin.value, incognito, inout code)
            }
        }
        throwIfNotSuccess(code, "GeolocationPermissions", "allowGeolocation")
    }

    /**
     * Delete geolocation permissions for specifies source.
     * @param { String } origin - Url source.
     * @param { Bool } incognito - {@code true} delete geolocation permissions for specifies source
     *                                in incognito mode; {@code false} otherwise.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 17100011 - Invalid origin.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief static deleteGeolocation(origin: string, incognito?: boolean): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func deleteGeolocation(origin: String, incognito!: Bool = false): Unit {
        var code: Int32 = 0
        unsafe {
            try (cOrigin = LibC.mallocCString(origin).asResource()) {
                FfiOHOSGeolocationDeleteGeolocation(cOrigin.value, incognito, inout code)
            }
        }
        throwIfNotSuccess(code, "GeolocationPermissions", "deleteGeolocation")
    }

    /**
     * Delete all geolocation permissions.
     *
     * @param { Bool } incognito - {@code true} delete all geolocation in incognito mode;
     *                                {@code false} otherwise.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief static deleteAllGeolocation(incognito?: boolean): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func deleteAllGeolocation(incognito!: Bool = false): Unit {
        var code: Int32 = 0
        unsafe { FfiOHOSGeolocationDeleteAllGeolocation(incognito, inout code) }
        throwIfNotSuccess(code, "GeolocationPermissions", "deleteAllGeolocation")
    }

    /**
     * Gets the geolocation permission status of the specified source.
     * @param { String } origin - Url source.
     * @param { Bool } incognito - {@code true} gets the geolocation permission status of the
     *                                specified source in incognito mode; {@code false} otherwise.
     * @returns { Bool } The permission
     *                   status of the specified source and obtains successfully,
     *                   true for authorization, false for access denial. Failed
     *                   to get, indicating that the permission status of the
     *                   specified source does not exist.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 17100011 - Invalid origin.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief static getAccessibleGeolocation(origin: String, incognito?: boolean): Promise<boolean>
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func getAccessibleGeolocation(origin: String, incognito!: Bool = false): Bool {
        var code: Int32 = 0
        var bool: Bool = false
        unsafe {
            try (cOrigin = LibC.mallocCString(origin).asResource()) {
                bool = FfiOHOSGeolocationGetAccessibleGeolocation(cOrigin.value, incognito, inout code)
            }
        }
        throwIfNotSuccess(code, "GeolocationPermissions", "getAccessibleGeolocation")
        return bool
    }

    /**
     * Get all stored geolocation permission url source.
     * @param { Bool } incognito - {@code true} get all stored geolocation permission url source
     *                                in incognito mode; {@code false} otherwise.
     * @returns { Array<string> } All source information about
     *                                     the stored geolocation permission state.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief static getStoredGeolocation(incognito?: boolean): Promise<Array<string>>
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func getStoredGeolocation(incognito!: Bool = false): Array<String> {
        var code: Int32 = 0
        let arr = unsafe { FfiOHOSGeolocationGetStoredGeolocation(incognito, inout code) }
        throwIfNotSuccess(code, "GeolocationPermissions", "getStoredGeolocation")
        return unsafe { getArrayStringAndFree(arr) }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class BackForwardList <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public prop currentIndex: Int32 {
        get() {
            unsafe {
                var code: Int32 = 0
                let index = FfiOHOSBackForwardListCurrentIndex(getID(), inout code)
                throwIfNotSuccess(code, "BackForwardList", "currentIndex")
                return index
            }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public prop size: Int32 {
        get() {
            unsafe {
                var code: Int32 = 0
                let listSize = FfiOHOSBackForwardListSize(getID(), inout code)
                throwIfNotSuccess(code, "BackForwardList", "size")
                return listSize
            }
        }
    }

    /**
     * Get history entry at given index.
     *
     * @param { Int32 } index Index of back forward list entry.
     * @returns { HistoryItem } HistoryItem at given index in back forward list.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getItemAtIndex(index: number): HistoryItem
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getItemAtIndex(index: Int32): HistoryItem {
        unsafe {
            var code: Int32 = 0
            let item = FfiOHOSGetItemAtIndex(getID(), index, inout code)
            throwIfNotSuccess(code, "BackForwardList", "getItemAtIndex")
            return item.toHistoryItemAndFree()
        }
    }
}
