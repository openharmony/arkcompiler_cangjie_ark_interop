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

package ohos.common_event_manager

import ohos.ffi.*
import ohos.base.*
import std.collection.*
import ohos.labels.*

foreign {
    func CJ_SetPermission(id: Int64, value: CString): Unit

    func CJ_SetDeviceId(id: Int64, value: CString): Unit

    func CJ_SetUserId(id: Int64, value: Int32): Unit

    func CJ_SetPriority(id: Int64, value: Int32): Unit

    func CJ_SetBundleName(id: Int64, value: CString): Unit

    func CJ_GetPermission(id: Int64): CString

    func CJ_GetDeviceId(id: Int64): CString

    func CJ_GetUserId(id: Int64): Int32

    func CJ_GetPriority(id: Int64): Int32

    func CJ_GetBundleName(id: Int64): CString

    func CJ_GetEvents(id: Int64): CArrString
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.CommonEvent"
]
public class CommonEventSubscribeInfo <: RemoteDataLite {
    var hasPermission: Bool = false
    var hasDeviceId: Bool = false
    var hasUserId: Bool = false
    var hasPriority: Bool = false
    var hasBundleName: Bool = false

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public init(
        events: Array<String>,
        publisherPermission!: ?String = None,
        publisherDeviceId!: ?String = None,
        userId!: ?Int32 = None,
        priority!: ?Int32 = None,
        publisherBundleName!: ?String = None
    ) {
        super(getInfoId(events))
        if (let Some(v) <- userId) {
            hasUserId = true
            unsafe { CJ_SetUserId(getID(), v) }
        }
        if (let Some(v) <- priority) {
            hasPriority = true
            let value = if (v > 1000) {
                Int32(1000)
            } else if (v < -100) {
                Int32(-100)
            } else {
                v
            }
            unsafe { CJ_SetPriority(getID(), value) }
        }
        this.setValue(publisherPermission, publisherDeviceId, publisherBundleName)
    }

    protected init(id: Int64) {
        super(id)
        hasPermission = true
        hasDeviceId = true
        hasUserId = true
        hasPriority = true
        hasBundleName = true
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public prop events: Array<String> {
        get() {
            unsafe {
                let retData = CJ_GetEvents(getID())
                let ptr = retData.head
                let size = retData.size
                let ret = Array<String>(
                    size,
                    {
                        i =>
                        let cString = ptr.read(i)
                        let data = cString.toString()
                        LibC.free(cString)
                        data
                    }
                )
                LibC.free<CString>(ptr)
                return ret
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public prop publisherPermission: ?String {
        get() {
            if (hasPermission) {
                unsafe {
                    let cValue = CJ_GetPermission(getID())
                    let permission = cValue.toString()
                    LibC.free(cValue)
                    return permission
                }
            }
            return None
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public prop publisherDeviceId: ?String {
        get() {
            if (hasDeviceId) {
                unsafe {
                    let cValue = CJ_GetDeviceId(getID())
                    let deviceId = cValue.toString()
                    LibC.free(cValue)
                    return deviceId
                }
            }
            return None
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public prop userId: ?Int32 {
        get() {
            if (hasUserId) {
                return unsafe { CJ_GetUserId(getID()) }
            }
            return None
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public prop priority: ?Int32 {
        get() {
            if (hasPriority) {
                return unsafe { CJ_GetPriority(getID()) }
            }
            return None
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public prop publisherBundleName: ?String {
        get() {
            if (hasBundleName) {
                unsafe {
                    let cValue = CJ_GetBundleName(getID())
                    let bundleName = cValue.toString()
                    LibC.free(cValue)
                    return bundleName
                }
            }
            return None
        }
    }

    func setValue(
        publisherPermission: ?String,
        publisherDeviceId: ?String,
        publisherBundleName: ?String
    ) {
        var permission = CString(CPointer<UInt8>())
        var deviceId = CString(CPointer<UInt8>())
        var bundleName = CString(CPointer<UInt8>())
        try {
            if (let Some(v) <- publisherPermission) {
                hasPermission = true
                unsafe {
                    permission = LibC.mallocCString(v)
                    CJ_SetPermission(getID(), permission)
                }
            }
            if (let Some(v) <- publisherDeviceId) {
                hasDeviceId = true
                unsafe {
                    deviceId = LibC.mallocCString(v)
                    CJ_SetDeviceId(getID(), deviceId)
                }
            }
            if (let Some(v) <- publisherBundleName) {
                hasBundleName = true
                unsafe {
                    bundleName = LibC.mallocCString(v)
                    CJ_SetBundleName(getID(), bundleName)
                }
            }
        } finally {
            unsafe {
                LibC.free(permission)
                LibC.free(deviceId)
                LibC.free(bundleName)
            }
        }
    }
}

func getInfoId(events: Array<String>): Int64 {
    unsafe {
        let size = events.size
        let cEvents = safeMalloc<CString>(count: size)
        for (i in 0..size) {
            try {
                let ptr = LibC.mallocCString(events[i])
                cEvents.write(i, ptr)
            } catch (e: Exception) {
                freeCpCString(cEvents, i)
                LibC.free(cEvents)
                throw e
            }
        }
        let eventArr = CArrString(cEvents, size)
        let id = CJ_CreateCommonEventSubscribeInfo(eventArr)
        eventArr.free()
        return id
    }
}
