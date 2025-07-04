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

package ohos.hidebug

import ohos.ffi.*
import ohos.base.*
import ohos.labels.*

/**
 * Get total native heap memory size
 *
 * @returns { UInt64 } Returns total native heap memory size.
 * @syscap SystemCapability.HiviewDFX.HiProfiler.HiDebug
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
]
public func getNativeHeapSize(): UInt64 {
    unsafe { FfiHidebugGetNativeHeapSize() }
}

/**
 * Get Native heap memory allocation size.
 * @returns { UInt64 } Returns native heap memory allocation size.
 * @syscap SystemCapability.HiviewDFX.HiProfiler.HiDebug
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
]
public func getNativeHeapAllocatedSize(): UInt64 {
    unsafe { FfiHidebugGetNativeHeapAllocatedSize() }
}

/**
 * Get Native heap memory free size
 *
 * @returns { UInt64 } Returns native heap memory free size.
 * @syscap SystemCapability.HiviewDFX.HiProfiler.HiDebug
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
]
public func getNativeHeapFreeSize(): UInt64 {
    unsafe { FfiHidebugGetNativeHeapFreeSize() }
}

/**
 * Get the virtual set size memory of the application process
 *
 * @returns { UInt64 } Returns application process virtual set size memory information.
 * @syscap SystemCapability.HiviewDFX.HiProfiler.HiDebug
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
]
public func getVss(): UInt64 {
    unsafe { FfiHidebugGetVss() }
}

/**
 * Get application process proportional set size memory information
 *
 * @returns { UInt64 } Returns application process proportional set size memory information.
 * @syscap SystemCapability.HiviewDFX.HiProfiler.HiDebug
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
]
public func getPss(): UInt64 {
    unsafe { FfiHidebugGetPss() }
}

/**
 * Obtains the size of the shared dirty memory of a process.
 *
 * @returns { UInt64 } Returns the size of the shared dirty memory.
 * @syscap SystemCapability.HiviewDFX.HiProfiler.HiDebug
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
]
public func getSharedDirty(): UInt64 {
    unsafe { FfiHidebugGetSharedDirty() }
}

/**
 * Obtains the size of the private dirty memory of a process.
 * @returns { UInt64 } Returns the size of the private dirty memory.
 * @syscap SystemCapability.HiviewDFX.HiProfiler.HiDebug
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
]
public func getPrivateDirty(): UInt64 {
    unsafe { FfiHidebugGetPrivateDirty() }
}

/**
 * Obtains the cpu usage percent of a process.
 *
 * @returns { Float64 } Returns the cpu usage of a process.
 * @syscap SystemCapability.HiviewDFX.HiProfiler.HiDebug
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
]
public func getCpuUsage(): Float64 {
    unsafe { FfiHidebugGetCpuUsage() }
}

/**
 * Get a debugging dump of a system service by service id.
 * It need dump permission.
 * This API can be called only by system application.
 *
 * @permission ohos.permission.DUMP
 * @param { Int32 } serviceid - Indicates the id of the service ability.
 * @param { Int32 } fd - The file descriptor.
 * @param { Array<String> } args - The args list of the system ability dump interface.
 * @throws {BusinessException} 401 - the parameter check failed, Possible causes:
 *                               1.the parameter type error
 *                               2.the args parameter is not String array
 * @throws {BusinessException} 11400101 - ServiceId invalid. The system ability does not exist.
 * @syscap SystemCapability.HiviewDFX.HiProfiler.HiDebug
 */
@!APILevel[
    19,
    permission: "ohos.permission.DUMP",
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
]
public func getServiceDump(serviceid: Int32, fd: Int32, args: Array<String>): Unit {
    let ptr = unsafe {
        cjArr2CArr<String, CString>(args, {cstr => LibC.mallocCString(cstr)}) {
            cstr => LibC.free(cstr)
        }
    }
    let cargs = CArrString(ptr, args.size)
    unsafe {
        let code = FfiHidebugGetServiceDump(serviceid, fd, cargs)
        cargs.free()
        if (code != SUCCESS_CODE) {
            throw BusinessException(getErrorCode(code), getErrMsg(code))
        }
    }
}

