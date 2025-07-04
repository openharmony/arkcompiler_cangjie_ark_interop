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
public class WebMessagePort <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * The flag indicates whether more formats are supported than string and array buffers.
     *
     * @type { Bool }
     * @syscap SystemCapability.Web.Webview.Core
     * @brief isExtentionType?: boolean
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public prop isExtentionType: Bool {
        get() {
            return unsafe { FfiOHOSWebMessagePortIsExtentionType(getID()) }
        }
    }

    /**
     * Post a message to other port.
     * @param { WebMessage } message - Message to send.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 17100010 - Failed to post messages through the port.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief postMessageEvent(message: WebMessage): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func postMessageEvent(message: WebMessage): Unit {
        match (message) {
            case STRING(s) => unsafe {
                var code: Int32 = 0
                try (stringValue = LibC.mallocCString(s).asResource()) {
                    FfiOHOSWebMessagePortPostMessageEvent(getID(), stringValue.value, inout code)
                }
                throwIfNotSuccess(code, "WebMessagePort", "postMessageEvent")
            }
            case ARRAY_BUFFER(buffer) => unsafe {
                var code: Int32 = 0
                let bufferPtr = acquireArrayRawData(buffer)
                let bytes = CArrUI8(bufferPtr.pointer, buffer.size)
                FfiOHOSWebMessagePortPostMessageEventArr(getID(), bytes, inout code)
                releaseArrayRawData(bufferPtr)
                throwIfNotSuccess(code, "WebMessagePort", "postMessageEvent")
            }
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    /**
     * Post a message to other port.
     * @param { WebMessageExt } message - Message to send.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 17100010 - Failed to post messages through the port.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief postMessageEventExt(message: WebMessageExt): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func postMessageEventExt(message: WebMessageExt): Unit {
        var code: Int32 = 0
        unsafe { FfiOHOSWebMessagePortPostMessageEventExt(getID(), message.getID(), inout code) }
        throwIfNotSuccess(code, "WebMessagePort", "postMessageEventExt")
    }

    /**
     * Receive message from other port.
     * @param { (WebMessage) -> Unit } callback - Callback function for receiving messages.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 17100006 - Failed to register a message event for the port.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief onMessageEvent(callback: (result: WebMessage) => void): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func onMessageEvent(callback: (WebMessage) -> Unit): Unit {
        let wrapper = {
            message: RetWebMessage => if (!message.messageStr.isNull()) {
                let message = WebMessage.STRING(message.messageStr.toString())
                callback(message)
            } else {
                let size = message.messageArr.size
                let ptr = message.messageArr.head
                let arr = if (ptr.isNull()) {
                    Array<UInt8>()
                } else {
                    unsafe {
                        Array<UInt8>(size, {i => ptr.read(i)})
                    }
                }
                let message = WebMessage.ARRAY_BUFFER(arr)
                callback(message)
            }
        }
        let callbackRetWebMessage = Callback1Param<RetWebMessage, Unit>(wrapper)
        var code: Int32 = 0
        unsafe { FfiOHOSWebMessagePortOnMessageEvent(getID(), callbackRetWebMessage.getID(), inout code) }
        throwIfNotSuccess(code, "WebMessagePort", "onMessageEvent")
    }

    /**
     * Receive message from other port.
     * @param { function } callback - Callback function for receiving messages.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 17100006 - Failed to register a message event for the port.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief onMessageEventExt(callback: (result: WebMessageExt) => void): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func onMessageEventExt(callback: (WebMessageExt) -> Unit): Unit {
        let wrapper = {
            messageId: Int64 =>
            let webMessageExt = WebMessageExt(messageId)
            callback(webMessageExt)
        }
        let callbackWebMessageExt = Callback1Param<Int64, Unit>(wrapper)
        var code: Int32 = 0
        unsafe { FfiOHOSWebMessagePortOnMessageEventExt(getID(), callbackWebMessageExt.getID(), inout code) }
        throwIfNotSuccess(code, "WebMessagePort", "onMessageEventExt")
    }

    /**
     * Close port.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief close(): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func close(): Unit {
        var code: Int32 = 0
        unsafe { FfiOHOSWebMessagePortClose(getID(), inout code) }
        throwIfNotSuccess(code, "WebMessagePort", "close")
    }
}
