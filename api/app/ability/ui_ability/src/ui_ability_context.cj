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

package ohos.app.ability.ui_ability

import ohos.app.ability.want.*
import ohos.ability.ability_result.*
import ohos.ability.connect_options.*
import ohos.app.ability.configuration.*
import ohos.app.ability.dialog_request.*
import ohos.app.ability.open_link_options.*
import ohos.app.ability.start_options.*
import ohos.base.*
import ohos.bundle.bundle_manager.*
import ohos.ffi.*
import ohos.multimedia.image.*
import ohos.application.event_hub.*
import ohos.window.*
import std.sync.*
import std.collection.*
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
struct CJPermissionRequestResult {
    CJPermissionRequestResult(
        let permissions: VectorStringHandle,
        let authResults: VectorInt32Handle
    ) {}
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

type StageContext = CPointer<Unit>

protected func getStageContext(abilityContext: UIAbilityContext): StageContext {
    unsafe {
        FFIGetContext(abilityContext.getID())
    }
}

class UIAbilityContextImpl {}

/**
 * The context of an ability. It allows access to ability-specific resources.
 *
 * @relation declare class UIAbilityContext extends Context
 */
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

    /**
    * Starts a new ability. If the caller application is in foreground, you can use this method to start ability;
    * If the caller application is in the background, you need to apply for permission:ohos.permission.START_ABILITIES_FROM_BACKGROUND.
    * If the target ability is visible, you can start the target ability; If the target ability is invisible,
    * you need to apply for permission:ohos.permission.START_INVISIBLE_ABILITY to start target invisible ability.
    * If the target ability is in cross-device, you need to apply for permission:ohos.permission.DISTRIBUTED_DATASYNC.
    *
    * @throws { BusinessException } 201 - The application does not have permission to call the interface.
    * @throws { BusinessException } 401 - Parameter error. Possible causes: 1.Mandatory parameters are left unspecified. 2.Incorrect parameter types.
    * @throws { BusinessException } 801 - Capability not support.
    * @throws { BusinessException } 16000001 - The specified ability does not exist.
    * @throws { BusinessException } 16000002 - Incorrect ability type.
    * @throws { BusinessException } 16000004 - Cannot start an invisible component.
    * @throws { BusinessException } 16000005 - The specified process does not have the permission.
    * @throws { BusinessException } 16000006 - Cross-user operations are not allowed.
    * @throws { BusinessException } 16000008 - The crowdtesting application expires.
    * @throws { BusinessException } 16000009 - An ability cannot be started or stopped in Wukong mode.
    * @throws { BusinessException } 16000010 - The call with the continuation and prepare continuation flag is forbidden.
    * @throws { BusinessException } 16000011 - The context does not exist.
    * @throws { BusinessException } 16000012 - The application is controlled.
    * @throws { BusinessException } 16000013 - The application is controlled by EDM.
    * @throws { BusinessException } 16000018 - Redirection to a third-party application is not allowed in API version greater than 11.
    * @throws { BusinessException } 16000019 - No matching ability is found.
    * @throws { BusinessException } 16000050 - Internal error.
    * @throws { BusinessException } 16000053 - The ability is not on the top of the UI.
    * @throws { BusinessException } 16000055 - Installation-free timed out.
    * @throws { BusinessException } 16000067 - The StartOptions check failed.
    * @throws { BusinessException } 16000068 - The ability is already running.
    * @throws { BusinessException } 16000071 - App clone is not supported.
    * @throws { BusinessException } 16000072 - App clone or multi-instance is not supported.
    * @throws { BusinessException } 16000073 - The app clone index is invalid.
    * @throws { BusinessException } 16000076 - The app instance key is invalid.
    * @throws { BusinessException } 16000077 - The number of app instances reaches the limit.
    * @throws { BusinessException } 16000078 - The multi-instance is not supported.
    * @throws { BusinessException } 16000079 - The APP_INSTANCE_KEY cannot be specified.
    * @throws { BusinessException } 16000080 - Creating a new instance is not supported.
    * @throws { BusinessException } 16200001 - The caller has been released.
    * @throws { BusinessException } 16300003 - The target application is not the current application.
    * @relation startAbility(want: Want, options?: StartOptions): Promise<void>
    */
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

