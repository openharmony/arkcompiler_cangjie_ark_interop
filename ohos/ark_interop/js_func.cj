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
foreign func ARKTS_CreateFunc(env: JSEnv, lambdaId: Int64): JSValue_

@FastNative
foreign func ARKTS_GetCallEnv(info: JSCallInfoPrivate): JSEnv

@FastNative
foreign func ARKTS_GetArgCount(info: JSCallInfoPrivate): UInt32

@FastNative
foreign func ARKTS_GetArg(info: JSCallInfoPrivate, index: UInt32): JSValue_

@FastNative
foreign func ARKTS_GetThisArg(info: JSCallInfoPrivate): JSValue_

foreign func ARKTS_Call(env: JSEnv, fun: JSValue_, thisArg: JSValue_, numArgs: Int32, args: CPointer<JSValue_>): JSValue_

@C
struct JSCallInfoPrivate {
    JSCallInfoPrivate(private let addr: UInt64) {}

    func env(): JSEnv {
        unsafe { ARKTS_GetCallEnv(this) }
    }
}

/**
 * Information related to an ArkTS function call. It can obtain the `this` pointer, retrieve the number of
 * arguments, and get argument by index. Each ArkTS function call saves the argument list and other related
 * information on the ArkTS stack. JSCallInfo is a pointer to this information.
 */
@!APILevel[
    21,
    stagemodelonly: true
]
public struct JSCallInfo {
    JSCallInfo(
        let context: JSContext,
        let callInfo: JSCallInfoPrivate
    ) {}

    /**
     * Number of input arguments.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public prop count: Int64 {
        get() {
            Int64(unsafe { ARKTS_GetArgCount(callInfo) })
        }
    }

    /**
     * `this` pointer.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public prop thisArg: JSValue {
        get() {
            let result = unsafe { ARKTS_GetThisArg(callInfo) }
            JSValue(context, result)
        }
    }

    /**
     * Get argument at index.
     * 
     * @throws { BusinessException } 34300001 - Index is less than 0.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public operator func [](index: Int64): JSValue {
        if (index >= count) {
            return context.void
        }
        if (index < 0) {
            throw jsArrayRangeMisMatch(0, count, index, message: "The call argument index is invalid")
        }
        let result = unsafe { ARKTS_GetArg(callInfo, UInt32(index)) }
        JSValue(context, result)
    }
}

/**
 * Alias for function which is `(JSContext, JSCallInfo) -> JSValue`.
 */
public type JSLambda = (JSContext, JSCallInfo) -> JSValue

@C
func cjLambdaInvoker(info: JSCallInfoPrivate, lambdaId: Int64): JSValue_ {
    let env = info.env()
    let context = JSContext.getOrCreate(env)
    try {
        let lambda = context.sharedLambda_[lambdaId]
        let callInfo = JSCallInfo(context, info)
        lambda(context, callInfo).value
    } catch (err: Exception) {
        context.throwJSError(err)
        context.undefined().toJSValue().value
    } catch (err: Error) {
        context.throwJSError(err)
        context.undefined().toJSValue().value
    }
}

@C
func cjLambdaDestructor(env: JSEnv, lambdaId: Int64): Unit {
    let context = JSContext.getOrCreate(env)
    context.sharedLambda_.remove(lambdaId)
}

/**
 * A safe reference to the ArkTS function.
 */
@!APILevel[
    21,
    stagemodelonly: true
]
public class JSFunction <: JSHeapObject {
    static func createFunction(context: JSContext, lambda: JSLambda): JSValue_ {
        let lambdaId = context.sharedLambda_.append(lambda)
        unsafe { ARKTS_CreateFunc(context.env, lambdaId) }
    }

    init(context: JSContext, value: JSValue_) {
        super(context, value)
    }

    init(context: JSContext, lambda: JSLambda) {
        super(context, createFunction(context, lambda))
    }

    ~init() {
        unsafe { ARKTS_DisposeGlobal(context.env_, globalValue_) }
    }

    static func callWithNoneArg(context: JSContext, fun: JSValue_, thisArg: JSValue_): JSValue {
        let result = unsafe {
            ARKTS_Call(
                context.env,
                fun,
                thisArg,
                0,
                CPointer<JSValue_>()
            )
        }
        JSValue(context, result)
    }

    static func callWithOneArg(context: JSContext, fun: JSValue_, thisArg: JSValue_, arg: JSValue): JSValue {
        var mutableArg = arg.value
        let result = unsafe {
            ARKTS_Call(
                context.env,
                fun,
                thisArg,
                1,
                inout mutableArg
            )
        }
        JSValue(context, result)
    }

    static func callWithManyArgs(context: JSContext, fun: JSValue_, thisArg: JSValue_, args: Array<JSValue>): JSValue {
        let result = unsafe {
            let jsArr = Array<JSValue_>(args.size) {
                index => args[index].value
            }
            let rawHandle = acquireArrayRawData(jsArr)
            let result = ARKTS_Call(
                context.env,
                fun,
                thisArg,
                Int32(args.size),
                rawHandle.pointer
            )
            releaseArrayRawData(rawHandle)
            result
        }
        JSValue(context, result)
    }

    static func callWithArr(context: JSContext, fun: JSValue_, thisArg: JSValue_, args: Array<JSValue>): JSValue {
        if (args.size == 0) {
            callWithNoneArg(context, fun, thisArg)
        } else if (args.size == 1) {
            callWithOneArg(context, fun, thisArg, args[0])
        } else {
            callWithManyArgs(context, fun, thisArg, args)
        }
    }

    /**
     * An ArkTS function call with None argument.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func call(thisArg!: JSValue = context.undefined().toJSValue()): JSValue {
        callWithNoneArg(context, innerValue, thisArg.value)
    }

    /**
     * An ArkTS function call with one argument.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func call(arg: JSValue, thisArg!: JSValue = context.undefined().toJSValue()): JSValue {
        callWithOneArg(context, innerValue, thisArg.value, arg)
    }

    /**
     * An ArkTS function call with multiple arguments.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func call(args: Array<JSValue>, thisArg!: JSValue = context.undefined().toJSValue()): JSValue {
        callWithArr(context, innerValue, thisArg.value, args)
    }
}
