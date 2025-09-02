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
class testGetInstanceFunctions_StandardClassType_1 {
    @TestCase
    func TestCase_0(): Unit {
        logger.info("testcase TestCase_0 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int8, Bool, Unit>>().getInstanceFunctions("classInstanceMemberFunction_1").size)
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply(StandardClassType<Int8, Bool, Unit>(), [], [])
            @Expect("assertion#0: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply(1i64, [], [114.514000f64])
            @Expect("assertion#2: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply(StandardClassType<Int8, Bool, Unit>(), [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#3: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#5: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int8, Bool, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
            .apply(StandardClassType<Int8, Bool, Unit>(), [])
        logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int8, Bool, Unit>\", but now it`s \"Int64\"")
        }
        logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply("hello", [])
            @Expect("assertion#7: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int8, Bool, Unit>\", but now it`s \"String\"")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply(StandardClassType<Int8, Bool, Unit>(), [114.514000f64])
            @Expect("assertion#8: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#9: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_1")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#10: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("testcase TestCase_0 ends.")
    }

    @TestCase
    func TestCase_1(): Unit {
        logger.info("testcase TestCase_1 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, Float64, UInt32>>().getInstanceFunctions("classInstanceMemberFunction_2").size)
        logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int32, Float64, UInt32>>()
            .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
            .apply(StandardClassType<Int32, Float64, UInt32>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#12: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [114.514000f64])
            @Expect("assertion#13: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(StandardClassType<Int32, Float64, UInt32>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()],
                    [114.514000f64])
            @Expect("assertion#14: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(
                    "hello",
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [114.514000f64]
                )
            @Expect("assertion#15: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(StandardClassType<Int32, Float64, UInt32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(StandardClassType<Int32, Float64, UInt32>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [114.514000f64])
            @Expect("assertion#17: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#18: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int32, Float64, UInt32>\", but now it`s \"String\"")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#19: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#20: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#21: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(StandardClassType<Int32, Float64, UInt32>(), [])
            @Expect("assertion#22: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(1i64, [])
            @Expect("assertion#23: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply("hello", [])
            @Expect("assertion#24: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(StandardClassType<Int32, Float64, UInt32>(), [114.514000f64])
            @Expect("assertion#25: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#26: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#27: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("testcase TestCase_1 ends.")
    }

    @TestCase
    func TestCase_2(): Unit {
        logger.info("testcase TestCase_2 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Int8, Float64>>().getInstanceFunctions("classInstanceMemberFunction_3").size)
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(StandardClassType<UInt64, Int8, Float64>(), [],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), GenericClassWith2TypeParameters<Int8, Int8>(),
                        NonGenericClass()])
            @Expect("assertion#28: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), GenericClassWith2TypeParameters<Int8, Int8>(),
                        NonGenericClass()])
            @Expect("assertion#29: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64, [], [GenericClassWith2TypeParameters<Int8, Int8>(), NonGenericClass()])
            @Expect("assertion#30: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(StandardClassType<UInt64, Int8, Float64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Int8, Int8>(), NonGenericClass()])
            @Expect("assertion#31: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello", [],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#32: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), GenericClassWith2TypeParameters<Int8, Int8>(),
                        NonGenericClass(), 114.514000f64])
            @Expect("assertion#33: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(StandardClassType<UInt64, Int8, Float64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#34: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(StandardClassType<UInt64, Int8, Float64>(), [],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), GenericClassWith2TypeParameters<Int8, Int8>(),
                        NonGenericClass(), 114.514000f64])
            @Expect("assertion#35: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(StandardClassType<UInt64, Int8, Float64>(), [],
                    [(), GenericClassWith2TypeParameters<Int8, Int8>(), NonGenericClass()])
            @Expect("assertion#36: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()],
                    [(), GenericClassWith2TypeParameters<Int8, Int8>(), NonGenericClass()])
            @Expect("assertion#37: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(StandardClassType<UInt64, Int8, Float64>(), [],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), (), NonGenericClass()])
            @Expect("assertion#38: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), (), NonGenericClass()])
            @Expect("assertion#39: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(StandardClassType<UInt64, Int8, Float64>(), [],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), GenericClassWith2TypeParameters<Int8, Int8>(),
                        ()])
            @Expect("assertion#40: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), GenericClassWith2TypeParameters<Int8, Int8>(),
                        ()])
            @Expect("assertion#41: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello", [],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), GenericClassWith2TypeParameters<Int8, Int8>(),
                        NonGenericClass()])
            @Expect("assertion#42: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello", [], [GenericClassWith2TypeParameters<Int8, Int8>(), NonGenericClass()])
            @Expect("assertion#43: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64, [],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#44: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64, [],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), GenericClassWith2TypeParameters<Int8, Int8>(),
                        NonGenericClass(), 114.514000f64])
            @Expect("assertion#45: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello", [], [(), GenericClassWith2TypeParameters<Int8, Int8>(), NonGenericClass()])
            @Expect("assertion#46: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello", [], [GenericClassWith2TypeParameters<UInt64, UInt64>(), (), NonGenericClass()])
            @Expect("assertion#47: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello", [],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), GenericClassWith2TypeParameters<Int8, Int8>(),
                        ()])
            @Expect("assertion#48: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, Int8, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
            .apply(StandardClassType<UInt64, Int8, Float64>(),
                [GenericClassWith2TypeParameters<UInt64, UInt64>(), GenericClassWith2TypeParameters<Int8, Int8>(),
                    NonGenericClass()])
        logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64,
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), GenericClassWith2TypeParameters<Int8, Int8>(),
                        NonGenericClass()])
            @Expect("assertion#49: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt64, Int8, Float64>\", but now it`s \"Int64\"")
        }
        logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello",
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), GenericClassWith2TypeParameters<Int8, Int8>(),
                        NonGenericClass()])
            @Expect("assertion#50: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt64, Int8, Float64>\", but now it`s \"String\"")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(StandardClassType<UInt64, Int8, Float64>(),
                    [GenericClassWith2TypeParameters<Int8, Int8>(), NonGenericClass()])
            @Expect("assertion#51: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int8, Int8>(), NonGenericClass()])
            @Expect("assertion#52: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int8, Int8>(), NonGenericClass()])
            @Expect("assertion#53: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(StandardClassType<UInt64, Int8, Float64>(),
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#54: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64,
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#55: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello",
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#56: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(StandardClassType<UInt64, Int8, Float64>(),
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), GenericClassWith2TypeParameters<Int8, Int8>(),
                        NonGenericClass(), 114.514000f64])
            @Expect("assertion#57: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64,
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), GenericClassWith2TypeParameters<Int8, Int8>(),
                        NonGenericClass(), 114.514000f64])
            @Expect("assertion#58: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello",
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), GenericClassWith2TypeParameters<Int8, Int8>(),
                        NonGenericClass(), 114.514000f64])
            @Expect("assertion#59: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(StandardClassType<UInt64, Int8, Float64>(),
                    [(), GenericClassWith2TypeParameters<Int8, Int8>(), NonGenericClass()])
            @Expect("assertion#60: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64, [(), GenericClassWith2TypeParameters<Int8, Int8>(), NonGenericClass()])
            @Expect("assertion#61: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello", [(), GenericClassWith2TypeParameters<Int8, Int8>(), NonGenericClass()])
            @Expect("assertion#62: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(StandardClassType<UInt64, Int8, Float64>(),
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), (), NonGenericClass()])
            @Expect("assertion#63: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<UInt64, UInt64>(), (), NonGenericClass()])
            @Expect("assertion#64: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<UInt64, UInt64>(), (), NonGenericClass()])
            @Expect("assertion#65: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(StandardClassType<UInt64, Int8, Float64>(),
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), GenericClassWith2TypeParameters<Int8, Int8>(),
                        ()])
            @Expect("assertion#66: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply(1i64,
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), GenericClassWith2TypeParameters<Int8, Int8>(),
                        ()])
            @Expect("assertion#67: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_3")[0i64]
                .apply("hello",
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), GenericClassWith2TypeParameters<Int8, Int8>(),
                        ()])
            @Expect("assertion#68: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("testcase TestCase_2 ends.")
    }

    @TestCase
    func TestCase_3(): Unit {
        logger.info("testcase TestCase_3 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, UInt64, UInt32>>().getInstanceFunctions("classInstanceMemberFunction_4").size)
        logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int32, UInt64, UInt32>>()
            .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
            .apply(
                StandardClassType<Int32, UInt64, UInt32>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>(),
                    NonGenericStruct()]
            )
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>(),
                        NonGenericStruct()])
            @Expect("assertion#69: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>(),
                        NonGenericStruct()])
            @Expect("assertion#70: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<UInt64, UInt64>(), NonGenericStruct()])
            @Expect("assertion#71: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int32, UInt64, UInt32>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<UInt64, UInt64>(), NonGenericStruct()])
            @Expect("assertion#72: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(
                    "hello",
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt64, UInt64>(), NonGenericStruct()]
                )
            @Expect("assertion#73: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#74: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int32, UInt64, UInt32>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#75: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(
                    1i64,
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>()]
                )
            @Expect("assertion#76: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>(),
                        NonGenericStruct(), 114.514000f64])
            @Expect("assertion#77: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>(),
                        NonGenericStruct(), 114.514000f64])
            @Expect("assertion#78: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(
                    StandardClassType<Int32, UInt64, UInt32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>(),
                        NonGenericStruct(), 114.514000f64]
                )
            @Expect("assertion#79: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(
                    StandardClassType<Int32, UInt64, UInt32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                    [(), GenericStructWith2TypeParameters<UInt64, UInt64>(), NonGenericStruct()]
                )
            @Expect("assertion#80: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                    [(), GenericStructWith2TypeParameters<UInt64, UInt64>(), NonGenericStruct()])
            @Expect("assertion#81: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [(), GenericStructWith2TypeParameters<UInt64, UInt64>(), NonGenericStruct()])
            @Expect("assertion#82: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(
                    StandardClassType<Int32, UInt64, UInt32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Bool>(), (), NonGenericStruct()]
                )
            @Expect("assertion#83: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Bool>(), (), NonGenericStruct()])
            @Expect("assertion#84: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Bool>(), (), NonGenericStruct()])
            @Expect("assertion#85: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(
                    StandardClassType<Int32, UInt64, UInt32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>(), ()]
                )
            @Expect("assertion#86: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>(), ()])
            @Expect("assertion#87: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>(), ()])
            @Expect("assertion#88: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(
                    StandardClassType<Int32, UInt64, UInt32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>(),
                        NonGenericStruct()]
                )
            @Expect("assertion#89: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int32, UInt64, UInt32>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith2TypeParameters<UInt64, UInt64>(), NonGenericStruct()])
            @Expect("assertion#90: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int32, UInt64, UInt32>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#91: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(
                    StandardClassType<Int32, UInt64, UInt32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>(),
                        NonGenericStruct(), 114.514000f64]
                )
            @Expect("assertion#92: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(
                    StandardClassType<Int32, UInt64, UInt32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [(), GenericStructWith2TypeParameters<UInt64, UInt64>(), NonGenericStruct()]
                )
            @Expect("assertion#93: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(
                    StandardClassType<Int32, UInt64, UInt32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), (), NonGenericStruct()]
                )
            @Expect("assertion#94: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(
                    StandardClassType<Int32, UInt64, UInt32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>(), ()]
                )
            @Expect("assertion#95: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int32, UInt64, UInt32>(),
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>(),
                        NonGenericStruct()])
            @Expect("assertion#96: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64,
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>(),
                        NonGenericStruct()])
            @Expect("assertion#97: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello",
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>(),
                        NonGenericStruct()])
            @Expect("assertion#98: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int32, UInt64, UInt32>(),
                    [GenericStructWith2TypeParameters<UInt64, UInt64>(), NonGenericStruct()])
            @Expect("assertion#99: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt64, UInt64>(), NonGenericStruct()])
            @Expect("assertion#100: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt64, UInt64>(), NonGenericStruct()])
            @Expect("assertion#101: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int32, UInt64, UInt32>(),
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#102: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64,
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#103: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello",
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#104: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int32, UInt64, UInt32>(),
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>(),
                        NonGenericStruct(), 114.514000f64])
            @Expect("assertion#105: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64,
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>(),
                        NonGenericStruct(), 114.514000f64])
            @Expect("assertion#106: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello",
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>(),
                        NonGenericStruct(), 114.514000f64])
            @Expect("assertion#107: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int32, UInt64, UInt32>(),
                    [(), GenericStructWith2TypeParameters<UInt64, UInt64>(), NonGenericStruct()])
            @Expect("assertion#108: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64, [(), GenericStructWith2TypeParameters<UInt64, UInt64>(), NonGenericStruct()])
            @Expect("assertion#109: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello", [(), GenericStructWith2TypeParameters<UInt64, UInt64>(), NonGenericStruct()])
            @Expect("assertion#110: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int32, UInt64, UInt32>(),
                    [GenericStructWith1TypeParameters<Bool>(), (), NonGenericStruct()])
            @Expect("assertion#111: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Bool>(), (), NonGenericStruct()])
            @Expect("assertion#112: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Bool>(), (), NonGenericStruct()])
            @Expect("assertion#113: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(StandardClassType<Int32, UInt64, UInt32>(),
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>(), ()])
            @Expect("assertion#114: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply(1i64,
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>(), ()])
            @Expect("assertion#115: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_4")[0i64]
                .apply("hello",
                    [GenericStructWith1TypeParameters<Bool>(), GenericStructWith2TypeParameters<UInt64, UInt64>(), ()])
            @Expect("assertion#116: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("testcase TestCase_3 ends.")
    }

    @TestCase
    func TestCase_4(): Unit {
        logger.info("testcase TestCase_4 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Int32, Int8>>().getInstanceFunctions("classInstanceMemberFunction_5").size)
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt64, Int32, Int8>(), [], [123i64])
            @Expect("assertion#117: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#118: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#119: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt64, Int32, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#120: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#121: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [123i64, 114.514000f64])
            @Expect("assertion#122: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt64, Int32, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#123: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt64, Int32, Int8>(), [], [123i64, 114.514000f64])
            @Expect("assertion#124: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt64, Int32, Int8>(), [], [114.514000f64])
            @Expect("assertion#125: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#126: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [], [123i64])
            @Expect("assertion#127: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#128: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#129: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [], [123i64, 114.514000f64])
            @Expect("assertion#130: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [], [114.514000f64])
            @Expect("assertion#131: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, Int32, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
            .apply(StandardClassType<UInt64, Int32, Int8>(), [123i64])
        logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [123i64])
            @Expect("assertion#132: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt64, Int32, Int8>\", but now it`s \"Int64\"")
        }
        logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [123i64])
            @Expect("assertion#133: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt64, Int32, Int8>\", but now it`s \"String\"")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt64, Int32, Int8>(), [])
            @Expect("assertion#134: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [])
            @Expect("assertion#135: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [])
            @Expect("assertion#136: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt64, Int32, Int8>(), [])
            @Expect("assertion#137: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [])
            @Expect("assertion#138: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [])
            @Expect("assertion#139: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt64, Int32, Int8>(), [123i64, 114.514000f64])
            @Expect("assertion#140: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [123i64, 114.514000f64])
            @Expect("assertion#141: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [123i64, 114.514000f64])
            @Expect("assertion#142: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(StandardClassType<UInt64, Int32, Int8>(), [114.514000f64])
            @Expect("assertion#143: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#144: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_5")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#145: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("testcase TestCase_4 ends.")
    }
}
