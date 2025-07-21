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

package ohos.security.huks

import ohos.labels.*
import ohos.base.BusinessException

/**
 * Init Operation.
 * @throws { BusinessException } 401 - argument is invalid
 * @throws { BusinessException } 801 - api is not supported
 * @throws { BusinessException } 12000001 - algorithm mode is not supported
 * @throws { BusinessException } 12000002 - algorithm param is missing
 * @throws { BusinessException } 12000003 - algorithm param is invalid
 * @throws { BusinessException } 12000004 - operating file failed
 * @throws { BusinessException } 12000005 - IPC communication failed
 * @throws { BusinessException } 12000006 - error occured in crypto engine
 * @throws { BusinessException } 12000010 - the number of sessions has reached limit
 * @throws { BusinessException } 12000011 - queried entity does not exist
 * @throws { BusinessException } 12000012 - external error
 * @throws { BusinessException } 12000014 - memory is insufficient
 * @relation function initSession(keyAlias: string, options: HuksOptions): Promise<HuksSessionHandle>
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public func initSession(keyAlias: String, options: HuksOptions): HuksSessionHandle {
    if (keyAlias.isEmpty()) {
        throw BusinessException(HuksExceptionErrCode.HuksErrCodeIllegalArgument.getValue(), "key alias is empty")
    }
    let properties = options.properties.getOrThrow {
        BusinessException(HuksExceptionErrCode.HuksErrCodeIllegalArgument.getValue(), "properties is None")
    }
    let paramSet: HksParamSet = HksParamSet(properties)
    let keyAliasCstr = unsafe { LibC.mallocCString(keyAlias) }
    var handle: OhosHksBlob
    try {
        handle = unsafe { OhosHksBlob.malloc(HANDLE_SIZE) }
    } catch (e: Exception) {
        unsafe { LibC.free(keyAliasCstr) }
        throw e
    }
    var token: OhosHksBlob
    try {
        token = unsafe { OhosHksBlob.malloc(TOKEN_SIZE) }
    } catch (e: Exception) {
        unsafe { LibC.free(keyAliasCstr) }
        unsafe { handle.free() }
        throw e
    }
    let retCode = unsafe {
        FfiOHOSInitSession(keyAliasCstr, paramSet.toPointer(), inout handle, inout token)
    }
    try {
        if (retCode == HKS_SUCCESS) {
            let retHandle = getHuksHandle(handle)
            let retToken = if (token.size > 0) {
                token.copyToBytes()
            } else {
                Option<Bytes>.None
            }
            return HuksSessionHandle(retHandle, retToken)
        } else {
            throw hksCodeToException(retCode)
        }
    } finally {
        unsafe {
            LibC.free(keyAliasCstr)
            handle.free()
            token.free()
        }
    }
}

func getHuksHandle(handle: OhosHksBlob): HuksHandle {
    if (handle.size == HANDLE_SIZE) {
        HuksHandle(handle.copyToBytes())
    } else {
        HuksHandle(Array())
    }
}

/**
 * Updates the key operation by segment. This API uses an asynchronous callback to return the result.
 * huks.initSession, huks.updateSession, and huks.finishSession must be used together.
 * @throws { BusinessException } 401 - argument is invalid
 * @throws { BusinessException } 801 - api is not supported
 * @throws { BusinessException } 12000001 - algorithm mode is not supported
 * @throws { BusinessException } 12000002 - algorithm param is missing
 * @throws { BusinessException } 12000003 - algorithm param is invalid
 * @throws { BusinessException } 12000004 - operating file failed
 * @throws { BusinessException } 12000005 - IPC communication failed
 * @throws { BusinessException } 12000006 - error occured in crypto engine
 * @throws { BusinessException } 12000007 - this credential is already invalidated permanently
 * @throws { BusinessException } 12000008 - verify authtoken failed
 * @throws { BusinessException } 12000009 - authtoken is already timeout
 * @throws { BusinessException } 12000011 - queried entity does not exist
 * @throws { BusinessException } 12000012 - external error
 * @throws { BusinessException } 12000014 - memory is insufficient
 * @relation function updateSession(handle: number, options: HuksOptions, callback: AsyncCallback<HuksReturnResult>): void
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public func updateSession(handle: HuksHandle, options: HuksOptions): Option<Bytes> {
    return updateOrFinish(handle, options, Array(), true)
}

 /**
   * Updates the key operation by segment. This API uses an asynchronous callback to return the result.
   * huks.initSession, huks.updateSession, and huks.finishSession must be used together.
   * @throws { BusinessException } 401 - Parameter error. Possible causes:
   *                                 1. Mandatory parameters are left unspecified.
   *                                 2. Incorrect parameter types.
   *                                 3. Parameter verification failed.
   * @throws { BusinessException } 801 - api is not supported
   * @throws { BusinessException } 12000001 - algorithm mode is not supported
   * @throws { BusinessException } 12000002 - algorithm param is missing
   * @throws { BusinessException } 12000003 - algorithm param is invalid
   * @throws { BusinessException } 12000004 - operating file failed
   * @throws { BusinessException } 12000005 - IPC communication failed
   * @throws { BusinessException } 12000006 - error occurred in crypto engine
   * @throws { BusinessException } 12000007 - this credential is already invalidated permanently
   * @throws { BusinessException } 12000008 - verify auth token failed
   * @throws { BusinessException } 12000009 - auth token is already timeout
   * @throws { BusinessException } 12000011 - queried entity does not exist
   * @throws { BusinessException } 12000012 - Device environment or input parameter abnormal
   * @throws { BusinessException } 12000014 - memory is insufficient
   * @relation function updateSession(handle: number, options: HuksOptions, token?: Uint8Array): Promise<HuksReturnResult>
   */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Extension"
]
public func updateSession(handle: HuksHandle, options: HuksOptions, token: Bytes): Option<Bytes> {
    return updateOrFinish(handle, options, token, true)
}

