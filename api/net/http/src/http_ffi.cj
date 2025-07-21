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

import ohos.ffi.*
import ohos.net.connection.CHttpProxy
import std.collection.*

foreign {
    func CJ_CreateHttpResponseCache(cacheSize: UInt32): Int32

    func CJ_HttpResponseCacheFlush(): Int32

    func CJ_HttpResponseCacheDelete(): Int32

    func CJ_CreateHttp(): Int64

    func CJ_DestroyRequest(id: Int64): Unit

    func CJ_SendRequest(id: Int64, url: CString, opt: CPointer<CHttpRequestOptions>, isInStream: Bool, callback: Int64): RetDataCString

    func CJ_OnHeadersReceive(id: Int64, once: Bool, callback: Int64): Unit

    func CJ_OffHeadersReceive(id: Int64): Unit

    func CJ_OnDataReceive(id: Int64, callback: Int64): Unit

    func CJ_OffDataReceive(id: Int64): Unit

    func CJ_OnDataEnd(id: Int64, callback: Int64): Unit

    func CJ_OffDataEnd(id: Int64): Unit

    func CJ_OnDataReceiveProgress(id: Int64, callback: Int64): Unit

    func CJ_OffDataReceiveProgress(id: Int64): Unit

    func CJ_OnDataSendProgress(id: Int64, callback: Int64): Unit

    func CJ_OffDataSendProgress(id: Int64): Unit
}

@C
struct CArrMultiFormData {
    CArrMultiFormData(
        let data: CPointer<CMultiFormData>,
        let size: Int64
    ) {}

    func free(): Unit {
        if (this.data.isNotNull()) {
            unsafe {
                for (i in 0..size) {
                    this.data.read(i).free()
                }
                LibC.free<CMultiFormData>(data)
            }
        }
    }
}

@C
struct CHttpRequestOptions {
    var method: CString
    //Additional data of the request.
    var extraData: CArrUI8
    // Data type to be returned. If this parameter is set, the system preferentially returns the specified type.
    var expectDataType: Int32
    // default true
    var usingCache: Bool
    // default 1
    var priority: UInt32
    // default is 'content-type': 'application/json'
    var header: CArrString
    // The default value is 60,000, in ms.
    var readTimeout: UInt32
    // The default value is 60,000, in ms.
    var connectTimeout: UInt32
    // default is automatically specified by the system.
    var usingProtocol: Int32
    // If this parameter is set as type of boolean, the system will use default proxy or not use proxy.
    // If this parameter is set as type of HttpProxy, the system will use the specified HttpProxy.
    var usingDefaultProxy: Bool
    var usingProxy: CPointer<CHttpProxy>
    // If this parameter is set, the system will use ca path specified by user, or else use preset ca by the system.
    var caPath: CString
    var resumeFrom: Int64
    var resumeTo: Int64
    var clientCert: CPointer<CClientCert>
    var dnsOverHttps: CString
    var dnsServers: CArrString
    var maxLimit: UInt32
    var multiFormDataList: CArrMultiFormData

