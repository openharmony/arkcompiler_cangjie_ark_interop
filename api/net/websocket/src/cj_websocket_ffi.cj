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

@C
protected struct CHttpProxy {
    protected CHttpProxy(
        protected var host: CString,
        protected var port: UInt16,
        protected var exclusionList: CArrString,
        protected var username: CString,
        protected var password: CString
    ) {}
    protected init(httpProxy: WebSocketHttpProxy) {
        this.host = CString(CPointer())
        this.port = httpProxy.port ?? 0
        this.exclusionList = CArrString(CPointer(), 0)
        this.username = CString(CPointer())
        this.password = CString(CPointer())
        unsafe {
            try {
                this.host = mallocStringOp(httpProxy.host)
                this.exclusionList = mallocStringListOp(httpProxy.exclusionList)
                this.username = mallocStringOp(httpProxy.username)
                this.password = mallocStringOp(httpProxy.password)
            } catch (e: Exception) {
                LibC.free(host)
                this.exclusionList.free()
                LibC.free(username)
                LibC.free(password)
                throw e
            }
        }
    }

    protected func free() {
        unsafe {
            LibC.free(host)
            this.exclusionList.free()
            LibC.free(username)
            LibC.free(password)
        }
    }
}

@C
struct CWebSocketCallbackData {
    CWebSocketCallbackData(
        let code: Int32,
        let typeId: Int32,
        let data: CPointer<UInt8>,
        let dataLen: Int32
    ) {}

    func convertToResponseOption(): ?Response {
        try {
            match (typeId) {
                case 1 => OpenResponse(this)
                case 2 => MessageResponse(this)
                case 3 => CloseResponse(this)
                case 4 => ErrorResponse(this)
                case 5 => Response(this)
                case 6 => HeaderReceiveResponse(this)
                case _ => throw IllegalArgumentException("Unknown on typeId ${code}")
            }
        } catch (e: Exception) {
            WEB_SOCKET_LOG.error("Fail to convert callback data, ${e}")
            None
        }
    }
}

@C
struct COpenResponse {
    COpenResponse(
        let status: UInt32,
        let message: CString
    ) {}

    func free() {
        unsafe {
            LibC.free(message)
        }
    }
}

@C
struct CMessageResponse {
    CMessageResponse(
        let result: CArrUI8,
        let resultType: Int32
    ) {}

    func free() {
        unsafe {
            LibC.free(result.head)
        }
    }
}

@C
struct CErrorResponse {
    CErrorResponse(
        let code: Int32,
        let httpResponse: UInt32
    ) {}
}

@C
struct CCloseResponse {
    CCloseResponse(
        let code: UInt32,
        let reason: CString
    ) {}

    func free() {
        unsafe {
            LibC.free(reason)
        }
    }
}

@C
struct CReceiveResponse {
    CReceiveResponse(
        let header: CArrString,
        let headerType: Int32
    ) {}

    func free() {
        unsafe {
            this.header.free()
        }
    }
}

@C
struct CClientCert {
    CClientCert(
        var certPath: CString,
        var keyPath: CString,
        var keyPassword: CString
    ) {}

    func free() {
        unsafe {
            LibC.free(certPath)
            LibC.free(keyPath)
            LibC.free(keyPassword)
        }
    }
}

@C
struct CWebSocketRequestOptions {
    CWebSocketRequestOptions(
        var header: CArrString,
        var caPath: CString,
        var clientCert: CPointer<CClientCert>,
        var protocol: CString,
        var usingSystemProxy: Bool,
        var httpProxy: CPointer<CHttpProxy>
    ) {}

    init(ops: WebSocketRequestOptions) {
        this.header = CArrString(CPointer(), 0)
        this.caPath = CString(CPointer())
        this.clientCert = CPointer<CClientCert>()
        this.protocol = CString(CPointer())
        this.usingSystemProxy = false
        this.httpProxy = CPointer<CHttpProxy>()
        unsafe {
            try {
                this.header = mallocArrStringOp(ops.header)
                this.caPath = mallocStringOp(ops.caPath)
                this.clientCert = mallocClientCertOp(ops.clientCert)
                this.protocol = mallocStringOp(ops.protocol)
                (this.usingSystemProxy, this.httpProxy) = parseProxy(ops.proxy)
            } catch (e: Exception) {
                this.header.free()
                LibC.free(this.caPath)
                LibC.free<CClientCert>(this.clientCert)
                LibC.free(this.protocol)
                LibC.free<CHttpProxy>(this.httpProxy)
                throw e
            }
        }
    }

