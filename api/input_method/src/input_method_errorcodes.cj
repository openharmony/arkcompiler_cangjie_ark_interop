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

package ohos.input_method

import ohos.base.*
import ohos.ffi.*
import std.collection.*

const MEMORY_ERROR: Int32 = -2
const EXCEPTION_PACKAGEMANAGER: Int32 = 12800001
const EXCEPTION_IMENGINE: Int32 = 12800002
const EXCEPTION_IMCLIENT: Int32 = 12800003
const EXCEPTION_IME: Int32 = 12800004
const EXCEPTION_CONFPERSIST: Int32 = 12800005
const EXCEPTION_CONTROLLER: Int32 = 12800006
const EXCEPTION_SETTINGS: Int32 = 12800007
const EXCEPTION_IMMS: Int32 = 12800008
const EXCEPTION_DETACHED: Int32 = 12800009
const EXCEPTION_DEFAULTIME: Int32 = 12800010
const EXCEPTION_TEXT_PREVIEW_NOT_SUPPORTED: Int32 = 12800011
const EXCEPTION_PANEL_NOT_FOUND: Int32 = 12800012
const EXCEPTION_WINDOW_MANAGER: Int32 = 12800013
const EXCEPTION_BASIC_MODE: Int32 = 12800014
const EXCEPTION_REQUEST_NOT_ACCEPT: Int32 = 12800015
const EXCEPTION_EDITABLE: Int32 = 12800016
const EXCEPTION_INVALID_PANEL_TYPE_FLAG: Int32 = 12800017
const EXCEPTION_IME_NOT_FOUND: Int32 = 12800018
const EXCEPTION_OPERATE_DEFAULTIME: Int32 = 12800019
let ERROR_CODE_MAP = HashMap<Int32, String>(
    [
        (EXCEPTION_PACKAGEMANAGER, "package manager error."),
        (EXCEPTION_IMENGINE, "input method engine error."),
        (EXCEPTION_IMCLIENT, "input method client error."),
        (EXCEPTION_IME, "not an input method extension."),
        (EXCEPTION_CONFPERSIST, "configuration persisting error."),
        (EXCEPTION_CONTROLLER, "input method controller error."),
        (EXCEPTION_SETTINGS, "input method settings extension error."),
        (EXCEPTION_IMMS, "input method manager service error."),
        (EXCEPTION_DETACHED, "input method not attached."),
        (EXCEPTION_DEFAULTIME, "not default input method configured by system."),
        (EXCEPTION_TEXT_PREVIEW_NOT_SUPPORTED, "text preview is not supported."),
        (EXCEPTION_PANEL_NOT_FOUND, "soft keyboard panel doesn't exist."),
        (EXCEPTION_WINDOW_MANAGER, "window manager service error."),
        (EXCEPTION_BASIC_MODE, "the input method is in basic mode."),
        (EXCEPTION_REQUEST_NOT_ACCEPT, "the other side does not accept the request."),
        (EXCEPTION_EDITABLE, "input method client is not editable."),
        (EXCEPTION_INVALID_PANEL_TYPE_FLAG, "invalid panel type or panel flag."),
        (EXCEPTION_IME_NOT_FOUND, "the input method is not found."),
        (EXCEPTION_OPERATE_DEFAULTIME, "current operation cannot be applied to the preconfigured default input method.")
    ]
)

func throwIfUnknownCode(code: Int32): Unit {
    if (!UNIVERSAL_ERROR_MAP.contains(code) && !ERROR_CODE_MAP.contains(code)) {
        throw IllegalStateException("unknown code ${code}")
    }
}

func innerCodeToErrCode(code: Int32): Int32 {
    let errCode = if (code == MEMORY_ERROR) {
        EXCEPTION_IMMS
    } else {
        code
    }
    throwIfUnknownCode(errCode)
    return errCode
}

func innerCodeToMsg(code: Int32): String {
    let errCode = innerCodeToErrCode(code)
    if (let Some(v) <- getUniversalErrorMsg(errCode)) {
        return v
    } else {
        return ERROR_CODE_MAP[errCode]
    }
}
