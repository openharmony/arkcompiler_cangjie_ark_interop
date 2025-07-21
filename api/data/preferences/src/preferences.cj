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

package ohos.data.preferences

import ohos.ffi.*
import ohos.hilog.*
import ohos.base.*
import ohos.app.ability.ui_ability.{UIAbilityContext, getStageContext}
import std.sync.*
import std.collection.*
import ohos.labels.*

let PREFERENCES_LOG = HilogChannel(0, 0xD002B25, "CJ-Preferences")

type StageContext = CPointer<Unit>

/**
 * Provides interfaces to obtain and modify preferences data.
 *
 * @relation interface Preferences
 */
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
     * Obtains a {@link Preferences} instance matching a specified preferences file name.
     *
     * @param { UIAbilityContext } context - Indicates the context of application or capability.
     * @param { String } name - Indicates the preferences file name.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     * <br>1. Mandatory parameters are left unspecified; <br>2. Incorrect parameter types;
     * <br>3. Parameter verification failed.
     * @throws { BusinessException } 15500000 - Inner error.
     * @relation function getPreferences(context: Context, name: string, callback: AsyncCallback<Preferences>): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public static func getPreferences(context: UIAbilityContext, name: String): Preferences {
        let stageContext = getStageContext(context)
        if (stageContext.isNull()) {
            throw BusinessException(ERR_PARAMETER_ERROR, getCJErrorMsg(ERR_PARAMETER_ERROR))
        }
        return Preferences(stageContext, name, String.empty)
    }

    /**
     * Obtains a {@link Preferences} instance matching a specified preferences file name.
     *
     * @param { UIAbilityContext } context - Indicates the context of application or capability.
     * @param { Options } options - Indicates the {@link Options} option of preferences file position.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     * <br>1. Mandatory parameters are left unspecified; <br>2. Incorrect parameter types;
     * <br>3. Parameter verification failed.
     * @throws { BusinessException } 15500000 - Inner error.
     * @relation function getPreferences(context: Context, options: Options, callback: AsyncCallback<Preferences>): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public static func getPreferences(context: UIAbilityContext, options: Options): Preferences {
        let stageContext = getStageContext(context)
        if (stageContext.isNull()) {
            throw BusinessException(ERR_PARAMETER_ERROR, getCJErrorMsg(ERR_PARAMETER_ERROR))
        }
        return Preferences(stageContext, options.name, options.dataGroupId)
    }

    /**
     * Deletes a {@link Preferences} instance matching a specified preferences file name.
     *
     * @param { UIAbilityContext } context - Indicates the context of application or capability.
     * @param { String } name - Indicates the preferences file name.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     * <br>1. Mandatory parameters are left unspecified; <br>2. Incorrect parameter types;
     * <br>3. Parameter verification failed.
     * @throws { BusinessException } 15500000 - Inner error.
     * @throws { BusinessException } 15500010 - Failed to delete the user preferences persistence file.
     * @relation function deletePreferences(context: Context, name: string): Promise<void>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public static func deletePreferences(context: UIAbilityContext, name: String): Unit {
        deletePreferences(context, Options(name))
    }

    /**
     * Deletes a {@link Preferences} instance matching a specified preferences file name.
     *
     * @param { UIAbilityContext } context - Indicates the context of application or capability.
     * @param { Options } options - Indicates the {@link Options} option of preferences file position.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     * <br>1. Mandatory parameters are left unspecified; <br>2. Incorrect parameter types;
     * <br>3. Parameter verification failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @throws { BusinessException } 15500010 - Failed to delete the user preferences persistence file.
     * @throws { BusinessException } 15501001 - The operations is supported in stage mode only.
     * @throws { BusinessException } 15501002 - Invalid dataGroupId.
     * @relation function deletePreferences(context: Context, options: Options): Promise<void>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public static func deletePreferences(context: UIAbilityContext, options: Options): Unit {
        let stageContext = getStageContext(context)
        if (stageContext.isNull()) {
            throw BusinessException(ERR_PARAMETER_ERROR, getCJErrorMsg(ERR_PARAMETER_ERROR))
        }
        var errCode: Int32 = 0
        unsafe {
            try (
                cName = LibC.mallocCString(options.name).asResource(),
                cDataGroupId = LibC.mallocCString(options.dataGroupId).asResource()
            ) {
                errCode = FfiOHOSPreferencesDeletePreferences(stageContext, cName.value, cDataGroupId.value)
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
     * Deletes a {@link Preferences} instance matching a specified preferences file name
     * from the cache. This interface is executed synchronously.
     * <p>When deleting the {@link Preferences} instance, you must release all references
     * of the instance. In addition, do not use the instance to perform data operations. Otherwise, data inconsistency
     * will occur.
     *
     * @param { UIAbilityContext } context - Indicates the context of application or capability.
     * @param { String } name - Indicates the preferences file name.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     * <br>1. Mandatory parameters are left unspecified; <br>2. Incorrect parameter types;
     * <br>3. Parameter verification failed.
     * @throws { BusinessException } 15500000 - Inner error.
     * @relation function removePreferencesFromCacheSync(context: Context, name: string): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public static func removePreferencesFromCache(context: UIAbilityContext, name: String): Unit {
        removePreferencesFromCache(context, Options(name))
    }

   /**
    * Deletes a {@link Preferences} instance matching a specified preferences file name
    * from the cache. This interface is executed synchronously.
    * <p>When deleting the {@link Preferences} instance, you must release all references
    * of the instance. In addition, do not use the instance to perform data operations. Otherwise, data inconsistency
    * will occur.
    *
    * @param { UIAbilityContext } context - Indicates the context of application or capability.
    * @param { Options } options - Indicates the {@link Options} option of preferences file position.
    * @throws { BusinessException } 401 - Parameter error. Possible causes:
    * <br>1. Mandatory parameters are left unspecified; <br>2. Incorrect parameter types;
    * <br>3. Parameter verification failed.
    * @throws { BusinessException } 801 - Capability not supported.
    * @throws { BusinessException } 15500000 - Inner error.
    * @throws { BusinessException } 15501001 - The operations is supported in stage mode only.
    * @throws { BusinessException } 15501002 - Invalid dataGroupId.
    * @relation function removePreferencesFromCacheSync(context: Context, options: Options): void
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public static func removePreferencesFromCache(context: UIAbilityContext, options: Options): Unit {
        let stageContext = getStageContext(context)
        if (stageContext.isNull()) {
            throw BusinessException(ERR_PARAMETER_ERROR, getCJErrorMsg(ERR_PARAMETER_ERROR))
        }
        var errCode: Int32 = 0
        unsafe {
            try (
                cName = LibC.mallocCString(options.name).asResource(),
                cDataGroupId = LibC.mallocCString(options.dataGroupId).asResource()
            ) {
                errCode = FfiOHOSPreferencesRemovePreferencesFromCache(stageContext, cName.value, cDataGroupId.value)
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
     * Saves the {@link Preferences} object to the file.
     *
     * @throws { BusinessException } 401 - Parameter error. Mandatory parameters are left unspecified.
     * @throws { BusinessException } 15500000 - Inner error.
     * @relation flush(): Promise<void>
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
     * Clears all preferences from the {@link Preferences} object.
     * <p>You can call the {@link #flush} method to save the {@link Preferences} object to the file.
     *
     * @throws { BusinessException } 401 - Parameter error. Mandatory parameters are left unspecified.
     * @throws { BusinessException } 15500000 - Inner error.
     * @relation clear(): Promise<void>
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
     * Obtains the value of a preferences in the ValueType format.
     * <p>If the value is {@code null} or not in the ValueType format, the default value is returned.
     *
     * @param { String } key - Indicates the key of the preferences. It cannot be {@code null} or empty.
     * <tt>MAX_KEY_LENGTH</tt>.
     * @param { ValueType } defValue - Indicates the default value to return.
     * @returns { ValueType } The value matching the specified key if it is found;
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     * <br>1. Mandatory parameters are left unspecified; <br>2. Incorrect parameter types;
     * <br>3. Parameter verification failed.
     * @throws { BusinessException } 15500000 - Inner error.
     * @relation get(key: string, defValue: ValueType): Promise<ValueType>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public func get(key: String, defValue: ValueType): ValueType {
        unsafe {
            var result = ValueType.Integer(0)
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
     * Sets an int value for the key in the {@link Preferences} object.
     *
     * @param { String } key - Indicates the key of the preferences to modify. It cannot be {@code null} or empty.
     * @param { ValueType } value - Indicates the value of the preferences.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     * <br>1. Mandatory parameters are left unspecified; <br>2. Incorrect parameter types;
     * <br>3. Parameter verification failed.
     * @throws { BusinessException } 15500000 - Inner error.
     * @relation put(key: string, value: ValueType): Promise<void>
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
     * Obtains all the keys and values of a preferences in an HashMap.
     *
     * @returns { HashMap<String, ValueType> } The values and keys in an HashMap.
     * @throws { BusinessException } 401 - Parameter error. Mandatory parameters are left unspecified.
     * @throws { BusinessException } 15500000 - Inner error.
     * @relation getAllSync(): Object;
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
     * Deletes the preferences with a specified key from the {@link Preferences} object.
     *
     * @param { String } key - Indicates the key of the preferences to delete. It cannot be {@code null} or empty.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     * <br>1. Mandatory parameters are left unspecified; <br>2. Incorrect parameter types;
     * <br>3. Parameter verification failed.
     * @throws { BusinessException } 15500000 - Inner error.
     * @relation delete(key: string): Promise<void>
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
     * Checks whether the {@link Preferences} object contains a preferences matching a specified key.
     *
     * @param { String } key - Indicates the key of the preferences to modify. It cannot be {@code null} or empty.
     * @returns { Bool } {@code true} if the {@link Preferences} object contains
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     * <br>1. Mandatory parameters are left unspecified; <br>2. Incorrect parameter types;
     * <br>3. Parameter verification failed.
     * @throws { BusinessException } 15500000 - Inner error.
     * @relation has(key: string): Promise<boolean>
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
     * Registers an observer to listen for the change of a {@link Preferences} object.
     *
     * @param { String } tp - Indicates the callback when preferences changes.
     * @param { Callback1Argument<String> } callback - Indicates the callback function.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     * <br>1. Mandatory parameters are left unspecified; <br>2. Incorrect parameter types;
     * <br>3. Parameter verification failed.
     * @throws { BusinessException } 15500000 - Inner error.
     * @relation on(type: 'change', callback: Callback<string>): void
     * @relation on(type: 'multiProcessChange', callback: Callback<string>): void
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
     * Unregisters an existing observer.
     *
     * @param { String } tp - Indicates the callback when preferences changes.
     * @param { Callback1Argument<String> } callback - Indicates the callback function.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     * <br>1. Mandatory parameters are left unspecified; <br>2. Incorrect parameter types;
     * <br>3. Parameter verification failed.
     * @throws { BusinessException } 15500000 - Inner error.
     * @relation off(type: 'change', callback?: Callback<string>): void
     * @relation off(type: 'multiProcessChange', callback?: Callback<string>): void
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
     * Unregisters an existing observer.
     *
     * @param { String } tp - Indicates the event type.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     * <br>1. Mandatory parameters are left unspecified; <br>2. Incorrect parameter types;
     * <br>3. Parameter verification failed.
     * @throws { BusinessException } 15500000 - Inner error.
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
