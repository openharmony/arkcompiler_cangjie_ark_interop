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

package ohos.ability

import ohos.base.*
import ohos.ffi.*
import ohos.resource_manager.*
import ohos.bundle_manager.*
import ohos.eventhub.*
import ohos.labels.*

foreign {
    func FfiContextGetContext(id: Int64, contextType: Int32): CPointer<Unit>

    func FfiContextGetApplicationInfo(id: Int64, contextType: Int32): RetApplicationInfoV2

    func FfiContextGetFilesDir(id: Int64, contextType: Int32): CString

    func FfiContextGetCacheDir(id: Int64, contextType: Int32): CString

    func FfiContextGetTempDir(id: Int64, contextType: Int32): CString

    func FfiContextGetResourceDir(id: Int64, contextType: Int32): CString

    func FfiContextGetDatabaseDir(id: Int64, contextType: Int32): CString

    func FfiContextGetPreferencesDir(id: Int64, contextType: Int32): CString

    func FfiContextGetBundleCodeDir(id: Int64, contextType: Int32): CString

    func FfiContextGetDistributedFilesDir(id: Int64, contextType: Int32): CString

    func FfiContextGetCloudFileDir(id: Int64, contextType: Int32): CString

    func FfiContextGetArea(id: Int64, contextType: Int32): Int32

    func FfiContextGetApplicationContext(): Int64

    func FfiContextGetGroupDir(id: Int64, contextType: Int32, groupId: CString): CString

    func FfiContextCreateModuleContext(id: Int64, contextType: Int32, moduleName: CString): Int64
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public open class Context <: RemoteData {
    private var resourceManager_: ?ResourceManager = None
    private var applicationInfo_: ?ApplicationInfo = None
    private var filesDir_: ?String = None
    private var cacheDir_: ?String = None
    private var tempDir_: ?String = None
    private var resourceDir_: ?String = None
    private var databaseDir_: ?String = None
    private var preferencesDir_: ?String = None
    private var bundleCodeDir_: ?String = None
    private var distributedFilesDir_: ?String = None
    private var cloudFileDir_: ?String = None
    private var area_: ?AreaMode = None
    private static var applicationContext_: ?ApplicationContext = None

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public let eventhub: EventHub = EventHub()

    init(id: Int64) {
        super(id)
    }

    /**
     * Indicates the capability of accessing application resources.
     *
     * @type { ResourceManager }
     * @syscap SystemCapability.Ability.AbilityRuntime.Core
     * @stagemodelonly
     * @crossplatform
     * @atomicservice
     * @brief resourceManager: resmgr.ResourceManager
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop resourceManager: ResourceManager {
        get() {
            match (resourceManager_) {
                case Some(v) => v
                case _ =>
                    let ctx = unsafe { FfiContextGetContext(getID(), 0) }
                    resourceManager_ = ResourceManager.getResourceManager(ctx)
                    resourceManager_.getOrThrow()
            }
        }
    }

    /**
     * Indicates configuration information about an application.
     *
     * @type { ApplicationInfo }
     * @syscap SystemCapability.Ability.AbilityRuntime.Core
     * @stagemodelonly
     * @crossplatform
     * @atomicservice
     * @brief applicationInfo: ApplicationInfo
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop applicationInfo: ApplicationInfo {
        get() {
            match (applicationInfo_) {
                case Some(v) => v
                case _ => unsafe {
                    let retApplicationInfo = FfiContextGetApplicationInfo(getID(), 0)
                    applicationInfo_ = ApplicationInfo(retApplicationInfo)
                    retApplicationInfo.free()
                    return applicationInfo_.getOrThrow()
                }
            }
        }
    }

    /**
     * Indicates app files dir.
     *
     * @type { String }
     * @syscap SystemCapability.Ability.AbilityRuntime.Core
     * @stagemodelonly
     * @crossplatform
     * @atomicservice
     * @brief filesDir: String
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop filesDirectory: String {
        get() {
            match (filesDir_) {
                case Some(v) => v
                case _ =>
                    unsafe {
                        let cString = FfiContextGetFilesDir(getID(), 0)
                        filesDir_ = cString.toString()
                        LibC.free(cString)
                    }
                    filesDir_.getOrThrow()
            }
        }
    }

    /**
     * Indicates app cache dir.
     *
     * @type { String }
     * @syscap SystemCapability.Ability.AbilityRuntime.Core
     * @stagemodelonly
     * @crossplatform
     * @atomicservice
     * @brief cacheDir: string
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop cacheDir: String {
        get() {
            match (cacheDir_) {
                case Some(v) => v
                case _ =>
                    unsafe {
                        let cString = FfiContextGetCacheDir(getID(), 0)
                        cacheDir_ = cString.toString()
                        LibC.free(cString)
                    }
                    cacheDir_.getOrThrow()
            }
        }
    }

    /**
     * Indicates app temp dir.
     *
     * @type { String }
     * @syscap SystemCapability.Ability.AbilityRuntime.Core
     * @stagemodelonly
     * @crossplatform
     * @atomicservice
     * @brief tempDir: string
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop tempDir: String {
        get() {
            match (tempDir_) {
                case Some(v) => v
                case _ =>
                    unsafe {
                        let cString = FfiContextGetTempDir(getID(), 0)
                        tempDir_ = cString.toString()
                        LibC.free(cString)
                    }
                    tempDir_.getOrThrow()
            }
        }
    }

    /**
     * Indicates app bundle resource dir.
     *
     * @type { String }
     * @syscap SystemCapability.Ability.AbilityRuntime.Core
     * @stagemodelonly
     * @crossplatform
     * @atomicservice
     * @brief resourceDir: string
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop resourceDir: String {
        get() {
            match (resourceDir_) {
                case Some(v) => v
                case _ =>
                    unsafe {
                        let cString = FfiContextGetResourceDir(getID(), 0)
                        resourceDir_ = cString.toString()
                        LibC.free(cString)
                    }
                    resourceDir_.getOrThrow()
            }
        }
    }

    /**
     * Indicates app database dir.
     *
     * @type { String }
     * @syscap SystemCapability.Ability.AbilityRuntime.Core
     * @stagemodelonly
     * @crossplatform
     * @atomicservice
     * @brief databaseDir: String
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop databaseDir: String {
        get() {
            match (databaseDir_) {
                case Some(v) => v
                case _ =>
                    unsafe {
                        let cString = FfiContextGetDatabaseDir(getID(), 0)
                        databaseDir_ = cString.toString()
                        LibC.free(cString)
                    }
                    databaseDir_.getOrThrow()
            }
        }
    }

    /**
     * Indicates app preferences dir.
     *
     * @type { String }
     * @syscap SystemCapability.Ability.AbilityRuntime.Core
     * @stagemodelonly
     * @crossplatform
     * @atomicservice
     * @brief preferencesDir: string
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop preferencesDir: String {
        get() {
            match (preferencesDir_) {
                case Some(v) => v
                case _ =>
                    unsafe {
                        let cString = FfiContextGetPreferencesDir(getID(), 0)
                        preferencesDir_ = cString.toString()
                        LibC.free(cString)
                    }
                    preferencesDir_.getOrThrow()
            }
        }
    }

    /**
     * Indicates app bundle code dir.
     *
     * @type { String }
     * @syscap SystemCapability.Ability.AbilityRuntime.Core
     * @stagemodelonly
     * @crossplatform
     * @atomicservice
     * @brief bundleCodeDir: string
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop bundleCodeDir: String {
        get() {
            match (bundleCodeDir_) {
                case Some(v) => v
                case _ =>
                    unsafe {
                        let cString = FfiContextGetBundleCodeDir(getID(), 0)
                        bundleCodeDir_ = cString.toString()
                        LibC.free(cString)
                    }
                    bundleCodeDir_.getOrThrow()
            }
        }
    }

    /**
     * Indicates app distributed files dir.
     *
     * @type { String }
     * @syscap SystemCapability.Ability.AbilityRuntime.Core
     * @stagemodelonly
     * @atomicservice
     * @brief distributedFilesDir: string
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop distributedFilesDir: String {
        get() {
            match (distributedFilesDir_) {
                case Some(v) => v
                case _ =>
                    unsafe {
                        let cString = FfiContextGetDistributedFilesDir(getID(), 0)
                        distributedFilesDir_ = cString.toString()
                        LibC.free(cString)
                    }
                    distributedFilesDir_.getOrThrow()
            }
        }
    }

    /**
     * Indicates app cloud storage files dir.
     *
     * @type { String }
     * @syscap SystemCapability.Ability.AbilityRuntime.Core
     * @stagemodelonly
     * @atomicservice
     * @brief cloudFileDir: string
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop cloudFileDir: String {
        get() {
            match (cloudFileDir_) {
                case Some(v) => v
                case _ =>
                    unsafe {
                        let cString = FfiContextGetCloudFileDir(getID(), 0)
                        cloudFileDir_ = cString.toString()
                        LibC.free(cString)
                    }
                    cloudFileDir_.getOrThrow()
            }
        }
    }

    /**
     * Indicates file area.
     *
     * @type { AreaMode }
     * @syscap SystemCapability.Ability.AbilityRuntime.Core
     * @stagemodelonly
     * @brief area: contextConstant.AreaMode
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop area: AreaMode {
        get() {
            match (area_) {
                case Some(v) => v
                case _ =>
                    unsafe {
                        let areaCode = FfiContextGetArea(getID(), 0)
                        try {
                            area_ = AreaMode.parse(areaCode)
                        } catch (e: Exception) {
                            throw BusinessException(ERROR_CODE_INVALID_CONTEXT, getErrorMsg(ERROR_CODE_INVALID_CONTEXT))
                        }
                    }
                    area_.getOrThrow()
            }
        }
    }

    /**
     * Get application context
     *
     * @returns { ApplicationContext } Returns the application context.
     * @syscap SystemCapability.Ability.AbilityRuntime.Core
     * @stagemodelonly
     * @crossplatform
     * @atomicservice
     * @brief getApplicationContext(): ApplicationContext
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func getApplicationContext(): ApplicationContext {
        match (applicationContext_) {
            case Some(v) => v
            case _ => unsafe {
                let id = FfiContextGetApplicationContext()
                if (id < 0) {
                    throw BusinessException(ERROR_CODE_INVALID_CONTEXT, getErrorMsg(ERROR_CODE_INVALID_CONTEXT))
                }
                applicationContext_ = ApplicationContext(id)
                return applicationContext_.getOrThrow()
            }
        }
    }

    /**
     * Get group dir by the groupId.
     *
     * @param { String } dataGroupID - Indicates the groupId.
     * @returns { String } The getGroupDir.
     * @throws { BusinessError } 401 - Parameter error. Possible causes: 1.Mandatory parameters are left unspecified. 2.Incorrect parameter types.
     * @throws { BusinessError } 16000011 - The context does not exist.
     * @syscap SystemCapability.Ability.AbilityRuntime.Core
     * @stagemodelonly
     * @atomicservice
     * @brief getGroupDir(dataGroupID: string): Promise<string>
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func getGroupDir(dataGroupID: String): String {
        unsafe {
            var cGroupDir = CString(CPointer())
            try (cDataGroupID = LibC.mallocCString(dataGroupID).asResource()) {
                cGroupDir = FfiContextGetGroupDir(getID(), 0, cDataGroupID.value)
            }
            let groupDir = cGroupDir.toString()
            LibC.free(cGroupDir)
            return groupDir
        }
    }

    /**
     * Create a module context
     *
     * @param { String } moduleName - Indicates the module name.
     * @returns { Context } Returns the application context.
     * @throws { BusinessError } 401 - Parameter error. Possible causes: 1.Mandatory parameters are left unspecified. 2.Incorrect parameter types.
     * @syscap SystemCapability.Ability.AbilityRuntime.Core
     * @stagemodelonly
     * @crossplatform
     * @atomicservice
     * @brief createModuleContext(moduleName: string): Context
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        deprecated: 12,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func createModuleContext(moduleName: String): Context {
        unsafe {
            var contextId = -1
            try (cModuleName = LibC.mallocCString(moduleName).asResource()) {
                contextId = FfiContextCreateModuleContext(getID(), 0, cModuleName.value)
            }
            if (contextId < 0) {
                if (contextId == Int64(-INVALID_PARA)) {
                    throw BusinessException(INVALID_PARA, getErrorMsg(INVALID_PARA))
                }
                throw BusinessException(ERROR_CODE_INVALID_CONTEXT, getErrorMsg(ERROR_CODE_INVALID_CONTEXT))
            }
            return Context(contextId)
        }
    }
}
