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

/**
 * Interop exception base class.
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Utils.Cangjie"
]
public abstract class JSInteropException <: Exception {
    init(message: String) {
        super(message)
    }

    protected open func getClassName(): String {
        "JSInteropException"
    }
}

/**
 * Thread mismatch Exception when executing ArkTS interface.
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Utils.Cangjie"
]
public class JSThreadMisMatch <: JSInteropException {
    /**
     * Init JSThreadMisMatch exception.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public init(bindTid: UInt64, curTid: UInt64, message!: String = "js thread mismatch") {
        super("${message}, bind thread id: ${bindTid}, current thread id: ${curTid}")
    }

    protected func getClassName(): String {
        "JSThreadMisMatch"
    }
}

/**
 * ArkTS operation type and actual type mismatch exception.
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Utils.Cangjie"
]
public class JSTypeMisMatch <: JSInteropException {
    /**
     * Init JSTypeMisMatch exception.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public init(acquireType: String, givenType: JSType, message!: String = "js type mismatch") {
        super("${message}, acquired: ${acquireType}, given: ${givenType.toString()} ")
    }

    /**
     * Init JSTypeMisMatch exception.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public init(acquireType: JSType, givenType: JSType, message!: String = "js type mismatch") {
        super("${message}, acquired: ${acquireType.toString()}, given: ${givenType.toString()} ")
    }

    protected func getClassName(): String {
        "JSTypeMisMatch"
    }
}

/**
 * ArkTS array acesss out of bounds exception.
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Utils.Cangjie"
]
public class JSArrayRangeMisMatch <: JSInteropException {
    /**
     * Init JSArrayRangeMisMatch exception.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public init(min: Int64, max: Int64, given: Int64, message!: String = "js array range mismatch") {
        super("${message}, allowed: [${min}, ${max}), given: ${given}")
    }

    protected func getClassName(): String {
        "JSArrayRangeMisMatch"
    }
}

/**
 * ArkTS object use after free Exception.
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Utils.Cangjie"
]
public class JSObjUseAfterFree <: JSInteropException {
    /**
     * Init JSObjUseAfterFree exception.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public init(message!: String = "use after free") {
        super(message)
    }

    protected func getClassName(): String {
        "JSObjUseAfterFree"
    }
}

/**
 * Excetion in ArkTS code.
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Utils.Cangjie"
]
public class JSCodeError <: JSInteropException {
    /**
     * Exception error code.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public let code: ?Int32

    /**
     * Exception message.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public let jsError: String

    /**
     * Exception stack.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public let jsStack: Array<String>

    protected init(code: Int32, jsMessage: String, jsStack: Array<String>) {
        super("${jsMessage}: ${String.join(jsStack, delimiter: "\n")}")
        this.code = code
        jsError = jsMessage
        this.jsStack = jsStack
    }

    /**
     * Init JSCodeError exception.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
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

/**
 * Interop C interface exception.
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Utils.Cangjie"
]
public class JSInteropNativeError <: JSInteropException {
    /**
     * Init JSInteropNativeError exception.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
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
