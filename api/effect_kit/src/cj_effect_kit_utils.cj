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

package ohos.effect_kit

const MATRIX_SIZE: Int64 = 20
const ARRAY_SIZE: Int64 = 4
const ARRAY_SIZE_ONE: Int64 = 0
const ARRAY_SIZE_TWO: Int64 = 1
const ARRAY_SIZE_THREE: Int64 = 2
const ARRAY_SIZE_FOUR: Int64 = 3

func invalidParameter(region: Array<Float64>): Bool {
    if (region.size != ARRAY_SIZE) {
        return false
    }

    for (i in 0..ARRAY_SIZE) {
        if (region[i] < Float64(0) || region[i] > Float64(1)) {
            return false
        }
    }

    if (region[ARRAY_SIZE_FOUR] < region[ARRAY_SIZE_TWO] || region[ARRAY_SIZE_THREE] < region[ARRAY_SIZE_ONE]) {
        return false
    }
    return true
}