    /**
    * Starts a new ability. If the caller application is in foreground, you can use this method to start ability;
    * If the caller application is in the background, you need to apply for permission:ohos.permission.START_ABILITIES_FROM_BACKGROUND.
    * If the target ability is visible, you can start the target ability; If the target ability is invisible,
    * you need to apply for permission:ohos.permission.START_INVISIBLE_ABILITY to start target invisible ability.
    * If the target ability is in cross-device, you need to apply for permission:ohos.permission.DISTRIBUTED_DATASYNC.
    *
    * @throws { BusinessException } 201 - The application does not have permission to call the interface.
    * @throws { BusinessException } 401 - Parameter error. Possible causes: 1.Mandatory parameters are left unspecified. 2.Incorrect parameter types.
    * @throws { BusinessException } 801 - Capability not support.
    * @throws { BusinessException } 16000001 - The specified ability does not exist.
    * @throws { BusinessException } 16000002 - Incorrect ability type.
    * @throws { BusinessException } 16000004 - Cannot start an invisible component.
    * @throws { BusinessException } 16000005 - The specified process does not have the permission.
    * @throws { BusinessException } 16000006 - Cross-user operations are not allowed.
    * @throws { BusinessException } 16000008 - The crowdtesting application expires.
    * @throws { BusinessException } 16000009 - An ability cannot be started or stopped in Wukong mode.
    * @throws { BusinessException } 16000010 - The call with the continuation and prepare continuation flag is forbidden.
    * @throws { BusinessException } 16000011 - The context does not exist.
    * @throws { BusinessException } 16000012 - The application is controlled.
    * @throws { BusinessException } 16000013 - The application is controlled by EDM.
    * @throws { BusinessException } 16000018 - Redirection to a third-party application is not allowed in API version greater than 11.
    * @throws { BusinessException } 16000019 - No matching ability is found.
    * @throws { BusinessException } 16000050 - Internal error.
    * @throws { BusinessException } 16000053 - The ability is not on the top of the UI.
    * @throws { BusinessException } 16000055 - Installation-free timed out.
    * @throws { BusinessException } 16000067 - The StartOptions check failed.
    * @throws { BusinessException } 16000068 - The ability is already running.
    * @throws { BusinessException } 16000071 - App clone is not supported.
    * @throws { BusinessException } 16000072 - App clone or multi-instance is not supported.
    * @throws { BusinessException } 16000073 - The app clone index is invalid.
    * @throws { BusinessException } 16000076 - The app instance key is invalid.
    * @throws { BusinessException } 16000077 - The number of app instances reaches the limit.
    * @throws { BusinessException } 16000078 - The multi-instance is not supported.
    * @throws { BusinessException } 16000079 - The APP_INSTANCE_KEY cannot be specified.
    * @throws { BusinessException } 16000080 - Creating a new instance is not supported.
    * @throws { BusinessException } 16200001 - The caller has been released.
    * @throws { BusinessException } 16300003 - The target application is not the current application.
    * @relation startAbility(want: Want, options?: StartOptions): Promise<void>
    */
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

    /**
    * Destroys this Page ability.
    *
    * @throws { BusinessException } 16000009 - An ability cannot be started or stopped in Wukong mode.
    * @throws { BusinessException } 16000011 - The context does not exist.
    * @throws { BusinessException } 16000050 - Internal error.
    * @relation terminateSelf(): Promise<void>
    */
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

    /**
    * Destroys the Page ability while returning the specified result code and data to the caller.
    *
    * @throws { BusinessException } 401 - Parameter error. Possible causes: 1.Mandatory parameters are left unspecified. 2.Incorrect parameter types.
    * @throws { BusinessException } 16000009 - An ability cannot be started or stopped in Wukong mode.
    * @throws { BusinessException } 16000011 - The context does not exist.
    * @throws { BusinessException } 16000050 - Internal error.
    * @relation terminateSelfWithResult(parameter: AbilityResult): Promise<void>
    */
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

    /**
    * Check to see ability is in terminating state.
    *
    * @throws { BusinessException } 16000011 - The context does not exist.
    * @relation isTerminating(): boolean
    */
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

