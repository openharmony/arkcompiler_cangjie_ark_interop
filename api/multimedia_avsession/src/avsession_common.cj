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

package ohos.multimedia_avsession

import std.core.*
import std.collection.*
import std.deriving.*
import ohos.image.*
import ohos.ffi.*
import ohos.base.*
import ohos.labels.*

const NULL_TYPE: Int32 = -1
const STRING_TYPE: Int32 = 0
const INT32_TYPE: Int32 = 1
const INT64_TYPE: Int32 = 2
const FLOAT64_TYPE: Int32 = 11
const BOOL_TYPE: Int32 = 3
const FD_TYPE: Int32 = 4
const ARRSTRING_TYPE: Int32 = 5
const ARRAYI32_TYPE: Int32 = 6
const ARRAYI64_TYPE: Int32 = 7
const ARRAYBOOL_TYPE: Int32 = 8
const ARRAYF64_TYPE: Int32 = 9
const ARRAYFD_TYPE: Int32 = 10
const LOOP_MODE_TYPE: Int32 = 12
const PIXEL_MAP_TYPE: Int32 = 13
const SPEED_TYPE: Int32 = 14
const HASH_MAP_TYPE: Int32 = 15
protected let TYPE_TO_STRING = HashMap<Int32, String>(
    [
        (NULL_TYPE, "Null"),
        (STRING_TYPE, "String"),
        (INT32_TYPE, "Int32"),
        (INT64_TYPE, "Int64"),
        (FLOAT64_TYPE, "Float64"),
        (BOOL_TYPE, "Bool"),
        (LOOP_MODE_TYPE, "LooMode"),
        (SPEED_TYPE, "PlaybackSpeed")
    ]
)
const CALLMETADATA_NAME: Int32 = 0
const CALLMETADATA_PHONENUMBER: Int32 = 1
const CALLMETADATA_AVATAR: Int32 = 2

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true
]
public enum ValueType {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true
    ]
    NULL(Option<Int32>)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true
    ]
    STRING(String)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true
    ]
    INT32(Int32)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true
    ]
    INT64(Int64)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true
    ]
    FLOAT64(Float64)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true
    ]
    BOOL(Bool)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true
    ]
    FD(Int32)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true
    ]
    ARRSTRING(Array<String>)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true
    ]
    ARRAYI32(Array<Int32>)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true
    ]
    ARRAYI64(Array<Int64>)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true
    ]
    ARRAYBOOL(Array<Bool>)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true
    ]
    ARRAYF64(Array<Float64>)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true
    ]
    ARRAYFD(Array<Int32>)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true
    ]
    LOOP_MODE(LoopMode)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true
    ]
    PIXEL_MAP(PixelMap)
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true
    ]
    HASH_MAP(HashMap<String, ValueType>)
    | ...
}

unsafe func createPtr<T>(value: T): CPointer<Unit> where T <: CType {
    let ptr = safeMalloc<T>()
    ptr.write(value)
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
        throw BusinessException(ERR_INVALID_PARAM, "Invalid input parameter.")
    }
}

unsafe func createArrPtr<T>(value: Array<T>): CPointer<Unit> where T <: CType {
    let ptr = safeMalloc<T>(count: value.size)
    for (i in 0..value.size) {
        ptr.write(i, value[i])
    }
    return CPointer<Unit>(ptr)
}

unsafe func createArr<T>(value: CPointer<T>, size: Int64): Array<T> where T <: CType {
    let arr = ArrayList<T>()
    for (i in 0..size) {
        arr.add(value.read(i))
    }
    return arr.toArray()
}

unsafe func createStringArr(value: CPointer<CString>, size: Int64): Array<String> {
    let arr = ArrayList<String>()
    for (i in 0..size) {
        arr.add(value.read(i).toString())
    }
    return arr.toArray()
}

unsafe func convertValueToCPointer(value: ValueType): (Int32, CPointer<Unit>, Int64) {
    match (value) {
        case INT32(v) =>
            LOGGER.debug("CParameters value type:Int32, value:" + v.toString())
            (INT32_TYPE, createPtr<Int32>(v), 1)
        case STRING(v) =>
            LOGGER.debug("CParameters value type:String, value:" + v.toString())
            (STRING_TYPE, CPointer<Unit>(LibC.mallocCString(v).getChars()), 1)
        case FLOAT64(v) =>
            LOGGER.debug("CParameters value type:Float64, value:" + v.toString())
            (FLOAT64_TYPE, createPtr<Float64>(v), 1)
        case BOOL(v) =>
            LOGGER.debug("CParameters value type:Bool, value:" + v.toString())
            (BOOL_TYPE, createPtr<Bool>(v), 1)
        case FD(v) =>
            LOGGER.debug("CParameters value type:FileDescriptor, value:" + v.toString())
            (FD_TYPE, createPtr<Int32>(v), 1)
        case HASH_MAP(v) =>
            let arrParameters = CArrParameters(v)
            (HASH_MAP_TYPE, CPointer<Unit>(arrParameters.head), arrParameters.size)
        case ARRSTRING(v) =>
            throwIfEmpty(v)
            (ARRSTRING_TYPE, CPointer<Unit>(createCpCString(v)), v.size)
        case ARRAYI32(v) =>
            throwIfEmpty(v)
            (ARRAYI32_TYPE, createArrPtr<Int32>(v), v.size)
        case ARRAYBOOL(v) =>
            throwIfEmpty(v)
            (ARRAYBOOL_TYPE, createArrPtr<Bool>(v), v.size)
        case ARRAYF64(v) =>
            throwIfEmpty(v)
            (ARRAYF64_TYPE, createArrPtr<Float64>(v), v.size)
        case ARRAYFD(v) =>
            throwIfEmpty(v)
            (ARRAYFD_TYPE, createArrPtr<Int32>(v), v.size)
        case _ => throw IllegalArgumentException("Unsupported ValueType")
    }
}

