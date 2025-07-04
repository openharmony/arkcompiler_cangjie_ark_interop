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

package ohos.ability

import std.collection.HashMap
import std.deriving.Derive
import ohos.ffi.{CArrString, FFIDataManager, FFIData, cjArr2CArr, FUNCTION_S2CS, FUNCTION_CS_FREE}
import ohos.labels.APILevel
import ohos.window.WindowStage
import ohos.window.WindowStageNativeHandler as WindowStageHandle

type CJInsightIntentExecutorHandle = UIntNative

@C
func createCjInsightIntentExecutor(name: CString, executorHandle: CJInsightIntentExecutorHandle): Int64 {
    let optExecutor = InsightIntentExecutor.create(name.toString())
    match (optExecutor) {
        case None =>
            ABILITY_LOG.error("Failed to load InsightIntentExecutor: " + name.toString())
            0
        case Some(executor) =>
            FFIDataManager.getInstance().register(executor)
            executor.executorInit(executorHandle)
            executor.getID()
    }
}

@C
func releaseCjInsightIntentExecutor(id: Int64): Unit {
    let optExecutor = FFIDataManager.getInstance().getData<InsightIntentExecutor>(id)
    match (optExecutor) {
        case None => throw NoneValueException("No such FormExtensionAbility: " + id.toString())
        case Some(ability) =>
            ABILITY_LOG.info("Release FormExtensionAbility end")
            FFIDataManager.getInstance().releaseData(id)
    }
}

@C
func cjInsightIntentExecutorOnExecuteInUIAbilityForegroundMode(id: Int64, cName: CString, cParam: CString,
    windowStageHandle: WindowStageHandle): CJExecuteResult {
    let optExecutor = FFIDataManager.getInstance().getData<InsightIntentExecutor>(id)
    match (optExecutor) {
        case None =>
            ABILITY_LOG.error("No such InsightIntentExecutor: " + id.toString())
            throw NoneValueException("No such InsightIntentExecutor: " + id.toString())
        case Some(executor) =>
            let windowStage = WindowStage(windowStageHandle)
            let name = cName.toString()
            let param = jsonStringUnWrapper(cParam.toString()).toString()
            let result = executor.onExecuteInUIAbilityForegroundMode(name, param, windowStage)
            // wantParam need wrap
            result.result = jsonObjectWrapper(jsStringToJsObject(result.result)).toString()
            return unsafe {
                CJExecuteResult.fromExecuteResult(result)
            }
    }
}

@C
func cjInsightIntentExecutorOnExecuteInUIAbilityBackgroundMode(id: Int64, cName: CString, cParam: CString): CJExecuteResult {
    let optExecutor = FFIDataManager.getInstance().getData<InsightIntentExecutor>(id)
    match (optExecutor) {
        case None =>
            ABILITY_LOG.error("No such InsightIntentExecutor: " + id.toString())
            throw NoneValueException("No such InsightIntentExecutor: " + id.toString())
        case Some(executor) =>
            let name = cName.toString()
            let param = jsonStringUnWrapper(cParam.toString()).toString()
            let result = executor.onExecuteInUIAbilityBackgroundMode(name, param)
            // wantParam need wrap
            result.result = jsonObjectWrapper(jsStringToJsObject(result.result)).toString()
            return unsafe {
                CJExecuteResult.fromExecuteResult(result)
            }
    }
}

@C
func cjInsightIntentExecutorOnExecuteInUIExtensionAbility(id: Int64, cName: CString, cParam: CString, sessionId: Int64): CJExecuteResult {
    let optExecutor = FFIDataManager.getInstance().getData<InsightIntentExecutor>(id)
    match (optExecutor) {
        case None =>
            ABILITY_LOG.error("No such InsightIntentExecutor: " + id.toString())
            throw NoneValueException("No such InsightIntentExecutor: " + id.toString())
        case Some(executor) =>
            let session = UIExtensionContentSession(sessionId)
            let name = cName.toString()
            let param = jsonStringUnWrapper(cParam.toString()).toString()
            let result = executor.onExecuteInUIExtensionAbility(name, param, session)
            // wantParam need wrap
            result.result = jsonObjectWrapper(jsStringToJsObject(result.result)).toString()
            return unsafe {
                CJExecuteResult.fromExecuteResult(result)
            }
    }
}

