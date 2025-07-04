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

package ohos.cert

@C
struct CjCfObject {
    let cfObj: CPointer<CfObject> = CPointer()
}

foreign {
    func FfiCertCjCfObjectNewInstance(blob: CPointer<CfEncodingBlob>, returnObj: CPointer<CjCfObject>): Int32

    func FfiCertCjCfObjectDeleteInstance(self: CjCfObject): Unit

    func FfiCertCjCfObjectGetEncoded(self: CjCfObject, out: CPointer<CfBlob>): Int32

    func FfiCertCjCfObjectGetOidList(self: CjCfObject, valueType: Int32, out: CPointer<CfArray>): Int32

    func FfiCertCjCfObjectGetEntry(self: CjCfObject, valueType: Int32, oid: CPointer<CfBlob>, out: CPointer<CfBlob>): Int32

    func FfiCertCjCfObjectCheckCA(self: CjCfObject, out: CPointer<Int32>): Int32

    func FfiCertCjCfObjectHasUnsupportedCriticalExtension(self: CjCfObject, out: CPointer<Bool>): Int32
}
