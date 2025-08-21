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
foreign func ARKTS_CreateUtf8(env: JSEnv, value: CPointer<UInt8>, size: Int32): JSValue_

@FastNative
foreign func ARKTS_GetValueCString(env: JSEnv, value: JSValue_): CString

@FastNative
foreign func ARKTS_FreeCString(src: CString): Unit

@FastNative
foreign func ARKTS_GetValueUtf8Size(env: JSEnv, value: JSValue_): Int32

@FastNative
foreign func ARKTS_GetValueUtf8(env: JSEnv, value: JSValue_, capacity: Int32, buffer: CPointer<UInt8>): Int32
@C
struct JSStringInfo {
    JSStringInfo(
        let isCompressed: Bool,
        let length: UInt32
    ) {}
}
@FastNative
foreign func ARKTS_GetStringInfo(env: JSEnv, value: JSValue_): JSStringInfo
@FastNative
foreign func ARKTS_StringCopy(env: JSEnv, value: JSValue_, dst: CPointer<Unit>, length: UInt32): Unit
@FastNative
foreign func ARKTS_CreateString(env: JSEnv, isCompressed: Bool, length: UInt32, data: CPointer<Unit>): JSValue_

/**
 * An interface that implements extension method to convert value to JSValue.
 */
@!APILevel[
    21,
    stagemodelonly: true
]
public interface ToJSValue {
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    func toJSValue(context: JSContext): JSValue
}

/**
 * An interface that can be used as a JSObejct key. It implements extension methods for String type.
 */
@!APILevel[
    21,
    stagemodelonly: true
]
sealed interface JSKeyable <: ToString & ToJSValue {}

/**
 * String class that extends the JSKeyable interface.
 */
@!APILevel[
    21,
    stagemodelonly: true
]
extend String <: JSKeyable {
    /**
     * Convert String to JSValue.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func toJSValue(context: JSContext): JSValue {
        JSValue(context, JSString.createString(context, this))
    }
}

/**
 * The JSString object is used to represent a secure reference to the ArkTS string.
 * It can be converted to Cangjie String and Utf16String.
 */
@!APILevel[
    21,
    stagemodelonly: true
]
public class JSString <: JSHeapObject & ToString & JSKeyable {
    static func createString(context: JSContext, source: String): JSValue_ {
        unsafe {
            let rawHandle = acquireArrayRawData(source.rawData())
            let result = ARKTS_CreateUtf8(context.env, rawHandle.pointer, Int32(rawHandle.array.size))
            releaseArrayRawData(rawHandle)
            result
        }
    }

    static func createString(context: JSContext, source: Utf16String): JSValue_ {
        let header = source.getHeader()
        unsafe {
            ARKTS_CreateString(context.env, header.isLatin1, header.length, header.data)
        }
    }

    static func readString(context: JSContext, value: JSValue_): String {
        let size = unsafe { ARKTS_GetValueUtf8Size(context.env, value) - 1 }
        let bytes = Array<UInt8>(Int64(size), repeat: 0)
        unsafe {
            let rawHandle = acquireArrayRawData(bytes)
            let updatedSize = ARKTS_GetValueUtf8(context.env, value, size, rawHandle.pointer)
            releaseArrayRawData(rawHandle)

            String.fromUtf8Unchecked(bytes.slice(0, Int64(updatedSize - 1)))
        }
    }

    static func readUtf16String(context: JSContext, value: JSValue_): Utf16String {
        let info = unsafe { ARKTS_GetStringInfo(context.env, value) }
        let length = info.length
        let boxValue = Box(value)
        unsafe {
            Utf16String.create(info.isCompressed, Int64(length)) { ptr =>
                ARKTS_StringCopy(context.env, boxValue.value, ptr, length)
            }
        }
    }

    private var cjStrCache_: ?String

    init(context: JSContext, source: String) {
        super(context, createString(context, source))
        cjStrCache_ = Some(source)
    }

    init(context: JSContext, jsValue: JSValue_) {
        super(context, jsValue)
        cjStrCache_ = None
    }

    init(context: JSContext, value: Utf16String) {
        super(context, createString(context, value))
        cjStrCache_ = None
    }

    ~init() {
        unsafe { ARKTS_DisposeGlobal(context.env_, globalValue_) }
    }

    /**
     * Convert JSString to JSValue.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func toJSValue(_: JSContext): JSValue {
        JSValue(context, innerValue)
    }

    /**
     * Convert JSString to String.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func toString(): String {
        match (cjStrCache_) {
            case Some(text) => text
            case None => readUtf8AndCache()
        }
    }

    /**
     * Convert JSString to Utf16String.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public func toUtf16String(): Utf16String {
        JSString.readUtf16String(context, innerValue)
    }

    private func readUtf8AndCache(): String {
        let result = readString(context, innerValue)
        cjStrCache_ = Some(result)
        result
    }
}
