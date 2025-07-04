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

import ohos.labels.*
import ohos.base.BusinessException

/**
 * The CertExtension interface is used to parse and verify certificate extension.
 *
 * @typedef CertExtension
 * @syscap SystemCapability.Security.Cert
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Cert"
]
public class CertExtension {
    CertExtension(let cfObj: CjCfObject) {}

    ~init() {
        unsafe { FfiCertCjCfObjectDeleteInstance(this.cfObj) }
    }

    /**
     * Get certificate extension encoded data.
     *
     * @returns { EncodingBlob } cert extension encoded data.
     * @throws { BusinessException } 19020001 - memory error.
     * @throws { BusinessException } 19020002 - runtime error.
     * @throws { BusinessException } 19030001 - crypto operation error.
     * @syscap SystemCapability.Security.Cert
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Cert"
    ]
    public func getEncoded(): EncodingBlob {
        var retObj = CfBlob()
        let retCode = unsafe { FfiCertCjCfObjectGetEncoded(this.cfObj, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get encoded failed")
        }
        return retObj.toEncodingDataBlob(needFree: true)
    }

    /**
     * Get certificate extension oid list.
     *
     * @param { ExtensionOidType } valueType
     * @returns { Array<DataBlob> } cert extension OID list value.
     * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 19020001 - memory error.
     * @throws { BusinessException } 19020002 - runtime error.
     * @throws { BusinessException } 19030001 - crypto operation error.
     * @syscap SystemCapability.Security.Cert
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Cert"
    ]
    public func getOidList(valueType: ExtensionOidType): Array<DataBlob> {
        var retObj = CfArray()
        let retCode = unsafe { FfiCertCjCfObjectGetOidList(this.cfObj, valueType.getValue(), inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get oid list failed")
        }
        // The result comes from the OpenSSL. Do not release the function.
        let ret = retObj.toDataBlobArray()
        unsafe { LibC.free(retObj.data) }
        return ret
    }

    /**
     * Get certificate extension entry.
     *
     * @param { ExtensionEntryType } valueType
     * @param { DataBlob } oid
     * @returns { DataBlob } cert extension entry value.
     * @throws { BusinessException } 401 - invalid parameters. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 19020001 - memory error.
     * @throws { BusinessException } 19020002 - runtime error.
     * @throws { BusinessException } 19030001 - crypto operation error.
     * @syscap SystemCapability.Security.Cert
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Cert"
    ]
    public func getEntry(valueType: ExtensionEntryType, oid: DataBlob): DataBlob {
        var retObj = CfBlob()
        var blob = oid.data.toCfBlob()
        let retCode = unsafe { FfiCertCjCfObjectGetEntry(this.cfObj, valueType.getValue(), inout blob, inout retObj) }
        blob.free()
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("get entry failed")
        }
        return retObj.toDataBlob(needFree: true)
    }

    /**
     * Check whether the certificate is a CA(The keyusage contains signature usage and the value of cA in BasicConstraints is true).
     * If not a CA, return -1, otherwise return the path length constraint in BasicConstraints.
     * If the certificate is a CA and the path length constraint does not appear, then return -2 to indicate that there is no limit to path length.
     *
     * @returns { Int32 } path length constraint.
     * @throws { BusinessException } 19020001 - memory error.
     * @throws { BusinessException } 19020002 - runtime error.
     * @throws { BusinessException } 19030001 - crypto operation error.
     * @syscap SystemCapability.Security.Cert
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Cert"
    ]
    public func checkCA(): Int32 {
        var retObj = 0_i32
        let retCode = unsafe { FfiCertCjCfObjectCheckCA(this.cfObj, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("check CA failed")
        }
        return retObj
    }

    /**
     * Check if exists Unsupported critical extension.
     *
     * @returns { Bool } true - exists unsupported critical extension, false - else.
     * @throws { BusinessException } 19020001 - memory error.
     * @throws { BusinessException } 19020002 - runtime error.
     * @throws { BusinessException } 19030001 - crypto operation error.
     * @syscap SystemCapability.Security.Cert
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Cert"
    ]
    public func hasUnsupportedCriticalExtension(): Bool {
        var retObj = false
        let retCode = unsafe { FfiCertCjCfObjectHasUnsupportedCriticalExtension(this.cfObj, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("has unsupported critical extension failed")
        }
        return retObj
    }
}
