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

package ohos.bundle_manager

import ohos.ffi.*
import ohos.hilog.*
import ohos.base.*
import std.sync.*
import ohos.labels.*
import std.collection.*

foreign {
    func FfiOHOSGetCallingUid(): Int32

    func FfiOHOSGetBundleInfoForSelfV2(bundleFlags: Int32): RetBundleInfoV2

    func FfiOHOSVerifyAbc(abcPaths: CArrString, deleteOriginalFiles: Bool): Int32

    func FfiGetProfileByExtensionAbility(moduleName: CString, extensionAbilityName: CString, metadataName: CString): RetDataCArrString

    func FfiGetProfileByAbility(moduleName: CString, extensionAbilityName: CString, metadataName: CString): RetDataCArrString

    func FfiBundleManagerCanOpenLink(cLink: CString, code: CPointer<Int32>): Bool

    func FfiOHOSGetBundleInfo(cBundleName: CString, bundleFlags: Int32, userId: Int32, errorCode: CPointer<Int32>): RetBundleInfoV2

    func FfiOHOSFreeRetBundleInfoV2(ret: CPointer<RetBundleInfoV2>): Unit

    func FfiOHOSGetBundleNameByUid(userId: Int32, errorCode: CPointer<Int32>): CString

    func FfiOHOSFreeCString(retCString: CString): Unit
}

var cache = HashMap<BMQuery, BundleInfo>()
let MTX = Mutex()

