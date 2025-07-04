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
struct HcfX509CertificateArray {
    HcfX509CertificateArray(
        let data: CPointer<CPointer<HcfX509Certificate>>,
        let count: UInt32
    ) {
    }
    init() {
        this.data = CPointer()
        this.count = 0
    }
}

@C
struct HcfX509CrlArray {
    HcfX509CrlArray(
        let data: CPointer<CPointer<HcfX509Crl>>,
        let count: UInt32
    ) {
    }
    init() {
        this.data = CPointer()
        this.count = 0
    }
}

@C
struct HcfCertCrlCollection {
    let PLACE_HOLDER = 0
}

@C
struct CjCertCrlCollection {
    let collection: CPointer<HcfCertCrlCollection> = CPointer()
}

foreign {
    func FfiCertCjCertCrlCollectionNewInstance(inCerts: CPointer<HcfX509CertificateArray>,
        inCrls: CPointer<HcfX509CrlArray>, returnObj: CPointer<CjCertCrlCollection>): Int32

    func FfiCertCjCertCrlCollectionDeleteInstance(self: CjCertCrlCollection): Unit

    func FfiCertCjCertCrlCollectionSelectCerts(self: CjCertCrlCollection, matchParams: CPointer<CjX509CertMatchParams>,
        retCerts: CPointer<HcfX509CertificateArray>): Int32

    func FfiCertCjCertCrlCollectionSelectCRLs(self: CjCertCrlCollection, matchParams: CPointer<CjX509CrlMatchParams>,
        retCrls: CPointer<HcfX509CrlArray>): Int32
}