    func free(): Unit {
        unsafe {
            this.header.free()
            LibC.free(this.caPath)
            if (this.clientCert.isNotNull()) {
                this.clientCert.read().free()
            }
            LibC.free<CClientCert>(this.clientCert)
            if (this.httpProxy.isNotNull()) {
                this.httpProxy.read().free()
            }
            LibC.free<CHttpProxy>(this.httpProxy)
            LibC.free(this.protocol)
        }
    }
}

@C
struct CWebSocketCloseOptions {
    CWebSocketCloseOptions(
        var code: UInt32,
        var reason: CString
    ) {}

    init(ops: WebSocketCloseOptions) {
        this.code = ops.code
        this.reason = CString(CPointer())
        unsafe {
            try {
                this.reason = mallocStringOp(ops.reason)
            } catch (e: Exception) {
                LibC.free(this.reason)
                throw e
            }
        }
    }

    func free(): Unit {
        unsafe {
            LibC.free(this.reason)
        }
    }
}

/**
 * C and CJ are converted to each other.
 */
func mallocClientCertOp(cert: ?WebSocketClientCert): CPointer<CClientCert> {
    match (cert) {
        case Some(v) => unsafe {
            let ptr = safeMalloc<CClientCert>()
            ptr.write(v.toCClientCert())
            ptr
        }
        case None => CPointer<CClientCert>()
    }
}

func mallocStringListOp(arr: ?Array<String>): CArrString {
    unsafe {
        match (arr) {
            case Some(v) =>
                let ptr = cjArr2CArr<String, CString>(v, {str => LibC.mallocCString(str)}) {
                    cstr => LibC.free(cstr)
                }
                CArrString(ptr, v.size)
            case None => CArrString(CPointer<CString>(), 0)
        }
    }
}

func mallocStringOp(str: ?String): CString {
    match (str) {
        case Some(v) => unsafe { LibC.mallocCString(v) }
        case None => CString(CPointer<UInt8>())
    }
}

func cArrString2Map(cArrString: CArrString): HashMap<String, String> {
    if (cArrString.head.isNull() || cArrString.size == 0) {
        return HashMap<String, String>(0)
    }
    let size = cArrString.size
    let ptr = cArrString.head
    let map = HashMap<String, String>(size / 2)
    for (i in 0..size : 2) {
        unsafe {
            map.add(ptr.read(i).toString(), ptr.read(i + 1).toString())
        }
    }
    map
}

func mallocArrStringOp(map: ?HashMap<String, String>): CArrString {
    unsafe {
        match (map) {
            case Some(v) => map2CArrString(v)
            case None => CArrString(CPointer<CString>(), 0)
        }
    }
}

unsafe func map2CArrString(map: HashMap<String, String>): CArrString {
    if (map.isEmpty()) {
        return CArrString(CPointer<CString>(), 0)
    }
    let arrLen = map.size * 2
    var index = 0
    let ptr = safeMalloc<CString>(count: arrLen)
    try {
        for ((k, v) in map) {
            let key = LibC.mallocCString(k)
            ptr.write(index, key)
            index++
            let value = LibC.mallocCString(v)
            ptr.write(index, value)
            index++
        }
    } catch (e: Exception) {
        for (i in 0..index) {
            LibC.free(ptr.read(i))
        }
        LibC.free(ptr)
        throw e
    }
    CArrString(ptr, arrLen)
}

func parseProxy(proxy: ProxyConfiguration): (Bool, CPointer<CHttpProxy>) {
    unsafe {
        match (proxy) {
            case SYSTEM => (true, CPointer<CHttpProxy>())
            case NO_PROXY => (false, CPointer<CHttpProxy>())
            case HTTPPROXY(proxy) =>
                let useProxy = safeMalloc<CHttpProxy>()
                try {
                    useProxy.write(CHttpProxy(proxy))
                } catch (e: Exception) {
                    LibC.free(useProxy)
                    throw e
                }
                (false, useProxy)
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

foreign {
    func FfiOHOSWebSocketCreateWebSocket(): Int64

    func FfiOHOSWebSocketConnect(id: Int64, url: CString, opt: CPointer<CWebSocketRequestOptions>): RetDataBool

    func FfiOHOSWebSocketSend(id: Int64, msg: CArrUI8, stringType: Bool): RetDataBool

    func FfiOHOSWebSocketClose(id: Int64, opt: CPointer<CWebSocketCloseOptions>): RetDataBool

    func FfiOHOSWebSocketOnController(id: Int64, typeId: Int32, callback: Int64): Int32

    func FfiOHOSWebSocketOffController(id: Int64, typeId: Int32): Int32
}
