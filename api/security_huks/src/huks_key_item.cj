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

import ohos.labels.*
import std.collection.{ArrayList, collectArray, forEach, map}
import ohos.base.BusinessException

/**
 * Check whether the key exists.
 *
 * @param { String } keyAlias - keyAlias indicates the key's name.
 * @param { HuksOptions } options - options indicates the properties of the key.
 * @return { Bool } - whether the key exists.
 * @throws { BusinessException } 401 - argument is invalid
 * @throws { BusinessException } 801 - api is not supported
 * @throws { BusinessException } 12000002 - algorithm param is missing
 * @throws { BusinessException } 12000003 - algorithm param is invalid
 * @throws { BusinessException } 12000004 - operating file failed
 * @throws { BusinessException } 12000005 - IPC communication failed
 * @throws { BusinessException } 12000006 - error occured in crypto engine
 * @throws { BusinessException } 12000012 - external error
 * @throws { BusinessException } 12000014 - memory is insufficient
 * @syscap SystemCapability.Security.Huks.Core
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public func isKeyItemExist(keyAlias: String, options: HuksOptions): Bool {
    if (keyAlias.isEmpty()) {
        throw BusinessException(HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT, "key alias is empty")
    }

    let paramSet: Option<HksParamSet> = if (let Some(properties) <- options.properties) {
        // may throw exception
        HksParamSet(properties)
    } else {
        None
    }

    let keyAliasCstr = unsafe { LibC.mallocCString(keyAlias) }

    let retCode: Int32 = if (let Some(_paramSet) <- paramSet) {
        unsafe { FfiOHOSIsKeyExist(keyAliasCstr, _paramSet.toPointer()) }
    } else {
        unsafe { FfiOHOSIsKeyExist(keyAliasCstr, CPointer()) }
    }

    try {
        if (retCode == HKS_SUCCESS) {
            return true
        } else if (retCode == HKS_ERROR_NOT_EXIST) {
            return false
        } else {
            throw hksCodeToException(retCode)
        }
    } finally {
        unsafe {
            LibC.free(keyAliasCstr)
        }
    }
}

/**
 * Get properties of the key.
 *
 * @param { String } keyAlias - keyAlias indicates the key's name.
 * @param { HuksOptions } options - options indicates the properties of the key.
 * @return { Array<HuksParam> } - the key item properties.
 * @throws { BusinessException } 401 - argument is invalid
 * @throws { BusinessException } 801 - api is not supported
 * @throws { BusinessException } 12000001 - algorithm mode is not supported
 * @throws { BusinessException } 12000002 - algorithm param is missing
 * @throws { BusinessException } 12000003 - algorithm param is invalid
 * @throws { BusinessException } 12000004 - operating file failed
 * @throws { BusinessException } 12000005 - IPC communication failed
 * @throws { BusinessException } 12000006 - error occured in crypto engine
 * @throws { BusinessException } 12000011 - queried entity does not exist
 * @throws { BusinessException } 12000012 - external error
 * @throws { BusinessException } 12000014 - memory is insufficient
 * @syscap SystemCapability.Security.Huks.Extension
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public func getKeyItemProperties(keyAlias: String, _: HuksOptions): Array<HuksParam> {
    // options is a reserved parameter and does not need to be processed currently.
    if (keyAlias.isEmpty()) {
        throw BusinessException(HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT, "key alias is empty")
    }

    let outParamSet = ReadOnlyHksParamSet(HKS_DEFAULT_OUTPARAMSET_SIZE)

    let keyAliasCstr = unsafe { LibC.mallocCString(keyAlias) }

    let retCode = unsafe {
        FfiOHOSGetKeyItemProperties(keyAliasCstr, CPointer(), outParamSet.toPointer())
    }

    try {
        if (retCode == HKS_SUCCESS) {
            let retParamArray: Array<HuksParam> = outParamSet.collectData()
            retParamArray
        } else {
            throw hksCodeToException(retCode)
        }
    } finally {
        unsafe {
            LibC.free(keyAliasCstr)
        }
    }
}

/**
 * Key Attestation.
 *
 * @param { String } keyAlias - keyAlias indicates the key's name.
 * @param { HuksOptions } options - options indicates the properties of the key attestation operation.
 * @return { Array<String> } - the certchain of key.
 * @throws { BusinessException } 201 - check permission failed
 * @throws { BusinessException } 401 - argument is invalid
 * @throws { BusinessException } 801 - api is not supported
 * @throws { BusinessException } 12000001 - algorithm mode is not supported
 * @throws { BusinessException } 12000002 - algorithm param is missing
 * @throws { BusinessException } 12000003 - algorithm param is invalid
 * @throws { BusinessException } 12000004 - operating file failed
 * @throws { BusinessException } 12000005 - IPC communication failed
 * @throws { BusinessException } 12000006 - error occured in crypto engine
 * @throws { BusinessException } 12000011 - queried entity does not exist
 * @throws { BusinessException } 12000012 - external error
 * @throws { BusinessException } 12000014 - memory is insufficient
 * @syscap SystemCapability.Security.Huks.Extension
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Extension"
]
public func attestKeyItem(keyAlias: String, options: HuksOptions): Array<String> {
    if (keyAlias.isEmpty()) {
        throw BusinessException(HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT, "key alias is empty")
    }

    let properties = options.properties.getOrThrow {
        BusinessException(HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT, "properties is None")
    }

    // write another HksParam { .tag = HKS_TAG_ATTESTATION_BASE64, .boolParam = true };
    let propertiesPlus = Array<HuksParam>(
        properties.size + 1,
        {
            i => if (i < properties.size) {
                properties[i]
            } else {
                HuksParam(HuksTag.HUKS_TAG_ATTESTATION_BASE64, HuksParamValue.boolean(true))
            }
        }
    )

    let paramSet: HksParamSet = HksParamSet(propertiesPlus)

    let keyAliasCstr = unsafe { LibC.mallocCString(keyAlias) }

    // create OhosHksCertChain
    const HKS_CERT_COUNT: UInt32 = 4
    const HKS_CERT_ROOT_SIZE: UInt32 = 2048
    const HKS_CERT_CA_SIZE: UInt32 = 2048
    const HKS_CERT_DEVICE_SIZE: UInt32 = 2048
    const HKS_CERT_APP_SIZE: UInt32 = 4096

    let certBlobArray = unsafe {
        [
            OhosHksBlob.malloc(HKS_CERT_APP_SIZE),
            OhosHksBlob.malloc(HKS_CERT_DEVICE_SIZE),
            OhosHksBlob.malloc(HKS_CERT_CA_SIZE),
            OhosHksBlob.malloc(HKS_CERT_ROOT_SIZE)
        ]
    }
    let certBlobPtr = unsafe { acquireArrayRawData(certBlobArray) }
    var certChain = OhosHksCertChain(certBlobPtr.pointer, HKS_CERT_COUNT)
    let retCode = unsafe { FfiOHOSHAttestKey(keyAliasCstr, paramSet.toPointer(), inout certChain) }
    unsafe { releaseArrayRawData(certBlobPtr) }

    try {
        if (retCode == HKS_SUCCESS) {
            return certBlobArray |> map({blob: OhosHksBlob => blob.toString()}) |> collectArray
        } else {
            throw hksCodeToException(retCode)
        }
    } finally {
        unsafe {
            LibC.free(keyAliasCstr)
            certBlobArray |> forEach({blob: OhosHksBlob => blob.free()})
        }
    }
}

/**
 * Anonymous key Attestation.
 *
 * @param { String } keyAlias - keyAlias indicates the key's name.
 * @param { HuksOptions } options - options indicates the properties of the key attestation operation.
 * @return { Array<String> } - the certchain of key.
 * @throws { BusinessException } 201 - check permission failed
 * @throws { BusinessException } 401 - argument is invalid
 * @throws { BusinessException } 801 - api is not supported
 * @throws { BusinessException } 12000001 - algorithm mode is not supported
 * @throws { BusinessException } 12000002 - algorithm param is missing
 * @throws { BusinessException } 12000003 - algorithm param is invalid
 * @throws { BusinessException } 12000004 - operating file failed
 * @throws { BusinessException } 12000005 - IPC communication failed
 * @throws { BusinessException } 12000006 - error occured in crypto engine
 * @throws { BusinessException } 12000011 - queried entity does not exist
 * @throws { BusinessException } 12000012 - external error
 * @throws { BusinessException } 12000014 - memory is insufficient
 * @syscap SystemCapability.Security.Huks.Extension
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Extension"
]
public func anonAttestKeyItem(keyAlias: String, options: HuksOptions): Array<String> {
    if (keyAlias.isEmpty()) {
        throw BusinessException(HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT, "key alias is empty")
    }

    let properties = options.properties.getOrThrow {
        BusinessException(HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT, "properties is None")
    }

    let propertiesPlus = Array<HuksParam>(
        properties.size + 1,
        {
            i => if (i < properties.size) {
                properties[i]
            } else {
                HuksParam(HuksTag.HUKS_TAG_ATTESTATION_BASE64, HuksParamValue.boolean(true))
            }
        }
    )

    let paramSet: HksParamSet = HksParamSet(propertiesPlus)

    let keyAliasCstr = unsafe { LibC.mallocCString(keyAlias) }

    const HKS_CERT_COUNT: UInt32 = 3
    const HKS_CERT_SIZE: UInt32 = 4096

    let certBlobArray = unsafe {
        [
            OhosHksBlob.malloc(HKS_CERT_SIZE),
            OhosHksBlob.malloc(HKS_CERT_SIZE),
            OhosHksBlob.malloc(HKS_CERT_SIZE)
        ]
    }
    let certBlobPtr = unsafe { acquireArrayRawData(certBlobArray) }
    var certChain = OhosHksCertChain(certBlobPtr.pointer, HKS_CERT_COUNT)

    let retCode = unsafe { FfiOHOSHAnonAttestKey(keyAliasCstr, paramSet.toPointer(), inout certChain) }
    unsafe { releaseArrayRawData(certBlobPtr) }

    try {
        if (retCode == HKS_SUCCESS) {
            let ret: Array<String> = certBlobArray |> map({blob: OhosHksBlob => blob.toString()}) |> collectArray
            ret
        } else {
            throw hksCodeToException(retCode)
        }
    } finally {
        unsafe {
            LibC.free(keyAliasCstr)
            certBlobArray |> forEach({blob: OhosHksBlob => blob.free()})
        }
    }
}

/**
 * Export Key.
 *
 * @param { String } keyAlias - keyAlias indicates the key's name.
 * @param { HuksOptions } options - options indicates the properties of the key.
 * @return { Array<UInt8> } - the exported key
 * @throws { BusinessException } 401 - argument is invalid
 * @throws { BusinessException } 801 - api is not supported
 * @throws { BusinessException } 12000001 - algorithm mode is not supported
 * @throws { BusinessException } 12000002 - algorithm param is missing
 * @throws { BusinessException } 12000003 - algorithm param is invalid
 * @throws { BusinessException } 12000004 - operating file failed
 * @throws { BusinessException } 12000005 - IPC communication failed
 * @throws { BusinessException } 12000006 - error occured in crypto engine
 * @throws { BusinessException } 12000011 - queried entity does not exist
 * @throws { BusinessException } 12000012 - external error
 * @throws { BusinessException } 12000014 - memory is insufficient
 * @syscap SystemCapability.Security.Huks.Extension
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Extension"
]
public func exportKeyItem(keyAlias: String, _: HuksOptions): Bytes {
    if (keyAlias.isEmpty()) {
        throw BusinessException(HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT, "key alias is empty")
    }

    let keyAliasCstr = unsafe { LibC.mallocCString(keyAlias) }

    var outData: OhosHksBlob
    try {
        outData = unsafe { OhosHksBlob.malloc(MAX_KEY_SIZE) }
    } catch (e: Exception) {
        unsafe { LibC.free(keyAliasCstr) }
        throw e
    }

    let retCode = unsafe {
        FfiOHOSExportKey(keyAliasCstr, CPointer(), inout outData)
    }

    try {
        if (retCode == HKS_SUCCESS) {
            let ret = outData.copyToBytes()
            ret
        } else {
            throw hksCodeToException(retCode)
        }
    } finally {
        unsafe {
            LibC.free(keyAliasCstr)
            outData.free()
        }
    }
}

/**
 * Import Wrapped Key.
 *
 * @param { String } keyAlias - keyAlias indicates the name of key to be imported.
 * @param { String } wrappingKeyAlias - wrappingKeyAlias indicates the name of key for wrapping the key to be imported.
 * @param { HuksOptions } options - options indicates the properties of the key.
 * @throws { BusinessException } 401 - argument is invalid
 * @throws { BusinessException } 801 - api is not supported
 * @throws { BusinessException } 12000001 - algorithm mode is not supported
 * @throws { BusinessException } 12000002 - algorithm param is missing
 * @throws { BusinessException } 12000003 - algorithm param is invalid
 * @throws { BusinessException } 12000004 - operating file failed
 * @throws { BusinessException } 12000005 - IPC communication failed
 * @throws { BusinessException } 12000006 - error occured in crypto engine
 * @throws { BusinessException } 12000011 - queried entity does not exist
 * @throws { BusinessException } 12000012 - external error
 * @throws { BusinessException } 12000013 - queried credential does not exist
 * @throws { BusinessException } 12000014 - memory is insufficient
 * @throws { BusinessException } 12000015 - call service failed
 * @syscap SystemCapability.Security.Huks.Extension
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Extension"
]
public func importWrappedKeyItem(keyAlias: String, wrappingKeyAlias: String, options: HuksOptions): Unit {
    if (keyAlias.isEmpty()) {
        throw BusinessException(HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT, "key alias is empty")
    }

    let properties = options.properties.getOrThrow {
        BusinessException(HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT, "properties is None")
    }

    let paramSet: HksParamSet = HksParamSet(properties)

    let inData = options.inData.getOrThrow {
        BusinessException(HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT, "indata is None")
    }

    try (
        keyAliasCstr = unsafe { LibC.mallocCString(keyAlias).asResource() },
        wrappingKeyAliasCstr = unsafe { LibC.mallocCString(wrappingKeyAlias).asResource() }
    ) {
        var wrappedData: OhosHksBlob = unsafe { OhosHksBlob.mallocFromBytes(inData) }

        let retCode = unsafe {
            FfiOHOSImportWrappedKey(keyAliasCstr.value, wrappingKeyAliasCstr.value, paramSet.toPointer(),
                inout wrappedData)
        }

        try {
            if (retCode != HKS_SUCCESS) {
                throw hksCodeToException(retCode)
            }
        } finally {
            unsafe {
                wrappedData.free()
            }
        }
    }
}

/**
 * Key generation.
 *
 * @param { String } keyAlias - keyAlias indicates the key's name.
 * @param { HuksOptions } options - options indicates the properties of the key.
 * @throws { BusinessException } 401 - argument is invalid
 * @throws { BusinessException } 801 - api is not supported
 * @throws { BusinessException } 12000001 - algorithm mode is not supported
 * @throws { BusinessException } 12000002 - algorithm param is missing
 * @throws { BusinessException } 12000003 - algorithm param is invalid
 * @throws { BusinessException } 12000004 - operating file failed
 * @throws { BusinessException } 12000005 - IPC communication failed
 * @throws { BusinessException } 12000006 - error occured in crypto engine
 * @throws { BusinessException } 12000012 - external error
 * @throws { BusinessException } 12000013 - queried credential does not exist
 * @throws { BusinessException } 12000014 - memory is insufficient
 * @throws { BusinessException } 12000015 - call service failed
 * @syscap SystemCapability.Security.Huks.Extension
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Extension"
]
public func generateKeyItem(keyAlias: String, options: HuksOptions): Unit {
    if (keyAlias.isEmpty()) {
        throw BusinessException(HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT, "key alias is empty")
    }

    let properties = options.properties.getOrThrow {
        BusinessException(HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT, "properties is None")
    }

    var paramSetIn: HksParamSet = HksParamSet(properties)

    let keyAliasCstr: CString = unsafe { LibC.mallocCString(keyAlias) }

    let retCode = unsafe {
        FfiOHOSGenerateKey(keyAliasCstr, paramSetIn.toPointer(), CPointer())
    }

    try {
        if (retCode != HKS_SUCCESS) {
            throw hksCodeToException(retCode)
        }
    } finally {
        unsafe {
            LibC.free(keyAliasCstr)
        }
    }
}

/**
 * Key deletion.
 *
 * @param { String } keyAlias - keyAlias indicates the key's name.
 * @param { HuksOptions } options - options indicates the properties of the key.
 * @throws { BusinessException } 401 - argument is invalid
 * @throws { BusinessException } 801 - api is not supported
 * @throws { BusinessException } 12000004 - operating file failed
 * @throws { BusinessException } 12000005 - IPC communication failed
 * @throws { BusinessException } 12000011 - queried entity does not exist
 * @throws { BusinessException } 12000012 - external error
 * @throws { BusinessException } 12000014 - memory is insufficient
 * @syscap SystemCapability.Security.Huks.Core
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Extension"
]
public func deleteKeyItem(keyAlias: String, _: HuksOptions): Unit {
    if (keyAlias.isEmpty()) {
        throw BusinessException(HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT, "key alias is empty")
    }

    let keyAliasCstr: CString = unsafe { LibC.mallocCString(keyAlias) }

    let retCode = unsafe {
        FfiOHOSDeleteKey(keyAliasCstr, CPointer())
    }

    try {
        if (retCode != HKS_SUCCESS) {
            throw hksCodeToException(retCode)
        }
    } finally {
        unsafe {
            LibC.free(keyAliasCstr)
        }
    }
}

/**
 * Import key.
 *
 * @param { String } keyAlias - keyAlias indicates the key's name.
 * @param { HuksOptions } options - options indicates the properties of the key.
 * @throws { BusinessException } 401 - argument is invalid
 * @throws { BusinessException } 801 - api is not supported
 * @throws { BusinessException } 12000001 - algorithm mode is not supported
 * @throws { BusinessException } 12000002 - algorithm param is missing
 * @throws { BusinessException } 12000003 - algorithm param is invalid
 * @throws { BusinessException } 12000004 - operating file failed
 * @throws { BusinessException } 12000005 - IPC communication failed
 * @throws { BusinessException } 12000006 - error occured in crypto engine
 * @throws { BusinessException } 12000011 - queried entity does not exist
 * @throws { BusinessException } 12000012 - external error
 * @throws { BusinessException } 12000013 - queried credential does not exist
 * @throws { BusinessException } 12000014 - memory is insufficient
 * @throws { BusinessException } 12000015 - call service failed
 * @syscap SystemCapability.Security.Huks.Extension
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Extension"
]
public func importKeyItem(keyAlias: String, options: HuksOptions): Unit {
    if (keyAlias.isEmpty()) {
        throw BusinessException(HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT, "key alias is empty")
    }

    let properties = options.properties.getOrThrow {
        BusinessException(HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT, "properties is None")
    }
    let inData = options.inData.getOrThrow {
        BusinessException(HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT, "indata is None")
    }

    var paramSet: HksParamSet = HksParamSet(properties)

    let keyAliasCstr: CString = unsafe { LibC.mallocCString(keyAlias) }

    var keyBlob: OhosHksBlob
    try {
        keyBlob = unsafe { OhosHksBlob.mallocFromBytes(inData) }
    } catch (e: Exception) {
        unsafe { LibC.free(keyAliasCstr) }
        throw e
    }

    let retCode = unsafe {
        FfiOHOSImportKey(keyAliasCstr, paramSet.toPointer(), inout keyBlob)
    }

    try {
        if (retCode != HKS_SUCCESS) {
            throw hksCodeToException(retCode)
        }
    } finally {
        unsafe {
            LibC.free(keyAliasCstr)
            keyBlob.free()
        }
    }
}
