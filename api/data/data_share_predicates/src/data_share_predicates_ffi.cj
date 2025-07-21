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

package ohos.data.data_share_predicates

import ohos.data.values_bucket.*

foreign {
    func FfiOHOSDataSharePredicatesCreateDataSharePredicates(): Int64

    func FfiOHOSDataSharePredicatesEqualTo(id: Int64, field: CString, value: CValueType): Int32

    func FfiOHOSDataSharePredicatesAnd(id: Int64): Int32

    func FfiOHOSDataSharePredicatesOrderByAsc(id: Int64, field: CString): Int32

    func FfiOHOSDataSharePredicatesOrderByDesc(id: Int64, field: CString): Int32

    func FfiOHOSDataSharePredicatesLimit(id: Int64, total: Int32, offset: Int32): Int32

    func FfiOHOSDataSharePredicatesIn(id: Int64, field: CString, values: CPointer<CValueType>, valuesSize: Int64): Int32

    func FfiOHOSDataSharePredicatesOr(id: Int64): Int32

    func FfiOHOSDataSharePredicatesBeginWrap(id: Int64): Int32

    func FfiOHOSDataSharePredicatesEndWrap(id: Int64): Int32
}
