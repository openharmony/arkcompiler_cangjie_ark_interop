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

package ohos.ability_delegator_registry

import ohos.base.*
import ohos.ffi.*
import ohos.ability.*
import std.deriving.*
import std.collection.HashMap
import ohos.labels.*

foreign func FFIAbilityDelegatorRegistryGetAbilityDelegator(): Int64

foreign func FFIAbilityDelegatorStartAbility(id: Int64, wantHandle: WantHandle): Int32

foreign func FFIAbilityDelegatorExecuteShellCommand(id: Int64, cmd: CString, timeoutSec: Int64): Int32

foreign func FFIGetExitCode(id: Int64): Int32

foreign func FFIGetStdResult(id: Int64): CString

foreign func FFIDump(id: Int64): CString

foreign func FFIAbilityDelegatorApplicationContext(id: Int64): Int32

foreign func FFIAbilityDelegatorFinishTest(id: Int64, msg: CString, code: Int64): Unit

foreign func FfiAbilityDelegatorRegistryGetArguments(): Int64

foreign func FfiAbilityDelegatorArgsGetTestBundleName(id: Int64, errCode: CPointer<Int32>): CString

foreign func FfiAbilityDelegatorArgsGetTestParam(id: Int64, errCode: CPointer<Int32>): CRecord

foreign func FfiAbilityDelegatorArgsGetTestCaseName(id: Int64, errCode: CPointer<Int32>): CString

foreign func FfiAbilityDelegatorArgsGetTestRunnerClassName(id: Int64, errCode: CPointer<Int32>): CString

@C
struct CJAbilityInfo {
    CJAbilityInfo(
        let abilityName: CString,
        let moduleName: CString
    ) {}
}

@C
struct CJAbilityStageInfo {
    CJAbilityStageInfo(
        let moduleName: CString,
        let srcEntrance: CString
    ) {}
}

