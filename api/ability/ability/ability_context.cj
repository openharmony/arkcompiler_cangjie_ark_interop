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

import ohos.base.*
import ohos.bundle_manager.*
import ohos.ffi.*
import ohos.image.*
import ohos.eventhub.*
import ohos.window.*
import std.sync.*
import std.collection.*
import std.math.*
import ohos.encoding.json.*
import ohos.labels.*

internal type AbilityInfoHandle = UIntNative

internal type HapModuleInfoHandle = UIntNative

internal type ConfigurationHandle = UIntNative

foreign {
    func FFIAbilityContextGetBroker(): CPointer<AbilityContextBroker>

    func FFIGetContext(id: Int64): CPointer<Unit>

    func free(ptr: CPointer<Unit>): Unit

    func FFICreateNapiValue(env: CPointer<Unit>, context: StageContext): CPointer<Unit>

    func FFIAbilityContextRequestDialogService(id: Int64, handle: WantHandle, callback: Int64): Int32

    func FFIAbilityContextGetFilesDir(id: Int64, accept: CFunc<(CString) -> Unit>): Unit

    func FFIAbilityContextMoveAbilityToBackground(id: Int64): Int32

    func FFIAbilityContextStartAbilityByType(id: Int64, cType: CString, cWantParams: CString, onError: Int64,
        onResult: Int64): Int32

    func FFIAbilityContextPropAbilityInfo(id: Int64, errCode: CPointer<Int32>): RetAbilityInfoV2

    func FFIAbilityContextPropCurrentHapModuleInfo(id: Int64, errCode: CPointer<Int32>): RetHapModuleInfoV2

    func FFIAbilityContextPropConfiguration(id: Int64, errCode: CPointer<Int32>): CConfiguration

    func FFIAbilityContextOpenLink(id: Int64, cLink: CString, cOpenLinkOptions: CJOpenLinkOptions, requestCode: Int32,
        lambdaId: Int64): Int32

    func FFIAbilityContextOpenAtomicService(id: Int64, cAppId: CString, cAtomicServiceOptions: CJAtomicServiceOptions,
        requestCode: Int32, lambdaId: Int64): Int32

    func FFIAbilityContextBackToCallerAbilityWithResult(id: Int64, cAbilityResult: CJAbilityResult, requestCode: CString): Int32

    func FFIAbilityContextSetRestoreEnabled(id: Int64, enabled: Bool): Int32

    func FFIAbilityContextSetMissionContinueState(id: Int64, state: Int32): Int32

    func FFIAbilityContextReportDrawnCompleted(id: Int64): Int32

    func FFIAbilityContextStartAbilityWithOptions(id: Int64, want: WantHandle, startOptions: CJNewStartOptions): Int32

    func FFIAbilityContextShowAbility(id: Int64): Int32

    func FFIAbilityContextHideAbility(id: Int64): Int32

    func FFIAbilityContextStartAbilityByCall(id: Int64, handle: WantHandle, callerId: CPointer<Int64>,
        remoteId: CPointer<Int64>): Int32
}

const SUCCESS_CODE: Int32 = 0

