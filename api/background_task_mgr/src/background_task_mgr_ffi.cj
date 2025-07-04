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

package ohos.background_task_mgr

foreign {
    func CJ_RequestSuspendDelay(id: Int64, reason: CString, ret: CPointer<RetDelaySuspendInfo>): Int32

    func CJ_GetRemainingDelayTime(requestId: Int32, ret: CPointer<Int32>): Int32

    func CJ_CancelSuspendDelay(requestId: Int32): Int32

    func CJ_StopBackgroundRunning(ctx: CPointer<Unit>): Int32
}

@C
protected struct RetDelaySuspendInfo {
    RetDelaySuspendInfo(
        protected let requestId: Int32,
        protected let actualDelayTime: Int32
    ) {}
}
