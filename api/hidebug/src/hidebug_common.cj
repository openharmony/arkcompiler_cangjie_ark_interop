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
 * Application CPU usage of thread.
 *
 * @class ThreadCpuUsage
 * @syscap SystemCapability.HiviewDFX.HiProfiler.HiDebug
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
]
public class ThreadCpuUsage {
    ThreadCpuUsage(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
        ]
        public let threadId: UInt32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
        ]
        public let cpuUsage: Float64
    ) {}
}

/**
 * System memory information
 *
 * @class SystemMemInfo
 * @syscap SystemCapability.HiviewDFX.HiProfiler.HiDebug
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
]
public class SystemMemInfo {
    SystemMemInfo(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
        ]
        public let totalMem: UInt64,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
        ]
        public let freeMem: UInt64,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
        ]
        public let availableMem: UInt64
    ) {}
}

/**
 * Application process native memory information.
 *
 * @class NativeMemInfo
 * @syscap SystemCapability.HiviewDFX.HiProfiler.HiDebug
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
]
public class NativeMemInfo {
    NativeMemInfo(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
        ]
        public let pss: UInt64,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
        ]
        public let vss: UInt64,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
        ]
        public let rss: UInt64,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
        ]
        public let sharedDirty: UInt64,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
        ]
        public let privateDirty: UInt64,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
        ]
        public let sharedClean: UInt64,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
        ]
        public let privateClean: UInt64
    ) {}
}

/**
 * Application process memory limit
 *
 * @class MemoryLimit
 * @syscap SystemCapability.HiviewDFX.HiProfiler.HiDebug
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
]
public class MemoryLimit {
    MemoryLimit(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
        ]
        public let rssLimit: UInt64,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.HiviewDFX.HiProfiler.HiDebug"
        ]
        public let vssLimit: UInt64
    ) {}
}
