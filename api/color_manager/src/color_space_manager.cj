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

package ohos.color_manager

import ohos.ffi.*
import ohos.labels.*
import ohos.base.*

foreign {
    func CJ_ColorMgrCreateByColorSpace(colorSpaceName: UInt32, id: CPointer<Int64>): RetDataCString

    func CJ_ColorMgrCreate(primaries: CJColorSpacePrimaries, gamma: Float32, errCode: CPointer<Int32>): Int64

    func CJ_ColorMgrGetColorSpaceName(id: Int64, errCode: CPointer<Int32>): UInt32

    func CJ_ColorMgrGetWhitePoint(id: Int64, errCode: CPointer<Int32>): CPointer<Float32>

    func CJ_ColorMgrGetGamma(id: Int64, errCode: CPointer<Int32>): Float32
}

/**
 * Create a color space manager by provided color space type.
 *
 * @param { ColorSpace } colorSpaceName - Indicates the type of color space
 * @returns { ColorSpaceManager } Returns a color space manager object created by provided type.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 18600001 - Parameter value is abnormal.
 * @brief function create(colorSpaceName: ColorSpace): ColorSpaceManager
 */
@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
]
public func create(colorSpaceName: ColorSpace): ColorSpaceManager {
    unsafe {
        var id: Int64 = 0
        let res = CJ_ColorMgrCreateByColorSpace(colorSpaceName.getValue(), inout id)
        let errMsg = res.data.toString()
        LibC.free(res.data)
        if (res.code != 0) {
            throw BusinessException(res.code, "[ColorSpaceManager] create: ${errMsg}")
        }
        return ColorSpaceManager(id)
    }
}

/**
 * Create a customized color space manager by its color primaries and gamma value.
 *
 * @param { ColorSpacePrimaries } primaries - Indicates the customized color primaries
 * @param { number } gamma - Indicates display gamma value
 * @returns { ColorSpaceManager } Returns a color space manager object created by provided type.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 18600001 - Parameter value is abnormal.
 * @brief function create(primaries: ColorSpacePrimaries, gamma: number): ColorSpaceManager
 */
@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
]
public func create(primaries: ColorSpacePrimaries, gamma: Float32): ColorSpaceManager {
    unsafe {
        var errCode: Int32 = 0
        let cPrimaries = CJColorSpacePrimaries(primaries)
        let id = CJ_ColorMgrCreate(cPrimaries, gamma, inout errCode)
        if (errCode != 0) {
            throw BusinessException(
                errCode,
                "[ColorSpaceManager] create: Parameter value is abnormal. Fail to create JsColorSpaceObject with input parameter(s)."
            )
        }
        return ColorSpaceManager(id)
    }
}

/**
 * Defines a color space object and manages its key information
 */
@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
]
public class ColorSpaceManager <: RemoteDataLite {
    protected init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Get the name of color space type.
     *
     * @returns { ColorSpace } Returns the name of color space type.
     * @throws { BusinessException } 18600001 - Parameter value is abnormal.
     * @brief getColorSpaceName(): ColorSpace
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    public func getColorSpaceName(): ColorSpace {
        unsafe {
            var errCode: Int32 = 0
            let res = CJ_ColorMgrGetColorSpaceName(getID(), inout errCode)
            checkRet(errCode, "[ColorSpaceManager] getColorSpaceName: ")
            return ColorSpace.parseInner(res)
        }
    }

    /**
     * Get white point(x, y) of color space.
     *
     * @returns { Array<number> } Returns the white point value of color space.
     * @throws { BusinessException } 18600001 - Parameter value is abnormal.
     * @brief getWhitePoint(): Array<number>
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    public func getWhitePoint(): Array<Float32> {
        unsafe {
            var errCode: Int32 = 0
            let res = CJ_ColorMgrGetWhitePoint(getID(), inout errCode)
            if (res.isNull()) {
                throw BusinessException(errCode, "Parameter value is abnormal. Fail to get white point.")
            }
            checkRet(errCode, "[ColorSpaceManager] getWhitePoint: ")
            let arr = Array<Float32>(2, {i => res.read(i)})
            LibC.free(res)
            return arr
        }
    }

    /**
     * Get gamma value of color space.
     *
     * @returns { number } Returns the gamma value of color space.
     * @throws { BusinessException } 18600001 - Parameter value is abnormal.
     * @brief getGamma(): number
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    public func getGamma(): Float32 {
        unsafe {
            var errCode: Int32 = 0
            let res = CJ_ColorMgrGetGamma(getID(), inout errCode)
            checkRet(errCode, "[ColorSpaceManager] getGamma: ")
            return res
        }
    }
}
