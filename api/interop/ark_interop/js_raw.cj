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

@FastNative
foreign func ARKTS_GetValueType(env: JSEnv, value: JSValue_): JSType

@FastNative
foreign func ARKTS_StrictEqual(env: JSEnv, a: JSValue_, b: JSValue_): Bool

@FastNative
foreign func ARKTS_IsNull(value: JSValue_): Bool

@FastNative
foreign func ARKTS_IsUndefined(value: JSValue_): Bool

@FastNative
foreign func ARKTS_IsBool(value: JSValue_): Bool

@FastNative
foreign func ARKTS_IsNumber(value: JSValue_): Bool

@FastNative
foreign func ARKTS_IsString(env: JSEnv, value: JSValue_): Bool

@FastNative
foreign func ARKTS_IsCallable(env: JSEnv, value: JSValue_): Bool

@FastNative
foreign func ARKTS_IsObject(env: JSEnv, value: JSValue_): Bool

@FastNative
foreign func ARKTS_IsArray(env: JSEnv, value: JSValue_): Bool

@FastNative
foreign func ARKTS_IsPromise(env: JSEnv, value: JSValue_): Bool

@FastNative
foreign func ARKTS_IsClass(env: JSEnv, value: JSValue_): Bool

@FastNative
foreign func ARKTS_IsExternal(env: JSEnv, value: JSValue_): Bool

@FastNative
foreign func ARKTS_GetValueNumber(value: JSValue_): Float64

@FastNative
foreign func ARKTS_GetValueBool(value: JSValue_): Bool

@C
protected struct JSValue_ {
    JSValue_(let value: UInt64) {}
}

