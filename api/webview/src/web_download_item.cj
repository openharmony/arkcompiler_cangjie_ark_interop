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
public class WebDownloadItem <: RemoteDataLite {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init() {
        super(unsafe { FfiOHOSWebDownloadItemImplConstructor() })
    }

    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Get guid.
     * @returns { String } - Returns the download's guid.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getGuid(): string
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getGuid(): String {
        unsafe {
            let ret = FfiOHOSWebDownloadItemImplGetGuid(getID())
            throwIfNotSuccess(ret.code, "WebDownloadItem", "getGuid")
            return getStringAndFree(ret.data)
        }
    }

    /**
     * Get current speed, in bytes per second.
     * @returns { Int64 } - Returns the current download speed.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getCurrentSpeed(): number
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getCurrentSpeed(): Int64 {
        unsafe {
            var code: Int32 = 0
            let speed = FfiOHOSWebDownloadItemImplGetCurrentSpeed(getID(), inout code)
            throwIfNotSuccess(code, "WebDownloadItem", "getCurrentSpeed")
            return speed
        }
    }

    /**
     * Get percent complete.
     * @returns { Int64 } - Returns -1 if progress is unknown. 100 if the download is already complete.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getPercentComplete(): number
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getPercentComplete(): Int64 {
        unsafe {
            var code: Int32 = 0
            let percentComplete = FfiOHOSWebDownloadItemImplGetPercentComplete(getID(), inout code)
            throwIfNotSuccess(code, "WebDownloadItem", "getPercentComplete")
            return percentComplete
        }
    }

    /**
     * Get total bytes.
     * @returns { Int64 } - Returns the total bytes received, -1 if the total size is unknown.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getTotalBytes(): number
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getTotalBytes(): Int64 {
        unsafe {
            var code: Int32 = 0
            let totalBytes = FfiOHOSWebDownloadItemImplGetTotalBytes(getID(), inout code)
            throwIfNotSuccess(code, "WebDownloadItem", "getTotalBytes")
            return totalBytes
        }
    }

    /**
     * Get received bytes.
     * @returns { Int64 } - Returns the received bytes.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getReceivedBytes(): number
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getReceivedBytes(): Int64 {
        unsafe {
            var code: Int32 = 0
            let receivedBytes = FfiOHOSWebDownloadItemImplGetReceivedBytes(getID(), inout code)
            throwIfNotSuccess(code, "WebDownloadItem", "getReceivedBytes")
            return receivedBytes
        }
    }

    /**
     * Get state of the web download.
     * @returns { WebDownloadState } - Returns the current download state.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getState(): WebDownloadState
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getState(): WebDownloadState {
        unsafe {
            var code: Int32 = 0
            let stateId = FfiOHOSWebDownloadItemImplGetState(getID(), inout code)
            throwIfNotSuccess(code, "WebDownloadItem", "getState")
            return WebDownloadState.fromInt32(stateId)
        }
    }

    /**
     * Get last error code of the web download.
     * @returns { WebDownloadErrorCode } - Returns the last error code.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getLastErrorCode(): WebDownloadErrorCode
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getLastErrorCode(): WebDownloadErrorCode {
        unsafe {
            var code: Int32 = 0
            let errorId = FfiOHOSWebDownloadItemImplGetLastErrorCode(getID(), inout code)
            throwIfNotSuccess(code, "WebDownloadItem", "getLastErrorCode")
            return WebDownloadErrorCode.fromInt32(errorId)
        }
    }

    /**
     * Get http method of the web download request.
     * @returns { String } - Returns the http request method.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getMethod(): string
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getMethod(): String {
        unsafe {
            let ret = FfiOHOSWebDownloadItemImplGetMethod(getID())
            throwIfNotSuccess(ret.code, "WebDownloadItem", "getMethod")
            return getStringAndFree(ret.data)
        }
    }

    /**
     * Get mime type of the web download.
     * @returns { String } - Returns the mimetype.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getMimeType(): string
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getMimeType(): String {
        unsafe {
            let ret = FfiOHOSWebDownloadItemImplGetMimeType(getID())
            throwIfNotSuccess(ret.code, "WebDownloadItem", "getMimeType")
            return getStringAndFree(ret.data)
        }
    }

    /**
     * Get url of the web download request.
     * @returns { String } - Returns the url.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getUrl(): string
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getUrl(): String {
        unsafe {
            let ret = FfiOHOSWebDownloadItemImplGetUrl(getID())
            throwIfNotSuccess(ret.code, "WebDownloadItem", "getUrl")
            return getStringAndFree(ret.data)
        }
    }

    /**
     * Get suggested file name of the web download request.
     * @returns { String } - Returns the suggested file name.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getSuggestedFileName(): string
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getSuggestedFileName(): String {
        unsafe {
            let ret = FfiOHOSWebDownloadItemImplGetSuggestedFileName(getID())
            throwIfNotSuccess(ret.code, "WebDownloadItem", "getSuggestedFileName")
            return getStringAndFree(ret.data)
        }
    }

    /**
     * Get full path of the web download.
     * @returns { String } - Returns the full path of the download.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getFullPath(): string
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getFullPath(): String {
        unsafe {
            let ret = FfiOHOSWebDownloadItemImplGetFullPath(getID())
            throwIfNotSuccess(ret.code, "WebDownloadItem", "getFullPath")
            return getStringAndFree(ret.data)
        }
    }

    /**
     * Start the web download.
     * Used in onBeforeDownload, If you want to start the current download, call this function.
     * @param { String } downloadPath - The content will be downloaded to this file.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Incorrect parameter types.
     * <br>2. Parameter verification failed.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief start(downloadPath: string): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func start(downloadPath: String): Unit {
        unsafe {
            let cDownloadPath = LibC.mallocCString(downloadPath)
            let errCode = FfiOHOSWebDownloadItemImplStart(getID(), cDownloadPath)
            LibC.free(cDownloadPath)
            throwIfNotSuccess(errCode, "WebDownloadItem", "start")
        }
    }

    /**
     * Cancel the web download.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief cancel(): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func cancel(): Unit {
        unsafe {
            let errCode = FfiOHOSWebDownloadItemImplCancel(getID())
            throwIfNotSuccess(errCode, "WebDownloadItem", "cancel")
        }
    }

    /**
     * Pause the web download.
     * @throws { BusinessException } 17100019 - The download task is not started yet.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief pause(): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func pause(): Unit {
        unsafe {
            let errCode = FfiOHOSWebDownloadItemImplPause(getID())
            throwIfNotSuccess(errCode, "WebDownloadItem", "pause")
        }
    }

    /**
     * Resume the web download.
     * Use WebDownloadManager.resumeDownload to resume deserialized downloads.
     * WebDownloadItem.resume is only used to resume the currently paused download.
     * @throws { BusinessException } 17100016 - The download task is not paused.
     * @brief resume(): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func resume(): Unit {
        unsafe {
            let errCode = FfiOHOSWebDownloadItemImplResume(getID())
            throwIfNotSuccess(errCode, "WebDownloadItem", "resume")
        }
    }

    /**
     * Serialize web download to typed array.
     * @returns { Array<UInt8> } - Returns the serialized data.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief serialize(): Uint8Array
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func serialize(): Array<UInt8> {
        unsafe {
            var code: Int32 = 0
            let cArrUI8 = FfiOHOSWebDownloadItemImplSerialize(getID(), inout code)
            throwIfNotSuccess(code, "WebDownloadItem", "serialize")
            return toAndfreeArrayUInt8(cArrUI8)
        }
    }

    /**
     * Deserialize web download from typed array.
     * @param { Array<UInt8> } serializedData - The serialized data.
     * @returns { WebDownloadItem } - Deserialize the serialized data into a WebDownloadItem.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Incorrect parameter types.
     * <br>2. Parameter verification failed.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief static deserialize(serializedData: Uint8Array): WebDownloadItem
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func deserialize(serializedData: Array<UInt8>): WebDownloadItem {
        unsafe {
            var code: Int32 = 0
            let dataPtr = acquireArrayRawData(serializedData)
            let cSerializedData = CArrUI8(dataPtr.pointer, serializedData.size)
            let webDownloadItemId = FfiOHOSWebDownloadItemImplDeserialize(cSerializedData, inout code)
            releaseArrayRawData(dataPtr)
            throwIfNotSuccess(code, "WebDownloadItem", "serialize")
            return WebDownloadItem(webDownloadItemId)
        }
    }
}
