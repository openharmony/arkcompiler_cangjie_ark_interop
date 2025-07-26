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

package ohos.ark_interop

import std.regex.*

@C
struct JSEnginePrivate {}

type JSEngine = CPointer<JSEnginePrivate>

foreign func ARKTS_CreateEngine(): JSEngine

foreign func CJ_MRT_ARKTS_CreateEngineStub(): JSEngine

foreign func ARKTS_CreateEngineWithNewThread(): JSEngine

foreign func ARKTS_DestroyEngine(engine: JSEngine): Unit

@FastNative
foreign func ARKTS_GetThreadIdOfEngine(engine: JSEngine): UInt64

@FastNative
foreign func ARKTS_GetContext(engine: JSEngine): JSEnv

@FastNative
foreign func ARKTS_GetNAPIEnv(engine: JSEngine): CPointer<Unit>

foreign func ARKTS_LoadEntryFromAbc(engine: JSEngine, filePath: CString, entryPoint: CString, forceLoad: Bool): Bool

foreign func ARKTS_ImportFromEntry(engine: JSEngine, entryPoint: CString, importName: CString): JSValue_

protected func getGlobalRuntime(): JSRuntime {
    if (let Some(r) <- JSRuntime.globalRuntime_) {
        r
    } else {
        let r = JSRuntime(unsafe { ARKTS_CreateEngineWithNewThread() })
        JSRuntime.globalRuntime_ = r
        r
    }
}

protected func getGlobalContext(): JSContext {
    getGlobalRuntime().mainContext
}

/**
 * The ArkTS runtime created by Cangjie. 
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Utils.Cangjie"
]
public class JSRuntime {
    static var globalRuntime_: ?JSRuntime = None

    private let engine_: JSEngine
    private let threadId_: UInt64

    /**
     * Init JSRuntime.
     *
     * @throws { Exception } - ArkTS Engine is Null.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public init() {
        let engine = unsafe { CJ_MRT_ARKTS_CreateEngineStub() }
        if (engine.isNull()) {
            throw Exception("failed to create JSRuntime")
        }
        engine_ = engine
        threadId_ = unsafe { ARKTS_GetPosixThreadId() }
    }

    // only for unittest framework
    protected init(inCJThread: Bool) {
        let engine = unsafe {
            if (inCJThread) {
                ARKTS_CreateEngine()
            } else {
                CJ_MRT_ARKTS_CreateEngineStub()
            }
        }
        if (engine.isNull()) {
            throw Exception("failed to create JSRuntime")
        }
        engine_ = engine
        threadId_ = unsafe { ARKTS_GetPosixThreadId() }
    }

    init(engine: JSEngine) {
        if (engine.isNull()) {
            throw Exception("failed to create JSRuntime")
        }
        engine_ = engine
        threadId_ = unsafe { ARKTS_GetThreadIdOfEngine(engine) }
    }

    ~init() {
        unsafe { ARKTS_DestroyEngine(engine_) }
    }

    /**
     * ArkTS interop context.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public prop mainContext: JSContext {
        get() {
            let env = unsafe { ARKTS_GetContext(engine_) }
            JSContext.getOrCreate(env, tidGetter: {=> threadId_})
        }
    }

    /**
     * Get napi environment pointer.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Cangjie"
    ]
    public func getNapiEnv(): CPointer<Unit> {
        unsafe { ARKTS_GetNAPIEnv(engine_) }
    }

    @!APILevel[
        13,
        atomicservice: true,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func loadEntryFromAbc(abcPath: String, entryPoint: String, forceLoad!: Bool = false): Bool {
        mainContext.checkThread()
        unsafe {
            let cPath = LibC.mallocCString(abcPath)
            let cEntry = LibC.mallocCString(entryPoint)
            let result = ARKTS_LoadEntryFromAbc(engine_, cPath, cEntry, forceLoad)
            LibC.free(cPath)
            LibC.free(cEntry)
            return result
        }
    }

    @!APILevel[
        13,
        atomicservice: true,
        deprecated: 16,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func importFromEntry(entryPoint: String, importName: String): JSValue {
        mainContext.checkThread()
        if (!isValidImportName(importName)) {
            return mainContext.undefined().toJSValue()
        }
        unsafe {
            let cEntry = LibC.mallocCString(entryPoint)
            let iName = LibC.mallocCString(importName)
            let result = try {
                ARKTS_ImportFromEntry(engine_, cEntry, iName)
            } catch (_: Exception) {
                mainContext.undefined().toJSValue().value
            }
            LibC.free(cEntry)
            LibC.free(iName)
            return JSValue(mainContext, result)
        }
    }

    static func isValidImportName(value: String): Bool {
        let testRef = Regex("^[a-zA-Z_][0-9a-zA-Z_]*$")
        testRef.find(value).isSome()
    }
}
