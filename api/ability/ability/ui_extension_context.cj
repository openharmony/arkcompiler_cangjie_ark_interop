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

import std.sync.*
import ohos.base.*
import ohos.labels.*

foreign {
    func FFICJUIExtAbilityGetContext(extAbility: ExtAbilityHandle, id: CPointer<Int64>): Int32

    func FFICJUIExtCtxStartAbility(id: Int64, wantHandle: WantHandle): Int32

    func FFICJUIExtCtxStartAbilityWithOpt(id: Int64, wantHandle: WantHandle, paramOpt: CPointer<CJNewStartOptions>): Int32

    func FFICJUIExtCtxStartAbilityForRes(id: Int64, wantHandle: WantHandle, requestCode: Int32,
        cbInfoPtr: CPointer<CJAbilityResultCbInfo>): Int32

    func FFICJUIExtCtxStartAbilityForResWithOpt(id: Int64, wantHandle: WantHandle,
        paramOpt: CPointer<CJNewStartOptions>, requestCode: Int32, cbInfoPtr: CPointer<CJAbilityResultCbInfo>): Int32

    func FFICJUIExtCtxConnectServiceExtensionAbility(id: Int64, wantHandle: WantHandle, optionId: Int64,
        numPtr: CPointer<Int64>): Int32

    func FFICJUIExtCtxDisconnectServiceExtensionAbility(id: Int64, connectionId: Int64): Int32

    func FFICJUIExtCtxTerminateSelf(id: Int64): Int32

    func FFICJUIExtCtxTerminateSelfWithResult(id: Int64, wantHandle: WantHandle, resultCode: Int32): Int32

    func FFICJUIExtCtxReportDrawnCompleted(id: Int64): Int32

    func FFICJUIExtCtxOpenAtomicService(id: Int64, cAppId: CString, cOptionPtr: CPointer<CJAtomicServiceOptions>,
        requestCode: Int32, cbInfoPtr: CPointer<CJAbilityResultCbInfo>): Int32

    func FFICJUIExtCtxOpenLink(id: Int64, cLink: CString, cOptionPtr: CPointer<CJOpenLinkOptions>, requestCode: Int32,
        cbInfoPtr: CPointer<CJAbilityResultCbInfo>): Int32
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class UIExtensionContext <: ExtensionContext {
    // curRequestCode is the key of callbacks stored in native owned by UIExtensionContext instance.
    private var curRequestCode = AtomicInt32(0)

    init(id: Int64) {
        super(id)
    }

    /*
     * @brief startAbility(want: Want, callback: AsyncCallback<void>): void
     * @brief startAbility(want: Want, options: StartOptions, callback: AsyncCallback<void>): void
     * @brief startAbility(want: Want, options?: StartOptions): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func startAbility(want: Want): Future<Unit> {
        spawn {
            let wantHandle = want.createWantHandle()
            let errorCode = unsafe { FFICJUIExtCtxStartAbility(this.getID(), wantHandle) }
            unsafe { Want.releaseWantHandle(wantHandle) }
            checkCodeAndThrow(errorCode)
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func startAbility(want: Want, options: StartOptions): Future<Unit> {
        spawn {
            let wantHandle = want.createWantHandle()
            var cjNewStartOptions = options.toCJNewStartOptions()
            let errorCode = unsafe {
                FFICJUIExtCtxStartAbilityWithOpt(this.getID(), wantHandle, inout cjNewStartOptions)
            }
            unsafe { Want.releaseWantHandle(wantHandle) }
            checkCodeAndThrow(errorCode)
        }
    }

    /*
     * @brief startAbilityForResult(want: Want, callback: AsyncCallback<AbilityResult>): void
     * @brief startAbilityForResult(want: Want, options: StartOptions, callback: AsyncCallback<AbilityResult>): void
     * @brief startAbilityForResult(want: Want, options?: StartOptions): Promise<AbilityResult>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func startAbilityForResult(want: Want, callback: AsyncCallback<AbilityResult>): Unit {
        unsafe {
            var callbackInfo = getCJAbilityResultCbInfo(callback)
            let requestCode = genRequestCode()
            let wantHandle = want.createWantHandle()
            let errorCode = FFICJUIExtCtxStartAbilityForRes(this.getID(), wantHandle, requestCode, inout callbackInfo)
            Want.releaseWantHandle(wantHandle)
            checkCodeAndThrow(errorCode)
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func startAbilityForResult(want: Want, options: StartOptions, callback: AsyncCallback<AbilityResult>): Unit {
        unsafe {
            var callbackInfo = getCJAbilityResultCbInfo(callback)
            let requestCode = genRequestCode()
            let wantHandle = want.createWantHandle()
            var cjNewStartOptions = options.toCJNewStartOptions()
            let errorCode = FFICJUIExtCtxStartAbilityForResWithOpt(this.getID(), wantHandle, inout cjNewStartOptions,
                requestCode, inout callbackInfo)
            Want.releaseWantHandle(wantHandle)
            checkCodeAndThrow(errorCode)
        }
    }

    /*
     * @brief terminateSelf(callback: AsyncCallback<void>): void
     * @brief terminateSelf(): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func terminateSelf(): Unit {
        unsafe {
            let errorCode = FFICJUIExtCtxTerminateSelf(this.getID())
            checkCodeAndThrow(errorCode)
        }
    }

    /*
     * @brief terminateSelfWithResult(parameter: AbilityResult, callback: AsyncCallback<void>): void
     * @brief terminateSelfWithResult(parameter: AbilityResult): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func terminateSelfWithResult(parameter: AbilityResult): Unit {
        unsafe {
            let wantHandle = parameter.want.createWantHandle()
            let errorCode = FFICJUIExtCtxTerminateSelfWithResult(this.getID(), wantHandle, parameter.resultCode)
            Want.releaseWantHandle(wantHandle)
            checkCodeAndThrow(errorCode)
        }
    }

    /*
     * @brief reportDrawnCompleted(callback: AsyncCallback<void>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func reportDrawnCompleted(callback: AsyncCallback<Unit>): Unit {
        var errorCode = unsafe {
            FFICJUIExtCtxReportDrawnCompleted(this.getID())
        }
        if (errorCode != 0) {
            errorCode = innerToErrorCode(errorCode)
            callback(AsyncError(errorCode), None)
        } else {
            callback(None, ())
        }
    }

    /*
     * @brief openAtomicService(appId: string, options?: AtomicServiceOptions): Promise<AbilityResult>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func openAtomicService(appId: String, options!: ?AtomicServiceOptions = None,
        callback!: AsyncCallback<AbilityResult>): Unit {
        unsafe {
            var callbackInfo = getCJAbilityResultCbInfo(callback)
            var cOption = toCJAtomicServiceOptions(options)
            let requestCode = genRequestCode()
            var errorCode: Int32 = 0
            try (cAppId = LibC.mallocCString(appId).asResource()) {
                errorCode = FFICJUIExtCtxOpenAtomicService(this.getID(), cAppId.value, inout cOption, requestCode,
                    inout callbackInfo)
            } catch (e: Exception) {
                cOption.free()
                throw e
            }
            cOption.free()
            checkCodeAndThrow(errorCode)
        }
    }

    /*
     * @brief openLink(link:string, options?: OpenLinkOptions, callback?: AsyncCallback<AbilityResult>): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func openLink(link: String, options!: ?OpenLinkOptions = None,
        callback!: ?AsyncCallback<AbilityResult> = None): Unit {
        unsafe {
            var callbackInfo = getCJAbilityResultCbInfo(callback)
            var cOption = toCJOpenLinkOptions(options)
            let requestCode = genRequestCode()
            var errorCode: Int32 = 0
            try (cLink = LibC.mallocCString(link).asResource()) {
                errorCode = FFICJUIExtCtxOpenLink(this.getID(), cLink.value, inout cOption, requestCode,
                    inout callbackInfo)
            } catch (e: Exception) {
                cOption.free()
                throw e
            }
            cOption.free()
            checkCodeAndThrow(errorCode)
        }
    }

    private func genRequestCode(): Int32 {
        if (!curRequestCode.compareAndSwap(Int32.Max, 0)) {
            curRequestCode.fetchAdd(1)
        }
        curRequestCode.load()
    }
}
