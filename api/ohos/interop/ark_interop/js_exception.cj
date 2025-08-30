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

import ohos.business_exception.*

internal func jsThreadMismatch(bindTid: UInt64, curTid: UInt64): BusinessException {
    BusinessException(34300004, "Accessing an ArkTS object on wrong thread, bound thread is ${bindTid}, current thread is ${curTid}.")
}

internal func jsTypeMisMatch(acquireType: String, givenType: JSType): BusinessException {
    BusinessException(34300005, "The ArkTS data types do not match, expect: ${acquireType}, given: ${givenType.toString()}.")
}

internal func jsTypeMisMatch(acquireType: JSType, givenType: JSType): BusinessException {
    BusinessException(34300005, "The ArkTS data types do not match, expect: ${acquireType.toString()}, given: ${givenType.toString()}.")
}

internal func jsArrayRangeMisMatch(min: Int64, max: Int64, given: Int64, message!: String = "The accessing index is out of range"): BusinessException {
    return BusinessException(34300001, "${message}, allowed: [${min}, ${max}), given: ${given}")
}

internal func jsObjUseAfterFree(kind: String): BusinessException {
    return BusinessException(34300003, "Accessing reference [${kind}] is beyond reach.")
}

internal func jsCodeError(code: Int32, jsMessage: String, jsStack: Array<String>): BusinessException {
    return BusinessException(34300002, "An exception occurred during ArkTS code execution, code: ${code}, " +
        "message: ${jsMessage}, stack: ${String.join(jsStack, delimiter: "\n")}.")
}

internal func jsCodeError(jsMessage: String, jsStack: Array<String>): BusinessException {
    return BusinessException(34300002, "An exception occurred during ArkTS code execution, " +
        "message: ${jsMessage}, stack: ${String.join(jsStack, delimiter: "\n")}.")
}

class JSInteropNativeError <: Exception {
    public init(message: String) {
        super(message)
    }

    protected func getClassName(): String {
        "JSInteropNativeError"
    }
}