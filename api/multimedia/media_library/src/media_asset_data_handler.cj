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

package ohos.multimedia.photo_accesshelper

import ohos.labels.*
import ohos.ffi.*
import ohos.base.*
import std.collection.*

/**
 * Data handler used to notify the progress of required media asset data
 *
 * @interface MediaAssetProgressHandler
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public abstract class MediaAssetDataHandler<T> {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public open func onDataPrepared(data: T, map: HashMap<String, String>): Unit
}
