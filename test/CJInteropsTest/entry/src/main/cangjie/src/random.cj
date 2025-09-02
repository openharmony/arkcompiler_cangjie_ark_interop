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

package entry

import std.random.Random as Rand
import ohos.ark_interop.{JSContext, JSHeapObject, JSValue}

public class Random {
    static let rand = Rand(3)
    static init() {
    }
    public static func jsHeapObject(jsContext: JSContext): JSHeapObject {
        let choose = rand.nextInt8(1)
        match (choose) {
            case _ => jsContext.array([jsContext.boolean(false).toJSValue(), jsContext.number(114.514).toJSValue()])
        }
    }
    public static func jsValue(jsContext: JSContext): JSValue {
        let choose = rand.nextInt8(5)
        match (choose) {
            case 0 => jsContext.undefined().toJSValue()
            case 1 => jsContext.null().toJSValue()
            case 2 => jsContext.boolean(true).toJSValue()
            case 3 => jsContext.number(114.514).toJSValue()
            case 4 => Random.jsHeapObject(jsContext).toJSValue()
            case 5 => jsContext.undefined().toJSValue()
            case _ => jsContext.undefined().toJSValue()
        }
    }
}
