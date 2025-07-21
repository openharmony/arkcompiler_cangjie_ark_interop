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

package ohos.hilog

import ohos.labels.APILevel

/**
 * Provides class to generate logs.
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiLog"
]
public class HilogChannel {
    static let TYPE_APP: UInt32 = 0
    static let TYPE_INIT: UInt32 = 1
    static let TYPE_CORE: UInt32 = 3
    static let TYPE_KMSG: UInt32 = 4
    static let LEVEL_DEBUG: UInt32 = 3
    static let LEVEL_INFO: UInt32 = 4
    static let LEVEL_WARN: UInt32 = 5
    static let LEVEL_ERROR: UInt32 = 6
    static let LEVEL_FATAL: UInt32 = 7

    private let type_: UInt32
    private let domain_: UInt32
    private let tag_: CString

    /**
     * HilogChannel constructor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiLog"
    ]
    public init(ty: UInt32, domain: UInt32, tag: String) {
        type_ = ty
        domain_ = domain
        unsafe { tag_ = LibC.mallocCString(tag) }
    }

    ~init() {
        unsafe { LibC.free(tag_) }
    }

    /**
     * Checks whether logs of the specified tag, and level can be printed.
     */ 
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiLog"
    ]
    public func isLoggable(level: UInt32): Bool {
        unsafe { HiLogIsLoggable(domain_, tag_, level) }
    }

    /**
     * Outputs debug-level logs.
     */ 
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiLog"
    ]
    public func debug<T>(message: T): Unit where T <: ToString {
        dolog(message.toString(), LEVEL_DEBUG)
    }

    /**
     * Outputs info-level logs.
     */ 
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiLog"
    ]
    public func info<T>(message: T): Unit where T <: ToString {
        dolog(message.toString(), LEVEL_INFO)
    }

    /**
     * Outputs warning-level logs.
     */ 
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiLog"
    ]
    public func warn<T>(message: T): Unit where T <: ToString {
        dolog(message.toString(), LEVEL_WARN)
    }

    /**
     * Outputs error-level logs.
     */ 
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiLog"
    ]
    public func error<T>(message: T): Unit where T <: ToString {
        dolog(message.toString(), LEVEL_ERROR)
    }

    /**
     * Outputs fatal-level logs.
     */ 
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiLog"
    ]
    public func fatal<T>(message: T): Unit where T <: ToString {
        dolog(message.toString(), LEVEL_FATAL)
    }

    private func dolog(message: String, level: UInt32) {
        if (isLoggable(level)) {
            unsafe {
                let cstr = LibC.mallocCString(message)
                HiLogPrint(type_, level, domain_, tag_, Hilog.STANDARD_FORMAT, cstr)
                LibC.free(cstr)
            }
        }
    }
}