/**
 * Obtains the cpu usage of system.
 *
 * @returns { Float64 } Returns the cpu usage of system.
 * @throws { BusinessException } 11400104 - The status of the system CPU usage is abnormal.
 * @syscap SystemCapability.HiviewDFX.HiProfiler.HiDebug
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
]
public func getSystemCpuUsage(): Float64 {
    var code = 0i32
    let ret = unsafe { FfiHidebugGetSystemCpuUsage(inout code) }
    if (code != SUCCESS_CODE) {
        throw BusinessException(getErrorCode(code), getErrMsg(code))
    }
    ret
}

/**
 * Get the CPU usage of all threads in the application.
 *
 * @returns { Array<ThreadCpuUsage> } Returns the CPU usage of all threads in the application.
 * @syscap SystemCapability.HiviewDFX.HiProfiler.HiDebug
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
]
public func getAppThreadCpuUsage(): Array<ThreadCpuUsage> {
    var code = 0i32
    let arr = unsafe { FfiHidebugGetAppThreadCpuUsage(inout code) }
    if (code != SUCCESS_CODE) {
        throw BusinessException(getErrorCode(code), getErrMsg(code))
    }
    arr.toCjArrAndFree()
}

/**
 * Obtains the system memory size.
 *
 * @returns { SystemMemInfo } Returns system memory size.
 * @syscap SystemCapability.HiviewDFX.HiProfiler.HiDebug
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
]
public func getSystemMemInfo(): SystemMemInfo {
    var code = 0i32
    let info = unsafe { FfiHidebugGetSystemMemInfo(inout code) }
    if (code != SUCCESS_CODE) {
        throw BusinessException(getErrorCode(code), getErrMsg(code))
    }
    info.toSystemMemInfo()
}

/**
 * Obtains the memory information of application process.
 *
 * @returns { NativeMemInfo } Returns the native memory of a process.
 * @syscap SystemCapability.HiviewDFX.HiProfiler.HiDebug
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
]
public func getAppNativeMemInfo(): NativeMemInfo {
    var code = 0i32
    let info = unsafe { FfiHidebugGetAppNativeMemInfo(inout code) }
    if (code != SUCCESS_CODE) {
        throw BusinessException(getErrorCode(code), getErrMsg(code))
    }
    info.toNativeMemInfo()
}

/**
 * Obtains the memory limit of application process.
 *
 * @returns { MemoryLimit } Returns memory limit of application.
 * @syscap SystemCapability.HiviewDFX.HiProfiler.HiDebug
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
]
public func getAppMemoryLimit(): MemoryLimit {
    var code = 0i32
    let info = unsafe { FfiHidebugGetAppMemoryLimit(inout code) }
    if (code != SUCCESS_CODE) {
        throw BusinessException(getErrorCode(code), getErrMsg(code))
    }
    info.toMemoryLimit()
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
]
public enum TraceFlag {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    MAIN_THREAD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    ALL_THREADS
    | ...

    func getValue(): Int32 {
        match (this) {
            case MAIN_THREAD => 1
            case ALL_THREADS => 2
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

// trace tags
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
]
public class Tags {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const ABILITY_MANAGER: UInt64 = 1 << 31
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const ARKUI: UInt64 = 1 << 39
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const ARK: UInt64 = 1 << 47
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const BLUETOOTH: UInt64 = 1 << 60
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const COMMON_LIBRARY: UInt64 = 1 << 16
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const DISTRIBUTED_HARDWARE_DEVICE_MANAGER: UInt64 = 1 << 54
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const DISTRIBUTED_AUDIO: UInt64 = 1 << 27
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const DISTRIBUTED_CAMERA: UInt64 = 1 << 51
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const DISTRIBUTED_DATA: UInt64 = 1 << 36
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const DISTRIBUTED_HARDWARE_FRAMEWORK: UInt64 = 1 << 52
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const DISTRIBUTED_INPUT: UInt64 = 1 << 59
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const DISTRIBUTED_SCREEN: UInt64 = 1 << 50
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const DISTRIBUTED_SCHEDULER: UInt64 = 1 << 57
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const FFRT: UInt64 = 1 << 13
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const FILE_MANAGEMENT: UInt64 = 1 << 29
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const GLOBAL_RESOURCE_MANAGER: UInt64 = 1 << 53
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const GRAPHICS: UInt64 = 1 << 38
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const HDF: UInt64 = 1 << 18
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const MISC: UInt64 = 1 << 41
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const MULTIMODAL_INPUT: UInt64 = 1 << 42
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const NET: UInt64 = 1 << 23
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const NOTIFICATION: UInt64 = 1 << 40
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const NWEB: UInt64 = 1 << 24
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const OHOS: UInt64 = 1 << 30
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const POWER_MANAGER: UInt64 = 1 << 56
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const RPC: UInt64 = 1 << 46
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const SAMGR: UInt64 = 1 << 55
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const WINDOW_MANAGER: UInt64 = 1 << 48
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const AUDIO: UInt64 = 1 << 35
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const CAMERA: UInt64 = 1 << 32
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const IMAGE: UInt64 = 1 << 34
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
    ]
    public static const MEDIA: UInt64 = 1 << 33
}

/**
 * Start capture application trace.
 *
 * @param { Array<UInt64> } tags - Tag of trace.
 * @param { TraceFlag } flag - Trace flag.
 * @param { UInt32 } limitSize - Max size of trace file, in bytes, the max is 500MB.
 * @returns { String } Returns absolute path of the trace file.
 * @throws { BusinessException } 401 - Invalid argument, Possible causes:
 *                           1.The limit parameter is too small
 *                           2.The parameter is not within the enumeration type
 *                           3.The parameter type error or parameter order error
 * @throws { BusinessException } 11400102 - Capture trace already enabled.
 * @throws { BusinessException } 11400103 - No write permission on the file.
 * @throws { BusinessException } 11400104 - Abnormal trace status.
 * @syscap SystemCapability.HiviewDFX.HiProfiler.HiDebug
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
]
public func startAppTraceCapture(tags: Array<UInt64>, flag: TraceFlag, limitSize: UInt32): String {
    let ptr = unsafe { cjArr2CArr(tags) {i: UInt64 => i} }
    let cTags = CArrUnit(CPointer<Unit>(ptr), tags.size)
    var code = 0i32
    let ret = unsafe { FfiHidebugStartAppTraceCapture(cTags, flag.getValue(), limitSize, inout code) }
    unsafe { LibC.free(ptr) }
    if (code != SUCCESS_CODE) {
        throw BusinessException(getErrorCode(code), getErrMsg(code))
    }
    try {
        return ret.toString()
    } finally {
        unsafe { LibC.free(ret) }
    }
}

/**
 * Stop capture application trace.
 *
 * @throws { BusinessException } 11400104 - The status of the trace is abnormal
 * @throws { BusinessException } 11400105 - No capture trace running
 * @syscap SystemCapability.HiviewDFX.HiProfiler.HiDebug
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
]
public func stopAppTraceCapture(): Unit {
    let code = unsafe { FfiHidebugStopAppTraceCapture() }
    if (code != SUCCESS_CODE) {
        throw BusinessException(getErrorCode(code), getErrMsg(code))
    }
}

/**
 * Set the resource limitation of application.Please note that this public func is only valid
 * when the developer options switch of setting is turned on.
 *
 * @param { String } resType - resource type. It could be pss_memory、fd、or thread.
 * @param { Int32 } value - For different resource type, values could have different meaning:
 *                           1.For pss_memory, it means the baseline PSS memory size for the application,
 *                             system memory control will be triggered if exceed the value too much.
 *                           2.For fd, it means the maximum fd number can be opened.
 *                           3.For thread, it means the maximum thread number can be created.
 * @param { Bool } enableDebugLog - Whether to enable external debug log. Default is false, pls make sure set
 *                                      it as true only in gray release because collecting debug log will cost too much cpu or memory.
 * @throws { BusinessException } 401 - Invalid argument, Possible causes:
 *                           1.The limit parameter is too small
 *                           2.The parameter is not in the specified type
 *                           3.The parameter type error or parameter order error
 * @throws { BusinessException } 11400104 - Set limit failed due to remote exception
 * @syscap SystemCapability.HiviewDFX.HiProfiler.HiDebug
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
]
public func setAppResourceLimit(resType: String, value: Int32, enableDebugLog: Bool): Unit {
    try (cstr = unsafe { LibC.mallocCString(resType) }.asResource()) {
        let code = unsafe { FfiHidebugSetAppResourceLimit(cstr.value, value, enableDebugLog) }
        if (code != SUCCESS_CODE) {
            throw BusinessException(getErrorCode(code), getErrMsg(code))
        }
    }
}

/**
 * Judge if the application is in debugged state, support native layer debugged state.
 *
 * @returns { Bool } true if the application is debugged.
 * @syscap SystemCapability.HiviewDFX.HiProfiler.HiDebug
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
]
public func isDebugState(): Bool {
    unsafe { FfiHidebugIsDebugState() }
}
