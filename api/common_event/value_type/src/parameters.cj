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

protected package ohos.value_type

import ohos.ffi.safeMalloc
import ohos.base.{BusinessException, ERR_PARAMETER_ERROR}
import std.collection.HashMap

const INT_TYPE: Int8 = 0
const F64_TYPE: Int8 = 1
const STRING_TYPE: Int8 = 2
const BOOL_TYPE: Int8 = 3
const FD_TYPE: Int8 = 4
const ARRSTRING_TYPE: Int8 = 5
const ARRAYI32_TYPE: Int8 = 6
const ARRAYI64_TYPE: Int8 = 7
const ARRAYBOOL_TYPE: Int8 = 8
const ARRAYF64_TYPE: Int8 = 9
const ARRAYFD_TYPE: Int8 = 10

protected struct Parameters {
    protected Parameters(
        protected let key: String,
        protected let value: ValueType
    ) {}

    protected init(c: CParameters) {
        this.key = c.key.toString()
        this.value = unsafe {
            match {
                case c.valueType == INT_TYPE => Int32Value(CPointer<Int32>(c.value).read())
                case c.valueType == F64_TYPE => Float64Value(CPointer<Float64>(c.value).read())
                case c.valueType == STRING_TYPE => StringValue(CString(CPointer<UInt8>(c.value)).toString())
                case c.valueType == BOOL_TYPE => BoolValue(CPointer<Bool>(c.value).read())
                case c.valueType == FD_TYPE => FD(CPointer<Int32>(c.value).read())
                case c.valueType == ARRSTRING_TYPE => ArrayString(c.toArrString())
                case c.valueType == ARRAYI32_TYPE => ArrayInt32(c.toArr<Int32>())
                case c.valueType == ARRAYI64_TYPE => ArrayInt64(c.toArr<Int64>())
                case c.valueType == ARRAYBOOL_TYPE => ArrayBool(c.toArr<Bool>())
                case c.valueType == ARRAYF64_TYPE => ArrayFloat64(c.toArr<Float64>())
                case _ => ArrayFD(c.toArr<Int32>())
            }
        }
    }
}

@C
protected struct CParameters {
    let valueType: Int8
    let key: CString
    let value: CPointer<Unit>
    let size: Int64

    init(p: Parameters) {
        this.key = unsafe { LibC.mallocCString(p.key) }
        (valueType, this.value, this.size) = try {
            getValue(p.value)
        } catch (e: Exception) {
            unsafe { LibC.free(this.key) }
            throw e
        }
    }

    func free(): Unit {
        unsafe {
            if (valueType == ARRSTRING_TYPE) {
                let csValue = CPointer<CString>(value)
                for (i in 0..size) {
                    LibC.free(csValue.read(i))
                }
            }
            LibC.free<Unit>(value)
            LibC.free(key)
        }
    }

    func toArrString(): Array<String> {
        unsafe {
            Array<String>(
                size,
                {
                    i =>
                    let ptr = CPointer<CString>(value).read(i)
                    return ptr.toString()
                }
            )
        }
    }

    func toArr<T>(): Array<T> where T <: CType {
        unsafe {
            Array<T>(size, {i => CPointer<T>(value).read(i)})
        }
    }
}

@C
protected struct CArrParameters {
    protected CArrParameters(
        protected let head: CPointer<CParameters>,
        protected let size: Int64
    ) {}

    protected func free() {
        unsafe {
            for (i in 0..size) {
                head.read(i).free()
            }
            LibC.free(head)
        }
    }
}

unsafe protected func createCArrParam(parameters: HashMap<String, ValueType>): CArrParameters {
    let cp = safeMalloc<CParameters>(count: parameters.size)
    let ptr = CArrParameters(cp, parameters.size)
    var count = 0
    for ((k, v) in parameters) {
        let value = try {
            CParameters(Parameters(k, v))
        } catch (e: Exception) {
            freeCArrParam(ptr.head, count)
            LibC.free(cp)
            throw e
        }
        ptr.head.write(count, value)
        count++
    }
    return ptr
}

unsafe func freeCArrParam(cp: CPointer<CParameters>, index: Int64): Unit {
    for (i in 0..index) {
        cp.read(i).free()
    }
}

unsafe func createPtr<T>(value: T): CPointer<Unit> where T <: CType {
    let ptr = safeMalloc<T>()
    ptr.write(value)
    return CPointer<Unit>(ptr)
}

unsafe func createArrPtr<T>(value: Array<T>): CPointer<Unit> where T <: CType {
    let ptr = safeMalloc<T>(count: value.size)
    for (i in 0..value.size) {
        ptr.write(i, value[i])
    }
    return CPointer<Unit>(ptr)
}

unsafe protected func createCpCString(value: Array<String>): CPointer<CString> {
    let ptr = safeMalloc<CString>(count: value.size)
    for (i in 0..value.size) {
        try {
            ptr.write(i, LibC.mallocCString(value[i]))
        } catch (e: Exception) {
            freeCpCString(ptr, i)
            LibC.free(ptr)
            throw e
        }
    }
    return ptr
}

unsafe func freeCpCString(cp: CPointer<CString>, index: Int64): Unit {
    for (i in 0..index) {
        LibC.free(cp.read(i))
    }
}

func throwIfEmpty<T>(arr: Array<T>): Unit {
    if (arr.size == 0) {
        throw BusinessException(ERR_PARAMETER_ERROR, "Parameter error. Parameter verification failed.")
    }
}

func getValue(value: ValueType): (Int8, CPointer<Unit>, Int64) {
    unsafe {
        match (value) {
            case Int32Value(v) => return (INT_TYPE, createPtr<Int32>(v), 1)
            case Float64Value(v) => return (F64_TYPE, createPtr<Float64>(v), 1)
            case StringValue(v) =>
                let ptr = LibC.mallocCString(v).getChars()
                return (STRING_TYPE, CPointer<Unit>(ptr), 1)
            case BoolValue(v) => return (BOOL_TYPE, createPtr<Bool>(v), 1)
            case FD(v) => return (FD_TYPE, createPtr<Int32>(v), 1)
            case ArrayString(v) =>
                throwIfEmpty(v)
                let ptr = createCpCString(v)
                return (ARRSTRING_TYPE, CPointer<Unit>(ptr), v.size)
            case ArrayInt32(v) =>
                throwIfEmpty(v)
                return (ARRAYI32_TYPE, createArrPtr<Int32>(v), v.size)
            case ArrayInt64(v) =>
                throwIfEmpty(v)
                return (ARRAYI64_TYPE, createArrPtr<Int64>(v), v.size)
            case ArrayBool(v) =>
                throwIfEmpty(v)
                return (ARRAYBOOL_TYPE, createArrPtr<Bool>(v), v.size)
            case ArrayFloat64(v) =>
                throwIfEmpty(v)
                return (ARRAYF64_TYPE, createArrPtr<Float64>(v), v.size)
            case ArrayFD(v) =>
                throwIfEmpty(v)
                return (ARRAYFD_TYPE, createArrPtr<Int32>(v), v.size)
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
