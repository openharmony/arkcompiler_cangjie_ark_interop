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

package ohos.distributed_kv_store

import ohos.labels.*
import std.collection.*
import ohos.base.*
import ohos.ffi.*

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
]
public class KVStoreResultSet <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * @brief  getCount(): number
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public func getCount(): Int32 {
        return unsafe { FfiOHOSDistributedKVStoreKVStoreResultSetGetCount(this.getID()) }
    }

    /**
     * @brief  getPosition(): number
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public func getPosition(): Int32 {
        return unsafe { FfiOHOSDistributedKVStoreKVStoreResultSetGetPosition(this.getID()) }
    }

    /**
     * @brief  moveToFirst(): boolean
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public func moveToFirst(): Bool {
        return unsafe { FfiOHOSDistributedKVStoreKVStoreResultSetMoveToFirst(this.getID()) }
    }

    /**
     * @brief  moveToLast(): boolean
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public func moveToLast(): Bool {
        return unsafe { FfiOHOSDistributedKVStoreKVStoreResultSetMoveToLast(this.getID()) }
    }

    /**
     * @brief  moveToNext(): boolean
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public func moveToNext(): Bool {
        return unsafe { FfiOHOSDistributedKVStoreKVStoreResultSetMoveToNext(this.getID()) }
    }

    /**
     * @brief  moveToPrevious(): boolean
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public func moveToPrevious(): Bool {
        return unsafe { FfiOHOSDistributedKVStoreKVStoreResultSetMoveToPrevious(this.getID()) }
    }

    /**
     * @brief  move(offset: number): boolean
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public func move(offset: Int32): Bool {
        return unsafe { FfiOHOSDistributedKVStoreKVStoreResultSetMove(this.getID(), offset) }
    }

    /**
     * @brief  moveToPosition(position: number): boolean
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public func moveToPosition(position: Int32): Bool {
        return unsafe { FfiOHOSDistributedKVStoreKVStoreResultSetMoveToPosition(this.getID(), position) }
    }

    /**
     * @brief  isFirst(): boolean
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public func isFirst(): Bool {
        return unsafe { FfiOHOSDistributedKVStoreKVStoreResultSetIsFirst(this.getID()) }
    }

    /**
     * @brief  isLast(): boolean
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public func isLast(): Bool {
        return unsafe { FfiOHOSDistributedKVStoreKVStoreResultSetIsLast(this.getID()) }
    }

    /**
     * @brief  isBeforeFirst(): boolean
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public func isBeforeFirst(): Bool {
        return unsafe { FfiOHOSDistributedKVStoreKVStoreResultSetIsBeforeFirst(this.getID()) }
    }

    /**
     * @brief  isAfterLast(): boolean
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public func isAfterLast(): Bool {
        return unsafe { FfiOHOSDistributedKVStoreKVStoreResultSetIsAfterLast(this.getID()) }
    }

    /**
     * @brief  getEntry(): Entry
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public func getEntry(): Entry {
        return unsafe { FfiOHOSDistributedKVStoreKVStoreResultSetGetEntry(this.getID()).toEntry() }
    }
}
