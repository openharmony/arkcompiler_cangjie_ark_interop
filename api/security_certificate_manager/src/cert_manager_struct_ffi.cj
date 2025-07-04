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

package ohos.cert_manager

@C
struct CjCredential {
    let isExist: UInt32 = 0
    let _type: CString = CString(CPointer())
    let alias: CString = CString(CPointer())
    let keyUri: CString = CString(CPointer())
    let certNum: UInt32 = 0
    let keyNum: UInt32 = 0
    let credData: CmBlob = CmBlob()
    func free() {
        unsafe {
            LibC.free(this._type)
            LibC.free(this.alias)
            LibC.free(this.keyUri)
            credData.free()
        }
    }
}

@C
struct CjSignatureSpec {
    let purpose: UInt32
    let padding: UInt32
    let digest: UInt32
    init(spec: CMSignatureSpec) {
        this.purpose = spec.purpose.getValue()
        this.padding = match (spec.padding) {
            case Some(v) => v.getValue()
            case None => 0
        }
        this.digest = match (spec.digest) {
            case Some(v) => v.getValue()
            case None => 0
        }
    }
}

@C
struct CjCertAbstract {
    let uri: CString = CString(CPointer())
    let certAlias: CString = CString(CPointer())
    let status: Bool = false
    let subjectName: CString = CString(CPointer())
    func free() {
        unsafe {
            LibC.free(this.uri)
            LibC.free(this.certAlias)
            LibC.free(this.subjectName)
        }
    }
}

@C
struct CjCertInfo {
    let uri: CString = CString(CPointer())
    let certAlias: CString = CString(CPointer())
    let status: Bool = false
    let issuerName: CString = CString(CPointer())
    let subjectName: CString = CString(CPointer())
    let serial: CString = CString(CPointer())
    let notBefore: CString = CString(CPointer())
    let notAfter: CString = CString(CPointer())
    let fingerprintSha256: CString = CString(CPointer())
    let certInfo: CmBlob = CmBlob()
    func free() {
        unsafe {
            LibC.free(this.uri)
            LibC.free(this.certAlias)
            LibC.free(this.issuerName)
            LibC.free(this.subjectName)
            LibC.free(this.serial)
            LibC.free(this.notBefore)
            LibC.free(this.notAfter)
            LibC.free(this.fingerprintSha256)
            certInfo.free()
        }
    }
}
