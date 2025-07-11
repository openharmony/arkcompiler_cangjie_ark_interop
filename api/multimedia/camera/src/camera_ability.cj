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

import std.deriving.*
import ohos.color_manager.ColorSpace
import ohos.labels.*
import ohos.base.*
import ohos.ffi.*
import std.collection.*

foreign {
    func FfiCameraAutoExposureIsExposureModeSupported(id: Int64, aeMode: Int32, errCode: CPointer<Int32>): Bool

    func FfiCameraAutoExposureGetExposureBiasRange(id: Int64, errCode: CPointer<Int32>): CArrFloat32

    func FfiCameraAutoExposureGetExposureMode(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiCameraAutoExposureSetExposureMode(id: Int64, aeMode: Int32, errCode: CPointer<Int32>): Unit

    func FfiCameraAutoExposureGetMeteringPoint(id: Int64, errCode: CPointer<Int32>): CPoint

    func FfiCameraAutoExposureSetMeteringPoint(id: Int64, point: CPoint, errCode: CPointer<Int32>): Unit

    func FfiCameraAutoExposureSetExposureBias(id: Int64, exposureBias: Float32, errCode: CPointer<Int32>): Unit

    func FfiCameraAutoExposureGetExposureValue(id: Int64, errCode: CPointer<Int32>): Float32

    func FfiCameraColorManagementGetSupportedColorSpaces(id: Int64, errCode: CPointer<Int32>): CArrI32

    func FfiCameraColorManagementSetColorSpace(id: Int64, colorSpace: Int32, errCode: CPointer<Int32>): Unit

    func FfiCameraColorManagementGetActiveColorSpace(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiCameraFlashQueryFlashModeSupported(id: Int64, focusMode: Int32, errCode: CPointer<Int32>): Bool

    func FfiCameraFlashQueryHasFlash(id: Int64, errCode: CPointer<Int32>): Bool

    func FfiCameraFlashGetFlashMode(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiCameraFlashSetFlashMode(id: Int64, flashMode: Int32, errCode: CPointer<Int32>): Unit

    func FfiCameraFocusIsFocusModeSupported(id: Int64, afMode: Int32, errCode: CPointer<Int32>): Bool

    func FfiCameraFocusSetFocusMode(id: Int64, afMode: Int32, errCode: CPointer<Int32>): Unit

    func FfiCameraFocusGetFocusMode(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiCameraFocusSetFocusPoint(id: Int64, point: CPoint, errCode: CPointer<Int32>): Unit

    func FfiCameraFocusGetFocusPoint(id: Int64, errCode: CPointer<Int32>): CPoint

    func FfiCameraFocusGetFocalLength(id: Int64, errCode: CPointer<Int32>): Float32

    func FfiCameraStabilizationIsVideoStabilizationModeSupported(id: Int64, vsMode: Int32, errCode: CPointer<Int32>): Bool

    func FfiCameraStabilizationGetActiveVideoStabilizationMode(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiCameraStabilizationSetVideoStabilizationMode(id: Int64, vsMode: Int32, errCode: CPointer<Int32>): Unit

    func FfiCameraZoomGetZoomRatioRange(id: Int64, errCode: CPointer<Int32>): CArrFloat32

    func FfiCameraZoomSetZoomRatio(id: Int64, zoomRatio: Float32, errCode: CPointer<Int32>): Unit

    func FfiCameraZoomGetZoomRatio(id: Int64, errCode: CPointer<Int32>): Float32

    func FfiCameraZoomSetSmoothZoom(id: Int64, targetRatio: Float32, mode: Int32, errCode: CPointer<Int32>): Unit
}

@C
struct CPoint {
    CPoint(var x: Float32, var y: Float32) {}
}

/**
 * Point parameter.
 *
 * @typedef Point
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class Point {
    /**
     * x co-ordinate
     *
     * @type { Float32 }
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var x: Float32

    /**
     * y co-ordinate
     *
     * @type { Float32 }
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var y: Float32

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public init(x: Float32, y: Float32) {
        this.x = x
        this.y = y
    }

    init(cPoint: CPoint) {
        this.x = cPoint.x
        this.y = cPoint.y
    }

    func asCPoint(): CPoint {
        return CPoint(this.x, this.y)
    }
}

/**
 * Enum for exposure mode.
 *
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public enum ExposureMode {
    /**
     * Lock exposure mode.
     *
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    EXPOSURE_MODE_LOCKED
    |
        /**
         * Auto exposure mode.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    EXPOSURE_MODE_AUTO
    |
        /**
         * Continuous automatic exposure.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    EXPOSURE_MODE_CONTINUOUS_AUTO
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case EXPOSURE_MODE_LOCKED => 0
                case EXPOSURE_MODE_AUTO => 1
                case EXPOSURE_MODE_CONTINUOUS_AUTO => 2
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(value: Int32): ExposureMode {
        return match (value) {
            case 0 => EXPOSURE_MODE_LOCKED
            case 1 => EXPOSURE_MODE_AUTO
            case 2 => EXPOSURE_MODE_CONTINUOUS_AUTO
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * AutoExposureQuery object.
 *
 * @interface AutoExposureQuery
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
sealed interface AutoExposureQuery {
    /**
     * Checks whether a specified exposure mode is supported.
     *
     * @param { ExposureMode } aeMode - Exposure mode
     * @returns { Bool } Is the exposure mode supported.
     * @throws { BusinessException } 7400103 - Session not config, only throw in session usage.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func isExposureModeSupported(aeMode: ExposureMode): Bool {
        var errCode: Int32 = 0
        let ret: Bool = unsafe {
            FfiCameraAutoExposureIsExposureModeSupported((this as RemoteDataLite).getOrThrow().getID(), aeMode.value,
                inout errCode)
        }
        successOrThrow(errCode)

        return ret
    }

    /**
     * Query the exposure compensation range.
     *
     * @returns { Array<Float32> } The array of compensation range.
     * @throws { BusinessException } 7400103 - Session not config.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func getExposureBiasRange(): Array<Float32> {
        var errCode: Int32 = 0
        let cArray: CArrFloat32 = unsafe {
            FfiCameraAutoExposureGetExposureBiasRange((this as RemoteDataLite).getOrThrow().getID(), inout errCode)
        }
        let res = cArray.asArray()
        cArray.free()
        successOrThrow(errCode)
        return res
    }
}

/**
 * AutoExposure object.
 *
 * @interface AutoExposure
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
sealed interface AutoExposure <: AutoExposureQuery {
    /**
     * Gets current exposure mode.
     *
     * @returns { ExposureMode } The current exposure mode.
     * @throws { BusinessException } 7400103 - Session not config.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func getExposureMode(): ExposureMode {
        var errCode: Int32 = 0
        let ret: Int32 = unsafe {
            FfiCameraAutoExposureGetExposureMode((this as RemoteDataLite).getOrThrow().getID(), inout errCode)
        }
        successOrThrow(errCode)

        return ExposureMode.parse(ret)
    }

    /**
     * Sets Exposure mode.
     *
     * @param { ExposureMode } aeMode - Exposure mode
     * @throws { BusinessException } 7400103 - Session not config.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func setExposureMode(aeMode: ExposureMode): Unit {
        var errCode: Int32 = 0
        unsafe {
            FfiCameraAutoExposureSetExposureMode((this as RemoteDataLite).getOrThrow().getID(), aeMode.value,
                inout errCode)
        }
        successOrThrow(errCode)
    }

    /**
     * Gets current metering point.
     *
     * @returns { Point } The current metering point.
     * @throws { BusinessException } 7400103 - Session not config.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func getMeteringPoint(): Point {
        var errCode: Int32 = 0
        let cPoint: CPoint = unsafe {
            FfiCameraAutoExposureGetMeteringPoint((this as RemoteDataLite).getOrThrow().getID(), inout errCode)
        }
        successOrThrow(errCode)

        return Point(cPoint)
    }

    /**
     * Set the center point of the metering area.
     *
     * @param { Point } point - metering point
     * @throws { BusinessException } 7400103 - Session not config.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func setMeteringPoint(point: Point): Unit {
        var errCode: Int32 = 0

        unsafe {
            FfiCameraAutoExposureSetMeteringPoint((this as RemoteDataLite).getOrThrow().getID(), point.asCPoint(),
                inout errCode)
        }
        successOrThrow(errCode)
    }

    /**
     * Set exposure compensation.
     *
     * @param { Float32 } exposureBias - Exposure compensation
     * @throws { BusinessException } 7400102 - Operation not allowed.
     * @throws { BusinessException } 7400103 - Session not config.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func setExposureBias(exposureBias: Float32): Unit {
        var errCode: Int32 = 0
        unsafe {
            FfiCameraAutoExposureSetExposureBias((this as RemoteDataLite).getOrThrow().getID(), exposureBias,
                inout errCode)
        }
        successOrThrow(errCode)
    }

    /**
     * Query the exposure value.
     *
     * @returns { Float32 } The exposure value.
     * @throws { BusinessException } 7400103 - Session not config.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func getExposureValue(): Float32 {
        var errCode: Int32 = 0
        let ret: Float32 = unsafe {
            FfiCameraAutoExposureGetExposureValue((this as RemoteDataLite).getOrThrow().getID(), inout errCode)
        }
        successOrThrow(errCode)

        return ret
    }
}

func parseColorSpace(value: Int32): ColorSpace {
    return match (value) {
        case 0 => Unknown
        case 1 => AdobeRgb1998
        case 2 => DciP3
        case 3 => DisplayP3
        case 4 => Srgb
        case 5 => Custom
        case 6 => Bt709
        case 7 => Bt601Ebu
        case 8 => Bt601SmpteC
        case 9 => Bt2020Hlg
        case 10 => Bt2020Pq
        case 11 => P3Hlg
        case 12 => P3Pq
        case 13 => AdobeRgb1998Limit
        case 14 => DisplayP3Limit
        case 15 => SrgbLimit
        case 16 => Bt709Limit
        case 17 => Bt601EbuLimit
        case 18 => Bt601SmpteCLimit
        case 19 => Bt2020HlgLimit
        case 20 => Bt2020PqLimit
        case 21 => P3HlgLimit
        case 22 => P3PqLimit
        case 23 => LinearP3
        case 24 => LinearSrgb
        case 25 => LinearBt2020
        case _ => throw IllegalArgumentException("The type is not supported yet.")
    }
}

func getColorSpaceValue(space: ColorSpace): Int32 {
    return match (space) {
        case UNKNOWN => 0
        case ADOBE_RGB_1998 => 1
        case DCI_P3 => 2
        case DISPLAY_P3 => 3
        case SRGB => 4
        case CUSTOM => 5
        case BT709 => 6
        case BT601_EBU => 7
        case BT601_SMPTE_C => 8
        case BT2020_HLG => 9
        case BT2020_PQ => 10
        case P3_HLG => 11
        case P3_PQ => 12
        case ADOBE_RGB_1998_LIMIT => 13
        case DISPLAY_P3_LIMIT => 14
        case SRGB_LIMIT => 15
        case BT709_LIMIT => 16
        case BT601_EBU_LIMIT => 17
        case BT601_SMPTE_C_LIMIT => 18
        case BT2020_HLG_LIMIT => 19
        case BT2020_PQ_LIMIT => 20
        case P3_HLG_LIMIT => 21
        case P3_PQ_LIMIT => 22
        case LINEAR_P3 => 23
        case LINEAR_SRGB => 24
        case LINEAR_BT709 => 24
        case LINEAR_BT2020 => 25
        case DISPLAY_SRGB => 4
        case DISPLAY_P3_SRGB => 3
        case DISPLAY_P3_HLG => 11
        case DISPLAY_P3_PQ => 12
        case _ => throw IllegalArgumentException("The type is not supported.")
    }
}

/**
 * Color Management Query object.
 *
 * @interface ColorManagementQuery
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
sealed interface ColorManagementQuery {
    /**
     * Gets the supported color space types.
     *
     * @returns { Array<colorSpaceManager.ColorSpace> } The array of the supported color space for the session.
     * @throws { BusinessException } 7400103 - Session not config, only throw in session usage.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func getSupportedColorSpaces(): Array<ColorSpace> {
        var errCode: Int32 = 0
        let colorSpaces: CArrI32 = unsafe {
            FfiCameraColorManagementGetSupportedColorSpaces(
                (this as RemoteDataLite).getOrThrow().getID(),
                inout errCode
            )
        }

        try {
            return unsafe {
                successOrThrow(errCode)
                cArr2cjArr<Int32, ColorSpace>(colorSpaces.size, colorSpaces.head) {
                    it => parseColorSpace(it)
                }
            }
        } finally {
            unsafe { LibC.free(colorSpaces.head) }
        }
    }
}

/**
 * Color Management object.
 *
 * @interface ColorManagement
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
sealed interface ColorManagement <: ColorManagementQuery {
    /**
     * Sets a color space for the session.
     *
     * @param { colorSpaceManager.ColorSpace } colorSpace - The type of color space.
     * @throws { BusinessException } 7400101 - Parameter missing or parameter type incorrect.
     * @throws { BusinessException } 7400102 - The colorSpace does not match the format.
     * @throws { BusinessException } 7400103 - Session not config.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func setColorSpace(colorSpace: ColorSpace): Unit {
        var errCode: Int32 = 0
        unsafe {
            FfiCameraColorManagementSetColorSpace((this as RemoteDataLite).getOrThrow().getID(),
                getColorSpaceValue(colorSpace), inout errCode)
        }
        successOrThrow(errCode)
    }

    /**
     * Gets the specific color space type.
     *
     * @returns { colorSpaceManager.ColorSpace } Current color space.
     * @throws { BusinessException } 7400103 - Session not config.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func getActiveColorSpace(): ColorSpace {
        var errCode: Int32 = 0
        let ret: Int32 = unsafe {
            FfiCameraColorManagementGetActiveColorSpace((this as RemoteDataLite).getOrThrow().getID(), inout errCode)
        }
        successOrThrow(errCode)

        return parseColorSpace(ret)
    }
}

/**
 * Enum for flash mode.
 *
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public enum FlashMode {
    /**
     * Close mode.
     *
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    FLASH_MODE_CLOSE
    |
        /**
         * Open mode.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    FLASH_MODE_OPEN
    |
        /**
         * Auto mode.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    FLASH_MODE_AUTO
    |
        /**
         * Always open mode.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    FLASH_MODE_ALWAYS_OPEN
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case FLASH_MODE_CLOSE => 0
                case FLASH_MODE_OPEN => 1
                case FLASH_MODE_AUTO => 2
                case FLASH_MODE_ALWAYS_OPEN => 3
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(value: Int32): FlashMode {
        return match (value) {
            case 0 => FLASH_MODE_CLOSE
            case 1 => FLASH_MODE_OPEN
            case 2 => FLASH_MODE_AUTO
            case 3 => FLASH_MODE_ALWAYS_OPEN
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Flash Query object.
 *
 * @interface FlashQuery
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
sealed interface FlashQuery {
    /**
     * Check if device has flash light.
     *
     * @returns { Bool } The flash light support status.
     * @throws { BusinessException } 7400103 - Session not config.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func hasFlash(): Bool {
        var errCode: Int32 = 0
        let ret: Bool = unsafe {
            FfiCameraFlashQueryHasFlash((this as RemoteDataLite).getOrThrow().getID(), inout errCode)
        }

        successOrThrow(errCode)
        return ret
    }

    /**
     * Checks whether a specified flash mode is supported.
     *
     * @param { FlashMode } flashMode - Flash mode
     * @returns { Bool } Is the flash mode supported.
     * @throws { BusinessException } 7400103 - Session not config.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func isFlashModeSupported(flashMode: FlashMode): Bool {
        var errCode: Int32 = 0
        let ret: Bool = unsafe {
            FfiCameraFlashQueryFlashModeSupported((this as RemoteDataLite).getOrThrow().getID(), flashMode.value,
                inout errCode)
        }

        successOrThrow(errCode)
        return ret
    }
}

/**
 * Flash object.
 *
 * @interface Flash
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
sealed interface Flash <: FlashQuery {
    /**
     * Sets flash mode.
     *
     * @param { FlashMode } flashMode - Target flash mode.
     * @throws { BusinessException } 7400103 - Session not config.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func setFlashMode(flashMode: FlashMode): Unit {
        var errCode: Int32 = 0
        unsafe {
            FfiCameraFlashSetFlashMode((this as RemoteDataLite).getOrThrow().getID(), flashMode.value, inout errCode)
        }

        successOrThrow(errCode)
    }

    /**
     * Gets current flash mode.
     *
     * @returns { FlashMode } The current flash mode.
     * @throws { BusinessException } 7400103 - Session not config.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func getFlashMode(): FlashMode {
        var errCode: Int32 = 0
        let flashMode: Int32 = unsafe {
            FfiCameraFlashGetFlashMode((this as RemoteDataLite).getOrThrow().getID(), inout errCode)
        }

        successOrThrow(errCode)
        return FlashMode.parse(flashMode)
    }
}

/**
 * Enum for focus state.
 *
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public enum FocusState {
    /**
     * Scan state.
     *
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    FOCUS_STATE_SCAN
    |
        /**
         * Focused state.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    FOCUS_STATE_FOCUSED
    |
        /**
         * Unfocused state.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    FOCUS_STATE_UNFOCUSED
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case FOCUS_STATE_SCAN => 0
                case FOCUS_STATE_FOCUSED => 1
                case FOCUS_STATE_UNFOCUSED => 2
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(value: Int32): FocusState {
        return match (value) {
            case 0 => FOCUS_STATE_SCAN
            case 1 => FOCUS_STATE_FOCUSED
            case 2 => FOCUS_STATE_UNFOCUSED
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enum for focus mode.
 *
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public enum FocusMode {
    /**
     * Manual mode.
     *
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    FOCOS_MODE_MANUAL
    |
        /**
         * Continuous auto mode.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    FOCOS_MODE_CONTINUOUS_AUTO
    |
        /**
         * Auto mode.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    FOCOS_MODE_AUTO
    |
        /**
         * Locked mode.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    FOCUS_MODE_LOCKED
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case FOCOS_MODE_MANUAL => 0
                case FOCOS_MODE_CONTINUOUS_AUTO => 1
                case FOCOS_MODE_AUTO => 2
                case FOCUS_MODE_LOCKED => 3
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(value: Int32): FocusMode {
        return match (value) {
            case 0 => FOCOS_MODE_MANUAL
            case 1 => FOCOS_MODE_CONTINUOUS_AUTO
            case 2 => FOCOS_MODE_AUTO
            case 3 => FOCUS_MODE_LOCKED
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Focus Query object.
 *
 * @interface FocusQuery
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
sealed interface FocusQuery {
    /**
     * Checks whether a specified focus mode is supported.
     *
     * @param { FocusMode } afMode - Focus mode.
     * @returns { Bool } Is the focus mode supported.
     * @throws { BusinessException } 7400103 - Session not config.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func isFocusModeSupported(afMode: FocusMode): Bool {
        var errCode: Int32 = 0
        let ret: Bool = unsafe {
            FfiCameraFocusIsFocusModeSupported((this as RemoteDataLite).getOrThrow().getID(), afMode.value,
                inout errCode)
        }

        successOrThrow(errCode)
        return ret
    }
}

/**
 * Focus object.
 *
 * @interface Focus
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
sealed interface Focus <: FocusQuery {
    /**
     * Sets focus mode.
     *
     * @param { FocusMode } afMode - Target focus mode.
     * @throws { BusinessException } 7400103 - Session not config.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func setFocusMode(afMode: FocusMode): Unit {
        var errCode: Int32 = 0
        unsafe { FfiCameraFocusSetFocusMode((this as RemoteDataLite).getOrThrow().getID(), afMode.value, inout errCode) }
        successOrThrow(errCode)
    }

    /**
     * Gets current focus mode.
     *
     * @returns { FocusMode } The current focus mode.
     * @throws { BusinessException } 7400103 - Session not config.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func getFocusMode(): FocusMode {
        var errCode: Int32 = 0
        let ret: Int32 = unsafe {
            FfiCameraFocusGetFocusMode((this as RemoteDataLite).getOrThrow().getID(), inout errCode)
        }

        successOrThrow(errCode)
        return FocusMode.parse(ret)
    }

    /**
     * Sets focus point.
     *
     * @param { Point } point - Target focus point.
     * @throws { BusinessException } 7400103 - Session not config.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func setFocusPoint(point: Point): Unit {
        var errCode: Int32 = 0
        unsafe {
            FfiCameraFocusSetFocusPoint((this as RemoteDataLite).getOrThrow().getID(), point.asCPoint(), inout errCode)
        }

        successOrThrow(errCode)
    }

    /**
     * Gets current focus point.
     *
     * @returns { Point } The current focus point.
     * @throws { BusinessException } 7400103 - Session not config.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func getFocusPoint(): Point {
        var errCode: Int32 = 0
        let cPoint: CPoint = unsafe {
            FfiCameraFocusGetFocusPoint((this as RemoteDataLite).getOrThrow().getID(), inout errCode)
        }

        successOrThrow(errCode)
        return Point(cPoint)
    }

    /**
     * Gets current focal length.
     *
     * @returns { Float32 } The current focal point.
     * @throws { BusinessException } 7400103 - Session not config.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func getFocalLength(): Float32 {
        var errCode: Int32 = 0
        let ret: Float32 = unsafe {
            FfiCameraFocusGetFocalLength((this as RemoteDataLite).getOrThrow().getID(), inout errCode)
        }

        successOrThrow(errCode)
        return ret
    }
}

/**
 * Enum for video stabilization mode.
 *
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public enum VideoStabilizationMode {
    /**
     * Turn off video stablization.
     *
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    OFF
    |
        /**
         * LOW mode provides basic stabilization effect.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    LOW
    |
        /**
         * MIDDLE mode means algorithms can achieve better effects than LOW mode.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    MIDDLE
    |
        /**
         * HIGH mode means algorithms can achieve better effects than MIDDLE mode.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    HIGH
    |
        /**
         * Camera HDF can select mode automatically.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    AUTO
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case OFF => 0
                case LOW => 1
                case MIDDLE => 2
                case HIGH => 3
                case AUTO => 4
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(value: Int32): VideoStabilizationMode {
        return match (value) {
            case 0 => OFF
            case 1 => LOW
            case 2 => MIDDLE
            case 3 => HIGH
            case 4 => AUTO
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Stabilization Query object.
 *
 * @interface StabilizationQuery
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
sealed interface StabilizationQuery {
    /**
     * Check whether the specified video stabilization mode is supported.
     *
     * @param { VideoStabilizationMode } vsMode - Video Stabilization mode.
     * @returns { Bool } Is flash mode supported.
     * @throws { BusinessException } 7400103 - Session not config.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func isVideoStabilizationModeSupported(vsMode: VideoStabilizationMode): Bool {
        var errCode: Int32 = 0
        let ret: Bool = unsafe {
            FfiCameraStabilizationIsVideoStabilizationModeSupported((this as RemoteDataLite).getOrThrow().getID(),
                vsMode.value, inout errCode)
        }

        successOrThrow(errCode)
        return ret
    }
}

/**
 * Stabilization object.
 *
 * @interface Stabilization
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
sealed interface Stabilization <: StabilizationQuery {
    /**
     * Query the video stabilization mode currently in use.
     *
     * @returns { VideoStabilizationMode } The current video stabilization mode.
     * @throws { BusinessException } 7400103 - Session not config.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func getActiveVideoStabilizationMode(): VideoStabilizationMode {
        var errCode: Int32 = 0
        let ret: Int32 = unsafe {
            FfiCameraStabilizationGetActiveVideoStabilizationMode((this as RemoteDataLite).getOrThrow().getID(),
                inout errCode)
        }
        successOrThrow(errCode)

        return VideoStabilizationMode.parse(ret)
    }

    /**
     * Set video stabilization mode.
     *
     * @param { VideoStabilizationMode } mode - video stabilization mode to set.
     * @throws { BusinessException } 7400103 - Session not config.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func setVideoStabilizationMode(mode: VideoStabilizationMode): Unit {
        var errCode: Int32 = 0
        unsafe {
            FfiCameraStabilizationSetVideoStabilizationMode((this as RemoteDataLite).getOrThrow().getID(), mode.value,
                inout errCode)
        }
        successOrThrow(errCode)
    }
}

/**
 * SmoothZoomInfo object
 *
 * @typedef SmoothZoomInfo
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class SmoothZoomInfo {
    /**
     * The duration of smooth zoom.
     *
     * @type { FLoat32 }
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public SmoothZoomInfo(public var duration: Int32) {}
}

/**
 * Enum for smooth zoom mode.
 *
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public enum SmoothZoomMode {
    /**
     * Normal zoom mode.
     *
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    NORMAL | ...

    prop value: Int32 {
        get() {
            match (this) {
                case NORMAL => 0
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(value: Int32): SmoothZoomMode {
        return match (value) {
            case 0 => NORMAL
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Zoom query object.
 *
 * @interface ZoomQuery
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
sealed interface ZoomQuery {
    /**
     * Gets all supported zoom ratio range.
     *
     * @returns { Array<Float32> } The zoom ratio range.
     * @throws { BusinessException } 7400103 - Session not config.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func getZoomRatioRange(): Array<Float32> {
        var errCode: Int32 = 0
        let zoomRange: CArrFloat32 = unsafe {
            FfiCameraZoomGetZoomRatioRange((this as RemoteDataLite).getOrThrow().getID(), inout errCode)
        }
        try {
            successOrThrow(errCode)
            return unsafe { cArr2cjArr<Float32, Float32>(zoomRange.size, zoomRange.head) {it => it} }
        } finally {
            unsafe { LibC.free(zoomRange.head) }
        }
    }
}

/**
 * Zoom object.
 *
 * @interface Zoom
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
sealed interface Zoom <: ZoomQuery {
    /**
     * Gets zoom ratio.
     *
     * @returns { Float32 } The zoom ratio value.
     * @throws { BusinessException } 7400103 - Session not config.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func setZoomRatio(zoomRatio: Float32): Unit {
        var errCode: Int32 = 0
        unsafe {
            FfiCameraZoomSetZoomRatio((this as RemoteDataLite).getOrThrow().getID(), zoomRatio, inout errCode)
        }
        successOrThrow(errCode)
    }

    /**
     * Gets zoom ratio.
     *
     * @returns { Float32 } The zoom ratio value.
     * @throws { BusinessException } 7400103 - Session not config.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func getZoomRatio(): Float32 {
        var errCode: Int32 = 0
        let ret: Float32 = unsafe {
            FfiCameraZoomGetZoomRatio((this as RemoteDataLite).getOrThrow().getID(), inout errCode)
        }
        successOrThrow(errCode)

        return ret
    }

    /**
     * Sets target zoom ratio by smooth method.
     *
     * @param { Float32 } targetRatio - Target zoom ratio.
     * @param { SmoothZoomMode } mode - Smooth zoom mode.
     * @throws { BusinessException } 7400103 - Session not config.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func setSmoothZoom(targetRatio: Float32, mode: SmoothZoomMode): Unit {
        var errCode: Int32 = 0
        unsafe {
            FfiCameraZoomSetSmoothZoom((this as RemoteDataLite).getOrThrow().getID(), targetRatio, mode.value,
                inout errCode)
        }
        successOrThrow(errCode)
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    func setSmoothZoom(targetRatio: Float32): Unit {
        setSmoothZoom(targetRatio, SmoothZoomMode.NORMAL)
    }
}
