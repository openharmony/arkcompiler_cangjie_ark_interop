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

/**
 * Provides the x509 trust anchor type.
 *
 * @typedef X509TrustAnchor
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
public class X509TrustAnchor {
    /**
     * The trust CA cert.
     *
     * @type { ?X509Cert }
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
    public var CACert: ?X509Cert = Option.None
    /**
     * The trust CA public key in DER format.
     *
     * @type { ?Uint8Array }
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
    public var CAPubKey: ?Bytes = Option.None
    /**
     * The trust CA subject in DER format.
     *
     * @type { ?Uint8Array }
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
    public var CASubject: ?Bytes = Option.None
    /**
     * The name constraints in DER format.
     *
     * @type { ?Uint8Array }
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
    public var nameConstraints: ?Bytes = Option.None
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Cert"
    ]
    public init() {}
    init(ptr: CPointer<CjX509TrustAnchor>, needFree!: Bool) {
        this(unsafe { ptr.read() }, needFree: needFree)
        unsafe { LibC.free(ptr) }
    }

    init(anchor: CjX509TrustAnchor, needFree!: Bool) {
        if (anchor.CACert.isNotNull()) {
            let hcfX509Cert: CPointer<HcfX509Certificate> = anchor.CACert
            var cjX509Cert = CjX509Certificate()
            let convertCode = unsafe { FfiCertCjX509CertificateFromHcfCert(hcfX509Cert, inout cjX509Cert) }
            if (convertCode == CfResult.CF_SUCCESS) {
                this.CACert = X509Cert(cjX509Cert)
            } else {
                unsafe { FfiCertDestroy(CPointer<Unit>(anchor.CACert)) }
            }
        }

        if (anchor.CAPubKey.isNotNull()) {
            this.CAPubKey = unsafe { anchor.CAPubKey.read().toBytes(needFree: needFree) }
        }

        if (anchor.CASubject.isNotNull()) {
            this.CASubject = unsafe { anchor.CASubject.read().toBytes(needFree: needFree) }
        }

        if (anchor.nameConstraints.isNotNull()) {
            this.nameConstraints = unsafe { anchor.nameConstraints.read().toBytes(needFree: needFree) }
        }
    }

    func toNative(): CjX509TrustAnchor {
        var CAPubKeyPtr = CPointer<CfBlob>()
        var CACertPtr = CPointer<HcfX509Certificate>()
        var CASubjectPtr = CPointer<CfBlob>()
        var nameConstraintsPtr = CPointer<CfBlob>()
        try {
            if (let Some(v) <- this.CAPubKey) {
                CAPubKeyPtr = LibC.malloc<CfBlob>()
                if (CAPubKeyPtr.isNull()) {
                    throw IllegalMemoryException("Out of Memory!")
                }
                unsafe { CAPubKeyPtr.write(v.toCfBlob()) }
            }
            if (let Some(v) <- this.CACert) {
                CACertPtr = v.cert.cert
            }
            if (let Some(v) <- this.CASubject) {
                CASubjectPtr = LibC.malloc<CfBlob>()
                if (CASubjectPtr.isNull()) {
                    throw IllegalMemoryException("Out of Memory!")
                }
                unsafe { CASubjectPtr.write(v.toCfBlob()) }
            }
            if (let Some(v) <- this.nameConstraints) {
                nameConstraintsPtr = LibC.malloc<CfBlob>()
                if (nameConstraintsPtr.isNull()) {
                    throw IllegalMemoryException("Out of Memory!")
                }
                unsafe { nameConstraintsPtr.write(v.toCfBlob()) }
            }
            CjX509TrustAnchor(CAPubKeyPtr, CACertPtr, CASubjectPtr, nameConstraintsPtr)
        } catch (e: Exception) {
            unsafe {
                if (CAPubKeyPtr.isNotNull()) {
                    CAPubKeyPtr.read().free()
                    LibC.free<CfBlob>(CAPubKeyPtr)
                }
                if (CASubjectPtr.isNotNull()) {
                    CASubjectPtr.read().free()
                    LibC.free<CfBlob>(CASubjectPtr)
                }
                if (nameConstraintsPtr.isNotNull()) {
                    nameConstraintsPtr.read().free()
                    LibC.free<CfBlob>(nameConstraintsPtr)
                }
            }
            throw e
        }
    }
}
