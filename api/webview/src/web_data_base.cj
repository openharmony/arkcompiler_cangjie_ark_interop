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
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class WebDataBase {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func getHttpAuthCredentials(host: String, realm: String): Array<String> {
        if (host.size > MAX_STRING_LENGTH || realm.size > MAX_STRING_LENGTH) {
            throw BusinessException(ERR_PARAMETER_ERROR,
                "WebDataBase getHttpAuthCredentials failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
        var username_password: Array<String> = []

        unsafe {
            try (
                chost = LibC.mallocCString(host).asResource(),
                crealm = LibC.mallocCString(realm).asResource()
            ) {
                let result: RetDataCArrString = FfiOHOSDBGetHttpAuthCredentials(chost.value, crealm.value)
                // 17100023 is not defined in webview module, which means getting value failed, should throw NoneValueException
                if (result.code == 17100023) {
                    throw NoneValueException("getHttpAuthCredentials: get value exception")
                }
                throwIfNotSuccess(result.code, "WebDataBase", "getHttpAuthCredentials")
                username_password = result.getDataAndFree()
            }
        }
        return username_password
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func saveHttpAuthCredentials(host: String, realm: String, username: String, password: String): Unit {
        if (host.size > MAX_STRING_LENGTH || realm.size > MAX_STRING_LENGTH || username.size > MAX_STRING_LENGTH ||
            password.size > MAX_STRING_LENGTH) {
            throw BusinessException(ERR_PARAMETER_ERROR,
                "WebDataBase saveHttpAuthCredentials failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }

        unsafe {
            try (
                chost = LibC.mallocCString(host).asResource(),
                crealm = LibC.mallocCString(realm).asResource(),
                cusername = LibC.mallocCString(username).asResource(),
                cpassword = LibC.mallocCString(password).asResource()
            ) {
                FfiOHOSDBSaveHttpAuthCredentials(chost.value, crealm.value, cusername.value, cpassword.value)
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func existHttpAuthCredentials(): Bool {
        unsafe {
            return FfiOHOSDBExistHttpAuthCredentials()
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func deleteHttpAuthCredentials(): Unit {
        unsafe {
            FfiOHOSDBDeleteHttpAuthCredentials()
        }
    }
}
