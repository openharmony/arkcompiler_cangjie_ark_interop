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

foreign {
    func memcpy_s(dest: CPointer<Byte>, destMax: UIntNative, src: CPointer<Byte>, count: UIntNative): Int32

    func memset_s(dest: CPointer<Byte>, destMax: UIntNative, c: Int32, count: UIntNative): Int32

    func calloc(nitems: UIntNative, size: UIntNative): CPointer<Unit>

    func FfiCertManagerInstallAppCert(appCert: CPointer<CmBlob>, appCertPwd: CPointer<CmBlob>,
        certAlias: CPointer<CmBlob>, store: UInt32, keyUri: CPointer<CmBlob>): Int32

    func FfiCertManagerUninstallAppCert(keyUri: CPointer<CmBlob>, store: UInt32): Int32

    func FfiCertManagerGetAppCert(keyUri: CPointer<CmBlob>, store: UInt32, retObj: CPointer<CjCredential>): Int32

    func FfiCertManagerInit(authUri: CPointer<CmBlob>, spec: CPointer<CjSignatureSpec>, handle: CPointer<CmBlob>): Int32

    func FfiCertManagerUpdate(handle: CPointer<CmBlob>, inData: CPointer<CmBlob>): Int32

    func FfiCertManagerFinish(handle: CPointer<CmBlob>, inData: CPointer<CmBlob>, outData: CPointer<CmBlob>): Int32

    func FfiCertManagerAbort(handle: CPointer<CmBlob>): Int32

    func FfiCertManagerIsAuthorizedApp(authUri: CPointer<CmBlob>): Int32

    func FfiCertManagerGetUserCertList(store: UInt32, retCount: CPointer<UInt32>,
        retObj: CPointer<CPointer<CjCertAbstract>>): Int32

    func FfiCertManagerGetUserCertInfo(certUri: CPointer<CmBlob>, store: UInt32, retObj: CPointer<CjCertInfo>): Int32
}
