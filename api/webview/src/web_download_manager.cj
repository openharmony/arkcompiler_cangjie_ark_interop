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
public class WebDownloadManager {
    /**
     * Set a delegate used to receive the progress of the download triggered from WebDownloadManager.
     * @param { WebDownloadDelegate } delegate - Delegate used for download triggered from WebDownloadManager.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief static setDownloadDelegate(delegate: WebDownloadDelegate): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func setDownloadDelegate(delegate: WebDownloadDelegate): Unit {
        unsafe {
            FfiOHOSWebDownloadManagerImplSetDownloadDelegate(delegate.getID())
        }
    }

    /**
     * Resume the canceled or failed download.
     * @param { WebDownloadItem } webDownloadItem - Download that need to be resume.
     * @throws { BusinessException } 17100018 - No WebDownloadDelegate has been set yet.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief static resumeDownload(webDownloadItem: WebDownloadItem): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public static func resumeDownload(webDownloadItem: WebDownloadItem): Unit {
        unsafe {
            let errCode = FfiOHOSWebDownloadManagerImplResumeDownload(webDownloadItem.getID())
            throwIfNotSuccess(errCode, "WebDownloadManager", "resumeDownload")
        }
    }
}