    init(ops: HttpRequestOptions) {
        this.method = CString(CPointer())
        this.extraData = ops.extraData?.getCData() ?? CArrUI8(CPointer<UInt8>(), 0)
        this.expectDataType = ops.expectDataType?.getValue() ?? 3
        this.usingCache = ops.usingCache
        this.priority = ops.priority
        this.header = CArrString(CPointer(), 0)
        this.readTimeout = ops.readTimeout
        this.connectTimeout = ops.connectTimeout
        this.usingProtocol = ops.usingProtocol?.getValue() ?? -1
        this.usingDefaultProxy = false
        this.usingProxy = CPointer<CHttpProxy>()
        this.resumeFrom = ops.resumeFrom ?? 0
        this.resumeTo = ops.resumeTo ?? 0
        this.maxLimit = ops.maxLimit
        this.dnsOverHttps = CString(CPointer())
        this.dnsServers = CArrString(CPointer(), 0)
        this.caPath = CString(CPointer())
        this.clientCert = CPointer<CClientCert>()
        this.multiFormDataList = CArrMultiFormData(CPointer(), 0)
        unsafe {
            try {
                this.method = LibC.mallocCString(ops.method.getValue())
                this.header = mallocArrStringOp(ops.header)
                this.caPath = mallocStringOp(ops.caPath)
                this.dnsOverHttps = mallocStringOp(ops.dnsOverHttps)
                this.clientCert = mallocClientCertOp(ops.clientCert)
                this.dnsServers = mallocDnsServersOp(ops.dnsServers)
                this.multiFormDataList = mallocMultiFormOp(ops.multiFormDataList)
                (this.usingDefaultProxy, this.usingProxy) = parseUsingProxy(ops.usingProxy)
            } catch (e: Exception) {
                this.header.free()
                LibC.free(this.dnsOverHttps)
                this.dnsServers.free()
                LibC.free(this.method)
                LibC.free(this.caPath)
                LibC.free<CClientCert>(this.clientCert)
                LibC.free<UInt8>(this.extraData.head)
                this.multiFormDataList.free()
                throw e
            }
        }
    }

    func free(): Unit {
        unsafe {
            LibC.free(this.method)
            LibC.free(this.caPath)
            LibC.free(this.dnsOverHttps)
            LibC.free<UInt8>(this.extraData.head)
            this.header.free()
            this.dnsServers.free()
            if (this.usingProxy.isNotNull()) {
                this.usingProxy.read().free()
            }
            LibC.free<CHttpProxy>(this.usingProxy)
            if (this.clientCert.isNotNull()) {
                this.clientCert.read().free()
            }
            LibC.free<CClientCert>(this.clientCert)
            this.multiFormDataList.free()
        }
    }
}

