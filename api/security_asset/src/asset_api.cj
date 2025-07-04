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

package ohos.asset_store

import ohos.base.BusinessException
import std.collection.*
import ohos.labels.*

/**
 * Add an Asset.
 *
 * @param { Array<AssetParam> } attributes - a list object containing attributes of the Asset to be added.
 * @throws { BusinessException } 201 - The caller doesn't have the permission.
 * @throws { BusinessException } 401 - Parameter error. Possible causes:
 *     1. Mandatory parameters are left unspecified.
 *     2. Incorrect parameter types.
 *     3. Parameter verification failed.
 * @throws { BusinessException } 24000001 - The ASSET service is unavailable.
 * @throws { BusinessException } 24000003 - The asset already exists.
 * @throws { BusinessException } 24000005 - The screen lock status does not match.
 * @throws { BusinessException } 24000006 - Insufficient memory.
 * @throws { BusinessException } 24000007 - The asset is corrupted.
 * @throws { BusinessException } 24000008 - The database operation failed.
 * @throws { BusinessException } 24000009 - The cryptography operation failed.
 * @throws { BusinessException } 24000010 - IPC failed.
 * @throws { BusinessException } 24000011 - Calling the Bundle Manager service failed.
 * @throws { BusinessException } 24000012 - Calling the OS Account service failed.
 * @throws { BusinessException } 24000013 - Calling the Access Token service failed.
 * @throws { BusinessException } 24000014 - The file operation failed.
 * @throws { BusinessException } 24000015 - Getting the system time failed.
 * @syscap SystemCapability.Security.Asset
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Asset"
]
public func add(attributes: Array<AssetParam>): Unit {
    var attrArray: Array<AssetAttr> = Array(attributes.size, {i => AssetAttr(attributes[i])})
    unsafe {
        let cph: CPointerHandle<AssetAttr> = acquireArrayRawData(attrArray)
        let retCode = AssetAdd(cph.pointer, UInt32(attrArray.size))
        try {
            if (retCode != ErrorCode.ASSET_SUCCESS) {
                throw BusinessException(retCode, getErrorInfo(retCode))
            }
        } finally {
            for (attr in attrArray) {
                attr.value.clearAndFree()
            }
            releaseArrayRawData(cph)
        }
    }
}

/**
 * Remove one or more Assets that match a search query.
 *
 * @param { Array<AssetParam> } query - a list object containing attributes of the Asset to be removed.
 * @throws { BusinessException } 401 - Parameter error. Possible causes:
 *     1. Incorrect parameter types.
 *     2. Parameter verification failed.
 * @throws { BusinessException } 24000001 - The ASSET service is unavailable.
 * @throws { BusinessException } 24000002 - The asset is not found.
 * @throws { BusinessException } 24000006 - Insufficient memory.
 * @throws { BusinessException } 24000007 - The asset is corrupted.
 * @throws { BusinessException } 24000008 - The database operation failed.
 * @throws { BusinessException } 24000010 - IPC failed.
 * @throws { BusinessException } 24000011 - Calling the Bundle Manager service failed.
 * @throws { BusinessException } 24000012 - Calling the OS Account service failed.
 * @throws { BusinessException } 24000013 - Calling the Access Token service failed.
 * @syscap SystemCapability.Security.Asset
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Asset"
]
public func remove(query: Array<AssetParam>): Unit {
    var queryAttrArray: Array<AssetAttr> = Array(query.size, {i => AssetAttr(query[i])})
    unsafe {
        let cph: CPointerHandle<AssetAttr> = acquireArrayRawData<AssetAttr>(queryAttrArray)
        let retCode = AssetRemove(cph.pointer, UInt32(query.size))
        try {
            if (retCode != ErrorCode.ASSET_SUCCESS) {
                throw BusinessException(retCode, getErrorInfo(retCode))
            }
        } finally {
            for (attr in queryAttrArray) {
                attr.value.clearAndFree()
            }
            releaseArrayRawData(cph)
        }
    }
}

/**
 * Update an Asset that matches a search query.
 *
 * @param { Array<AssetParam> } query - a list object containing attributes of the Asset to be updated.
 * @param { Array<AssetParam> } attributesToUpdate - a list object containing attributes with new values.
 * @throws { BusinessException } 401 - Parameter error. Possible causes:
 *     1. Mandatory parameters are left unspecified.
 *     2. Incorrect parameter types.
 *     3. Parameter verification failed.
 * @throws { BusinessException } 24000001 - The ASSET service is unavailable.
 * @throws { BusinessException } 24000002 - The asset is not found.
 * @throws { BusinessException } 24000005 - The screen lock status does not match.
 * @throws { BusinessException } 24000006 - Insufficient memory.
 * @throws { BusinessException } 24000007 - The asset is corrupted.
 * @throws { BusinessException } 24000008 - The database operation failed.
 * @throws { BusinessException } 24000009 - The cryptography operation failed.
 * @throws { BusinessException } 24000010 - IPC failed.
 * @throws { BusinessException } 24000011 - Calling the Bundle Manager service failed.
 * @throws { BusinessException } 24000012 - Calling the OS Account service failed.
 * @throws { BusinessException } 24000013 - Calling the Access Token service failed.
 * @throws { BusinessException } 24000015 - Getting the system time failed.
 * @syscap SystemCapability.Security.Asset
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Asset"
]
public func update(query: Array<AssetParam>, attributesToUpdate: Array<AssetParam>): Unit {
    var queryAttrArray: Array<AssetAttr> = Array(query.size, {i => AssetAttr(query[i])})
    var updateAttrArray: Array<AssetAttr> = Array(attributesToUpdate.size, {i => AssetAttr(attributesToUpdate[i])})
    unsafe {
        let queryCph: CPointerHandle<AssetAttr> = acquireArrayRawData<AssetAttr>(queryAttrArray)
        let attrCph: CPointerHandle<AssetAttr> = acquireArrayRawData<AssetAttr>(updateAttrArray)
        let retCode = AssetUpdate(queryCph.pointer, UInt32(queryAttrArray.size), attrCph.pointer,
            UInt32(updateAttrArray.size))
        try {
            if (retCode != ErrorCode.ASSET_SUCCESS) {
                throw BusinessException(retCode, getErrorInfo(retCode))
            }
        } finally {
            for (attr in queryAttrArray) {
                attr.value.clearAndFree()
            }
            for (attr in updateAttrArray) {
                attr.value.clearAndFree()
            }
            releaseArrayRawData(queryCph)
            releaseArrayRawData(attrCph)
        }
    }
}

/**
 * Preprocessing (e.g. get challenge) for querying one or more Assets that require user authentication.
 *
 * @param { Array<AssetParam> } query - a list object containing attributes of the Asset to be queried.
 * @returns { Array<Byte> } the challenge value to be used when {@link query} is called.
 * @throws { BusinessException } 401 - Parameter error. Possible causes:
 *     1. Incorrect parameter types.
 *     2. Parameter verification failed.
 * @throws { BusinessException } 24000001 - The ASSET service is unavailable.
 * @throws { BusinessException } 24000002 - The asset is not found.
 * @throws { BusinessException } 24000005 - The screen lock status does not match.
 * @throws { BusinessException } 24000006 - Insufficient memory.
 * @throws { BusinessException } 24000007 - The asset is corrupted.
 * @throws { BusinessException } 24000008 - The database operation failed.
 * @throws { BusinessException } 24000009 - The cryptography operation failed.
 * @throws { BusinessException } 24000010 - IPC failed.
 * @throws { BusinessException } 24000011 - Calling the Bundle Manager service failed.
 * @throws { BusinessException } 24000012 - Calling the OS Account service failed.
 * @throws { BusinessException } 24000013 - Calling the Access Token service failed.
 * @throws { BusinessException } 24000016 - The cache exceeds the limit.
 * @throws { BusinessException } 24000017 - The capability is not supported.
 * @syscap SystemCapability.Security.Asset
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Asset"
]
public func preQuery(query: Array<AssetParam>): Array<Byte> {
    var queryAttrArray: Array<AssetAttr> = Array(query.size, {i => AssetAttr(query[i])})
    unsafe {
        var challenge_blob: AssetBlob = AssetBlob(0, CPointer())
        let queryCph: CPointerHandle<AssetAttr> = acquireArrayRawData<AssetAttr>(queryAttrArray)
        try {
            let retCode = AssetPreQuery(queryCph.pointer, UInt32(queryAttrArray.size), inout challenge_blob)
            if (retCode != ErrorCode.ASSET_SUCCESS) {
                throw BusinessException(retCode, getErrorInfo(retCode))
            }
        } finally {
            for (attr in queryAttrArray) {
                attr.value.clearAndFree()
            }
            releaseArrayRawData(queryCph)
        }

        let challenge: Array<Byte> = Array<Byte>(Int64(challenge_blob.size), repeat: 0)
        let retCph: CPointerHandle<Byte> = acquireArrayRawData(challenge)
        memcpy_s(retCph.pointer, UIntNative(challenge_blob.size), challenge_blob.data, UIntNative(challenge_blob.size))
        releaseArrayRawData(retCph)
        challenge_blob.clearAndFree()
        return challenge
    }
}

/**
 * Query one or more Assets that match a search query.
 *
 * @param { Array<AssetParam> } query - a list object containing attributes of the Asset to be queried.
 * @returns { Array<Array<AssetParam>> } the query result.
 * @throws { BusinessException } 401 - Parameter error. Possible causes:
 *     1. Incorrect parameter types.
 *     2. Parameter verification failed.
 * @throws { BusinessException } 24000001 - The ASSET service is unavailable.
 * @throws { BusinessException } 24000002 - The asset is not found.
 * @throws { BusinessException } 24000004 - Access denied.
 * @throws { BusinessException } 24000005 - The screen lock status does not match.
 * @throws { BusinessException } 24000006 - Insufficient memory.
 * @throws { BusinessException } 24000007 - The asset is corrupted.
 * @throws { BusinessException } 24000008 - The database operation failed.
 * @throws { BusinessException } 24000009 - The cryptography operation failed.
 * @throws { BusinessException } 24000010 - IPC failed.
 * @throws { BusinessException } 24000011 - Calling the Bundle Manager service failed.
 * @throws { BusinessException } 24000012 - Calling the OS Account service failed.
 * @throws { BusinessException } 24000013 - Calling the Access Token service failed.
 * @throws { BusinessException } 24000017 - The capability is not supported.
 * @syscap SystemCapability.Security.Asset
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Asset"
]
public func query(query: Array<AssetParam>): Array<Array<AssetParam>> {
    var queryAttrArray: Array<AssetAttr> = Array(query.size, {i => AssetAttr(query[i])})
    var resultSet: AssetResultSet = AssetResultSet()

    unsafe {
        let queryCph: CPointerHandle<AssetAttr> = acquireArrayRawData<AssetAttr>(queryAttrArray)
        try {
            let retcode = AssetQuery(queryCph.pointer, UInt32(queryAttrArray.size), inout resultSet)
            if (retcode != ErrorCode.ASSET_SUCCESS) {
                throw BusinessException(retcode, getErrorInfo(retcode))
            }
        } finally {
            for (attr in queryAttrArray) {
                attr.value.clearAndFree()
            }
            releaseArrayRawData(queryCph)
        }

        var ret: Array<Array<AssetParam>> = Array(Int64(resultSet.count), repeat: Array<AssetParam>())
        for (i in 0..Int64(resultSet.count)) {
            let assertResult = resultSet.results.read(i)
            var params: ArrayList<AssetParam> = ArrayList<AssetParam>(Int64(assertResult.count))
            for (j in 0..Int64(assertResult.count)) {
                params.add(AssetParam.fromAttr(assertResult.attrs.read(j)))
            }
            ret[i] = params.toArray()
        }

        AssetFreeResultSet(inout resultSet)
        return ret
    }
}

/**
 * Post-processing (e.g. release cached resource) for querying multiple Assets that require user authentication.
 *
 * @param { Array<AssetParam> } handle - a list object containing the handle returned by {@link preQuery}.
 * @throws { BusinessException } 401 - Parameter error. Possible causes:
 *     1. Mandatory parameters are left unspecified.
 *     2. Incorrect parameter types.
 *     3. Parameter verification failed.
 * @throws { BusinessException } 24000001 - The ASSET service is unavailable.
 * @throws { BusinessException } 24000006 - Insufficient memory.
 * @throws { BusinessException } 24000010 - IPC failed.
 * @throws { BusinessException } 24000011 - Calling the Bundle Manager service failed.
 * @throws { BusinessException } 24000012 - Calling the OS Account service failed.
 * @throws { BusinessException } 24000013 - Calling the Access Token service failed.
 * @syscap SystemCapability.Security.Asset
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Asset"
]
public func postQuery(handle: Array<AssetParam>): Unit {
    var handleAttrArray: Array<AssetAttr> = Array(handle.size, {i => AssetAttr(handle[i])})
    unsafe {
        let handleCph: CPointerHandle<AssetAttr> = acquireArrayRawData<AssetAttr>(handleAttrArray.toArray())
        let retCode = AssetPostQuery(handleCph.pointer, UInt32(handleAttrArray.size))
        try {
            if (retCode != ErrorCode.ASSET_SUCCESS) {
                throw BusinessException(retCode, getErrorInfo(retCode))
            }
        } finally {
            for (attr in handleAttrArray) {
                attr.value.clearAndFree()
            }
            releaseArrayRawData(handleCph)
        }
    }
}
