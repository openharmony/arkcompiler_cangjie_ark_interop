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

class ContextImpl {}

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
    private let impl_: ContextImpl = ContextImpl()

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
    public prop filesDir: String {
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
    public mut prop area: AreaMode {
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

        set(area) {
            area_ = area
        }
    }
}
