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

package ohos.file_storage_statistics

foreign {
    func FfiFileStorStatsGetCurrentBundleStats(stats: CPointer<NativeBundleStats>, errCode: CPointer<Int32>): Unit

    func FfiFileStorStatsGetTotalSize(errCode: CPointer<Int32>): Int64

    func FfiFileStorStatsGetFreeSize(errCode: CPointer<Int32>): Int64
}

@C
struct NativeBundleStats {
    NativeBundleStats(
        let appSize: Int64,
        let cacheSize: Int64,
        let dataSize: Int64
    ) {}

    func toObject(): BundleStats {
        BundleStats(appSize, cacheSize, dataSize)
    }
}
