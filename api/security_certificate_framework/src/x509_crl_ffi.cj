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
struct HcfX509Crl {
    let PLACE_HOLDER = 0
}

@C
struct HcfX509CrlEntry {
    let PLACE_HOLDER = 0
}

@C
struct CjX509Crl {
    CjX509Crl(let crl: CPointer<HcfX509Crl>) {}
    init() {
        crl = CPointer()
    }
}

@C
struct CjX509CrlEntry {
    CjX509CrlEntry(let crlEntry: CPointer<HcfX509CrlEntry>) {}
    init() {
        crlEntry = CPointer()
    }
}

foreign {
    func FfiCertCjX509CrlNewInstance(blob: CPointer<CfEncodingBlob>, returnObj: CPointer<CjX509Crl>): Int32

    func FfiCertCjX509CrlDeleteInstance(self: CjX509Crl): Unit

    func FfiCertCjX509CrlIsRevoked(self: CjX509Crl, cert: CPointer<HcfX509Certificate>): Bool

    func FfiCertCjX509CrlGetType(self: CjX509Crl): CString

    func FfiCertCjX509CrlGetEncoded(self: CjX509Crl, encodedOut: CPointer<CfEncodingBlob>): Int32

    func FfiCertCjX509CrlVerify(self: CjX509Crl, pubKeyId: CPointer<Unit>): Int32

    func FfiCertCjX509CrlGetVersion(self: CjX509Crl): Int32

    func FfiCertCjX509CrlGetIssuerName(self: CjX509Crl, out: CPointer<CfBlob>): Int32

    func FfiCertCjX509CrlGetLastUpdate(self: CjX509Crl, out: CPointer<CfBlob>): Int32

    func FfiCertCjX509CrlGetNextUpdate(self: CjX509Crl, out: CPointer<CfBlob>): Int32

    func FfiCertCjX509CrlGetRevokedCert(self: CjX509Crl, serialNumber: CPointer<CfBlob>,
        entryOut: CPointer<CjX509CrlEntry>): Int32

    func FfiCertCjX509CrlGetRevokedCertWithCert(self: CjX509Crl, cert: CPointer<HcfX509Certificate>,
        entryOut: CPointer<CjX509CrlEntry>): Int32

    func FfiCertCjX509CrlGetRevokedCerts(self: CjX509Crl, entrysOut: CPointer<CfArray>): Int32

    func FfiCertCjX509CrlGetTbsInfo(self: CjX509Crl, tbsCertListOut: CPointer<CfBlob>): Int32

    func FfiCertCjX509CrlGetSignature(self: CjX509Crl, signature: CPointer<CfBlob>): Int32

    func FfiCertCjX509CrlGetSignatureAlgName(self: CjX509Crl, out: CPointer<CfBlob>): Int32

    func FfiCertCjX509CrlGetSignatureAlgOid(self: CjX509Crl, out: CPointer<CfBlob>): Int32

    func FfiCertCjX509CrlGetSignatureAlgParams(self: CjX509Crl, sigAlgParamOut: CPointer<CfBlob>): Int32

    func FfiCertCjX509CrlGetExtensions(self: CjX509Crl, out: CPointer<CfBlob>): Int32

    func FfiCertCjX509CrlMatch(self: CjX509Crl, matchParams: CPointer<CjX509CrlMatchParams>, out: CPointer<Bool>): Int32

    func FfiCertCjX509CrlToString(self: CjX509Crl, out: CPointer<CfBlob>): Int32

    func FfiCertCjX509CrlHashCode(self: CjX509Crl, out: CPointer<CfBlob>): Int32

    func FfiCertCjX509CrlGetExtensionsObject(self: CjX509Crl, out: CPointer<CfBlob>): Int32
}

foreign {
    func FfiCertCjX509CrlEntryNewInstance(crlEntry: CPointer<HcfX509CrlEntry>, returnObj: CPointer<CjX509CrlEntry>): Int32

    func FfiCertCjX509CrlEntryDeleteInstance(self: CjX509CrlEntry): Unit

    func FfiCertCjX509CrlEntryGetEncoded(self: CjX509CrlEntry, encodedOut: CPointer<CfEncodingBlob>): Int32

    func FfiCertCjX509CrlEntryGetSerialNumber(self: CjX509CrlEntry, out: CPointer<CfBlob>): Int32

    func FfiCertCjX509CrlEntryGetCertIssuer(self: CjX509CrlEntry, encodedOut: CPointer<CfBlob>): Int32

    func FfiCertCjX509CrlEntryGetRevocationDate(self: CjX509CrlEntry, out: CPointer<CfBlob>): Int32

    func FfiCertCjX509CrlEntryGetExtensions(self: CjX509CrlEntry, out: CPointer<CfBlob>): Int32

    func FfiCertCjX509CrlEntryHasExtensions(self: CjX509CrlEntry, out: CPointer<Bool>): Int32

    func FfiCertCjX509CrlEntryToString(self: CjX509CrlEntry, out: CPointer<CfBlob>): Int32

    func FfiCertCjX509CrlEntryHashCode(self: CjX509CrlEntry, out: CPointer<CfBlob>): Int32

    func FfiCertCjX509CrlEntryGetExtensionsObject(self: CjX509CrlEntry, out: CPointer<CfBlob>): Int32
}