/**
 * The enum of ability lifecycle state.
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum AbilityLifecycleState {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    UNINITIALIZED
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    CREATE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    FOREGROUND
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    BACKGROUND
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    DESTROY
    | ...

    static func parse(mode: Int64): AbilityLifecycleState {
        match (mode) {
            case 0 => UNINITIALIZED
            case 1 => CREATE
            case 2 => FOREGROUND
            case 3 => BACKGROUND
            case 4 => DESTROY
            case _ => throw NoneValueException("internal error")
        }
    }
}

foreign {
    func FFIAbilityDelegatorDoAbilityForeground(id: Int64, abilityId: Int64, ret: CPointer<Bool>): Int32

    func FFIAbilityDelegatorDoAbilityBackground(id: Int64, abilityId: Int64, ret: CPointer<Bool>): Int32

    func FFIAbilityDelegatorGetCurrentTopAbility(id: Int64, abilityId: CPointer<Int64>): Int32

    func FFIAbilityDelegatorGetAbilityState(id: Int64, abilityId: Int64, state: CPointer<Int64>): Int32

    func FFIAbilityDelegatorPrint(id: Int64, msg: CString): Int32

    func FFIAbilityDelegatorAddAbilityMonitor(id: Int64, monitorId: Int64, abilityName: CString, moduleName: CString): Int32

    func FFIAbilityDelegatorRemoveAbilityMonitor(id: Int64, monitorId: Int64, abilityName: CString, moduleName: CString): Int32

    func FFIAbilityDelegatorWaitAbilityMonitor(id: Int64, monitorId: Int64, abilityInfo: CJAbilityInfo,
        abilityId: CPointer<Int64>): Int32

    func FFIAbilityDelegatorWaitAbilityMonitorWithTimeout(id: Int64, monitorId: Int64, abilityInfo: CJAbilityInfo,
        timeout: Int64, abilityId: CPointer<Int64>): Int32

    func FFIAbilityDelegatorAddAbilityStageMonitor(id: Int64, stageMonitorId: Int64, moduleName: CString,
        srcEntrance: CString): Int32

    func FFIAbilityDelegatorRemoveAbilityStageMonitor(id: Int64, stageMonitorId: Int64, moduleName: CString,
        srcEntrance: CString): Int32

    func FFIAbilityDelegatorWaitAbilityStageMonitor(id: Int64, stageMonitorId: Int64,
        abilityStageInfo: CJAbilityStageInfo, abilityStageId: CPointer<Int64>): Int32

    func FFIAbilityDelegatorWaitAbilityStageMonitorWithTimeout(id: Int64, stageMonitorId: Int64,
        abilityStageInfo: CJAbilityStageInfo, timeout: Int64, abilityStageId: CPointer<Int64>): Int32
}

// ERRORCODE
const SUCCESS_CODE: Int32 = 0
const COMMON_FAILED: Int32 = 16000100
const INVALID_PARA: Int32 = 401
let ERROR_MSG = HashMap<String, String>(
    [
        ("INVALID_PARA", "Parameter error."),
        ("addAbilityMonitor", "AddAbilityMonitor failed."),
        ("removeAbilityMonitor", "RemoveAbilityMonitor failed."),
        ("waitAbilityMonitor", "WaitAbilityMonitor failed."),
        ("getCurrentTopAbility", "GetCurrentTopAbility failed."),
        ("doAbilityForeground", "DoAbilityForeground failed."),
        ("doAbilityBackground", "DoAbilityBackground failed."),
        ("addAbilityStageMonitor", "AddAbilityStageMonitor failed."),
        ("removeAbilityStageMonitor", "RemoveAbilityStageMonitor failed."),
        ("waitAbilityStageMonitor", "WaitAbilityStageMonitor failed.")
    ]
)

func getErrorMsg(code: Int32, funcName: String): String {
    var key = funcName
    if (code == INVALID_PARA) {
        key = "INVALID_PARA"
    }
    return ERROR_MSG[key]
}

@C
struct CRecord {
    CRecord(
        let keys: CArrString,
        let values: CArrString
    ) {}

    func toHashMapAndFree(): HashMap<String, String> {
        let cjKeys = unsafe { getArrayStringAndFree(keys) }
        let cjValues = unsafe { getArrayStringAndFree(values) }
        return HashMap<String, String>(
            keys.size,
            {i => (cjKeys[i], cjValues[i])}
        )
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class AbilityDelegatorRegistry {
    static var delegator_: ?AbilityDelegator = None
    static var delegatorArgs_: ?AbilityDelegatorArgs = None

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public static func getAbilityDelegator(): AbilityDelegator {
        match (delegator_) {
            case Some(v) => v
            case _ => unsafe {
                let res = AbilityDelegator(FFIAbilityDelegatorRegistryGetAbilityDelegator())
                delegator_ = res
                res
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public static func getArguments(): AbilityDelegatorArgs {
        match (delegatorArgs_) {
            case Some(v) => v
            case _ => unsafe {
                let id = FfiAbilityDelegatorRegistryGetArguments()
                if (id < 0) {
                    throw BusinessException(INVALID_PARA, "ApplicationContext getArguments failed.")
                }
                let res = AbilityDelegatorArgs(id)
                delegatorArgs_ = res
                res
            }
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class ShellCmdResult <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }
    /**
     * Obtains the exit code.
     *
     * @return the exit code.
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func getExitCode(): Int32 {
        let exitCode = unsafe { FFIGetExitCode(this.getID()) }
        ABILITY_DELEGATOR_LOG.info("ShellCmdResult: get the exit code ${exitCode}")
        return exitCode
    }
    /**
     * Obtains the standard result.
     *
     * @return the standard result.
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func getStdResult(): String {
        ABILITY_DELEGATOR_LOG.info("ShellCmdResult: get the standard result")
        let tempData = unsafe { FFIGetStdResult(this.getID()) }
        let result = tempData.toString()
        unsafe { LibC.free(tempData) }
        return result
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func dump(): String {
        let tempData = unsafe { FFIDump(this.getID()) }
        let result = tempData.toString()
        unsafe { LibC.free(tempData) }
        return result
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class AbilityDelegator <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func startAbility(want: Want): Future<Unit> {
        spawn {
            let wantHandle = want.createWantHandle()
            let errorCode = unsafe { FFIAbilityDelegatorStartAbility(this.getID(), wantHandle) }
            unsafe { Want.releaseWantHandle(wantHandle) }
            ABILITY_DELEGATOR_LOG.info("startAbility: errorCode is ${errorCode}")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func executeShellCommand(cmd: String, timeoutSec: Int64): ShellCmdResult {
        unsafe {
            var cCmd = LibC.mallocCString(cmd)
            let shellCmdResultID = FFIAbilityDelegatorExecuteShellCommand(this.getID(), cCmd, timeoutSec)
            ABILITY_DELEGATOR_LOG.info("AbilityDelegator: Start Execute Shell Command: ${shellCmdResultID}")
            LibC.free(cCmd)
            return ShellCmdResult(Int64(shellCmdResultID))
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func getAppContext(): ApplicationContext {
        unsafe {
            let appContextID = FFIAbilityDelegatorApplicationContext(this.getID())
            ABILITY_DELEGATOR_LOG.info("AbilityDelegator: Start get Application Context")
            return ApplicationContext(Int64(appContextID))
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func finishTest(msg: String, code: Int64): Unit {
        unsafe {
            var cMsg = LibC.mallocCString(msg)
            FFIAbilityDelegatorFinishTest(this.getID(), cMsg, code)
            ABILITY_DELEGATOR_LOG.info("AbilityDelegator: Finish Test")
            LibC.free(cMsg)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func addAbilityMonitor(monitor: AbilityMonitor): Unit {
        var errorCode: Int32 = COMMON_FAILED
        unsafe {
            try (
                abilityName = LibC.mallocCString(monitor.abilityName).asResource(),
                moduleName = LibC.mallocCString(monitor.moduleName).asResource()
            ) {
                errorCode = FFIAbilityDelegatorAddAbilityMonitor(this.getID(), monitor.getID(), abilityName.value,
                    moduleName.value)
            }
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode, "addAbilityMonitor"))
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func removeAbilityMonitor(monitor: AbilityMonitor): Unit {
        var errorCode: Int32 = COMMON_FAILED
        unsafe {
            try (
                abilityName = LibC.mallocCString(monitor.abilityName).asResource(),
                moduleName = LibC.mallocCString(monitor.moduleName).asResource()
            ) {
                errorCode = FFIAbilityDelegatorRemoveAbilityMonitor(this.getID(), monitor.getID(), abilityName.value,
                    moduleName.value)
            }
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode, "removeAbilityMonitor"))
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func waitAbilityMonitor(monitor: AbilityMonitor): UIAbility {
        var errorCode: Int32 = COMMON_FAILED
        var abilityId: Int64 = 0i64
        unsafe {
            try (
                abilityName = LibC.mallocCString(monitor.abilityName).asResource(),
                moduleName = LibC.mallocCString(monitor.moduleName).asResource()
            ) {
                let abilityInfo = CJAbilityInfo(abilityName.value, moduleName.value)
                errorCode = FFIAbilityDelegatorWaitAbilityMonitor(this.getID(), monitor.getID(), abilityInfo,
                    inout abilityId)
            }
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode, "waitAbilityMonitor"))
        }
        let optAbility = FFIDataManager.getInstance().getData<UIAbility>(abilityId)
        return optAbility.getOrThrow {=> Exception("Invalid Ability")}
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func waitAbilityMonitor(monitor: AbilityMonitor, timeout: Int64): UIAbility {
        var errorCode: Int32 = COMMON_FAILED
        var abilityId: Int64 = 0i64
        unsafe {
            try (
                abilityName = LibC.mallocCString(monitor.abilityName).asResource(),
                moduleName = LibC.mallocCString(monitor.moduleName).asResource()
            ) {
                let abilityInfo = CJAbilityInfo(abilityName.value, moduleName.value)
                errorCode = FFIAbilityDelegatorWaitAbilityMonitorWithTimeout(this.getID(), monitor.getID(), abilityInfo,
                    timeout, inout abilityId)
            }
        }

        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode, "waitAbilityMonitor"))
        }
        let optAbility = FFIDataManager.getInstance().getData<UIAbility>(abilityId)
        return optAbility.getOrThrow {=> Exception("Invalid Ability")}
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func addAbilityStageMonitor(stageMonitor: AbilityStageMonitor): Unit {
        var errorCode: Int32 = COMMON_FAILED
        unsafe {
            try (
                moduleName = LibC.mallocCString(stageMonitor.moduleName).asResource(),
                srcEntrance = LibC.mallocCString(stageMonitor.srcEntrance).asResource()
            ) {
                errorCode = FFIAbilityDelegatorAddAbilityStageMonitor(this.getID(), stageMonitor.getID(),
                    moduleName.value, srcEntrance.value)
            }
        }

        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode, "addAbilityStageMonitor"))
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func removeAbilityStageMonitor(stageMonitor: AbilityStageMonitor): Unit {
        var errorCode: Int32 = COMMON_FAILED
        unsafe {
            try (
                moduleName = LibC.mallocCString(stageMonitor.moduleName).asResource(),
                srcEntrance = LibC.mallocCString(stageMonitor.srcEntrance).asResource()
            ) {
                errorCode = FFIAbilityDelegatorRemoveAbilityStageMonitor(this.getID(), stageMonitor.getID(),
                    moduleName.value, srcEntrance.value)
            }
        }

        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode, "removeAbilityStageMonitor"))
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func waitAbilityStageMonitor(stageMonitor: AbilityStageMonitor): AbilityStage {
        var errorCode: Int32 = COMMON_FAILED
        var abilityStageId: Int64 = 0i64
        unsafe {
            try (
                moduleName = LibC.mallocCString(stageMonitor.moduleName).asResource(),
                srcEntrance = LibC.mallocCString(stageMonitor.srcEntrance).asResource()
            ) {
                let abilityStageInfo = CJAbilityStageInfo(moduleName.value, srcEntrance.value)
                errorCode = FFIAbilityDelegatorWaitAbilityStageMonitor(this.getID(), stageMonitor.getID(),
                    abilityStageInfo, inout abilityStageId)
            }
        }

        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode, "waitAbilityStageMonitor"))
        }
        let optAbilityStage = FFIDataManager.getInstance().getData<AbilityStage>(abilityStageId)
        return optAbilityStage.getOrThrow {=> Exception("Invalid AbilityStage")}
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func waitAbilityStageMonitor(stageMonitor: AbilityStageMonitor, timeout: Int64): AbilityStage {
        var abilityStageId: Int64 = 0i64
        var errorCode: Int32 = COMMON_FAILED
        unsafe {
            try (
                moduleName = LibC.mallocCString(stageMonitor.moduleName).asResource(),
                srcEntrance = LibC.mallocCString(stageMonitor.srcEntrance).asResource()
            ) {
                let abilityStageInfo = CJAbilityStageInfo(moduleName.value, srcEntrance.value)
                errorCode = FFIAbilityDelegatorWaitAbilityStageMonitorWithTimeout(this.getID(), stageMonitor.getID(),
                    abilityStageInfo, timeout, inout abilityStageId)
            }
        }

        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode, "waitAbilityStageMonitor"))
        }
        let optAbilityStage = FFIDataManager.getInstance().getData<AbilityStage>(abilityStageId)
        return optAbilityStage.getOrThrow {=> Exception("Invalid AbilityStage")}
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func print(msg: String): Unit {
        var errorCode: Int32 = COMMON_FAILED
        unsafe {
            try (cMsg = LibC.mallocCString(msg).asResource()) {
                errorCode = FFIAbilityDelegatorPrint(this.getID(), cMsg.value)
            }
        }

        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode, "print"))
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func getAbilityState(ability: UIAbility): AbilityLifecycleState {
        var errorCode: Int32 = COMMON_FAILED
        var state: Int64 = -1i64
        unsafe {
            errorCode = FFIAbilityDelegatorGetAbilityState(this.getID(), ability.getID(), inout state)
        }

        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode, "getAbilityState"))
        }
        return AbilityLifecycleState.parse(state)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func getCurrentTopAbility(): UIAbility {
        var errorCode: Int32 = COMMON_FAILED
        var abilityId: Int64 = 0i64
        unsafe {
            errorCode = FFIAbilityDelegatorGetCurrentTopAbility(this.getID(), inout abilityId)
        }

        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode, "getCurrentTopAbility"))
        }
        let optAbility = FFIDataManager.getInstance().getData<UIAbility>(abilityId)
        return optAbility.getOrThrow {=> Exception("Invalid Ability")}
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func doAbilityForeground(ability: UIAbility): Unit {
        var errorCode: Int32 = COMMON_FAILED
        var ret: Bool = false;
        unsafe {
            errorCode = FFIAbilityDelegatorDoAbilityForeground(this.getID(), ability.getID(), inout ret)
        }
        if (!ret) {
            throw BusinessException(errorCode, getErrorMsg(errorCode, "doAbilityForeground"))
        }
        return
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func doAbilityBackground(ability: UIAbility): Unit {
        var errorCode: Int32 = COMMON_FAILED
        var ret: Bool = false
        unsafe {
            errorCode = FFIAbilityDelegatorDoAbilityBackground(this.getID(), ability.getID(), inout ret)
        }
        if (!ret) {
            throw BusinessException(errorCode, getErrorMsg(errorCode, "doAbilityBackground"))
        }
        return
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class AbilityDelegatorArgs <: RemoteDataLite {
    var bundleName_: ?String = None
    var parameters_: ?HashMap<String, String> = None
    var testCaseNames_: ?String = None
    var testRunnerClassName_: ?String = None

    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public mut prop bundleName: String {
        get() {
            if (let Some(v) <- bundleName_) {
                return v
            }
            var code: Int32 = 0
            unsafe {
                let cBundleName = FfiAbilityDelegatorArgsGetTestBundleName(getID(), inout code)
                if (code != 0) {
                    ABILITY_DELEGATOR_LOG.error("AbilityDelegatorArgs get bundleName failed")
                    return ""
                }
                bundleName_ = cBundleName.toString()
                LibC.free(cBundleName)
                return bundleName_.getOrThrow()
            }
        }
        set(v) {
            bundleName_ = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public mut prop parameters: HashMap<String, String> {
        get() {
            if (let Some(v) <- parameters_) {
                return v
            }
            var code: Int32 = 0
            unsafe {
                let cParameters = FfiAbilityDelegatorArgsGetTestParam(getID(), inout code)
                if (code != 0) {
                    ABILITY_DELEGATOR_LOG.error("AbilityDelegatorArgs get parameters failed")
                    return HashMap<String, String>()
                }
                parameters_ = cParameters.toHashMapAndFree()
                return parameters_.getOrThrow()
            }
        }
        set(v) {
            parameters_ = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public mut prop testCaseNames: String {
        get() {
            if (let Some(v) <- testCaseNames_) {
                return v
            }
            var code: Int32 = 0
            unsafe {
                let cTestCaseNames = FfiAbilityDelegatorArgsGetTestCaseName(getID(), inout code)
                if (code != 0) {
                    ABILITY_DELEGATOR_LOG.error("AbilityDelegatorArgs get testCaseNames failed")
                    return ""
                }
                testCaseNames_ = cTestCaseNames.toString()
                LibC.free(cTestCaseNames)
                return testCaseNames_.getOrThrow()
            }
        }
        set(v) {
            testCaseNames_ = v
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public mut prop testRunnerClassName: String {
        get() {
            if (let Some(v) <- testRunnerClassName_) {
                return v
            }
            var code: Int32 = 0
            unsafe {
                let cTestRunnerClassName = FfiAbilityDelegatorArgsGetTestRunnerClassName(getID(), inout code)
                if (code != 0) {
                    ABILITY_DELEGATOR_LOG.error("AbilityDelegatorArgs get testRunnerClassName failed")
                    return ""
                }
                testRunnerClassName_ = cTestRunnerClassName.toString()
                LibC.free(cTestRunnerClassName)
                return testRunnerClassName_.getOrThrow()
            }
        }
        set(v) {
            testRunnerClassName_ = v
        }
    }
}

unsafe func getArrayStringAndFree(arr: CArrString): Array<String> {
    let ptr = arr.head
    if (ptr.isNull()) {
        return Array<String>()
    }
    let size = arr.size
    let ret = Array<String>(
        size,
        {
            i =>
            let cString = ptr.read(i)
            let data = cString.toString()
            LibC.free(cString)
            data
        }
    )
    LibC.free<CString>(ptr)
    return ret
}
