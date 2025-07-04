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

package ohos.hiappevent

import ohos.ffi.*
import ohos.base.*
import ohos.labels.*
import std.collection.HashMap

foreign func FfiOHOSHiAppEventConfigure(config: CConfigOption): Int32

foreign func FfiOHOSHiAppEventWrite(params: CAppEventInfo): Int32

foreign func FfiOHOSHiAppEventAddProcessor(processor: CProcessor): RetDataBool

foreign func FfiOHOSHiAppEventRemoveProcessor(id: Int64): Int32

foreign func FfiOHOSHiAppEventSetUserId(name: CString, value: CString): Int32

foreign func FfiOHOSHiAppEventGetUserId(name: CString): RetDataCString

foreign func FfiOHOSHiAppEventSetUserProperty(name: CString, value: CString): Int32

foreign func FfiOHOSHiAppEventgetUserProperty(name: CString): RetDataCString

foreign func FfiOHOSHiAppEventclearData(): Unit

foreign func FfiOHOSHiAppEventAddWatcher(Watcher: RetWatcher): RetDataI64

foreign func FfiOHOSHiAppEventRemoveWatcher(watcher: RetWatcher): Int32

foreign func FfiOHOSHiAppEventSetEventParam(eventParams: CArrEventParameters, domain: CString, name: CString): Int32

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public class HiAppEvent {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public static func write(info: AppEventInfo): Unit {
        let cinfo = info.toCAppEventInfo()
        let code = unsafe { FfiOHOSHiAppEventWrite(cinfo) }
        cinfo.free()
        if (code != SUCCESS_CODE) {
            HI_APP_EVENT_LOG.error(getErrorInfo(code))
            throw BusinessException(code, getErrorInfo(code))
        }
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public static func configure(config: ConfigOption): Unit {
        let retConfig = CConfigOption(config)
        let code = unsafe { FfiOHOSHiAppEventConfigure(retConfig) }
        retConfig.free()
        if (code != SUCCESS_CODE) {
            HI_APP_EVENT_LOG.error(getErrorInfo(code))
            throw BusinessException(code, getErrorInfo(code))
        }
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public static func addProcessor(processor: Processor): Int64 {
        let cProcessor = CProcessor(processor)
        let res = unsafe { FfiOHOSHiAppEventAddProcessor(cProcessor) }
        cProcessor.free()
        if (!res.data) {
            HI_APP_EVENT_LOG.error(getErrorInfo(res.code))
            throw BusinessException(res.code, getErrorInfo(res.code))
        }
        return Int64(res.code)
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public static func removeProcessor(id: Int64): Unit {
        let res = unsafe { FfiOHOSHiAppEventRemoveProcessor(id) }
        if (res != SUCCESS_CODE) {
            HI_APP_EVENT_LOG.error(getErrorInfo(res))
            throw BusinessException(res, getErrorInfo(res))
        }
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public static func setUserId(name: String, value: String): Unit {
        unsafe {
            try (
                cname = LibC.mallocCString(name).asResource(),
                cvalue = LibC.mallocCString(value).asResource()
            ) {
                let res = FfiOHOSHiAppEventSetUserId(cname.value, cvalue.value)
                if (res != SUCCESS_CODE) {
                    HI_APP_EVENT_LOG.error(getErrorInfo(res))
                    throw BusinessException(res, getErrorInfo(res))
                }
            }
        }
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public static func getUserId(name: String): String {
        unsafe {
            let cname = LibC.mallocCString(name)
            let res = FfiOHOSHiAppEventGetUserId(cname)
            LibC.free(cname)
            if (res.code != SUCCESS_CODE) {
                LibC.free(res.data)
                HI_APP_EVENT_LOG.error(getErrorInfo(res.code))
                throw BusinessException(res.code, getErrorInfo(res.code))
            }
            let userId = res.data.toString()
            LibC.free(res.data)
            return userId
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public static func setUserProperty(name: String, value: String): Unit {
        unsafe {
            try (
                cname = LibC.mallocCString(name).asResource(),
                cvalue = LibC.mallocCString(value).asResource()
            ) {
                let res = FfiOHOSHiAppEventSetUserProperty(cname.value, cvalue.value)
                if (res != SUCCESS_CODE) {
                    HI_APP_EVENT_LOG.error(getErrorInfo(res))
                    throw BusinessException(res, getErrorInfo(res))
                }
                return
            }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public static func getUserProperty(name: String): String {
        unsafe {
            let cname = LibC.mallocCString(name)
            let res = FfiOHOSHiAppEventgetUserProperty(cname)
            LibC.free(cname)
            if (res.code != SUCCESS_CODE) {
                LibC.free(res.data)
                HI_APP_EVENT_LOG.error(getErrorInfo(res.code))
                throw BusinessException(res.code, getErrorInfo(res.code))
            }
            let userProperty = res.data.toString()
            LibC.free(res.data)
            return userProperty
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public static func clearData(): Unit {
        unsafe { FfiOHOSHiAppEventclearData() }
    }

    /**
     * Add event watcher.
     *
     * @param { Watcher } watcher Watcher object for monitoring events.
     * @returns { AppEventPackageHolder } Holder object, which is used to read the monitoring data of the watcher.
     * @throws { BusinessException } 401 - Parameter error.
     * @throws { BusinessException } 11102001 - Invalid watcher name.
     * @throws { BusinessException } 11102002 - Invalid filtering event domain.
     * @throws { BusinessException } 11102003 - Invalid row value.
     * @throws { BusinessException } 11102004 - Invalid size value.
     * @throws { BusinessException } 11102005 - Invalid timeout value.
     * @static
     * @syscap SystemCapability.HiviewDFX.HiAppEvent
     * @brief addWatcher(watcher: Watcher): AppEventPackageHolder
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public static func addWatcher(watcher: Watcher): Option<AppEventPackageHolder> {
        let retWatcher = unsafe { RetWatcher(watcher) }
        let res = unsafe { FfiOHOSHiAppEventAddWatcher(retWatcher) }
        unsafe { retWatcher.free() }
        if (res.data == -1) {
            return None
        }
        match {
            case res.code == SUCCESS_CODE => return Some(AppEventPackageHolder(res.data))
            case _ =>
                HI_APP_EVENT_LOG.error(getErrorInfo(res.code))
                throw BusinessException(res.code, getErrorInfo(res.code))
        }
    }

    /**
     * Remove event watcher.
     *
     * @param { Watcher } watcher Watcher object for monitoring events.
     * @throws { BusinessException } 401 - Parameter error.
     * @throws { BusinessException } 11102001 - Invalid watcher name.
     * @static
     * @syscap SystemCapability.HiviewDFX.HiAppEvent
     * @brief removeWatcher(watcher: Watcher): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public static func removeWatcher(watcher: Watcher): Unit {
        let retWatcher = unsafe { RetWatcher(watcher) }
        let code = unsafe { FfiOHOSHiAppEventRemoveWatcher(retWatcher) }
        unsafe { retWatcher.free() }
        match {
            case code == SUCCESS_CODE => return
            case _ =>
                HI_APP_EVENT_LOG.error(getErrorInfo(code))
                throw BusinessException(code, getErrorInfo(code))
        }
    }

    /**
     * It is used to set custom parameters for events, including both system-subscribed events and custom events.
     * Existing parameter will be overwritten, and non-existing parameter will be created.
     *
     * @param { HashMap<String, ParamType> } params Custom parameter object. The parameter name and value are defined as
     * follows:
     * <br>- A parameter name is a string that contains a maximum of 32 characters, including digits (0 to 9), letters
     * (a to z), underscore (_), and dollar sign ($). It must start with a letter or dollar sign ($) and end with a digit
     * or letter.
     * <br>- The parameter value is of the ParamType and contains a maximum of 1024 characters.
     * <br>- The number of parameters must be less than 64.
     * @param { String } domain Event domain. The event domain can be associated with application events and system
     * events (Domain.OS).
     * @param { String } name Event name. The default value is an empty string, which indicates all event names in the
     * associated event domain. The event name can be associated with application events and system events. System events
     * can be associated only with crash events (Event.APP_CRASH) and freeze events
     * (Event.APP_FREEZE).
     * @throws { BusinessException } 11101001 - Invalid event domain.
     * @throws { BusinessException } 11101002 - Invalid event name.
     * @throws { BusinessException } 11101003 - Invalid number of event parameters.
     * @throws { BusinessException } 11101004 - Invalid string length of the event parameter.
     * @throws { BusinessException } 11101005 - Invalid event parameter name.
     * @throws { BusinessException } 11101007 - The number of parameter keys exceeds the limit.
     * @relation setEventParam(params: Record<string, ParamType>, domain: string, name?: string): Promise<void>
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public static func setEventParam(params: HashMap<String, ParamType>, domain: String, name!: String = ""): Unit {
        unsafe {
            try (
                cdomain = LibC.mallocCString(domain).asResource(),
                cname = LibC.mallocCString(name).asResource()
            ) {
                let paramsArr = params.toArray()
                let eventParams = Array<EventParameters>(params.size) {
                    i => EventParameters(paramsArr[i][0], paramsArr[i][1])
                }
                let CEventParams = toCArrEventParameters(eventParams)
                let code = FfiOHOSHiAppEventSetEventParam(CEventParams, cdomain.value, cname.value)
                CEventParams.free()
                if (code != SUCCESS_CODE) {
                    HI_APP_EVENT_LOG.error(getErrorInfo(code))
                    throw BusinessException(code, getErrorInfo(code))
                }
            }
        }
    }
}