func checkToCache(uid: Int32, callingUid: Int32, query: BMQuery, bundleInfo: BundleInfo): Unit {
    if (uid != callingUid) {
        return
    }
    synchronized(MTX) {
        cache[query] = bundleInfo
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class BundleManager {

    /**
     * Obtains own bundleInfo.
     *
     *  @param { number } bundleFlags - Indicates the flag used to specify information contained in the BundleInfo objects that will be returned.
     *  @returns { BundleInfo } The result of getting the bundle info.
     *  @brief getBundleInfoForSelfSync(bundleFlags: number): BundleInfo
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public static func getBundleInfoForSelf(bundleFlags: Int32): BundleInfo {
        let uid = unsafe { FfiOHOSGetCallingUid() }
        let bundleName: String = uid.toString()
        let userId = uid / BASE_USER_RANGE
        var info: BundleInfo
        let query = BMQuery(bundleName, GET_BUNDLE_INFO, bundleFlags, userId: userId)
        synchronized(MTX) {
            if (cache.contains(query)) {
                info = cache[BMQuery(bundleName, GET_BUNDLE_INFO, bundleFlags, userId: userId)]
            } else {
                let ret = unsafe { FfiOHOSGetBundleInfoForSelfV2(bundleFlags) }
                info = BundleInfo(ret)
                unsafe { ret.free() }
                checkToCache(info.uid, unsafe { FfiOHOSGetCallingUid() }, query, info)
            }
        }
        return info
    }

    /**
     * Verify abc.
     *
     * @permission ohos.permission.RUN_DYN_CODE
     * @param { Array<String> } abcPaths - The abc path.
     * @param { Bool } deleteOriginalFiles - Used to decide whether to delete the original files.
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - The parameter check failed.
     * @throws { BusinessException } 17700201 - verifyAbc failed.
     * @brief verifyAbc(abcPaths: Array<string>, deleteOriginalFiles: boolean): Promise<void>
     */
    @!APILevel[
        21,
        permission: "ohos.permission.RUN_DYN_CODE",
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    static func verifyAbc(abcPaths: Array<String>, deleteOriginalFiles: Bool): Unit {
        unsafe {
            if (abcPaths.size == 0) {
                throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
            }
            let cArrStr = toArrayCString(abcPaths)
            let cValue = FfiOHOSVerifyAbc(cArrStr, deleteOriginalFiles)
            cArrStr.free()
            if (cValue != SUCCESS_CODE) {
                throw BusinessException(cValue, getErrorMsg(cValue))
            }
        }
    }

    /**
     * Obtains the profile designated by metadata name,
     * extensionAbilityName and moduleName from the current application.
     *
     * @param { String } moduleName - Indicates the moduleName of the application.
     * @param { String } extensionAbilityName - Indicates the extensionAbilityName of the application.
     * @param { String } metadataName - Indicates the name of metadata in ability.
     * @returns { Array<String> } Returns string in json-format of the corresponding config file.
     * @throws { BusinessException } 401 - Input parameters check failed.
     * @throws { BusinessException } 17700002 - The specified moduleName is not existed.
     * @throws { BusinessException } 17700003 - The specified extensionAbilityName not existed.
     * @throws { BusinessException } 17700024 - Failed to get the profile because there is no profile in the HAP.
     * @throws { BusinessException } 17700026 - The specified bundle is disabled.
     * @brief getProfileByExtensionAbilitySync(moduleName: string, extensionAbilityName: string, metadataName?: string): Array<string>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public static func getProfileByExtensionAbility(moduleName: String, extensionAbilityName: String,
        metadataName!: String = ""): Array<String> {
        unsafe {
            var res: Array<String> = []
            try (
                cModuleName = LibC.mallocCString(moduleName).asResource(),
                cExtensionAbilityName = LibC.mallocCString(extensionAbilityName).asResource(),
                cMetadataName = LibC.mallocCString(metadataName).asResource()
            ) {
                let cValue: RetDataCArrString = FfiGetProfileByExtensionAbility(cModuleName.value,
                    cExtensionAbilityName.value, cMetadataName.value)
                if (cValue.code != 0) {
                    throw BusinessException(cValue.code, getErrorMsg(cValue.code))
                }
                res = readArrStr(cValue.data)
                cValue.data.free()
            }
            return res
        }
    }

    /**
     * Obtains the profile designated by metadata name, abilityName and moduleName from the current application.
     *
     * @param { String } moduleName - Indicates the moduleName of the application.
     * @param { String } abilityName - Indicates the abilityName of the application.
     * @param { String } metadataName - Indicates the name of metadata in ability.
     * @returns { Array<String> } Returns string in json-format of the corresponding config file.
     * @throws { BusinessException } 401 - Input parameters check failed.
     * @throws { BusinessException } 17700002 - The specified moduleName is not existed.
     * @throws { BusinessException } 17700003 - The specified abilityName is not existed.
     * @throws { BusinessException } 17700024 - Failed to get the profile because there is no profile in the HAP.
     * @throws { BusinessException } 17700026 - The specified bundle is disabled.
     * @throws { BusinessException } 17700029 - The specified ability is disabled.
     * @brief getProfileByAbilitySync(moduleName: string, abilityName: string, metadataName?: string): Array<string>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public static func getProfileByAbility(moduleName: String, abilityName: String, metadataName!: String = ""): Array<String> {
        unsafe {
            var res: Array<String> = []
            try (
                cModuleName = LibC.mallocCString(moduleName).asResource(),
                cAbilityName = LibC.mallocCString(abilityName).asResource(),
                cMetadataName = LibC.mallocCString(metadataName).asResource()
            ) {
                let cValue: RetDataCArrString = FfiGetProfileByAbility(cModuleName.value, cAbilityName.value,
                    cMetadataName.value)
                if (cValue.code != 0) {
                    throw BusinessException(cValue.code, getErrorMsg(cValue.code))
                }
                res = readArrStr(cValue.data)
                cValue.data.free()
            }
            return res
        }
    }

    /**
     * Check whether the link can be opened.
     *
     * @param { String } link - Indicates the link to be opened.
     * @returns { Bool } Returns true if the link can be opened; returns false otherwise.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types.
     * @throws { BusinessException } 17700055 - The specified link is invalid.
     * @throws { BusinessException } 17700056 - The scheme of the specified link is not in the querySchemes.
     * @brief function canOpenLink(link: string): boolean;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public static func canOpenLink(link: String): Bool {
        unsafe {
            let cLink = LibC.mallocCString(link)
            var code = 0i32
            let ret = FfiBundleManagerCanOpenLink(cLink, inout code)
            LibC.free(cLink)
            if (code != SUCCESS_CODE) {
                throw BusinessException(code, getErrorMsg(code))
            }
            return ret
        }
    }

    /**
     * Obtains bundleInfo based on bundleName, bundleFlags and userId.
     * The application requires to be a system application when requesting the permission of ohos.permission.GET_BUNDLE_INFO.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 17700001 - The specified bundleName is not found.
     * @throws { BusinessException } 17700004 - The specified user ID is not found.
     * @throws { BusinessException } 17700026 - The specified bundle is disabled.
     * @relation function getBundleInfoSync(bundleName: string, bundleFlags: number, userId: number): BundleInfo;
     */
    @!APILevel[
        21,
        permission: "ohos.permission.GET_BUNDLE_INFO_PRIVILEGED" | "ohos.permission.GET_BUNDLE_INFO",
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public static func getBundleInfo(bundleName: String, bundleFlags: Int32, userId!: ?Int32 = None): BundleInfo {
        let userIdParse = match (userId) {
            case Some(id) => id
            case None => unsafe {
                FfiOHOSGetCallingUid() / BASE_USER_RANGE
            }
        }
        var info: BundleInfo
        let query = BMQuery(bundleName, GET_BUNDLE_INFO, bundleFlags, userId: userIdParse)
        synchronized(MTX) {
            if (cache.contains(query)) {
                info = cache[BMQuery(bundleName, GET_BUNDLE_INFO, bundleFlags, userId: userIdParse)]
                return info
            }
        }
        var errCode: Int32 = 0
        unsafe {
            let cBundleName = LibC.mallocCString(bundleName)
            var ret = FfiOHOSGetBundleInfo(cBundleName, bundleFlags, userIdParse, inout errCode)
            LibC.free(cBundleName)
            checkCodeAndThrow(errCode)
            info = BundleInfo(ret)
            FfiOHOSFreeRetBundleInfoV2(inout ret)
            checkToCache(info.uid, FfiOHOSGetCallingUid(), query, info)
        }
        return info
    }

    /**
     * Obtains bundle name by the given uid.
     * The application requires to be a system application when requesting the permission of ohos.permission.GET_BUNDLE_INFO.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 17700021 - The uid is not found.
     * @relation function getBundleNameByUidSync(uid: number): string;
     */
    @!APILevel[
        21,
        permission: "ohos.permission.GET_BUNDLE_INFO_PRIVILEGED" | "ohos.permission.GET_BUNDLE_INFO",
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public static func getBundleNameByUid(uid: Int32): String {
        var errCode: Int32 = 0
        let ret = unsafe {
            FfiOHOSGetBundleNameByUid(uid, inout errCode)
        }
        checkCodeAndThrow(errCode)
        let bundleName = ret.toString()
        unsafe {
            FfiOHOSFreeCString(ret)
        }
        return bundleName
    }
}
