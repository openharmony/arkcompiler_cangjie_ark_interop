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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class OpenLinkOptions {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var appLinkingOnly: Bool

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var parameters: String

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public init(appLinkingOnly!: Bool = false, parameters!: String = "") {
        this.appLinkingOnly = appLinkingOnly
        this.parameters = parameters
    }
}

unsafe func toCJOpenLinkOptions(option: ?OpenLinkOptions): CJOpenLinkOptions {
    if (let Some(v) <- option) {
        let paramJsonObj = jsStringToJsObject(v.parameters)
        return CJOpenLinkOptions(true, v.appLinkingOnly, LibC.mallocCString(jsonObjectWrapper(paramJsonObj).toString()))
    } else {
        return CJOpenLinkOptions(false, false, CString(CPointer<UInt8>()))
    }
}

class StartOptionsImpl {}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public open class StartOptions {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var windowMode: WindowMode = WindowModeUndefined
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var displayId: Int32 = 0
    var withAnimation: Bool = true
    var windowLeft: Int32 = 0
    var windowTop: Int32 = 0
    var windowWidth: Int32 = 0
    var windowHeight: Int32 = 0
    var processMode: ?ProcessMode = None
    var startupVisibility: ?StartupVisibility = None
    private let impl_: StartOptionsImpl = StartOptionsImpl()

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public init(
        windowMode!: WindowMode = WindowModeUndefined,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityBase"
]
public class AbilityResult {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var resultCode: Int32

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var want: Want

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public init(resultCode: Int32, want!: Want = Want()) {
        this.resultCode = resultCode
        this.want = want
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum ResultCode {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    ResultOk
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    ResultCancel
    | ...

    static func parse(value: Int32): ResultCode {
        match (value) {
            case 0 => ResultOk
            case 1 => ResultCancel
            case _ =>
                ABILITY_LOG.error("No corresponding ResultCode: ${value}")
                throw Exception("No corresponding ResultCode: ${value}")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case ResultOk => 0
            case ResultCancel => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class RequestResult {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var resultCode: ResultCode

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var want: ?Want

    init(resultCode: ResultCode, want: ?Want) {
        this.resultCode = resultCode
        this.want = want
    }
}

type StageContext = CPointer<Unit>

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public func getStageContext(abilityContext: UIAbilityContext): StageContext {
    unsafe {
        FFIGetContext(abilityContext.getID())
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public func getNapiValue(env: CPointer<Unit>, context: StageContext): CPointer<Unit> {
    unsafe {
        FFICreateNapiValue(env, context)
    }
}

class UIAbilityContextImpl {}

@!APILevel[
    21,
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

    private let UIAbilityContextImpl_ = UIAbilityContextImpl()

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
        21,
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
        21,
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
        21,
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
        21,
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
        21,
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
        21,
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
        21,
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

    func setMissionIcon(icon: PixelMap): Future<Unit> {
        spawn {
            let errorCode = unsafe { BROKER.setMissionIcon(this.getID(), icon.getID()) }
            ABILITY_LOG.info("setMissionIcon: errorCode is ${errorCode}")
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func requestDialogService(want: Want, result: AsyncCallback<RequestResult>): Unit {
        let wantHandle = want.createWantHandle()
        let errorCode = unsafe {
            FFIAbilityContextRequestDialogService(this.getID(), wantHandle,
                ResultCallbackForDialogRequestResult(result).getID())
        }
        unsafe { Want.releaseWantHandle(wantHandle) }
        ABILITY_LOG.info("requestDialogService: errorCode is ${errorCode}")
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func requestDialogService(want: Want): Future<RequestResult> {
        spawn {
            let mutex = Mutex()
            let flag = Box<AtomicBool>(AtomicBool(false))
            let condition: Condition = synchronized(mutex) {
                mutex.condition()
            }
            let result: RequestResult = RequestResult(ResultCode.ResultCancel, None)
            let wantHandle = want.createWantHandle()
            let callback: AsyncCallback<RequestResult> = {
                err: Option<AsyncError>, data: Option<RequestResult> =>
                match (err) {
                    case None =>
                        result.resultCode = ResultCode.ResultOk
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

    private func genRequestCode(): Int32 {
        if (!curRequestCode.compareAndSwap(Int32.Max, 0)) {
            curRequestCode.fetchAdd(1)
        }
        curRequestCode.load()
    }
}
