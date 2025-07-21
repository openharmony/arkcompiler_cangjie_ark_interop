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

package ohos.common_event_manager

import ohos.common_event_publish_data.CCommonEventPublishData

foreign {
    func CJ_PublishEvent(event: CString, userId: Int32): Int32

    func CJ_PublishEventWithData(event: CString, userId: Int32, options: CCommonEventPublishData): Int32

    func CJ_SetStaticSubscriberState(enable: Bool): Int32

    func CJ_RemoveStickyCommonEvent(event: CString): Int32

    func CJ_CreateSubscriber(id: Int64): Int64

    func CJ_Subscribe(id: Int64, funcId: Int64): Int32

    func CJ_Unsubscribe(id: Int64): Int32
}

