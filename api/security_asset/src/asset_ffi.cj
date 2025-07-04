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

foreign {
    func memcpy_s(dest: CPointer<Byte>, destMax: UIntNative, src: CPointer<Byte>, count: UIntNative): Int32

    func memset_s(dest: CPointer<Byte>, destMax: UIntNative, c: Int32, count: UIntNative): Int32

    func AssetAdd(attributes: CPointer<AssetAttr>, attrCnt: UInt32): Int32

    func AssetRemove(query: CPointer<AssetAttr>, queryCnt: UInt32): Int32

    func AssetUpdate(query: CPointer<AssetAttr>, queryCnt: UInt32, attributesToUpdate: CPointer<AssetAttr>,
        updateCnt: UInt32): Int32

    func AssetPreQuery(query: CPointer<AssetAttr>, queryCnt: UInt32, challenge: CPointer<AssetBlob>): Int32

    func AssetQuery(query: CPointer<AssetAttr>, queryCnt: UInt32, resultSet: CPointer<AssetResultSet>): Int32

    func AssetPostQuery(handle: CPointer<AssetAttr>, handleCnt: UInt32): Int32

    func AssetFreeResultSet(resultSet: CPointer<AssetResultSet>): Unit
}
