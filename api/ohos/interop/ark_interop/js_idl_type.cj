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

import std.collection.*

/**
 * Saves the JSContext of a single function call.
 */
@!APILevel[
    15,
    atomicservice: true,
    deprecated: 16,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
public class JSCurrentJSContext {
    /**
     * Thread-related global variables.
     */
    private static let currentJSContext = ThreadLocal<JSContext>()

    /**
     * Called when JSStringEx\JSArrayEx\JSHashMapEx init.
     */
    @!APILevel[
        15,
        atomicservice: true,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func get() {
        let content = currentJSContext.get() ?? throw Exception("Ark Interop: get current context failed.")
        content
    }

    /**
     * Set on each interop call.
     */
    @!APILevel[
        15,
        atomicservice: true,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func set(input: ?JSContext) {
        currentJSContext.set(input)
    }

    /**
     * Unset at the end of each interop call.
     */
    @!APILevel[
        15,
        atomicservice: true,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func unset() {
        currentJSContext.set(None)
    }
}

@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
public class JSStringEx <: JSInteropType<JSStringEx> & Equatable<JSStringEx> & ToString {
    private var string_: JSString
    private let context_: JSContext

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public init(str: String) {
        let context = JSCurrentJSContext.get()
        context_ = context
        string_ = context.string(str)
    }

    private init(context: JSContext, str: JSString) {
        context_ = context
        string_ = str
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public prop size: Int64 {
        get() {
            string_.toString().size
        }
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public operator func ==(str: JSStringEx): Bool {
        return string_.toString() == str.toString()
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public operator func !=(str: JSStringEx): Bool {
        return string_.toString() != str.toString()
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toString(): String {
        return string_.toString()
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toJSValue(_: JSContext): JSValue {
        return string_.toJSValue(context_)
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func fromJSValue(context: JSContext, input: JSValue): JSStringEx {
        let jsStr = input.asString(context)
        return JSStringEx(context, jsStr)
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func toArkTsType(): String {
        "string"
    }
}

enum JSArraySource<T> {
    | JS(JSContext, JSArray)
    | CJ(Array<T>)
}

@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
public class JSArrayEx<T> <: JSInteropType<JSArrayEx<T>> where T <: JSInteropType<T> {
    private var source_: JSArraySource<T>

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public init(arr: Array<T>) {
        source_ = CJ(arr)
    }

    private init(context: JSContext, arr: JSArray) {
        source_ = JS(context, arr)
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func clone(): JSArrayEx<T> {
        JSArrayEx<T>(this.toArray())
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func concat(other: JSArrayEx<T>): JSArrayEx<T> {
        JSArrayEx<T>(this.toArray().concat(other.toArray()))
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public prop size: Int64 {
        get() {
            match (source_) {
                case CJ(arr) => arr.size
                case JS(_, jsArr) => jsArr.size
            }
        }
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func get(index: Int64): Option<T> {
        if (UInt64(index) >= UInt64(this.size)) {
            return None<T>
        }
        return this[index]
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func set(index: Int64, element: T): Unit {
        this[index] = element
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func isEmpty(): Bool {
        this.size == 0
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public operator func [](index: Int64): T {
        match (source_) {
            case CJ(arr) => arr[index]
            case JS(ctx, jsArr) => T.fromJSValue(ctx, jsArr[index])
        }
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public operator func [](index: Int64, value!: T) {
        match (source_) {
            case CJ(arr) => arr[index] = value
            case JS(ctx, jsArr) => jsArr[index] = value.toJSValue(ctx)
        }
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toArray(): Array<T> {
        match (source_) {
            case CJ(arr) => arr
            case JS(context, arr) => Array<T>(arr.size) {
                index: Int64 => T.fromJSValue(context, arr[index])
            }
        }
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toJSValue(context: JSContext): JSValue {
        let jsArr = match (source_) {
            case CJ(arr) =>
                let jsArr = context.array(Array(arr.size, {
                    idx => arr[idx].toJSValue(context)
                }))
                source_ = JS(context, jsArr)
                jsArr
            case JS(_, jsArr) => jsArr
        }
        return jsArr.toJSValue()
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func fromJSValue(context: JSContext, input: JSValue): JSArrayEx<T> {
        let jsArr = input.asArray(context)
        return JSArrayEx<T>(context, jsArr)
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func toArkTsType(): String {
        "Array"
    }
}

class JSMapFuncs {
    let clazz: JSClass

    let delete: JSFunction
    let get: JSFunction
    let has: JSFunction
    let set: JSFunction
    let clear: JSFunction
    let keys: JSFunction

    init(context: JSContext) {
        clazz = context.global["Map"].asClass(context)
        let proto = clazz.prototype
        delete = proto["delete"].asFunction(context)
        get = proto["get"].asFunction(context)
        has = proto["has"].asFunction(context)
        set = proto["set"].asFunction(context)
        clear = proto["clear"].asFunction(context)
        keys = proto["keys"].asFunction(context)
    }
}

@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
public class JSHashMapEx<K, V> <: JSInteropType<JSHashMapEx<K, V>> where K <: JSKeyable & Hashable & Equatable<K> & JSInteropType<K>,
    V <: JSInteropType<V> {
    private var obj_: JSObject
    private let context_: JSContext

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public init(map: HashMap<K, V>) {
        let context = JSCurrentJSContext.get()
        context_ = context
        obj_ = context.constants.mapFuncs.clazz.new().asObject()
        for ((k, v) in map) {
            context.constants.mapFuncs.set.call([k.toJSValue(context), v.toJSValue(context)], thisArg: obj_.toJSValue())
        }
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public init() {
        let context = JSCurrentJSContext.get()
        context_ = context
        obj_ = context.constants.mapFuncs.clazz.new().asObject()
    }

    private init(context: JSContext, obj: JSValue) {
        context_ = context
        obj_ = obj.asObject()
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func get(key: K): Option<V> {
        Option<V>.fromJSValue(context_,
            context_.constants.mapFuncs.get.call(key.toJSValue(context_), thisArg: obj_.toJSValue()))
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func clear(): Unit {
        context_.constants.mapFuncs.clear.call(thisArg: obj_.toJSValue())
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func clone(): JSHashMapEx<K, V> {
        JSHashMapEx<K, V>(this.toHashMap())
    }

    @!APILevel[
        15,
        atomicservice: true,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func contiansAll(keys: Collection<K>): Bool {
        this.toHashMap().contains(all: keys)
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func containsAll(keys: Collection<K>): Bool {
        this.toHashMap().contains(all: keys)
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func isEmpty(): Bool {
        this.size == 0
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func set(key: K, value: V): Unit {
        context_.constants.mapFuncs.set.call([key.toJSValue(context_), value.toJSValue(context_)],
            thisArg: obj_.toJSValue())
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func setAll(elements: Collection<(K, V)>): Unit {
        for ((k, v) in elements) {
            this.set(k, v)
        }
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func setIfAbsent(key: K, value: V): Bool {
        if (this.has(key)) {
            false
        } else {
            this.set(key, value)
            true
        }
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func delete(key: K): Bool {
        Bool.fromJSValue(context_,
            context_.constants.mapFuncs.delete.call(key.toJSValue(context_), thisArg: obj_.toJSValue()))
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func deleteAll(keys: Collection<K>): Unit {
        for (key in keys) {
            this.delete(key)
        }
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func deleteIf(predicate: (K, V) -> Bool): Unit {
        let keys = this.keys().toArray()
        for (key in keys) {
            let value = this.get(key) ?? throw Exception("JSHashMapEx: get value failed.")
            if (predicate(key, value)) {
                this.delete(key)
            }
        }
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func keys(): EquatableCollection<K> {
        let it = context_.constants.mapFuncs.keys.call(thisArg: obj_.toJSValue()).asObject(context_)
        let retArray = HashMap<K, Int64>()
        while (true) {
            let next = it["next"].asFunction(context_).call(thisArg: it.toJSValue()).asObject(context_)
            if (Bool.fromJSValue(context_, next["done"]) == true) {
                break
            }
            retArray.add(K.fromJSValue(context_, next["value"]), 0)
        }
        retArray.keys()
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func values(): Collection<V> {
        this.toHashMap().values()
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public prop size: Int64 {
        get() {
            Int64.fromJSValue(context_, obj_["size"])
        }
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func has(key: K): Bool {
        Bool.fromJSValue(context_,
            context_.constants.mapFuncs.has.call(key.toJSValue(context_), thisArg: obj_.toJSValue()))
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toHashMap(): HashMap<K, V> {
        let keys = this.keys().toArray()
        HashMap<K, V>(this.size) {
            index: Int64 => (keys[index], this.get(keys[index]) ?? throw Exception("JSHashMapEx: get value failed."))
        }
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public operator func [](key: K): V {
        return match (get(key)) {
            case None => throw NoneValueException("Value does not exist!\n")
            case Some(val) => val
        }
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public operator func [](key: K, value!: V): Unit {
        set(key, value)
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toJSValue(_: JSContext): JSValue {
        obj_.toJSValue()
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func fromJSValue(context: JSContext, input: JSValue): JSHashMapEx<K, V> {
        return JSHashMapEx<K, V>(context, input)
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func toArkTsType(): String {
        "Map"
    }
}
