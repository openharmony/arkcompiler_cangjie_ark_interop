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

import std.sync.*
import std.collection.*

@C
struct JSHClassPrivate {}

@C
struct JSScopePrivate {}

type JSEnv = IntNative

type JSScope = CPointer<JSScopePrivate>

type JSHClass = CPointer<JSHClassPrivate>

type JSAsyncCallback = CFunc<(JSEnv, Int64) -> Unit>

/**
 * Alias for type which is `CPointer<Unit>`.
 */
public type napi_env = CPointer<Unit>

/**
 * Alias for type which is `CPointer<Unit>`.
 */
public type napi_value = CPointer<Unit>

@FastNative
foreign func ARKTS_CreateNull(): JSValue_

@FastNative
foreign func ARKTS_CreateUndefined(): JSValue_

@FastNative
foreign func ARKTS_CreateF64(value: Float64): JSValue_

@FastNative
foreign func ARKTS_CreateI32(value: Int32): JSValue_

@FastNative
foreign func ARKTS_CreateBool(bValue: Bool): JSValue_

foreign func ARKTS_Throw(env: JSEnv, error: JSValue_): Unit

@FastNative
foreign func ARKTS_CreateAsyncTask(env: JSEnv, id: Int64): Unit

@FastNative
foreign func ARKTS_GetGlobalConstant(env: JSEnv): JSValue_

@FastNative
foreign func ARKTS_GetPosixThreadId(): UInt64

foreign func ARKTS_Require(env: JSEnv, target: CString, isNative: Bool, isAppModule: Bool, prefix: CString): JSValue_

@FastNative
foreign func ARKTS_OpenScope(env: JSEnv): JSScope

@FastNative
foreign func ARKTS_CloseScope(env: JSEnv, scope: JSScope): Unit

@FastNative
foreign func ARKTS_GetGlobalNapiEnv(env: JSEnv): napi_env

@C
func asyncCallbackExecutor(env: JSEnv, id: Int64): Unit {
    let context = JSContext.getOrCreate(env)
    if (let Some(callback) <- context.asyncCallbacks_.remove(id)) {
        callback()
    }
}

@C
func disposeJSContext(env: JSEnv): Unit {
    synchronized(JSContext.runtimesMutex) {
        if (let Some(context) <- JSContext.allRuntimes_.remove(env)) {
            context.dispose()
        }
    }
}

/**
 * A single-thread ArkTS interop context. JSContext has a one-to-one correspondence with the ArkTS runtime. 
 * Its main purpose is to create JSValues and safe references and manage the lifecycle of Cangjie objects 
 * referenced by ArkTS.
 */
@!APILevel[
    21,
    stagemodelonly: true
]
public class JSContext {
    static let allRuntimes_ = HashMap<JSEnv, JSContext>()
    static let runtimesMutex = Mutex()

    static func getOrCreate(env: JSEnv, tidGetter!: () -> UInt64 = {=> unsafe { ARKTS_GetPosixThreadId() }}): JSContext {
        synchronized(runtimesMutex) {
            match (allRuntimes_.get(env)) {
                case Some(context) => context
                case None =>
                    let context = JSContext(env, tidGetter())
                    allRuntimes_.add(env, context)
                    context
            }
        }
    }

    var sharedObjects_ = Slab<SharedObject>()
    var sharedLambda_ = Slab<JSLambda>()
    var asyncCallbacks_ = SlabMT<() -> Unit>()

    let env_: JSEnv
    private var disposed_: Bool = false
    private let bindTid_: UInt64
    var global_: ?JSObject = None
    var constants_: ?JSConstants = None
    private let void_: JSValue_

    private init(env: JSEnv, tid: UInt64) {
        if (env == 0) {
            throw Exception("create JSContext failed, env is null")
        }
        env_ = env
        bindTid_ = tid
        void_ = unsafe { ARKTS_CreateUndefined() }
    }

    prop void: JSValue {
        get() {
            JSValue(this, void_)
        }
    }

    func dispose(): Unit {
        disposed_ = true
    }

    prop constants: JSConstants {
        get() {
            if (let Some(data) <- constants_) {
                data
            } else {
                let data = JSConstants(this)
                constants_ = data
                data
            }
        }
    }

