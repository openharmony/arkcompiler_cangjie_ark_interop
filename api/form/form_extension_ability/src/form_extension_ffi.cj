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

package ohos.form.form_extension_ability

import std.collection.HashMap
import ohos.ffi.{CArrString, CArrI32}

@C
struct CRecordI64I32 {
    CRecordI64I32(
        let keys: CArrString,
        let values: CArrI32
    ) {}

    unsafe func toHashMap(): HashMap<String, Int32> {
        let size = keys.size
        let keysPtr = keys.head
        let valuesPtr = values.head
        if (size == 0 || keysPtr.isNull() || valuesPtr.isNull()) {
            return HashMap<String, Int32>(0)
        }
        return HashMap<String, Int32>(
            size,
            {i => (keysPtr.read(i).toString(), valuesPtr.read(i))}
        )
    }
}