    /**
    * Starts an ability and returns the execution result when the ability is destroyed. If the caller application is in foreground,
    * you can use this method to start ability; If the caller application is in the background,
    * you need to apply for permission:ohos.permission.START_ABILITIES_FROM_BACKGROUND.
    * If the target ability is visible, you can start the target ability; If the target ability is invisible,
    * you need to apply for permission:ohos.permission.START_INVISIBLE_ABILITY to start target invisible ability.
    * If the target ability is in cross-device, you need to apply for permission:ohos.permission.DISTRIBUTED_DATASYNC.
    *
    * @throws { BusinessException } 201 - The application does not have permission to call the interface.
    * @throws { BusinessException } 401 - Parameter error. Possible causes: 1.Mandatory parameters are left unspecified. 2.Incorrect parameter types.
    * @throws { BusinessException } 16000001 - The specified ability does not exist.
    * @throws { BusinessException } 16000002 - Incorrect ability type.
    * @throws { BusinessException } 16000004 - Cannot start an invisible component.
    * @throws { BusinessException } 16000005 - The specified process does not have the permission.
    * @throws { BusinessException } 16000006 - Cross-user operations are not allowed.
    * @throws { BusinessException } 16000008 - The crowdtesting application expires.
    * @throws { BusinessException } 16000009 - An ability cannot be started or stopped in Wukong mode.
    * @throws { BusinessException } 16000010 - The call with the continuation and prepare continuation flag is forbidden.
    * @throws { BusinessException } 16000011 - The context does not exist.
    * @throws { BusinessException } 16000012 - The application is controlled.
    * @throws { BusinessException } 16000013 - The application is controlled by EDM.
    * @throws { BusinessException } 16000018 - Redirection to a third-party application is not allowed in API version greater than 11.
    * @throws { BusinessException } 16000019 - No matching ability is found.
    * @throws { BusinessException } 16000050 - Internal error.
    * @throws { BusinessException } 16000053 - The ability is not on the top of the UI.
    * @throws { BusinessException } 16000055 - Installation-free timed out.
    * @throws { BusinessException } 16000071 - App clone is not supported.
    * @throws { BusinessException } 16000072 - App clone or multi-instance is not supported.
    * @throws { BusinessException } 16000073 - The app clone index is invalid.
    * @throws { BusinessException } 16000076 - The app instance key is invalid.
    * @throws { BusinessException } 16000077 - The number of app instances reaches the limit.
    * @throws { BusinessException } 16000078 - The multi-instance is not supported.
    * @throws { BusinessException } 16000079 - The APP_INSTANCE_KEY cannot be specified.
    * @throws { BusinessException } 16000080 - Creating a new instance is not supported.
    * @throws { BusinessException } 16200001 - The caller has been released.
    * @relation startAbilityForResult(want: Want, callback: AsyncCallback<AbilityResult>): void
    */
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

    /**
    * Starts an ability and returns the execution result when the ability is destroyed. If the caller application is in foreground,
    * you can use this method to start ability; If the caller application is in the background,
    * you need to apply for permission:ohos.permission.START_ABILITIES_FROM_BACKGROUND.
    * If the target ability is visible, you can start the target ability; If the target ability is invisible,
    * you need to apply for permission:ohos.permission.START_INVISIBLE_ABILITY to start target invisible ability.
    * If the target ability is in cross-device, you need to apply for permission:ohos.permission.DISTRIBUTED_DATASYNC.
    *
    * @throws { BusinessException } 201 - The application does not have permission to call the interface.
    * @throws { BusinessException } 401 - Parameter error. Possible causes: 1.Mandatory parameters are left unspecified. 2.Incorrect parameter types.
    * @throws { BusinessException } 16000001 - The specified ability does not exist.
    * @throws { BusinessException } 16000004 - Cannot start an invisible component.
    * @throws { BusinessException } 16000005 - The specified process does not have the permission.
    * @throws { BusinessException } 16000006 - Cross-user operations are not allowed.
    * @throws { BusinessException } 16000008 - The crowdtesting application expires.
    * @throws { BusinessException } 16000009 - An ability cannot be started or stopped in Wukong mode.
    * @throws { BusinessException } 16000011 - The context does not exist.
    * @throws { BusinessException } 16000012 - The application is controlled.
    * @throws { BusinessException } 16000013 - The application is controlled by EDM.
    * @throws { BusinessException } 16000018 - Redirection to a third-party application is not allowed in API version greater than 11.
    * @throws { BusinessException } 16000019 - No matching ability is found.
    * @throws { BusinessException } 16000050 - Internal error.
    * @throws { BusinessException } 16000053 - The ability is not on the top of the UI.
    * @throws { BusinessException } 16000055 - Installation-free timed out.
    * @throws { BusinessException } 16000071 - App clone is not supported.
    * @throws { BusinessException } 16000072 - App clone or multi-instance is not supported.
    * @throws { BusinessException } 16000073 - The app clone index is invalid.
    * @throws { BusinessException } 16000076 - The app instance key is invalid.
    * @throws { BusinessException } 16000077 - The number of app instances reaches the limit.
    * @throws { BusinessException } 16000078 - The multi-instance is not supported.
    * @throws { BusinessException } 16000079 - The APP_INSTANCE_KEY cannot be specified.
    * @throws { BusinessException } 16000080 - Creating a new instance is not supported.
    * @throws { BusinessException } 16200001 - The caller has been released.
    * @relation startAbilityForResult(want: Want, options: StartOptions, callback: AsyncCallback<AbilityResult>): void
    */
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

