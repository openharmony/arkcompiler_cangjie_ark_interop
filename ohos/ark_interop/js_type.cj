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

package ohos.ark_interop

let JS_TYPE_NAMES_ = ["undefined", "null", "number", "bool", "bigint", "string", "symbol", "object", "function",
    "external"]

/**
 * The ArkTS data type enumeration.
 */
@!APILevel[22, stagemodelonly: true]
@C
public struct JSType {
    /**
     * ArkTS undefined type.
     */
    @!APILevel[22, stagemodelonly: true]
    public static let UNDEFINED: JSType = JSType(0)

    /**
     * ArkTS null type.
     */
    @!APILevel[22, stagemodelonly: true]
    public static let NULL: JSType = JSType(1)

    /**
     * ArkTS number type.
     */
    @!APILevel[22, stagemodelonly: true]
    public static let NUMBER: JSType = JSType(2)

    /**
     * ArkTS boolean type.
     */
    @!APILevel[22, stagemodelonly: true]
    public static let BOOLEAN: JSType = JSType(3)

    /**
     * ArkTS bigint type.
     */
    @!APILevel[22, stagemodelonly: true]
    public static let BIGINT: JSType = JSType(4)

    /**
     * ArkTS string type.
     */
    @!APILevel[22, stagemodelonly: true]
    public static let STRING: JSType = JSType(5)

    /**
     * ArkTS symbol type.
     */
    @!APILevel[22, stagemodelonly: true]
    public static let SYMBOL: JSType = JSType(6)

    /**
     * ArkTS object type.
     */
    @!APILevel[22, stagemodelonly: true]
    public static let OBJECT: JSType = JSType(7)

    /**
     * ArkTS function type.
     */
    @!APILevel[22, stagemodelonly: true]
    public static let FUNCTION: JSType = JSType(8)

    /**
     * ArkTS external type.
     */
    @!APILevel[22, stagemodelonly: true]
    public static let EXTERNAL: JSType = JSType(9)

    JSType(let value: Int32) {}

    /**
     * Return true if and only if the two JSType are identical.
     */
    @!APILevel[22, stagemodelonly: true]
    public operator func ==(target: JSType): Bool {
        value == target.value
    }

    /**
     * Return true if and only if the two JSType are not identical.
     */
    @!APILevel[22, stagemodelonly: true]
    public operator func !=(target: JSType): Bool {
        value != target.value
    }

    /**
     * Get string description of JSType.
     */
    @!APILevel[22, stagemodelonly: true]
    public func toString(): String {
        JS_TYPE_NAMES_[Int64(value)]
    }
}
