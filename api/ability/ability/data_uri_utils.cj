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
import std.convert.*
import ohos.labels.*

const URI_ID_SPLIT: String = "/"
const ERR_INVALID_PARA: Int32 = 401
const ERR_MSG_INVALID_PARA: String = "Invalid input parameter."

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class DataUriUtils {
    /**
     * Obtains the ID attached to the end of the path component of the given uri.
     *
     * @param { String } uri - Indicates the uri object from which the ID is to be obtained.
     * @returns { Int64 } Returns the ID attached to the end of the path component;
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * 2. Incorrect parameter types; 3. Parameter verification failed.
     * @syscap SystemCapability.Ability.AbilityRuntime.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public static func getId(uri: String): Int64 {
        let index = match (uri.lastIndexOf(URI_ID_SPLIT)) {
            case Some(v) => v
            case _ => throw BusinessException(ERR_INVALID_PARA, ERR_MSG_INVALID_PARA)
        }
        let idStr = uri[index + 1..]
        if (idStr.isEmpty()) {
            throw BusinessException(ERR_INVALID_PARA, ERR_MSG_INVALID_PARA)
        }
        let id = match (Int64.tryParse(idStr)) {
            case Some(v) => v
            case _ => throw BusinessException(ERR_INVALID_PARA, ERR_MSG_INVALID_PARA)
        }
        return id
    }

    /**
     * Attaches the given ID to the end of the path component of the given uri.
     *
     * @param { String } uri - Indicates the uri string from which the ID is to be obtained.
     * @param { Int64 } id - Indicates the ID to attach.
     * @returns { String } Returns the uri object with the given ID attached.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * 2. Incorrect parameter types; 3. Parameter verification failed.
     * @syscap SystemCapability.Ability.AbilityRuntime.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public static func attachId(uri: String, id: Int64): String {
        return uri + URI_ID_SPLIT + id.toString()
    }

    /**
     * Deletes the ID from the end of the path component of the given uri.
     *
     * @param { String } uri - Indicates the uri object from which the ID is to be deleted.
     * @returns { String } Returns the uri object with the ID deleted.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * 2. Incorrect parameter types; 3. Parameter verification failed.
     * @syscap SystemCapability.Ability.AbilityRuntime.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public static func deleteId(uri: String): String {
        let index = match (uri.lastIndexOf(URI_ID_SPLIT)) {
            case Some(v) => v
            case _ => throw BusinessException(ERR_INVALID_PARA, ERR_MSG_INVALID_PARA)
        }
        let idStr = uri[index + 1..]
        if (idStr.isEmpty()) { // 字串是空 或者不是数值
            throw BusinessException(ERR_INVALID_PARA, ERR_MSG_INVALID_PARA)
        }
        match (Int64.tryParse(idStr)) {
            case Some(v) => return uri[0..index]
            case _ => throw BusinessException(ERR_INVALID_PARA, ERR_MSG_INVALID_PARA)
        }
    }

    /**
     * Updates the ID in the specified uri
     *
     * @param { String } uri - Indicates the uri object to be updated.
     * @param { Int64 } id - Indicates the new ID.
     * @returns { String } Returns the updated uri object.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * 2. Incorrect parameter types; 3. Parameter verification failed.
     * @syscap SystemCapability.Ability.AbilityRuntime.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public static func updateId(uri: String, id: Int64): String {
        let ret = deleteId(uri)
        return ret + URI_ID_SPLIT + id.toString()
    }
}