/**
 * Finishes the key operation. This API uses an asynchronous callback to return the result.
 * huks.initSession, huks.updateSession, and huks.finishSession must be used together.
 * @throws { BusinessException } 401 - argument is invalid
 * @throws { BusinessException } 801 - api is not supported
 * @throws { BusinessException } 12000001 - algorithm mode is not supported
 * @throws { BusinessException } 12000002 - algorithm param is missing
 * @throws { BusinessException } 12000003 - algorithm param is invalid
 * @throws { BusinessException } 12000004 - operating file failed
 * @throws { BusinessException } 12000005 - IPC communication failed
 * @throws { BusinessException } 12000006 - error occured in crypto engine
 * @throws { BusinessException } 12000007 - this credential is already invalidated permanently
 * @throws { BusinessException } 12000008 - verify authtoken failed
 * @throws { BusinessException } 12000009 - authtoken is already timeout
 * @throws { BusinessException } 12000011 - queried entity does not exist
 * @throws { BusinessException } 12000012 - external error
 * @throws { BusinessException } 12000014 - memory is insufficient
 * @relation function finishSession(handle: number, options: HuksOptions, callback: AsyncCallback<HuksReturnResult>): void
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public func finishSession(handle: HuksHandle, options: HuksOptions): Option<Bytes> {
    return updateOrFinish(handle, options, Array(), false)
}

/**
   * Finishes the key operation. This API uses an asynchronous callback to return the result.
   * huks.initSession, huks.updateSession, and huks.finishSession must be used together.
   * @throws { BusinessException } 401 - Parameter error. Possible causes:
   *                                 1. Mandatory parameters are left unspecified.
   *                                 2. Incorrect parameter types.
   *                                 3. Parameter verification failed.
   * @throws { BusinessException } 801 - api is not supported
   * @throws { BusinessException } 12000001 - algorithm mode is not supported
   * @throws { BusinessException } 12000002 - algorithm param is missing
   * @throws { BusinessException } 12000003 - algorithm param is invalid
   * @throws { BusinessException } 12000004 - operating file failed
   * @throws { BusinessException } 12000005 - IPC communication failed
   * @throws { BusinessException } 12000006 - error occurred in crypto engine
   * @throws { BusinessException } 12000007 - this credential is already invalidated permanently
   * @throws { BusinessException } 12000008 - verify auth token failed
   * @throws { BusinessException } 12000009 - auth token is already timeout
   * @throws { BusinessException } 12000011 - queried entity does not exist
   * @throws { BusinessException } 12000012 - Device environment or input parameter abnormal
   * @throws { BusinessException } 12000014 - memory is insufficient
   * @relation function finishSession(handle: number, options: HuksOptions, token?: Uint8Array): Promise<HuksReturnResult>
   */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public func finishSession(handle: HuksHandle, options: HuksOptions, token: Bytes): Option<Bytes> {
    return updateOrFinish(handle, options, token, false)
}

