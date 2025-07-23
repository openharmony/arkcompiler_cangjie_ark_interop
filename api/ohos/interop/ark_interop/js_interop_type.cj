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
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
sealed interface JSInteropByte {}

@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
extend Byte <: JSInteropByte {}

@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
public interface JSInteropType<T> {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    static func fromJSValue(context: JSContext, input: JSValue): T
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    func toJSValue(context: JSContext): JSValue
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    static func toArkTsType(): String
}

@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
extend Int8 <: JSInteropType<Int8> {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func fromJSValue(_: JSContext, input: JSValue): Int8 {
        return Int8(input.toNumber())
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toJSValue(context: JSContext): JSValue {
        return context.number(Int32(this)).toJSValue()
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func toArkTsType(): String {
        "number"
    }
}

@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
extend Int16 <: JSInteropType<Int16> {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func fromJSValue(_: JSContext, input: JSValue): Int16 {
        return Int16(input.toNumber())
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toJSValue(context: JSContext): JSValue {
        return context.number(Int32(this)).toJSValue()
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func toArkTsType(): String {
        "number"
    }
}

@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
extend Int32 <: JSInteropType<Int32> {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func fromJSValue(_: JSContext, input: JSValue): Int32 {
        return Int32(input.toNumber())
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toJSValue(context: JSContext): JSValue {
        context.number(this).toJSValue()
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func toArkTsType(): String {
        "number"
    }
}

@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
extend Int64 <: JSInteropType<Int64> {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func fromJSValue(_: JSContext, input: JSValue): Int64 {
        return Int64(input.toNumber())
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toJSValue(context: JSContext): JSValue {
        return context.number(Float64(this)).toJSValue()
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func toArkTsType(): String {
        "number"
    }
}

@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
extend UInt8 <: JSInteropType<UInt8> {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func fromJSValue(_: JSContext, input: JSValue): UInt8 {
        return UInt8(input.toNumber())
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toJSValue(context: JSContext): JSValue {
        return context.number(Int32(this)).toJSValue()
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func toArkTsType(): String {
        "number"
    }
}

@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
extend UInt16 <: JSInteropType<UInt16> {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func fromJSValue(_: JSContext, input: JSValue): UInt16 {
        return UInt16(input.toNumber())
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toJSValue(context: JSContext): JSValue {
        return context.number(Int32(this)).toJSValue()
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func toArkTsType(): String {
        "number"
    }
}

@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
extend UInt32 <: JSInteropType<UInt32> {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    @OverflowWrapping
    public static func fromJSValue(_: JSContext, input: JSValue): UInt32 {
        return UInt32(Int64(input.toNumber()))
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    @OverflowWrapping
    public func toJSValue(context: JSContext): JSValue {
        return context.number(Int32(this)).toJSValue()
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func toArkTsType(): String {
        "number"
    }
}

@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
extend UInt64 <: JSInteropType<UInt64> {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func fromJSValue(_: JSContext, input: JSValue): UInt64 {
        return UInt64(input.toNumber())
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toJSValue(context: JSContext): JSValue {
        return context.number(Float64(this)).toJSValue()
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func toArkTsType(): String {
        "number"
    }
}

@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
extend Float16 <: JSInteropType<Float16> {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func fromJSValue(_: JSContext, input: JSValue): Float16 {
        return Float16(input.toNumber())
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toJSValue(context: JSContext): JSValue {
        return context.number(Float64(this)).toJSValue()
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func toArkTsType(): String {
        "number"
    }
}

@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
extend Float32 <: JSInteropType<Float32> {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func fromJSValue(_: JSContext, input: JSValue): Float32 {
        return Float32(input.toNumber())
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toJSValue(context: JSContext): JSValue {
        return context.number(Float64(this)).toJSValue()
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func toArkTsType(): String {
        "number"
    }
}

@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
extend Float64 <: JSInteropType<Float64> & JSKeyable {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func fromJSValue(_: JSContext, input: JSValue): Float64 {
        return input.toNumber()
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toJSValue(context: JSContext): JSValue {
        return context.number(this).toJSValue()
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func toArkTsType(): String {
        "number"
    }
}

@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
extend Bool <: JSInteropType<Bool> {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func fromJSValue(_: JSContext, input: JSValue): Bool {
        return input.toBoolean()
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toJSValue(context: JSContext): JSValue {
        return context.boolean(this).toJSValue()
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func toArkTsType(): String {
        "boolean"
    }
}

@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
extend String <: JSInteropType<String> {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func fromJSValue(context: JSContext, input: JSValue): String {
        return input.toString(context)
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

@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
extend JSString <: JSInteropType<JSString> {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func fromJSValue(context: JSContext, input: JSValue): JSString {
        return input.asString(context)
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

@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
extend Unit <: JSInteropType<Unit> {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func fromJSValue(_: JSContext, _: JSValue): Unit {}

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toJSValue(context: JSContext): JSValue {
        return context.undefined().toJSValue()
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func toArkTsType(): String {
        "undefined"
    }
}

@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
extend<T> Option<T> <: JSInteropType<Option<T>> where T <: JSInteropType<T> {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func fromJSValue(context: JSContext, input: JSValue): Option<T> {
        if (input.isUndefined()) {
            None<T>
        } else {
            Some(T.fromJSValue(context, input))
        }
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toJSValue(context: JSContext): JSValue {
        match (this) {
            case Some(T) => T.toJSValue(context)
            case None => context.undefined().toJSValue()
        }
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func toArkTsType(): String {
        "union"
    }
}

@!APILevel[
    15,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
extend<T> Array<T> <: JSInteropType<Array<T>> where T <: JSInteropByte {
    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func fromJSValue(context: JSContext, input: JSValue): Array<T> {
        return (input.asArrayBuffer(context).readBytes() as Array<T>) ?? throw Exception("JSValue to buffer error.")
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func toJSValue(context: JSContext): JSValue {
        return context.arrayBuffer((this as Array<Byte>) ?? throw Exception("Buffer to jsvalue error.")).toJSValue()
    }

    @!APILevel[
        15,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public static func toArkTsType(): String {
        "ArrayBuffer"
    }
}
