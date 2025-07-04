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

package ohos.effect_kit

import ohos.labels.*
import ohos.image.PixelMap
import ohos.ffi.*
import ohos.base.*

/**
 * Create a color picker to get color of an image.
 * @param { PixelMap } source - the source pixelmap.
 * @param { ?Array<Float64> } region - contains 4 elements, represents the region's left, top, right, bottom coordinates.
 * @returns { ?ColorPicker } - returns the ColorPicker generated.
 * @throws {BusinessException } 401 - Input parameter error.
 * @brief function createColorPicker(source: image.PixelMap): Promise<ColorPicker>;
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public func createColorPicker(source: PixelMap, region!: ?Array<Float64> = None): ?ColorPicker {
    var code = 0u32
    var id: Int64
    if (let Some(v) <- region) {
        if (!invalidParameter(v)) {
            throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
        unsafe {
            let ptr = cjArr2CArr<Float64>(v)
            let cRegion = CArrDouble(ptr, v.size)
            id = FfiEffectKitCreateColorPickerRegion(source.getID(), cRegion, inout code)
            LibC.free(ptr)
        }
    } else {
        id = unsafe { FfiEffectKitCreateColorPicker(source.getID(), inout code) }
    }
    let errorCode = Int32(code)
    if (errorCode != SUCCESS_CODE) {
        if (errorCode == -1) {
            return None
        } else {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
    }
    return ColorPicker(id)
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public class Color {
    Color(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public let red: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public let green: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public let blue: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public let alpha: Int32
    ) {}
}

/**
 * ColorPicker instance.
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public class ColorPicker <: RemoteDataLite {
    protected init(id: Int64) {
        super(id)
        EFFECT_KIT_LOG.info("[ColorPicker] construct success")
    }
    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * get main color of an image
     * @returns { ?Color } returns the MainColor generated.
     * @brief function getMainColor(): Promise<Color>;
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func getMainColor(): ?Color {
        var code = 0u32
        let ret = unsafe { FfiEffectKitGetMainColor(inout code) }
        if (Int32(code) != SUCCESS_CODE) {
            return None
        }
        return Color(ret.red, ret.green, ret.blue, ret.alpha)
    }

    /**
     * Get largest proportion color of an image
     * @returns { ?Color } Largest proportion color picked in the image.
     * @brief function getLargestProportionColor(): Color;
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func getLargestProportionColor(): ?Color {
        var code = 0u32
        let ret = unsafe { FfiEffectKitGetLargestProportionColor(inout code) }
        if (Int32(code) != SUCCESS_CODE) {
            return None
        }
        return Color(ret.red, ret.green, ret.blue, ret.alpha)
    }

    /**
     * Get highest saturation color of an image
     * @returns { ?Color } Highest saturation color picked in the image.
     * @brief function getHighestSaturationColor(): Color;
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func getHighestSaturationColor(): ?Color {
        var code = 0u32
        let ret = unsafe { FfiEffectKitGetHighestSaturationColor(inout code) }
        if (Int32(code) != SUCCESS_CODE) {
            return None
        }
        return Color(ret.red, ret.green, ret.blue, ret.alpha)
    }

    /**
     * Get average color of an image
     * @returns { Color } Average color calculated in the image.
     * @brief function getAverageColor(): Color;
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func getAverageColor(): ?Color {
        var code = 0u32
        let ret = unsafe { FfiEffectKitGetAverageColor(inout code) }
        if (Int32(code) != SUCCESS_CODE) {
            return None
        }
        return Color(ret.red, ret.green, ret.blue, ret.alpha)
    }

    /**
     * Determine whether the color is black or white or gray
     * @param { UInt32 } color - The 32 bit ARGB color to discriminate.
     * @returns { Bool } Result of judging black, white and gray.
     * @brief function isBlackOrWhiteOrGrayColor(color: number): boolean;
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func isBlackOrWhiteOrGrayColor(color: UInt32): Bool {
        return unsafe { FfiEffectKitIsBlackOrWhiteOrGrayColor(color) }
    }

    /**
     * Get top proportion color of an image
     * @param { Float64 } colorCount - The number of colors to require, the value is 1 to 10.
     * @returns { Array<?Color> } An array of feature colors sorted by proportion, with a size equal to
     *                                  the minimum of colorCount and the actual number of extracted feature colors.
     * @brief function getTopProportionColors(colorCount: number): Array<Option<Color>>;
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func getTopProportionColors(colorCount: Float64): Array<?Color> {
        if (colorCount < Float64(1)) {
            return [None]
        }
        var code = 0u32
        let arr: Array<Color>
        unsafe {
            let ret = FfiEffectKitGetTopProportionColors(colorCount, inout code)
            if (Int32(code) != SUCCESS_CODE) {
                return [None]
            }
            arr = cArr2cjArr<CColor, Color>(ret.size, ret.head, {
                i => Color(i.red, i.green, i.blue, i.alpha)
            })
            LibC.free(ret.head)
        }

        let retColors = Array<Option<Color>>(arr.size) {i => arr[i]}
        return retColors
    }
}
