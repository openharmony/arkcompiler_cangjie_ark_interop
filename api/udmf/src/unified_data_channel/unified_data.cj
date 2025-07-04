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
    func FfiUDMFUnifiedDataConstructor(): Int64

    func FfiUDMFUnifiedDataConstructorWithRecord(unifiedRecordId: Int64): Int64

    func FfiUDMFUnifiedDataAddRecord(unifiedDataId: Int64, unifiedRecordId: Int64): Unit

    func FfiUDMFUnifiedDataGetRecords(unifiedDataId: Int64): CArrUnifiedRecord

    func FfiUDMFUnifiedDataHasType(unifiedDataId: Int64, ctype: CString): Bool

    func FfiUDMFUnifiedDataGetTypes(unifiedDataId: Int64): CArrString
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
]
public class UnifiedData <: RemoteDataLite {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    public init() {
        super(unsafe { FfiUDMFUnifiedDataConstructor() })
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    public init(record: UnifiedRecord) {
        super(unsafe {
            let recordID = record.getID()
            let id = FfiUDMFUnifiedDataConstructorWithRecord(recordID)
            id
        })
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
    public func addRecord(record: UnifiedRecord): Unit {
        unsafe {
            FfiUDMFUnifiedDataAddRecord(getID(), record.getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    public func getRecords(): Array<UnifiedRecord> {
        unsafe {
            let cArrUnifiedRecord = FfiUDMFUnifiedDataGetRecords(getID())
            let urecordArr: Array<UnifiedRecord> = cArrUnifiedRecord.toArray()
            cArrUnifiedRecord.free()
            return urecordArr
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    public func hasType(utype: String): Bool {
        unsafe {
            let ctype = LibC.mallocCString(utype)
            let res = FfiUDMFUnifiedDataHasType(getID(), ctype)
            LibC.free(ctype)
            return res
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    public func getTypes(): Array<String> {
        unsafe {
            let types = FfiUDMFUnifiedDataGetTypes(getID())
            let typesArr: Array<String> = types.toStringArray()
            types.free()
            return typesArr
        }
    }
}

@C
struct CArrUnifiedRecord {
    var head: CPointer<Int64>
    var size: Int64
    init(head: CPointer<Int64>, size: Int64) {
        this.head = head
        this.size = size
    }

    func toArray(): Array<UnifiedRecord> {
        if (head.isNull()) {
            return Array<UnifiedRecord>()
        }
        unsafe {
            return Array<UnifiedRecord>(size, {i => UnifiedRecord(head.read(i))})
        }
    }

    func free(): Unit {
        if (head.isNull()) {
            return
        }
        unsafe {
            LibC.free<Int64>(head)
        }
    }
}
