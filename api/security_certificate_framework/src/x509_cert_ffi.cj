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
struct HcfX509Certificate {
    let PLACE_HOLDER = 0
}

@C
struct CfObject {
    let PLACE_HOLDER = 0
}

@C
struct CjX509Certificate {
    CjX509Certificate(
        let cert: CPointer<HcfX509Certificate>,
        let cfObj: CPointer<CfObject>
    ) {
    }
    init() {
        this.cert = CPointer()
        this.cfObj = CPointer()
    }
}

foreign {
    func FfiCertCjX509CertificateNewInstance(blob: CPointer<CfEncodingBlob>, x509Cert: CPointer<CjX509Certificate>): Int32

    func FfiCertCjX509CertificateDeleteInstance(self: CjX509Certificate): Unit

    func FfiCertCjX509CertificateFromHcfCert(
        hcfCert: CPointer<HcfX509Certificate>,
        returnObject: CPointer<CjX509Certificate>
    ): Int32

    func FfiCertCjX509CertificateVerify(self: CjX509Certificate, pubKeyId: CPointer<Unit>): Int32

    func FfiCertCjX509CertificateGetEncoded(self: CjX509Certificate, blob: CPointer<CfEncodingBlob>): Int32

    func FfiCertCjX509CertificateGetPublicKey(self: CjX509Certificate, pubKeyId: CPointer<CPointer<Unit>>): Int32

    func FfiCertCjX509CertificateCheckValidityWithDate(self: CjX509Certificate, date: CString): Int32

    func FfiCertCjX509CertificateGetVersion(self: CjX509Certificate): Int32

    func FfiCertCjX509CertificateGetSerialNumber(self: CjX509Certificate, out: CPointer<CfBlob>): Int32

    func FfiCertCjX509CertificateGetIssuerName(self: CjX509Certificate, out: CPointer<CfBlob>): Int32

    func FfiCertCjX509CertificateGetSubjectName(self: CjX509Certificate, out: CPointer<CfBlob>): Int32

    func FfiCertCjX509CertificateGetNotBeforeTime(self: CjX509Certificate, outDate: CPointer<CfBlob>): Int32

    func FfiCertCjX509CertificateGetNotAfterTime(self: CjX509Certificate, outDate: CPointer<CfBlob>): Int32

    func FfiCertCjX509CertificateGetSignature(self: CjX509Certificate, sigOut: CPointer<CfBlob>): Int32

    func FfiCertCjX509CertificateGetSignatureAlgName(self: CjX509Certificate, outName: CPointer<CfBlob>): Int32

    func FfiCertCjX509CertificateGetSignatureAlgOid(self: CjX509Certificate, out: CPointer<CfBlob>): Int32

    func FfiCertCjX509CertificateGetSignatureAlgParams(self: CjX509Certificate, sigAlgParamsOut: CPointer<CfBlob>): Int32

    func FfiCertCjX509CertificateGetKeyUsage(self: CjX509Certificate, boolArr: CPointer<CfBlob>): Int32

    func FfiCertCjX509CertificateGetExtKeyUsage(self: CjX509Certificate, keyUsageOut: CPointer<CfArray>): Int32

    func FfiCertCjX509CertificateGetBasicConstraints(self: CjX509Certificate): Int32

    func FfiCertCjX509CertificateGetSubjectAltNames(self: CjX509Certificate, outName: CPointer<CfArray>): Int32

    func FfiCertCjX509CertificateGetIssuerAltNames(self: CjX509Certificate, outName: CPointer<CfArray>): Int32

    func FfiCertCjX509CertificateMatch(self: CjX509Certificate, matchParams: CPointer<CjX509CertMatchParams>,
        out: CPointer<Bool>): Int32

    func FfiCertCjX509CertificateGetCRLDistributionPointsURI(self: CjX509Certificate, outURI: CPointer<CfArray>): Int32

    func FfiCertCjX509CertificateToString(self: CjX509Certificate, out: CPointer<CfBlob>): Int32

    func FfiCertCjX509CertificateHashCode(self: CjX509Certificate, out: CPointer<CfBlob>): Int32

    func FfiCertCjX509CertificateGetExtensionsObject(self: CjX509Certificate, out: CPointer<CfBlob>): Int32

    func FfiCertCjX509CertificateGetSubjectNameEx(self: CjX509Certificate, encodingType: Int32, out: CPointer<CfBlob>): Int32

    func FfiCertCjX509CertificateGetItem(self: CjX509Certificate, itemType: Int32, out: CPointer<CfBlob>): Int32
}
