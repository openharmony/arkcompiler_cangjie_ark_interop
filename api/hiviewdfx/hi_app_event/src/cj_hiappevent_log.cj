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

package ohos.hiviewdfx.hi_app_event

import ohos.hilog.*

const LOG_CORE: UInt32 = 3
// 0xD002D07 is Log Domain, which is used to filter logs
const LOG_TAG_DOMAIN_ID_HIAPPEVENT: UInt32 = 0xD002D07
let HI_APP_EVENT_LOG = HilogChannel(LOG_CORE, LOG_TAG_DOMAIN_ID_HIAPPEVENT, "CJ-HiAppEvent")
