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
class testPointApplyGenericGlobalFunction_53 {
    @TestCase
    func TestCase_696(): Unit {
        logger.info("testcase TestCase_696 begins.")
        logger.info("成功调用")
        moduleInfo
            .getFunctions("globalFunction_261")[0i64]
            .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                [GenericStructWith1TypeParameters<Bool>()])
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_261")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#16523: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_261")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#16524: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_261")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#16525: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_261")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16526: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_261")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16527: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_261")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#16528: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_261")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], []
                )
            @Expect("assertion#16529: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_261")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16530: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_261")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16531: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_261")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#16532: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_261")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], []
                )
            @Expect("assertion#16533: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_261")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#16534: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_261")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#16535: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_261")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#16536: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_261")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#16537: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            moduleInfo
                .getFunctions("globalFunction_261")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16538: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_261")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16539: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_261")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#16540: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_261")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#16541: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("testcase TestCase_696 ends.")
    }

    @TestCase
    func TestCase_697(): Unit {
        logger.info("testcase TestCase_697 begins.")
        logger.info("成功调用")
        moduleInfo
            .getFunctions("globalFunction_262")[0i64]
            .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()],
                [GenericStructWith1TypeParameters<Int8>()])
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [GenericStructWith1TypeParameters<Int8>()])
            @Expect("assertion#16542: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [GenericStructWith1TypeParameters<Int8>()])
            @Expect("assertion#16543: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int8>()])
            @Expect("assertion#16544: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#16545: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_262")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], []
            )
            @Expect("assertion#16546: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_262")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#16547: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16548: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#16549: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_262")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], []
            )
            @Expect("assertion#16550: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_262")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#16551: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16552: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#16553: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#16554: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#16555: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#16556: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            moduleInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#16557: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#16558: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_262")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [()]
            )
            @Expect("assertion#16559: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()]
                )
            @Expect("assertion#16560: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("testcase TestCase_697 ends.")
    }

    @TestCase
    func TestCase_698(): Unit {
        logger.info("testcase TestCase_698 begins.")
        logger.info("成功调用")
        moduleInfo
            .getFunctions("globalFunction_263")[0i64]
            .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()],
                [GenericStructWith1TypeParameters<Int16>()])
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_263")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#16561: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_263")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#16562: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_263")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#16563: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_263")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#16564: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_263")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#16565: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_263")[0i64].apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], []
            )
            @Expect("assertion#16566: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_263")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#16567: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_263")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#16568: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_263")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#16569: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_263")[0i64].apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], []
            )
            @Expect("assertion#16570: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_263")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#16571: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_263")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#16572: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_263")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#16573: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_263")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#16574: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_263")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#16575: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            moduleInfo
                .getFunctions("globalFunction_263")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#16576: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_263")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#16577: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_263")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#16578: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_263")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#16579: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("testcase TestCase_698 ends.")
    }

    @TestCase
    func TestCase_699(): Unit {
        logger.info("testcase TestCase_699 begins.")
        logger.info("成功调用")
        moduleInfo
            .getFunctions("globalFunction_264")[0i64]
            .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()],
                [GenericStructWith1TypeParameters<Int32>()])
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_264")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#16580: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_264")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#16581: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_264")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#16582: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_264")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#16583: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_264")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#16584: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_264")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#16585: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_264")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16586: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_264")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#16587: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_264")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#16588: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_264")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#16589: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_264")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16590: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_264")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#16591: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_264")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#16592: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_264")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#16593: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_264")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#16594: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            moduleInfo
                .getFunctions("globalFunction_264")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#16595: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_264")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [()]
            )
            @Expect("assertion#16596: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_264")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#16597: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_264")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16598: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("testcase TestCase_699 ends.")
    }

    @TestCase
    func TestCase_700(): Unit {
        logger.info("testcase TestCase_700 begins.")
        logger.info("成功调用")
        moduleInfo
            .getFunctions("globalFunction_265")[0i64]
            .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()],
                [GenericStructWith1TypeParameters<Int64>()])
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_265")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#16599: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_265")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#16600: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_265")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#16601: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_265")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#16602: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_265")[0i64].apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#16603: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_265")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#16604: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_265")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16605: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_265")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#16606: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_265")[0i64].apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#16607: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_265")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#16608: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_265")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16609: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_265")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#16610: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_265")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#16611: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_265")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#16612: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_265")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#16613: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            moduleInfo
                .getFunctions("globalFunction_265")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#16614: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_265")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#16615: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_265")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [()]
            )
            @Expect("assertion#16616: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_265")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16617: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("testcase TestCase_700 ends.")
    }
}
