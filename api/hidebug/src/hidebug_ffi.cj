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

foreign {
    func FfiHidebugGetNativeHeapSize(): UInt64

    func FfiHidebugGetNativeHeapAllocatedSize(): UInt64

    func FfiHidebugGetNativeHeapFreeSize(): UInt64

    func FfiHidebugGetVss(): UInt64

    func FfiHidebugGetPss(): UInt64

    func FfiHidebugGetSharedDirty(): UInt64

    func FfiHidebugGetPrivateDirty(): UInt64

    func FfiHidebugGetCpuUsage(): Float64

    func FfiHidebugGetSystemCpuUsage(code: CPointer<Int32>): Float64

    func FfiHidebugGetAppThreadCpuUsage(code: CPointer<Int32>): ThreadCpuUsageArr

    func FfiHidebugGetSystemMemInfo(code: CPointer<Int32>): CSystemMemInfo

    func FfiHidebugGetAppNativeMemInfo(code: CPointer<Int32>): CNativeMemInfo

    func FfiHidebugGetAppMemoryLimit(code: CPointer<Int32>): CMemoryLimit

    func FfiHidebugGetServiceDump(serviceid: Int32, fd: Int32, args: CArrString): Int32

    func FfiHidebugStartAppTraceCapture(cTags: CArrUnit, flag: Int32, limitSize: UInt32, code: CPointer<Int32>): CString

    func FfiHidebugStopAppTraceCapture(): Int32

    func FfiHidebugSetAppResourceLimit(cstr: CString, value: Int32, enableDebugLog: Bool): Int32

    func FfiHidebugIsDebugState(): Bool
}

@C
struct CThreadCpuUsage {
    CThreadCpuUsage(
        let threadId: UInt32,
        let cpuUsage: Float64
    ) {}

    func toThreadCpuUsage(): ThreadCpuUsage {
        ThreadCpuUsage(threadId, cpuUsage)
    }
}

@C
struct ThreadCpuUsageArr {
    ThreadCpuUsageArr(
        let head: CPointer<CThreadCpuUsage>,
        let size: Int64
    ) {}

    func toCjArrAndFree(): Array<ThreadCpuUsage> {
        let arr: Array<ThreadCpuUsage>
        unsafe {
            arr = cArr2cjArr(size, head) {
                usage: CThreadCpuUsage => usage.toThreadCpuUsage()
            }
            LibC.free(head)
        }
        arr
    }
}

@C
struct CSystemMemInfo {
    CSystemMemInfo(
        let totalMem: UInt64,
        let freeMem: UInt64,
        let availableMem: UInt64
    ) {}

    func toSystemMemInfo(): SystemMemInfo {
        SystemMemInfo(totalMem, freeMem, availableMem)
    }
}

@C
struct CNativeMemInfo {
    CNativeMemInfo(
        let pss: UInt64,
        let vss: UInt64,
        let rss: UInt64,
        let sharedDirty: UInt64,
        let privateDirty: UInt64,
        let sharedClean: UInt64,
        let privateClean: UInt64
    ) {}

    func toNativeMemInfo(): NativeMemInfo {
        NativeMemInfo(pss, vss, rss, sharedDirty, privateDirty, sharedClean, privateClean)
    }
}

@C
struct CMemoryLimit {
    CMemoryLimit(
        let rssLimit: UInt64,
        let vssLimit: UInt64
    ) {}

    func toMemoryLimit(): MemoryLimit {
        MemoryLimit(rssLimit, vssLimit)
    }
}
