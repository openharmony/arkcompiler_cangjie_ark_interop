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
class testGetInstanceFunctions_StandardClassType_2 {
    @TestCase
    func TestCase_5(): Unit {
        logger.info("testcase TestCase_5 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, UInt32, Int32>>().getInstanceFunctions("classInstanceMemberFunction_6").size)
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(StandardClassType<Unit, UInt32, Int32>(), [], [true])
            @Expect("assertion#146: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [true])
            @Expect("assertion#147: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#148: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(StandardClassType<Unit, UInt32, Int32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#149: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#150: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [true, 114.514000f64])
            @Expect("assertion#151: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(StandardClassType<Unit, UInt32, Int32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#152: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(StandardClassType<Unit, UInt32, Int32>(), [], [true, 114.514000f64])
            @Expect("assertion#153: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(StandardClassType<Unit, UInt32, Int32>(), [], [()])
            @Expect("assertion#154: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#155: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply("hello", [], [true])
            @Expect("assertion#156: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#157: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#158: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(1i64, [], [true, 114.514000f64])
            @Expect("assertion#159: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#160: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Unit, UInt32, Int32>>()
            .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
            .apply(StandardClassType<Unit, UInt32, Int32>(), [true])
        logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(1i64, [true])
            @Expect("assertion#161: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Unit, UInt32, Int32>\", but now it`s \"Int64\"")
        }
        logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply("hello", [true])
            @Expect("assertion#162: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Unit, UInt32, Int32>\", but now it`s \"String\"")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(StandardClassType<Unit, UInt32, Int32>(), [])
            @Expect("assertion#163: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(1i64, [])
            @Expect("assertion#164: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply("hello", [])
            @Expect("assertion#165: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(StandardClassType<Unit, UInt32, Int32>(), [])
            @Expect("assertion#166: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(1i64, [])
            @Expect("assertion#167: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply("hello", [])
            @Expect("assertion#168: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(StandardClassType<Unit, UInt32, Int32>(), [true, 114.514000f64])
            @Expect("assertion#169: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(1i64, [true, 114.514000f64])
            @Expect("assertion#170: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply("hello", [true, 114.514000f64])
            @Expect("assertion#171: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(StandardClassType<Unit, UInt32, Int32>(), [()])
            @Expect("assertion#172: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#173: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_6")[0i64]
                .apply("hello", [()])
            @Expect("assertion#174: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("testcase TestCase_5 ends.")
    }

    @TestCase
    func TestCase_6(): Unit {
        logger.info("testcase TestCase_6 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, UInt64, Int64>>().getInstanceFunctions("classInstanceMemberFunction_7").size)
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(StandardClassType<Float32, UInt64, Int64>(), [], [()])
            @Expect("assertion#175: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#176: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#177: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(StandardClassType<Float32, UInt64, Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#178: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#179: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [(), 114.514000f64])
            @Expect("assertion#180: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(StandardClassType<Float32, UInt64, Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#181: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(StandardClassType<Float32, UInt64, Int64>(), [], [(), 114.514000f64])
            @Expect("assertion#182: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(StandardClassType<Float32, UInt64, Int64>(), [], [123i64])
            @Expect("assertion#183: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#184: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#185: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#186: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#187: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(1i64, [], [(), 114.514000f64])
            @Expect("assertion#188: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply("hello", [], [123i64])
            @Expect("assertion#189: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float32, UInt64, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
            .apply(StandardClassType<Float32, UInt64, Int64>(), [()])
        logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#190: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Float32, UInt64, Int64>\", but now it`s \"Int64\"")
        }
        logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply("hello", [()])
            @Expect("assertion#191: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Float32, UInt64, Int64>\", but now it`s \"String\"")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(StandardClassType<Float32, UInt64, Int64>(), [])
            @Expect("assertion#192: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(1i64, [])
            @Expect("assertion#193: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply("hello", [])
            @Expect("assertion#194: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(StandardClassType<Float32, UInt64, Int64>(), [])
            @Expect("assertion#195: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(1i64, [])
            @Expect("assertion#196: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply("hello", [])
            @Expect("assertion#197: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(StandardClassType<Float32, UInt64, Int64>(), [(), 114.514000f64])
            @Expect("assertion#198: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(1i64, [(), 114.514000f64])
            @Expect("assertion#199: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply("hello", [(), 114.514000f64])
            @Expect("assertion#200: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(StandardClassType<Float32, UInt64, Int64>(), [123i64])
            @Expect("assertion#201: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply(1i64, [123i64])
            @Expect("assertion#202: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_7")[0i64]
                .apply("hello", [123i64])
            @Expect("assertion#203: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("testcase TestCase_6 ends.")
    }

    @TestCase
    func TestCase_7(): Unit {
        logger.info("testcase TestCase_7 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, UInt32, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_8").size)
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(StandardClassType<UInt64, UInt32, UInt64>(), [], [123u64])
            @Expect("assertion#204: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [123u64])
            @Expect("assertion#205: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#206: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(StandardClassType<UInt64, UInt32, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#207: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#208: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [123u64, 114.514000f64])
            @Expect("assertion#209: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(StandardClassType<UInt64, UInt32, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#210: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(StandardClassType<UInt64, UInt32, UInt64>(), [], [123u64, 114.514000f64])
            @Expect("assertion#211: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(StandardClassType<UInt64, UInt32, UInt64>(), [], [114.514000f64])
            @Expect("assertion#212: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#213: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply("hello", [], [123u64])
            @Expect("assertion#214: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#215: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#216: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(1i64, [], [123u64, 114.514000f64])
            @Expect("assertion#217: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply("hello", [], [114.514000f64])
            @Expect("assertion#218: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, UInt32, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
            .apply(StandardClassType<UInt64, UInt32, UInt64>(), [123u64])
        logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(1i64, [123u64])
            @Expect("assertion#219: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt64, UInt32, UInt64>\", but now it`s \"Int64\"")
        }
        logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply("hello", [123u64])
            @Expect("assertion#220: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt64, UInt32, UInt64>\", but now it`s \"String\"")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(StandardClassType<UInt64, UInt32, UInt64>(), [])
            @Expect("assertion#221: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(1i64, [])
            @Expect("assertion#222: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply("hello", [])
            @Expect("assertion#223: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(StandardClassType<UInt64, UInt32, UInt64>(), [])
            @Expect("assertion#224: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(1i64, [])
            @Expect("assertion#225: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply("hello", [])
            @Expect("assertion#226: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(StandardClassType<UInt64, UInt32, UInt64>(), [123u64, 114.514000f64])
            @Expect("assertion#227: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(1i64, [123u64, 114.514000f64])
            @Expect("assertion#228: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply("hello", [123u64, 114.514000f64])
            @Expect("assertion#229: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(StandardClassType<UInt64, UInt32, UInt64>(), [114.514000f64])
            @Expect("assertion#230: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#231: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_8")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#232: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("testcase TestCase_7 ends.")
    }

    @TestCase
    func TestCase_8(): Unit {
        logger.info("testcase TestCase_8 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, UInt64, Bool>>().getInstanceFunctions("classInstanceMemberFunction_9").size)
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply(StandardClassType<Float32, UInt64, Bool>(), [], [123u64])
            @Expect("assertion#233: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [123u64])
            @Expect("assertion#234: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#235: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply(StandardClassType<Float32, UInt64, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#236: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#237: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [123u64, 114.514000f64])
            @Expect("assertion#238: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply(StandardClassType<Float32, UInt64, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#239: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply(StandardClassType<Float32, UInt64, Bool>(), [], [123u64, 114.514000f64])
            @Expect("assertion#240: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply(StandardClassType<Float32, UInt64, Bool>(), [], [114.514000f64])
            @Expect("assertion#241: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#242: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply("hello", [], [123u64])
            @Expect("assertion#243: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#244: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#245: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply(1i64, [], [123u64, 114.514000f64])
            @Expect("assertion#246: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply("hello", [], [114.514000f64])
            @Expect("assertion#247: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float32, UInt64, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
            .apply(StandardClassType<Float32, UInt64, Bool>(), [123u64])
        logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply(1i64, [123u64])
            @Expect("assertion#248: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Float32, UInt64, Bool>\", but now it`s \"Int64\"")
        }
        logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply("hello", [123u64])
            @Expect("assertion#249: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Float32, UInt64, Bool>\", but now it`s \"String\"")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply(StandardClassType<Float32, UInt64, Bool>(), [])
            @Expect("assertion#250: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply(1i64, [])
            @Expect("assertion#251: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply("hello", [])
            @Expect("assertion#252: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply(StandardClassType<Float32, UInt64, Bool>(), [])
            @Expect("assertion#253: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply(1i64, [])
            @Expect("assertion#254: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply("hello", [])
            @Expect("assertion#255: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply(StandardClassType<Float32, UInt64, Bool>(), [123u64, 114.514000f64])
            @Expect("assertion#256: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply(1i64, [123u64, 114.514000f64])
            @Expect("assertion#257: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply("hello", [123u64, 114.514000f64])
            @Expect("assertion#258: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply(StandardClassType<Float32, UInt64, Bool>(), [114.514000f64])
            @Expect("assertion#259: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#260: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_9")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#261: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("testcase TestCase_8 ends.")
    }

    @TestCase
    func TestCase_9(): Unit {
        logger.info("testcase TestCase_9 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, Int8, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_10").size)
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(StandardClassType<Int64, Int8, UInt8>(), [], [1u8])
            @Expect("assertion#262: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [1u8])
            @Expect("assertion#263: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#264: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(StandardClassType<Int64, Int8, UInt8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#265: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#266: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [1u8, 114.514000f64])
            @Expect("assertion#267: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(StandardClassType<Int64, Int8, UInt8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#268: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(StandardClassType<Int64, Int8, UInt8>(), [], [1u8, 114.514000f64])
            @Expect("assertion#269: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(StandardClassType<Int64, Int8, UInt8>(), [], [114.514000f64])
            @Expect("assertion#270: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#271: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply("hello", [], [1u8])
            @Expect("assertion#272: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#273: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#274: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(1i64, [], [1u8, 114.514000f64])
            @Expect("assertion#275: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply("hello", [], [114.514000f64])
            @Expect("assertion#276: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int64, Int8, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
            .apply(StandardClassType<Int64, Int8, UInt8>(), [1u8])
        logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(1i64, [1u8])
            @Expect("assertion#277: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int64, Int8, UInt8>\", but now it`s \"Int64\"")
        }
        logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply("hello", [1u8])
            @Expect("assertion#278: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int64, Int8, UInt8>\", but now it`s \"String\"")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(StandardClassType<Int64, Int8, UInt8>(), [])
            @Expect("assertion#279: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(1i64, [])
            @Expect("assertion#280: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply("hello", [])
            @Expect("assertion#281: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(StandardClassType<Int64, Int8, UInt8>(), [])
            @Expect("assertion#282: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(1i64, [])
            @Expect("assertion#283: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply("hello", [])
            @Expect("assertion#284: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(StandardClassType<Int64, Int8, UInt8>(), [1u8, 114.514000f64])
            @Expect("assertion#285: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(1i64, [1u8, 114.514000f64])
            @Expect("assertion#286: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply("hello", [1u8, 114.514000f64])
            @Expect("assertion#287: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(StandardClassType<Int64, Int8, UInt8>(), [114.514000f64])
            @Expect("assertion#288: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#289: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_10")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#290: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("testcase TestCase_9 ends.")
    }
}