@!APILevel[
    13,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
public struct JSNull {
    let value: JSValue

    init(value: JSValue) {
        this.value = value
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toJSValue(): JSValue {
        value
    }
}

@!APILevel[
    13,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
public struct JSUndefined {
    let value: JSValue

    init(value: JSValue) {
        this.value = value
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toJSValue(): JSValue {
        value
    }
}

@!APILevel[
    13,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
public struct JSBoolean {
    let value: JSValue

    init(value: JSValue) {
        this.value = value
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toJSValue(): JSValue {
        value
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toBool(): Bool {
        value.toBoolean()
    }
}

@!APILevel[
    13,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
public struct JSNumber {
    let value: JSValue

    init(value: JSValue) {
        this.value = value
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toJSValue(): JSValue {
        value
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toFloat64(): Float64 {
        value.toNumber()
    }
}

@!APILevel[
    13,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
public struct JSValue {
    protected JSValue(
        let context: JSContext,
        protected let value: JSValue_
    ) {}

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func typeof(): JSType {
        unsafe { ARKTS_GetValueType(context.env, value) }
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func strictEqual(target: JSValue): Bool {
        unsafe { ARKTS_StrictEqual(context.env, value, target.value) }
    }

    @!APILevel[
        13,
        atomicservice: true,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func strictEqual(_: JSContext, target: JSValue): Bool {
        strictEqual(target)
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func isNull(): Bool {
        unsafe { ARKTS_IsNull(value) }
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func isUndefined(): Bool {
        unsafe { ARKTS_IsUndefined(value) }
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func isBoolean(): Bool {
        unsafe { ARKTS_IsBool(value) }
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func isNumber(): Bool {
        unsafe { ARKTS_IsNumber(value) }
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func isString(): Bool {
        unsafe { ARKTS_IsString(context.env, value) }
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func isFunction(): Bool {
        unsafe { ARKTS_IsCallable(context.env, value) }
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func isObject(): Bool {
        unsafe { ARKTS_IsObject(context.env, value) }
    }

    @!APILevel[
        13,
        atomicservice: true,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func isArray(_: JSContext): Bool {
        isArray()
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func isArray(): Bool {
        unsafe { ARKTS_IsArray(context.env, value) }
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func isPromise(): Bool {
        unsafe { ARKTS_IsPromise(context.env, value) }
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func isClass(): Bool {
        unsafe { ARKTS_IsClass(context.env, value) }
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func isExternal(): Bool {
        unsafe { ARKTS_IsExternal(context.env, value) }
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func isSymbol(): Bool {
        unsafe { ARKTS_IsSymbol(context.env, value) }
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func isArrayBuffer(): Bool {
        unsafe { ARKTS_IsArrayBuffer(context.env, value) }
    }

    func isError(): Bool {
        if (!isObject()) {
            return false
        }
        JSObject.instanceOfByValue(context.env, value, context.constants.errorFuncs.clazz.innerValue)
    }

    /**
     * @deprecated
     */
    func isError(_: JSContext): Bool {
        isError()
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func asNull(): JSNull {
        if (!isNull()) {
            throw JSTypeMisMatch(JSType.NULL, typeof())
        }
        JSNull(this)
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func asUndefined(): JSUndefined {
        if (!isUndefined()) {
            throw JSTypeMisMatch(JSType.UNDEFINED, typeof())
        }
        JSUndefined(this)
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func asBoolean(): JSBoolean {
        if (!isBoolean()) {
            throw JSTypeMisMatch(JSType.BOOLEAN, typeof())
        }
        JSBoolean(this)
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func asNumber(): JSNumber {
        if (!isNumber()) {
            throw JSTypeMisMatch(JSType.NUMBER, typeof())
        }
        JSNumber(this)
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toBoolean(): Bool {
        if (!isBoolean()) {
            throw JSTypeMisMatch(JSType.BOOLEAN, typeof())
        }
        unsafe { ARKTS_GetValueBool(value) }
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toNumber(): Float64 {
        if (!isNumber()) {
            throw JSTypeMisMatch(JSType.NUMBER, typeof())
        }
        unsafe { ARKTS_GetValueNumber(value) }
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toString(): String {
        if (!isString()) {
            throw JSTypeMisMatch(JSType.STRING, typeof())
        }
        JSString.readString(context, value)
    }

    @!APILevel[
        13,
        atomicservice: true,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toString(_: JSContext): String {
        toString()
    }

    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toUtf16String(): Utf16String {
        JSString.readUtf16String(context, value)
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func asString(): JSString {
        if (!isString()) {
            throw JSTypeMisMatch(JSType.STRING, typeof())
        }
        JSString(context, value)
    }

    @!APILevel[
        13,
        atomicservice: true,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func asString(_: JSContext): JSString {
        asString()
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func asObject(): JSObject {
        if (!isObject()) {
            throw JSTypeMisMatch(JSType.OBJECT, typeof())
        }
        JSObject(context, value)
    }

    @!APILevel[
        13,
        atomicservice: true,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func asObject(_: JSContext): JSObject {
        asObject()
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func asFunction(): JSFunction {
        if (!isFunction()) {
            throw JSTypeMisMatch(JSType.FUNCTION, typeof())
        }
        JSFunction(context, value)
    }

    @!APILevel[
        13,
        atomicservice: true,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func asFunction(_: JSContext): JSFunction {
        asFunction()
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func asArray(): JSArray {
        if (!isArray(context)) {
            throw JSTypeMisMatch("Array", typeof())
        }
        JSArray(context, value)
    }

    @!APILevel[
        13,
        atomicservice: true,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func asArray(_: JSContext): JSArray {
        asArray()
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func asClass(): JSClass {
        if (!isClass()) {
            throw JSTypeMisMatch("Class", typeof())
        }
        JSClass(context, value)
    }

    @!APILevel[
        13,
        atomicservice: true,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func asClass(_: JSContext): JSClass {
        asClass()
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func asExternal(): JSExternal {
        if (!isExternal()) {
            throw JSTypeMisMatch(JSType.EXTERNAL, typeof())
        }
        JSExternal(context, value)
    }

    @!APILevel[
        13,
        atomicservice: true,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func asExternal(_: JSContext): JSExternal {
        asExternal()
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func asPromise(): JSPromise {
        if (!isPromise()) {
            throw JSTypeMisMatch("Promise", typeof())
        }
        JSPromise(context, value)
    }

    @!APILevel[
        13,
        atomicservice: true,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func asPromise(_: JSContext): JSPromise {
        asPromise()
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func asSymbol(): JSSymbol {
        if (!isSymbol()) {
            throw JSTypeMisMatch(JSType.SYMBOL, typeof())
        }
        JSSymbol(context, value)
    }

    @!APILevel[
        13,
        atomicservice: true,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func asSymbol(_: JSContext): JSSymbol {
        asSymbol()
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func asArrayBuffer(): JSArrayBuffer {
        if (!isArrayBuffer()) {
            throw JSTypeMisMatch("ArrayBuffer", typeof())
        }
        JSArrayBuffer(context, value)
    }

    @!APILevel[
        13,
        atomicservice: true,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func asArrayBuffer(_: JSContext): JSArrayBuffer {
        asArrayBuffer()
    }

    func asError(): JSError {
        if (!isError(context)) {
            throw JSTypeMisMatch("Error", typeof())
        }
        JSError(context, value)
    }

    /**
     * @deprecated
     */
    func asError(_: JSContext): JSError {
        asError()
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func isBigInt(): Bool {
        unsafe { ARKTS_IsBigInt(context.env, value) }
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func asBigInt(): JSBigInt {
        if (!isBigInt()) {
            throw JSTypeMisMatch("BigInt", typeof())
        }
        JSBigInt(context, value)
    }

    @!APILevel[
        13,
        atomicservice: true,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func asBigInt(_: JSContext): JSBigInt {
        asBigInt()
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toBigInt(): BigInt {
        if (!isBigInt()) {
            throw JSTypeMisMatch("BigInt", typeof())
        }

        JSBigInt.readAsBigInt(context.env, value)
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func getElement(index: Int64): JSValue {
        if (!isArray()) {
            throw JSTypeMisMatch("array", typeof())
        }
        let safeSize = Int64(unsafe { ARKTS_GetArrayLength(context.env, value) })
        if (index < 0 || index >= safeSize) {
            throw JSArrayRangeMisMatch(0, safeSize, index)
        }
        let value = unsafe { ARKTS_GetElement(context.env, value, UInt32(index)) }
        JSValue(context, value)
    }

    @!APILevel[
        13,
        atomicservice: true,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func getElement(_: JSContext, index: Int64): JSValue {
        getElement(index)
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func setElement(index: Int64, value: JSValue): Unit {
        if (!isArray()) {
            throw JSTypeMisMatch("array", typeof())
        }
        let safeSize = Int64(unsafe { ARKTS_GetArrayLength(context.env, this.value) })
        if (index < 0) {
            throw JSArrayRangeMisMatch(0, safeSize, index)
        }
        unsafe { ARKTS_SetElement(context.env, this.value, UInt32(index), value.value) }
    }

    @!APILevel[
        13,
        atomicservice: true,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func setElement(_: JSContext, index: Int64, value: JSValue): Unit {
        setElement(index, value)
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func getProperty(key: JSKeyable): JSValue {
        if (!isObject()) {
            throw JSTypeMisMatch(JSType.OBJECT, typeof())
        }
        let keyValue = key.toJSValue(context)
        let result = unsafe { ARKTS_GetProperty(context.env, value, keyValue.value) }
        JSValue(context, result)
    }

    @!APILevel[
        13,
        atomicservice: true,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func getProperty(_: JSContext, key: JSKeyable): JSValue {
        getProperty(key)
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func setProperty(key: JSKeyable, setValue: JSValue): Unit {
        if (!isObject()) {
            throw JSTypeMisMatch(JSType.OBJECT, typeof())
        }
        let keyValue = key.toJSValue(context)
        unsafe { ARKTS_SetProperty(context.env, value, keyValue.value, setValue.value) }
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func setProperty(_: JSContext, key: JSKeyable, setValue: JSValue): Unit {
        setProperty(key, setValue)
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func bindObject(external: JSValue): Unit {
        if (!isObject()) {
            throw JSTypeMisMatch(JSType.OBJECT, typeof())
        }
        if (!external.isExternal()) {
            throw JSTypeMisMatch("external", external.typeof())
        }
        setProperty(context.constants.builtinText.__cj_object__, external)
    }

    @!APILevel[
        13,
        atomicservice: true,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func bindObject(_: JSContext, external: JSValue): Unit {
        bindObject(external)
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func bindObject(data: SharedObject): Unit {
        bindObject(JSValue(context, JSExternal.createExternal(context, data)))
    }

    @!APILevel[
        13,
        atomicservice: true,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func bindObject(_: JSContext, data: SharedObject): Unit {
        bindObject(data)
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func getBindingObject(): ?SharedObject {
        let external = getProperty(context, context.constants.builtinText.__cj_object__)
        if (!external.isExternal()) {
            return None
        }
        let id = unsafe { ARKTS_GetExternalData(context.env, external.value) }
        context.sharedObjects_.get(id)
    }

    @!APILevel[
        13,
        atomicservice: true,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func getBindingObject(_: JSContext): ?SharedObject {
        getBindingObject()
    }
}