func updateOrFinish(handle: HuksHandle, options: HuksOptions, token: Bytes, isUpdate: Bool): Option<Bytes> {
    let properties = options.properties.getOrThrow {
        BusinessException(HuksExceptionErrCode.HuksErrCodeIllegalArgument.getValue(), "properties is None")
    }
    let inData = options.inData.getOrDefault({=> Array()})
    var inBlob: OhosHksBlob = unsafe { OhosHksBlob.mallocFromBytes(inData) }
    let outBlobSize = getOutBlogSize(inData)
    var outBlob: OhosHksBlob
    try {
        outBlob = unsafe { OhosHksBlob.malloc(outBlobSize) }
    } catch (e: Exception) {
        unsafe { inBlob.free() }
        throw e
    }
    let paramSet: HksParamSet
    try {
        paramSet = HksParamSet(properties)
    } catch (e: Exception) {
        unsafe { outBlob.free() }
        unsafe { inBlob.free() }
        throw e
    }
    if (!token.isEmpty()) {
        if (!paramSet.write(HuksTag.HuksTagAuthToken.getValue(), token)) {
            unsafe { outBlob.free() }
            unsafe { inBlob.free() }
            throw BusinessException(
                HuksExceptionErrCode.HuksErrCodeIllegalArgument.getValue(),
                "properties too big"
            )
        }
    }
    // create OhosHksBlob for user ffi from handle 
    var handleBlob: OhosHksBlob
    try {
        handleBlob = unsafe { OhosHksBlob.mallocFromBytes(handle.data) }
    } catch (e: Exception) {
        unsafe { outBlob.free() }
        unsafe { inBlob.free() }
        throw e
    }
    let retCode = unsafe {
        if (isUpdate) {
            FfiOHOSUpdateSession(inout handleBlob, paramSet.toPointer(), inout inBlob, inout outBlob)
        } else {
            FfiOHOSFinishSession(inout handleBlob, paramSet.toPointer(), inout inBlob, inout outBlob)
        }
    }
    processRet(retCode, outBlob, handleBlob, inBlob)
}

func getOutBlogSize(inData: Array<UInt8>) {
    if (UInt32(inData.size) > MAX_KEY_SIZE) {
        UInt32(inData.size)
    } else {
        MAX_KEY_SIZE
    }
}

func processRet(retCode: Int32, outBlob: OhosHksBlob, handleBlob: OhosHksBlob, inBlob: OhosHksBlob) {
    try {
        if (retCode == HKS_SUCCESS) {
            let retOutData = outBlob.copyToBytes()
            retOutData
        } else {
            throw hksCodeToException(retCode)
        }
    } finally {
        unsafe {
            handleBlob.free()
            inBlob.free()
            outBlob.free()
        }
    }
}

/**
 * Aborts a key operation. This API uses an asynchronous callback to return the result.
 * @throws { BusinessException } 401 - argument is invalid
 * @throws { BusinessException } 801 - api is not supported
 * @throws { BusinessException } 12000004 - operating file failed
 * @throws { BusinessException } 12000005 - IPC communication failed
 * @throws { BusinessException } 12000006 - error occured in crypto engine
 * @throws { BusinessException } 12000012 - external error
 * @throws { BusinessException } 12000014 - memory is insufficient
 * @relation function abortSession(handle: number, options: HuksOptions, callback: AsyncCallback<void>): void
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Huks.Core"
]
public func abortSession(handle: HuksHandle, options: HuksOptions): Unit {
    let properties = options.properties.getOrThrow {
        BusinessException(HuksExceptionErrCode.HuksErrCodeIllegalArgument.getValue(), "properties is None")
    }

    let paramSet: HksParamSet = HksParamSet(properties)

    var handleBlob = unsafe { OhosHksBlob.mallocFromBytes(handle.data) }

    let retCode = unsafe {
        FfiOHOSAbortSession(inout handleBlob, paramSet.toPointer())
    }

    try {
        if (retCode != HKS_SUCCESS) {
            throw hksCodeToException(retCode)
        }
    } finally {
        unsafe {
            handleBlob.free()
        }
    }
}
