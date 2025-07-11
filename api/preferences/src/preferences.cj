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

package ohos.preferences

import ohos.ffi.*
import ohos.hilog.*
import ohos.base.*
import std.sync.*
import std.collection.*
import ohos.labels.*

let PREFERENCES_LOG = HilogChannel(0, 0xD002B25, "CJ-Preferences")

type StageContext = CPointer<Unit>

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
]
public class Preferences <: RemoteDataLite {
    let callbackList = ArrayList<(CallbackObject, Int64)>()
    let onOffMutex = Mutex()
    init(context: StageContext, name: String, dataGroupId: String) {
        super(
            unsafe {
                var codeId = 0i64
                try (
                    cName = LibC.mallocCString(name).asResource(),
                    cDataGroupId = LibC.mallocCString(dataGroupId).asResource()
                ) {
                    var errCode = 0i32
                    codeId = FfiOHOSPreferencesGetPreferences(context, cName.value, cDataGroupId.value, inout errCode)
                    if (errCode != SUCCESS_CODE) {
                        PREFERENCES_LOG.error(
                            "Preferences getPreferences failed: ${getCJErrorMsg(errCode)}${getNativeErrorMsg(errCode)} code: ${getCJErrorCode(errCode)} nativeErrorCode: ${errCode}"
                        )
                        throw BusinessException(getCJErrorCode(errCode),
                            "Preferences getPreferences failed: ${getCJErrorMsg(errCode)}")
                    }
                }
                codeId
            })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * @brief getPreferences(context: Context, name: string, callback: AsyncCallback<Preferences>): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public static func getPreferences(context: StageContext, name: String): Preferences {
        return Preferences(context, name, String.empty)
    }

    /**
     * @brief getPreferencesSync(context: Context, options: Options): Preferences
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public static func getPreferences(context: StageContext, options: Options): Preferences {
        return Preferences(context, options.name, options.dataGroupId)
    }

    /**
     * @brief deletePreferences(context: Context, name: string, callback: AsyncCallback<Preferences>): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public static func deletePreferences(context: StageContext, name: String): Unit {
        deletePreferences(context, Options(name))
    }

    /**
     * @brief deletePreferences(context: Context, options: Options): Promise<void>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public static func deletePreferences(context: StageContext, options: Options): Unit {
        var errCode: Int32 = 0
        unsafe {
            try (
                cName = LibC.mallocCString(options.name).asResource(),
                cDataGroupId = LibC.mallocCString(options.dataGroupId).asResource()
            ) {
                errCode = FfiOHOSPreferencesDeletePreferences(context, cName.value, cDataGroupId.value)
            }
        }
        if (errCode != SUCCESS_CODE) {
            PREFERENCES_LOG.error(
                "Preferences deletePreferences failed: ${getCJErrorMsg(errCode)}${getNativeErrorMsg(errCode)} code: ${getCJErrorCode(errCode)} nativeErrorCode: ${errCode}"
            )
            throw BusinessException(getCJErrorCode(errCode),
                "Preferences deletePreferences failed: ${getCJErrorMsg(errCode)}")
        }
    }

    /**
     * @brief removePreferencesFromCacheSync(context: Context, name: string): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public static func removePreferencesFromCache(context: StageContext, name: String): Unit {
        removePreferencesFromCache(context, Options(name))
    }

    /**
     * @brief removePreferencesFromCache(context: Context, options: Options): Promise<void>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public static func removePreferencesFromCache(context: StageContext, options: Options): Unit {
        var errCode: Int32 = 0
        unsafe {
            try (
                cName = LibC.mallocCString(options.name).asResource(),
                cDataGroupId = LibC.mallocCString(options.dataGroupId).asResource()
            ) {
                errCode = FfiOHOSPreferencesRemovePreferencesFromCache(context, cName.value, cDataGroupId.value)
            }
        }
        if (errCode != SUCCESS_CODE) {
            PREFERENCES_LOG.error(
                "Preferences removePreferencesFromCache failed: ${getCJErrorMsg(errCode)}${getNativeErrorMsg(errCode)} code: ${getCJErrorCode(errCode)} nativeErrorCode: ${errCode}"
            )
            throw BusinessException(getCJErrorCode(errCode),
                "Preferences removePreferencesFromCache failed: ${getCJErrorMsg(errCode)}")
        }
    }

    /**
     * @brief flush(): Promise<void>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public func flush(): Unit {
        unsafe { FfiOHOSPreferencesFlush(getID()) }
    }

    /**
     * @brief clear(): Promise<void>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public func clear(): Unit {
        unsafe { FfiOHOSPreferencesClear(getID()) }
    }

    /**
     * @brief getSync(key: string, defValue: ValueType): ValueType
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public func get(key: String, defValue: ValueType): ValueType {
        unsafe {
            var result = ValueType.integer(0)
            try (cKey = LibC.mallocCString(key).asResource()) {
                let cDefValue = CPreferencesValueType(defValue)
                let cPreferencesValueType = FfiOHOSPreferencesGet(getID(), cKey.value, cDefValue)
                cDefValue.free()
                result = CPreferencesValueType.parse(cPreferencesValueType)
                cPreferencesValueType.free()
            }
            return result
        }
    }

    /**
     * @brief putSync(key: string, value: ValueType): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public func put(key: String, value: ValueType): Unit {
        unsafe {
            try (cKey = LibC.mallocCString(key).asResource()) {
                let cValue = CPreferencesValueType(value)
                let errCode = FfiOHOSPreferencesPut(getID(), cKey.value, cValue)
                cValue.free()
                if (errCode != SUCCESS_CODE) {
                    PREFERENCES_LOG.error(
                        "Preferences put failed: ${getCJErrorMsg(errCode)}${getNativeErrorMsg(errCode)} code: ${getCJErrorCode(errCode)} nativeErrorCode: ${errCode}"
                    )
                    throw BusinessException(getCJErrorCode(errCode), "Preferences put failed: ${getCJErrorMsg(errCode)}"
                    )
                }
            }
        }
    }

    /**
     * @brief getAllSync(): Object
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public func getAll(): HashMap<String, ValueType> {
        unsafe {
            let cValues = FfiOHOSPreferencesGetAll(getID())
            let result = CPreferencesValueTypes.parse(cValues)
            cValues.free()
            return result
        }
    }

    /**
     * @brief deleteSync(key: string): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public func delete(key: String): Unit {
        unsafe {
            try (cKey = LibC.mallocCString(key).asResource()) {
                let errCode = FfiOHOSPreferencesDelete(getID(), cKey.value)
                if (errCode != SUCCESS_CODE) {
                    PREFERENCES_LOG.error(
                        "Preferences delete failed: ${getCJErrorMsg(errCode)}${getNativeErrorMsg(errCode)} code: ${getCJErrorCode(errCode)} nativeErrorCode: ${errCode}"
                    )
                    throw BusinessException(getCJErrorCode(errCode),
                        "Preferences delete failed: ${getCJErrorMsg(errCode)}")
                }
            }
        }
    }

    /**
     * @brief hasSync(key: string): boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public func has(key: String): Bool {
        unsafe {
            var result = true
            try (cKey = LibC.mallocCString(key).asResource()) {
                result = FfiOHOSPreferencesHas(getID(), cKey.value)
            }
            return result
        }
    }

    private func checkType(tp: String): Unit {
        if (tp != "change" && tp != "multiProcessChange") {
            throw BusinessException(ERR_PARAMETER_ERROR, MESSAGE_TPYE_ERROR)
        }
    }

    /**
     * @brief on(type: ‘change’, callback: ( key : string ) => void): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public func on(tp: String, callback: Callback1Argument<String>): Unit {
        checkType(tp)
        synchronized(onOffMutex) {
            for (item in callbackList) {
                if (refEq(callback, item[0])) {
                    PREFERENCES_LOG.error("Preferences on failed: The same function is registered.")
                    return
                }
            }
            unsafe {
                let wrapper = {value: CString => callback.invoke(value.toString())}
                let lambdaData = Callback1Param<CString, Unit>(wrapper)
                try (ctp = LibC.mallocCString(tp).asResource()) {
                    let errCode = FfiOHOSPreferencesOn(getID(), ctp.value, lambdaData.getID())
                    if (errCode != SUCCESS_CODE) {
                        PREFERENCES_LOG.error(
                            "Preferences on failed: ${getCJErrorMsg(errCode)}${getNativeErrorMsg(errCode)} code: ${getCJErrorCode(errCode)} nativeErrorCode: ${errCode}"
                        )
                        throw BusinessException(getCJErrorCode(errCode),
                            "Preferences on failed: ${getCJErrorMsg(errCode)}")
                    }
                    callbackList.add((callback, lambdaData.getID()))
                }
            }
        }
    }

    /**
     * @brief off(type: ‘change’, callback?: ( key : string ) => void): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public func off(tp: String, callback: Callback1Argument<String>): Unit {
        checkType(tp)
        let funcId = Box<Int64>(0)
        synchronized(onOffMutex) {
            callbackList.removeIf {
                item => if (refEq(callback, item[0])) {
                    funcId.value = item[1]
                    true
                } else {
                    false
                }
            }
        }
        if (funcId.value == 0) {
            return
        }
        unsafe {
            try (ctp = LibC.mallocCString(tp).asResource()) {
                let errCode = FfiOHOSPreferencesOff(getID(), ctp.value, funcId.value)
                if (errCode != SUCCESS_CODE) {
                    PREFERENCES_LOG.error(
                        "Preferences off failed: ${getCJErrorMsg(errCode)}${getNativeErrorMsg(errCode)} code: ${getCJErrorCode(errCode)} nativeErrorCode: ${errCode}"
                    )
                    throw BusinessException(getCJErrorCode(errCode), "Preferences off failed: ${getCJErrorMsg(errCode)}"
                    )
                }
            }
        }
    }

    /**
     * @brief off(type: ‘change’, callback?: ( key : string ) => void): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public func off(tp: String): Unit {
        checkType(tp)
        unsafe {
            try (ctp = LibC.mallocCString(tp).asResource()) {
                let errCode = FfiOHOSPreferencesOffAll(getID(), ctp.value)
                if (errCode != SUCCESS_CODE) {
                    PREFERENCES_LOG.error(
                        "Preferences off failed: ${getCJErrorMsg(errCode)}${getNativeErrorMsg(errCode)} code: ${getCJErrorCode(errCode)} nativeErrorCode: ${errCode}"
                    )
                    throw BusinessException(getCJErrorCode(errCode), "Preferences off failed: ${getCJErrorMsg(errCode)}"
                    )
                }
            }
        }
        synchronized(onOffMutex) {
            callbackList.clear()
        }
    }
}
