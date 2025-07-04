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

package ohos.multimedia.camera_picker

import ohos.multimedia.camera.*
import ohos.ffi.*
import ohos.base.*
import ohos.ability.*
import std.deriving.*
import ohos.labels.*

foreign func FfiCameraPickerPick(context: CPointer<Unit>, mediaTypes: CArrI32, pickerProfile: CPickerProfile,
    callbackId: Int64): Unit

/**
 * Pick function to get a photo or video result.
 *
 * @param { UIAbilityContext } context - From UIExtensionAbility.
 * @param { Array<PickerMediaType> } mediaTypes - Pick media type.
 * @param { PickerProfile } pickerProfile - Picker input Profile.
 * @param { Callback1Argument<PickerResult> } pick result.
 * @syscap SystemCapability.Multimedia.Camera.Core
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public func pick(context: UIAbilityContext, mediaTypes: Array<PickerMediaType>, pickerProfile: PickerProfile,
    callback: Callback1Argument<PickerResult>): Unit {
    var mediaTypesHead = CPointer<Int32>()
    if (mediaTypes.size != 0) {
        mediaTypesHead = safeMalloc<Int32>(count: mediaTypes.size)
        for (i in 0..mediaTypes.size) {
            unsafe { mediaTypesHead.write(i, mediaTypes[i].getValue()) }
        }
    }
    let cMediaTypes = CArrI32(mediaTypesHead, mediaTypes.size)
    var cSaveUri = CString(CPointer())
    try {
        cSaveUri = unsafe { LibC.mallocCString(pickerProfile.saveUri) }
    } catch (e: Exception) {
        unsafe { LibC.free(mediaTypesHead) }
        throw e
    }
    let wrapper = {value: CPickerResult => callback.invoke(value.toPickerResult())}
    let lambdaData = Callback1Param<CPickerResult, Unit>(wrapper)
    let cPickerProfile = CPickerProfile(getCameraPositionValue(pickerProfile.cameraPosition), cSaveUri,
        pickerProfile.videoDuration)
    unsafe { FfiCameraPickerPick(getStageContext(context), cMediaTypes, cPickerProfile, lambdaData.getID()) }
    unsafe { LibC.free(mediaTypesHead) }
    cPickerProfile.free()
}

/**
 * Enum for camera picker media type.
 *
 * @enum { PickerMediaType }
 * @syscap SystemCapability.Multimedia.Camera.Core
 * @atomicservice
 */
@Derive[Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public enum PickerMediaType <: ToString {
    /**
     * Type image, picker provide an ability to take photo.
     *
     * @syscap SystemCapability.Multimedia.Camera.Core
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    PHOTO
    |
        /**
         * Type video, picker provide an ability to record video.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         * @atomicservice
         */
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    VIDEO
    | ...

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func toString(): String {
        match (this) {
            case PHOTO => "photo"
            case VIDEO => "video"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case PHOTO => 0
            case VIDEO => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(code: Int32): PickerMediaType {
        match (code) {
            case 0 => PHOTO
            case 1 => VIDEO
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

/**
 * Picker profile settings for take photo and record video.
 *
 * @syscap SystemCapability.Multimedia.Camera.Core
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public struct PickerProfile {
    /**
     * The camera position to be used.
     *
     * @type { CameraPosition }
     * @syscap SystemCapability.Multimedia.Camera.Core
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var cameraPosition: CameraPosition
    /**
     * The uri of the result to be saved.
     *
     * @type { String }
     * @syscap SystemCapability.Multimedia.Camera.Core
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var saveUri: String
    /**
     * The max duration of the video.
     *
     * @type { Int32 }
     * @syscap SystemCapability.Multimedia.Camera.Core
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var videoDuration: Int32

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public init(cameraPosition: CameraPosition, saveUri!: String = "", videoDuration!: Int32 = 0) {
        this.cameraPosition = cameraPosition
        this.saveUri = saveUri
        this.videoDuration = videoDuration
    }
}

@C
struct CPickerProfile {
    CPickerProfile(
        let cameraPosition: Int32,
        let saveUri: CString,
        let videoDuration: Int32
    ) {}

    func free() {
        unsafe { LibC.free(saveUri) }
    }
}

/**
 * The picker result info for pick function.
 *
 * @syscap SystemCapability.Multimedia.Camera.Core
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public struct PickerResult {
    /**
     * The result code.
     *
     * @type { Int32 }
     * @syscap SystemCapability.Multimedia.Camera.Core
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public let resultCode: Int32
    /**
     * The result saved uri.
     *
     * @type { String }
     * @syscap SystemCapability.Multimedia.Camera.Core
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public let resultUri: String
    /**
     * The result resource type.
     *
     * @type { PickerMediaType }
     * @syscap SystemCapability.Multimedia.Camera.Core
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public let mediaType: PickerMediaType

    init(resultCode: Int32, resultUri: String, mediaType: PickerMediaType) {
        this.resultCode = resultCode
        this.resultUri = resultUri
        this.mediaType = mediaType
    }
}

@C
struct CPickerResult {
    CPickerResult(
        let resultCode: Int32,
        let resultUri: CString,
        let mediaType: Int32
    ) {}

    func toPickerResult() {
        return PickerResult(resultCode, resultUri.toString(), PickerMediaType.parse(mediaType))
    }

    func free() {
        unsafe { LibC.free(resultUri) }
    }
}

func getCameraPositionValue(position: CameraPosition): Int32 {
    match (position) {
        case CAMERA_POSITION_UNSPECIFIED => 0
        case CAMERA_POSITION_BACK => 1
        case CAMERA_POSITION_FRONT => 2
        case _ => throw IllegalArgumentException("The type is not supported.")
    }
}
