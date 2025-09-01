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

class JSErrorFuncs {
    let clazz: JSClass

    init(context: JSContext, builtinText: JSBuiltinText) {
        clazz = context.global[builtinText.Error].asClass()
    }
}

// never throw here
class JSError <: JSObjectBase {
    private var name_: ?String = None
    private var message_: ?String = None
    private var stack_: ?Array<String> = None

    init(context: JSContext, value: JSValue_) {
        super(context, value)
    }

    ~init() {
        unsafe { ARKTS_DisposeGlobal(context.env_, globalValue_) }
    }

    prop name: String {
        get() {
            if (let Some(value) <- name_) {
                value
            } else {
                let value = getName()
                name_ = value
                value
            }
        }
    }

    prop message: String {
        get() {
            if (let Some(value) <- message_) {
                value
            } else {
                let value = getMessage()
                message_ = value
                value
            }
        }
    }

    prop stack: Array<String> {
        get() {
            if (let Some(value) <- stack_) {
                value
            } else {
                let value = getStack()
                stack_ = value
                value
            }
        }
    }

    private func getName(): String {
        let value = this[context.constants.builtinText.name]
        if (value.isString()) {
            value.toString()
        } else {
            ""
        }
    }

    private func getMessage(): String {
        let value = this[context.constants.builtinText.message]
        if (value.isString()) {
            value.toString()
        } else {
            ""
        }
    }

    private func getStack(): Array<String> {
        let value = this[context.constants.builtinText.stack]
        if (value.isArray()) {
            let stackArr = value.asArray()
            Array<String>(stackArr.size) {
                index =>
                let curStackValue = stackArr[index]
                if (curStackValue.isString()) {
                    curStackValue.toString()
                } else {
                    "[unrecognized frame]"
                }
            }
        } else {
            []
        }
    }
}
