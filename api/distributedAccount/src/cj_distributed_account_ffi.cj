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

package ohos.account_distributedAccount

import ohos.base.*
import ohos.ffi.*

foreign {
    func FfiOHOSDistributedAccountDistributedInfoGetOsAccountDistributedInfo(errCode: CPointer<Int32>): CJDistributedInfo

    func FfiOHOSDistributedAccountUnitSetOsAccountDistributedInfo(
        distributeInfo: CJDistributedInfo,
        errCode: CPointer<Int32>
    ): Unit
}

@C
struct CJDistributedInfo {
    CJDistributedInfo(
        let name: CString,
        let id: CString,
        let event: CString,
        let nickname: CString,
        let avatar: CString,
        let status: Int32,
        let scalableData: CString
    ) {}

    static func create(distributeInfo: DistributedInfo): Option<CJDistributedInfo> {
        unsafe {
            let name = mallocCString(distributeInfo.name)
            let id = mallocCString(distributeInfo.id)
            let event = mallocCString(distributeInfo.event.getValue())
            let nickname = mallocCString(distributeInfo.nickname)
            let avatar = mallocCString(distributeInfo.avatar)
            let scalableData = mallocCString(distributeInfo.scalableData)
            if (name.isSome() && id.isSome() && event.isSome() && nickname.isSome() && avatar.isSome()) {
                return CJDistributedInfo(name.getOrThrow(), id.getOrThrow(), event.getOrThrow(), nickname.getOrThrow(),
                    avatar.getOrThrow(), distributeInfo.status.getValue(), scalableData.getOrThrow())
            } else {
                if (name.isSome()) {
                    LibC.free(name.getOrThrow())
                }
                if (id.isSome()) {
                    LibC.free(id.getOrThrow())
                }
                if (event.isSome()) {
                    LibC.free(event.getOrThrow())
                }
                if (nickname.isSome()) {
                    LibC.free(nickname.getOrThrow())
                }
                if (avatar.isSome()) {
                    LibC.free(avatar.getOrThrow())
                }
                if (scalableData.isSome()) {
                    LibC.free(scalableData.getOrThrow())
                }
                return None
            }
        }
    }

    func free(): Unit {
        unsafe {
            LibC.free(name)
            LibC.free(id)
            LibC.free(event)
            LibC.free(nickname)
            LibC.free(avatar)
            LibC.free(scalableData)
        }
    }
}

func mallocCString(str: String): Option<CString> {
    var cstr = CString(CPointer<UInt8>())
    try {
        cstr = unsafe { LibC.mallocCString(str) }
    } catch (_: Exception) {
        return None
    }
    return cstr
}
