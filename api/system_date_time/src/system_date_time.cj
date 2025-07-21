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

import ohos.ffi.{ RetCode, RetDataCString, RetDataI64 }
import ohos.labels.APILevel

foreign {
    func FfiOHOSSysDateTimeSetTime(time: Int64): RetCode

    func FfiOHOSSysDateTimegetCurrentTime(isNano: Bool): RetDataI64

    func FfiOHOSSysDateTimegetRealActiveTime(isNano: Bool): RetDataI64

    func FfiOHOSSysDateTimegetRealTime(isNano: Bool): RetDataI64

    func FfiOHOSSysDateTimeGetTime(isNano: Bool): RetDataI64

    func FfiOHOSSysDateTimeGetUptime(timeType: Int32, isNano: Bool): RetDataI64

    func FfiOHOSSysSetTimezone(Timezone: CString): RetCode

    func FfiOHOSSysGetTimezone(): RetDataCString
}

/**
 * System time and timezone.
 *
 * @relation declare interface Stat
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.Time"
]
public class SystemDateTime {
    /**
     * Obtains the number of milliseconds that have elapsed since the Unix epoch.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1.Incorrect parameter types.
     * @relation function getCurrentTime(isNano?: boolean): Promise<number>
     */
    @!APILevel[
        21,
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
     * Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1.Incorrect parameter types.
     * @relation function getRealActiveTime(isNano?: boolean): Promise<number>
     */
    @!APILevel[
        21,
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
     * Obtains the number of milliseconds elapsed since the system was booted, including deep sleep time.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1.Incorrect parameter types.
     * @relation function getRealTime(isNano?: boolean): Promise<number>
     */
    @!APILevel[
        21,
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
     * Obtains the number of timestamp that have elapsed since the Unix epoch.
     *
     * @relation function getTime(isNanoseconds?: boolean): number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Time"
    ]
    public static func getTime(isNano!: Bool = false): Int64 {
        let cValue = unsafe { FfiOHOSSysDateTimeGetTime(isNano) }
        throwIfNotSuccess(cValue.code)
        return cValue.data
    }

    /**
     * Obtains the number of milliseconds since the system has been running.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types;
     *     3. Parameter verification failed. This error code was added due to missing issues.
     * @relation function getUptime(timeType: TimeType, isNanoseconds?: boolean): number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Time"
    ]
    public static func getUptime(timeType: TimeType, isNano!: Bool = false): Int64 {
        let cValue = unsafe { FfiOHOSSysDateTimeGetUptime(timeType.getValue(), isNano) }
        throwIfNotSuccess(cValue.code)
        return cValue.data
    }

    /**
     * Obtains the number of milliseconds since the system has been running.
     *
     * @relation function getTimezoneSync(): string
     */
    @!APILevel[
        21,
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