unsafe func convertCPointertoValue(tag: Int32, ptr: CPointer<Unit>, size!: Int64 = 1): ValueType {
    match {
        case tag == NULL_TYPE => ValueType.NULL(None)
        case tag == INT32_TYPE => ValueType.INT32(CPointer<Int32>(ptr).read())
        case tag == STRING_TYPE => ValueType.STRING((CString(CPointer<UInt8>(ptr))).toString())
        case tag == FLOAT64_TYPE => ValueType.FLOAT64(CPointer<Float64>(ptr).read())
        case tag == BOOL_TYPE => ValueType.BOOL(CPointer<Bool>(ptr).read())
        case tag == FD_TYPE => ValueType.FD(CPointer<Int32>(ptr).read())
        case tag == ARRSTRING_TYPE => ValueType.ARRSTRING(createStringArr(CPointer<CString>(ptr), size))
        case tag == ARRAYI32_TYPE => ValueType.ARRAYI32(createArr(CPointer<Int32>(ptr), size))
        case tag == ARRAYBOOL_TYPE => ValueType.ARRAYBOOL(createArr(CPointer<Bool>(ptr), size))
        case tag == ARRAYF64_TYPE => ValueType.ARRAYF64(createArr(CPointer<Float64>(ptr), size))
        case tag == ARRAYFD_TYPE => ValueType.ARRAYFD(createArr(CPointer<Int32>(ptr), size))
        case tag == HASH_MAP_TYPE => ValueType.HASH_MAP(
            CArrParameters(CPointer<CParameters>(ptr), size).toHashMapWithoutFree())
        case _ => throw IllegalArgumentException("Unsupported PointerType")
    }
}

unsafe func convertCommandParameterToCPointer(command: AVControlCommandParameterType): (Int32, CPointer<Unit>, Int64) {
    match (command) {
        case INT32(v) => (INT32_TYPE, createPtr<Int32>(v), 1)
        case INT64(v) => (INT64_TYPE, createPtr<Int64>(v), 1)
        case STRING(v) => (STRING_TYPE, CPointer<Unit>(LibC.mallocCString(v).getChars()), 1)
        case FLOAT64(v) => (FLOAT64_TYPE, createPtr<Float64>(v), 1)
        case LOOP_MODE(v) => (LOOP_MODE_TYPE, createPtr<Int32>(v.value), 1)
        case _ => throw IllegalArgumentException("The type is not supported.")
    }
}

unsafe func convertCommandParameterToCPointer(command: AVCastControlCommandParameterType): (Int32, CPointer<Unit>, 
    Int64) {
    match (command) {
        case INT32(v) => (INT32_TYPE, createPtr<Int32>(v), 1)
        case SPEED(v) => (INT32_TYPE, createPtr<Int32>(v.value), 1)
        case LOOP_MODE(v) => (LOOP_MODE_TYPE, createPtr<Int32>(v.value), 1)
        case _ => throw IllegalArgumentException("The type is not supported.")
    }
}

@C
struct CStringArr {
    CStringArr(
        let head: CPointer<CString>,
        let size: Int64
    ) {}

    init(array: Array<String>) {
        size = array.size
        head = unsafe { cjArr2CArr<String, CString>(array, {i => LibC.mallocCString(i)}, {i => LibC.free(i)}) }
    }

    func toArray(): Array<String> {
        unsafe {
            Array<String>(
                size,
                {
                    i =>
                    let ptr = CPointer<CString>(head).read(i)
                    return ptr.toString()
                }
            )
        }
    }

    func free() {
        unsafe {
            for (i in 0..size) {
                LibC.free(head.read(i))
            }
            LibC.free(head)
        }
    }
}

@C
protected struct StringPixelMapParameter {
    StringPixelMapParameter(
        let kind: Int32,
        let string!: CString = CString(CPointer()),
        let pixelMap!: Int64 = 0
    ) {}

    protected static func getCParaFromValueType(value: ValueType) {
        match (value) {
            case ValueType.STRING(v) => StringPixelMapParameter(STRING_TYPE, string: unsafe { LibC.mallocCString(v) })
            case ValueType.PIXEL_MAP(v) => StringPixelMapParameter(PIXEL_MAP_TYPE, pixelMap: v.getID())
            case _ => throw IllegalArgumentException("Unsupported ValueType")
        }
    }

