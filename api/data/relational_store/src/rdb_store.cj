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

import ohos.ffi.*
import std.collection.*
import std.sync.*
import ohos.labels.*
import ohos.base.*

/**
 * Provides methods for managing the relational database (RDB).
 * This class provides methods for creating, querying, updating, and deleting RDBs.
 *
 * @relation interface RdbStore
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public class RdbStore <: RemoteDataLite {
    let eventCallbackMaps = HashMap<String, ArrayList<(CallbackObject, Int64)>>()
    let observers_ = ArrayList<(CallbackObject, Int64)>()
    let syncObservers_ = ArrayList<(CallbackObject, Int64)>()
    let onOffMutex = Mutex()
    var versionValue: Int32 = 0

    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Queries data in the database based on specified conditions.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException  } 14800000 - Inner error.
     * @throws { BusinessException  } 14800014 - The RdbStore or ResultSet is already closed.
     * @throws { BusinessException  } 14800015 - The database does not respond.
     * @relation query(predicates: RdbPredicates, columns?: Array<string>): Promise<ResultSet>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func query(predicates: RdbPredicates, columns: Array<String>): ResultSet {
        var errCode: Int32 = 0
        let columnsSize = columns.size
        var columnsArray: CPointer<CString> = CPointer<CString>()
        if (columnsSize > 0) {
            columnsArray = unsafe { LibC.malloc<CString>(count: columnsSize) }
            throwIfOOM(columnsArray.isNull(), "RdbStore", "query")
        }
        for (i in 0..columnsSize) {
            unsafe {
                try {
                    columnsArray.write(i, LibC.mallocCString(columns[i]))
                } catch (_: Exception) {
                    freeCStringArray(columnsArray, i)
                    LibC.free<CString>(columnsArray)
                    RELATIONAL_STORE_LOG.error("RdbStore query failed: ${getErrorMsg(MEMORY_ERROR)}")
                    throw BusinessException(getErrorCode(MEMORY_ERROR),
                        "RdbStore query failed: ${getErrorMsg(MEMORY_ERROR)}")
                }
            }
        }

        var id: Int64
        unsafe {
            id = FfiOHOSRelationalStoreQuery(getID(), predicates.getID(), columnsArray, columnsSize, inout errCode)
        }
        for (i in 0..columnsSize) {
            unsafe { LibC.free(columnsArray.read(i)) }
        }
        unsafe { LibC.free<CString>(columnsArray) }
        throwIfNotSuccess(errCode, "RdbStore", "query")
        return ResultSet(id)
    }

    /**
     * Deletes data from the database based on a specified instance object of RdbPredicates.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException  } 14800000 - Inner error.
     * @throws { BusinessException  } 14800011 - Failed to open the database because it is corrupted.
     * @throws { BusinessException  } 14800014 - The RdbStore or ResultSet is already closed.
     * @throws { BusinessException  } 14800015 - The database does not respond.
     * @throws { BusinessException  } 14800021 - SQLite: Generic error.
     * Possible causes: Insert failed or the updated data does not exist.
     * @throws { BusinessException  } 14800022 - SQLite: Callback routine requested an abort.
     * @throws { BusinessException  } 14800023 - SQLite: Access permission denied.
     * @throws { BusinessException  } 14800024 - SQLite: The database file is locked.
     * @throws { BusinessException  } 14800025 - SQLite: A table in the database is locked.
     * @throws { BusinessException  } 14800026 - SQLite: The database is out of memory.
     * @throws { BusinessException  } 14800027 - SQLite: Attempt to write a readonly database.
     * @throws { BusinessException  } 14800028 - SQLite: Some kind of disk I/O error occurred.
     * @throws { BusinessException  } 14800029 - SQLite: The database is full.
     * @throws { BusinessException  } 14800030 - SQLite: Unable to open the database file.
     * @throws { BusinessException  } 14800031 - SQLite: TEXT or BLOB exceeds size limit.
     * @throws { BusinessException  } 14800032 - SQLite: Abort due to constraint violation.
     * @throws { BusinessException  } 14800033 - SQLite: Data type mismatch.
     * @throws { BusinessException  } 14800034 - SQLite: Library used incorrectly.
     * @throws { BusinessException  } 14800047 - The WAL file size exceeds the default limit.
     * @relation delete(predicates: RdbPredicates): Promise<number>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func delete(predicates: RdbPredicates): Int64 {
        var num: Int64
        unsafe {
            var errCode: Int32 = 0
            num = FfiOHOSRelationalStoreDelete(getID(), predicates.getID(), inout errCode)
            throwIfNotSuccess(errCode, "RdbStore", "delete")
        }
        return num
    }

    /**
     * Backs up a database in a specified name.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException  } 14800000 - Inner error.
     * @throws { BusinessException  } 14800011 - Failed to open the database because it is corrupted.
     * @throws { BusinessException  } 14800014 - The RdbStore or ResultSet is already closed.
     * @throws { BusinessException  } 14800015 - The database does not respond.
     * @throws { BusinessException  } 14800021 - SQLite: Generic error.
     * Possible causes: Insert failed or the updated data does not exist.
     * @throws { BusinessException  } 14800022 - SQLite: Callback routine requested an abort.
     * @throws { BusinessException  } 14800023 - SQLite: Access permission denied.
     * @throws { BusinessException  } 14800024 - SQLite: The database file is locked.
     * @throws { BusinessException  } 14800025 - SQLite: A table in the database is locked.
     * @throws { BusinessException  } 14800026 - SQLite: The database is out of memory.
     * @throws { BusinessException  } 14800027 - SQLite: Attempt to write a readonly database.
     * @throws { BusinessException  } 14800028 - SQLite: Some kind of disk I/O error occurred.
     * @throws { BusinessException  } 14800029 - SQLite: The database is full.
     * @throws { BusinessException  } 14800030 - SQLite: Unable to open the database file.
     * @throws { BusinessException  } 14800031 - SQLite: TEXT or BLOB exceeds size limit.
     * @throws { BusinessException  } 14800032 - SQLite: Abort due to constraint violation.
     * @throws { BusinessException  } 14800033 - SQLite: Data type mismatch.
     * @throws { BusinessException  } 14800034 - SQLite: Library used incorrectly.
     * @relation backup(destName: string): Promise<void>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func backup(destName: String): Unit {
        unsafe {
            if (destName.isEmpty()) {
                RELATIONAL_STORE_LOG.error("RdbStore backup failed: ${paramError("destName", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbStore backup failed: ${paramError("destName", "not empty string")}")
            }
            let cDestName: CString = LibC.mallocCString(destName)
            let code = FfiOHOSRelationalStoreBackUp(getID(), cDestName)
            LibC.free(cDestName)
            throwIfNotSuccess(code, "RdbStore", "backup")
        }
    }

    /**
     * Restores a database from a specified database file.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException  } 14800000 - Inner error.
     * @throws { BusinessException  } 14800011 - Failed to open the database because it is corrupted.
     * @throws { BusinessException  } 14800014 - The RdbStore or ResultSet is already closed.
     * @throws { BusinessException  } 14800015 - The database does not respond.
     * @throws { BusinessException  } 14800021 - SQLite: Generic error.
     * Possible causes: Insert failed or the updated data does not exist.
     * @throws { BusinessException  } 14800022 - SQLite: Callback routine requested an abort.
     * @throws { BusinessException  } 14800023 - SQLite: Access permission denied.
     * @throws { BusinessException  } 14800024 - SQLite: The database file is locked.
     * @throws { BusinessException  } 14800025 - SQLite: A table in the database is locked.
     * @throws { BusinessException  } 14800026 - SQLite: The database is out of memory.
     * @throws { BusinessException  } 14800027 - SQLite: Attempt to write a readonly database.
     * @throws { BusinessException  } 14800028 - SQLite: Some kind of disk I/O error occurred.
     * @throws { BusinessException  } 14800029 - SQLite: The database is full.
     * @throws { BusinessException  } 14800030 - SQLite: Unable to open the database file.
     * @throws { BusinessException  } 14800031 - SQLite: TEXT or BLOB exceeds size limit.
     * @throws { BusinessException  } 14800032 - SQLite: Abort due to constraint violation.
     * @throws { BusinessException  } 14800033 - SQLite: Data type mismatch.
     * @throws { BusinessException  } 14800034 - SQLite: Library used incorrectly.
     * @relation restore(srcName: string): Promise<void>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func restore(srcName: String): Unit {
        unsafe {
            if (srcName.isEmpty()) {
                RELATIONAL_STORE_LOG.error("RdbStore restore failed: ${paramError("srcName", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbStore restore failed: ${paramError("srcName", "not empty string")}")
            }
            let cSrcName: CString = LibC.mallocCString(srcName)
            let code = FfiOHOSRelationalStoreReStore(getID(), cSrcName)
            LibC.free(cSrcName)
            throwIfNotSuccess(code, "RdbStore", "restore")
        }
    }

    /**
     * Commit the the sql you have executed.
     *
     * @throws { BusinessException  } 401 - Parameter error. The store must not be nullptr.
     * @throws { BusinessException  } 14800000 - Inner error.
     * @throws { BusinessException  } 14800011 - Failed to open the database because it is corrupted.
     * @throws { BusinessException  } 14800014 - The RdbStore or ResultSet is already closed.
     * @throws { BusinessException  } 14800015 - The database does not respond.
     * @throws { BusinessException  } 14800021 - SQLite: Generic error.
     * Possible causes: Insert failed or the updated data does not exist.
     * @throws { BusinessException  } 14800022 - SQLite: Callback routine requested an abort.
     * @throws { BusinessException  } 14800023 - SQLite: Access permission denied.
     * @throws { BusinessException  } 14800024 - SQLite: The database file is locked.
     * @throws { BusinessException  } 14800025 - SQLite: A table in the database is locked.
     * @throws { BusinessException  } 14800026 - SQLite: The database is out of memory.
     * @throws { BusinessException  } 14800027 - SQLite: Attempt to write a readonly database.
     * @throws { BusinessException  } 14800028 - SQLite: Some kind of disk I/O error occurred.
     * @throws { BusinessException  } 14800029 - SQLite: The database is full.
     * @throws { BusinessException  } 14800030 - SQLite: Unable to open the database file.
     * @throws { BusinessException  } 14800031 - SQLite: TEXT or BLOB exceeds size limit.
     * @throws { BusinessException  } 14800032 - SQLite: Abort due to constraint violation.
     * @throws { BusinessException  } 14800033 - SQLite: Data type mismatch.
     * @throws { BusinessException  } 14800034 - SQLite: Library used incorrectly.
     * @relation commit():void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func commit(): Unit {
        let code = unsafe { FfiOHOSRelationalStoreCommit(getID()) }
        throwIfNotSuccess(code, "RdbStore", "commit")
    }

    /**
     * Roll back the sql you have already executed.
     *
     * @throws { BusinessException  } 401 - Parameter error. The store must not be nullptr.
     * @throws { BusinessException  } 14800000 - Inner error.
     * @throws { BusinessException  } 14800011 - Failed to open the database because it is corrupted.
     * @throws { BusinessException  } 14800014 - The RdbStore or ResultSet is already closed.
     * @throws { BusinessException  } 14800015 - The database does not respond.
     * @throws { BusinessException  } 14800021 - SQLite: Generic error.
     * Possible causes: Insert failed or the updated data does not exist.
     * @throws { BusinessException  } 14800022 - SQLite: Callback routine requested an abort.
     * @throws { BusinessException  } 14800023 - SQLite: Access permission denied.
     * @throws { BusinessException  } 14800024 - SQLite: The database file is locked.
     * @throws { BusinessException  } 14800025 - SQLite: A table in the database is locked.
     * @throws { BusinessException  } 14800026 - SQLite: The database is out of memory.
     * @throws { BusinessException  } 14800027 - SQLite: Attempt to write a readonly database.
     * @throws { BusinessException  } 14800028 - SQLite: Some kind of disk I/O error occurred.
     * @throws { BusinessException  } 14800029 - SQLite: The database is full.
     * @throws { BusinessException  } 14800030 - SQLite: Unable to open the database file.
     * @throws { BusinessException  } 14800031 - SQLite: TEXT or BLOB exceeds size limit.
     * @throws { BusinessException  } 14800032 - SQLite: Abort due to constraint violation.
     * @throws { BusinessException  } 14800033 - SQLite: Data type mismatch.
     * @throws { BusinessException  } 14800034 - SQLite: Library used incorrectly.
     * @relation rollBack():void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func rollBack(): Unit {
        let code = unsafe { FfiOHOSRelationalStoreRollBack(getID()) }
        throwIfNotSuccess(code, "RdbStore", "rollBack")
    }

    /**
     * BeginTransaction before execute your sql.
     *
     * @throws { BusinessException  } 401 - Parameter error. The store must not be nullptr.
     * @throws { BusinessException  } 14800000 - Inner error.
     * @throws { BusinessException  } 14800011 - Failed to open the database because it is corrupted.
     * @throws { BusinessException  } 14800014 - The RdbStore or ResultSet is already closed.
     * @throws { BusinessException  } 14800015 - The database does not respond.
     * @throws { BusinessException  } 14800021 - SQLite: Generic error.
     * Possible causes: Insert failed or the updated data does not exist.
     * @throws { BusinessException  } 14800022 - SQLite: Callback routine requested an abort.
     * @throws { BusinessException  } 14800023 - SQLite: Access permission denied.
     * @throws { BusinessException  } 14800024 - SQLite: The database file is locked.
     * @throws { BusinessException  } 14800025 - SQLite: A table in the database is locked.
     * @throws { BusinessException  } 14800026 - SQLite: The database is out of memory.
     * @throws { BusinessException  } 14800027 - SQLite: Attempt to write a readonly database.
     * @throws { BusinessException  } 14800028 - SQLite: Some kind of disk I/O error occurred.
     * @throws { BusinessException  } 14800029 - SQLite: The database is full.
     * @throws { BusinessException  } 14800030 - SQLite: Unable to open the database file.
     * @throws { BusinessException  } 14800031 - SQLite: TEXT or BLOB exceeds size limit.
     * @throws { BusinessException  } 14800032 - SQLite: Abort due to constraint violation.
     * @throws { BusinessException  } 14800033 - SQLite: Data type mismatch.
     * @throws { BusinessException  } 14800034 - SQLite: Library used incorrectly.
     * @throws { BusinessException  } 14800047 - The WAL file size exceeds the default limit.
     * @relation beginTransaction():void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func beginTransaction(): Unit {
        let code = unsafe { FfiOHOSRelationalStoreBeginTransaction(getID()) }
        throwIfNotSuccess(code, "RdbStore", "beginTransaction")
    }

    /**
     * Executes a SQL statement that contains specified parameters but returns no value.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException  } 801 - Capability not supported the sql(attach,begin,commit,rollback etc.).
     * @throws { BusinessException  } 14800000 - Inner error.
     * @throws { BusinessException  } 14800011 - Failed to open the database because it is corrupted.
     * @throws { BusinessException  } 14800014 - The RdbStore or ResultSet is already closed.
     * @throws { BusinessException  } 14800015 - The database does not respond.
     * @throws { BusinessException  } 14800021 - SQLite: Generic error.
     * Possible causes: Insert failed or the updated data does not exist.
     * @throws { BusinessException  } 14800022 - SQLite: Callback routine requested an abort.
     * @throws { BusinessException  } 14800023 - SQLite: Access permission denied.
     * @throws { BusinessException  } 14800024 - SQLite: The database file is locked.
     * @throws { BusinessException  } 14800025 - SQLite: A table in the database is locked.
     * @throws { BusinessException  } 14800026 - SQLite: The database is out of memory.
     * @throws { BusinessException  } 14800027 - SQLite: Attempt to write a readonly database.
     * @throws { BusinessException  } 14800028 - SQLite: Some kind of disk I/O error occurred.
     * @throws { BusinessException  } 14800029 - SQLite: The database is full.
     * @throws { BusinessException  } 14800030 - SQLite: Unable to open the database file.
     * @throws { BusinessException  } 14800031 - SQLite: TEXT or BLOB exceeds size limit.
     * @throws { BusinessException  } 14800032 - SQLite: Abort due to constraint violation.
     * @throws { BusinessException  } 14800033 - SQLite: Data type mismatch.
     * @throws { BusinessException  } 14800034 - SQLite: Library used incorrectly.
     * @throws { BusinessException  } 14800047 - The WAL file size exceeds the default limit.
     * @relation executeSql(sql: string, callback: AsyncCallback<void>):void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func executeSql(sql: String): Unit {
        unsafe {
            if (sql.isEmpty()) {
                RELATIONAL_STORE_LOG.error("RdbStore executeSql failed: ${paramError("sql", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbStore executeSql failed: ${paramError("sql", "not empty string")}")
            }
            let cSql: CString = LibC.mallocCString(sql)
            var errCode: Int32 = 0
            FfiOHOSRelationalStoreExecuteSql(getID(), cSql, inout errCode)
            LibC.free(cSql)
            throwIfNotSuccess(errCode, "RdbStore", "beginTransaction")
        }
    }

    /**
     * Inserts a row of data into the target table.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException  } 14800000 - Inner error.
     * @throws { BusinessException  } 14800011 - Failed to open the database because it is corrupted.
     * @throws { BusinessException  } 14800014 - The RdbStore or ResultSet is already closed.
     * @throws { BusinessException  } 14800015 - The database does not respond.
     * @throws { BusinessException  } 14800021 - SQLite: Generic error.
     * Possible causes: Insert failed or the updated data does not exist.
     * @throws { BusinessException  } 14800022 - SQLite: Callback routine requested an abort.
     * @throws { BusinessException  } 14800023 - SQLite: Access permission denied.
     * @throws { BusinessException  } 14800024 - SQLite: The database file is locked.
     * @throws { BusinessException  } 14800025 - SQLite: A table in the database is locked.
     * @throws { BusinessException  } 14800026 - SQLite: The database is out of memory.
     * @throws { BusinessException  } 14800027 - SQLite: Attempt to write a readonly database.
     * @throws { BusinessException  } 14800028 - SQLite: Some kind of disk I/O error occurred.
     * @throws { BusinessException  } 14800029 - SQLite: The database is full.
     * @throws { BusinessException  } 14800030 - SQLite: Unable to open the database file.
     * @throws { BusinessException  } 14800031 - SQLite: TEXT or BLOB exceeds size limit.
     * @throws { BusinessException  } 14800032 - SQLite: Abort due to constraint violation.
     * @throws { BusinessException  } 14800033 - SQLite: Data type mismatch.
     * @throws { BusinessException  } 14800034 - SQLite: Library used incorrectly.
     * @throws { BusinessException  } 14800047 - The WAL file size exceeds the default limit.
     * @relation insert(table: string, values: ValuesBucket):Promise<number>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func insert(table: String, values: Map<String, ValueType>): Int64 {
        if (table.isEmpty()) {
            RELATIONAL_STORE_LOG.error("RdbStore insert failed: ${paramError("table", "not empty string")}")
            throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                "RdbStore insert failed: ${paramError("table", "not empty string")}")
        }
        return insert(table, values, ConflictResolution.OnConflictNone)
    }

    /**
     * Inserts a row of data into the target table.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException  } 14800000 - Inner error.
     * @throws { BusinessException  } 14800011 - Failed to open the database because it is corrupted.
     * @throws { BusinessException  } 14800014 - The RdbStore or ResultSet is already closed.
     * @throws { BusinessException  } 14800015 - The database does not respond.
     * @throws { BusinessException  } 14800021 - SQLite: Generic error.
     * Possible causes: Insert failed or the updated data does not exist.
     * @throws { BusinessException  } 14800022 - SQLite: Callback routine requested an abort.
     * @throws { BusinessException  } 14800023 - SQLite: Access permission denied.
     * @throws { BusinessException  } 14800024 - SQLite: The database file is locked.
     * @throws { BusinessException  } 14800025 - SQLite: A table in the database is locked.
     * @throws { BusinessException  } 14800026 - SQLite: The database is out of memory.
     * @throws { BusinessException  } 14800027 - SQLite: Attempt to write a readonly database.
     * @throws { BusinessException  } 14800028 - SQLite: Some kind of disk I/O error occurred.
     * @throws { BusinessException  } 14800029 - SQLite: The database is full.
     * @throws { BusinessException  } 14800030 - SQLite: Unable to open the database file.
     * @throws { BusinessException  } 14800031 - SQLite: TEXT or BLOB exceeds size limit.
     * @throws { BusinessException  } 14800032 - SQLite: Abort due to constraint violation.
     * @throws { BusinessException  } 14800033 - SQLite: Data type mismatch.
     * @throws { BusinessException  } 14800034 - SQLite: Library used incorrectly.
     * @throws { BusinessException  } 14800047 - The WAL file size exceeds the default limit.
     * @relation insert(table: string, values: ValuesBucket, conflict: ConflictResolution): Promise<number>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func insert(table: String, values: Map<String, ValueType>, conflict: ConflictResolution): Int64 {
        if (table.isEmpty()) {
            RELATIONAL_STORE_LOG.error("RdbStore insert failed: ${paramError("table", "not empty string")}")
            throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                "RdbStore insert failed: ${paramError("table", "not empty string")}")
        }
        let cTable = unsafe { LibC.mallocCString(table) }
        let cValue = ValuesBucket.create(values)
        var errCode: Int32 = 0
        throwIfOOM(cValue.isNone(), "RdbStore", "insert") {
            unsafe { LibC.free(cTable) }
        }
        let result = unsafe {
            FfiOHOSRelationalStoreInsert(getID(), cTable, cValue.getOrThrow(), conflict.getValue(), inout errCode)
        }
        unsafe {
            LibC.free(cTable)
            cValue.getOrThrow().free()
            throwIfNotSuccess(errCode, "RdbStore", "insert")
        }
        return result
    }

    /**
     * Updates data in the database based on a specified instance object of RdbPredicates.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException  } 14800000 - Inner error.
     * @throws { BusinessException  } 14800011 - Failed to open the database because it is corrupted.
     * @throws { BusinessException  } 14800014 - The RdbStore or ResultSet is already closed.
     * @throws { BusinessException  } 14800015 - The database does not respond.
     * @throws { BusinessException  } 14800021 - SQLite: Generic error.
     * Possible causes: Insert failed or the updated data does not exist.
     * @throws { BusinessException  } 14800022 - SQLite: Callback routine requested an abort.
     * @throws { BusinessException  } 14800023 - SQLite: Access permission denied.
     * @throws { BusinessException  } 14800024 - SQLite: The database file is locked.
     * @throws { BusinessException  } 14800025 - SQLite: A table in the database is locked.
     * @throws { BusinessException  } 14800026 - SQLite: The database is out of memory.
     * @throws { BusinessException  } 14800027 - SQLite: Attempt to write a readonly database.
     * @throws { BusinessException  } 14800028 - SQLite: Some kind of disk I/O error occurred.
     * @throws { BusinessException  } 14800029 - SQLite: The database is full.
     * @throws { BusinessException  } 14800030 - SQLite: Unable to open the database file.
     * @throws { BusinessException  } 14800031 - SQLite: TEXT or BLOB exceeds size limit.
     * @throws { BusinessException  } 14800032 - SQLite: Abort due to constraint violation.
     * @throws { BusinessException  } 14800033 - SQLite: Data type mismatch.
     * @throws { BusinessException  } 14800034 - SQLite: Library used incorrectly.
     * @throws { BusinessException  } 14800047 - The WAL file size exceeds the default limit.
     * @relation update(values: ValuesBucket, predicates: RdbPredicates):Promise<number>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func update(values: Map<String, ValueType>, predicates: RdbPredicates): Int64 {
        return update(values, predicates, ConflictResolution.OnConflictNone)
    }

    /**
     * Updates data in the database based on a specified instance object of RdbPredicates.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException  } 14800000 - Inner error.
     * @throws { BusinessException  } 14800011 - Failed to open the database because it is corrupted.
     * @throws { BusinessException  } 14800014 - The RdbStore or ResultSet is already closed.
     * @throws { BusinessException  } 14800015 - The database does not respond.
     * @throws { BusinessException  } 14800021 - SQLite: Generic error.
     * Possible causes: Insert failed or the updated data does not exist.
     * @throws { BusinessException  } 14800022 - SQLite: Callback routine requested an abort.
     * @throws { BusinessException  } 14800023 - SQLite: Access permission denied.
     * @throws { BusinessException  } 14800024 - SQLite: The database file is locked.
     * @throws { BusinessException  } 14800025 - SQLite: A table in the database is locked.
     * @throws { BusinessException  } 14800026 - SQLite: The database is out of memory.
     * @throws { BusinessException  } 14800027 - SQLite: Attempt to write a readonly database.
     * @throws { BusinessException  } 14800028 - SQLite: Some kind of disk I/O error occurred.
     * @throws { BusinessException  } 14800029 - SQLite: The database is full.
     * @throws { BusinessException  } 14800030 - SQLite: Unable to open the database file.
     * @throws { BusinessException  } 14800031 - SQLite: TEXT or BLOB exceeds size limit.
     * @throws { BusinessException  } 14800032 - SQLite: Abort due to constraint violation.
     * @throws { BusinessException  } 14800033 - SQLite: Data type mismatch.
     * @throws { BusinessException  } 14800034 - SQLite: Library used incorrectly.
     * @throws { BusinessException  } 14800047 - The WAL file size exceeds the default limit.
     * @relation update(values: ValuesBucket, predicates: RdbPredicates, conflict: ConflictResolution): Promise<number>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func update(values: Map<String, ValueType>, predicates: RdbPredicates, conflict: ConflictResolution): Int64 {
        let cValueBucket = ValuesBucket.create(values)
        var errCode: Int32 = 0
        throwIfOOM(cValueBucket.isNone(), "RdbStore", "update")
        let affectedRows = unsafe {
            FfiOHOSRelationalStoreUpdate(getID(), cValueBucket.getOrThrow(), predicates.getID(), conflict.getValue(),
                inout errCode)
        }
        unsafe {
            cValueBucket.getOrThrow().free()
            throwIfNotSuccess(errCode, "RdbStore", "update")
        }
        return affectedRows
    }

    /**
     * Inserts a batch of data into the target table.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException  } 14800000 - Inner error.
     * @throws { BusinessException  } 14800011 - Failed to open the database because it is corrupted.
     * @throws { BusinessException  } 14800014 - The RdbStore or ResultSet is already closed.
     * @throws { BusinessException  } 14800021 - SQLite: Generic error.
     * Possible causes: Insert failed or the updated data does not exist.
     * @throws { BusinessException  } 14800023 - SQLite: Access permission denied.
     * @throws { BusinessException  } 14800024 - SQLite: The database file is locked.
     * @throws { BusinessException  } 14800025 - SQLite: A table in the database is locked.
     * @throws { BusinessException  } 14800026 - SQLite: The database is out of memory.
     * @throws { BusinessException  } 14800027 - SQLite: Attempt to write a readonly database.
     * @throws { BusinessException  } 14800028 - SQLite: Some kind of disk I/O error occurred.
     * @throws { BusinessException  } 14800029 - SQLite: The database is full.
     * @throws { BusinessException  } 14800031 - SQLite: TEXT or BLOB exceeds size limit.
     * @throws { BusinessException  } 14800033 - SQLite: Data type mismatch.
     * @throws { BusinessException  } 14800047 - The WAL file size exceeds the default limit.
     * @relation batchInsert(table: string, values: Array<ValuesBucket>):Promise<number>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func batchInsert(table: String, values: Array<Map<String, ValueType>>): Int64 {
        unsafe {
            if (table.isEmpty()) {
                RELATIONAL_STORE_LOG.error("RdbStore batchInsert failed: ${paramError("table", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbStore batchInsert failed: ${paramError("table", "not empty string")}")
            }
            let valuesSize = values.size
            if (valuesSize == 0) {
                return 0
            }
            let valuesBucketArray: CPointer<ValuesBucket> = calloc<ValuesBucket>(count: valuesSize)
            throwIfOOM(valuesBucketArray.isNull(), "RdbStore", "batchInsert")
            for (i in 0..valuesSize) {
                let cVlaueBucket = ValuesBucket.create(values[i])
                throwIfOOM(cVlaueBucket.isNone(), "RdbStore", "batchInsert") {
                    freeValuesBucketArray(valuesBucketArray, i)
                    LibC.free(valuesBucketArray)
                }
                valuesBucketArray.write(i, cVlaueBucket.getOrThrow())
            }
            let tableNameC = mallocCString(table)
            var insertNum: Int64 = 0
            throwIfOOM(tableNameC.isNone(), "RdbStore", "batchInsert") {
                for (i in 0..valuesSize) {
                    valuesBucketArray.read(i).free()
                }
                LibC.free(valuesBucketArray)
            }
            let rtnCode = FfiOHOSRelationalStoreBatchInsert(getID(), tableNameC.getOrThrow(), valuesBucketArray,
                valuesSize, inout insertNum)
            LibC.free(tableNameC.getOrThrow())
            for (i in 0..valuesSize) {
                valuesBucketArray.read(i).free()
            }
            LibC.free(valuesBucketArray)
            throwIfNotSuccess(rtnCode, "RdbStore", "batchInsert")
            return insertNum
        }
    }

    /**
     * Queries data in the database based on SQL statement.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException  } 14800000 - Inner error.
     * @throws { BusinessException  } 14800014 - The RdbStore or ResultSet is already closed.
     * @throws { BusinessException  } 14800015 - The database does not respond.
     * @relation querySql(sql: string, bindArgs?: Array<ValueType>):Promise<ResultSet>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func querySql(sql: String, bindArgs!: Array<ValueType> = Array<ValueType>()): ResultSet {
        unsafe {
            if (sql.isEmpty()) {
                RELATIONAL_STORE_LOG.error("RdbStore querySql failed: ${paramError("sql", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbStore querySql failed: ${paramError("sql", "not empty string")}")
            }
            let size = bindArgs.size
            let cSql = LibC.mallocCString(sql)
            var errCode: Int32 = 0
            let cBindArgs = if (size != 0) {
                LibC.malloc<RetValueType>(count: size)
            } else {
                CPointer<RetValueType>()
            }
            throwIfOOM(cBindArgs.isNull() && size != 0, "RdbStore", "querySql") {
                LibC.free(cSql)
            }
            for (i in 0..size) {
                let arg = RetValueType.create(bindArgs[i])
                throwIfOOM(arg.isNone(), "RdbStore", "querySql") {
                    LibC.free(cSql)
                    freeValuesArray(cBindArgs, i)
                    LibC.free<RetValueType>(cBindArgs)
                }
                cBindArgs.write(i, arg.getOrThrow())
            }
            let id = FfiOHOSRelationalStoreQuerySql(getID(), cSql, cBindArgs, size, inout errCode)
            for (i in 0..size) {
                cBindArgs.read(i).free()
            }
            LibC.free(cBindArgs)
            LibC.free(cSql)
            throwIfNotSuccess(errCode, "RdbStore", "querySql")
            return ResultSet(id)
        }
    }

    /**
     * Executes a SQL statement that contains specified parameters but returns no value.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException  } 801 - Capability not supported the sql(attach,begin,commit,rollback etc.).
     * @throws { BusinessException  } 14800000 - Inner error.
     * @throws { BusinessException  } 14800011 - Failed to open the database because it is corrupted.
     * @throws { BusinessException  } 14800014 - The RdbStore or ResultSet is already closed.
     * @throws { BusinessException  } 14800015 - The database does not respond.
     * @throws { BusinessException  } 14800021 - SQLite: Generic error.
     * Possible causes: Insert failed or the updated data does not exist.
     * @throws { BusinessException  } 14800022 - SQLite: Callback routine requested an abort.
     * @throws { BusinessException  } 14800023 - SQLite: Access permission denied.
     * @throws { BusinessException  } 14800024 - SQLite: The database file is locked.
     * @throws { BusinessException  } 14800025 - SQLite: A table in the database is locked.
     * @throws { BusinessException  } 14800026 - SQLite: The database is out of memory.
     * @throws { BusinessException  } 14800027 - SQLite: Attempt to write a readonly database.
     * @throws { BusinessException  } 14800028 - SQLite: Some kind of disk I/O error occurred.
     * @throws { BusinessException  } 14800029 - SQLite: The database is full.
     * @throws { BusinessException  } 14800030 - SQLite: Unable to open the database file.
     * @throws { BusinessException  } 14800031 - SQLite: TEXT or BLOB exceeds size limit.
     * @throws { BusinessException  } 14800032 - SQLite: Abort due to constraint violation.
     * @throws { BusinessException  } 14800033 - SQLite: Data type mismatch.
     * @throws { BusinessException  } 14800034 - SQLite: Library used incorrectly.
     * @throws { BusinessException  } 14800047 - The WAL file size exceeds the default limit.
     * @relation executeSql(sql: string, bindArgs?: Array<ValueType>): Promise<void>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func executeSql(sql: String, bindArgs: Array<ValueType>): Unit {
        unsafe {
            if (sql.isEmpty()) {
                RELATIONAL_STORE_LOG.error("RdbStore executeSql failed: ${paramError("sql", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbStore executeSql failed: ${paramError("sql", "not empty string")}")
            }
            let cSql: CString = LibC.mallocCString(sql)
            var errCode: Int32 = 0
            let size = bindArgs.size
            let cBindArgs: CPointer<RetValueType> = if (size != 0) {
                LibC.malloc<RetValueType>(count: size)
            } else {
                CPointer<RetValueType>()
            }
            throwIfOOM(cBindArgs.isNull() && size != 0, "RdbStore", "executeSql") {
                LibC.free(cSql)
            }
            for (i in 0..size) {
                let arg = RetValueType.create(bindArgs[i])
                throwIfOOM(arg.isNone(), "RdbStore", "executeSql") {
                    LibC.free(cSql)
                    freeValuesArray(cBindArgs, i)
                    LibC.free<RetValueType>(cBindArgs)
                }
                cBindArgs.write(i, arg.getOrThrow())
            }

            FfiOHOSRelationalStoreExecuteSqlBindArgs(getID(), cSql, cBindArgs, size, inout errCode)
            for (i in 0..size) {
                cBindArgs.read(i).free()
            }
            LibC.free<RetValueType>(cBindArgs)
            LibC.free(cSql)
            throwIfNotSuccess(errCode, "RdbStore", "executeSql")
        }
    }

    func findCallbackObject(list: ArrayList<(CallbackObject, Int64)>, callback: CallbackObject): Bool {
        for (item in list) {
            if (refEq(callback, item[0])) {
                return true
            }
        }
        false
    }

    /**
     * Registers an observer for the database.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException  } 801 - Capability not supported.
     * @throws { BusinessException  } 14800000 - Inner error.
     * @throws { BusinessException  } 14800014 - The RdbStore or ResultSet is already closed.
     * @throws { BusinessException  } 14800050 - Failed to obtain the subscription service.
     * @relation on(event: string, interProcess: boolean, observer: Callback<void>): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func on(event: String, interProcess: Bool, callback: Callback0Argument): Unit {
        if (event.isEmpty()) {
            RELATIONAL_STORE_LOG.error("RdbStore on failed: ${paramError("event", "not empty string")}")
            throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                "RdbStore on failed: ${paramError("event", "not empty string")}")
        }
        var v = eventCallbackMaps.entryView(event)
        let callbackList = if (v.value.isNone()) {
            let list = ArrayList<(CallbackObject, Int64)>()
            eventCallbackMaps.add(event, list)
            list
        } else {
            v.value.getOrThrow()
        }
        if (findCallbackObject(callbackList, callback)) {
            RELATIONAL_STORE_LOG.error("RdbStore on failed: ${paramError("callback object", "different")}")
            return
        }
        unsafe {
            let wrapper = {=> callback.invoke()}
            let lambdaData = Callback0Param<Unit>(wrapper)
            let cEvent = LibC.mallocCString(event)
            let errCode = FfiOHOSRelationalStoreOn(
                getID(),
                cEvent,
                interProcess,
                lambdaData.getID(),
                lambdaData.getID()
            )
            LibC.free(cEvent)
            throwIfNotSuccess(errCode, "RdbStore", "on")
            callbackList.add((callback, lambdaData.getID()))
        }
    }

    /**
     * Remove specified observer of specified type from the database.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException  } 801 - Capability not supported.
     * @throws { BusinessException  } 14800000 - Inner error.
     * @throws { BusinessException  } 14800014 - The RdbStore or ResultSet is already closed.
     * @throws { BusinessException  } 14800050 - Failed to obtain the subscription service.
     * @relation off(event: string, interProcess: boolean, observer?: Callback<void>): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func off(event: String, interProcess: Bool): Unit {
        var v = eventCallbackMaps.entryView(event)
        if (v.value.isNone() || v.value.getOrThrow().size == 0) {
            RELATIONAL_STORE_LOG.error("RdbStore on failed: The event is not registered")
            return
        }
        unsafe {
            let cEvent = LibC.mallocCString(event)
            let errCode = FfiOHOSRelationalStoreOffAll(getID(), cEvent, interProcess)
            LibC.free(cEvent)
            throwIfNotSuccess(errCode, "RdbStore", "off")
            v.value.getOrThrow().clear()
        }
    }

    /**
     * Remove specified observer of specified type from the database.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException  } 801 - Capability not supported.
     * @throws { BusinessException  } 14800000 - Inner error.
     * @throws { BusinessException  } 14800014 - The RdbStore or ResultSet is already closed.
     * @throws { BusinessException  } 14800050 - Failed to obtain the subscription service.
     * @relation off(event: string, interProcess: boolean, observer?: Callback<void>): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func off(event: String, interProcess: Bool, callback: Callback0Argument): Unit {
        var v = eventCallbackMaps.entryView(event)
        if (v.value.isNone() || v.value.getOrThrow().size == 0) {
            RELATIONAL_STORE_LOG.error("RdbStore on failed: The event is not registered")
            return
        }
        unsafe {
            v.value.getOrThrow().removeIf(
                {
                    item =>
                    if (refEq(item[0], callback)) {
                        let cEvent = LibC.mallocCString(event)
                        let errCode = FfiOHOSRelationalStoreOff(getID(), cEvent, interProcess, item[1])
                        LibC.free(cEvent)
                        throwIfNotSuccess(errCode, "RdbStore", "off")
                        return true
                    }
                    return false
                }
            )
        }
    }

    func offDataChangeCommon(`type`: SubscribeType, callback: CallbackObject): Unit {
        synchronized(onOffMutex) {
            let callbackList = observers_
            if (callbackList.size == 0) {
                RELATIONAL_STORE_LOG.error("RdbStore off failed: The event is not registered")
                return
            }
            unsafe {
                callbackList.removeIf(
                    {
                        item =>
                        if (refEq(item[0], callback)) {
                            let errCode = FfiOHOSRelationalStoreOffArrStrChangeInfo(getID(), `type`.getValue(), item[1])
                            throwIfNotSuccess(errCode, "RdbStore", "offDataChange")
                            return true
                        }
                        return false
                    }
                )
            }
        }
    }

    /**
     * Notifies the registered observers of a change to the data resource specified by Uri.
     *
     * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException  } 801 - Capability not supported.
     * @throws { BusinessException  } 14800000 - Inner error.
     * @throws { BusinessException  } 14800014 - The RdbStore or ResultSet is already closed.
     * @throws { BusinessException  } 14800050 - Failed to obtain the subscription service.
     * @relation emit(event: string): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func emit(event: String): Unit {
        unsafe {
            let cEvent = LibC.mallocCString(event)
            let errCode = FfiOHOSRelationalStoreEmit(getID(), cEvent)
            LibC.free(cEvent)
            throwIfNotSuccess(errCode, "RdbStore", "emit")
        }
    }
}
