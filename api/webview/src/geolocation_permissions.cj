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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class BackForwardList <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public prop currentIndex: Int32 {
        get() {
            unsafe {
                var code: Int32 = 0
                let index = FfiOHOSBackForwardListCurrentIndex(getID(), inout code)
                throwIfNotSuccess(code, "BackForwardList", "currentIndex")
                return index
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public prop size: Int32 {
        get() {
            unsafe {
                var code: Int32 = 0
                let listSize = FfiOHOSBackForwardListSize(getID(), inout code)
                throwIfNotSuccess(code, "BackForwardList", "size")
                return listSize
            }
        }
    }

    /**
     * Get history entry at given index.
     *
     * @param { Int32 } index Index of back forward list entry.
     * @returns { HistoryItem } HistoryItem at given index in back forward list.
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @syscap SystemCapability.Web.Webview.Core
     * @brief getItemAtIndex(index: number): HistoryItem
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getItemAtIndex(index: Int32): HistoryItem {
        unsafe {
            var code: Int32 = 0
            let item = FfiOHOSGetItemAtIndex(getID(), index, inout code)
            throwIfNotSuccess(code, "BackForwardList", "getItemAtIndex")
            return item.toHistoryItemAndFree()
        }
    }
}