@C
struct AbilityContextBroker {
    private AbilityContextBroker(
        let isAbilityContextExisted: CFunc<(Int64) -> Bool>,
        let getSizeOfStartOptions: CFunc<() -> Int64>,
        let getAbilityInfo: CFunc<(Int64) -> AbilityInfoHandle>,
        let getHapModuleInfo: CFunc<(Int64) -> HapModuleInfoHandle>,
        let getConfiguration: CFunc<(Int64) -> ConfigurationHandle>,
        let startAbility: CFunc<(Int64, WantHandle) -> Int32>,
        let startAbilityWithOption: CFunc<(Int64, WantHandle, CPointer<CJStartOptions>) -> Int32>,
        let startAbilityWithAccount: CFunc<(Int64, WantHandle, Int32) -> Int32>,
        let startAbilityWithAccountAndOption: CFunc<(Int64, WantHandle, Int32, CPointer<CJStartOptions>) -> Int32>,
        let startServiceExtensionAbility: CFunc<(Int64, WantHandle) -> Int32>,
        let startServiceExtensionAbilityWithAccount: CFunc<(Int64, WantHandle, Int32) -> Int32>,
        let stopServiceExtensionAbility: CFunc<(Int64, WantHandle) -> Int32>,
        let stopServiceExtensionAbilityWithAccount: CFunc<(Int64, WantHandle, Int32) -> Int32>,
        let terminateSelf: CFunc<(Int64) -> Int32>,
        let terminateSelfWithResult: CFunc<(Int64, WantHandle, Int32) -> Int32>,
        let isTerminating: CFunc<(Int64) -> RetDataBool>,
        let connectAbility: CFunc<(Int64, WantHandle, Int64) -> Int32>,
        let connectAbilityWithAccount: CFunc<(Int64, WantHandle, Int32, Int64) -> Int32>,
        let disconnectAbility: CFunc<(Int64, WantHandle, Int64) -> Int32>,
        let startAbilityForResult: CFunc<(Int64, WantHandle, Int32, Int64) -> Int32>,
        let startAbilityForResultWithOption: CFunc<(Int64, WantHandle, CPointer<CJStartOptions>, Int32, Int64) -> Int32>,
        let startAbilityForResultWithAccount: CFunc<(Int64, WantHandle, Int32, Int32, Int64) -> Int32>,
        let startAbilityForResultWithAccountAndOption: CFunc<(Int64, WantHandle, Int32, CPointer<CJStartOptions>, Int32,
            Int64) -> Int32>,
        let requestPermissionsFromUser: CFunc<(Int64, VectorStringHandle, Int32, Int64) -> Int32>,
        let setMissionLabel: CFunc<(Int64, CString) -> Int32>,
        let setMissionIcon: CFunc<(Int64, Int64) -> Int32>
    ) {}
}

@C
struct CJStartOptions {
    CJStartOptions(
        let windowMode: Int32,
        let displayId: Int32
    ) {}
}

@C
struct CJNewStartOptions {
    CJNewStartOptions(
        let windowMode: Int32,
        let displayId: Int32,
        let withAnimation: Bool,
        let windowLeft: Int32,
        let windowTop: Int32,
        let windowWidth: Int32,
        let windowHeight: Int32,
        let processMode: Int32,
        let startupVisibility: Int32
    ) {}
}

@C
struct CJAbilityResult {
    CJAbilityResult(
        let resultCode: Int32,
        let wantHandle: WantHandle
    ) {}
}

@C
struct CJDialogRequestResult {
    CJDialogRequestResult(
        let result: Int32,
        let wantHandle: WantHandle
    ) {}
}

@C
struct CJPermissionRequestResult {
    CJPermissionRequestResult(
        let permissions: VectorStringHandle,
        let authResults: VectorInt32Handle
    ) {}
}

@C
struct CJOpenLinkOptions {
    CJOpenLinkOptions(
        let hasValue: Bool,
        let appLinkingOnly: Bool,
        let parameters: CString
    ) {}

    unsafe func free() {
        LibC.free(parameters)
    }
}

@C
struct CJAtomicServiceOptions {
    CJAtomicServiceOptions(
        let hasValue: Bool,
        let flags: Int32,
        let parameters: CString,
        let startOptions: CJNewStartOptions
    ) {}

