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

package ohos.displaySync

import ohos.base.*
import ohos.ffi.*
import std.collection.*
import ohos.component.*

foreign {
    func FfiDisplaySyncCreate(errCode: CPointer<Int32>): Int64

    func FfiDisplaySyncSetExpectedFrameRateRange(id: Int64, rateRange: CExpectedFrameRateRange): Int32

    func FfiDisplaySyncOn(id: Int64, `type`: CString, callbackId: Int64): Int32

    func FfiDisplaySyncOff(id: Int64, `type`: CString, callbackId: Int64): Int32

    func FfiDisplaySyncStart(id: Int64): Int32

    func FfiDisplaySyncStop(id: Int64): Int32
}

@C
struct CExpectedFrameRateRange {
    CExpectedFrameRateRange(
        let min!: Int32 = 60,
        let max!: Int32 = 60,
        let expected!: Int32 = 60
    ) {}

    init(rateRange: ExpectedFrameRateRange) {
        this.min = rateRange.min
        this.max = rateRange.max
        this.expected = rateRange.expected
    }
}

@C
struct CIntervalInfo {
    CIntervalInfo(
        let timestamp: Int64,
        let targetTimestamp: Int64
    ) {}

    init(info: IntervalInfo) {
        timestamp = info.timestamp
        targetTimestamp = info.targetTimestamp
    }
}