    /**
     * Check whether the current thread can execute interop interface.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func isInBindThread(): Bool {
        bindTid_ == unsafe { ARKTS_GetPosixThreadId() }
    }

    func checkAlive(): Unit {
        if (disposed_) {
            throw JSObjUseAfterFree(message: "JSContext has been disposed")
        }
    }

    func checkThread(): Unit {
        if (!isInBindThread()) {
            throw JSThreadMisMatch(bindTid_, unsafe { ARKTS_GetPosixThreadId() })
        }
    }

    /**
     * ArkTS global environment variable.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public prop global: JSObject {
        get() {
            match (global_) {
                case Some(data) => data
                case None =>
                    let local = JSValue(this, unsafe { ARKTS_GetGlobalConstant(env_) })
                    let result = local.asObject()
                    global_ = result
                    result
            }
        }
    }

    /**
     * ArkTS interop context.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public prop env: JSEnv {
        get() {
            checkAlive()
            checkThread()
            env_
        }
    }

    /**
     * Get napi environment pointer.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func getNapiEnv(): napi_env {
        unsafe {
            ARKTS_GetGlobalNapiEnv(env)
        }
    }

    func newScope(callback: () -> Unit): Unit {
        unsafe {
            let scope = ARKTS_OpenScope(env)
            callback()
            ARKTS_CloseScope(env, scope)
        }
    }

    /**
     * Create an ArkTS undefined.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func undefined(): JSUndefined {
        JSUndefined(void)
    }

    /**
     * Create an ArkTS null.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func null(): JSNull {
        JSNull(JSValue(this, unsafe { ARKTS_CreateNull() }))
    }

    /**
     * Create an ArkTS boolean.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func boolean(value: Bool): JSBoolean {
        JSBoolean(JSValue(this, unsafe { ARKTS_CreateBool(value) }))
    }

    /**
     * Create an ArkTS number.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func number(value: Float64): JSNumber {
        JSNumber(JSValue(this, unsafe { ARKTS_CreateF64(value) }))
    }

    /**
     * Create an ArkTS number.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func number(value: Int32): JSNumber {
        JSNumber(JSValue(this, unsafe { ARKTS_CreateI32(value) }))
    }

    /**
     * Create an ArkTS string.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func string(value: String): JSString {
        JSString(this, value)
    }

    /**
     * Create an ArkTS string.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func string(value: Utf16String): JSString {
        JSString(this, value)
    }

    /**
     * Create an empty ArkTS object reference.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func object(): JSObject {
        JSObject(this)
    }

    /**
     * Create an ArkTS function.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func function(lambda: JSLambda): JSFunction {
        JSFunction(this, lambda)
    }

    /**
     * Create an ArkTS array.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func array(arr: Array<JSValue>): JSArray {
        JSArray(this, arr)
    }

    /**
     * Create an ArkTS class.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func clazz(ctor: JSLambda, superClass!: ?JSClass = None): JSClass {
        JSClass(this, ctor, superClass)
    }

    /**
     * Create an ArkTS reference to Cangjie object.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func external(data: SharedObject): JSExternal {
        JSExternal(this, data)
    }

    /**
     * Create an ArkTS Promise.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func promiseCapability(): JSPromiseCapability {
        JSPromiseCapability(this)
    }

    func throwJSError(exception: Exception): Unit {
        let stack = exception.getStackTrace()
        let stackTexts = Array<String>(stack.size) {
            index =>
            let frame = stack[index]
            let packageDelimiter = if (frame.declaringClass.isEmpty()) {
                ""
            } else {
                "."
            }
            "\t at ${frame.declaringClass}${packageDelimiter}${frame.methodName}(${frame.fileName}:${frame.lineNumber})"
        }
        let message = "${exception}\n${String.join(stackTexts, delimiter: "\n")}"
        let jstr = JSString.createString(this, message)
        unsafe { ARKTS_Throw(env, jstr) }
    }

    func throwJSError(exception: Error): Unit {
        let stack = exception.getStackTrace()
        let stackTexts = Array<String>(stack.size) {
            index =>
            let frame = stack[index]
            let packageDelimiter = if (frame.declaringClass.isEmpty()) {
                ""
            } else {
                "."
            }
            "\t at ${frame.declaringClass}${packageDelimiter}${frame.methodName}(${frame.fileName}:${frame.lineNumber})"
        }
        let message = "${exception}\n${String.join(stackTexts, delimiter: "\n")}"
        let jstr = JSString.createString(this, message)
        unsafe { ARKTS_Throw(env, jstr) }
    }

    /**
     * Create an ArkTS ArrayBuffer.
	 *
     * @throws {JSArrayRangeMisMatch} - Length is thess than 0.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func arrayBuffer(length: Int32): JSArrayBuffer {
        if (length <= 0) {
            throw JSArrayRangeMisMatch(0, Int64(Int32.Max), Int64(length), message: "arrayBuffer length invalid")
        }
        JSArrayBuffer(this, length)
    }

    /**
     * Create an ArkTS ArrayBuffer.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func arrayBuffer(data: Array<Byte>): JSArrayBuffer {
        JSArrayBuffer(this, data)
    }

    /**
     * Create an ArkTS ArrayBuffer.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func arrayBuffer(data: Array<Int8>): JSArrayBuffer {
        JSArrayBuffer(this, data)
    }

    /**
     * Create an ArkTS ArrayBuffer.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func arrayBuffer(data: Array<Int16>): JSArrayBuffer {
        JSArrayBuffer(this, data)
    }

    /**
     * Create an ArkTS ArrayBuffer.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func arrayBuffer(data: Array<UInt16>): JSArrayBuffer {
        JSArrayBuffer(this, data)
    }

    /**
     * Create an ArkTS ArrayBuffer.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func arrayBuffer(data: Array<UInt32>): JSArrayBuffer {
        JSArrayBuffer(this, data)
    }

    /**
     * Create an ArkTS ArrayBuffer.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func arrayBuffer(data: Array<Int32>): JSArrayBuffer {
        JSArrayBuffer(this, data)
    }

    /**
     * Create an ArkTS ArrayBuffer.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func arrayBuffer(data: Array<Float32>): JSArrayBuffer {
        JSArrayBuffer(this, data)
    }

    /**
     * Create an ArkTS ArrayBuffer.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func arrayBuffer(data: Array<Int64>): JSArrayBuffer {
        JSArrayBuffer(this, data)
    }

    /**
     * Create an ArkTS ArrayBuffer.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func arrayBuffer(data: Array<UInt64>): JSArrayBuffer {
        JSArrayBuffer(this, data)
    }

    /**
     * Create an ArkTS ArrayBuffer.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func arrayBuffer(data: Array<Float64>): JSArrayBuffer {
        JSArrayBuffer(this, data)
    }

    /**
     * Create an ArkTS ArrayBuffer.
	 *
     * @throws {JSArrayRangeMisMatch} - Length is thess than 0.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public unsafe func arrayBuffer(rawData: CPointer<Byte>, length: Int32, finalizer: JSBufferFinalizer): JSArrayBuffer {
        if (length <= 0) {
            throw JSArrayRangeMisMatch(0, Int64(Int32.Max), Int64(length), message: "arrayBuffer length invalid")
        }
        JSArrayBuffer(this, rawData, length, finalizer)
    }

    /**
     * Create an ArkTS symbol.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func symbol(description!: String = ""): JSSymbol {
        JSSymbol(this, description)
    }

    /**
     * Create an ArkTS bigint.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func bigint(value: Int64): JSBigInt {
        JSBigInt(this, value)
    }

    /**
     * Create an ArkTS bigint.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func bigint(value: BigInt): JSBigInt {
        JSBigInt(this, value)
    }

    /**
     * Create a task to be executed in ArkTS thread.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func postJSTask(callback: () -> Unit): Unit {
        let id = asyncCallbacks_.append(callback)
        unsafe {
            ARKTS_CreateAsyncTask(env_, id)
        }
    }

    /**
     * Load the built-in ArkTS napi module of the system.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func requireSystemNativeModule(moduleName: String, prefix!: ?String = None): JSValue {
        unsafe {
            let moduleNameC = LibC.mallocCString(moduleName)
            let result = if (let Some(p) <- prefix) {
                let cp = LibC.mallocCString(p)
                let ret = ARKTS_Require(env, moduleNameC, true, false, cp)
                LibC.free(cp)
                ret
            } else {
                ARKTS_Require(env, moduleNameC, true, false, CString(CPointer<UInt8>()))
            }
            LibC.free(moduleNameC)
            return JSValue(this, result)
        }
    }
}
