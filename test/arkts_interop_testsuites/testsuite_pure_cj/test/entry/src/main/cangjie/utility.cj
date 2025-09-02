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

package ohos_app_cangjie_entry

import ohos.ark_interop.*
import ohos.state_manage.AppStorage

public func getJSContext(): JSContext {
    let result = Box(None<JSRuntime>)
    while (true) {
        match (AppStorage.get<JSRuntime>("jsRuntime")) {
            case None => sleep(Duration.millisecond)

            case Some(jsRuntime) =>
                result.value = jsRuntime
                break
        }
    }
    result.value.getOrThrow().mainContext
}
