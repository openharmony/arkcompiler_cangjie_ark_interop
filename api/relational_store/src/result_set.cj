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

package ohos.relational_store

import ohos.labels.*
import ohos.ffi.*
import std.collection.*
import ohos.base.*

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public class ResultSet <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public prop columnNames: Array<String> {
        get() {
            var cArr: CArrString
            unsafe {
                cArr = FfiOHOSRelationalStoreGetAllColumnNames(getID())
            }
            var result = Array<String>()
            throwIfOOM(cArr.size == -1, "ResultSet", "get columnNames")
            if (cArr.head.isNotNull()) {
                let ptr = cArr.head
                let size = cArr.size
                result = unsafe { Array<String>(size, {i => ptr.read(i).toString()}) }
                for (i in 0..size) {
                    unsafe { LibC.free(ptr.read(i)) }
                }
                unsafe { LibC.free<CString>(ptr) }
            }
            return result
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public prop columnCount: Int32 {
        get() {
            unsafe {
                var errCode: Int32 = 0
                let count = FfiOHOSRelationalStoreGetColumnCount(getID(), inout errCode)
                throwIfNotSuccess(errCode, "ResultSet", "get columnCount")
                return count
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public prop rowCount: Int32 {
        get() {
            unsafe {
                var errCode: Int32 = 0
                let count = FfiOHOSRelationalStoreGetRowCount(getID(), inout errCode)
                throwIfNotSuccess(errCode, "ResultSet", "get rowCount")
                return count
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public prop rowIndex: Int32 {
        get() {
            unsafe {
                var errCode: Int32 = 0
                let count = FfiOHOSRelationalStoreGetRowIndex(getID(), inout errCode)
                throwIfNotSuccess(errCode, "ResultSet", "get rowIndex")
                return count
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public prop isAtFirstRow: Bool {
        get() {
            unsafe {
                var errCode: Int32 = 0
                let result = FfiOHOSRelationalStoreIsAtFirstRow(getID(), inout errCode)
                throwIfNotSuccess(errCode, "ResultSet", "get isAtFirstRow")
                return result
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public prop isAtLastRow: Bool {
        get() {
            unsafe {
                var errCode: Int32 = 0
                let result = FfiOHOSRelationalStoreIsAtLastRow(getID(), inout errCode)
                throwIfNotSuccess(errCode, "ResultSet", "get isAtLastRow")
                return result
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public prop isEnded: Bool {
        get() {
            unsafe {
                var errCode: Int32 = 0
                let result = FfiOHOSRelationalStoreIsEnded(getID(), inout errCode)
                throwIfNotSuccess(errCode, "ResultSet", "get isEnded")
                return result
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public prop isStarted: Bool {
        get() {
            unsafe {
                var errCode: Int32 = 0
                let result = FfiOHOSRelationalStoreIsStarted(getID(), inout errCode)
                throwIfNotSuccess(errCode, "ResultSet", "get isStarted")
                return result
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public prop isClosed: Bool {
        get() {
            unsafe {
                var errCode: Int32 = 0
                let result = FfiOHOSRelationalStoreIsClosed(getID(), inout errCode)
                throwIfNotSuccess(errCode, "ResultSet", "get isClosed")
                return result
            }
        }
    }

    /**
     * @brief  getDouble(columnIndex: number): number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getDouble(columnIndex: Int32): Float64 {
        unsafe {
            var errCode: Int32 = 0
            let result = FfiOHOSRelationalStoreGetDouble(getID(), columnIndex, inout errCode)
            throwIfNotSuccess(errCode, "ResultSet", "getDouble")
            return result
        }
    }

    /**
     * @brief  goToRow(position: number): boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func goToRow(position: Int32): Bool {
        unsafe {
            var errCode: Int32 = 0
            let result = FfiOHOSRelationalStoreGoToRow(getID(), position, inout errCode)
            return result
        }
    }

    /**
     * @brief  goToPreviousRow(): boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func goToPreviousRow(): Bool {
        unsafe {
            var errCode: Int32 = 0
            let result = FfiOHOSRelationalStoreGoToPreviousRow(getID(), inout errCode)
            return result
        }
    }

    /**
     * @brief  goToLastRow(): boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func goToLastRow(): Bool {
        unsafe {
            var errCode: Int32 = 0
            let result = FfiOHOSRelationalStoreGoToLastRow(getID(), inout errCode)
            return result
        }
    }

    /**
     * @brief  getColumnName(columnIndex: number): string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getColumnName(columnIndex: Int32): String {
        unsafe {
            var errCode: Int32 = 0
            let name = FfiOHOSRelationalStoreGetColumnName(getID(), columnIndex, inout errCode)
            var result: String = ""
            if (!name.isNull()) {
                result = name.toString()
                LibC.free(name)
            }

            throwIfNotSuccess(errCode, "ResultSet", "getColumnName")
            return result
        }
    }

    /**
     * @brief  isColumnNull(columnIndex: number): boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func isColumnNull(columnIndex: Int32): Bool {
        unsafe {
            var errCode: Int32 = 0
            let result = FfiOHOSRelationalStoreIsColumnNull(getID(), columnIndex, inout errCode)
            throwIfNotSuccess(errCode, "ResultSet", "isColumnNull")
            return result
        }
    }

    /**
     * @brief  getAsset(columnIndex: number): Asset
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getAsset(columnIndex: Int32): Asset {
        unsafe {
            var errCode: Int32 = 0
            let asset = FfiOHOSRelationalStoreGetAsset(getID(), columnIndex, inout errCode)
            throwIfNotSuccess(errCode, "ResultSet", "getAsset")

            var result: Asset
            try {
                result = convert(asset)
            } finally {
                LibC.free(asset.name)
                LibC.free(asset.uri)
                LibC.free(asset.path)
                LibC.free(asset.createTime)
                LibC.free(asset.modifyTime)
                LibC.free(asset.size)
            }

            return result
        }
    }

    /**
     * @brief  close(): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func close(): Unit {
        let rtnCode: Int32 = unsafe { FfiOHOSRelationalStoreClose(getID()) }
        throwIfNotSuccess(rtnCode, "ResultSet", "close")
    }

    /**
     * @brief  getColumnIndex(columnName: string): number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getColumnIndex(columnName: String): Int32 {
        unsafe {
            if (columnName.isEmpty()) {
                RELATIONAL_STORE_LOG.error(
                    "ResultSet getColumnIndex failed: ${paramError("columnName", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "ResultSet getColumnIndex failed: ${paramError("columnName", "not empty string")}")
            }
            var errCode: Int32 = 0
            let cColumnName = mallocCString(columnName)
            throwIfOOM(cColumnName.isNone(), "ResultSet", "getColumnIndex")
            let result = FfiOHOSRelationalStoreGetColumnIndex(getID(), cColumnName.getOrThrow(), inout errCode)
            LibC.free(cColumnName.getOrThrow())
            throwIfNotSuccess(errCode, "ResultSet", "getColumnIndex")
            return result
        }
    }

    /**
     * @brief  getString(columnIndex: number): string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getString(columnIndex: Int32): String {
        unsafe {
            var errCode: Int32 = 0
            let str = FfiOHOSRelationalStoreGetString(getID(), columnIndex, inout errCode)
            let result = str.toString()
            LibC.free(str)
            throwIfNotSuccess(errCode, "ResultSet", "getString")
            return result
        }
    }

    /**
     * @brief  goToFirstRow(): boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func goToFirstRow(): Bool {
        unsafe {
            var errCode: Int32 = 0
            let result = FfiOHOSRelationalStoreGoToFirstRow(getID(), inout errCode)
            return result
        }
    }

    /**
     * @brief  getAssets(columnIndex: number): Assets
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getAssets(columnIndex: Int32): Array<Asset> {
        unsafe {
            var errCode: Int32 = 0
            let assets = FfiOHOSRelationalStoreGetAssets(getID(), columnIndex, inout errCode)
            var result = Array<Asset>()
            if (assets.size == -1) {
                throw Exception("Failed malloc in C code!")
            }
            if (assets.head.isNotNull()) {
                let ptr = assets.head
                let size = assets.size
                result = Array<Asset>(size, {i => convert(ptr.read(i))})
                for (i in 0..size) {
                    let data = ptr.read(i)
                    LibC.free(data.name)
                    LibC.free(data.uri)
                    LibC.free(data.path)
                    LibC.free(data.createTime)
                    LibC.free(data.modifyTime)
                    LibC.free(data.size)
                }
                LibC.free(ptr)
            }
            throwIfNotSuccess(errCode, "ResultSet", "getAssets")
            return result
        }
    }

    /**
     * @brief  getLong(columnIndex: number): number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getLong(columnIndex: Int32): Int64 {
        unsafe {
            var errCode: Int32 = 0
            let result = FfiOHOSRelationalStoreGetLong(getID(), columnIndex, inout errCode)
            throwIfNotSuccess(errCode, "ResultSet", "getLong")
            return result
        }
    }

    /**
     * @brief  goToNextRow(): boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func goToNextRow(): Bool {
        unsafe {
            var errCode: Int32 = 0
            let result = FfiOHOSRelationalStoreGoToNextRow(getID(), inout errCode)
            return result
        }
    }

    /**
     * @brief  getBlob(columnIndex: number): Uint8Array
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getBlob(columnIndex: Int32): Array<UInt8> {
        unsafe {
            var errCode: Int32 = 0
            let arr = FfiOHOSRelationalStoreGetBlob(getID(), columnIndex, inout errCode)
            var result = Array<UInt8>()
            if (arr.size == -1) {
                throw Exception("Failed malloc in C code!")
            }
            if (arr.head.isNotNull()) {
                let ptr = arr.head
                let size = arr.size
                result = Array<UInt8>(size, {i => ptr.read(i)})
                LibC.free<UInt8>(ptr)
            }
            throwIfNotSuccess(errCode, "ResultSet", "getBlob")
            return result
        }
    }

    /**
     * @brief  goTo(offset:number): boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func goTo(offset: Int32): Bool {
        unsafe {
            var errCode: Int32 = 0
            let result = FfiOHOSRelationalStoreGoTo(getID(), offset, inout errCode)
            return result
        }
    }

    /**
     * @brief  getRow(): ValuesBucket
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getRow(): Map<String, ValueType> {
        unsafe {
            var errCode: Int32 = 0
            let result = FfiOHOSRelationalStoreGetRow(getID(), inout errCode)
            let map = convert(result)
            result.free()
            throwIfNotSuccess(errCode, "ResultSet", "getRow")
            return map
        }
    }
}
