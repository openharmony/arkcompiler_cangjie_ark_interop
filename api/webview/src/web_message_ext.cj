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
 * The message received or sent from web message port.
 *
 * @syscap SystemCapability.Web.Webview.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class WebMessageExt <: RemoteDataLite {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init() {
        super(unsafe { FfiOHOSWebMessageExtImplConstructor() })
    }

    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Get the type of the web message.
     * @returns { WebMessageType } - Returns data of WebMessageType type
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getType(): WebMessageType
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getType(): WebMessageType {
        var code: Int32 = 0
        let typeId = unsafe { FfiOHOSWebMessageExtImplGetType(getID(), inout code) }
        throwIfNotSuccess(code, "WebMessageExt", "getType")
        return WebMessageType.fromInt32(typeId)
    }

    /**
     * Get the string value of the web message.
     * @returns { String } - Returns data of string type
     * @throws { BusinessException } 17100014 - The type and value of the message do not match.
     *
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
        let messageCStrng = unsafe { FfiOHOSWebMessageExtImplGetString(getID(), inout code) }
        throwIfNotSuccess(code, "WebMessageExt", "getString")
        return getStringAndFree(messageCStrng)
    }

    /**
     * Get the number value of the web message.
     * @returns { Float64 } - Returns data of number type
     * @throws { BusinessException } 17100014 - The type and value of the message do not match.
     *
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
        let messageNumber = unsafe { FfiOHOSWebMessageExtImplGetNumber(getID(), inout code) }
        throwIfNotSuccess(code, "WebMessageExt", "getNumber")
        if (messageNumber.numberInt == 0) {
            return messageNumber.numberDouble
        } else {
            return Float64(messageNumber.numberInt)
        }
    }

    /**
     * Get the boolean value of the web message.
     * @returns { Bool } - Returns data of Boolean type
     * @throws { BusinessException } 17100014 - The type and value of the message do not match.
     *
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getBoolean(): Bool
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
        let messageBoolean = unsafe { FfiOHOSWebMessageExtImplGetBoolean(getID(), inout code) }
        throwIfNotSuccess(code, "WebMessageExt", "getBoolean")
        return messageBoolean
    }

    /**
     * Get the array buffer value of the web message.
     * @returns { Array<UInt8> } - Returns data of ArrayBuffer type
     * @throws { BusinessException } 17100014 - The type and value of the message do not match.
     *
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getArrayBuffer(): ArrayBuffer
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getArrayBuffer(): Array<UInt8> {
        var code: Int32 = 0
        unsafe {
            let messageBuffer = FfiOHOSWebMessageExtImplGetArrayBuffer(getID(), inout code)
            throwIfNotSuccess(code, "WebMessageExt", "getArrayBuffer")
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
            let message = FfiOHOSWebMessageExtImplGetArray(getID(), inout code)
            throwIfNotSuccess(code, "WebMessageExt", "getArray")
            return getArrayAndFree(message)
        }
    }

    /**
     * Get the error value of the web message.
     * @returns { Error } - Returns data of Error type
     * @throws { BusinessException } 17100014 - The type and value of the message do not match.
     *
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getError(): Error
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getError(): Error {
        var code: Int32 = 0
        let messageError = unsafe { FfiOHOSWebMessageExtImplGetError(getID(), inout code) }
        throwIfNotSuccess(code, "WebMessageExt", "getError")
        return Error.fromCErrorAndFree(messageError)
    }

    /**
     * Set the type of the web message.
     * @param { WebMessageType } type - set WebMessageType type data
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 17100014 - The type and value of the message do not match.
     *
     * @syscap SystemCapability.Web.Webview.Core
     * @brief setType(type: WebMessageType): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setType(msgType: WebMessageType): Unit {
        var code: Int32 = 0
        let typeId = msgType.toInt32()
        unsafe { FfiOHOSWebMessageExtImplSetType(getID(), typeId, inout code) }
        throwIfNotSuccess(code, "WebMessageExt", "setType")
    }

    /**
     * Set the string value of the web message.
     * @param { String } message - set string type data
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 17100014 - The type and value of the message do not match.
     *
     * @syscap SystemCapability.Web.Webview.Core
     * @brief setString(message: string): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setString(message: String): Unit {
        var code: Int32 = 0
        unsafe {
            try (cMessage = LibC.mallocCString(message).asResource()) {
                FfiOHOSWebMessageExtImplSetString(getID(), cMessage.value, inout code)
            }
        }
        throwIfNotSuccess(code, "WebMessageExt", "setString")
    }

    /**
     * Set the number value of the web message.
     * @param { Float64 } message - set number type data
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 17100014 - The type and value of the message do not match.
     *
     * @syscap SystemCapability.Web.Webview.Core
     * @brief setNumber(message: number): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setNumber(message: Float64): Unit {
        var code: Int32 = 0
        unsafe { FfiOHOSWebMessageExtImplSetNumber(getID(), message, inout code) }
        throwIfNotSuccess(code, "WebMessageExt", "setNumber")
    }

    /**
     * Set the boolean value of the web message.
     * @param { Bool } message - set boolean type data
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 17100014 - The type and value of the message do not match.
     *
     * @syscap SystemCapability.Web.Webview.Core
     * @brief setBoolean(message: boolean): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setBoolean(message: Bool): Unit {
        var code: Int32 = 0
        unsafe { FfiOHOSWebMessageExtImplSetBoolean(getID(), message, inout code) }
        throwIfNotSuccess(code, "WebMessageExt", "setBoolean")
    }

    /**
     * Set the array buffer value of the web message.
     * @param { Array<UInt8> } message - set ArrayBuffer type data
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 17100014 - The type and value of the message do not match.
     *
     * @syscap SystemCapability.Web.Webview.Core
     * @brief setArrayBuffer(message: ArrayBuffer): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setArrayBuffer(message: Array<UInt8>): Unit {
        var code: Int32 = 0
        unsafe {
            let messagePtr = acquireArrayRawData(message)
            let messageBuffer = CArrUI8(messagePtr.pointer, message.size)
            FfiOHOSWebMessageExtImplSetArrayBuffer(getID(), messageBuffer, inout code)
            releaseArrayRawData(messagePtr)
        }
        throwIfNotSuccess(code, "WebMessageExt", "setArrayBuffer")
    }

    /**
     * Set the array value of the web message.
     * @param { Array<String> } message - set Array type data
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 17100014 - The type and value of the message do not match.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief setArray(message: Array<string | number | boolean>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setArray(message: Array<String>): Unit {
        var code: Int32 = 0
        unsafe {
            let cMessage = toArrayCString(message)
            FfiOHOSWebMessageExtImplSetArrayString(getID(), cMessage, inout code)
            freeArrCString(cMessage)
        }
        throwIfNotSuccess(code, "WebMessageExt", "setArray")
    }

    /**
     * Set the array value of the web message.
     * @param { Array<Int64> } message - set Array type data
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 17100014 - The type and value of the message do not match.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief setArray(message: Array<string | number | boolean>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setArray(message: Array<Int64>): Unit {
        var code: Int32 = 0
        unsafe {
            let dataPtr = acquireArrayRawData(message)
            let cMessage = CArrI64(dataPtr.pointer, message.size)
            FfiOHOSWebMessageExtImplSetArrayInt(getID(), cMessage, inout code)
            releaseArrayRawData(dataPtr)
        }
        throwIfNotSuccess(code, "WebMessageExt", "setArray")
    }

    /**
     * Set the array value of the web message.
     * @param { Array<Float64> } message - set Array type data
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 17100014 - The type and value of the message do not match.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief setArray(message: Array<string | number | boolean>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setArray(message: Array<Float64>): Unit {
        var code: Int32 = 0
        unsafe {
            let dataPtr = acquireArrayRawData(message)
            let cMessage = CArrDouble(dataPtr.pointer, message.size)
            FfiOHOSWebMessageExtImplSetArrayDouble(getID(), cMessage, inout code)
            releaseArrayRawData(dataPtr)
        }
        throwIfNotSuccess(code, "WebMessageExt", "setArray")
    }

    /**
     * Set the array value of the web message.
     * @param { Array<Bool> } message - set Array type data
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 17100014 - The type and value of the message do not match.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief setArray(message: Array<string | number | boolean>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setArray(message: Array<Bool>): Unit {
        var code: Int32 = 0
        unsafe {
            let dataPtr = acquireArrayRawData(message)
            let cMessage = CArrBool(dataPtr.pointer, message.size)
            FfiOHOSWebMessageExtImplSetArrayBoolean(getID(), cMessage, inout code)
            releaseArrayRawData(dataPtr)
        }
        throwIfNotSuccess(code, "WebMessageExt", "setArray")
    }

    /**
     * Set the error value of the web message.
     * @param { Error } message - set Error type data
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 17100014 - The type and value of the message do not match.
     *
     * @syscap SystemCapability.Web.Webview.Core
     * @brief setError(message: Error): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func setError(message: Error): Unit {
        var code: Int32 = 0
        unsafe {
            try (
                errorName = LibC.mallocCString(message.errorName).asResource(),
                errorMsg = LibC.mallocCString(message.errorMsg).asResource()
            ) {
                FfiOHOSWebMessageExtImplSetError(getID(), CError(errorName.value, errorMsg.value), inout code)
            }
        }
        throwIfNotSuccess(code, "WebMessageExt", "setError")
    }
}
