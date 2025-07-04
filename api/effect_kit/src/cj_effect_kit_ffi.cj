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

foreign {
    func FfiEffectKitCreateEffect(sourceId: Int64): Int64

    func FfiEffectKitBlur(id: Int64, radius: Float32): Unit

    func FfiEffectKitInvert(id: Int64): Unit

    func FfiEffectKitBrightness(id: Int64, bright: Float32): Unit

    func FfiEffectKitGrayscale(id: Int64): Unit

    func FfiEffectKitGetEffectPixelMap(): Int64

    func FfiEffectKitSetColorMatrix(id: Int64, colorMatrix: CArrFloat32, code: CPointer<UInt32>): Int64

    func FfiEffectKitCreateColorPicker(sourceId: Int64, code: CPointer<UInt32>): Int64

    func FfiEffectKitCreateColorPickerRegion(sourceId: Int64, region: CArrDouble, code: CPointer<UInt32>): Int64

    func FfiEffectKitGetMainColor(code: CPointer<UInt32>): CColor

    func FfiEffectKitGetLargestProportionColor(code: CPointer<UInt32>): CColor

    func FfiEffectKitGetHighestSaturationColor(code: CPointer<UInt32>): CColor

    func FfiEffectKitGetAverageColor(code: CPointer<UInt32>): CColor

    func FfiEffectKitIsBlackOrWhiteOrGrayColor(color: UInt32): Bool

    func FfiEffectKitGetTopProportionColors(colorCount: Float64, code: CPointer<UInt32>): CArrCColor
}

@C
struct CArrCColor {
    CArrCColor(
        var head: CPointer<CColor>,
        var size: Int64
    ) {}
}

@C
struct CColor {
    CColor(
        var red: Int32,
        var green: Int32,
        var blue: Int32,
        var alpha: Int32
    ) {}
}
