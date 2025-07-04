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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class WebDownloadDelegate <: RemoteDataLite {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init() {
        super(unsafe { FfiOHOSWebDownloadDelegateImplConstructor() })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Callback will be triggered before web download start.
     * @param { (WebDownloadItem) -> Unit } callback - The callback of download will be start.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief onBeforeDownload(callback: Callback<WebDownloadItem>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func onBeforeDownload(callback: (WebDownloadItem) -> Unit): Unit {
        let wrapper = {
            webDownloadItemId: Int64 =>
            let webDownloadItem = WebDownloadItem(webDownloadItemId)
            callback(webDownloadItem)
        }
        let beforeCall = Callback1Param<Int64, Unit>(wrapper)
        unsafe { FfiOHOSWebDownloadDelegateImplOnBeforeDownload(getID(), beforeCall.getID()) }
    }

    /**
     * Callback will be triggered when web download is processing.
     * @param { (WebDownloadItem) -> Unit } callback - The callback of download did update.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief onDownloadUpdated(callback: Callback<WebDownloadItem>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func onDownloadUpdated(callback: (WebDownloadItem) -> Unit): Unit {
        let wrapper = {
            webDownloadItemId: Int64 =>
            let webDownloadItem = WebDownloadItem(webDownloadItemId)
            callback(webDownloadItem)
        }
        let beforeCall = Callback1Param<Int64, Unit>(wrapper)
        unsafe { FfiOHOSWebDownloadDelegateImplOnDownloadUpdated(getID(), beforeCall.getID()) }
    }

    /**
     * Callback will be triggered when web download is completed.
     * @param { (WebDownloadItem) -> Unit } callback - The callback of download did finish.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief onDownloadFinish(callback: Callback<WebDownloadItem>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func onDownloadFinish(callback: (WebDownloadItem) -> Unit): Unit {
        let wrapper = {
            webDownloadItemId: Int64 =>
            let webDownloadItem = WebDownloadItem(webDownloadItemId)
            callback(webDownloadItem)
        }
        let beforeCall = Callback1Param<Int64, Unit>(wrapper)
        unsafe { FfiOHOSWebDownloadDelegateImplOnDownloadFinish(getID(), beforeCall.getID()) }
    }

    /**
     * Callback will be triggered when web download is interrupted or canceled.
     * @param { (WebDownloadItem) -> Unit } callback - The callback of download did fail.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief onDownloadFailed(callback: Callback<WebDownloadItem>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func onDownloadFailed(callback: (WebDownloadItem) -> Unit): Unit {
        let wrapper = {
            webDownloadItemId: Int64 =>
            let webDownloadItem = WebDownloadItem(webDownloadItemId)
            callback(webDownloadItem)
        }
        let beforeCall = Callback1Param<Int64, Unit>(wrapper)
        unsafe { FfiOHOSWebDownloadDelegateImplOnDownloadFailed(getID(), beforeCall.getID()) }
    }
}
