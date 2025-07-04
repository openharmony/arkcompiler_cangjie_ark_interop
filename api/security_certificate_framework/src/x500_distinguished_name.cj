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
 * Provides the x500 distinguished name type.
 *
 * @typedef X500DistinguishedName
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
public class X500DistinguishedName {
    X500DistinguishedName(let name: CjX500DistinguishedName) {}

    ~init() {
        unsafe { FfiCertCjX500DistinguishedNameDeleteInstance(this.name) }
    }

    /**
     * Get distinguished name string.
     *
     * @returns { String } distinguished name string.
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
    public func getName(): String {
        var retObj = CfBlob()
        let retCode = unsafe { FfiCertCjX500DistinguishedNameGetName(this.name, CPointer(), inout retObj, CPointer()) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("Distinguished Name get name failed")
        }
        return retObj.toStringUtf8(needFree: true)
    }

    /**
     * Get distinguished name string by type.
     *
     * @param { String } type - the specified type name.
     * @returns { Array<String> } distinguished name string.
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
    public func getName(typeName: String): Array<String> {
        var retObj = CfArray()
        var blob = typeName.toCfBlob()
        let retCode = unsafe { FfiCertCjX500DistinguishedNameGetName(this.name, inout blob, CPointer(), inout retObj) }
        blob.free()
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("Distinguished Name get name failed")
        }
        return retObj.toStringUtf8Array(needFree: true)
    }

    /**
     * Get distinguished name in der coding format.
     *
     * @returns { EncodingBlob } distinguished name encoded data.
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
        var retObj = CfEncodingBlob()
        let retCode = unsafe { FfiCertCjX500DistinguishedNameGetEncoded(this.name, inout retObj) }
        if (retCode != CfResult.CF_SUCCESS) {
            throw retCode.toEpt("Distinguished Name get name failed")
        }
        return retObj.toEncodingBlob(needFree: true)
    }
}