    /**
    * Starts a service extension ability that supports modal dialog. If the caller application is in foreground,
    * you can use this method to start service extension ability; If the caller application is in the background,
    * you need to apply for permission:ohos.permission.START_ABILITIES_FROM_BACKGROUND.
    * If the target service extension ability is visible, you can start the target service extension ability;
    * If the target service extension ability is invisible,
    * you need to apply for permission:ohos.permission.START_INVISIBLE_ABILITY to start target invisible service extension ability.
    *
    * @throws { BusinessException } 201 - The application does not have permission to call the interface.
    * @throws { BusinessException } 401 - Parameter error. Possible causes: 1.Mandatory parameters are left unspecified. 2.Incorrect parameter types.
    * @throws { BusinessException } 16000001 - The specified ability does not exist.
    * @throws { BusinessException } 16000002 - Incorrect ability type.
    * @throws { BusinessException } 16000004 - Cannot start an invisible component.
    * @throws { BusinessException } 16000005 - The specified process does not have the permission.
    * @throws { BusinessException } 16000006 - Cross-user operations are not allowed.
    * @throws { BusinessException } 16000008 - The crowdtesting application expires.
    * @throws { BusinessException } 16000009 - An ability cannot be started or stopped in Wukong mode.
    * @throws { BusinessException } 16000010 - The call with the continuation and prepare continuation flag is forbidden.
    * @throws { BusinessException } 16000011 - The context does not exist.
    * @throws { BusinessException } 16000012 - The application is controlled.
    * @throws { BusinessException } 16000013 - The application is controlled by EDM.
    * @throws { BusinessException } 16000050 - Internal error.
    * @throws { BusinessException } 16000053 - The ability is not on the top of the UI.
    * @throws { BusinessException } 16000055 - Installation-free timed out.
    * @throws { BusinessException } 16200001 - The caller has been released.
    * @relation requestDialogService(want: Want, result: AsyncCallback<dialogRequest.RequestResult>): void
    */
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

    /**
    * Starts a service extension ability that supports modal dialog. If the caller application is in foreground,
    * you can use this method to start service extension ability; If the caller application is in the background,
    * you need to apply for permission:ohos.permission.START_ABILITIES_FROM_BACKGROUND.
    * If the target service extension ability is visible, you can start the target service extension ability;
    * If the target service extension ability is invisible,
    * you need to apply for permission:ohos.permission.START_INVISIBLE_ABILITY to start target invisible service
    * extension ability.
    *
    * @throws { BusinessException } 201 - The application does not have permission to call the interface.
    * @throws { BusinessException } 401 - Parameter error. Possible causes: 1.Mandatory parameters are left unspecified. 2.Incorrect parameter types.
    * @throws { BusinessException } 16000001 - The specified ability does not exist.
    * @throws { BusinessException } 16000002 - Incorrect ability type.
    * @throws { BusinessException } 16000004 - Cannot start an invisible component.
    * @throws { BusinessException } 16000005 - The specified process does not have the permission.
    * @throws { BusinessException } 16000006 - Cross-user operations are not allowed.
    * @throws { BusinessException } 16000008 - The crowdtesting application expires.
    * @throws { BusinessException } 16000009 - An ability cannot be started or stopped in Wukong mode.
    * @throws { BusinessException } 16000010 - The call with the continuation and prepare continuation flag is forbidden.
    * @throws { BusinessException } 16000011 - The context does not exist.
    * @throws { BusinessException } 16000012 - The application is controlled.
    * @throws { BusinessException } 16000013 - The application is controlled by EDM.
    * @throws { BusinessException } 16000050 - Internal error.
    * @throws { BusinessException } 16000053 - The ability is not on the top of the UI.
    * @throws { BusinessException } 16000055 - Installation-free timed out.
    * @throws { BusinessException } 16200001 - The caller has been released.
    * @relation requestDialogService(want: Want): Promise<dialogRequest.RequestResult>
    */
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
            let result: RequestResult = RequestResult(ResultCode.ResultCancel)
            let wantHandle = want.createWantHandle()
            let callback: AsyncCallback<RequestResult> = {
                err: Option<AsyncError>, data: Option<RequestResult> =>
                match (err) {
                    case None =>
                        result.result = ResultCode.ResultOk
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
