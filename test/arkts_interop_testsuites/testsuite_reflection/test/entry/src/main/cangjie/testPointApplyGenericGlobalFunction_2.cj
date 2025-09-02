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
class testPointApplyGenericGlobalFunction_2 {
    @TestCase
    func TestCase_441(): Unit {
        logger.info("testcase TestCase_441 begins.")
        logger.info("成功调用")
        moduleInfo
            .getFunctions("globalFunction_6")[0i64]
            .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()],
                [GenericClassWith2TypeParameters<UInt32, UInt32>()])
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#12423: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#12424: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#12425: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#12426: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_6")[0i64].apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#12427: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_6")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#12428: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12429: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#12430: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_6")[0i64].apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#12431: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_6")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#12432: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12433: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#12434: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#12435: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#12436: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#12437: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            moduleInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#12438: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_6")[0i64].apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [()]
            )
            @Expect("assertion#12439: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_6")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#12440: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#12441: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("testcase TestCase_441 ends.")
    }

    @TestCase
    func TestCase_442(): Unit {
        logger.info("testcase TestCase_442 begins.")
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo
                .getFunctions("globalFunction_7")[0i64]
                .apply([], [NonGenericClass(), GenericStructWith1TypeParameters<Int8>(), ()])
            @Expect("assertion#12442: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo
                .getFunctions("globalFunction_7")[0i64]
                .apply([TypeInfo.of<Float32>()], [NonGenericClass(), GenericStructWith1TypeParameters<Int8>(), ()])
            @Expect("assertion#12443: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_7")[0i64].apply([], [GenericStructWith1TypeParameters<Int8>(), ()])
            @Expect("assertion#12444: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo
                .getFunctions("globalFunction_7")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int8>(), ()])
            @Expect("assertion#12445: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo
                .getFunctions("globalFunction_7")[0i64]
                .apply([], [NonGenericClass(), GenericStructWith1TypeParameters<Int8>()])
            @Expect("assertion#12446: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo
                .getFunctions("globalFunction_7")[0i64]
                .apply([TypeInfo.of<Float32>()], [NonGenericClass(), GenericStructWith1TypeParameters<Int8>()])
            @Expect("assertion#12447: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo
                .getFunctions("globalFunction_7")[0i64]
                .apply([], [NonGenericClass(), GenericStructWith1TypeParameters<Int8>(), (), 114.514000f64])
            @Expect("assertion#12448: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo
                .getFunctions("globalFunction_7")[0i64]
                .apply([TypeInfo.of<Float32>()],
                    [NonGenericClass(), GenericStructWith1TypeParameters<Int8>(), (), 114.514000f64])
            @Expect("assertion#12449: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo
                .getFunctions("globalFunction_7")[0i64]
                .apply([], [(), GenericStructWith1TypeParameters<Int8>(), ()])
            @Expect("assertion#12450: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo
                .getFunctions("globalFunction_7")[0i64]
                .apply([TypeInfo.of<Float32>()], [(), GenericStructWith1TypeParameters<Int8>(), ()])
            @Expect("assertion#12451: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_7")[0i64].apply([], [NonGenericClass(), (), ()])
            @Expect("assertion#12452: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_7")[0i64].apply([TypeInfo.of<Float32>()], [NonGenericClass(), (), ()]
            )
            @Expect("assertion#12453: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo
                .getFunctions("globalFunction_7")[0i64]
                .apply([], [NonGenericClass(), GenericStructWith1TypeParameters<Int8>(), 123i64])
            @Expect("assertion#12454: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo
                .getFunctions("globalFunction_7")[0i64]
                .apply([TypeInfo.of<Float32>()], [NonGenericClass(), GenericStructWith1TypeParameters<Int8>(), 123i64])
            @Expect("assertion#12455: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("testcase TestCase_442 ends.")
    }

    @TestCase
    func TestCase_443(): Unit {
        logger.info("testcase TestCase_443 begins.")
        logger.info("成功调用")
        moduleInfo
            .getFunctions("globalFunction_8")[0i64]
            .apply([TypeInfo.of<Bool>()],
                [GenericClassWith1TypeParameters<UInt32>(), GenericClassWith2TypeParameters<Int16, Int16>(),
                    GenericStructWith2TypeParameters<UInt64, UInt64>()])
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([],
                    [GenericClassWith1TypeParameters<UInt32>(), GenericClassWith2TypeParameters<Int16, Int16>(),
                        GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#12456: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([],
                    [GenericClassWith1TypeParameters<UInt32>(), GenericClassWith2TypeParameters<Int16, Int16>(),
                        GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#12457: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt32>(), GenericClassWith2TypeParameters<Int16, Int16>(),
                        GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#12458: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply(
                    [TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>(), GenericStructWith2TypeParameters<UInt64, UInt64>()]
                )
            @Expect("assertion#12459: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply(
                    [],
                    [GenericClassWith2TypeParameters<Int16, Int16>(), GenericStructWith2TypeParameters<UInt64, UInt64>()]
                )
            @Expect("assertion#12460: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply(
                    [],
                    [GenericClassWith2TypeParameters<Int16, Int16>(), GenericStructWith2TypeParameters<UInt64, UInt64>()]
                )
            @Expect("assertion#12461: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply(
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>(), GenericStructWith2TypeParameters<UInt64, UInt64>()]
                )
            @Expect("assertion#12462: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<UInt32>(), GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#12463: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([], [GenericClassWith1TypeParameters<UInt32>(), GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#12464: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([], [GenericClassWith1TypeParameters<UInt32>(), GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#12465: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt32>(), GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#12466: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<UInt32>(), GenericClassWith2TypeParameters<Int16, Int16>(),
                        GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#12467: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([],
                    [GenericClassWith1TypeParameters<UInt32>(), GenericClassWith2TypeParameters<Int16, Int16>(),
                        GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#12468: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([],
                    [GenericClassWith1TypeParameters<UInt32>(), GenericClassWith2TypeParameters<Int16, Int16>(),
                        GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#12469: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt32>(), GenericClassWith2TypeParameters<Int16, Int16>(),
                        GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#12470: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([TypeInfo.of<Bool>()],
                    [(), GenericClassWith2TypeParameters<Int16, Int16>(),
                        GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#12471: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([],
                    [(), GenericClassWith2TypeParameters<Int16, Int16>(),
                        GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#12472: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([],
                    [(), GenericClassWith2TypeParameters<Int16, Int16>(),
                        GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#12473: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [(), GenericClassWith2TypeParameters<Int16, Int16>(),
                        GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#12474: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<UInt32>(), (), GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#12475: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([],
                    [GenericClassWith1TypeParameters<UInt32>(), (), GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#12476: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([],
                    [GenericClassWith1TypeParameters<UInt32>(), (), GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#12477: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt32>(), (), GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#12478: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<UInt32>(), GenericClassWith2TypeParameters<Int16, Int16>(), ()])
            @Expect("assertion#12479: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([],
                    [GenericClassWith1TypeParameters<UInt32>(), GenericClassWith2TypeParameters<Int16, Int16>(), ()])
            @Expect("assertion#12480: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([],
                    [GenericClassWith1TypeParameters<UInt32>(), GenericClassWith2TypeParameters<Int16, Int16>(), ()])
            @Expect("assertion#12481: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt32>(), GenericClassWith2TypeParameters<Int16, Int16>(), ()])
            @Expect("assertion#12482: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("testcase TestCase_443 ends.")
    }

    @TestCase
    func TestCase_444(): Unit {
        logger.info("testcase TestCase_444 begins.")
        logger.info("成功调用")
        moduleInfo
            .getFunctions("globalFunction_9")[0i64]
            .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                [GenericStructWith1TypeParameters<Bool>(), GenericClassWith2TypeParameters<Float32, Float32>(),
                    GenericStructWith1TypeParameters<UInt8>()])
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericClassWith2TypeParameters<Float32, Float32>(),
                        GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#12483: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericClassWith2TypeParameters<Float32, Float32>(),
                        GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#12484: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericClassWith2TypeParameters<Float32, Float32>(),
                        GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#12485: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>(), GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#12486: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>(), GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#12487: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>(), GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#12488: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>(), GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#12489: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericClassWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#12490: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericClassWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#12491: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericClassWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#12492: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericClassWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#12493: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericClassWith2TypeParameters<Float32, Float32>(),
                        GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#12494: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericClassWith2TypeParameters<Float32, Float32>(),
                        GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#12495: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericClassWith2TypeParameters<Float32, Float32>(),
                        GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#12496: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericClassWith2TypeParameters<Float32, Float32>(),
                        GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#12497: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply(
                    [TypeInfo.of<Unit>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [(), GenericClassWith2TypeParameters<Float32, Float32>(), GenericStructWith1TypeParameters<UInt8>()]
                )
            @Expect("assertion#12498: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply(
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [(), GenericClassWith2TypeParameters<Float32, Float32>(), GenericStructWith1TypeParameters<UInt8>()]
                )
            @Expect("assertion#12499: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply(
                    [TypeInfo.of<Unit>(), TypeInfo.of<Float32>()],
                    [(), GenericClassWith2TypeParameters<Float32, Float32>(), GenericStructWith1TypeParameters<UInt8>()]
                )
            @Expect("assertion#12500: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply(
                    [TypeInfo.of<Unit>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [(), GenericClassWith2TypeParameters<Float32, Float32>(), GenericStructWith1TypeParameters<UInt8>()]
                )
            @Expect("assertion#12501: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Bool>(), (), GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#12502: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Bool>(), (), GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#12503: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<Bool>(), (), GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#12504: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), (), GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#12505: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericClassWith2TypeParameters<Float32, Float32>(), ()])
            @Expect("assertion#12506: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericClassWith2TypeParameters<Float32, Float32>(), ()])
            @Expect("assertion#12507: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericClassWith2TypeParameters<Float32, Float32>(), ()])
            @Expect("assertion#12508: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_9")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericClassWith2TypeParameters<Float32, Float32>(), ()])
            @Expect("assertion#12509: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("testcase TestCase_444 ends.")
    }

    @TestCase
    func TestCase_445(): Unit {
        logger.info("testcase TestCase_445 begins.")
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_10")[0i64].apply([], [()])
            @Expect("assertion#12510: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_10")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#12511: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_10")[0i64].apply([], [])
            @Expect("assertion#12512: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_10")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12513: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_10")[0i64].apply([], [])
            @Expect("assertion#12514: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_10")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12515: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_10")[0i64].apply([], [(), 114.514000f64])
            @Expect("assertion#12516: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_10")[0i64].apply([TypeInfo.of<Float32>()], [(), 114.514000f64])
            @Expect("assertion#12517: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_10")[0i64].apply([], [123i64])
            @Expect("assertion#12518: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_10")[0i64].apply([TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#12519: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("testcase TestCase_445 ends.")
    }
}
