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

package ohos.data.distributed_kv_store

import ohos.labels.*
import ohos.ffi.*

/**
 * Represents a database query using predicates.
 * <p>This class provides a constructor used to create a {@code Query} instance, which is used to query data
 * matching specified conditions in the database.
 * <p>This class also provides methods to add predicates to the {@code Query} instance.
 *
 * @relation class Query
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
]
public class Query <: RemoteDataLite {
    /**
     * A constructor used to create a Query instance.
     *
     * @relation constructor()
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public init() {
        super(unsafe { FfiOHOSDistributedKVStoreQueryConstructor() })
    }

    ~init() {
        releaseFFIData(myDataId)
    }
}
