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

foreign func HiLogIsLoggable(domain: UInt32, tag: CString, level: UInt32): Bool

foreign func HiLogPrint(ty: UInt32, level: UInt32, domain: UInt32, tag: CString, format: CString, content: CString): Unit

/**
 * Log level define
 *
 * @relation enum LogLevel
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiLog"
]
public enum LogLevel {
    /**
     * DEBUG Log level define
     *
     * @relation DEBUG = 3
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiLog"
    ]
    Debug
    /**
     * INFO Log level define
     *
     * @relation INFO = 4
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiLog"
    ]
    Info
    /**
     * WARN Log level define
     *
     * @relation WARN = 5
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiLog"
    ]
    Warn
    /**
     * ERROR Log level define
     *
     * @relation ERROR = 6
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiLog"
    ]
    Error
    /**
     * FATAL Log level define
     *
     * @relation FATAL = 7
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiLog"
    ]
    Fatal
    | ...

    func getValue(): UInt32 {
        match (this) {
            case Debug => 3
            case Info => 4
            case Warn => 5
            case Error => 6
            case Fatal => 7
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

let DEFAULT_LOG_TYPE: UInt32 = 0

/**
 * Provides interfaces to generate system logs.
 *
 * @relation declare namespace hilog
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiLog"
]
public class Hilog {
    static let STANDARD_FORMAT = unsafe { LibC.mallocCString("%{public}s") }
    static init() {
        Thread.handleUncaughtExceptionBy {
            _: Thread, exception: Exception =>
            Hilog.error(0, "exception", "An exception has occurred:")
            Hilog.error(0, "exception", exception.toString())
            var traceElementArray = exception.getStackTrace()
            for (element in traceElementArray) {
                Hilog.error(0, "exception",
                    "\t at ${element.declaringClass}.${element.methodName}(${element.fileName}:${element.lineNumber})")
            }
        }
    }

    /**
     * Checks whether logs of the specified tag, and level can be printed.
     *
     * @relation function isLoggable(domain: number, tag: string, level: LogLevel): boolean
     */ 
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiLog"
    ]
    public static func isLoggable(domain: UInt32, tag: String, level: LogLevel): Bool {
        unsafe {
            let cstr = LibC.mallocCString(tag)
            let result = HiLogIsLoggable(domain, cstr, level.getValue())
            LibC.free(cstr)
            return result
        }
    }

    /**
     * Outputs debug-level logs.
     *
     * @relation function debug(domain: number, tag: string, format: string, ...args: (Object | undefined | null)[]): void
     */ 
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiLog"
    ]
    public static func debug(domain: UInt32, tag: String, format: String): Unit {
        unsafe {
            try (
                cTag = LibC.mallocCString(tag).asResource(),
                cFormat = LibC.mallocCString(format).asResource()
            ) {
                HiLogPrint(DEFAULT_LOG_TYPE, LogLevel.Debug.getValue(), domain, cTag.value, STANDARD_FORMAT,
                    cFormat.value)
            }
        }
    }

    /**
     * Outputs info-level logs.
     *
     * @relation function info(domain: number, tag: string, format: string, ...args: (Object | undefined | null)[]): void
     */ 
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiLog"
    ]
    public static func info(domain: UInt32, tag: String, format: String): Unit {
        unsafe {
            try (
                cTag = LibC.mallocCString(tag).asResource(),
                cFormat = LibC.mallocCString(format).asResource()
            ) {
                HiLogPrint(
                    DEFAULT_LOG_TYPE,
                    LogLevel.Info.getValue(),
                    domain,
                    cTag.value,
                    STANDARD_FORMAT,
                    cFormat.value
                )
            }
        }
    }

    /**
     * Outputs warning-level logs.
     *
     * @relation function warn(domain: number, tag: string, format: string, ...args: (Object | undefined | null)[]): void
     */ 
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiLog"
    ]
    public static func warn(domain: UInt32, tag: String, format: String): Unit {
        unsafe {
            try (
                cTag = LibC.mallocCString(tag).asResource(),
                cFormat = LibC.mallocCString(format).asResource()
            ) {
                HiLogPrint(
                    DEFAULT_LOG_TYPE,
                    LogLevel.Warn.getValue(),
                    domain,
                    cTag.value,
                    STANDARD_FORMAT,
                    cFormat.value
                )
            }
        }
    }

    /**
     * Outputs error-level logs.
     *
     * @relation function error(domain: number, tag: string, format: string, ...args: (Object | undefined | null)[]): void
     */ 
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiLog"
    ]
    public static func error(domain: UInt32, tag: String, format: String): Unit {
        unsafe {
            try (
                cTag = LibC.mallocCString(tag).asResource(),
                cFormat = LibC.mallocCString(format).asResource()
            ) {
                HiLogPrint(DEFAULT_LOG_TYPE, LogLevel.Error.getValue(), domain, cTag.value, STANDARD_FORMAT,
                    cFormat.value)
            }
        }
    }

    /**
     * Outputs fatal-level logs.
     *
     * @relation function fatal(domain: number, tag: string, format: string, ...args: (Object | undefined | null)[]): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiLog"
    ]
    public static func fatal(domain: UInt32, tag: String, format: String): Unit {
        unsafe {
            try (
                cTag = LibC.mallocCString(tag).asResource(),
                cFormat = LibC.mallocCString(format).asResource()
            ) {
                HiLogPrint(DEFAULT_LOG_TYPE, LogLevel.Fatal.getValue(), domain, cTag.value, STANDARD_FORMAT,
                    cFormat.value)
            }
        }
    }
}
