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

package ohos.security_huks

foreign {
    func memcpy_s(dest: CPointer<Byte>, destMax: UIntNative, src: CPointer<Byte>, count: UIntNative): Int32

    func calloc(nitems: UIntNative, size: UIntNative): CPointer<Unit>

    func FfiOHOSInitSession(
        keyAlias: CString,
        paramSet: CPointer<OhosHksParamSet>,
        retHandle: CPointer<OhosHksBlob>,
        retToken: CPointer<OhosHksBlob>
    ): Int32

    func FfiOHOSUpdateSession(
        handle: CPointer<OhosHksBlob>,
        paramSet: CPointer<OhosHksParamSet>,
        inData: CPointer<OhosHksBlob>,
        outData: CPointer<OhosHksBlob>
    ): Int32

    func FfiOHOSFinishSession(
        handle: CPointer<OhosHksBlob>,
        paramSet: CPointer<OhosHksParamSet>,
        inData: CPointer<OhosHksBlob>,
        outData: CPointer<OhosHksBlob>
    ): Int32

    func FfiOHOSAbortSession(handle: CPointer<OhosHksBlob>, paramSet: CPointer<OhosHksParamSet>): Int32

    func FfiOHOSIsKeyExist(keyAlias: CString, paramSet: CPointer<OhosHksParamSet>): Int32

    func FfiOHOSGetKeyItemProperties(
        keyAlias: CString,
        paramSetIn: CPointer<OhosHksParamSet>,
        paramSetOut: CPointer<OhosHksParamSet>
    ): Int32

    func FfiOHOSHAttestKey(
        keyAlias: CString,
        paramSet: CPointer<OhosHksParamSet>,
        certChain: CPointer<OhosHksCertChain>
    ): Int32

    func FfiOHOSHAnonAttestKey(
        keyAlias: CString,
        paramSet: CPointer<OhosHksParamSet>,
        certChain: CPointer<OhosHksCertChain>
    ): Int32

    func FfiOHOSExportKey(
        keyAlias: CString,
        paramSet: CPointer<OhosHksParamSet>,
        key: CPointer<OhosHksBlob>
    ): Int32

    func FfiOHOSImportWrappedKey(
        keyAlias: CString,
        wrappingKeyAlias: CString,
        paramSet: CPointer<OhosHksParamSet>,
        wrappedKeyData: CPointer<OhosHksBlob>
    ): Int32

    func FfiOHOSConvertErrCode(
        hksCode: Int32,
        ret: CPointer<OhosHksResult>
    ): Unit

    func FfiOHOSGenerateKey(
        keyAlias: CString,
        paramSetIn: CPointer<OhosHksParamSet>,
        paramSetOut: CPointer<OhosHksParamSet>
    ): Int32

    func FfiOHOSDeleteKey(
        keyAlias: CString,
        paramSet: CPointer<OhosHksParamSet>
    ): Int32

    func FfiOHOSImportKey(
        keyAlias: CString,
        paramSet: CPointer<OhosHksParamSet>,
        key: CPointer<OhosHksBlob>
    ): Int32

    func FfiOHOSGetSdkVersion(sdkVersion: CPointer<OhosHksBlob>): Int32

    func FfiOHOSListAliases(
        paramSet: CPointer<OhosHksParamSet>,
        retAliasesCnt: CPointer<UInt32>,
        retAliases: CPointer<CPointer<OhosHksBlob>>
    ): Int32
}
