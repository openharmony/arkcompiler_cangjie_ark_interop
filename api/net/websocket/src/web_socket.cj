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

package ohos.net.webSocket

import ohos.base.*
import ohos.ffi.*
import std.collection.*
import ohos.labels.*

/**
 * Creates a web socket connection.
 * @returns { WebSocket } the WebSocket of the createWebSocket.
 * @syscap SystemCapability.Communication.NetStack
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public func createWebSocket(): WebSocket {
    let id = unsafe { FfiOHOSWebSocketCreateWebSocket() }
    WebSocket(id)
}

/**
 * <p>Defines a WebSocket object. Before invoking WebSocket APIs,
 * you need to call webSocket.createWebSocket to create a WebSocket object.</p>
 * @interface WebSocket
 * @syscap SystemCapability.Communication.NetStack
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public class WebSocket <: RemoteDataLite {
    let onWebSocketManager = WebSocketManager()

    // id is RemoteData id, it`s not register to global map
    // will be released when close called
    WebSocket(private let id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func connect(url: String, callback: AsyncCallback<Bool>, options!: ?WebSocketRequestOptions = None): Unit {
        let (c_url, optPtr) = unsafe { parseConnectParam(url, options) }
        let ret = unsafe {
            FfiOHOSWebSocketConnect(id, c_url, optPtr)
        }
        unsafe {
            LibC.free(c_url)
            if (optPtr.isNotNull()) {
                optPtr.read().free()
                LibC.free<CWebSocketRequestOptions>(optPtr)
            }
        }
        if (ret.code == 0) {
            callback(None, ret.data)
        } else {
            callback(AsyncError(ret.code), None)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func send(data: MessageData, callback: AsyncCallback<Bool>): Unit {
        let cMsg = unsafe { data.getCData() }
        let stringType = match (data) {
            case STRING_DATA(str) => true
            case ARRAY_DATA(arr) => false
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
        let ret = unsafe {
            FfiOHOSWebSocketSend(id, cMsg, stringType)
        }
        unsafe {
            LibC.free<UInt8>(cMsg.head)
        }
        if (ret.code == 0) {
            callback(None, ret.data)
        } else {
            callback(AsyncError(ret.code), None)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func close(
        callback: AsyncCallback<Bool>,
        options!: ?WebSocketCloseOptions = None
    ): Unit {
        let optPtr = unsafe { parseCloseParam(options) }
        let ret = unsafe {
            FfiOHOSWebSocketClose(id, optPtr)
        }
        unsafe {
            if (optPtr.isNotNull()) {
                optPtr.read().free()
                LibC.free<CWebSocketCloseOptions>(optPtr)
            }
        }
        if (ret.code == 0) {
            callback(None, ret.data)
        } else {
            callback(AsyncError(ret.code), None)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func on(`type`: OnOffType, callback: WebSocketAsyncCallback<HashMap<UInt32, String>>): Unit {
        if (`type` != OnOffType.OPEN) {
            WEB_SOCKET_LOG.error("[WebSocket] on Parameter error. typeId:${`type`.value}")
            throw BusinessException(PARAM_INVALID, getErrorMsg(PARAM_INVALID))
        }
        onMethod(`type`, callback)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func on(`type`: OnOffType, callback: WebSocketAsyncCallback<MessageData>): Unit {
        if (`type` != OnOffType.MESSAGE) {
            WEB_SOCKET_LOG.error("[WebSocket] on Parameter error. typeId:${`type`.value}")
            throw BusinessException(PARAM_INVALID, getErrorMsg(PARAM_INVALID))
        }
        onMethod(`type`, callback)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func on(`type`: OnOffType, callback: WebSocketAsyncCallback<CloseResult>): Unit {
        if (`type` != OnOffType.CLOSE) {
            WEB_SOCKET_LOG.error("[WebSocket] on Parameter error. typeId:${`type`.value}")
            throw BusinessException(PARAM_INVALID, getErrorMsg(PARAM_INVALID))
        }
        onMethod(`type`, callback)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func on(`type`: OnOffType, callback: WebSocketErrorCallback): Unit {
        if (`type` != OnOffType.ERROR) {
            WEB_SOCKET_LOG.error("[WebSocket] on Parameter error. typeId:${`type`.value}")
            throw BusinessException(PARAM_INVALID, getErrorMsg(PARAM_INVALID))
        }
        onMethod(`type`, callback)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func on(`type`: OnOffType, callback: Callback0Argument): Unit {
        if (`type` != OnOffType.DATAEND) {
            WEB_SOCKET_LOG.error("[WebSocket] on Parameter error. typeId:${`type`.value}")
            throw BusinessException(PARAM_INVALID, getErrorMsg(PARAM_INVALID))
        }
        onMethod(`type`, callback)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func on(`type`: OnOffType, callback: Callback1Argument<ResponseHeaders>): Unit {
        if (`type` != OnOffType.HEADERRECEIVE) {
            WEB_SOCKET_LOG.error("[WebSocket] on Parameter error. typeId:${`type`.value}")
            throw BusinessException(PARAM_INVALID, getErrorMsg(PARAM_INVALID))
        }
        onMethod(`type`, callback)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func off(`type`: OnOffType, callback!: ?CallbackObject = None): Unit {
        if (!onWebSocketManager.isWebSocketOn(`type`)) {
            return
        }
        let size = match (callback) {
            case Some(v) => removeCallback(`type`, v)
            case None => removeAllCallback(`type`)
        }
        if (size > 0) {
            return
        }
    }

    private func onMethod(`type`: OnOffType, callback: CallbackObject): Unit {
        let lambdaData = Callback1Param<CPointer<CWebSocketCallbackData>, Unit>(dataCallbackImpl)
        let ret: Int32 = unsafe {
            FfiOHOSWebSocketOnController(id, `type`.value, lambdaData.getID())
        }
        checkRet(ret, "[WebSocket] on: ");
        onWebSocketManager.getOrCreate(`type`).on(callback)
    }

    private func dataCallbackImpl(data: CPointer<CWebSocketCallbackData>): Unit {
        WEB_SOCKET_LOG.info("dataCallbackImpl is start.")
        if (data.isNull()) {
            WEB_SOCKET_LOG.error("CWebSocketCallbackData is nullptr.")
            return
        }

        let callbackData = unsafe { data.read() }
        let responseData = match (callbackData.convertToResponseOption()) {
            case None =>
                WEB_SOCKET_LOG.error("convertToResponse error")
                return
            case Some(v) => v
        }

        let onCallbackListOpt = onWebSocketManager.get(responseData.`type`.value)?.getAllCallbacks()
        emitWebSocketCallback(responseData.`type`.value, onCallbackListOpt, responseData)
    }

    private func removeCallback(`type`: OnOffType, callback: CallbackObject): Int64 {
        if (!WebSocketManager.isMatchType(`type`, callback)) {
            throw BusinessException(PARAM_INVALID, getErrorMsg(PARAM_INVALID))
        }

        let list = onWebSocketManager.getOrCreate(`type`)
        list.off(callback)
        if (list.isEmpty()) {
            onWebSocketManager.remove(`type`)
            let ret = unsafe {
                FfiOHOSWebSocketOffController(id, `type`.value)
            }
            checkRet(ret, "[WebSocket] removeCallback type = ${`type`.value.toString()}");
            return 0
        }

        return list.size()
    }

    private func removeAllCallback(`type`: OnOffType): Int64 {
        onWebSocketManager.remove(`type`)
        let ret = unsafe {
            FfiOHOSWebSocketOffController(id, `type`.value)
        }
        checkRet(ret, "[WebSocket] removeAllCallback: ");
        0
    }
}

private unsafe func parseConnectParam(url: String, options: ?WebSocketRequestOptions): (CString, CPointer<CWebSocketRequestOptions>) {
    let c_url = LibC.mallocCString(url)
    let optPtr = match (options) {
        case Some(v) =>
            let ptr = safeMalloc<CWebSocketRequestOptions>(1) {LibC.free(c_url)}
            try {
                ptr.write(CWebSocketRequestOptions(v))
            } catch (e: Exception) {
                LibC.free(c_url)
                LibC.free(ptr)
                throw e
            }
            ptr
        case None => CPointer<CWebSocketRequestOptions>()
    }
    (c_url, optPtr)
}

private unsafe func parseCloseParam(options: ?WebSocketCloseOptions): CPointer<CWebSocketCloseOptions> {
    let optPtr = match (options) {
        case Some(v) =>
            let ptr = safeMalloc<CWebSocketCloseOptions>()
            try {
                ptr.write(CWebSocketCloseOptions(v))
            } catch (e: Exception) {
                LibC.free(ptr)
                throw e
            }
            ptr
        case None => CPointer<CWebSocketCloseOptions>()
    }
    return optPtr
}
