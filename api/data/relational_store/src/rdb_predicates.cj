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

package ohos.data.relational_store

import ohos.labels.*
import ohos.ffi.*
import ohos.base.*

/**
 * Manages relational database configurations.
 *
 * @relation class RdbPredicates
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public class RdbPredicates <: RemoteDataLite {
    /**
     * A parameterized constructor used to create a RdbPredicates instance.
     *
     * @relation constructor(name: string);
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public init(name: String) {
        super(createRdbPredicates(name))
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Specifies all remote devices which connect to local device when syncing distributed database.
     * When query database, this function should not be called.
     *
     * @relation inAllDevices(): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func inAllDevices(): RdbPredicates {
        unsafe {
            let code = FfiOHOSRelationalStoreInAllDevices(getID())
            throwIfNotSuccess(code, "RdbPredicates", "inAllDevices")
        }
        return this
    }

    /**
     * Adds a left parenthesis to the RdbPredicates.
     * This method is similar to ( of the SQL statement and needs to be used together with endWrap().
     *
     * @relation beginWrap(): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func beginWrap(): RdbPredicates {
        unsafe {
            let code = FfiOHOSRelationalStoreBeginWrap(getID())
            throwIfNotSuccess(code, "RdbPredicates", "beginWrap")
        }
        return this
    }

    /**
     * Adds a right parenthesis to the RdbPredicates.
     * This method is similar to ) of the SQL statement and needs to be used together with beginWrap().
     *
     * @relation endWrap(): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func endWrap(): RdbPredicates {
        unsafe {
            let code = FfiOHOSRelationalStoreEndWrap(getID())
            throwIfNotSuccess(code, "RdbPredicates", "endWrap")
        }
        return this
    }

    /**
     * Adds an or condition to the RdbPredicates.
     * This method is similar to or of the SQL statement.
     *
     * @relation or(): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func or(): RdbPredicates {
        unsafe {
            let code = FfiOHOSRelationalStoreOr(getID())
            throwIfNotSuccess(code, "RdbPredicates", "or")
        }
        return this
    }

    /**
     * Adds an and condition to the RdbPredicates.
     * This method is similar to and of the SQL statement.
     *
     * @relation and(): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func and(): RdbPredicates {
        unsafe {
            let code = FfiOHOSRelationalStoreAnd(getID())
            throwIfNotSuccess(code, "RdbPredicates", "and")
        }
        return this
    }

    /**
     * Configure the RdbPredicates to match the field whose data type is string and value
     * contains a specified value.
     * This method is similar to contains of the SQL statement.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @relation contains(field: string, value: string): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func contains(field: String, value: String): RdbPredicates {
        unsafe {
            if (field.isEmpty()) {
                RELATIONAL_STORE_LOG.error("RdbPredicates contains failed: ${paramError("field", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbPredicates contains failed: ${paramError("field", "not empty string")}")
            }
            let (cfield, cvalue) = createFieldValue(field, value, "contains")
            let code = FfiOHOSRelationalStoreContains(getID(), cfield, cvalue)
            LibC.free(cfield)
            LibC.free(cvalue)
            throwIfNotSuccess(code, "RdbPredicates", "contains")
            return this
        }
    }

    /**
     * Configure the RdbPredicates to match the field whose data type is string and value starts
     * with a specified string.
     * This method is similar to value% of the SQL statement.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @relation beginsWith(field: string, value: string): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func beginsWith(field: String, value: String): RdbPredicates {
        unsafe {
            if (field.isEmpty()) {
                RELATIONAL_STORE_LOG.error("RdbPredicates beginsWith failed: ${paramError("field", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbPredicates beginsWith failed: ${paramError("field", "not empty string")}")
            }
            let (cfield, cvalue) = createFieldValue(field, value, "beginsWith")
            let code = FfiOHOSRelationalStoreBeginsWith(getID(), cfield, cvalue)
            LibC.free(cfield)
            LibC.free(cvalue)
            throwIfNotSuccess(code, "RdbPredicates", "beginsWith")
            return this
        }
    }
    /**
     * Configure the RdbPredicates to match the field whose data type is string and value
     * ends with a specified string.
     * This method is similar to %value of the SQL statement.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @relation endsWith(field: string, value: string): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func endsWith(field: String, value: String): RdbPredicates {
        unsafe {
            if (field.isEmpty()) {
                RELATIONAL_STORE_LOG.error("RdbPredicates endsWith failed: ${paramError("field", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbPredicates endsWith failed: ${paramError("field", "not empty string")}")
            }
            let (cfield, cvalue) = createFieldValue(field, value, "endsWith")
            let code = FfiOHOSRelationalStoreEndsWith(getID(), cfield, cvalue)
            LibC.free(cfield)
            LibC.free(cvalue)
            throwIfNotSuccess(code, "RdbPredicates", "endsWith")
            return this
        }
    }

    /**
     * Configure the RdbPredicates to match the fields whose value is null.
     * This method is similar to is null of the SQL statement.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @relation isNull(field: string): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func isNull(field: String): RdbPredicates {
        if (field.isEmpty()) {
            RELATIONAL_STORE_LOG.error("RdbPredicates isNull failed: ${paramError("field", "not empty string")}")
            throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                "RdbPredicates isNull failed: ${paramError("field", "not empty string")}")
        }
        let cfield = unsafe { LibC.mallocCString(field) }
        var code: Int32
        unsafe {
            code = FfiOHOSRelationalStoreIsNull(getID(), cfield)
        }
        unsafe { LibC.free(cfield) }
        throwIfNotSuccess(code, "RdbPredicates", "isNull")
        return this
    }

    /**
     * Configure the RdbPredicates to match the specified fields whose value is not null.
     * This method is similar to is not null of the SQL statement.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @relation isNotNull(field: string): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func isNotNull(field: String): RdbPredicates {
        if (field.isEmpty()) {
            RELATIONAL_STORE_LOG.error("RdbPredicates isNotNull failed: ${paramError("field", "not empty string")}")
            throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                "RdbPredicates isNotNull failed: ${paramError("field", "not empty string")}")
        }
        let cfield = unsafe { LibC.mallocCString(field) }
        var code: Int32
        unsafe {
            code = FfiOHOSRelationalStoreIsNotNull(getID(), cfield)
        }
        unsafe { LibC.free(cfield) }
        throwIfNotSuccess(code, "RdbPredicates", "isNotNull")
        return this
    }

    /**
     * Configure the RdbPredicates to match the fields whose data type is string and value is
     * similar to a specified string.
     * This method is similar to like of the SQL statement.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @relation like(field: string, value: string): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func like(field: String, value: String): RdbPredicates {
        unsafe {
            if (field.isEmpty()) {
                RELATIONAL_STORE_LOG.error("RdbPredicates like failed: ${paramError("field", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbPredicates like failed: ${paramError("field", "not empty string")}")
            }
            let (cfield, cvalue) = createFieldValue(field, value, "like")
            let code = FfiOHOSRelationalStoreLike(getID(), cfield, cvalue)
            LibC.free(cfield)
            LibC.free(cvalue)
            throwIfNotSuccess(code, "RdbPredicates", "like")
            return this
        }
    }

    /**
     * Configure RdbPredicates to match the specified field whose data type is string and the value contains
     * a wildcard.
     * Different from like, the input parameters of this method are case-sensitive.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @relation glob(field: string, value: string): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func glob(field: String, value: String): RdbPredicates {
        unsafe {
            if (field.isEmpty()) {
                RELATIONAL_STORE_LOG.error("RdbPredicates glob failed: ${paramError("field", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbPredicates glob failed: ${paramError("field", "not empty string")}")
            }
            let (cfield, cvalue) = createFieldValue(field, value, "glob")
            let code = FfiOHOSRelationalStoreGlob(getID(), cfield, cvalue)
            LibC.free(cfield)
            LibC.free(cvalue)
            throwIfNotSuccess(code, "RdbPredicates", "glob")
            return this
        }
    }

    /**
     * Restricts the ascending order of the return list. When there are several orders,
     * the one close to the head has the highest priority.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @relation orderByAsc(field: string): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func orderByAsc(field: String): RdbPredicates {
        if (field.isEmpty()) {
            RELATIONAL_STORE_LOG.error("RdbPredicates orderByAsc failed: ${paramError("field", "not empty string")}")
            throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                "RdbPredicates orderByAsc failed: ${paramError("field", "not empty string")}")
        }
        let cfield = unsafe { LibC.mallocCString(field) }
        var code: Int32
        unsafe {
            code = FfiOHOSRelationalStoreOrderByAsc(getID(), cfield)
        }
        unsafe { LibC.free(cfield) }
        throwIfNotSuccess(code, "RdbPredicates", "orderByAsc")
        return this
    }

    /**
     * Restricts the descending order of the return list. When there are several orders,
     * the one close to the head has the highest priority.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @relation orderByDesc(field: string): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func orderByDesc(field: String): RdbPredicates {
        if (field.isEmpty()) {
            RELATIONAL_STORE_LOG.error("RdbPredicates orderByDesc failed: ${paramError("field", "not empty string")}")
            throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                "RdbPredicates orderByDesc failed: ${paramError("field", "not empty string")}")
        }
        let cfield = unsafe { LibC.mallocCString(field) }
        var code: Int32
        unsafe {
            code = FfiOHOSRelationalStoreOrderByDesc(getID(), cfield)
        }
        unsafe { LibC.free(cfield) }
        throwIfNotSuccess(code, "RdbPredicates", "orderByDesc")
        return this
    }

    /**
     * Restricts each row of the query result to be unique.
     *
     * @relation distinct(): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func distinct(): RdbPredicates {
        unsafe {
            let code = FfiOHOSRelationalStoreDistinct(getID())
            throwIfNotSuccess(code, "RdbPredicates", "distinct")
        }
        return this
    }

    /**
     * Restricts the max number of return records.
     *
     * @returns { RdbPredicates } - The SQL query statement with the specified {@link RdbPredicates}.
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @relation limitAs(value: number): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func limitAs(value: Int32): RdbPredicates {
        unsafe {
            let code = FfiOHOSRelationalStoreLimitAs(getID(), value)
            throwIfNotSuccess(code, "RdbPredicates", "limitAs")
        }
        return this
    }

    /**
     * Configure RdbPredicates to specify the start position of the returned result.
     * Use this method together with limit(number).
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @relation offsetAs(rowOffset: number): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func offsetAs(rowOffset: Int32): RdbPredicates {
        unsafe {
            let code = FfiOHOSRelationalStoreOffsetAs(getID(), rowOffset)
            throwIfNotSuccess(code, "RdbPredicates", "offsetAs")
        }
        return this
    }

    /**
     * Configure RdbPredicates to group query results by specified columns.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @relation groupBy(fields: Array<string>): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func groupBy(fields: Array<String>): RdbPredicates {
        unsafe {
            let fieldsSize = fields.size
            let fieldsArray: CPointer<CString> = if (fieldsSize == 0) {
                CPointer<CString>()
            } else {
                LibC.malloc<CString>(count: fieldsSize)
            }
            throwIfOOM(fieldsSize != 0 && fieldsArray.isNull(), "RdbPredicates", "groupBy")
            for (i in 0..fieldsSize) {
                let field = mallocCString(fields[i])
                throwIfOOM(field.isNone(), "RdbPredicates", "groupBy") {
                    freeCStringArray(fieldsArray, i)
                    LibC.free<CString>(fieldsArray)
                }
                fieldsArray.write(i, field.getOrThrow())
            }
            let code = FfiOHOSRelationalStoreGroupBy(getID(), fieldsArray, fieldsSize)
            for (i in 0..fieldsSize) {
                LibC.free(fieldsArray.read(i))
            }
            LibC.free<CString>(fieldsArray)
            throwIfNotSuccess(code, "RdbPredicates", "groupBy")
        }
        return this
    }

    /**
     * Restricts the value of the field to be smaller than or equal to the specified value.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @relation lessThanOrEqualTo(field: string, value: ValueType): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func lessThanOrEqualTo(field: String, value: ValueType): RdbPredicates {
        unsafe {
            if (field.isEmpty()) {
                RELATIONAL_STORE_LOG.error(
                    "RdbPredicates lessThanOrEqualTo failed: ${paramError("field", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbPredicates lessThanOrEqualTo failed: ${paramError("field", "not empty string")}")
            }
            let cfield = LibC.mallocCString(field)
            let cvalue = RetValueType.create(value)
            throwIfOOM(cvalue.isNone(), "RdbPredicates", "lessThanOrEqualTo") {
                LibC.free(cfield)
            }
            let code = FfiOHOSRelationalStoreLessThanOrEqualTo(getID(), cfield, cvalue.getOrThrow())
            LibC.free(cfield)
            cvalue.getOrThrow().free()
            throwIfNotSuccess(code, "RdbPredicates", "lessThanOrEqualTo")
        }
        return this
    }

    /**
     * Configure the RdbPredicates to match the field whose data type is ValueType and value is equal
     * to a specified value.
     * This method is similar to = of the SQL statement.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @relation equalTo(field: string, value: ValueType): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func equalTo(field: String, value: ValueType): RdbPredicates {
        unsafe {
            if (field.isEmpty()) {
                RELATIONAL_STORE_LOG.error("RdbPredicates equalTo failed: ${paramError("field", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbPredicates equalTo failed: ${paramError("field", "not empty string")}")
            }
            let cfield = LibC.mallocCString(field)
            let cvalue = RetValueType.create(value)
            throwIfOOM(cvalue.isNone(), "RdbPredicates", "equalTo") {
                LibC.free(cfield)
            }
            let code = FfiOHOSRelationalStoreEqualTo(getID(), cfield, cvalue.getOrThrow())
            LibC.free(cfield)
            cvalue.getOrThrow().free()
            throwIfNotSuccess(code, "RdbPredicates", "equalTo")
        }
        return this
    }

    /**
     * Restricts the value of the field to be greater than or equal to the specified value.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @relation greaterThanOrEqualTo(field: string, value: ValueType): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func greaterThanOrEqualTo(field: String, value: ValueType): RdbPredicates {
        unsafe {
            if (field.isEmpty()) {
                RELATIONAL_STORE_LOG.error(
                    "RdbPredicates greaterThanOrEqualTo failed: ${paramError("field", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbPredicates greaterThanOrEqualTo failed: ${paramError("field", "not empty string")}")
            }
            let cfield = LibC.mallocCString(field)
            let cvalue = RetValueType.create(value)
            throwIfOOM(cvalue.isNone(), "RdbPredicates", "greaterThanOrEqualTo") {
                LibC.free(cfield)
            }
            let code = FfiOHOSRelationalStoreGreaterThanOrEqualTo(getID(), cfield, cvalue.getOrThrow())
            LibC.free(cfield)
            cvalue.getOrThrow().free()
            throwIfNotSuccess(code, "RdbPredicates", "greaterThanOrEqualTo")
        }
        return this
    }

    /**
     * Restricts the value of the field to be greater than the specified value.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @relation greaterThan(field: string, value: ValueType): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func greaterThan(field: String, value: ValueType): RdbPredicates {
        unsafe {
            if (field.isEmpty()) {
                RELATIONAL_STORE_LOG.error(
                    "RdbPredicates greaterThan failed: ${paramError("field", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbPredicates greaterThan failed: ${paramError("field", "not empty string")}")
            }
            let cfield = LibC.mallocCString(field)
            let cvalue = RetValueType.create(value)
            throwIfOOM(cvalue.isNone(), "RdbPredicates", "greaterThan") {
                LibC.free(cfield)
            }
            let code = FfiOHOSRelationalStoreGreaterThan(getID(), cfield, cvalue.getOrThrow())
            LibC.free(cfield)
            cvalue.getOrThrow().free()
            throwIfNotSuccess(code, "RdbPredicates", "greaterThan")
        }
        return this
    }

    /**
     * Restricts the value of the field to be smaller than the specified value.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @relation lessThan(field: string, value: ValueType): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func lessThan(field: String, value: ValueType): RdbPredicates {
        unsafe {
            if (field.isEmpty()) {
                RELATIONAL_STORE_LOG.error("RdbPredicates lessThan failed: ${paramError("field", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbPredicates lessThan failed: ${paramError("field", "not empty string")}")
            }
            let cfield = LibC.mallocCString(field)
            let cvalue = RetValueType.create(value)
            throwIfOOM(cvalue.isNone(), "RdbPredicates", "lessThan") {
                LibC.free(cfield)
            }
            let code = FfiOHOSRelationalStoreLessThan(getID(), cfield, cvalue.getOrThrow())
            LibC.free(cfield)
            cvalue.getOrThrow().free()
            throwIfNotSuccess(code, "RdbPredicates", "lessThan")
        }
        return this
    }

    /**
     * Configure the RdbPredicates to match the field whose data type is ValueType and value is not equal to
     * a specified value.
     * This method is similar to != of the SQL statement.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @relation notEqualTo(field: string, value: ValueType): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func notEqualTo(field: String, value: ValueType): RdbPredicates {
        unsafe {
            if (field.isEmpty()) {
                RELATIONAL_STORE_LOG.error(
                    "RdbPredicates notEqualTo failed: ${paramError("field", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbPredicates notEqualTo failed: ${paramError("field", "not empty string")}")
            }
            let cfield = LibC.mallocCString(field)
            let cvalue = RetValueType.create(value)
            throwIfOOM(cvalue.isNone(), "RdbPredicates", "notEqualTo") {
                LibC.free(cfield)
            }
            let code = FfiOHOSRelationalStoreNotEqualTo(getID(), cfield, cvalue.getOrThrow())
            LibC.free(cfield)
            cvalue.getOrThrow().free()
            throwIfNotSuccess(code, "RdbPredicates", "notEqualTo")
        }
        return this
    }

    /**
     * Configure RdbPredicates to match the specified field whose value is out of a given range.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @relation notBetween(field: string, low: ValueType, high: ValueType): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func notBetween(field: String, lowValue: ValueType, highValue: ValueType): RdbPredicates {
        unsafe {
            if (field.isEmpty()) {
                RELATIONAL_STORE_LOG.error(
                    "RdbPredicates notBetween failed: ${paramError("field", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbPredicates notBetween failed: ${paramError("field", "not empty string")}")
            }
            let cfield = LibC.mallocCString(field)
            let lrtv = RetValueType.create(lowValue)
            let hrtv = RetValueType.create(highValue)
            throwIfOOM(lrtv.isNone() || hrtv.isNone(), "RdbPredicates", "notBetween") {
                LibC.free(cfield)
                if (lrtv.isSome()) {
                    lrtv.getOrThrow().free()
                }
                if (hrtv.isSome()) {
                    hrtv.getOrThrow().free()
                }
            }
            let code = FfiOHOSRelationalStoreNotBetween(getID(), cfield, lrtv.getOrThrow(), hrtv.getOrThrow())
            LibC.free(cfield)
            lrtv.getOrThrow().free()
            hrtv.getOrThrow().free()
            throwIfNotSuccess(code, "RdbPredicates", "notBetween")
        }
        return this
    }

    /**
     * Configure RdbPredicates to match the specified field whose value is within a given range.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @relation between(field: string, low: ValueType, high: ValueType): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func between(field: String, lowValue: ValueType, highValue: ValueType): RdbPredicates {
        unsafe {
            if (field.isEmpty()) {
                RELATIONAL_STORE_LOG.error("RdbPredicates between failed: ${paramError("field", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbPredicates between failed: ${paramError("field", "not empty string")}")
            }
            let cfield = LibC.mallocCString(field)
            let lrtv = RetValueType.create(lowValue)
            let hrtv = RetValueType.create(highValue)
            throwIfOOM(lrtv.isNone() || hrtv.isNone(), "RdbPredicates", "between") {
                if (lrtv.isSome()) {
                    lrtv.getOrThrow().free()
                }
                if (hrtv.isSome()) {
                    hrtv.getOrThrow().free()
                }
                LibC.free(cfield)
            }
            let code = FfiOHOSRelationalStoreBetween(getID(), cfield, lrtv.getOrThrow(), hrtv.getOrThrow())
            LibC.free(cfield)
            lrtv.getOrThrow().free()
            hrtv.getOrThrow().free()
            throwIfNotSuccess(code, "RdbPredicates", "between")
        }
        return this
    }

    /**
     * Configure RdbPredicates to match the specified field whose data type is ValueType array and values
     * are within a given range.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @relation in(field: string, value: Array<ValueType>): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func `in`(field: String, values: Array<ValueType>): RdbPredicates {
        unsafe {
            if (field.isEmpty()) {
                RELATIONAL_STORE_LOG.error("RdbPredicates in failed: ${paramError("field", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbPredicates in failed: ${paramError("field", "not empty string")}")
            }
            let cfield = LibC.mallocCString(field)
            let valuesSize = values.size
            let valuesArray: CPointer<RetValueType> = if (valuesSize == 0) {
                CPointer<RetValueType>()
            } else {
                LibC.malloc<RetValueType>(count: valuesSize)
            }
            throwIfOOM(valuesSize != 0 && valuesArray.isNull(), "RdbPredicates", "in") {
                LibC.free(cfield)
            }
            for (i in 0..valuesSize) {
                let valueType = RetValueType.create(values[i])
                throwIfOOM(valueType.isNone(), "RdbPredicates", "in") {
                    freeValuesArray(valuesArray, i)
                    LibC.free<RetValueType>(valuesArray)
                    LibC.free(cfield)
                }
                valuesArray.write(i, valueType.getOrThrow())
            }
            let code = FfiOHOSRelationalStoreIn(getID(), cfield, valuesArray, valuesSize)
            for (i in 0..valuesSize) {
                valuesArray.read(i).free()
            }
            LibC.free<RetValueType>(valuesArray)
            LibC.free(cfield)
            throwIfNotSuccess(code, "RdbPredicates", "in")
        }
        return this
    }

    /**
     * Configure RdbPredicates to match the specified field whose data type is ValueType array and values
     * are out of a given range.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @relation notIn(field: string, value: Array<ValueType>): RdbPredicates
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func notIn(field: String, values: Array<ValueType>): RdbPredicates {
        unsafe {
            if (field.isEmpty()) {
                RELATIONAL_STORE_LOG.error("RdbPredicates notIn failed: ${paramError("field", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbPredicates notIn failed: ${paramError("field", "not empty string")}")
            }
            let cfield = LibC.mallocCString(field)
            let valuesSize = values.size
            let valuesArray: CPointer<RetValueType> = if (valuesSize == 0) {
                CPointer<RetValueType>()
            } else {
                LibC.malloc<RetValueType>(count: valuesSize)
            }
            throwIfOOM(valuesArray.isNull() && valuesSize != 0, "RdbPredicates", "notIn") {
                LibC.free(cfield)
            }
            for (i in 0..valuesSize) {
                let valueType = RetValueType.create(values[i])
                throwIfOOM(valueType.isNone(), "RdbPredicates", "notIn") {
                    freeValuesArray(valuesArray, i)
                    LibC.free<RetValueType>(valuesArray)
                    LibC.free(cfield)
                }
                valuesArray.write(i, valueType.getOrThrow())
            }
            let code = FfiOHOSRelationalStoreNotIn(getID(), cfield, valuesArray, valuesSize)
            for (i in 0..valuesSize) {
                valuesArray.read(i).free()
            }
            LibC.free<RetValueType>(valuesArray)
            LibC.free(cfield)
            throwIfNotSuccess(code, "RdbPredicates", "notIn")
        }
        return this
    }
}

func createRdbPredicates(name: String): Int64 {
    if (name.isEmpty()) {
        RELATIONAL_STORE_LOG.error("RdbPredicates init failed: ${paramError("name", "not empty string")}")
        throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
            "RdbPredicates init failed: ${paramError("name", "not empty string")}")
    }
    let c_tablename: CString = unsafe { LibC.mallocCString(name) }
    let id = unsafe { FfiOHOSRelationalStoreRdbPredicatesConstructor(c_tablename) }
    unsafe { LibC.free(c_tablename) }
    throwIfOOM(id < 0, "createRdbPredicates")
    return id
}
