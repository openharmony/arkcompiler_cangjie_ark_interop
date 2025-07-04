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

package ohos.app.form.formBindingData

import ohos.base.*
import ohos.ffi.*

foreign func FfiFormBindingDataCreateFormBindingData(obj: CString): RetFormBindingData

@C
protected struct CProxyData {
    CProxyData(
        var key: CString,
        var subscriberId: CString
    ) {}

    unsafe func toProxyData(): ProxyData {
        return ProxyData(key.toString(), subscriberId: subscriberId.toString())
    }

    func free() {
        unsafe {
            LibC.free(key)
            LibC.free(subscriberId)
        }
    }
}

@C
protected struct CArrProxyData {
    var head: CPointer<CProxyData> = CPointer<CProxyData>()
    var size: Int64 = 0

    init(head: CPointer<CProxyData>, size: Int64) {
        this.head = head
        this.size = size
    }

    func toArrayProxyData() {
        unsafe {
            cArr2cjArr<CProxyData, ProxyData>(size, head, {
                item => item.toProxyData()
            })
        }
    }

    func free(): Unit {
        if (this.head.isNotNull()) {
            unsafe {
                for (i in 0..size) {
                    this.head.read(i).free()
                }
                LibC.free<CProxyData>(head)
            }
        }
    }
}

@C
protected struct CFormBindingData {
    CFormBindingData(
        var data: CString,
        var proxies: CArrProxyData
    ) {}

    unsafe func toFormBindingData(): FormBindingData {
        FormBindingData(data.toString(), proxies: proxies.toArrayProxyData())
    }

    protected unsafe static func fromFormBindingData(formBindingData: FormBindingData): CFormBindingData {
        let data = LibC.mallocCString(formBindingData.data)
        let proxiesArray = formBindingData.proxies ?? Array<ProxyData>()
        let proxies = cjArr2CArr<ProxyData, CProxyData>(
            proxiesArray,
            {
                p: ProxyData =>
                let cKey = LibC.mallocCString(p.key)
                let subscriberId = p.subscriberId ?? ""
                let cSubscriberId = try {
                    LibC.mallocCString(subscriberId)
                } catch (e: Exception) {
                    LibC.free(cKey)
                    throw e
                }
                CProxyData(cKey, cSubscriberId)
            },
            {
                p: CProxyData =>
                LibC.free(p.key)
                LibC.free(p.subscriberId)
            },
            {
                => LibC.free(data)
            }
        )
        return CFormBindingData(data, CArrProxyData(proxies, proxiesArray.size))
    }

    protected func free() {
        unsafe {
            LibC.free(data)
            proxies.free()
        }
    }
}

@C
struct RetFormBindingData {
    RetFormBindingData(
        let errCode: Int32,
        let cFormBindingData: CFormBindingData
    ) {}

    func free() {
        unsafe {
            cFormBindingData.free()
        }
    }
}
