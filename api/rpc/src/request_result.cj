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

package ohos.rpc

import ohos.ffi.*

@C
struct ByteArray {
    let data: CPointer<Int8>
    let len: UInt32

    init(arr: Array<Int8>) {
        if (arr.size == 0) {
            this.data = CPointer<Int8>()
            this.len = 0
        } else {
            this.data = safeMalloc<Int8>(count: arr.size)
            for (i in 0..arr.size) {
                unsafe { data.write(i, arr[i]) }
            }
            this.len = UInt32(arr.size)
        }
    }

    func toArray(): Array<Int8> {
        if (this.len == 0) {
            return []
        } else {
            return Array<Int8>(Int64(len), {i => unsafe { data.read(i) }})
        }
    }

    func toBoolArray(): Array<Bool> {
        if (this.len == 0) {
            return []
        } else {
            return Array<Bool>(Int64(len), {i => unsafe { data.read(i) != 0 }})
        }
    }

    func free(): Unit {
        unsafe { LibC.free(data) }
    }
}

@C
struct ShortArray {
    let data: CPointer<Int16>
    let len: UInt32

    init(arr: Array<Int16>) {
        if (arr.size == 0) {
            this.data = CPointer<Int16>()
            this.len = 0
        } else {
            this.data = safeMalloc<Int16>(count: arr.size)
            for (i in 0..arr.size) {
                unsafe { data.write(i, arr[i]) }
            }
            this.len = UInt32(arr.size)
        }
    }

    func toArray(): Array<Int16> {
        if (this.len == 0) {
            return []
        } else {
            return Array<Int16>(Int64(len), {i => unsafe { data.read(i) }})
        }
    }

    func free(): Unit {
        unsafe { LibC.free(data) }
    }
}

@C
struct UInt16Array {
    let data: CPointer<UInt16>
    let len: UInt32

    init(arr: Array<UInt16>) {
        if (arr.size == 0) {
            this.data = CPointer<UInt16>()
            this.len = 0
        } else {
            this.data = safeMalloc<UInt16>(count: arr.size)
            for (i in 0..arr.size) {
                unsafe { data.write(i, arr[i]) }
            }
            this.len = UInt32(arr.size)
        }
    }

    func toArray(): Array<UInt16> {
        if (this.len == 0) {
            return []
        } else {
            return Array<UInt16>(Int64(len), {i => unsafe { data.read(i) }})
        }
    }

    func free(): Unit {
        unsafe { LibC.free(data) }
    }
}

@C
struct CIntArray {
    let data: CPointer<Int32>
    let len: UInt32

    init(arr: Array<Int32>) {
        if (arr.size == 0) {
            this.data = CPointer<Int32>()
            this.len = 0
        } else {
            this.data = safeMalloc<Int32>(count: arr.size)
            for (i in 0..arr.size) {
                unsafe { data.write(i, arr[i]) }
            }
            this.len = UInt32(arr.size)
        }
    }

    func toArray(): Array<Int32> {
        if (this.len == 0) {
            return []
        } else {
            return Array<Int32>(Int64(len), {i => unsafe { data.read(i) }})
        }
    }

    func free(): Unit {
        unsafe { LibC.free(data) }
    }
}

@C
struct UInt32Array {
    let data: CPointer<UInt32>
    let len: UInt32

    init(arr: Array<UInt32>) {
        if (arr.size == 0) {
            this.data = CPointer<UInt32>()
            this.len = 0
        } else {
            this.data = safeMalloc<UInt32>(count: arr.size)
            for (i in 0..arr.size) {
                unsafe { data.write(i, arr[i]) }
            }
            this.len = UInt32(arr.size)
        }
    }

    func toArray(): Array<UInt32> {
        if (this.len == 0) {
            return []
        } else {
            return Array<UInt32>(Int64(len), {i => unsafe { data.read(i) }})
        }
    }

    func free(): Unit {
        unsafe { LibC.free(data) }
    }
}

@C
struct LongArray {
    let data: CPointer<Int64>
    let len: UInt32

    init(arr: Array<Int64>) {
        if (arr.size == 0) {
            this.data = CPointer<Int64>()
            this.len = 0
        } else {
            this.data = safeMalloc<Int64>(count: arr.size)
            for (i in 0..arr.size) {
                unsafe { data.write(i, arr[i]) }
            }
            this.len = UInt32(arr.size)
        }
    }

    func toArray(): Array<Int64> {
        if (this.len == 0) {
            return []
        } else {
            return Array<Int64>(Int64(len), {i => unsafe { data.read(i) }})
        }
    }

    func free(): Unit {
        unsafe { LibC.free(data) }
    }
}

