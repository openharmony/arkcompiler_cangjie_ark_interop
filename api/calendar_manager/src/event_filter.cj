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

package ohos.calendar_manager

import ohos.base.*
import ohos.ffi.*
import std.collection.*
import std.time.*
import ohos.encoding.json.*
import ohos.data_share_predicates.DataSharePredicates as DSPredicates
import ohos.labels.*

/**
 * Provides the abilities to retrive event filter.
 *
 * @relation class EventFilter
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.CalendarData"
]
public class EventFilter <: RemoteDataLite {
    protected init(id: Int64) {
        super(id)
        CALENDAR_MANAGER_LOG.info("[EventFilter] construct success")
    }

    ~init() {
        releaseFFIData(myDataId)
    }
    /**
     * Filter events by event id.
     *
     * @throws { IllegalMemoryException } - Out of memory.
     * @throws { IllegalArgumentException } - Illegal argument exception.
     * @throws { IllegalStateException } - 1.Illegal instance ptr. 2.the ptr is null.
     * @relation static filterById(ids: number[]): EventFilter;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public static func filterById(ids: Array<Int64>): EventFilter {
        var code = 0i32
        let idsCArr = CArrI64(unsafe { cjArr2CArr(ids) }, ids.size)
        var eventFilterId = unsafe { FfiOHOSEventFilterFilterById(idsCArr, inout code) }
        unsafe { LibC.free(idsCArr.head) }
        throwIfError("EventFilter.filterById", code)
        return EventFilter(eventFilterId)
    }
    /**
     * Filter events by event start time and end time.
     *
     * @throws { IllegalMemoryException } - Out of memory.
     * @throws { IllegalArgumentException } - Illegal argument exception.
     * @throws { IllegalStateException } - 1.Illegal instance ptr. 2.the ptr is null.
     * @relation static filterByTime(start: number, end: number): EventFilter;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public static func filterByTime(start: Int64, end: Int64): EventFilter {
        var code = 0i32
        var eventFilterId = unsafe { FfiOHOSEventFilterFilterByTime(start, end, inout code) }

        throwIfError("EventFilter.filterByTime", code)
        return EventFilter(eventFilterId)
    }
    /**
     * Filter events by event title.
     *
     * @throws { IllegalMemoryException } - Out of memory.
     * @throws { IllegalArgumentException } - Illegal argument exception.
     * @throws { IllegalStateException } - 1.Illegal instance ptr. 2.the ptr is null.
     * @relation static filterByTitle(title: string): EventFilter;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public static func filterByTitle(title: String): EventFilter {
        var code = 0i32
        var eventFilterId = 0
        unsafe {
            try (ctitle = LibC.mallocCString(title).asResource()) {
                eventFilterId = FfiOHOSEventFilterFilterByTitle(ctitle.value, inout code)
                throwIfError("EventFilter.filterByTitle", code)
            }
        }
        return EventFilter(eventFilterId)
    }
}
