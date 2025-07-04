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

package ohos.common_event_manager

import ohos.ffi.*
import ohos.base.*
import std.collection.*

foreign {
    func CJ_PublishEvent(event: CString, userId: Int32): Int32

    func CJ_PublishEventWithData(event: CString, userId: Int32, options: CCommonEventPublishData): Int32

    func CJ_SetStaticSubscriberState(enable: Bool): Int32

    func CJ_RemoveStickyCommonEvent(event: CString): Int32

    func CJ_CreateCommonEventSubscribeInfo(event: CArrString): Int64

    func CJ_CreateSubscriber(id: Int64): Int64

    func CJ_Subscribe(id: Int64, funcId: Int64): Int32

    func CJ_Unsubscribe(id: Int64): Int32
}

@C
struct CParameters {
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
struct CArrParameters {
    CArrParameters(
        let head: CPointer<CParameters>,
        let size: Int64
    ) {}

    func free() {
        unsafe {
            for (i in 0..size) {
                head.read(i).free()
            }
            LibC.free(head)
        }
    }
}

@C
struct CCommonEventPublishData {
    var bundleName: CString = CString(CPointer())
    var data: CString = CString(CPointer())
    let code: Int32
    var permissions: CArrString = CArrString(CPointer<CString>(), 0)
    let isOrdered: Bool
    let isSticky: Bool
    var parameters: CArrParameters = CArrParameters(CPointer<CParameters>(), 0)
    init(c: CommonEventPublishData) {
        unsafe {
            try {
                this.code = c.code
                this.isOrdered = c.isOrdered
                this.isSticky = c.isSticky
                this.bundleName = LibC.mallocCString(c.bundleName)
                this.data = LibC.mallocCString(c.data)
                if (c.subscriberPermissions.size != 0) {
                    this.permissions = CArrString(
                        createCpCString(c.subscriberPermissions),
                        c.subscriberPermissions.size
                    )
                }
                if (c.parameters.size != 0) {
                    this.parameters = createCArrParam(c.parameters)
                }
            } catch (e: Exception) {
                free()
                throw e
            }
        }
    }

    func free(): Unit {
        unsafe {
            LibC.free(bundleName)
            LibC.free(data)
            for (i in 0..permissions.size) {
                LibC.free(permissions.head.read(i))
            }
            LibC.free(permissions.head)
            parameters.free()
        }
    }

    func asResource(): CTypeResource<CCommonEventPublishData> {
        return CTypeResource(this, free)
    }
}

@C
struct CCommonEventData {
    CCommonEventData(
        let event: CString,
        let bundleName: CString,
        let code: Int32,
        let data: CString,
        let parameters: CArrParameters
    ) {}
}

unsafe func createCArrParam(parameters: HashMap<String, ValueType>): CArrParameters {
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

unsafe func createCpCString(value: Array<String>): CPointer<CString> {
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
        throw BusinessException(ERR_PARAMETER_ERROR, "Invalid input parameter.")
    }
}

func getValue(value: ValueType): (Int8, CPointer<Unit>, Int64) {
    unsafe {
        match (value) {
            case INT(v) => return (INT_TYPE, createPtr<Int32>(v), 1)
            case FLOAT64(v) => return (F64_TYPE, createPtr<Float64>(v), 1)
            case STRING(v) =>
                let ptr = LibC.mallocCString(v).getChars()
                return (STRING_TYPE, CPointer<Unit>(ptr), 1)
            case BOOL(v) => return (BOOL_TYPE, createPtr<Bool>(v), 1)
            case FD(v) => return (FD_TYPE, createPtr<Int32>(v), 1)
            case ARRSTRING(v) =>
                throwIfEmpty(v)
                let ptr = createCpCString(v)
                return (ARRSTRING_TYPE, CPointer<Unit>(ptr), v.size)
            case ARRAYI32(v) =>
                throwIfEmpty(v)
                return (ARRAYI32_TYPE, createArrPtr<Int32>(v), v.size)
            case ARRAYI64(v) =>
                throwIfEmpty(v)
                return (ARRAYI64_TYPE, createArrPtr<Int64>(v), v.size)
            case ARRAYBOOL(v) =>
                throwIfEmpty(v)
                return (ARRAYBOOL_TYPE, createArrPtr<Bool>(v), v.size)
            case ARRAYF64(v) =>
                throwIfEmpty(v)
                return (ARRAYF64_TYPE, createArrPtr<Float64>(v), v.size)
            case ARRAYFD(v) =>
                throwIfEmpty(v)
                return (ARRAYFD_TYPE, createArrPtr<Int32>(v), v.size)
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
