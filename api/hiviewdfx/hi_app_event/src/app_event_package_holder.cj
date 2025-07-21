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

package ohos.hiviewdfx.hi_app_event

import ohos.ffi.*
import ohos.labels.*

import std.collection.*

foreign func FfiOHOSHiAppEventConstructor(cWatcherName: CString): Int64

foreign func FfiOHOSHiAppEventSetSize(id: Int64, size: Int32): Int32

foreign func FfiOHOSHiAppEventTakeNext(id: Int64): ReTakeNext

/**
* Defines a subscription data holder for processing event information.
*
* @relation class AppEventPackageHolder
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiAppEvent"
]
public class AppEventPackageHolder <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Constructs an AppEventPackageHolder instance. You can call addWatcher to add an event watcher, and then 
     * associate the AppEventPackageHolder instance with the watcher added in the application based on the watcher name.
     *
     * @relation constructor(watcherName: string)
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public static func constructor(watcherName: String): AppEventPackageHolder {
        var id: Int64
        unsafe {
            let cWatcherName = LibC.mallocCString(watcherName)
            id = FfiOHOSHiAppEventConstructor(cWatcherName)
            LibC.free(cWatcherName)
            if (id < 0) {
                throw Exception("Failed to create AppEventPackageHolder.")
            }
        }
        return AppEventPackageHolder(id)
    }

    /**
     * Sets the threshold for the data size of the event package obtained each time.
     *
     * @throws { Exception } 401 - Parameter error.
     * @throws { Exception } 11104001 - Invalid size value.
     * @relation setSize(size: number): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public func setSize(size!: Int32 = 512 * 1024): Unit {
        let ret = unsafe { FfiOHOSHiAppEventSetSize(getID(), size) }
        match {
            case ret != SUCCESS_CODE => throw Exception(ret.toString())
            case _ => return
        }
    }

    /**
     * Obtains the subscription event.
     * The system obtains the subscription event data based on the data size threshold specified by setSize or the 
     * number of data records specified by setRow. By default, one subscription event data record is obtained. When all 
     * subscription event data is obtained, null is returned.
     * When setRow and setSize are called at the same time, only setRow takes effect.
     *
     * @relation takeNext(): AppEventPackage
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiAppEvent"
    ]
    public func takeNext(): Option<AppEventPackage> {
        let ret = unsafe { FfiOHOSHiAppEventTakeNext(getID()) }
        match {
            case ret.status != SUCCESS_CODE => return None
            case _ =>
                let event = ret.event
                try {
                    var eventPackage = AppEventPackage(
                        event.packageId,
                        event.row,
                        event.size,
                        readArrStr(event.dataArr)
                    )
                    ret.event.free()
                    return Some(eventPackage)
                } catch (e: Exception) {
                    ret.event.free()
                    throw e
                }
        }
    }

    func readArrStr(cArr: CArrString): Array<String> {
        var result = ArrayList<String>()
        if (cArr.head.isNotNull()) {
            for (i in 0..cArr.size) {
                unsafe { result.add(cArr.head.read(i).toString()) }
            }
        } else {
            throw IllegalMemoryException("Out of Memory!")
        }
        return result.toArray()
    }
}
