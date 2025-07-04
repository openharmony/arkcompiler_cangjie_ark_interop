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

package ohos.settings

import std.collection.HashMap
import ohos.ability.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.*

const SYSTEM_INTERNAL_ERROR: Int32 = 14700104
let ERROR_CODE_MAP = HashMap<Int32, String>(
    [(SYSTEM_INTERNAL_ERROR, "System internal error such as out memory or deadlock.")])

func getErrorMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error code ${code}"
    }
}

@!APILevel[
    19,
    permission: "ohos.permission.MANAGE_SECURE_SETTINGS",
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.Settings.Core"
]
func setValue<T>(context: StageContext, name: T, value: String): Bool where T <: ToString {
    var ret: Int32 = 0
    var result: Bool = false
    unsafe {
        try (
            cName = LibC.mallocCString(name.toString()).asResource(),
            cValue = LibC.mallocCString(value).asResource()
        ) {
            result = FfiSettingsSetValue(context, cName.value, cValue.value, CString(CPointer()), inout ret)
            if (ret != 0) {
                throw BusinessException(ret, getErrorMsg(ret))
            }
        }
    }
    return result
}

@!APILevel[
    19,
    permission: "ohos.permission.MANAGE_SECURE_SETTINGS",
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.Settings.Core"
]
func setValue<T, P>(context: StageContext, name: T, value: String, domainName: P): Bool where T <: ToString,
    P <: ToString {
    var ret: Int32 = 0
    var result: Bool = false
    unsafe {
        try (
            cName = LibC.mallocCString(name.toString()).asResource(),
            cValue = LibC.mallocCString(value).asResource(),
            cDomainName = LibC.mallocCString(domainName.toString()).asResource()
        ) {
            result = FfiSettingsSetValue(context, cName.value, cValue.value, cDomainName.value, inout ret)
            if (ret != 0) {
                throw BusinessException(ret, getErrorMsg(ret))
            }
        }
    }
    result
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.Settings.Core"
]
public func getValue<T>(context: StageContext, name: T, defValue: String): String where T <: ToString {
    var ret: Int32 = 0
    var value: String = ""
    unsafe {
        try (
            cName = LibC.mallocCString(name.toString()).asResource(),
            cDefValue = LibC.mallocCString(defValue).asResource()
        ) {
            let result = FfiSettingsGetValue(context, cName.value, cDefValue.value, CString(CPointer()), inout ret)
            if (result.isNull()) {
                throw BusinessException(ret, getErrorMsg(ret))
            }
            value = result.toString()
            LibC.free(result)
        }
    }
    value
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.Settings.Core"
]
public func getValue<T, P>(context: StageContext, name: T, defValue: String, domainName: P): String where T <: ToString,
    P <: ToString {
    var ret: Int32 = 0
    var value: String = ""
    unsafe {
        try (
            cName = LibC.mallocCString(name.toString()).asResource(),
            cDefValue = LibC.mallocCString(defValue).asResource(),
            cDomainName = LibC.mallocCString(domainName.toString()).asResource()
        ) {
            let result = FfiSettingsGetValue(context, cName.value, cDefValue.value, cDomainName.value, inout ret)
            if (result.isNull()) {
                throw BusinessException(ret, getErrorMsg(ret))
            }
            value = result.toString()
            LibC.free(result)
        }
    }
    value
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.Settings.Core"
]
public func registerKeyObserver<T, P>(context: StageContext, name: T, domainName: P, observer: Callback0Argument): Bool where T <: ToString,
    P <: ToString {
    var result: Bool = false
    unsafe {
        try (
            cName = LibC.mallocCString(name.toString()).asResource(),
            cDomainName = LibC.mallocCString(domainName.toString()).asResource()
        ) {
            let wrapper = {=> observer.invoke()}
            let lambda = Callback0Param<Unit>(wrapper)
            result = FfiSettingsRegisterKeyObserver(context, cName.value, cDomainName.value, lambda.getID())
        }
    }
    result
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.Settings.Core"
]
public func unregisterKeyObserver<T, P>(context: StageContext, name: T, domainName: P): Bool where T <: ToString,
    P <: ToString {
    var result: Bool = false
    unsafe {
        try (
            cName = LibC.mallocCString(name.toString()).asResource(),
            cDomainName = LibC.mallocCString(domainName.toString()).asResource()
        ) {
            result = FfiSettingsUnregisterKeyObserver(context, cName.value, cDomainName.value)
        }
    }
    result
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.Settings.Core"
]
public func getUriSync<T>(name: T): String where T <: ToString {
    var value: String = ""
    unsafe {
        try (cName = LibC.mallocCString(name.toString()).asResource()) {
            let result = FfiSettingsGetUriSync(cName.value, CString(CPointer()))
            if (!result.isNull()) {
                value = result.toString()
                LibC.free(result)
            }
        }
    }
    value
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.Settings.Core"
]
public func getUriSync<T, P>(name: T, domainName: P): String where T <: ToString, P <: ToString {
    var value: String = ""
    unsafe {
        try (
            cName = LibC.mallocCString(name.toString()).asResource(),
            cDomainName = LibC.mallocCString(domainName.toString()).asResource()
        ) {
            let result = FfiSettingsGetUriSync(cName.value, cDomainName.value)
            if (!result.isNull()) {
                value = result.toString()
                LibC.free(result)
            }
        }
    }
    value
}
