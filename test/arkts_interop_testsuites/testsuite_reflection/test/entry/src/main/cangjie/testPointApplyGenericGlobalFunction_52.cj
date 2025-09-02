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
class testPointApplyGenericGlobalFunction_52 {
    @TestCase
    func TestCase_691(): Unit {
        logger.info("testcase TestCase_691 begins.")
        logger.info("成功调用")
        moduleInfo
            .getFunctions("globalFunction_256")[0i64]
            .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [NonGenericStruct()])
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [NonGenericStruct()])
            @Expect("assertion#16428: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [NonGenericStruct()])
            @Expect("assertion#16429: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#16430: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#16431: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_256")[0i64].apply([TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#16432: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_256")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#16433: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16434: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#16435: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_256")[0i64].apply([TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#16436: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_256")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#16437: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16438: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16439: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16440: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16441: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16442: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            moduleInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#16443: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_256")[0i64].apply([TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [()]
            )
            @Expect("assertion#16444: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#16445: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16446: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("testcase TestCase_691 ends.")
    }

    @TestCase
    func TestCase_692(): Unit {
        logger.info("testcase TestCase_692 begins.")
        logger.info("成功调用")
        moduleInfo
            .getFunctions("globalFunction_257")[0i64]
            .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [NonGenericStruct()])
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [NonGenericStruct()])
            @Expect("assertion#16447: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()], [NonGenericStruct()])
            @Expect("assertion#16448: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#16449: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#16450: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_257")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#16451: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_257")[0i64].apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16452: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16453: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#16454: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_257")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#16455: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_257")[0i64].apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16456: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16457: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16458: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16459: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16460: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16461: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            moduleInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#16462: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_257")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [()]
            )
            @Expect("assertion#16463: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#16464: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_257")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()]
                )
            @Expect("assertion#16465: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("testcase TestCase_692 ends.")
    }

    @TestCase
    func TestCase_693(): Unit {
        logger.info("testcase TestCase_693 begins.")
        logger.info("成功调用")
        moduleInfo
            .getFunctions("globalFunction_258")[0i64]
            .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [NonGenericStruct()])
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_258")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [NonGenericStruct()])
            @Expect("assertion#16466: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_258")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>()], [NonGenericStruct()])
            @Expect("assertion#16467: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_258")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#16468: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_258")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16469: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_258")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16470: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_258")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#16471: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_258")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16472: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_258")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16473: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_258")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16474: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_258")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#16475: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_258")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16476: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_258")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16477: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_258")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16478: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_258")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16479: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_258")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16480: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            moduleInfo
                .getFunctions("globalFunction_258")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#16481: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_258")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#16482: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_258")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#16483: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_258")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16484: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("testcase TestCase_693 ends.")
    }

    @TestCase
    func TestCase_694(): Unit {
        logger.info("testcase TestCase_694 begins.")
        logger.info("成功调用")
        moduleInfo
            .getFunctions("globalFunction_259")[0i64]
            .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [NonGenericStruct()])
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_259")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [NonGenericStruct()])
            @Expect("assertion#16485: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_259")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [NonGenericStruct()])
            @Expect("assertion#16486: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_259")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#16487: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_259")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#16488: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_259")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#16489: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_259")[0i64].apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], []
            )
            @Expect("assertion#16490: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_259")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16491: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_259")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#16492: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_259")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#16493: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_259")[0i64].apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], []
            )
            @Expect("assertion#16494: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_259")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16495: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_259")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16496: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_259")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16497: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_259")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16498: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_259")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16499: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            moduleInfo
                .getFunctions("globalFunction_259")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#16500: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_259")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [()]
            )
            @Expect("assertion#16501: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_259")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#16502: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_259")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#16503: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("testcase TestCase_694 ends.")
    }

    @TestCase
    func TestCase_695(): Unit {
        logger.info("testcase TestCase_695 begins.")
        logger.info("成功调用")
        moduleInfo
            .getFunctions("globalFunction_260")[0i64]
            .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                [GenericStructWith1TypeParameters<Unit>()])
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#16504: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#16505: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#16506: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#16507: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_260")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#16508: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_260")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16509: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16510: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#16511: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_260")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#16512: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_260")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16513: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16514: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#16515: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#16516: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#16517: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#16518: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            moduleInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#16519: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#16520: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_260")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#16521: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16522: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("testcase TestCase_695 ends.")
    }
}