    protected unsafe func free() {
        LibC.free(string)
    }
}

@C
struct CParameters {
    let valueType: Int32
    let key: CString
    let value: CPointer<Unit>
    let size: Int64

    init(key: String, value: ValueType) {
        this.key = unsafe { LibC.mallocCString(key) }
        (valueType, this.value, this.size) = try {
            unsafe { convertValueToCPointer(value) }
        } catch (e: Exception) {
            unsafe { LibC.free(this.key) }
            throw e
        }
    }

    init(command: ?AVControlCommandParameterType) {
        this.key = unsafe { LibC.mallocCString("parameter") }
        if (let Some(cmd) <- command) {
            (valueType, this.value, this.size) = try {
                unsafe { convertCommandParameterToCPointer(cmd) }
            } catch (e: Exception) {
                unsafe { LibC.free(this.key) }
                throw e
            }
        } else {
            (valueType, this.value, this.size) = (NULL_TYPE, CPointer<Unit>(), 0)
        }
    }

    init(command: ?AVCastControlCommandParameterType) {
        this.key = unsafe { LibC.mallocCString("parameter") }
        if (let Some(cmd) <- command) {
            (valueType, this.value, this.size) = try {
                unsafe { convertCommandParameterToCPointer(cmd) }
            } catch (e: Exception) {
                unsafe { LibC.free(this.key) }
                throw e
            }
        } else {
            (valueType, this.value, this.size) = (NULL_TYPE, CPointer<Unit>(), 0)
        }
    }

    func free(): Unit {
        unsafe {
            LibC.free(key)
            if (valueType == HASH_MAP_TYPE) {
                CArrParameters(CPointer<CParameters>(value), size).free()
                return
            } else if (valueType == ARRSTRING_TYPE) {
                let csValue = CPointer<CString>(value)
                for (i in 0..size) {
                    LibC.free(csValue.read(i))
                }
            }
            LibC.free<Unit>(value)
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

unsafe func hashMap2CArrParameters(parameters: HashMap<String, ValueType>): CPointer<CParameters> {
    let size = parameters.size
    if (size == 0) {
        return CPointer<CParameters>();
    }
    let ptr = safeMalloc<CParameters>(count: size)
    var i = 0
    for (pair in parameters) {
        try {
            ptr.write(i, CParameters(pair[0], pair[1]))
        } catch (e: Exception) {
            for (j in 0..i) {
                ptr.read(j).free()
            }
            LibC.free(ptr)
            throw e
        }
        i++
    }
    ptr
}

@C
struct CArrParameters {
    CArrParameters(
        var head: CPointer<CParameters>,
        let size: Int64
    ) {}

    init(parameters: HashMap<String, ValueType>) {
        head = unsafe { hashMap2CArrParameters(parameters) }
        size = parameters.size
    }

    func toHashMap(): HashMap<String, ValueType> {
        let result = HashMap<String, ValueType>()
        try {
            unsafe {
                for (i in 0..size) {
                    let para = head.read(i)
                    result[para.key.toString()] = convertCPointertoValue(para.valueType, para.value, size: para.size)
                }
            }
        } finally {
            free()
        }
        return result
    }

    func toHashMapWithoutFree(): HashMap<String, ValueType> {
        let result = HashMap<String, ValueType>()
        if (size == 0 || head.isNull()) {
            return result
        }
        unsafe {
            for (i in 0..size) {
                let para = head.read(i)
                result[para.key.toString()] = convertCPointertoValue(para.valueType, para.value, size: para.size)
            }
        }
        return result
    }

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
struct CAVQueueItemArr {
    CAVQueueItemArr(
        let head: CPointer<CAVQueueItem>,
        let size: Int64
    ) {}

    init(array: Array<AVQueueItem>) {
        size = array.size
        head = unsafe { cjArr2CArr<AVQueueItem, CAVQueueItem>(array, {i => CAVQueueItem(i)}, {i => i.free()}) }
    }

    func toArray(): Array<AVQueueItem> {
        unsafe {
            Array<AVQueueItem>(size, {
                i => return head.read(i).toCJObject()
            })
        }
    }

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
struct CCastDisplayInfoArr {
    CCastDisplayInfoArr(
        let head: CPointer<CCastDisplayInfo>,
        let size: Int64
    ) {}

    init() {
        head = CPointer<CCastDisplayInfo>()
        size = 0
    }
    init(array: Array<CastDisplayInfo>) {
        size = array.size
        head = unsafe { cjArr2CArr<CastDisplayInfo, CCastDisplayInfo>(array, {i => CCastDisplayInfo(i)}, {i => i.free()}) }
    }

    func toArray(): Array<CastDisplayInfo> {
        unsafe {
            Array<CastDisplayInfo>(size, {
                i => return head.read(i).toCJObject()
            })
        }
    }

    func free() {
        unsafe {
            for (i in 0..size) {
                head.read(i).free()
            }
            LibC.free(head)
        }
    }
}
