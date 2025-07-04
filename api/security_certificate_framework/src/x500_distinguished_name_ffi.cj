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
struct HcfX509DistinguishedName {
    let PLACE_HOLDER = 0
}

@C
struct CjX500DistinguishedName {
    let name: CPointer<HcfX509DistinguishedName> = CPointer()
}

foreign {
    func FfiCertCjX500DistinguishedNameNewInstance(blob: CPointer<CfBlob>, bString: Bool,
        returnObj: CPointer<CjX500DistinguishedName>): Int32

    func FfiCertCjX500DistinguishedNameDeleteInstance(self: CjX500DistinguishedName): Unit

    func FfiCertCjX500DistinguishedNameGetEncoded(self: CjX500DistinguishedName, out: CPointer<CfEncodingBlob>): Int32

    func FfiCertCjX500DistinguishedNameGetName(self: CjX500DistinguishedName, `type`: CPointer<CfBlob>,
        out: CPointer<CfBlob>, outArr: CPointer<CfArray>): Int32
}
