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

package ohos_app_cangjie_entry

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import std.reflect.*
import dependency.*
import std.collection.*
import ohos.uniformTypeDescriptor.*
import ohos.ark_interop.*
import ohos.state_manage.AppStorage
import ohos.ability_delegator_registry.AbilityDelegatorRegistry
import ohos.ability.Want
import ohos.vibrator.*
import ohos.file_fs.*
import std.math.numeric.BigInt
import ohos.ability.*
import std.math.MathExtension
import ohos.bundle_manager.*
import ohos.base.*
import ohos.ui_test.*
import stdx.encoding.json.*

@Test
class testPointApplyGenericGlobalFunction_58 {
    @TestCase
    func TestCase_721(): Unit {
        logger.info("testcase TestCase_721 begins.")
        logger.info("成功调用")
        moduleInfo
            .getFunctions("globalFunction_286")[0i64]
            .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()],
                [GenericStructWith2TypeParameters<Float64, Float64>()])
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#16998: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#16999: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#17000: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#17001: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_286")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#17002: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_286")[0i64].apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()], []
            )
            @Expect("assertion#17003: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], []
                )
            @Expect("assertion#17004: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#17005: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_286")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#17006: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_286")[0i64].apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()], []
            )
            @Expect("assertion#17007: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], []
                )
            @Expect("assertion#17008: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#17009: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#17010: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#17011: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#17012: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            moduleInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#17013: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#17014: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#17015: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#17016: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("testcase TestCase_721 ends.")
    }

    @TestCase
    func TestCase_722(): Unit {
        logger.info("testcase TestCase_722 begins.")
        logger.info("成功调用")
        moduleInfo
            .getFunctions("globalFunction_287")[0i64]
            .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()],
                [GenericStructWith2TypeParameters<Unit, Unit>()])
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_287")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#17017: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_287")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#17018: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_287")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#17019: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_287")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#17020: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_287")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#17021: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_287")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#17022: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_287")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#17023: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_287")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#17024: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_287")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#17025: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_287")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#17026: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_287")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#17027: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_287")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#17028: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_287")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#17029: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_287")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#17030: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_287")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#17031: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            moduleInfo
                .getFunctions("globalFunction_287")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#17032: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_287")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#17033: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_287")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#17034: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_287")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#17035: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("testcase TestCase_722 ends.")
    }

    @TestCase
    func TestCase_723(): Unit {
        logger.info("testcase TestCase_723 begins.")
        logger.info("成功调用")
        moduleInfo
            .getFunctions("globalFunction_288")[0i64]
            .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()],
                [GenericStructWith2TypeParameters<UInt8, UInt8>()])
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [GenericStructWith2TypeParameters<UInt8, UInt8>()]
                )
            @Expect("assertion#17036: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#17037: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#17038: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#17039: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_288")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#17040: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_288")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#17041: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#17042: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#17043: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_288")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#17044: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_288")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#17045: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#17046: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#17047: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#17048: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#17049: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#17050: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            moduleInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#17051: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#17052: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_288")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#17053: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#17054: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("testcase TestCase_723 ends.")
    }

    @TestCase
    func TestCase_724(): Unit {
        logger.info("testcase TestCase_724 begins.")
        logger.info("成功调用")
        moduleInfo
            .getFunctions("globalFunction_289")[0i64]
            .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>()],
                [GenericStructWith2TypeParameters<Int16, Int16>()])
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_289")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [GenericStructWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#17055: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_289")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [GenericStructWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#17056: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_289")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#17057: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_289")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#17058: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_289")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#17059: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_289")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#17060: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_289")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#17061: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_289")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#17062: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_289")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#17063: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_289")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#17064: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_289")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#17065: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_289")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#17066: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_289")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#17067: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_289")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#17068: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_289")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#17069: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            moduleInfo
                .getFunctions("globalFunction_289")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#17070: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_289")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [()]
            )
            @Expect("assertion#17071: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_289")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#17072: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_289")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#17073: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("testcase TestCase_724 ends.")
    }
}
