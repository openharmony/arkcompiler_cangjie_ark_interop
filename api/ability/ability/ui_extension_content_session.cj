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

import ohos.ffi.*
import ohos.base.*
import ohos.encoding.json.*
import ohos.labels.*

foreign {
    func FFICJExtSessionLoadContent(id: Int64, cPath: CString): Int32

    func FFICJExtSessionTerminateSelf(id: Int64): Int32

    func FFICJExtSessionTerminateSelfWithResult(id: Int64, wantHandle: WantHandle, resultCode: Int32): Int32

    func FFICJExtSessionSetWindowPrivacyMode(id: Int64, isPrivacyMode: Bool): Int32

    func FFICJExtSessionStartAbilityByType(id: Int64, cType: CString, cWantParams: CString, onError: Int64,
        onResult: Int64): Int32
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class UIExtensionContentSession <: RemoteDataWithIdManager {
    static func checkId(id: Int64): Unit {
        if (id <= 0) {
            throw IllegalArgumentException("invalid object")
        }
    }

    init(id: Int64) {
        super(id)
    }

    /*
     * @brief loadContent(path: string, storage?: LocalStorage): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func loadContent(path: String): Unit {
        unsafe {
            var errorCode: Int32 = 0
            try (cPath = LibC.mallocCString(path).asResource()) {
                errorCode = FFICJExtSessionLoadContent(this.getID(), cPath.value)
            }
            checkCodeAndThrow(errorCode)
        }
    }

    /*
     * @brief terminateSelf(callback: AsyncCallback<void>): void
     * @brief terminateSelf(): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func terminateSelf(): Unit {
        unsafe {
            let errorCode = FFICJExtSessionTerminateSelf(this.getID())
            checkCodeAndThrow(errorCode)
        }
    }

    /*
     * @brief terminateSelfWithResult(parameter: AbilityResult, callback: AsyncCallback<void>): void
     * @brief terminateSelfWithResult(parameter: AbilityResult): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func terminateSelfWithResult(parameter: AbilityResult): Unit {
        unsafe {
            let wantHandle = parameter.want.createWantHandle()
            let errorCode = FFICJExtSessionTerminateSelfWithResult(this.getID(), wantHandle, parameter.resultCode)
            Want.releaseWantHandle(wantHandle)
            checkCodeAndThrow(errorCode)
        }
    }

    /*
     * @brief setWindowPrivacyMode(isPrivacyMode: boolean): Promise<void>
     * @brief setWindowPrivacyMode(isPrivacyMode: boolean, callback: AsyncCallback<void>): void
     */
    @!APILevel[
        19,
        permission: "ohos.permission.PRIVACY_WINDOW",
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func setWindowPrivacyMode(isPrivacyMode: Bool): Unit {
        unsafe {
            let errorCode = FFICJExtSessionSetWindowPrivacyMode(this.getID(), isPrivacyMode)
            checkCodeAndThrow(errorCode)
        }
    }

    /*
     * @brief startAbilityByType(type: string, wantParam: Record<string, Object>,
     *           abilityStartCallback: AbilityStartCallback, callback: AsyncCallback<void>): void
     * @brief startAbilityByType(type: string, wantParam: Record<string, Object>,
     *           abilityStartCallback: AbilityStartCallback): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func startAbilityByType(abilityType: String, wantParam: String, abilityStartCallback: AbilityStartCallback): Unit {
        let paramJsonObj = jsStringToJsObject(wantParam)
        var errorCode: Int32 = 0
        let onErrorWrapper = {
            code: Int32, cName: CString, cMessage: CString =>
            let name = cName.toString()
            let message = cMessage.toString()
            unsafe {
                LibC.free(cName)
                LibC.free(cMessage)
            }
            abilityStartCallback.onError(code, name, message)
        }
        let onResult = abilityStartCallback.onResult ?? {
            _: AbilityResult => ()
        }
        let onResultWrapper = {
            cjResult: CJAbilityResult =>
            let abilityResult = AbilityResult(cjResult.resultCode, Want(cjResult.wantHandle))
            onResult(abilityResult)
        }
        let onErrorCallback = Callback3Param<Int32, CString, CString, Unit>(onErrorWrapper)
        let onResultCallback = Callback1Param<CJAbilityResult, Unit>(onResultWrapper)
        unsafe {
            try (
                cAbilityType = LibC.mallocCString(abilityType).asResource(),
                cWantParam = LibC.mallocCString(jsonObjectWrapper(paramJsonObj).toString()).asResource()
            ) {
                errorCode = FFICJExtSessionStartAbilityByType(getID(), cAbilityType.value, cWantParam.value,
                    onErrorCallback.getID(), onResultCallback.getID())
            }
        }
        checkCodeAndThrow(errorCode)
    }
}
