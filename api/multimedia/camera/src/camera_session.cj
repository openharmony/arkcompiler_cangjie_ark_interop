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

package ohos.multimedia.camera

import ohos.labels.*
import ohos.base.*
import ohos.ffi.*
import std.collection.*
import std.sync.*

/**
 * Session object.
 *
 * @interface Session
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
sealed interface Session {
    /**
     * Begin capture session config.
     *
     * @throws { BusinessException } 7400105 - Session config locked.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func beginConfig(): Unit {
        unsafe {
            let errCode = FfiCameraSessionBeginConfig((this as RemoteDataLite).getOrThrow().getID())
            successOrThrow(errCode)
        }
    }

    /**
     * Commit capture session config.
     *
     * @throws { BusinessException } 7400102 - Operation not allowed.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func commitConfig(): Unit {
        unsafe {
            let errCode = FfiCameraSessionCommitConfig((this as RemoteDataLite).getOrThrow().getID())
            successOrThrow(errCode)
        }
    }

    /**
     * Determines whether the camera input can be added into the session.
     * This method is valid between Session.beginConfig() and Session.commitConfig().
     *
     * @param { CameraInput } cameraInput - Target camera input to add.
     * @returns { boolean } You can add the input into the session.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func canAddInput(cameraInput: CameraInput): Bool {
        unsafe {
            var errCode: Int32 = 0
            let res = FfiCameraSessionCanAddInput((this as RemoteDataLite).getOrThrow().getID(), cameraInput.getID(),
                inout errCode)
            successOrThrow(errCode)
            return res
        }
    }

    /**
     * Adds a camera input.
     * This method is valid between Session.beginConfig() and Session.commitConfig().
     *
     * @param { CameraInput } cameraInput - Target camera input to add.
     * @throws { BusinessException } 7400101 - Parameter missing or parameter type incorrect.
     * @throws { BusinessException } 7400102 - Operation not allowed.
     * @throws { BusinessException } 7400103 - Session not config.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func addInput(cameraInput: CameraInput): Unit {
        unsafe {
            let errCode = FfiCameraSessionAddInput((this as RemoteDataLite).getOrThrow().getID(), cameraInput.getID())
            successOrThrow(errCode)
        }
    }

    /**
     * Removes a camera input.
     * This method is valid between Session.beginConfig() and Session.commitConfig().
     *
     * @param { CameraInput } cameraInput - Target camera input to remove.
     * @throws { BusinessException } 7400101 - Parameter missing or parameter type incorrect.
     * @throws { BusinessException } 7400102 - Operation not allowed.
     * @throws { BusinessException } 7400103 - Session not config.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func removeInput(cameraInput: CameraInput): Unit {
        unsafe {
            let errCode = FfiCameraSessionRemoveInput(
                (this as RemoteDataLite).getOrThrow().getID(),
                cameraInput.getID()
            )
            successOrThrow(errCode)
        }
    }

    /**
     * Determines whether the camera output can be added into the session.
     * This method is valid after Session.addInput(cameraInput) and before Session.commitConfig().
     *
     * @param { CameraOutput } cameraOutput - Target camera output to add.
     * @returns { boolean } You can add the output into the session.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func canAddOutput(cameraOutput: CameraOutput): Bool {
        unsafe {
            var errCode: Int32 = 0
            let res = FfiCameraSessionCanAddOutput((this as RemoteDataLite).getOrThrow().getID(),
                getCameraOutputId(cameraOutput), getCameraOutputType(cameraOutput), inout errCode)
            successOrThrow(errCode)
            return res
        }
    }

    /**
     * Adds a camera output.
     * This method is valid after Session.addInput(cameraInput) and before Session.commitConfig().
     *
     * @param { CameraOutput } cameraOutput - Target camera output to add.
     * @throws { BusinessException } 7400101 - Parameter missing or parameter type incorrect.
     * @throws { BusinessException } 7400102 - Operation not allowed.
     * @throws { BusinessException } 7400103 - Session not config.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func addOutput(cameraOutput: CameraOutput): Unit {
        unsafe {
            let errCode = FfiCameraSessionAddOutput((this as RemoteDataLite).getOrThrow().getID(),
                getCameraOutputId(cameraOutput), getCameraOutputType(cameraOutput))
            successOrThrow(errCode)
        }
    }

    /**
     * Removes a camera output.
     * This method is valid between Session.beginConfig() and Session.commitConfig().
     *
     * @param { CameraOutput } cameraOutput - Target camera output to remove.
     * @throws { BusinessException } 7400101 - Parameter missing or parameter type incorrect.
     * @throws { BusinessException } 7400102 - Operation not allowed.
     * @throws { BusinessException } 7400103 - Session not config.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func removeOutput(cameraOutput: CameraOutput): Unit {
        unsafe {
            let errCode = FfiCameraSessionRemoveOutput((this as RemoteDataLite).getOrThrow().getID(),
                getCameraOutputId(cameraOutput), getCameraOutputType(cameraOutput))
            successOrThrow(errCode)
        }
    }

    /**
     * Starts capture session.
     *
     * @throws { BusinessException } 7400102 - Operation not allowed.
     * @throws { BusinessException } 7400103 - Session not config.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func start(): Unit {
        unsafe {
            let errCode = FfiCameraSessionStart((this as RemoteDataLite).getOrThrow().getID())
            successOrThrow(errCode)
        }
    }

    /**
     * Stops capture session.
     *
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func stop(): Unit {
        unsafe {
            let errCode = FfiCameraSessionStop((this as RemoteDataLite).getOrThrow().getID())
            successOrThrow(errCode)
        }
    }

    /**
     * Release capture session instance.
     *
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func release(): Unit {
        unsafe {
            let errCode = FfiCameraSessionRelease((this as RemoteDataLite).getOrThrow().getID())
            successOrThrow(errCode)
        }
    }
}

func getCameraOutputId(cameraOutput: CameraOutput): Int64 {
    (cameraOutput as RemoteDataLite)?.getID() ?? throw IllegalArgumentException("Unkown value.")
}

func getCameraOutputType(cameraOutput: CameraOutput): Int32 {
    match (cameraOutput) {
        case v: MetadataOutput => return 0
        case v: PhotoOutput => return 1
        case v: PreviewOutput => return 2
        case v: VideoOutput => return 3
        case _ => throw IllegalArgumentException("Unknown CameraOutput type.")
    }
}

/**
 * Photo session object.
 *
 * @interface PhotoSession
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class PhotoSession <: RemoteDataLite & Session & Flash & AutoExposure & Focus & Zoom & ColorManagement {
    let errorCallbackManager: CallbackManager
    let focusStateChangeCallbackManager: CallbackManager
    let smoothZoomCallbackManager: CallbackManager

    init(id: Int64) {
        super(id)

        errorCallbackManager = CallbackManager(getID(), FfiCameraOnError, FfiCameraOffError, FfiCameraOffAllError)
        focusStateChangeCallbackManager = CallbackManager(getID(), FfiCameraOnFocusStateChange,
            FfiCameraOffFocusStateChange, FfiCameraOffAllFocusStateChange)
        smoothZoomCallbackManager = CallbackManager(getID(), FfiCameraOnSmoothZoomInfoAvailable,
            FfiCameraOffSmoothZoomInfoAvailable, FfiCameraOffAllSmoothZoomInfoAvailable)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Gets whether the choosed preconfig type can be used to configure photo session.
     * Must choose preconfig type from {@link PreconfigType}.
     *
     * @param { PreconfigType } preconfigType - preconfig type.
     * @param { PreconfigRatio } preconfigRatio - the aspect ratio of surface for preconfig,
     *                                            default value {@link PreconfigRatio#PRECONFIG_RATIO_4_3}.
     * @returns { Bool } Whether the choosed preconfig type can be used.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func canPreconfig(preconfigType: PreconfigType, preconfigRatio!: PreconfigRatio = PRECONFIG_RATIO_4_3): Bool {
        return canPreconfig0((this as RemoteDataLite).getOrThrow().getID(), preconfigType, preconfigRatio)
    }

    /**
     * Configure photo session with the preconfig type.
     * Must choose preconfig type from {@link PreconfigType}.
     *
     * @param { PreconfigType } preconfigType - preconfig type.
     * @param { PreconfigRatio } preconfigRatio - the aspect ratio of surface for preconfig,
     *                                            default value {@link PreconfigRatio#PRECONFIG_RATIO_4_3}
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func preconfig(
        preconfigType: PreconfigType,
        preconfigRatio!: PreconfigRatio = PreconfigRatio.PRECONFIG_RATIO_4_3
    ): Unit {
        preconfig0((this as RemoteDataLite).getOrThrow().getID(), preconfigType, preconfigRatio)
    }

    /**
     * Subscribes to error events.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<BusinessException>} callback - Callback used to get the capture session errors.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func on(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit {
        onError0(errorCallbackManager, `type`, callback)
    }

    /**
     * Unsubscribes from error events.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<BusinessException> } callback - Callback used to get the capture session errors.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit {
        offError0(errorCallbackManager, `type`, callback)
    }

    /**
     * Subscribes to focus state change events.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<FocusState> } callback - Callback used to get the capture focus state change.
     * @syscap SystemCapability.Multimedia.Camera.Core
     * @since 11
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func on(`type`: CameraCallbackType, callback: Callback1Argument<FocusState>): Unit {
        onFocus0(focusStateChangeCallbackManager, `type`, callback)
    }

    /**
     * Unsubscribes from focus state change events.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<FocusState> } callback - Callback used to get the capture focus state change.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType, callback: Callback1Argument<FocusState>): Unit {
        offFocus0(focusStateChangeCallbackManager, `type`, callback)
    }

    /**
     * Subscribes to smooth zoom info events.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<SmoothZoomInfo> } callback - Callback used to get the zoom info.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func on(`type`: CameraCallbackType, callback: Callback1Argument<SmoothZoomInfo>): Unit {
        onSmoothZoom0(smoothZoomCallbackManager, `type`, callback)
    }

    /**
     * Unsubscribes from zoom info events.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<SmoothZoomInfo> } callback - Callback used to get the zoom info.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType, callback: Callback1Argument<SmoothZoomInfo>): Unit {
        offSmoothZoom0(smoothZoomCallbackManager, `type`, callback)
    }

    /**
     * Unsubscribes all callbacks from the event specified by the param.
     *
     * @param { CameraCallbackType } type - Event type.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType): Unit {
        let errCode = match (`type`) {
            case CameraCallbackType.CameraError => errorCallbackManager.unregisterAll()
            case CameraCallbackType.FocusStateChange => focusStateChangeCallbackManager.unregisterAll()
            case CameraCallbackType.SmoothZoomInfoAvailable => smoothZoomCallbackManager.unregisterAll()
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "PhotoSession off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
        successOrThrow(errCode)
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class VideoSession <: RemoteDataLite & Session & Flash & AutoExposure & Focus & Zoom & Stabilization & ColorManagement {
    let errorCallbackManager: CallbackManager
    let focusStateChangeCallbackManager: CallbackManager
    let smoothZoomCallbackManager: CallbackManager

    init(id: Int64) {
        super(id)

        errorCallbackManager = CallbackManager(getID(), FfiCameraOnError, FfiCameraOffError, FfiCameraOffAllError)
        focusStateChangeCallbackManager = CallbackManager(getID(), FfiCameraOnFocusStateChange,
            FfiCameraOffFocusStateChange, FfiCameraOffAllFocusStateChange)
        smoothZoomCallbackManager = CallbackManager(getID(), FfiCameraOnSmoothZoomInfoAvailable,
            FfiCameraOffSmoothZoomInfoAvailable, FfiCameraOffAllSmoothZoomInfoAvailable)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Gets whether the choosed preconfig type can be used to configure video session.
     * Must choose preconfig type from {@link PreconfigType}.
     *
     * @param { PreconfigType } preconfigType - preconfig type.
     * @param { PreconfigRatio } preconfigRatio - the aspect ratio of surface for preconfig,
     *                                            default value {@link PreconfigRatio#PRECONFIG_RATIO_16_9}.
     * @returns { Bool } Whether the choosed preconfig type can be used.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func canPreconfig(preconfigType: PreconfigType, preconfigRatio!: PreconfigRatio = PRECONFIG_RATIO_16_9): Bool {
        return canPreconfig0((this as RemoteDataLite).getOrThrow().getID(), preconfigType, preconfigRatio)
    }

    /**
     * Configure video session with the preconfig type.
     * Must choose preconfig type from {@link PreconfigType}.
     *
     * @param { PreconfigType } preconfigType - preconfig type.
     * @param { PreconfigRatio } preconfigRatio - the aspect ratio of surface for preconfig,
     *                                            default value {@link PreconfigRatio#PRECONFIG_RATIO_16_9}.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func preconfig(
        preconfigType: PreconfigType,
        preconfigRatio!: PreconfigRatio = PreconfigRatio.PRECONFIG_RATIO_16_9
    ): Unit {
        preconfig0((this as RemoteDataLite).getOrThrow().getID(), preconfigType, preconfigRatio)
    }

    /**
     * Subscribes to error events.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<BusinessException>} callback - Callback used to get the capture session errors.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func on(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit {
        onError0(errorCallbackManager, `type`, callback)
    }

    /**
     * Unsubscribes from error events.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<BusinessException> } callback - Callback used to get the capture session errors.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit {
        offError0(errorCallbackManager, `type`, callback)
    }

    /**
     * Subscribes to focus state change events.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<FocusState> } callback - Callback used to get the capture focus state change.
     * @syscap SystemCapability.Multimedia.Camera.Core
     * @since 11
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func on(`type`: CameraCallbackType, callback: Callback1Argument<FocusState>): Unit {
        onFocus0(focusStateChangeCallbackManager, `type`, callback)
    }

    /**
     * Unsubscribes from focus state change events.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<FocusState> } callback - Callback used to get the capture focus state change.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType, callback: Callback1Argument<FocusState>): Unit {
        offFocus0(focusStateChangeCallbackManager, `type`, callback)
    }

    /**
     * Subscribes to smooth zoom info events.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<SmoothZoomInfo> } callback - Callback used to get the zoom info.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func on(`type`: CameraCallbackType, callback: Callback1Argument<SmoothZoomInfo>): Unit {
        onSmoothZoom0(smoothZoomCallbackManager, `type`, callback)
    }

    /**
     * Unsubscribes from zoom info events.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<SmoothZoomInfo> } callback - Callback used to get the zoom info.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType, callback: Callback1Argument<SmoothZoomInfo>): Unit {
        offSmoothZoom0(smoothZoomCallbackManager, `type`, callback)
    }

    /**
     * Unsubscribes all callbacks from the event specified by the param.
     *
     * @param { CameraCallbackType } type - Event type.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType): Unit {
        let errCode = match (`type`) {
            case CameraCallbackType.CameraError => errorCallbackManager.unregisterAll()
            case CameraCallbackType.FocusStateChange => focusStateChangeCallbackManager.unregisterAll()
            case CameraCallbackType.SmoothZoomInfoAvailable => smoothZoomCallbackManager.unregisterAll()
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "PhotoSession off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
        successOrThrow(errCode)
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class SecureSession <: RemoteDataLite & Session & Flash & AutoExposure & Focus & Zoom {
    let errorCallbackManager: CallbackManager
    let focusStateChangeCallbackManager: CallbackManager

    init(id: Int64) {
        super(id)

        errorCallbackManager = CallbackManager(getID(), FfiCameraOnError, FfiCameraOffError, FfiCameraOffAllError)
        focusStateChangeCallbackManager = CallbackManager(getID(), FfiCameraOnFocusStateChange,
            FfiCameraOffFocusStateChange, FfiCameraOffAllFocusStateChange)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func addSecureOutput(previewOutput: PreviewOutput): Unit {
        var errCode: Int32 = 0
        unsafe {
            FfiCameraSessionAddSecureOutput((this as RemoteDataLite).getOrThrow().getID(), previewOutput.getID(),
                inout errCode)
        }

        successOrThrow(errCode)
    }

    /**
     * Subscribes to error events.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<BusinessException>} callback - Callback used to get the capture session errors.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func on(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit {
        onError0(errorCallbackManager, `type`, callback)
    }

    /**
     * Unsubscribes from error events.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<BusinessException> } callback - Callback used to get the capture session errors.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit {
        offError0(errorCallbackManager, `type`, callback)
    }

    /**
     * Subscribes to focus state change events.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<FocusState> } callback - Callback used to get the capture focus state change.
     * @syscap SystemCapability.Multimedia.Camera.Core
     * @since 11
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func on(`type`: CameraCallbackType, callback: Callback1Argument<FocusState>): Unit {
        onFocus0(focusStateChangeCallbackManager, `type`, callback)
    }

    /**
     * Unsubscribes from focus state change events.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<FocusState> } callback - Callback used to get the capture focus state change.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType, callback: Callback1Argument<FocusState>): Unit {
        offFocus0(focusStateChangeCallbackManager, `type`, callback)
    }

    /**
     * Unsubscribes all callbacks from the event specified by the param.
     *
     * @param { CameraCallbackType } type - Event type.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType): Unit {
        let errCode = match (`type`) {
            case CameraCallbackType.CameraError => errorCallbackManager.unregisterAll()
            case CameraCallbackType.FocusStateChange => focusStateChangeCallbackManager.unregisterAll()
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "SecureSession off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
        successOrThrow(errCode)
    }
}

func canPreconfig0(sessionId: Int64, preconfigType: PreconfigType, preconfigRatio: PreconfigRatio): Bool {
    var errCode: Int32 = 0
    let ret: Bool = unsafe {
        FfiCameraSessionCanPreconfig(
            sessionId,
            preconfigType.value,
            preconfigRatio.value,
            inout errCode
        )
    }

    successOrThrow(errCode)

    return ret
}

func preconfig0(sessionId: Int64, preconfigType: PreconfigType, preconfigRatio: PreconfigRatio): Unit {
    var errCode: Int32 = 0
    unsafe {
        FfiCameraSessionPreconfig(
            sessionId,
            preconfigType.value,
            preconfigRatio.value,
            inout errCode
        )
    }
    successOrThrow(errCode)
}

class CallbackManager {
    private let callbackList: ArrayList<(CallbackObject, Int64)>
    private let callbackMutex: Mutex

    private let sessionFfiId: Int64

    private let FfiOnFunction: CFunc<(Int64, Int64, CPointer<Int32>) -> Unit>
    private let FfiOffFunction: CFunc<(Int64, Int64, CPointer<Int32>) -> Unit>
    private let FfiOffAllFunction: CFunc<(Int64, CPointer<Int32>) -> Unit>

    init(
        sessionFfiId: Int64,
        FfiOnFunction: CFunc<(Int64, Int64, CPointer<Int32>) -> Unit>,
        FfiOffFunction: CFunc<(Int64, Int64, CPointer<Int32>) -> Unit>,
        FfiOffAllFunction: CFunc<(Int64, CPointer<Int32>) -> Unit>
    ) {
        callbackList = ArrayList<(CallbackObject, Int64)>()
        callbackMutex = Mutex()

        this.sessionFfiId = sessionFfiId
        this.FfiOnFunction = FfiOnFunction
        this.FfiOffFunction = FfiOffFunction
        this.FfiOffAllFunction = FfiOffAllFunction
    }

    func register(userCallback: CallbackObject, FfiCallbackId: Int64): Int32 {
        if (contains(userCallback)) {
            CAMERA_LOG.info("WARNING: CallbackManager.register: target already exists")
            return 0
        }

        synchronized(callbackMutex) {
            var errCode: Int32 = 0
            unsafe {
                FfiOnFunction(sessionFfiId, FfiCallbackId, inout errCode)
            }
            if (errCode == SUCCESS_CODE) {
                callbackList.add((userCallback, FfiCallbackId))
            } else {
                CAMERA_LOG.info("WARNING: CallbackManager.register: failed to register")
            }
            return errCode
        }
    }

    func unregister(target: CallbackObject): Int32 {
        var errCode: Int32 = 0
        if (!contains(target)) {
            CAMERA_LOG.info("WARNING: CallbackManager.unregister: target not found")
            return errCode
        }

        synchronized(callbackMutex) {
            for (i in 0..callbackList.size) {
                if (!refEq(callbackList[i][0], target)) {
                    continue
                }

                unsafe { FfiOffFunction(sessionFfiId, callbackList[i][1], inout errCode) }
                if (errCode == SUCCESS_CODE) {
                    callbackList.remove(at: i)
                } else {
                    CAMERA_LOG.info("WARNING: CallbackManager.unregister: failed to unregister")
                }

                break;
            }
        }
        return errCode
    }

    func unregisterAll(): Int32 {
        synchronized(callbackMutex) {
            var errCode: Int32 = 0
            unsafe {
                FfiOffAllFunction(sessionFfiId, inout errCode)
            }
            if (errCode == SUCCESS_CODE) {
                callbackList.clear()
            }
            return errCode
        }
    }

    private func contains(target: CallbackObject): Bool {
        synchronized(callbackMutex) {
            for ((callback, id) in callbackList) {
                if (refEq(callback, target)) {
                    return true
                }
            }
            return false
        }
    }
}

func onError0(manager: CallbackManager, `type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit {
    if (`type` != CameraCallbackType.CameraError) {
        throw BusinessException(ERR_PARAMETER_ERROR, "PhotoSession on failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
    }

    let ffiCallback = Callback1Param<Int32, Unit> {
        code: Int32 => callback.invoke(BusinessException(code, getErrorMsg(code)))
    }

    let errCode = manager.register(callback, ffiCallback.getID())
    successOrThrow(errCode)
}

func offError0(manager: CallbackManager, `type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit {
    if (`type` != CameraCallbackType.CameraError) {
        throw BusinessException(ERR_PARAMETER_ERROR, "PhotoSession off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
    }

    let errCode = manager.unregister(callback)
    successOrThrow(errCode)
}

func onFocus0(manager: CallbackManager, `type`: CameraCallbackType, callback: Callback1Argument<FocusState>): Unit {
    if (`type` != CameraCallbackType.FocusStateChange) {
        throw BusinessException(ERR_PARAMETER_ERROR, "PhotoSession on failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
    }

    let ffiCallback = Callback1Param<Int32, Unit> {
        code: Int32 => callback.invoke(FocusState.parse(code))
    }

    let errCode = manager.register(callback, ffiCallback.getID())
    successOrThrow(errCode)
}

func offFocus0(manager: CallbackManager, `type`: CameraCallbackType, callback: Callback1Argument<FocusState>): Unit {
    if (`type` != CameraCallbackType.FocusStateChange) {
        throw BusinessException(ERR_PARAMETER_ERROR, "PhotoSession off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
    }

    let errCode = manager.unregister(callback)
    successOrThrow(errCode)
}

func onSmoothZoom0(manager: CallbackManager, `type`: CameraCallbackType, callback: Callback1Argument<SmoothZoomInfo>): Unit {
    if (`type` != CameraCallbackType.SmoothZoomInfoAvailable) {
        throw BusinessException(ERR_PARAMETER_ERROR, "PhotoSession on failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
    }

    let ffiCallback = Callback1Param<Int32, Unit> {
        duration: Int32 => callback.invoke(SmoothZoomInfo(duration))
    }

    let errCode = manager.register(callback, ffiCallback.getID())
    successOrThrow(errCode)
}

func offSmoothZoom0(manager: CallbackManager, `type`: CameraCallbackType, callback: Callback1Argument<SmoothZoomInfo>): Unit {
    if (`type` != CameraCallbackType.SmoothZoomInfoAvailable) {
        throw BusinessException(ERR_PARAMETER_ERROR, "PhotoSession off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
    }

    let errCode = manager.unregister(callback)
    successOrThrow(errCode)
}
