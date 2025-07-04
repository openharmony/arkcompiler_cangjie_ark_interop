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

package ohos.unifiedDataChannel

import ohos.ffi.*
import ohos.base.*
import ohos.labels.*
import ohos.image.*

foreign {
    func FfiUDMFUnifiedRecordConstructor(): Int64

    func FfiUDMFUnifiedRecordConstructorwithType(ctype: CString, value: CValueType): Int64

    func FfiUDMFUnifiedRecordGetType(unifiedRecordId: Int64): CString

    func FfiUDMFUnifiedRecordGetValue(unifiedRecordId: Int64): CValueType
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
]
public class UnifiedRecord <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    public init() {
        super(unsafe { FfiUDMFUnifiedRecordConstructor() })
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    public init(dtype: String, value: ValueType) {
        super(
            unsafe {
                let ctype = LibC.mallocCString(dtype)
                let cValue = CValueType(value)
                let id = FfiUDMFUnifiedRecordConstructorwithType(ctype, cValue)
                LibC.free(ctype)
                cValue.free()
                id
            })
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    public func getType(): String {
        let retData = unsafe {
            FfiUDMFUnifiedRecordGetType(getID())
        }
        let ret = retData.toString()
        unsafe {
            LibC.free(retData)
        }
        return ret
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    public func getValue(): ValueType {
        let retData = unsafe {
            FfiUDMFUnifiedRecordGetValue(getID())
        }
        let ret = retData.toValueType()
        retData.free()
        return ret
    }
}

@C
struct CValueType {
    var integer32: Int32
    var integer64: Int64
    var double: Float64
    var bool: Bool
    var string: CPointer<UInt8>
    var arrayBuffer: CArrUI8
    var pixelMapId: Int64

    var tag: UInt8

    init(value: ValueType) {
        integer32 = 0
        integer64 = 0
        double = 0.0
        bool = false
        string = CPointer<UInt8>()
        arrayBuffer = CArrUI8(CPointer<UInt8>(), 0)
        pixelMapId = 0

        match (value) {
            case INTEGER32(v) =>
                integer32 = v
                tag = 0

            case INTEGER64(v) =>
                integer64 = v
                tag = 1

            case DOUBLE(v) =>
                double = v
                tag = 2

            case BOOLEAN(v) =>
                bool = v
                tag = 3

            case STRING(v) =>
                string = unsafe { LibC.mallocCString(v).getChars() }
                tag = 4

            case ARRAYBUFFER(v) =>
                tag = 5
                let bArray = v
                let bArrSize = bArray.size
                unsafe {
                    let bArr: CPointer<UInt8> = cjArr2CArr<UInt8, UInt8>(
                        bArray,
                        {
                            byte: UInt8 => byte
                        }
                    )
                    arrayBuffer = CArrUI8(bArr, bArrSize)
                }

            case PIXELMAP(v) =>
                let pixelMap: PixelMap = v
                pixelMapId = pixelMap.getID()
                tag = 6

            case NULL => tag = 7

            case UNDEFINED => tag = 8
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    func toValueType(): ValueType {
        match (this.tag) {
            case 0 => return ValueType.INTEGER32(this.integer32)
            case 1 => return ValueType.INTEGER64(this.integer64)
            case 2 => return ValueType.DOUBLE(this.double)
            case 3 => return ValueType.BOOLEAN(this.bool)
            case 4 => return ValueType.STRING(CString(this.string).toString())
            case 5 =>
                let ptr = this.arrayBuffer.head
                let size = this.arrayBuffer.size
                let result = unsafe { Array<UInt8>(size, {i => ptr.read(i)}) }
                return ValueType.ARRAYBUFFER(result)
            case 6 => return ValueType.PIXELMAP(PixelMap(this.pixelMapId))
            case 7 => return ValueType.NULL
            case 8 => return ValueType.UNDEFINED

            case _ => return ValueType.INTEGER32(-1)
        }
    }

    func free() {
        if (this.tag == 4) {
            if (!string.isNull()) {
                unsafe { LibC.free<UInt8>(string) }
            }
            return
        }
        if (this.tag == 5) {
            unsafe { LibC.free<UInt8>(arrayBuffer.head) }
            return
        }
    }
}