    unsafe func free() {
        LibC.free(parameters)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class AbilityStartCallback {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public AbilityStartCallback(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onError: (Int32, String, String) -> Unit,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onResult!: ?(AbilityResult) -> Unit = None
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class OpenLinkOptions {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public OpenLinkOptions(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let appLinkingOnly!: Bool = false,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let parameters!: String = ""
    ) {}
}

unsafe func toCJOpenLinkOptions(option: ?OpenLinkOptions): CJOpenLinkOptions {
    if (let Some(v) <- option) {
        let paramJsonObj = jsStringToJsObject(v.parameters)
        return CJOpenLinkOptions(true, v.appLinkingOnly, LibC.mallocCString(jsonObjectWrapper(paramJsonObj).toString()))
    } else {
        return CJOpenLinkOptions(false, false, CString(CPointer<UInt8>()))
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class AtomicServiceOptions <: StartOptions {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var flags: Int32 = 0
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var parameters: String = ""

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public init() {
        super()
    }
}

unsafe func toCJAtomicServiceOptions(option: ?AtomicServiceOptions): CJAtomicServiceOptions {
    if (let Some(v) <- option) {
        let paramJsonObj = jsStringToJsObject(v.parameters)
        return CJAtomicServiceOptions(
            true,
            v.flags,
            LibC.mallocCString(jsonObjectWrapper(paramJsonObj).toString()),
            v.toCJNewStartOptions()
        )
    } else {
        return CJAtomicServiceOptions(
            false,
            0,
            CString(CPointer<UInt8>()),
            CJNewStartOptions(WINDOW_MODE_UNDEFINED.getValue(), 0, true, 0, 0, 0, 0, PROCESS_MODE_UNSPECIFIED,
                STARTUP_VISIBILITY_UNSPECIFIED)
        )
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public open class StartOptions {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var windowMode: WindowMode = WINDOW_MODE_UNDEFINED
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var displayId: Int32 = 0
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var withAnimation: Bool = true
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var windowLeft: Int32 = 0
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var windowTop: Int32 = 0
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var windowWidth: Int32 = 0
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var windowHeight: Int32 = 0
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var processMode: ?ProcessMode = None
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var startupVisibility: ?StartupVisibility = None

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public init(
        windowMode!: WindowMode = WINDOW_MODE_UNDEFINED,
        displayId!: Int32 = 0
    ) {
        this.windowMode = windowMode
        this.displayId = displayId
    }

    func toExternal(): CJStartOptions {
        return CJStartOptions(windowMode.getValue(), displayId)
    }

    func toCJNewStartOptions(): CJNewStartOptions {
        return CJNewStartOptions(
            windowMode.getValue(),
            displayId,
            withAnimation,
            windowLeft,
            windowTop,
            windowWidth,
            windowHeight,
            processMode?.getValue() ?? PROCESS_MODE_UNSPECIFIED,
            startupVisibility?.getValue() ?? STARTUP_VISIBILITY_UNSPECIFIED
        )
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.AccessToken"
]
public class PermissionRequestResult {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.AccessToken"
    ]
    public PermissionRequestResult(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.AccessToken"
        ]
        public let permissions: Array<String>,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Security.AccessToken"
        ]
        public let authResults: Array<Int32>
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityBase"
]
public struct AbilityResult {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public AbilityResult(
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityBase"
        ]
        public let resultCode: Int32,
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityBase"
        ]
        public let want: Want
    ) {}
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum ResultCode {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    RESULT_OK
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    RESULT_CANCEL
    | ...

    static func parse(value: Int32): ResultCode {
        match (value) {
            case 0 => RESULT_OK
            case 1 => RESULT_CANCEL
            case _ =>
                ABILITY_LOG.error("No corresponding ResultCode: ${value}")
                throw Exception("No corresponding ResultCode: ${value}")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case RESULT_OK => 0
            case RESULT_CANCEL => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class DialogRequestResult {
    DialogRequestResult(
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public var resultCode: ResultCode,
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public var want: ?Want
    ) {}
}

type StageContext = CPointer<Unit>

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public func getStageContext(abilityContext: UIAbilityContext): StageContext {
    unsafe {
        FFIGetContext(abilityContext.getID())
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public func getNapiValue(env: CPointer<Unit>, context: StageContext): CPointer<Unit> {
    unsafe {
        FFICreateNapiValue(env, context)
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public open class UIAbilityContext <: Context {
    private static let BROKER: AbilityContextBroker = getBroker()

    // connectId is the id of the ability connected shared by all UIAbilityContext objects.
    private static var connectId = AtomicInt64(0)
    private static var abilityConnects = HashMap<Int64, (Want, ConnectOptions)>()

    // curRequestCode is the key of callbacks stored in native owned by UIAbilityContext instance.
    private var curRequestCode = AtomicInt32(0)
    private var mtx = Mutex()
    private static var filesDir_: ?String = None

    var windowStage_: ?WindowStage = None

    init(id: Int64) {
        super(UIAbilityContext.create(id))
    }

    private static func getBroker(): AbilityContextBroker {
        let nativeHandle = unsafe { FFIAbilityContextGetBroker() }
        if (nativeHandle.isNull()) {
            ABILITY_LOG.error("Invalid broker, failed to get AbilityContextBroker")
            throw Exception("Invalid broker, failed to get AbilityContextBroker")
        }

        let abilityContextBroker = unsafe { nativeHandle.read() }
        ABILITY_LOG.info("Get AbilityContextBroker successfully")
        return abilityContextBroker
    }

    private static func create(id: Int64): Int64 {
        var status = unsafe { BROKER.isAbilityContextExisted(id) }
        if (status == true) {
            return id
        }

        ABILITY_LOG.error("Invalid id, failed to create UIAbilityContext")
        throw Exception("Invalid id, failed to create UIAbilityContext")
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop filesDir: String {
        get() {
            match (filesDir_) {
                case Some(v) => v
                case _ =>
                    let callback: CFunc<(CString) -> Unit> = {
                        content => filesDir_ = content.toString()
                    }
                    unsafe { FFIAbilityContextGetFilesDir(getID(), callback) }
                    filesDir_.getOrThrow()
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
    public prop abilityInfo: AbilityInfo {
        get() {
            unsafe {
                var errorCode: Int32 = 0
                let ret = FFIAbilityContextPropAbilityInfo(this.getID(), inout errorCode)
                checkCodeAndThrow(errorCode)
                let abilityInfo = AbilityInfo(ret)
                ret.free()
                return abilityInfo
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
    public prop currentHapModuleInfo: HapModuleInfo {
        get() {
            unsafe {
                var errorCode: Int32 = 0
                let ret = FFIAbilityContextPropCurrentHapModuleInfo(this.getID(), inout errorCode)
                checkCodeAndThrow(errorCode)
                let hapModuleInfo = HapModuleInfo(ret)
                ret.free()
                return hapModuleInfo
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
    public prop config: AbilityConfiguration {
        get() {
            unsafe {
                var errorCode: Int32 = 0
                let ret = FFIAbilityContextPropConfiguration(this.getID(), inout errorCode)
                checkCodeAndThrow(errorCode)
                let configuration = ret.toConfiguration()
                ret.free()
                return configuration
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop windowStage: ?WindowStage {
        get() {
            return windowStage_
        }
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
            let errorCode = unsafe { BROKER.startAbility(this.getID(), wantHandle) }
            unsafe { Want.releaseWantHandle(wantHandle) }
            ABILITY_LOG.info("startAbility: errorCode is ${errorCode}")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func startAbility(want: Want, options: StartOptions): Future<Unit> {
        spawn {
            let wantHandle = want.createWantHandle()
            let cOptions = options.toCJNewStartOptions()
            let errorCode = unsafe {
                FFIAbilityContextStartAbilityWithOptions(this.getID(), wantHandle, cOptions)
            }
            unsafe { Want.releaseWantHandle(wantHandle) }
            checkCodeAndThrow(errorCode)
        }
    }

    func startAbilityWithAccount(want: Want, accountId: Int32): Future<Unit> {
        spawn {
            let wantHandle = want.createWantHandle()
            let errorCode = unsafe { BROKER.startAbilityWithAccount(this.getID(), wantHandle, accountId) }
            unsafe { Want.releaseWantHandle(wantHandle) }
            ABILITY_LOG.info("startAbilityWithAccount: errorCode is ${errorCode}")
        }
    }

    func startAbilityWithAccount(want: Want, accountId: Int32, options: StartOptions): Future<Unit> {
        spawn {
            var cOptions = options.toExternal()
            let wantHandle = want.createWantHandle()
            let errorCode = unsafe {
                BROKER.startAbilityWithAccountAndOption(this.getID(), wantHandle, accountId, inout cOptions)
            }
            unsafe { Want.releaseWantHandle(wantHandle) }
            ABILITY_LOG.info("startAbilityWithAccount: errorCode is ${errorCode}")
        }
    }

    func startServiceExtensionAbility(want: Want): Future<Unit> {
        spawn {
            let wantHandle = want.createWantHandle()
            let errorCode = unsafe { BROKER.startServiceExtensionAbility(this.getID(), wantHandle) }
            unsafe { Want.releaseWantHandle(wantHandle) }
            ABILITY_LOG.info("startServiceExtensionAbility: errorCode is ${errorCode}")
        }
    }

    func startServiceExtensionAbilityWithAccount(want: Want, accountId: Int32): Future<Unit> {
        spawn {
            let wantHandle = want.createWantHandle()
            let errorCode = unsafe { BROKER.startServiceExtensionAbilityWithAccount(this.getID(), wantHandle, accountId) }
            unsafe { Want.releaseWantHandle(wantHandle) }
            ABILITY_LOG.info("startServiceExtensionAbilityWithAccount: errorCode is ${errorCode}")
        }
    }

    func stopServiceExtensionAbility(want: Want): Future<Unit> {
        spawn {
            let wantHandle = want.createWantHandle()
            let errorCode = unsafe { BROKER.stopServiceExtensionAbility(this.getID(), wantHandle) }
            unsafe { Want.releaseWantHandle(wantHandle) }
            ABILITY_LOG.info("stopServiceExtensionAbility: errorCode is ${errorCode}")
        }
    }

    func stopServiceExtensionAbilityWithAccount(want: Want, accountId: Int32): Future<Unit> {
        spawn {
            let wantHandle = want.createWantHandle()
            let errorCode = unsafe { BROKER.stopServiceExtensionAbilityWithAccount(this.getID(), wantHandle, accountId) }
            unsafe { Want.releaseWantHandle(wantHandle) }
            ABILITY_LOG.info("stopServiceExtensionAbilityWithAccount: errorCode is ${errorCode}")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func terminateSelf(): Future<Unit> {
        spawn {
            let errorCode = unsafe { BROKER.terminateSelf(this.getID()) }
            ABILITY_LOG.info("terminateSelf: errorCode is ${errorCode}")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func terminateSelfWithResult(parameter: AbilityResult): Future<Unit> {
        spawn {
            let wantHandle = parameter.want.createWantHandle()
            let errorCode = unsafe { BROKER.terminateSelfWithResult(this.getID(), wantHandle, parameter.resultCode) }
            unsafe { Want.releaseWantHandle(wantHandle) }
            ABILITY_LOG.info("terminateSelfWithResult: errorCode is ${errorCode}")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func isTerminating(): Bool {
        var res = unsafe { BROKER.isTerminating(this.getID()) }
        if (res.code == SUCCESS_CODE) {
            return res.data
        }
        ABILITY_LOG.error("Failed to invoke isTerminating and the error code is ${res.code}")
        throw Exception("Failed to invoke isTerminating and the error code is ${res.code}")
    }

    func connectServiceExtensionAbility(want: Want, options: ConnectOptions): Int64 {
        let wantHandle = want.createWantHandle()
        var res = unsafe { BROKER.connectAbility(this.getID(), wantHandle, options.getID()) }
        unsafe { Want.releaseWantHandle(wantHandle) }
        if (res != 0) {
            throw BusinessException(res, getErrorMsg(res))
        }
        afterConnectAbility(want, res, options)
    }

    private func afterConnectAbility(want: Want, res: Int32, options: ConnectOptions) {
        if (res == SUCCESS_CODE) {
            connectId.fetchAdd(1)
            let id = connectId.load()
            synchronized(mtx) {
                abilityConnects.add(id, (want, options))
            }
            ABILITY_LOG.info("Connect Ability successfully and the connectId is ${id}")
            return id
        }
        options.onFailed(res)
        ABILITY_LOG.error("Failed to connect ability, errorCode is ${res}")
        throw Exception("Failed to connect ability, errorCode is ${res}")
    }

    func connectAbilityWithAccount(want: Want, accountId: Int32, options: ConnectOptions): Int64 {
        let wantHandle = want.createWantHandle()
        var res = unsafe { BROKER.connectAbilityWithAccount(this.getID(), wantHandle, accountId, options.getID()) }
        unsafe { Want.releaseWantHandle(wantHandle) }
        afterConnectAbility(want, res, options)
    }

    func disconnectAbility(connection: Int64): Future<Unit> {
        spawn {
            var item = abilityConnects.get(connection)
            match (item) {
                case None => ABILITY_LOG.error("Failed to get want and connectOptions, id is: ${connection}")
                case Some(connects) => dealDisconnectAbility(connection, connects)
            }
        }
    }

    private func dealDisconnectAbility(connection: Int64, connects: (Want, ConnectOptions)) {
        var wantHandle = connects[0].createWantHandle()
        var connectOptions = connects[1]
        let errorCode = unsafe { BROKER.disconnectAbility(this.getID(), wantHandle, connectOptions.getID()) }
        unsafe { Want.releaseWantHandle(wantHandle) }
        if (errorCode == SUCCESS_CODE) {
            synchronized(mtx) {
                abilityConnects.remove(connection)
            }
            ABILITY_LOG.info("Succeed to disconnect Ability")
        } else {
            ABILITY_LOG.error("Failed to disconnect Ability: errorCode is ${errorCode}")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func startAbilityForResult(want: Want, callback: AsyncCallback<AbilityResult>): Unit {
        let requestCode = genRequestCode()
        let wantHandle = want.createWantHandle()
        let lambdaData = ResultCallbackForAbilityResult(callback)
        let errorCode = unsafe {
            BROKER.startAbilityForResult(this.getID(), wantHandle, requestCode, lambdaData.getID())
        }
        unsafe { Want.releaseWantHandle(wantHandle) }
        ABILITY_LOG.info("startAbilityForResult: errorCode is ${errorCode}")
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func startAbilityForResult(want: Want, options: StartOptions, callback: AsyncCallback<AbilityResult>): Unit {
        let requestCode = genRequestCode()
        var cOptions = options.toExternal()
        let wantHandle = want.createWantHandle()
        let lambdaData = ResultCallbackForAbilityResult(callback)
        let errorCode = unsafe {
            BROKER.startAbilityForResultWithOption(
                this.getID(),
                wantHandle,
                inout cOptions,
                requestCode,
                lambdaData.getID()
            )
        }
        unsafe { Want.releaseWantHandle(wantHandle) }
        ABILITY_LOG.info("startAbilityForResult: errorCode is ${errorCode}")
    }

    func startAbilityForResultWithAccount(
        want: Want,
        accountId: Int32,
        callback: AsyncCallback<AbilityResult>
    ): Unit {
        let requestCode = genRequestCode()
        let wantHandle = want.createWantHandle()
        let lambdaData = ResultCallbackForAbilityResult(callback)
        let errorCode = unsafe {
            BROKER.startAbilityForResultWithAccount(
                this.getID(),
                wantHandle,
                accountId,
                requestCode,
                lambdaData.getID()
            )
        }
        unsafe { Want.releaseWantHandle(wantHandle) }
        ABILITY_LOG.info("startAbilityForResultWithAccount: errorCode is ${errorCode}")
    }

    func startAbilityForResultWithAccount(
        want: Want,
        accountId: Int32,
        options: StartOptions,
        callback: AsyncCallback<AbilityResult>
    ): Unit {
        let requestCode = genRequestCode()
        var cOptions = options.toExternal()
        let wantHandle = want.createWantHandle()
        let lambdaData = ResultCallbackForAbilityResult(callback)
        let errorCode = unsafe {
            BROKER.startAbilityForResultWithAccountAndOption(
                this.getID(),
                wantHandle,
                accountId,
                inout cOptions,
                requestCode,
                lambdaData.getID()
            )
        }
        unsafe { Want.releaseWantHandle(wantHandle) }
        ABILITY_LOG.info("startAbilityForResultWithAccount: errorCode is ${errorCode}")
    }

    /*
     * @brief setMissionLabel(label: string, callback: AsyncCallback<void>): void
     * @brief setMissionLabel(label: string): Promise<void>
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func setMissionLabel(label: String): Future<Unit> {
        spawn {
            let cLabel = unsafe { LibC.mallocCString(label) }
            let errorCode = unsafe { BROKER.setMissionLabel(this.getID(), cLabel) }
            unsafe { LibC.free(cLabel) }
            ABILITY_LOG.info("setMissionLabel: errorCode is ${errorCode}")
        }
    }

    func setMissionIcon(icon: PixelMap): Future<Unit> {
        spawn {
            let errorCode = unsafe { BROKER.setMissionIcon(this.getID(), icon.getID()) }
            ABILITY_LOG.info("setMissionIcon: errorCode is ${errorCode}")
        }
    }

    func requestPermissionsFromUser(
        permissions: Array<String>,
        requestCallback: AsyncCallback<PermissionRequestResult>
    ): Unit {
        let requestCode = genRequestCode()
        let permissionsSize: Int64 = permissions.size
        var nativePermissions = FFIVectorString(permissionsSize)
        for (i in 0..permissionsSize) {
            nativePermissions.setElement(i, permissions[i])
        }

        let lambdaData = ResultCallbackForPermissionRequestResult(requestCallback)
        let lambdaId = lambdaData.getID()
        let errorCode = unsafe {
            BROKER.requestPermissionsFromUser(
                this.getID(),
                nativePermissions.getNativeHandle(),
                requestCode,
                lambdaId
            )
        }
        ABILITY_LOG.info("requestPermissionsFromUser: errorCode is ${errorCode}")
        nativePermissions.free()
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func requestDialogService(want: Want, callback: AsyncCallback<DialogRequestResult>): Unit {
        let wantHandle = want.createWantHandle()
        let errorCode = unsafe {
            FFIAbilityContextRequestDialogService(this.getID(), wantHandle,
                ResultCallbackForDialogRequestResult(callback).getID())
        }
        unsafe { Want.releaseWantHandle(wantHandle) }
        ABILITY_LOG.info("requestDialogService: errorCode is ${errorCode}")
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func requestDialogService(want: Want): Future<DialogRequestResult> {
        spawn {
            let mutex = Mutex()
            let flag = Box<AtomicBool>(AtomicBool(false))
            let condition: Condition = synchronized(mutex) {
                mutex.condition()
            }
            let result: DialogRequestResult = DialogRequestResult(ResultCode.RESULT_CANCEL, None)
            let wantHandle = want.createWantHandle()
            let callback: AsyncCallback<DialogRequestResult> = {
                err: Option<AsyncError>, data: Option<DialogRequestResult> =>
                match (err) {
                    case None =>
                        result.resultCode = ResultCode.RESULT_OK
                        result.want = data.getOrThrow().want
                    case _ => ABILITY_LOG.info("requestDialogService callback error")
                }
                synchronized(mutex) {
                    condition.notify()
                    flag.value.store(true)
                }
            }
            let errorCode = unsafe {
                FFIAbilityContextRequestDialogService(this.getID(), wantHandle,
                    ResultCallbackForDialogRequestResult(callback).getID())
            }
            unsafe { Want.releaseWantHandle(wantHandle) }
            ABILITY_LOG.info("requestDialogService: errorCode is ${errorCode}")
            synchronized(mutex) {
                condition.waitUntil {=> flag.value.load()}
            }
            result
        }
    }

    /*
     * @brief moveAbilityToBackground(): Promise<void>
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func moveAbilityToBackground(): Unit {
        let errorCode = unsafe {
            FFIAbilityContextMoveAbilityToBackground(this.getID())
        }
        checkCodeAndThrow(errorCode)
    }

    /*
     * @brief startAbilityByType(type: string, wantParam: Record<string, Object>,
     *           abilityStartCallback: AbilityStartCallback, callback: AsyncCallback<void>) : void
     * @brief startAbilityByType(type: string, wantParam: Record<string, Object>,
     *           abilityStartCallback: AbilityStartCallback) : Promise<void>
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func startAbilityByType(abilityType: String, wantParam: String, abilityStartCallback: AbilityStartCallback): Unit {
        let paramJsonObj = jsStringToJsObject(wantParam)
        var errorCode: Int32 = 0
        let onErrorWrapper = {
            code: Int32, cName: CString, cMessage: CString =>
            let name = cName.toString()
            let message = cMessage.toString()
            unsafe {
                LibC.free(cName)
                LibC.free(cMessage)
            }
            abilityStartCallback.onError(code, name, message)
        }
        let onResult = abilityStartCallback.onResult ?? {
            _: AbilityResult => ()
        }
        let onResultWrapper = {
            cjResult: CJAbilityResult =>
            let abilityResult = AbilityResult(cjResult.resultCode, Want(cjResult.wantHandle))
            onResult(abilityResult)
        }
        let onErrorCallback = Callback3Param<Int32, CString, CString, Unit>(onErrorWrapper)
        let onResultCallback = Callback1Param<CJAbilityResult, Unit>(onResultWrapper)
        unsafe {
            try (
                cAbilityType = LibC.mallocCString(abilityType).asResource(),
                cWantParam = LibC.mallocCString(jsonObjectWrapper(paramJsonObj).toString()).asResource()
            ) {
                errorCode = FFIAbilityContextStartAbilityByType(getID(), cAbilityType.value, cWantParam.value,
                    onErrorCallback.getID(), onResultCallback.getID())
            }
        }
        checkCodeAndThrow(errorCode)
    }

    /*
     * @brief openLink(link: string, options?: OpenLinkOptions, callback?: AsyncCallback<AbilityResult>): Promise<void>
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func openLink(link: String, options!: ?OpenLinkOptions = None,
        callback!: ?AsyncCallback<AbilityResult> = None): Unit {
        let requestCode = genRequestCode()
        let lambdaDataId = if (let Some(v) <- callback) {
            ResultCallbackForAbilityResult(v).getID()
        } else {
            -1 // No callback
        }
        var errorCode: Int32 = 0
        unsafe {
            try (cLink = LibC.mallocCString(link).asResource()) {
                let cOption = toCJOpenLinkOptions(options)
                errorCode = FFIAbilityContextOpenLink(this.getID(), cLink.value, cOption, requestCode, lambdaDataId)
                cOption.free()
            }
        }
        checkCodeAndThrow(errorCode)
    }

    /*
     * @brief openAtomicService(appId: string, options?: AtomicServiceOptions): Promise<AbilityResult>
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func openAtomicService(appId: String, options!: ?AtomicServiceOptions = None,
        callback!: AsyncCallback<AbilityResult>): Unit {
        let requestCode = genRequestCode()
        let lambdaDataId = ResultCallbackForAbilityResult(callback).getID()
        var errorCode: Int32 = 0
        unsafe {
            try (cAppId = LibC.mallocCString(appId).asResource()) {
                let cOption = toCJAtomicServiceOptions(options)
                errorCode = FFIAbilityContextOpenAtomicService(this.getID(), cAppId.value, cOption, requestCode,
                    lambdaDataId)
                cOption.free()
            }
        }
        checkCodeAndThrow(errorCode)
    }

    /*
     * @brief backToCallerAbilityWithResult(abilityResult: AbilityResult, requestCode: string): Promise<void>
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func backToCallerAbilityWithResult(abilityResult: AbilityResult, requestCode: String): Unit {
        var errorCode: Int32 = 0
        let reallCode = if (requestCode.size >= 2 && requestCode[0] == b'"' && requestCode[requestCode.size - 1] == b'"') {
            requestCode[1..requestCode.size - 1]
        } else {
            requestCode
        }
        unsafe {
            try (cRequestCode = LibC.mallocCString(reallCode).asResource()) {
                let wantHandle = abilityResult.want.createWantHandle()
                errorCode = FFIAbilityContextBackToCallerAbilityWithResult(this.getID(),
                    CJAbilityResult(abilityResult.resultCode, wantHandle), cRequestCode.value)
                Want.releaseWantHandle(wantHandle)
            }
        }
        checkCodeAndThrow(errorCode)
    }

    /*
     * @brief setRestoreEnabled(enabled: boolean): Promise<void>
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func setRestoreEnabled(enabled: Bool): Unit {
        let errorCode = unsafe {
            FFIAbilityContextSetRestoreEnabled(this.getID(), enabled)
        }
        checkCodeAndThrow(errorCode)
    }

    /*
     * @brief setMissionContinueState(state: AbilityConstant.ContinueState, callback: AsyncCallback<void>): void
     * @brief setMissionContinueState(state: AbilityConstant.ContinueState): Promise<void>
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func setMissionContinueState(state: ContinueState): Unit {
        let errorCode = unsafe {
            FFIAbilityContextSetMissionContinueState(this.getID(), state.getValue())
        }
        checkCodeAndThrow(errorCode)
    }

    /*
     * @brief reportDrawnCompleted(callback: AsyncCallback<void>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func reportDrawnCompleted(callback: AsyncCallback<Unit>): Unit {
        var errorCode = unsafe {
            FFIAbilityContextReportDrawnCompleted(this.getID())
        }
        if (errorCode != 0) {
            errorCode = innerToErrorCode(errorCode)
            callback(AsyncError(errorCode), None)
        } else {
            callback(None, ())
        }
    }

    /*
     * @brief showAbility(): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func showAbility(): Unit {
        let errorCode = unsafe {
            FFIAbilityContextShowAbility(this.getID())
        }
        checkCodeAndThrow(errorCode)
    }

    /*
     * @brief hideAbility(): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func hideAbility(): Unit {
        let errorCode = unsafe {
            FFIAbilityContextHideAbility(this.getID())
        }
        checkCodeAndThrow(errorCode)
    }

    /*
     * @brief startAbilityByCall(want: Want): Promise<Caller>
     */
    @!APILevel[
        19,
        permission: "ohos.permission.DISTRIBUTED_DATASYNC",
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func startAbilityByCall(want: Want): Caller {
        unsafe {
            var callerId = 0
            var remoteId = 0
            let wantHandle = want.createWantHandle()
            let errorCode = FFIAbilityContextStartAbilityByCall(
                this.getID(),
                wantHandle,
                inout callerId,
                inout remoteId
            )
            Want.releaseWantHandle(wantHandle)
            if (errorCode != 0) {
                throw BusinessException(errorCode, getErrorMsg(errorCode))
            }
            return Caller(callerId, remoteId)
        }
    }

    private func genRequestCode(): Int32 {
        if (!curRequestCode.compareAndSwap(Int32.Max, 0)) {
            curRequestCode.fetchAdd(1)
        }
        curRequestCode.load()
    }
}

@Deprecated["Use UIAbilityContext instead", since: "19"]
public type AbilityContext = UIAbilityContext
