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

import ohos.ffi.*
import ohos.base.*
import ohos.image.PixelMap
import ohos.labels.*

/**
 * Create a FilterChain to add multiple effects to an image.
 * @param { PixelMap } source - the source pixelmap.
 * @returns { ?Filter } Returns the head node of FilterChain.
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public func createEffect(source: PixelMap): ?Filter {
    let res = unsafe { FfiEffectKitCreateEffect(source.getID()) }
    if (res == -1) {
        return None
    }
    return Filter(res)
}

/**
 * Filter instance.
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public class Filter <: RemoteDataLite {
    protected init(id: Int64) {
        super(id)
        EFFECT_KIT_LOG.info("[Filter] construct success")
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * A blur effect is added to the image.
     * @param { Float32 } radius - The degree of blur, the value is measured in pixels.
     * @returns { Filter } Filters for the current effect have been added.
     * @brief function blur(radius: number): Filter;
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func blur(radius: Float32): Filter {
        unsafe { FfiEffectKitBlur(getID(), radius) }
        return this
    }

    /**
     * A invert effect is added to the image.
     * @returns { Filter } Filters for the current effect have been added.
     * @brief function invert(): Filter;
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func invert(): Filter {
        unsafe { FfiEffectKitInvert(getID()) }
        return this
    }

    /**
     * A Brightness effect is added to the image.
     * @param { Float32 } bright - The degree of light and darkness,the value range is 0 to 1.
     * @returns { Filter } Filters for the current effect have been added.
     * @throws { BusinessException } 401 - Input parameter error.
     * @brief function brightness(bright: number): Filter;
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func brightness(bright: Float32): Filter {
        if (bright < 0.0 || bright > 1.0) {
            throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
        unsafe { FfiEffectKitBrightness(getID(), bright) }
        return this
    }

    /**
     * A Grayscale effect is added to the image.
     * @returns { Filter } Filters for the current effect have been added.
     * @brief function grayscale(): Filter;
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func grayscale(): Filter {
        unsafe { FfiEffectKitGrayscale(getID()) }
        return this
    }

    /**
     * A custom effect is added to the image.
     *
     * @param { Array<Float32> } colorMatrix - A matrix of 5x4 size for create effect filter.
     * @returns { Filter } Filters for the current effect have been added.
     * @throws { BusinessException } 401 - Input parameter error.
     * @brief function setColorMatrix(colorMatrix: Array<number>): Filter;
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func setColorMatrix(colorMatrix: Array<Float32>): Filter {
        if (colorMatrix.size != MATRIX_SIZE) {
            throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
        for (i in 0..colorMatrix.size) {
            if (colorMatrix[i] < 0.0 || colorMatrix[i] > 1.0) {
                throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
            }
        }
        var code = 0u32
        unsafe {
            let ptr = cjArr2CArr<Float32>(colorMatrix)
            let rColorMatrix = CArrFloat32(ptr, colorMatrix.size)
            FfiEffectKitSetColorMatrix(getID(), rColorMatrix, inout code)
            LibC.free(ptr)
        }
        if (Int32(code) != SUCCESS_CODE) {
            throw BusinessException(Int32(code), getErrorMsg(Int32(code)))
        }
        return this
    }

    /**
     * Gets the PixelMap where all filter effects have been added to the image.
     * @returns { PixelMap } - returns the PixelMap generated.
     * @brief function getPixelMap(): image.PixelMap;
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func getEffectPixelMap(): PixelMap {
        let id = unsafe { FfiEffectKitGetEffectPixelMap() }
        return PixelMap(id)
    }
}
