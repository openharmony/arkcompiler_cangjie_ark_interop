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

/**
 * ArkTs null.
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Utils.Cangjie"
]
public struct JSNull {
    let value: JSValue

    init(value: JSValue) {
        this.value = value
    }

    /**
     * Convert JSNull to JSValue.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func toJSValue(): JSValue {
        value
    }
}

/**
 * ArkTs undefined.
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Utils.Cangjie"
]
public struct JSUndefined {
    let value: JSValue

    init(value: JSValue) {
        this.value = value
    }

    /**
     * Convert JSUndefined to JSValue.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func toJSValue(): JSValue {
        value
    }
}

/**
 * ArkTs boolean.
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Utils.Cangjie"
]
public struct JSBoolean {
    let value: JSValue

    init(value: JSValue) {
        this.value = value
    }

    /**
     * Convert JSBoolean to JSValue.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func toJSValue(): JSValue {
        value
    }

    /**
     * Convert JSBoolean to Cangjie Bool.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func toBool(): Bool {
        value.toBoolean()
    }
}

/**
 * ArkTs number.
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Utils.Cangjie"
]
public struct JSNumber {
    let value: JSValue

    init(value: JSValue) {
        this.value = value
    }

    /**
     * Convert JSNumber to JSValue.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func toJSValue(): JSValue {
        value
    }

    /**
     * Convert JSNumber to Cangjie Float64.
     *
     * @throws { JSTypeMisMatch } - JSValue cannot be converted to Float64.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func toFloat64(): Float64 {
        value.toNumber()
    }
}

/**
 * JSValue is unified type in the ArkTS runtime and alse the data type that directly interacts with the ArkTS runtime.
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Utils.Cangjie"
]
public struct JSValue {
    protected JSValue(
        let context: JSContext,
        protected let value: JSValue_
    ) {}

    /**
     * Get the type of JSValue.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func typeof(): JSType {
        unsafe { ARKTS_GetValueType(context.env, value) }
    }

    /**
     * Perform a strict equality check (type consistency and value equality) on two JSValues.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func strictEqual(target: JSValue): Bool {
        unsafe { ARKTS_StrictEqual(context.env, value, target.value) }
    }

    /**
     * Check whether JSValue is null.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func isNull(): Bool {
        unsafe { ARKTS_IsNull(value) }
    }

    /**
     * Check whether JSValue is undefined.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func isUndefined(): Bool {
        unsafe { ARKTS_IsUndefined(value) }
    }

    /**
     * Check whether JSValue is boolean.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func isBoolean(): Bool {
        unsafe { ARKTS_IsBool(value) }
    }

    /**
     * Check whether JSValue is number.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func isNumber(): Bool {
        unsafe { ARKTS_IsNumber(value) }
    }

    /**
     * Check whether JSValue is string.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func isString(): Bool {
        unsafe { ARKTS_IsString(context.env, value) }
    }

    /**
     * Check whether JSValue is function.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func isFunction(): Bool {
        unsafe { ARKTS_IsCallable(context.env, value) }
    }

    /**
     * Check whether JSValue is object.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func isObject(): Bool {
        unsafe { ARKTS_IsObject(context.env, value) }
    }

    /**
     * Check whether JSValue is array.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func isArray(): Bool {
        unsafe { ARKTS_IsArray(context.env, value) }
    }

    /**
     * Check whether JSValue is Promise.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func isPromise(): Bool {
        unsafe { ARKTS_IsPromise(context.env, value) }
    }

    /**
     * Check whether JSValue is ArkTS class.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func isClass(): Bool {
        unsafe { ARKTS_IsClass(context.env, value) }
    }

    /**
     * Check whether JSValue is an external object (ArkTS reference of a Cangjie object).
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func isExternal(): Bool {
        unsafe { ARKTS_IsExternal(context.env, value) }
    }

    /**
     * Check whether JSValue is symbol.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func isSymbol(): Bool {
        unsafe { ARKTS_IsSymbol(context.env, value) }
    }

    /**
     * Check whether JSValue is ArrayBuffer.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
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

    func isMap(): Bool {
        if (!isObject()) {
            return false
        }
        JSObject.instanceOfByValue(context.env, value, context.constants.mapFuncs.clazz.innerValue)
    }

    func asMap(): JSMap {
        if (!isMap()) {
            throw JSTypeMisMatch("Map", typeof())
        }
        JSMap(context, value)
    }

    /**
     * Convert JSValue to JSNull. If the failure occurs, Exception will be throwed.
     *
     * @throws { JSTypeMisMatch } - JSValue cannot be converted to JSNull.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func asNull(): JSNull {
        if (!isNull()) {
            throw JSTypeMisMatch(JSType.NULL, typeof())
        }
        JSNull(this)
    }

    /**
     * Convert JSValue to JSUndefined. If the failure occurs, Exception will be throwed.
     *
     * @throws { JSTypeMisMatch } - JSValue cannot be converted to JSUndefined.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func asUndefined(): JSUndefined {
        if (!isUndefined()) {
            throw JSTypeMisMatch(JSType.UNDEFINED, typeof())
        }
        JSUndefined(this)
    }

    /**
     * Convert JSValue to JSBoolean. If the failure occurs, Exception will be throwed.
     *
     * @throws { JSTypeMisMatch } - JSValue cannot be converted to JSBoolean.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func asBoolean(): JSBoolean {
        if (!isBoolean()) {
            throw JSTypeMisMatch(JSType.BOOLEAN, typeof())
        }
        JSBoolean(this)
    }
    
    /**
     * Convert JSValue to JSNumber. If the failure occurs, Exception will be throwed.
     *
     * @throws { JSTypeMisMatch } - JSValue cannot be converted to JSNumber.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func asNumber(): JSNumber {
        if (!isNumber()) {
            throw JSTypeMisMatch(JSType.NUMBER, typeof())
        }
        JSNumber(this)
    }
    
    /**
     * Convert JSValue to Bool. If the failure occurs, Exception will be throwed.
     *
     * @throws { JSTypeMisMatch } - JSValue cannot be converted to Bool.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func toBoolean(): Bool {
        if (!isBoolean()) {
            throw JSTypeMisMatch(JSType.BOOLEAN, typeof())
        }
        unsafe { ARKTS_GetValueBool(value) }
    }

    /**
     * Convert JSValue to Float64. If the failure occurs, Exception will be throwed.
     *
     * @throws { JSTypeMisMatch } - JSValue cannot be converted to Float64.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func toNumber(): Float64 {
        if (!isNumber()) {
            throw JSTypeMisMatch(JSType.NUMBER, typeof())
        }
        unsafe { ARKTS_GetValueNumber(value) }
    }

    /**
     * Convert JSValue to String. If the failure occurs, Exception will be throwed.
     *
     * @throws { JSTypeMisMatch } - JSValue cannot be converted to String.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func toString(): String {
        if (!isString()) {
            throw JSTypeMisMatch(JSType.STRING, typeof())
        }
        JSString.readString(context, value)
    }

    /**
     * Convert JSValue to Utf16String.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func toUtf16String(): Utf16String {
        JSString.readUtf16String(context, value)
    }

    /**
     * Convert JSValue to JSString. If the failure occurs, Exception will be throwed.
     *
     * @throws { JSTypeMisMatch } - JSValue cannot be converted to JSString.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func asString(): JSString {
        if (!isString()) {
            throw JSTypeMisMatch(JSType.STRING, typeof())
        }
        JSString(context, value)
    }

    /**
     * Convert JSValue to JSObject. If the failure occurs, Exception will be throwed.
     *
     * @throws { JSTypeMisMatch } - JSValue cannot be converted to JSObject.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func asObject(): JSObject {
        if (!isObject()) {
            throw JSTypeMisMatch(JSType.OBJECT, typeof())
        }
        JSObject(context, value)
    }

    /**
     * Convert JSValue to JSFunction. If the failure occurs, Exception will be throwed.
     *
     * @throws { JSTypeMisMatch } - JSValue cannot be converted to JSFunction.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func asFunction(): JSFunction {
        if (!isFunction()) {
            throw JSTypeMisMatch(JSType.FUNCTION, typeof())
        }
        JSFunction(context, value)
    }

    /**
     * Conert JSValue to JSArray. If the failure occurs, Exception will be throwed.
     *
     * @throws { JSTypeMisMatch } - JSValue cannot be converted to JSArray.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func asArray(): JSArray {
        if (!isArray()) {
            throw JSTypeMisMatch("Array", typeof())
        }
        JSArray(context, value)
    }

    /**
     * Convert JSValue to JSClass. If the failure occurs, Exception will be throwed.
     *
     * @throws { JSTypeMisMatch } - JSValue cannot be converted to JSClass.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func asClass(): JSClass {
        if (!isClass()) {
            throw JSTypeMisMatch("Class", typeof())
        }
        JSClass(context, value)
    }

    /**
     * Convert JSValue to JSExternal. If the failure occurs, Exception will be throwed.
     *
     * @throws { JSTypeMisMatch } - JSValue cannot be converted to JSExternal.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func asExternal(): JSExternal {
        if (!isExternal()) {
            throw JSTypeMisMatch(JSType.EXTERNAL, typeof())
        }
        JSExternal(context, value)
    }

    /**
     * Convert JSValue to JSPromise. If the failure occurs, Exception will be throwed.
     *
     * @throws { JSTypeMisMatch } - JSValue cannot be converted to JSPromise.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func asPromise(): JSPromise {
        if (!isPromise()) {
            throw JSTypeMisMatch("Promise", typeof())
        }
        JSPromise(context, value)
    }

    /**
     * Convert JSValue to JSSymbol. If the failure occurs, Exception will be throwed.
     *
     * @throws { JSTypeMisMatch } - JSValue cannot be converted to JSSymbol.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func asSymbol(): JSSymbol {
        if (!isSymbol()) {
            throw JSTypeMisMatch(JSType.SYMBOL, typeof())
        }
        JSSymbol(context, value)
    }

    /**
     * Convert JSValue to JSArrayBuffer. If the failure occurs, Exception will be throwed.
     *
     * @throws { JSTypeMisMatch } - JSValue cannot be converted to JSArrayBuffer.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func asArrayBuffer(): JSArrayBuffer {
        if (!isArrayBuffer()) {
            throw JSTypeMisMatch("ArrayBuffer", typeof())
        }
        JSArrayBuffer(context, value)
    }

    /**
     * Convert JSValue to JSError. If the failure occurs, Exception will be throwed.
     *
     * @throws { JSTypeMisMatch } - JSValue cannot be converted to JSError.
     */
    func asError(): JSError {
        if (!isError()) {
            throw JSTypeMisMatch("Error", typeof())
        }
        JSError(context, value)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func isBigInt(): Bool {
        unsafe { ARKTS_IsBigInt(context.env, value) }
    }

    /**
     * Convert JSValue to JSBigInt. If the failure occurs, Exception will be throwed.
     *
     * @throws { JSTypeMisMatch } - JSValue cannot be converted to JSBigInt.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func asBigInt(): JSBigInt {
        if (!isBigInt()) {
            throw JSTypeMisMatch("BigInt", typeof())
        }
        JSBigInt(context, value)
    }

    /**
     * Convert JSValue to BigInt. If the failure occurs, Exception will be throwed.
     *
     * @throws { JSTypeMisMatch } - JSValue cannot be converted to BigInt.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func toBigInt(): BigInt {
        if (!isBigInt()) {
            throw JSTypeMisMatch("BigInt", typeof())
        }

        JSBigInt.readAsBigInt(context.env, value)
    }

    /**
     * Get the element at index.
     *
     * @throws { JSArrayRangeMisMatch } - The index is out of range.
     * @throws { JSTypeMisMatch } - JSValue is not an array.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
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

    /**
     * Set the element at index.
     *
     * @throws { JSArrayRangeMisMatch } - The index is less than 0.
     * @throws { JSTypeMisMatch } - JSValue is not an array.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
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

    /**
     * Get the property corresponding to the key.
     *
     * @throws { JSTypeMisMatch } - JSValue is not JSObject.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func getProperty(key: JSKeyable): JSValue {
        if (!isObject()) {
            throw JSTypeMisMatch(JSType.OBJECT, typeof())
        }
        let keyValue = key.toJSValue(context)
        let result = unsafe { ARKTS_GetProperty(context.env, value, keyValue.value) }
        JSValue(context, result)
    }

    /**
     * Set the property corresponding to the key.
     *
     * @throws { JSTypeMisMatch } - JSValue is not JSObject.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func setProperty(key: JSKeyable, setValue: JSValue): Unit {
        if (!isObject()) {
            throw JSTypeMisMatch(JSType.OBJECT, typeof())
        }
        let keyValue = key.toJSValue(context)
        unsafe { ARKTS_SetProperty(context.env, value, keyValue.value, setValue.value) }
    }

    /**
     * Set the property corresponding to the key.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func setProperty(_: JSContext, key: JSKeyable, setValue: JSValue): Unit {
        setProperty(key, setValue)
    }

    /**
     * Bind JSValue to an ArkTs external object.
     *
     * @throws { JSTypeMisMatch } - JSValue is not JSObject or external is not JSExternal.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
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

    /**
     * Bind JSValue to an ArkTs external object.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func bindObject(data: SharedObject): Unit {
        bindObject(JSValue(context, JSExternal.createExternal(context, data)))
    }

    /**
     * Get the Cangjie object bound to the ArkTs object.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func getBindingObject(): ?SharedObject {
        let external = getProperty(context.constants.builtinText.__cj_object__)
        if (!external.isExternal()) {
            return None
        }
        let id = unsafe { ARKTS_GetExternalData(context.env, external.value) }
        context.sharedObjects_.get(id)
    }
}
