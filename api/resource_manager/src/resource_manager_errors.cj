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

package ohos.resource_manager

import std.collection.{HashMap, ArrayList}
import ohos.ffi.{INVALID_CODE, SUCCESS_CODE}
import ohos.base.{BusinessException, getUniversalErrorMsg}

const ERROR_CODE_RES_ID_NOT_FOUND: Int32 = 9001001
const ERROR_CODE_RES_NOT_FOUND_BY_ID: Int32 = 9001002
const ERROR_CODE_RES_NAME_NOT_FOUND: Int32 = 9001003
const ERROR_CODE_RES_NOT_FOUND_BY_NAME: Int32 = 9001004
const ERROR_CODE_RES_PATH_INVALID: Int32 = 9001005
const ERROR_CODE_RES_REF_TOO_MUCH: Int32 = 9001006
const ERROR_CODE_RES_ID_FORMAT_ERROR: Int32 = 9001007
const ERROR_CODE_RES_NAME_FORMAT_ERROR: Int32 = 9001008
const ERROR_CODE_SYSTEM_RES_MANAGER_GET_FAILED: Int32 = 9001009
const ERROR_CODE_OVERLAY_RES_PATH_INVALID: Int32 = 9001010

let ERROR_CODE_MAP = HashMap<Int32, String>(
    [
        (ERROR_CODE_RES_ID_NOT_FOUND, "Invalid resource ID."),
        (ERROR_CODE_RES_NOT_FOUND_BY_ID, "No matching resource is found based on the resource ID."),
        (ERROR_CODE_RES_NAME_NOT_FOUND, "Invalid resource name."),
        (ERROR_CODE_RES_NOT_FOUND_BY_NAME, "No matching resource is found based on the resource name."),
        (ERROR_CODE_RES_PATH_INVALID, "Invalid relative path."),
        (ERROR_CODE_RES_REF_TOO_MUCH, "The resource is referenced cyclically."),
        (ERROR_CODE_RES_ID_FORMAT_ERROR, "Failed to format the resource obtained based on the resource ID."),
        (ERROR_CODE_RES_NAME_FORMAT_ERROR, "Failed to format the resource obtained based on the resource Name."),
        (ERROR_CODE_SYSTEM_RES_MANAGER_GET_FAILED, "Failed to access the system resource."),
        (ERROR_CODE_OVERLAY_RES_PATH_INVALID, "Invalid overlay path.")
    ]
)

func throwIfNotSuccess(code: Int32, errorMsg: String): Unit {
    if (code != SUCCESS_CODE) {
        if (code == INVALID_CODE) {
            throw IllegalStateException("invalid instance")
        }
        throw BusinessException(code, errorMsg)
    }
}

func throwIfNull(ptr: CString): Unit {
    if (ptr.isNull()) {
        throw IllegalMemoryException("Out of memory.")
    }
}

func getErrorMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error code ${code}."
    }
}