@C
struct UInt64Array {
    let data: CPointer<UInt64>
    let len: UInt32

    init(arr: Array<UInt64>) {
        if (arr.size == 0) {
            this.data = CPointer<UInt64>()
            this.len = 0
        } else {
            this.data = safeMalloc<UInt64>(count: arr.size)
            for (i in 0..arr.size) {
                unsafe { data.write(i, arr[i]) }
            }
            this.len = UInt32(arr.size)
        }
    }

    func toArray(): Array<UInt64> {
        if (this.len == 0) {
            return []
        } else {
            return Array<UInt64>(Int64(len), {i => unsafe { data.read(i) }})
        }
    }

    func free(): Unit {
        unsafe { LibC.free(data) }
    }
}

@C
struct FloatArray {
    let data: CPointer<Float32>
    let len: UInt32

    init(arr: Array<Float32>) {
        if (arr.size == 0) {
            this.data = CPointer<Float32>()
            this.len = 0
        } else {
            this.data = safeMalloc<Float32>(count: arr.size)
            for (i in 0..arr.size) {
                unsafe { data.write(i, arr[i]) }
            }
            this.len = UInt32(arr.size)
        }
    }

    func toArray(): Array<Float32> {
        if (this.len == 0) {
            return []
        } else {
            return Array<Float32>(Int64(len), {i => unsafe { data.read(i) }})
        }
    }

    func free(): Unit {
        unsafe { LibC.free(data) }
    }
}

@C
struct DoubleArray {
    let data: CPointer<Float64>
    let len: UInt32

    init(arr: Array<Float64>) {
        if (arr.size == 0) {
            this.data = CPointer<Float64>()
            this.len = 0
        } else {
            this.data = safeMalloc<Float64>(count: arr.size)
            for (i in 0..arr.size) {
                unsafe { data.write(i, arr[i]) }
            }
            this.len = UInt32(arr.size)
        }
    }

    func toArray(): Array<Float64> {
        if (this.len == 0) {
            return []
        } else {
            return Array<Float64>(Int64(len), {i => unsafe { data.read(i) }})
        }
    }

    func free(): Unit {
        unsafe { LibC.free(data) }
    }
}

@C
struct CharArray {
    let data: CPointer<UInt8>
    let len: UInt32

    init(arr: Array<UInt8>) {
        if (arr.size == 0) {
            this.data = CPointer<UInt8>()
            this.len = 0
        } else {
            this.data = safeMalloc<UInt8>(count: arr.size)
            for (i in 0..arr.size) {
                unsafe { data.write(i, arr[i]) }
            }
            this.len = UInt32(arr.size)
        }
    }

    func toArray(): Array<UInt8> {
        if (this.len == 0) {
            return []
        } else {
            return Array<UInt8>(Int64(len), {i => unsafe { data.read(i) }})
        }
    }

    func free(): Unit {
        unsafe { LibC.free(data) }
    }
}

@C
struct CStringArray {
    let data: CPointer<CString>
    let len: UInt32

    init(arr: Array<String>) {
        if (arr.size == 0) {
            this.data = CPointer<CString>()
            this.len = 0
        } else {
            this.data = safeMalloc<CString>(count: arr.size)
            for (i in 0..arr.size) {
                try {
                    unsafe { data.write(i, LibC.mallocCString(arr[i])) }
                } catch (e: Exception) {
                    for (j in 0..i) {
                        unsafe { LibC.free(data.read(j)) }
                    }
                    unsafe { LibC.free(data) }
                    throw e
                }
            }
            this.len = UInt32(arr.size)
        }
    }

    func toArray(): Array<String> {
        if (this.len == 0) {
            return []
        } else {
            return Array<String>(Int64(len), {i => unsafe { data.read(i) }.toString()})
        }
    }

    func free(): Unit {
        if (!this.data.isNull()) {
            for (i in 0..Int64(len)) {
                unsafe {
                    LibC.free(data.read(i))
                }
            }
            unsafe { LibC.free(data) }
        }
    }
}

@C
struct RemoteObjectArray {
    let objectType: CPointer<Int32>
    let id: CPointer<Int64>
    let len: UInt32

    init(arr: Array<IRemoteObject>) {
        if (arr.size == 0) {
            this.objectType = CPointer<Int32>()
            this.id = CPointer<Int64>()
            this.len = 0
        } else {
            unsafe {
                this.objectType = safeMalloc<Int32>(count: arr.size)
                this.id = safeMalloc<Int64>(count: arr.size)
                for (i in 0..arr.size) {
                    objectType.write(i, 0)
                    id.write(i, 1)
                }
                this.len = UInt32(arr.size)
            }
        }
    }
}
