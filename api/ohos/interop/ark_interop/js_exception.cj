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

@!APILevel[
    13,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
public abstract class JSInteropException <: Exception {
    init(message: String) {
        super(message)
    }

    protected open func getClassName(): String {
        "JSInteropException"
    }
}

@!APILevel[
    13,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
public class JSThreadMisMatch <: JSInteropException {
    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public init(bindTid: UInt64, curTid: UInt64, message!: String = "js thread mismatch") {
        super("${message}, bind thread id: ${bindTid}, current thread id: ${curTid}")
    }

    protected func getClassName(): String {
        "JSThreadMisMatch"
    }
}

@!APILevel[
    13,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
public class JSTypeMisMatch <: JSInteropException {
    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public init(acquireType: String, givenType: JSType, message!: String = "js type mismatch") {
        super("${message}, acquired: ${acquireType}, given: ${givenType.toString()} ")
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public init(acquireType: JSType, givenType: JSType, message!: String = "js type mismatch") {
        super("${message}, acquired: ${acquireType.toString()}, given: ${givenType.toString()} ")
    }

    protected func getClassName(): String {
        "JSTypeMisMatch"
    }
}

@!APILevel[
    13,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
public class JSArrayRangeMisMatch <: JSInteropException {
    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public init(min: Int64, max: Int64, given: Int64, message!: String = "js array range mismatch") {
        super("${message}, allowed: [${min}, ${max}), given: ${given}")
    }

    protected func getClassName(): String {
        "JSArrayRangeMisMatch"
    }
}

@!APILevel[
    13,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
public class JSObjUseAfterFree <: JSInteropException {
    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public init(message!: String = "use after free") {
        super(message)
    }

    protected func getClassName(): String {
        "JSObjUseAfterFree"
    }
}

@!APILevel[
    13,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
public class JSCodeError <: JSInteropException {
    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public let code: ?Int32
    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public let jsError: String
    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public let jsStack: Array<String>

    protected init(code: Int32, jsMessage: String, jsStack: Array<String>) {
        super("${jsMessage}: ${String.join(jsStack, delimiter: "\n")}")
        this.code = code
        jsError = jsMessage
        this.jsStack = jsStack
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public init(jsMessage: String, jsStack: Array<String>) {
        super("${jsMessage}: ${String.join(jsStack, delimiter: "\n")}")
        this.code = None
        jsError = jsMessage
        this.jsStack = jsStack
    }

    protected func getClassName(): String {
        "JSCodeError"
    }
}

@!APILevel[
    13,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
public class JSInteropNativeError <: JSInteropException {
    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public init(message: String) {
        super(message)
    }

    protected func getClassName(): String {
        "JSInteropNativeError"
    }
}

class JSPropertyError <: JSInteropException {
    init(message: String) {
        super(message)
    }

    protected func getClassName(): String {
        "JSPropertyError"
    }
}
