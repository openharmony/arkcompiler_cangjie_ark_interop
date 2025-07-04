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
public class AdsBlockManager {
    /**
     * set Ads Block ruleset file, containing easylist rules.
     * @param {String} rulesFile - absolute file path contains app customized ads block rules.
     * @param {Bool} replace - (@code true)replace internal rules;(@code false) add to internal rules.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief setAdsBlockRules(rulesFile: String, replace: Bool): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func setAdsBlockRules(rulesFile: String, replace: Bool): Unit {
        unsafe {
            let cRulesFile = LibC.mallocCString(rulesFile)
            let errCode = FfiAdsBlockManagerSetAdsBlockRules(cRulesFile, replace)
            LibC.free(cRulesFile)
            throwIfNotSuccess(errCode, "AdsBlockManager", "setAdsBlockRules")
        }
    }

    /**
     * Add items to Ads Block Disallow list.
     * @param { Array<String> } domainSuffixes - list of domain suffix, if web page url matches someone in the list,
     * Ads Block will be disallowed for the web page.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief addAdsBlockDisallowedList(domainSuffixes: Array<String>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func addAdsBlockDisallowedList(domainSuffixes: Array<String>): Unit {
        unsafe {
            let cArrStr = toArrayCString(domainSuffixes)
            let errCode = FfiAdsBlockManagerAddAdsBlockDisallowedList(cArrStr)
            freeArrCString(cArrStr)
            throwIfNotSuccess(errCode, "AdsBlockManager", "addAdsBlockDisallowedList")
        }
    }

    /**
     * remove items from Ads Block Disallowed list.
     * @param { Array<String> } domainSuffixes - list of domain suffix needed be removed from disallow list
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief removeAdsBlockDisallowedList(domainSuffixes: Array<String>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func removeAdsBlockDisallowedList(domainSuffixes: Array<String>): Unit {
        unsafe {
            let cArrStr = toArrayCString(domainSuffixes)
            let errCode = FfiAdsBlockManagerRemoveAdsBlockDisallowedList(cArrStr)
            freeArrCString(cArrStr)
            throwIfNotSuccess(errCode, "AdsBlockManager", "removeAdsBlockDisallowedList")
        }
    }

    /**
     * Add items to Ads Block Allow list.
     * By default, ads block is allowed for all pages unless they are added to the
     * disallow list. The priority of allowlist is higher than the disallowlist. It is
     * used to re-enable ads block on the page that matches disallow list.
     * @param { Array<String> } domainSuffixes - list of domain suffix, if web page url matches someone in the list,
     * Ads Block will be allowed for the web page.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief addAdsBlockAllowedList(domainSuffixes: Array<String>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func addAdsBlockAllowedList(domainSuffixes: Array<String>): Unit {
        unsafe {
            let cArrStr = toArrayCString(domainSuffixes)
            let errCode = FfiAdsBlockManagerAddAdsBlockAllowedList(cArrStr)
            freeArrCString(cArrStr)
            throwIfNotSuccess(errCode, "AdsBlockManager", "addAdsBlockAllowedList")
        }
    }

    /**
     * remove items from Ads Block Allowed list.
     * @param { Array<String> } domainSuffixes - list of domain suffix needed be removed from allow list
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief removeAdsBlockAllowedList(domainSuffixes: Array<String>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func removeAdsBlockAllowedList(domainSuffixes: Array<String>): Unit {
        unsafe {
            let cArrStr = toArrayCString(domainSuffixes)
            let errCode = FfiAdsBlockManagerRemoveAdsBlockAllowedList(cArrStr)
            freeArrCString(cArrStr)
            throwIfNotSuccess(errCode, "AdsBlockManager", "removeAdsBlockAllowedList")
        }
    }

    /**
     * clear Ads Block Allowed list.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief clearAdsBlockAllowedList(): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func clearAdsBlockAllowedList(): Unit {
        unsafe {
            FfiAdsBlockManagerClearAdsBlockAllowedList()
        }
    }

    /**
     * clear Ads Block Disallowed list.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief clearAdsBlockDisallowedList(): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func clearAdsBlockDisallowedList(): Unit {
        unsafe {
            FfiAdsBlockManagerClearAdsBlockDisallowedList()
        }
    }
}
