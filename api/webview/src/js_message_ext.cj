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

/**
 * The message for indicating the of result of JavaScript code execution.
 * @syscap SystemCapability.Web.Webview.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class JsMessageExt <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Get the type of the JavaScript code execution result.
     * @returns { JsMessageType } - Returns data of JsMessageType type
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getType(): JsMessageType
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getType(): JsMessageType {
        var code: Int32 = 0
        let typeId = unsafe { FfiOHOSJsMessageExtImplGetType(getID(), inout code) }
        throwIfNotSuccess(code, "JsMessageExt", "getType")
        return JsMessageType.fromInt32(typeId)
    }

    /**
     * Get the string value of the JavaScript code execution result.
     * @returns { String } - Returns data of string type
     * @throws { BusinessException } 17100014 - The type and value of the message do not match.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getString(): string
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getString(): String {
        var code: Int32 = 0
        let messageCStrng = unsafe { FfiOHOSJsMessageExtImplGetString(getID(), inout code) }
        throwIfNotSuccess(code, "JsMessageExt", "getString")
        return getStringAndFree(messageCStrng)
    }

    /**
     * Get the number value of the JavaScript code execution result.
     * @returns { Float64 } - Returns data of number type
     * @throws { BusinessException } 17100014 - The type and value of the message do not match.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getNumber(): number
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getNumber(): Float64 {
        var code: Int32 = 0
        let messageNumber = unsafe { FfiOHOSJsMessageExtImplGetNumber(getID(), inout code) }
        throwIfNotSuccess(code, "JsMessageExt", "getNumber")
        if (messageNumber.numberInt == 0) {
            return messageNumber.numberDouble
        } else {
            return Float64(messageNumber.numberInt)
        }
    }

    /**
     * Get the boolean value of the JavaScript code execution result.
     * @returns { Bool } - Returns data of Boolean type
     * @throws { BusinessException } 17100014 - The type and value of the message do not match.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getBoolean(): boolean
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getBoolean(): Bool {
        var code: Int32 = 0
        let messageBoolean = unsafe { FfiOHOSJsMessageExtImplGetBoolean(getID(), inout code) }
        throwIfNotSuccess(code, "JsMessageExt", "getBoolean")
        return messageBoolean
    }

    /**
     * Get the array buffer value of the JavaScript code execution result.
     * @returns { Array<UInt8> } - Returns data of ArrayBuffer
     * @throws { BusinessException } 17100014 - The type and value of the message do not match.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getArrayBuffer(): ArrayBuffer
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getArrayBuffer(): Array<UInt8> {
        var code: Int32 = 0
        unsafe {
            let messageBuffer = FfiOHOSJsMessageExtImplGetArrayBuffer(getID(), inout code)
            throwIfNotSuccess(code, "JsMessageExt", "getArrayBuffer")
            return toAndfreeArrayUInt8(messageBuffer)
        }
    }

    /**
     * Get the array value of the the JavaScript code execution result.
     * @returns { MessageArrayValue } - Returns data of Array type
     * @throws { BusinessException } 17100014 - The type and value of the message do not match.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getArray(): Array<string | number | boolean>
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getArray(): MessageArrayValue {
        var code: Int32 = 0
        unsafe {
            let message = FfiOHOSJsMessageExtImplGetArray(getID(), inout code)
            throwIfNotSuccess(code, "JsMessageExt", "getArray")
            return getArrayAndFree(message)
        }
    }
}
