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

package ohos.system_date_time

import ohos.ffi.*
import ohos.base.*
import ohos.labels.*

foreign func FfiOHOSSysDateTimeSetTime(time: Int64): RetCode

foreign func FfiOHOSSysDateTimegetCurrentTime(isNano: Bool): RetDataI64

foreign func FfiOHOSSysDateTimegetRealActiveTime(isNano: Bool): RetDataI64

foreign func FfiOHOSSysDateTimegetRealTime(isNano: Bool): RetDataI64

foreign func FfiOHOSSysDateTimeGetTime(isNano: Bool): RetDataI64

foreign func FfiOHOSSysDateTimeGetUptime(timeType: Int32, isNano: Bool): RetDataI64

foreign func FfiOHOSSysSetTimezone(Timezone: CString): RetCode

foreign func FfiOHOSSysGetTimezone(): RetDataCString

@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.Time"
]
public class SystemDateTime {
    /**
     *  @brief getCurrentTime(isNano: boolean, callback: AsyncCallback<number>): void
     */
    @!APILevel[
        12,
        deprecated: 12,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Time"
    ]
    public static func getCurrentTime(isNano!: Bool = false): Int64 {
        let cValue = unsafe { FfiOHOSSysDateTimegetCurrentTime(isNano) }
        throwIfNotSuccess(cValue.code)
        return cValue.data
    }

    /**
     *  @brief getRealActiveTime(isNano?: boolean): Promise<number>
     */
    @!APILevel[
        12,
        deprecated: 12,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Time"
    ]
    public static func getRealActiveTime(isNano!: Bool = false): Int64 {
        let cValue = unsafe { FfiOHOSSysDateTimegetRealActiveTime(isNano) }
        throwIfNotSuccess(cValue.code)
        return cValue.data
    }

    /**
     *  @brief getRealTime(isNano?: boolean): Promise<number>
     */
    @!APILevel[
        12,
        deprecated: 12,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Time"
    ]
    public static func getRealTime(isNano!: Bool = false): Int64 {
        let cValue = unsafe { FfiOHOSSysDateTimegetRealTime(isNano) }
        throwIfNotSuccess(cValue.code)
        return cValue.data
    }

    /**
     *  @brief getTime(isNanoseconds?: boolean): number
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Time"
    ]
    public static func getTime(isNano!: Bool = false): Int64 {
        let cValue = unsafe { FfiOHOSSysDateTimeGetTime(isNano) }
        throwIfNotSuccess(cValue.code)
        return cValue.data
    }

    /**
     *  @brief getUptime(timeType: TimeType, isNanoseconds?: boolean): number
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Time"
    ]
    public static func getUptime(timeType: TimeType, isNano!: Bool = false): Int64 {
        let cValue = unsafe { FfiOHOSSysDateTimeGetUptime(timeType.getValue(), isNano) }
        throwIfNotSuccess(cValue.code)
        return cValue.data
    }

    /**
     *  @brief getTimezone(callback: AsyncCallback<string>): void
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Time"
    ]
    public static func getTimezone(): String {
        let ret = unsafe { FfiOHOSSysGetTimezone() }
        throwIfNotSuccess(ret.code)
        let time = ret.data.toString()
        unsafe { LibC.free(ret.data) }
        return time
    }
}
