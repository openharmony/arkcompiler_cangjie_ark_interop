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

package ohos.hiappevent

import ohos.ffi.*
import std.collection.*
import ohos.base.*

@C
struct CConfigOption {
    var disable: Bool
    var maxStorage: CString
    init(config: ConfigOption) {
        this.disable = config.disable
        this.maxStorage = unsafe { LibC.mallocCString(config.maxStorage) }
    }

    func free(): Unit {
        unsafe {
            LibC.free(this.maxStorage)
        }
    }
}

func getValue(value: ValueType): (UInt8, CPointer<Unit>, Int64) {
    unsafe {
        match (value) {
            case INT(v) =>
                let ptr = safeMalloc<Int32>()
                ptr.write(v)
                return (0, CPointer<Unit>(ptr), 1)
            case FLOAT(v) =>
                let ptr = safeMalloc<Float64>(count: 1)
                ptr.write(v)
                return (1, CPointer<Unit>(ptr), 1)
            case STRING(v) =>
                let ptr = LibC.mallocCString(v).getChars()
                return (2, CPointer<Unit>(ptr), 1)
            case BOOL(v) =>
                let ptr = safeMalloc<Bool>(count: 1)
                ptr.write(v)
                return (3, CPointer<Unit>(ptr), 1)
            case ARRAYI32(v) =>
                let constructor = {p: Int32 => p}
                let ptr = cjArr2CArr<Int32, Int32>(v, constructor)
                return (4, CPointer<Unit>(ptr), v.size)
            case ARRAYF64(v) =>
                let constructor = {p: Float64 => p}
                let ptr = cjArr2CArr<Float64, Float64>(v, constructor)
                return (5, CPointer<Unit>(ptr), v.size)
            case ARRSTRING(v) =>
                let ptr = cjArr2CArr<String, CString>(v, FUNCTION_S2CS, FUNCTION_CS_FREE)
                return (6, CPointer<Unit>(ptr), v.size)
            case ARRAYBOOL(v) =>
                let constructor = {p: Bool => p}
                let ptr = cjArr2CArr<Bool, Bool>(v, constructor)
                return (7, CPointer<Unit>(ptr), v.size)
            case INT64(v) =>
                let ptr = safeMalloc<Int64>()
                ptr.write(v)
                return (8, CPointer<Unit>(ptr), 1)
            case ARRAYINT64(v) =>
                let constructor = {p: Int64 => p}
                let ptr = cjArr2CArr<Int64, Int64>(v, constructor)
                return (9, CPointer<Unit>(ptr), v.size)
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@C
struct CParameters {
    let valueType: UInt8
    let keyName: CString
    let value: CPointer<Unit>
    let size: Int64

    init(p: Parameters) {
        this.keyName = unsafe { LibC.mallocCString(p.key) }
        try {
            (valueType, this.value, this.size) = getValue(p.value)
        } catch (e: Exception) {
            unsafe { LibC.free(this.keyName) }
            throw e
        }
    }

    func free(): Unit {
        unsafe {
            if (valueType == 6) {
                let data = (CPointer<CString>(value))
                for (i in 0..size) {
                    LibC.free(data.read(i))
                }
                LibC.free<CString>(data)
            } else {
                LibC.free(value)
            }
            LibC.free(keyName)
        }
    }
}

@C
struct CArrParameters {
    CArrParameters(
        let head: CPointer<CParameters>,
        let size: Int64
    ) {}
}

@C
struct CAppEventInfo {
    CAppEventInfo(
        var domain: CString,
        var name: CString,
        var event: UInt32,
        var params: CArrParameters
    ) {}

    func free(): Unit {
        unsafe {
            LibC.free(domain)
            LibC.free(name)
            if (params.head.isNotNull()) {
                for (i in 0..params.size) {
                    params.head.read(i).free()
                }
                LibC.free<CParameters>(params.head)
            }
        }
    }
}

@C
struct CAppEventReportConfig {
    let domain: CString
    let name: CString
    let isRealTime: Bool

    CAppEventReportConfig(config: AppEventReportConfig) {
        this.domain = unsafe { LibC.mallocCString(config.domain) }
        try {
            this.name = unsafe { LibC.mallocCString(config.name) }
        } catch (e: Exception) {
            unsafe { LibC.free(this.domain) }
            throw e
        }
        this.isRealTime = config.isRealTime
    }

    func free(): Unit {
        unsafe {
            LibC.free(domain)
            LibC.free(name)
        }
    }
}

@C
struct CArrAppEventReportConfig {
    CArrAppEventReportConfig(
        let head: CPointer<CAppEventReportConfig>,
        let size: Int64
    ) {}
}

@C
struct CArrUInt32 {
    CArrUInt32(
        let head: CPointer<UInt32>,
        let size: Int64
    ) {}

    func free(): Unit {
        unsafe {
            LibC.free<UInt32>(head)
        }
    }
}

@C
struct CProcessor {
    var name: CString
    var debugMode: Bool
    var routeInfo: CString
    var appId: CString
    var onStartReport: Bool
    var onBackgroundReport: Bool
    var periodReport: Int64
    var batchReport: Int64
    var userIds: CArrString
    var userProperties: CArrString
    var eventConfigs: CArrAppEventReportConfig

    CProcessor(processor: Processor) {
        name = CString(CPointer())
        routeInfo = CString(CPointer())
        debugMode = processor.debugMode
        appId = CString(CPointer())
        onStartReport = processor.onStartReport
        onBackgroundReport = processor.onBackgroundReport
        periodReport = processor.periodReport
        batchReport = processor.batchReport
        userIds = CArrString(CPointer<CString>(), 0)
        userProperties = CArrString(CPointer<CString>(), 0)
        eventConfigs = CArrAppEventReportConfig(CPointer<CAppEventReportConfig>(), 0)
        unsafe {
            try {
                name = LibC.mallocCString(processor.name)
                routeInfo = LibC.mallocCString(processor.routeInfo)
                appId = LibC.mallocCString(processor.appId)
                userIds = toArrayCString(processor.userIds)
                userProperties = toArrayCString(processor.userProperties)
                let constructor = {p: AppEventReportConfig => CAppEventReportConfig(p)}
                let destructor = {p: CAppEventReportConfig => p.free()}
                let ptr = cjArr2CArr<AppEventReportConfig, CAppEventReportConfig>(processor.eventConfigs, constructor,
                    destructor)
                eventConfigs = CArrAppEventReportConfig(ptr, processor.eventConfigs.size)
            } catch (e: Exception) {
                free()
                throw e
            }
        }
    }

    func free(): Unit {
        unsafe {
            LibC.free(name)
            LibC.free(routeInfo)
            LibC.free(appId)

            userIds.free()
            userProperties.free()
            if (eventConfigs.head.isNotNull()) {
                for (i in 0..eventConfigs.size) {
                    eventConfigs.head.read(i).free()
                }
                LibC.free<CAppEventReportConfig>(eventConfigs.head)
            }
        }
    }
}

@C
struct RetAppEventPackage {
    private RetAppEventPackage(
        var packageId: Int32,
        var row: Int32,
        var size: Int32,
        var dataArr: CArrString
    ) {}

    func free(): Unit {
        unsafe { freeArrCString(dataArr) }
    }
}

@C
struct ReTakeNext {
    ReTakeNext(
        let status: Int32,
        let event: RetAppEventPackage
    ) {}
}

@C
struct RetAppEventFilter {
    var domain: CString
    var eventTypes: CArrUInt32
    var names: CArrString

    init(appEventFilter: AppEventFilter) {
        domain = unsafe { LibC.mallocCString(appEventFilter.domain) }

        try {
            let typeSize = appEventFilter.eventTypes.size
            let typeArr: CPointer<UInt32> = safeMalloc<UInt32>(count: typeSize)
            for (i in 0..typeSize) {
                unsafe {
                    typeArr.write(i, appEventFilter.eventTypes[i].value)
                }
            }
            this.eventTypes = CArrUInt32(typeArr, typeSize)
        } catch (e: Exception) {
            unsafe { LibC.free(this.domain) }
            throw e
        }

        try {
            let arrSize = appEventFilter.names.size
            let arr: CPointer<CString> = safeMalloc<CString>(count: arrSize)
            for (i in 0..arrSize) {
                unsafe {
                    try {
                        arr.write(i, LibC.mallocCString(appEventFilter.names[i]))
                    } catch (e: Exception) {
                        for (j in 0..i) {
                            LibC.free(arr.read(j))
                        }
                        LibC.free<CString>(arr)
                        throw e
                    }
                }
            }
            this.names = CArrString(arr, arrSize)
        } catch (e: Exception) {
            unsafe { LibC.free(this.domain) }
            this.eventTypes.free()
            throw e
        }
    }

    func free(): Unit {
        unsafe {
            if (this.names.head.isNotNull()) {
                for (i in 0..names.size) {
                    LibC.free(names.head.read(i))
                }
                LibC.free(this.names.head)
            }
            LibC.free(this.domain)
            this.eventTypes.free()
        }
    }
}

@C
struct CArrAppEventFilter {
    CArrAppEventFilter(
        let head: CPointer<RetAppEventFilter>,
        let size: Int64
    ) {}
}

@C
struct RetTriggerCondition {
    var row: Int32
    var size: Int32
    var timeOut: Int32

    init(triggerCondition: TriggerCondition) {
        this.row = triggerCondition.row
        this.size = triggerCondition.size
        this.timeOut = triggerCondition.timeOut
    }
}

@C
struct CArrAppEventInfo {
    CArrAppEventInfo(
        let head: CPointer<CAppEventInfo>,
        let size: Int64
    ) {}
}

@C
struct CAppEventGroup {
    CAppEventGroup(
        var name: CString,
        var appEventInfos: CArrAppEventInfo
    ) {}

    func free(): Unit {
        unsafe {
            LibC.free(this.name)
            if (this.appEventInfos.head.isNotNull()) {
                for (i in 0..this.appEventInfos.size) {
                    this.appEventInfos.head.read(i).free()
                }
                LibC.free<CAppEventInfo>(this.appEventInfos.head)
            }
        }
    }
}

@C
struct CArrCAppEventGroup {
    CArrCAppEventGroup(
        let head: CPointer<CAppEventGroup>,
        let size: Int64
    ) {}
}

@C
struct RetWatcher {
    var name: CString
    var triggerCondition: RetTriggerCondition
    var appEventFilters: CArrAppEventFilter
    var onTrigger: Int64
    var onReceive: Int64

    init(watcher: Watcher) {
        this.name = unsafe { LibC.mallocCString(watcher.name) }
        this.triggerCondition = RetTriggerCondition(watcher.triggerCondition)

        try {
            let arrSize = watcher.appEventFilters.size
            let arr: CPointer<RetAppEventFilter> = safeMalloc<RetAppEventFilter>(count: arrSize)
            for (i in 0..arrSize) {
                try {
                    unsafe { arr.write(i, RetAppEventFilter(watcher.appEventFilters[i])) }
                } catch (e: Exception) {
                    for (j in 0..i) {
                        unsafe { arr.read(j).free() }
                    }
                    unsafe { LibC.free<RetAppEventFilter>(arr) }
                    throw e
                }
            }
            this.appEventFilters = CArrAppEventFilter(arr, arrSize)
        } catch (e: Exception) {
            unsafe { LibC.free(this.name) }
            throw e
        }

        if (let Some(v) <- watcher.onTrigger) {
            let wrapper1 = {
                curRow: Int32, curSize: Int32, holder: Int64 => v(curRow, curSize, AppEventPackageHolder(holder))
            }
            let lambdaData1 = Callback3Param<Int32, Int32, Int64, Unit>(wrapper1)
            this.onTrigger = lambdaData1.getID()
        } else {
            this.onTrigger = -1
        }

        if (let Some(v) <- watcher.onReceive) {
            let wrapper2 = {
                domain: CString, appEventGroups: CArrCAppEventGroup =>
                let cjdomain = domain.toString()
                let cjgroups = readCArrCAppEventGroup(appEventGroups)
                unsafe { LibC.free(domain) }
                freeCArrGroup(appEventGroups)
                v(cjdomain, cjgroups)
            }
            let lambdaData2 = Callback2Param<CString, CArrCAppEventGroup, Unit>(wrapper2)
            this.onReceive = lambdaData2.getID()
        } else {
            this.onReceive = -1
        }
    }

    func free(): Unit {
        unsafe {
            LibC.free(this.name)
            if (this.appEventFilters.head.isNotNull()) {
                for (i in 0..this.appEventFilters.size) {
                    this.appEventFilters.head.read(i).free()
                }
                LibC.free<RetAppEventFilter>(this.appEventFilters.head)
            }
        }
    }
}

func freeCArrGroup(appEventGroups: CArrCAppEventGroup): Unit {
    if (appEventGroups.head.isNotNull()) {
        for (i in 0..appEventGroups.size) {
            unsafe { appEventGroups.head.read(i).free() }
        }
        unsafe { LibC.free<CAppEventGroup>(appEventGroups.head) }
    }
}