func parseUsingProxy(usingProxy: UsingProxy): (Bool, CPointer<CHttpProxy>) {
    unsafe {
        match (usingProxy) {
            case NotUse => (false, CPointer<CHttpProxy>())
            case UseDefault => (true, CPointer<CHttpProxy>())
            case UseSpecified(proxy) =>
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

func mallocStringOp(str: ?String): CString {
    match (str) {
        case Some(v) => unsafe { LibC.mallocCString(v) }
        case None => CString(CPointer<UInt8>())
    }
}

func mallocArrStringOp(map: ?HashMap<String, String>): CArrString {
    unsafe {
        match (map) {
            case Some(v) => map2CArrString(v)
            case None => CArrString(CPointer<CString>(), 0)
        }
    }
}

func mallocClientCertOp(cert: ?ClientCert): CPointer<CClientCert> {
    match (cert) {
        case Some(v) => unsafe {
            let ptr = safeMalloc<CClientCert>()
            ptr.write(v.toCClientCert())
            ptr
        }
        case None => CPointer<CClientCert>()
    }
}

func mallocDnsServersOp(dns: ?Array<String>): CArrString {
    unsafe {
        match (dns) {
            case Some(v) =>
                let ptr = cjArr2CArr<String, CString>(v, {str => LibC.mallocCString(str)}) {
                    cstr => LibC.free(cstr)
                }
                CArrString(ptr, v.size)
            case None => CArrString(CPointer<CString>(), 0)
        }
    }
}

func mallocMultiFormOp(data: ?Array<MultiFormData>): CArrMultiFormData {
    unsafe {
        match (data) {
            case Some(v) =>
                let ptr = cjArr2CArr<MultiFormData, CMultiFormData>(v, {multi => CMultiFormData(multi)}) {
                    cdata => cdata.free()
                }
                CArrMultiFormData(ptr, v.size)
            case None => CArrMultiFormData(CPointer<CMultiFormData>(), 0)
        }
    }
}

@C
struct CHttpResponse {
    CHttpResponse(
        let errCode: Int32,
        let errMsg: CString,
        let result: CArrUI8,
        let resultType: Int32,
        let responseCode: UInt32,
        let header: CArrString,
        let cookies: CString,
        let setCookie: CArrString,
        let performanceTiming: CPerformanceTiming
    ) {}

    func free(): Unit {
        unsafe {
            LibC.free(errMsg)
            LibC.free(cookies)
            LibC.free(result.head)
            header.free()
            setCookie.free()
        }
    }
}

@C
struct CPerformanceTiming {
    CPerformanceTiming(
        // Time taken from startup to DNS resolution completion, in milliseconds.
        let dnsTiming: Float64,

        // Time taken from startup to TCP connection completion, in milliseconds.
        let tcpTiming: Float64,

        // Time taken from startup to TLS connection completion, in milliseconds.
        let tlsTiming: Float64,

        // Time taken from startup to start sending the first byte, in milliseconds.
        let firstSendTiming: Float64,

        // Time taken from startup to receiving the first byte, in milliseconds.
        let firstReceiveTiming: Float64,

        // Time taken from startup to the completion of the request, in milliseconds.
        let totalFinishTiming: Float64,

        // Time taken from startup to completion of all redirection steps, in milliseconds.
        let redirectTiming: Float64,

        // Time taken from HTTP request to header completion, in milliseconds.
        let responseHeaderTiming: Float64,

        // Time taken from HTTP Request to body completion, in milliseconds.
        let responseBodyTiming: Float64,

        // Time taken from HTTP Request to callback to the application, in milliseconds.
        let totalTiming: Float64
    ) {}
}

@C
struct CDataReceiveProgressInfo {
    CDataReceiveProgressInfo(
        // Number of data bytes received.
        let receiveSize: UInt32,

        // Total number of bytes to receive.
        let totalSize: UInt32
    ) {}
}

@C
struct CDataSendProgressInfo {
    CDataSendProgressInfo(
        // Used to specify the data size to be sent.
        let sendSize: UInt32,

        // Total number of bytes to send.
        let totalSize: UInt32
    ) {}
}

@C
struct CClientCert {
    CClientCert(
        // The path to the client certificate file.
        var certPath: CString,

        // The path of the client certificate private key file.
        var keyPath: CString,

        // The type of the client certificate.
        var certType: CString,

        // Password required to use the client certificate private key.
        var keyPassword: CString
    ) {}

    func free(): Unit {
        unsafe {
            LibC.free(certPath)
            LibC.free(keyPath)
            LibC.free(certType)
            LibC.free(keyPassword)
        }
    }
}

@C
struct CMultiFormData {
    CMultiFormData(
        // MIME name for the data field.
        var name: CString,

        // Content type of the data field.
        var contentType: CString,

        // Remote file name for the data field.
        var remoteFileName: CString,

        // This parameter sets a mime part's body content from memory data.
        var data: CArrUI8,

        // This parameter sets a mime part's body content from the file's contents.
        // This is an alternative to curl_mime_data for setting data to a mime part.
        // If data is empty, filePath must be set.
        // If data has a value, filePath does not take effect.
        var filePath: CString
    ) {}

    init(formData: MultiFormData) {
        this.name = CString(CPointer())
        this.contentType = CString(CPointer())
        this.remoteFileName = CString(CPointer())
        this.filePath = CString(CPointer())
        this.data = match (formData.data) {
            case Some(v) => v.getCData()
            case None => CArrUI8(CPointer<UInt8>(), 0)
        }
        unsafe {
            try {
                this.name = LibC.mallocCString(formData.name)
                this.contentType = LibC.mallocCString(formData.contentType)
                this.remoteFileName = mallocStringOp(formData.remoteFileName)
                this.filePath = mallocStringOp(formData.filePath)
            } catch (e: Exception) {
                LibC.free(name)
                LibC.free(contentType)
                LibC.free(remoteFileName)
                LibC.free<UInt8>(data.head)
                throw e
            }
        }
    }

    func free(): Unit {
        unsafe {
            LibC.free(name)
            LibC.free(contentType)
            LibC.free(remoteFileName)
            LibC.free(filePath)
            LibC.free<UInt8>(data.head)
        }
    }
}
