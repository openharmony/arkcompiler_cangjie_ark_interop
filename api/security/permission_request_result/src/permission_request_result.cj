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

protected package ohos.security.permission_request_result

import ohos.base.BusinessException
import ohos.ffi.{ CArrString, CArrI32, CArrBool }
import ohos.labels.APILevel

const INVALID_PARA: Int32 = 12100001
const OUT_MEMORY_ERR: Int32 = 12100008

/**
 * The result of requestPermissionsFromUser with asynchronous callback.
 *
 * @relation declare class PermissionRequestResult
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.AccessToken"
]
public class PermissionRequestResult {
    /**
    * The permissions passed in by the user.
    *
    * @relation permissions: Array<string>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.AccessToken"
    ]
    public var permissions: Array<String>

    /**
    * The results for the corresponding request permissions. The value 0 indicates that a
    * permission is granted, the value -1 indicates not, and the value 2 indicates the request is invalid.
    *
    * @relation authResults: Array<int>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.AccessToken"
    ]
    public var authResults: Array<Int32>

    /**
    * Specifies whether a dialog box is shown for each requested permission.
    * The value true means that a dialog box is shown, and false means the opposite.
    *
    * @relation dialogShownResults?: Array<boolean>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.AccessToken"
    ]
    public var dialogShownResults = Array<Bool>()

    protected init(
        permissions: Array<String>,
        authResults: Array<Int32>
    ) {
        this.permissions = permissions
        this.authResults = authResults
    }

    protected static func fromCPermissionRequestResult(cRet: CPermissionRequestResult): PermissionRequestResult {
        let pSize = cRet.permissions.size
        let pPtr = cRet.permissions.head
        if (pPtr.isNull()) {
            throw BusinessException(OUT_MEMORY_ERR, "malloc failed!")
        }
        let permissionsArr = unsafe {
            Array<String>(
                pSize,
                {
                    i =>
                    let cString = pPtr.read(i)
                    let permission = cString.toString()
                    LibC.free(cString)
                    permission
                }
            )
        }
        unsafe { LibC.free<CString>(pPtr) }

        let cSize = cRet.authResults.size
        let cPtr = cRet.authResults.head
        if (cPtr.isNull()) {
            throw BusinessException(OUT_MEMORY_ERR, "malloc failed!")
        }
        let autuResultsArr = unsafe { Array<Int32>(cSize, {i => cPtr.read(i)}) }
        unsafe { LibC.free<Int32>(cPtr) }

        let dSize = cRet.dialogShownResults.size
        let dPtr = cRet.dialogShownResults.head
        if (dPtr.isNull()) {
            return PermissionRequestResult(permissionsArr, autuResultsArr)
        }
        let dialogShownResultsArr = unsafe { Array<Bool>(dSize, {i => dPtr.read(i)}) }
        unsafe { LibC.free<Bool>(dPtr) }
        let result = PermissionRequestResult(permissionsArr, autuResultsArr)
        result.dialogShownResults = dialogShownResultsArr
        return result
    }
}

@C
protected struct CPermissionRequestResult {
    CPermissionRequestResult(
        let permissions: CArrString,
        let authResults: CArrI32,
        let dialogShownResults: CArrBool
    ) {}
}

@C
protected struct RetDataCPermissionRequestResult {
    RetDataCPermissionRequestResult(
        protected let code: Int32,
        protected let data: CPermissionRequestResult
    ) {}
}