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

package ohos.business_exception

import std.collection.HashMap
import ohos.labels.APILevel

protected const ERR_NO_PERMISSION: Int32 = 201
protected const ERR_NOT_SYSTEM_APP: Int32 = 202
protected const ERR_PARAMETER_ERROR: Int32 = 401
protected const ERR_NOT_SUPPOERTED: Int32 = 801
protected let UNIVERSAL_ERROR_MAP = HashMap<Int32, String>(
    [
        (ERR_NO_PERMISSION,
            "Permission verification failed. The application does not have the permission required to call the API."),
        (ERR_NOT_SYSTEM_APP, "Permission verification failed. A non-system application calls a system API."),
        (ERR_PARAMETER_ERROR, "Parameter error. Parameter verification failed."),
        (ERR_NOT_SUPPOERTED, "Capability not supported. Failed to call the API due to limited device capabilities.")
    ]
)

protected func getUniversalErrorMsg(code: Int32): ?String {
    UNIVERSAL_ERROR_MAP.get(code)
}

/**
 * Defines the exception interface.
 */
@!APILevel[
    21,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true
]
public open class BusinessException <: Exception {
    /**
     * Defines the basic error code.
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public let code: Int32
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true
    ]
    public init(code: Int32, msg: String) {
        super(msg)
        this.code = code
    }

    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true
    ]
    protected override func getClassName(): String {
        "BusinessException"
    }

    /**
     * Translate the exception to String.
     */
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true
    ]
    public open func toString(): String {
        let className: String = getClassName()
        let message: String = this.message
        if (message.isEmpty()) {
            return "${className}:  errorcode: ${code}"
        }
        return "${className}: errorcode: ${code}, message: ${message}"
    }
}

/**
 * Defines the error interface.
 */
@!APILevel[
    21,
    stagemodelonly: true
]
public class BusinessError<T> <: BusinessException {
    /**
     * Defines the additional information for business
     */
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public var data: T
    @!APILevel[
        21,
        stagemodelonly: true
    ]
    public init (data: T, code: Int32, msg: String) {
        super(code, msg)
        this.data = data
    }
}

/**
 * Defines the basic async callback.
 */
public type AsyncCallback<T> = (Option<BusinessException>, Option<T>) -> Unit
