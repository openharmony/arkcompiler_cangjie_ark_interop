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
import std.collection.{ArrayList, HashMap}
import std.sync.Mutex

class CallbackList {
    private let callbackList: ArrayList<CallbackObject>
    private let callBackMutex: Mutex

    init() {
        callbackList = ArrayList<CallbackObject>()
        callBackMutex = Mutex()
    }

    func off(target: CallbackObject): Unit {
        synchronized(callBackMutex) {
            callbackList.removeIf({callback => refEq(callback, target)})
        }
    }

    func on(target: CallbackObject): Unit {
        synchronized(callBackMutex) {
            for (callback in callbackList) {
                if (refEq(callback, target)) {
                    WEB_SOCKET_LOG.info("The callback has been subscribed.")
                    return
                }
            }
            callbackList.add(target)
        }
    }

    func clear(): Unit {
        synchronized(callBackMutex) {
            callbackList.clear()
        }
    }

    func contains(target: Callback1Argument<Response>): Bool {
        synchronized(callBackMutex) {
            for (callback in callbackList) {
                if (refEq(callback, target)) {
                    return true
                }
            }
        }
        false
    }

    func isEmpty(): Bool {
        synchronized(callBackMutex) {
            callbackList.isEmpty()
        }
    }

    func size(): Int64 {
        synchronized(callBackMutex) {
            callbackList.size
        }
    }

    func getAllCallbacks(): Array<CallbackObject> {
        synchronized(callBackMutex) {
            return callbackList.toArray()
        }
    }
}

class WebSocketManager {
    private let webSocketMap: HashMap<Int32, CallbackList>
    private let mutex: Mutex

    init() {
        webSocketMap = HashMap<Int32, CallbackList>()
        mutex = Mutex()
    }

    func get(typeId: Int32): ?CallbackList {
        synchronized(mutex) {
            webSocketMap.get(typeId)
        }
    }

    func consume(typeId: Int32): ?CallbackList {
        synchronized(mutex) {
            webSocketMap.remove(typeId)
        }
    }

    func getOrCreate(`type`: OnOffType): CallbackList {
        synchronized(mutex) {
            if (let Some(v) <- webSocketMap.get(`type`.value)) {
                return v
            }
            let list = CallbackList()
            webSocketMap.add(`type`.value, list)
            list
        }
    }

    func isWebSocketOn(`type`: OnOffType): Bool {
        isWebSocketOn(`type`.value)
    }

    func isWebSocketOn(typeId: Int32): Bool {
        synchronized(mutex) {
            !(webSocketMap.get(typeId)?.isEmpty() ?? true)
        }
    }

    func remove(`type`: OnOffType) {
        synchronized(mutex) {
            webSocketMap.remove(`type`.value)
        }
    }

    static func isMatchType(`type`: OnOffType, callback: CallbackObject): Bool {
        match (`type`) {
            case OPEN => callback is WebSocketAsyncCallback<HashMap<UInt32, String>>
            case MESSAGE => callback is WebSocketAsyncCallback<MessageData>
            case CLOSE => callback is WebSocketAsyncCallback<CloseResult>
            case ERROR => callback is WebSocketErrorCallback
            case DATAEND => callback is Callback0Argument
            case HEADERRECEIVE => callback is Callback1Argument<ResponseHeaders>
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

func emitWebSocketCallback(typeId: Int32, callbackListOpt: ?Array<CallbackObject>, responseData: Response): Unit {
    if (let Some(callbackList) <- callbackListOpt) {
        try {
            for (callback in callbackList) {
                emitOneWebSocketTypeCallback(typeId, callback, responseData)
            }
        } catch (e: Exception) {
            WEB_SOCKET_LOG.error("convertToResponse error, callbackList typeId:${typeId}")
            return
        }
    } else {
        WEB_SOCKET_LOG.info("Fail to find websocket Callback id:${typeId} or callbackList is empty.")
    }
}

func emitOneWebSocketTypeCallback(typeId: Int32, callback: CallbackObject, responseData: Response): Unit {
    match (typeId) {
        case 1 =>
            let callbackInstOpt = (callback as WebSocketAsyncCallback<HashMap<UInt32, String>>)
            if (let Some(callbackInst) <- callbackInstOpt) {
                if (responseData.code != 0) {
                    callbackInst.invoke(AsyncError(responseData.code), None)
                    return
                }
                let res = responseData as OpenResponse
                callbackInst.invoke(None, res?.value)
            }
        case 2 =>
            let callbackInstOpt = (callback as WebSocketAsyncCallback<MessageData>)
            if (let Some(callbackInst) <- callbackInstOpt) {
                if (responseData.code != 0) {
                    callbackInst.invoke(AsyncError(responseData.code), None)
                    return
                }
                let res = responseData as MessageResponse
                callbackInst.invoke(None, res?.value)
            }
        case 3 =>
            let callbackInstOpt = (callback as WebSocketAsyncCallback<CloseResult>)
            if (let Some(callbackInst) <- callbackInstOpt) {
                if (responseData.code != 0) {
                    callbackInst.invoke(AsyncError(responseData.code), None)
                    return
                }
                let res = responseData as CloseResponse
                callbackInst.invoke(None, res?.value)
            }
        case 4 =>
            let callbackInstOpt = (callback as WebSocketErrorCallback)
            if (let Some(callbackInst) <- callbackInstOpt && let Some(res) <- (responseData as ErrorResponse)) {
                callbackInst.invoke((BusinessException(res.errCode, res.httpResponse.toString())))
            }
        case 5 =>
            let callbackInstOpt = (callback as Callback0Argument)
            if (let Some(callbackInst) <- callbackInstOpt) {
                callbackInst.invoke()
            }
        case 6 =>
            let callbackInstOpt = (callback as Callback1Argument<ResponseHeaders>)
            if (let Some(callbackInst) <- callbackInstOpt) {
                let res = responseData as HeaderReceiveResponse
                callbackInst.invoke(res?.value ?? ResponseHeaders.UNDEFINED_DATA)
            }
        case _ => return
    }
}
