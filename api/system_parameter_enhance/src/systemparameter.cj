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

package ohos.system_parameter_enhance

import ohos.labels.*
import ohos.ffi.*
import ohos.base.*

/**
 * The interface of system parameters class.
 * @relation declare namespace systemParameterEnhance
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Startup.SystemInfo"
]
public class Systemparameter {

    /**
     * Gets the value of the attribute with the specified key.
     * @param { String } key Key of the system attribute.
     * @param { String } def Default value.
     * @returns { String } if the parameter is empty or doesn't exist, empty string will be returned.
     * @throws { BusinessException } 14700101 - System parameter not found.
     * @throws { BusinessException } 14700103 - The operation on the system permission is denied.
     * @throws { BusinessException } 14700104 - System internal error such as out memory or deadlock.
     * @relation function getSync(key: string, def?: string): string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static func get(key: String, def!: String = ""): String {
        unsafe {
            // invalid parameter error
            if (key.size >= MAX_NAME_LENGTH || def.size >= MAX_VALUE_LENGTH) {
                PARAM_LOG.error("Systemparameter get failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
                throw BusinessException(ERR_PARAMETER_ERROR,
                    "Systemparameter get failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
            }
            let cKey = LibC.mallocCString(key)
            let cDef = LibC.mallocCString(def)
            let ret = FfiOHOSSysTemParameterGet(cKey, cDef)
            LibC.free(cKey)
            LibC.free(cDef)
            if (ret.code != 0) {
                PARAM_LOG.error("Systemparameter get failed: ${getErrorMsg(ret.code)}")
                throw BusinessException(ret.code, "Systemparameter get failed: ${getErrorMsg(ret.code)}")
            }
            return getStringAndFree(ret.data)
        }
    }

    /**
     * Sets a value for the attribute with the specified key.
     * @param { String } key Key of the system attribute.
     * @param { String } value value System attribute value to set.
     * @throws { BusinessException } 14700102 - Invalid system parameter value.
     * @throws { BusinessException } 14700103 - The operation on the system permission is denied.
     * @throws { BusinessException } 14700104 - System internal error such as out memory or deadlock.
     * @relation function setSync(key: string, value: string): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static func set(key: String, value: String): Unit {
        unsafe {
            // invalid parameter error
            if (key.size >= MAX_NAME_LENGTH || value.size >= MAX_VALUE_LENGTH) {
                PARAM_LOG.error("Systemparameter set failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
                throw BusinessException(ERR_PARAMETER_ERROR,
                    "Systemparameter set failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
            }
            let cKey = LibC.mallocCString(key)
            let cVal = LibC.mallocCString(value)
            let ret = FfiOHOSSysTemParameterSet(cKey, cVal)
            LibC.free(cKey)
            LibC.free(cVal)
            if (ret != 0) {
                PARAM_LOG.error("Systemparameter get failed: ${getErrorMsg(ret)}")
                throw BusinessException(ret, "Systemparameter get failed: ${getErrorMsg(ret)}")
            }
        }
    }
}

func getStringAndFree(value: CString): String {
    unsafe {
        let result = value.toString()
        LibC.free(value)
        return result
    }
}
