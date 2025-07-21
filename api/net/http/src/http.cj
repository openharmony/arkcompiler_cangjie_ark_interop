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

package ohos.net.http

import ohos.base.*
import ohos.ffi.*
import ohos.hilog.*
import std.collection.*
import ohos.labels.*

let HTTP_LOG = HilogChannel(0, 0xD0015B0, "CJ-net-Http")
const MAX_CACHE_SIZE: UInt32 = 10 * 1024 * 1024
/**
 * Creates an HTTP request task.
 * @returns { HttpRequest } the HttpRequest of the createHttp.
 * @relation createHttp(): HttpRequest;
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public func createHttp(): HttpRequest {
    let id = unsafe { CJ_CreateHttp() }
    HttpRequest(id)
}

/**
 * Creates a default {@code HttpResponseCache} object to store the responses of HTTP access requests.
 * @param { UInt32 } cacheSize - the size of cache(max value is 10MB), default is 10*1024*1024(10MB).
 * @returns { HttpResponseCache } the HttpResponseCache of the createHttpResponseCache.
 * @relation createHttpResponseCache(cacheSize?: number): HttpResponseCache;
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public func createHttpResponseCache(cacheSize!: UInt32 = MAX_CACHE_SIZE): HttpResponseCache {
    HTTP_LOG.info("createHttpResponseCache start")
    let retCode = unsafe { CJ_CreateHttpResponseCache(cacheSize) }
    if (retCode != SUCCESS_CODE) {
        HTTP_LOG.error("createHttpResponseCache failed: ${retCode}")
        throw BusinessException(retCode, "createHttpResponseCache failed: ${retCode}")
    }
    HTTP_LOG.info("createHttpResponseCache success")
    HttpResponseCache()
}

/**
 * Defines an HTTP request task. Before invoking APIs provided by HttpRequest,
 * you must call createHttp() to create an HttpRequestTask object.
 * @relation export interface HttpRequest
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public class HttpRequest {
    private var requested: Bool = false

    // id is RemoteData id, it`s not register to global map
    // will be released when destroy called
    HttpRequest(private let id: Int64) {}

    /**
     * Initiates an HTTP request to a given URL.
     * @permission ohos.permission.INTERNET
     * @param { String } url - URL for initiating an HTTP request.
     * @param { HttpRequestOptions } options - Optional parameters {@link HttpRequestOptions}.
     * @param { HttpResponse } callback - the callback of request.
     * @throws { BusinessException } 401 - Parameter error.
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 2300001 - Unsupported protocol.
     * @throws { BusinessException } 2300003 - URL using bad/illegal format or missing URL.
     * @throws { BusinessException } 2300005 - Couldn't resolve proxy name.
     * @throws { BusinessException } 2300006 - Couldn't resolve host name.
     * @throws { BusinessException } 2300007 - Couldn't connect to server.
     * @throws { BusinessException } 2300008 - Weird server reply.
     * @throws { BusinessException } 2300009 - Access denied to remote resource.
     * @throws { BusinessException } 2300016 - Error in the HTTP2 framing layer.
     * @throws { BusinessException } 2300018 - Transferred a partial file.
     * @throws { BusinessException } 2300023 - Failed writing received data to disk/application.
     * @throws { BusinessException } 2300025 - Upload failed.
     * @throws { BusinessException } 2300026 - Failed to open/read local data from file/application.
     * @throws { BusinessException } 2300027 - Out of memory.
     * @throws { BusinessException } 2300028 - Timeout was reached.
     * @throws { BusinessException } 2300047 - Number of redirects hit maximum amount.
     * @throws { BusinessException } 2300052 - Server returned nothing (no headers, no data).
     * @throws { BusinessException } 2300055 - Failed sending data to the peer.
     * @throws { BusinessException } 2300056 - Failure when receiving data from the peer.
     * @throws { BusinessException } 2300058 - Problem with the local SSL certificate.
     * @throws { BusinessException } 2300059 - Couldn't use specified SSL cipher.
     * @throws { BusinessException } 2300060 - SSL peer certificate or SSH remote key was not OK.
     * @throws { BusinessException } 2300061 - Unrecognized or bad HTTP Content or Transfer-Encoding.
     * @throws { BusinessException } 2300063 - Maximum file size exceeded.
     * @throws { BusinessException } 2300070 - Disk full or allocation exceeded.
     * @throws { BusinessException } 2300073 - Remote file already exists.
     * @throws { BusinessException } 2300077 - Problem with the SSL CA cert (path? access rights?).
     * @throws { BusinessException } 2300078 - Remote file not found.
     * @throws { BusinessException } 2300094 - An authentication function returned an error.
     * @throws { BusinessException } 2300999 - Unknown Other Error.
     * @relation request(url: string, options?: HttpRequestOptions): Promise<HttpResponse>
     */
    @!APILevel[
        21,
        permission: "ohos.permission.INTERNET",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func request(url: String, callback: (?BusinessException, ?HttpResponse) -> Unit,
        options!: ?HttpRequestOptions = None): Unit {
        if (requested) {
            return
        }
        requested = true
        HTTP_LOG.info("HttpRequest request start")
        let (c_url, optPtr) = unsafe { parseParam(url, options) }
        let wrapper = {
            resp: CHttpResponse =>
            HTTP_LOG.info("request callback called")
            if (resp.errCode != SUCCESS_CODE) {
                let errMsg = resp.errMsg.toString()
                unsafe { LibC.free(resp.errMsg) }
                HTTP_LOG.error("HttpRequest request failed: ${resp.errCode}")
                let error = BusinessException(resp.errCode, "HttpRequest request failed: ${errMsg}")
                callback(error, None<HttpResponse>)
            } else {
                callback(None<BusinessException>, HttpResponse(resp))
            }
            HTTP_LOG.info("request callback end")
        }
        let registerCall = Callback1Param<CHttpResponse, Unit>(wrapper)
        let ret = unsafe { CJ_SendRequest(id, c_url, optPtr, false, registerCall.getID()) }
        let retCode = ret.code
        let errMsg = ret.data.toString()
        unsafe {
            LibC.free(ret.data)
            LibC.free(c_url)
            freeOptions(optPtr)
        }
        if (retCode != SUCCESS_CODE) {
            HTTP_LOG.error("HttpRequest request failed: ${retCode}")
            throw BusinessException(retCode, "HttpRequest request failed: ${errMsg}")
        }
        HTTP_LOG.info("HttpRequest request success")
    }

    /**
     * Destroys an HTTP request.
     * @relation destroy(): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func destroy(): Unit {
        HTTP_LOG.info("HttpRequest destroy start")
        if (!requested) {
            requested = true
        }
        unsafe { CJ_DestroyRequest(id) }
        HTTP_LOG.info("HttpRequest destroy success")
    }

    /**
     * Initiates an HTTP request to a given URL, applicable to scenarios where http response supports streaming.
     * @permission ohos.permission.INTERNET
     * @param { String } url - URL for initiating an HTTP request.
     * @param { HttpRequestOptions } options - Optional parameters {@link HttpRequestOptions}.
     * @throws { BusinessException } 401 - Parameter error.
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 2300001 - Unsupported protocol.
     * @throws { BusinessException } 2300003 - URL using bad/illegal format or missing URL.
     * @throws { BusinessException } 2300005 - Couldn't resolve proxy name.
     * @throws { BusinessException } 2300006 - Couldn't resolve host name.
     * @throws { BusinessException } 2300007 - Couldn't connect to server.
     * @throws { BusinessException } 2300008 - Weird server reply.
     * @throws { BusinessException } 2300009 - Access denied to remote resource.
     * @throws { BusinessException } 2300016 - Error in the HTTP2 framing layer.
     * @throws { BusinessException } 2300018 - Transferred a partial file.
     * @throws { BusinessException } 2300023 - Failed writing received data to disk/application.
     * @throws { BusinessException } 2300025 - Upload failed.
     * @throws { BusinessException } 2300026 - Failed to open/read local data from file/application.
     * @throws { BusinessException } 2300027 - Out of memory.
     * @throws { BusinessException } 2300028 - Timeout was reached.
     * @throws { BusinessException } 2300047 - Number of redirects hit maximum amount.
     * @throws { BusinessException } 2300052 - Server returned nothing (no headers, no data).
     * @throws { BusinessException } 2300055 - Failed sending data to the peer.
     * @throws { BusinessException } 2300056 - Failure when receiving data from the peer.
     * @throws { BusinessException } 2300058 - Problem with the local SSL certificate.
     * @throws { BusinessException } 2300059 - Couldn't use specified SSL cipher.
     * @throws { BusinessException } 2300060 - SSL peer certificate or SSH remote key was not OK.
     * @throws { BusinessException } 2300061 - Unrecognized or bad HTTP Content or Transfer-Encoding.
     * @throws { BusinessException } 2300063 - Maximum file size exceeded.
     * @throws { BusinessException } 2300070 - Disk full or allocation exceeded.
     * @throws { BusinessException } 2300073 - Remote file already exists.
     * @throws { BusinessException } 2300077 - Problem with the SSL CA cert (path? access rights?).
     * @throws { BusinessException } 2300078 - Remote file not found.
     * @throws { BusinessException } 2300094 - An authentication function returned an error.
     * @throws { BusinessException } 2300999 - Unknown Other Error.
     * @relation requestInStream(url: string, options?: HttpRequestOptions): Promise<number>;
     */
    @!APILevel[
        21,
        permission: "ohos.permission.INTERNET",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func requestInStream(url: String, callback: (?BusinessException, ?UInt32) -> Unit,
        options!: ?HttpRequestOptions = None): Unit {
        if (requested) {
            return
        }
        requested = true
        HTTP_LOG.info("HttpRequest requestInStream start")
        let (c_url, optPtr) = unsafe { parseParam(url, options) }

        let wrapper = {
            resp: CHttpResponse =>
            HTTP_LOG.info("requestInStream callback called")
            if (resp.errCode != SUCCESS_CODE) {
                let errMsg = resp.errMsg.toString()
                HTTP_LOG.error("HttpRequest requestInStream failed: ${resp.errCode}")
                let error = BusinessException(resp.errCode, "HttpRequest requestInStream failed: ${errMsg}")
                callback(error, None<UInt32>)
            } else {
                callback(None<BusinessException>, resp.responseCode)
            }
            resp.free()
            HTTP_LOG.info("requestInStream callback end")
        }
        let registerCall = Callback1Param<CHttpResponse, Unit>(wrapper)

        let ret = unsafe { CJ_SendRequest(id, c_url, optPtr, true, registerCall.getID()) }
        let retCode = ret.code
        let errMsg = ret.data.toString()
        unsafe {
            LibC.free(ret.data)
            LibC.free(c_url)
            freeOptions(optPtr)
        }

        if (retCode != SUCCESS_CODE) {
            HTTP_LOG.error("HttpRequest requestInStream failed: ${retCode}")
            throw BusinessException(retCode, "HttpRequest requestInStream failed: ${errMsg}")
        }
        HTTP_LOG.info("HttpRequest requestInStream success")
    }

    private unsafe func parseParam(url: String, options: ?HttpRequestOptions): (CString, CPointer<CHttpRequestOptions>) {
        let c_url = LibC.mallocCString(url)
        let optPtr = match (options) {
            case Some(v) =>
                let ptr = safeMalloc<CHttpRequestOptions>(1) {LibC.free(c_url)}
                try {
                    ptr.write(CHttpRequestOptions(v))
                } catch (e: Exception) {
                    LibC.free(c_url)
                    LibC.free(ptr)
                    throw e
                }
                ptr
            case None => CPointer<CHttpRequestOptions>()
        }
        (c_url, optPtr)
    }

    private func freeOptions(ptr: CPointer<CHttpRequestOptions>): Unit {
        if (ptr.isNotNull()) {
            unsafe {
                ptr.read().free()
                LibC.free<CHttpRequestOptions>(ptr)
            }
        }
    }

    /**
     * Registers an observer for HTTP Response Header events.
     * @param { (HashMap<String, String>) -> Unit } callback - the callback used to return the result.
     * @relation on(type: "headersReceive", callback: Callback<Object>): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func onHeadersReceive(callback: (HashMap<String, String>) -> Unit): Unit {
        HTTP_LOG.info("HttpRequest register onHeadersReceive start")
        headersReceive(false, callback)
        HTTP_LOG.info("HttpRequest register onHeadersReceive end")
    }

    /**
     * Unregisters the observer for HTTP Response Header events.
     * @relation off(type: "headersReceive", callback?: Callback<Object>): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func offHeadersReceive(): Unit {
        HTTP_LOG.info("HttpRequest register offHeadersReceive start")
        unsafe { CJ_OffHeadersReceive(id) }
        HTTP_LOG.info("HttpRequest register offHeadersReceive end")
    }

    /**
     * Registers a one-time observer for HTTP Response Header events.
     * @param { (HashMap<String, String>) -> Unit } callback - the callback used to return the result.
     * @relation once(type: "headersReceive", callback: Callback<Object>): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func onceHeadersReceive(callback: (HashMap<String, String>) -> Unit): Unit {
        HTTP_LOG.info("HttpRequest register onceHeadersReceive start")
        headersReceive(true, callback)
        HTTP_LOG.info("HttpRequest register onceHeadersReceive end")
    }

    private func headersReceive(once: Bool, callback: (HashMap<String, String>) -> Unit): Unit {
        let wrapper = {
            cArrString: CArrString =>
            let map = cArrString2Map(cArrString)
            cArrString.free()
            callback(map)
        }
        let registerCall = Callback1Param<CArrString, Unit>(wrapper)
        unsafe { CJ_OnHeadersReceive(id, once, registerCall.getID()) }
    }

    /**
     * Registers an observer for receiving HTTP Response data events continuously.
     * @param { callback: (Array<Byte>) -> Unit } callback - the callback used to return the result.
     * @relation on(type: "dataReceive", callback: Callback<ArrayBuffer>): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func onDataReceive(callback: (Array<Byte>) -> Unit): Unit {
        HTTP_LOG.info("HttpRequest register onDataReceive start")
        let wrapper = {
            cstr: CArrUI8 => unsafe {
                let bytes = cArr2cjArr<UInt8, UInt8>(cstr.size, cstr.head, {i => i})
                LibC.free(cstr.head)
                callback(bytes)
            }
        }
        let registerCall = Callback1Param<CArrUI8, Unit>(wrapper)
        unsafe { CJ_OnDataReceive(id, registerCall.getID()) }
        HTTP_LOG.info("HttpRequest register onDataReceive end")
    }

    /**
     * Unregisters an observer for receiving HTTP Response data events continuously.
     * @relation off(type: "dataReceive", callback?: Callback<ArrayBuffer>): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func offDataReceive(): Unit {
        HTTP_LOG.info("HttpRequest register offDataReceive start")
        unsafe { CJ_OffDataReceive(id) }
        HTTP_LOG.info("HttpRequest register offDataReceive end")
    }

    /**
     * Registers an observer for receiving HTTP Response data ends events.
     * @param { () -> Unit } callback - the callback used to return the result.
     * @relation on(type: "dataEnd", callback: Callback<void>): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func onDataEnd(callback: () -> Unit): Unit {
        HTTP_LOG.info("HttpRequest register onDataEnd start")
        let registerCall = Callback0Param<Unit>(callback)
        unsafe { CJ_OnDataEnd(id, registerCall.getID()) }
        HTTP_LOG.info("HttpRequest register onDataEnd end")
    }

    /**
     * Unregisters an observer for receiving HTTP Response data ends events.
     * @relation off(type: "dataEnd", callback?: Callback<void>): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func offDataEnd(): Unit {
        HTTP_LOG.info("HttpRequest register offDataEnd start")
        unsafe { CJ_OffDataEnd(id) }
        HTTP_LOG.info("HttpRequest register offDataEnd end")
    }

    /**
     * Registers an observer for progress of receiving HTTP Response data events.
     * @param { (DataReceiveProgressInfo) -> Unit } callback - the callback used to return the result.
     * @relation on(type: 'dataReceiveProgress', callback: Callback<DataReceiveProgressInfo>): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func onDataReceiveProgress(callback: (DataReceiveProgressInfo) -> Unit): Unit {
        HTTP_LOG.info("HttpRequest register onDataReceiveProgress start")
        let wrapper = {
            info: CDataReceiveProgressInfo => callback(DataReceiveProgressInfo(info))
        }
        let registerCall = Callback1Param<CDataReceiveProgressInfo, Unit>(wrapper)
        unsafe { CJ_OnDataReceiveProgress(id, registerCall.getID()) }
        HTTP_LOG.info("HttpRequest register onDataReceiveProgress end")
    }

    /**
     * Unregisters an observer for progress of receiving HTTP Response data events.
     * @relation off(type: 'dataReceiveProgress', callback?: Callback<DataReceiveProgressInfo>): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func offDataReceiveProgress(): Unit {
        HTTP_LOG.info("HttpRequest register offDataReceiveProgress start")
        unsafe { CJ_OffDataReceiveProgress(id) }
        HTTP_LOG.info("HttpRequest register offDataReceiveProgress end")
    }

    /**
     * Registers an observer for progress of sendSize HTTP Response data events.
     * @param { (DataSendProgressInfo) -> Unit } callback - the callback of on.
     * @relation on(type: 'dataSendProgress', callback: Callback<DataSendProgressInfo>): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func onDataSendProgress(callback: (DataSendProgressInfo) -> Unit): Unit {
        HTTP_LOG.info("HttpRequest register onDataSendProgress start")
        let wrapper = {
            info: CDataSendProgressInfo => callback(DataSendProgressInfo(info))
        }
        let registerCall = Callback1Param<CDataSendProgressInfo, Unit>(wrapper)
        unsafe { CJ_OnDataSendProgress(id, registerCall.getID()) }
        HTTP_LOG.info("HttpRequest register onDataSendProgress end")
    }

    /**
     * Unregisters an observer for progress of sendSize HTTP Response data events.
     * @relation off(type: 'dataSendProgress', callback?: Callback<DataSendProgressInfo>): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func offDataSendProgress(): Unit {
        HTTP_LOG.info("HttpRequest register offDataSendProgress start")
        unsafe { CJ_OffDataSendProgress(id) }
        HTTP_LOG.info("HttpRequest register offDataSendProgress end")
    }
}

/**
 * Defines an object that stores the response to an HTTP request.
 * @relation export interface HttpResponseCache
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetStack"
]
public class HttpResponseCache {
    init() {}
    /**
     * Writes data in the cache to the file system so that all the cached data can be accessed in the next HTTP request.
     * @returns { Unit } The promise returned by the flush.
     * @relation flush(callback: AsyncCallback<void>): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func flush(): Unit {
        HTTP_LOG.info("HttpResponseCache flush start")
        let retCode = unsafe { CJ_HttpResponseCacheFlush() }
        if (retCode != SUCCESS_CODE) {
            HTTP_LOG.error("HttpResponseCache flush failed: ${retCode}")
            throw BusinessException(retCode, "HttpResponseCache flush failed: ${retCode}")
        }
        HTTP_LOG.info("HttpResponseCache flush success")
    }

    /**
     * Disables a cache and deletes the data in it.
     * @returns { Unit } The promise returned by the delete.
     * @relation delete(): Promise<void>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetStack"
    ]
    public func delete(): Unit {
        HTTP_LOG.info("HttpResponseCache delete start")
        let retCode = unsafe { CJ_HttpResponseCacheDelete() }
        if (retCode != SUCCESS_CODE) {
            HTTP_LOG.error("HttpResponseCache delete failed: ${retCode}")
            throw BusinessException(retCode, "HttpResponseCache delete failed: ${retCode}")
        }
        HTTP_LOG.info("HttpResponseCache delete success")
    }
}
