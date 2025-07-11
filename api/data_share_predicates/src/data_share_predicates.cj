/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

/**
 * This module provides data share services based on the ExtensionAbility.
 *
 * @namespace dataSharePredicates
 * @syscap SystemCapability.DistributedDataManager.DataShare.Core
 * @StageModelOnly
 * @crossplatform
 */
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

package ohos.data_share_predicates

import ohos.values_bucket.*
import ohos.labels.*
import ohos.ffi.*
import ohos.base.*

/**
 * Create an DataSharePredicates.
 *
 * @returns { Int64 } Returns Id.
 * @throws { BusinessException } -1 - Instance invalid.
 */
private func createDataSharePredicates(): Int64 {
    let id = unsafe { FfiOHOSDataSharePredicatesCreateDataSharePredicates() }
    if (id < 0) {
        LOG.error("DataSharePredicates init failed: ${getErrorMsg(MEMORY_ERROR)}")
        throw IllegalMemoryException("Out of memory.")
    }
    return id
}

/**
 * Manages relational database configurations.
 *
 * @syscap SystemCapability.DistributedDataManager.DataShare.Core
 * @StageModelOnly
 * @crossplatform
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.DataShare.Core"
]
public class DataSharePredicates <: RemoteDataLite {
    /**
     * Public constructor.
     *
     * @syscap SystemCapability.DistributedDataManager.DataShare.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.DataShare.Core"
    ]
    public init() {
        super(createDataSharePredicates())
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Configure the DataSharePredicates to match the field whose data type is ValueType and value is equal
     * to a specified value.
     * This method is similar to = of the SQL statement.
     *
     * @param { String } field - Indicates the column name in the database table.
     * @param { ValueType } value - Indicates the value to match with the DataSharePredicates.
     * @returns { DataSharePredicates } Returns the DataSharePredicates that match the specified field.
     * @throws { BusinessException } 401 - Parameter error.
     * @throws { BusinessException } -1 - Instance invalid.
     * @syscap SystemCapability.DistributedDataManager.DataShare.Core
     * @StageModelOnly
     * @crossplatform
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.DataShare.Core"
    ]
    public func equalTo(field: String, value: ValueType): DataSharePredicates {
        if (field.isEmpty()) {
            LOG.error("DataSharePredicates equalTo failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
            throw BusinessException(ERR_PARAMETER_ERROR,
                "DataSharePredicates equalTo failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
        unsafe {
            try (
                cFieldR = LibC.mallocCString(field).asResource(),
                cValue = CValueType(value).asResource()
            ) {
                let code = FfiOHOSDataSharePredicatesEqualTo(getID(), cFieldR.value, cValue.value)
                throwIfNotSuccess(code)
            }
        }
        return this
    }

    /**
     * Adds an and condition to the DataSharePredicates.
     * This method is similar to and of the SQL statement.
     *
     * @returns { DataSharePredicates } Returns the DataSharePredicates with the and condition.
     * @throws { BusinessException } 401 - Parameter error.
     * @throws { BusinessException } -1 - Instance invalid.
     * @syscap SystemCapability.DistributedDataManager.DataShare.Core
     * @StageModelOnly
     * @crossplatform
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.DataShare.Core"
    ]
    public func and(): DataSharePredicates {
        unsafe {
            let code = FfiOHOSDataSharePredicatesAnd(getID())
            throwIfNotSuccess(code)
        }
        return this
    }

    /**
     * Restricts the ascending order of the return list. When there are several orders,
     * the one close to the head has the highest priority.
     *
     * @param { String } field - Indicates the column name for sorting the return list.
     * @returns { DataSharePredicates } Returns the SQL query statement with the specified DataSharePredicates.
     * @throws { BusinessException } 401 - Parameter error.
     * @throws { BusinessException } -1 - Instance invalid.
     * @syscap SystemCapability.DistributedDataManager.DataShare.Core
     * @StageModelOnly
     * @crossplatform
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.DataShare.Core"
    ]
    public func orderByAsc(field: String): DataSharePredicates {
        if (field.isEmpty()) {
            LOG.error("DataSharePredicates orderByAsc failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
            throw BusinessException(ERR_PARAMETER_ERROR,
                "DataSharePredicates orderByAsc failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
        unsafe {
            try (cFeild = LibC.mallocCString(field).asResource()) {
                let code = FfiOHOSDataSharePredicatesOrderByAsc(getID(), cFeild.value)
                throwIfNotSuccess(code)
            }
        }
        return this
    }
    /**
     * Restricts the descending order of the return list. When there are several orders,
     * the one close to the head has the highest priority.
     *
     * @param { string } field - Indicates the column name for sorting the return list.
     * @returns { DataSharePredicates } Returns the SQL query statement with the specified DataSharePredicates.
     * @throws { BusinessException } 401 - Parameter error.
     * @throws { BusinessException } -1 - Instance invalid.
     * @syscap SystemCapability.DistributedDataManager.DataShare.Core
     * @StageModelOnly
     * @crossplatform
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.DataShare.Core"
    ]
    public func orderByDesc(field: String): DataSharePredicates {
        if (field.isEmpty()) {
            LOG.error("DataSharePredicates orderByDesc failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
            throw BusinessException(ERR_PARAMETER_ERROR,
                "DataSharePredicates orderByDesc failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
        unsafe {
            try (cFieldR = LibC.mallocCString(field).asResource()) {
                let code = FfiOHOSDataSharePredicatesOrderByDesc(getID(), cFieldR.value)
                throwIfNotSuccess(code)
            }
        }
        return this
    }

    /**
     * Construct a query object to specify the number of results and the starting position.
     *
     * @param { number } total - Represents the specified number of results.
     * @param { number } offset - Indicates the starting position.
     * @returns { DataSharePredicates } Returns the query object.
     * @throws { BusinessException } 401 - Parameter error.
     * @throws { BusinessException } -1 - Instance invalid.
     * @syscap SystemCapability.DistributedDataManager.DataShare.Core
     * @StageModelOnly
     * @crossplatform
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.DataShare.Core"
    ]
    public func limit(total: Int32, offset: Int32): DataSharePredicates {
        if (total < 0 || offset < 0) {
            LOG.error("DataSharePredicates limit failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
            throw BusinessException(ERR_PARAMETER_ERROR,
                "DataSharePredicates limit failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
        unsafe {
            let code = FfiOHOSDataSharePredicatesLimit(getID(), total, offset)
            throwIfNotSuccess(code)
        }
        return this
    }

    /**
     * Configure {@code DataSharePredicates} to match the specified field whose data type is ValueType array and values
     * are within a given range.
     *
     * @param { string } field - Indicates the column name in the database table.
     * @param { Array<ValueType> } value - Indicates the values to match with DataSharePredicates.
     * @returns { DataSharePredicates } Returns DataSharePredicates that matches the specified field.
     * @throws { BusinessException } 401 - Parameter error.
     * @throws { BusinessException } -1 - Instance invalid.
     * @syscap SystemCapability.DistributedDataManager.DataShare.Core
     * @StageModelOnly
     * @crossplatform
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.DataShare.Core"
    ]
    public func `in`(field: String, values: Array<ValueType>): DataSharePredicates {
        if (field.isEmpty() || values.isEmpty()) {
            LOG.error("DataSharePredicates in failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
            throw BusinessException(ERR_PARAMETER_ERROR,
                "DataSharePredicates in failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }

        // The ValueType types in values ​​must all be consistent
        let tag = values[0].get()
        for (idx in 1..values.size) {
            if (values[idx].get() != tag) {
                throw BusinessException(ERR_PARAMETER_ERROR,
                    "DataSharePredicates in failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
            }
        }

        unsafe {
            let valuesSize = values.size
            let cValuesArray: CPointer<CValueType> = safeMalloc<CValueType>(count: valuesSize)
            try (cFieldR = LibC.mallocCString(field).asResource()) {
                for (i in 0..valuesSize) {
                    let value = CValueType(values[i])
                    cValuesArray.write(i, value)
                }
                let code = FfiOHOSDataSharePredicatesIn(getID(), cFieldR.value, cValuesArray, valuesSize)
                throwIfNotSuccess(code)
            } finally {
                if (!cValuesArray.isNull()) {
                    for (i in 0..valuesSize) {
                        cValuesArray.read(i).free()
                    }
                    LibC.free<CValueType>(cValuesArray)
                }
            }
        }
        return this
    }

    protected func or(): DataSharePredicates {
        var code: Int32 = 0
        unsafe {
            code = FfiOHOSDataSharePredicatesOr(getID())
        }
        throwIfNotSuccess(code)
        return this
    }

    protected func beginWrap(): DataSharePredicates {
        var code: Int32 = 0
        unsafe {
            code = FfiOHOSDataSharePredicatesBeginWrap(getID())
        }
        throwIfNotSuccess(code)
        return this
    }

    protected func endWrap(): DataSharePredicates {
        var code: Int32 = 0
        unsafe {
            code = FfiOHOSDataSharePredicatesEndWrap(getID())
        }
        throwIfNotSuccess(code)
        return this
    }
}
