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

package ohos.user_auth

import ohos.ffi.Callback1Param
import std.sync.Mutex
import std.sync.AtomicReference
import ohos.base.BusinessException
import ohos.labels.*

/**
 * User authentication instance, used to initiate a complete authentication.
 *
 * @syscap SystemCapability.UserIAM.UserAuth.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.UserIAM.UserAuth.Core"
]
public class UserAuthInstance {
    let mtx = Mutex()
    var contextId: UInt64 = 0
    var isAuthStarted: Bool = false

    let callbackRef = AtomicReference(CallbackRef(CPointer()))

    UserAuthInstance(let authParam: AuthParam, let widgetParam: WidgetParam) {
        const MAX_CHALLENG_LEN = 32;
        if (authParam.challenge.size > MAX_CHALLENG_LEN) {
            throw BusinessException(UserAuthResultCode.OHOS_INVALID_PARAM,
                "Parameter error. The length of \"challenge\" connot exceed 32.")
        }
        const TITLE_MAX = 500;
        if (widgetParam.title.size > TITLE_MAX) {
            throw BusinessException(UserAuthResultCode.OHOS_INVALID_PARAM,
                "Parameter error. The length of \"title\" connot exceed 500.")
        }
        const BUTTON_MAX = 60;
        if (widgetParam.navigationButtonText.getOrDefault({=> ""}).size > BUTTON_MAX) {
            throw BusinessException(UserAuthResultCode.OHOS_INVALID_PARAM,
                "Parameter error. The length of \"navigationButtonText\" connot exceed 60.")
        }
    }
    ~init() {
        unsafe { FfiUserAuthDeleteCb(this.callbackRef.load().ptr) }
    }

    /**
     * Turn on widget authentication result event listening.
     *
     * @param { 'result' } type - Indicates the type of event.
     * @param { IAuthCallback } callback - Indicates the listener.
     * @throws { BusinessError } 401 - Incorrect parameters. Possible causes:
     * <br>1. Mandatory parameters are left unspecified.
     * @syscap SystemCapability.UserIAM.UserAuth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public func on(`type`: String, callback: (UserAuthResult) -> Unit): Unit {
        if (`type` != "result") {
            throw BusinessException(UserAuthResultCode.OHOS_INVALID_PARAM,
                EXCEPTION_MAP[UserAuthResultCode.OHOS_INVALID_PARAM])
        }
        let wrapper = {
            cUserAuthResult: CUserAuthResult =>
            let userAuthResultCode = codeConvert(cUserAuthResult.result)
            if (userAuthResultCode != UserAuthResultCode.SUCCESS) {
                // when fail
                callback(UserAuthResult(userAuthResultCode, None, None, None))
            }

            let token = cUserAuthResult.token
            callback(
                UserAuthResult(
                    userAuthResultCode,
                    Array<Byte>(cUserAuthResult.tokenLen, {i => unsafe { token.read(i) }}),
                    UserAuthType.parse(cUserAuthResult.authType),
                    Some(EnrolledState(cUserAuthResult.credentialDigest, cUserAuthResult.credentialCount))
                )
            )
        }
        let registerCall = Callback1Param<CUserAuthResult, Unit>(wrapper)
        let onCallbackRef = CallbackRef(unsafe { FfiUserAuthNewCb(registerCall.getID()) })
        let oldCallbackRef = this.callbackRef.swap(onCallbackRef)
        unsafe { FfiUserAuthDeleteCb(oldCallbackRef.ptr) }
    }

    /**
     * Turn off widget authentication result event listening.
     *
     * @param { 'result' } type - Indicates the type of event.
     * @throws { BusinessError } 401 - Incorrect parameters. Possible causes:
     * <br>1. Mandatory parameters are left unspecified.
     * @syscap SystemCapability.UserIAM.UserAuth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public func off(`type`: String): Unit {
        if (`type` != "result") {
            throw BusinessException(UserAuthResultCode.OHOS_INVALID_PARAM,
                EXCEPTION_MAP[UserAuthResultCode.OHOS_INVALID_PARAM])
        }
        let oldCallbackRef = this.callbackRef.swap(CallbackRef(CPointer()))
        unsafe { FfiUserAuthDeleteCb(oldCallbackRef.ptr) }
    }
    /**
     * Start this authentication, an instance can only perform authentication once.
     *
     * @permission ohos.permission.ACCESS_BIOMETRIC
     * @throws { BusinessError } 12500002 - General operation error.
     * @syscap SystemCapability.UserIAM.UserAuth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public func start(): Unit {
        synchronized(this.mtx) {
            if (isAuthStarted) {
                throw BusinessException(
                    UserAuthResultCode.GENERAL_ERROR,
                    EXCEPTION_MAP[UserAuthResultCode.GENERAL_ERROR]
                )
            }
            unsafe {
                let cChallendge = acquireArrayRawData(authParam.challenge)
                let cAuthType = acquireArrayRawData(
                    Array<UInt32>(
                        authParam.authType.size,
                        {i => authParam.authType[i].getValue()}
                    )
                )

                var cAuthParam = if (authParam.reuseUnlockResult.isSome()) {
                    CAuthParam(cChallendge.pointer, authParam.challenge.size, cAuthType.pointer, authParam.authType.size,
                        authParam.authTrustLevel.getValue(), true,
                        authParam.reuseUnlockResult.getOrThrow().reuseMode.getValue(),
                        authParam.reuseUnlockResult.getOrThrow().reuseDuration)
                } else {
                    CAuthParam(cChallendge.pointer, authParam.challenge.size, cAuthType.pointer, authParam.authType.size,
                        authParam.authTrustLevel.getValue(), false, 0, 0)
                }

                var cWidgetParam = if (widgetParam.navigationButtonText.isSome()) {
                    CWidgetParam(
                        LibC.mallocCString(widgetParam.title),
                        LibC.mallocCString(widgetParam.navigationButtonText.getOrThrow()),
                    )
                } else {
                    CWidgetParam(
                        LibC.mallocCString(widgetParam.title),
                        CString(CPointer()),
                    )
                }

                this.contextId = FfiUserAuthStart(inout cAuthParam, inout cWidgetParam, this.callbackRef.load().ptr)

                releaseArrayRawData(cChallendge)
                releaseArrayRawData(cAuthType)
                LibC.free(cWidgetParam.title)
                LibC.free(cWidgetParam.navigationButtonText)
            }
            isAuthStarted = true
        }
    }
    /**
     * Cancel this authentication.
     *
     * @throws { BusinessError } 12500002 - General operation error.
     * @syscap SystemCapability.UserIAM.UserAuth.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.UserIAM.UserAuth.Core"
    ]
    public func cancel(): Unit {
        synchronized(this.mtx) {
            if (!this.isAuthStarted) {
                throw BusinessException(
                    UserAuthResultCode.GENERAL_ERROR,
                    EXCEPTION_MAP[UserAuthResultCode.GENERAL_ERROR]
                )
            }
            this.isAuthStarted = false
            let resultCode = unsafe { FfiUserAuthCancel(this.contextId) }
            let userAuthResultCode = codeConvert(resultCode)
            if (userAuthResultCode == UserAuthResultCode.SUCCESS) {
                return
            }
            throw BusinessException(userAuthResultCode, EXCEPTION_MAP[userAuthResultCode])
        }
    }
}