@C
func cjInsightIntentExecutorFreeCJExecuteResult(cResult: CJExecuteResult): Unit {
    unsafe {
        LibC.free(cResult.result)
        let cUris = cResult.uris
        if (cUris.head.isNotNull()) {
            for (i in 0..cUris.size) {
                LibC.free(cUris.head.read(i))
            }
            LibC.free<CString>(cUris.head)
        }
    }
}

@C
struct CJExecuteResult {
    CJExecuteResult(
        let code: Int32,
        let result: CString,
        let uris: CArrString,
        let flags: Int32
    ) {}

    unsafe static func fromExecuteResult(executeResult: ExecuteResult): CJExecuteResult {
        let cResult = LibC.mallocCString(executeResult.result)
        let cUrisHead = cjArr2CArr<String, CString>(executeResult.uris, FUNCTION_S2CS, FUNCTION_CS_FREE) {
            => LibC.free(cResult)
        }
        return CJExecuteResult(executeResult.code, cResult, CArrString(cUrisHead, executeResult.uris.size),
            executeResult.flags)
    }
}

/**
 * Enum for supported execute mode.
 *
 * @relation enum ExecuteMode
 */
@Derive[ToString, Equatable]
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum ExecuteMode {
    /**
     * UIAbility foreground.
     *
     * @relation UI_ABILITY_FOREGROUND = 0;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    UIAbilityForeground
    /**
     * UIAbility background.
     *
     * @relation UI_ABILITY_BACKGROUND = 1;
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    UIAbilityBackground
    /**
     * UIExtensionAbility.
     *
     * @relation UI_EXTENSION_ABILITY = 2;
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    UIExtensionAbility
    | ...
}

/**
 * Result of intent execution.
 *
 * @relation interface ExecuteResult
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class ExecuteResult {
    /**
     * Indicates result code.
     *
     * @relation code: number;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var code: Int32

    /**
     * Indicates execute result.
     *
     * @relation result?: Record<string, Object>;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var result: String

    /**
     * Indicates the URIs will be authorized to the insight intent driver.
     *
     * @relation uris?: Array<string>;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var uris: Array<String>

    /**
     * Indicates the URIs read and write permissions which consistent with Flags,
     * flags must be one of Flags.FLAG_AUTH_READ_URI_PERMISSION,
     * Flags.FLAG_AUTH_WRITE_URI_PERMISSION,
     * Flags.FLAG_AUTH_READ_URI_PERMISSION}|
     * Flags.FLAG_AUTH_WRITE_URI_PERMISSION.
     *
     * @relation flags?: number;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var flags: Int32

    /**
     * Result of intent execution.
     *
     * @relation interface ExecuteResult
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public init(code: Int32, result!: String = "", uris!: Array<String> = [], flags!: Int32 = 0) {
        this.code = code
        this.result = result
        this.uris = uris
        this.flags = flags
    }
}

/**
 * The class of insight intent executor.
 *
 * @throws { IllegalArgumentException } - If init failed.
 * @relation export default class InsightIntentExecutor;
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public open class InsightIntentExecutor <: FFIData {
    private static let CREATORS = HashMap<String, () -> InsightIntentExecutor>()
    private var context_: ?InsightIntentContext = None

    func executorInit(remote: CJInsightIntentExecutorHandle): Unit {
        if (remote == 0) {
            throw IllegalArgumentException("Invalid remote CJInsightIntentExecutorHandle")
        }

        // Init InsightIntentContext
        var nativeInsightIntentContextId = 0
        let errorCode = unsafe { FfiInsightIntentGetContext(remote, inout nativeInsightIntentContextId) }
        checkCodeAndThrow(errorCode)
        context_ = InsightIntentContext(nativeInsightIntentContextId)
    }

    /**
     * Indicates context of insight intent.
     *
     * @throws { IllegalArgumentException } - If context is invalid.
     * @relation context: InsightIntentContext;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop context: InsightIntentContext {
        get() {
            match (context_) {
                case None => throw IllegalArgumentException("Invalid context")
                case Some(value) => return value
            }
        }
    }

    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public static func registerCreator(name: String, creator: () -> InsightIntentExecutor): Unit {
        let optCreator = CREATORS.get(name)
        match (optCreator) {
            case None =>
                CREATORS.add(name, creator)
                ABILITY_LOG.info("Register creator of " + name + " successfully.")
            case Some(creatorFunc) => ABILITY_LOG.error(
                "Repeated registration for InsightIntentExecutor in " + name + ", please check.")
        }
    }

    static func create(name: String): Option<InsightIntentExecutor> {
        let optCreator = CREATORS.get(name)
        match (optCreator) {
            case None =>
                ABILITY_LOG.error("No such create functions for InsightIntentExecutor: " + name)
                Option<InsightIntentExecutor>.None
            case Some(creator) => creator()
        }
    }

    /**
     * Called when a UIAbility executes the insight intent in the foreground.
     *
     * @relation onExecuteInUIAbilityForegroundMode(name: string, param: Record<string, Object>, pageLoader: window.WindowStage):
     *               insightIntent.ExecuteResult | Promise<insightIntent.ExecuteResult>;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func onExecuteInUIAbilityForegroundMode(name: String, param: String, pageLoader: WindowStage): ExecuteResult {
        return ExecuteResult(0)
    }

    /**
     * Called when a UIAbility executes the insight intent in the background.
     *
     * @relation onExecuteInUIAbilityBackgroundMode(name: string, param: Record<string, Object>):
     *               insightIntent.ExecuteResult | Promise<insightIntent.ExecuteResult>;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func onExecuteInUIAbilityBackgroundMode(name: String, param: String): ExecuteResult {
        return ExecuteResult(0)
    }

    /**
     * Called when a UIExtensionAbility executes the insight intent.
     *
     * @relation onExecuteInUIExtensionAbility(name: string, param: Record<string, Object>, pageLoader: UIExtensionContentSession):
     *               insightIntent.ExecuteResult | Promise<insightIntent.ExecuteResult>;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func onExecuteInUIExtensionAbility(name: String, param: String, pageLoader: UIExtensionContentSession): ExecuteResult {
        return ExecuteResult(0)
    }
}

@C
struct CJInsightIntentExecutorFuncs {
    CJInsightIntentExecutorFuncs(
        let createCjInsightIntentExecutor: CFunc<(CString, CJInsightIntentExecutorHandle) -> Int64>,
        let releaseCjInsightIntentExecutor: CFunc<(Int64) -> Unit>,
        let cjInsightIntentExecutorOnExecuteInUIAbilityForegroundMode: CFunc<(Int64, CString, CString, WindowStageHandle) -> CJExecuteResult>,
        let cjInsightIntentExecutorOnExecuteInUIAbilityBackgroundMode: CFunc<(Int64, CString, CString) -> CJExecuteResult>,
        let cjInsightIntentExecutorOnExecuteInUIExtensionAbility: CFunc<(Int64, CString, CString, Int64) -> CJExecuteResult>,
        let cjInsightIntentExecutorFreeCJExecuteResult: CFunc<(CJExecuteResult) -> Unit>
    ) {}
}

@C
func insightIntentExecutorCjFuncsRegister(result: CPointer<CJInsightIntentExecutorFuncs>): Unit {
    let atCFuncs = CJInsightIntentExecutorFuncs(
        createCjInsightIntentExecutor,
        releaseCjInsightIntentExecutor,
        cjInsightIntentExecutorOnExecuteInUIAbilityForegroundMode,
        cjInsightIntentExecutorOnExecuteInUIAbilityBackgroundMode,
        cjInsightIntentExecutorOnExecuteInUIExtensionAbility,
        cjInsightIntentExecutorFreeCJExecuteResult
    )
    unsafe { result.write(atCFuncs) }
}

foreign func FfiRegisterCJInsightIntentExecutorFuncs(funcs: CFunc<(CPointer<CJInsightIntentExecutorFuncs>) -> Unit>): Unit

let REGISTER_INTENT_EXECUTOR_FUNCS = unsafe {
    FfiRegisterCJInsightIntentExecutorFuncs(insightIntentExecutorCjFuncsRegister)
}
