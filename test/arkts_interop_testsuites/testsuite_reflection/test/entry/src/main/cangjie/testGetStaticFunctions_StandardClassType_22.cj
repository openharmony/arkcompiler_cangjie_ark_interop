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
class testGetStaticFunctions_StandardClassType_22 {
    @TestCase
    func TestCase_323(): Unit {
        logger.info("testcase TestCase_323 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, Int16, UInt32>>().getStaticFunctions("classStaticMemberFunction_106").size)
        logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt8, Int16, UInt32>>()
            .getStaticFunctions("classStaticMemberFunction_106")[0i64]
            .apply(
                TypeInfo.of<StandardClassType<UInt8, Int16, UInt32>>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()],
                [GenericStructWith2TypeParameters<UInt32, UInt32>()]
            )
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#9549: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int16, UInt32> got.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#9550: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int16, UInt32> got.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int16, UInt32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#9551: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int16, UInt32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9552: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9553: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int16, UInt32> got.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#9554: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int16, UInt32> got.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<UInt8, Int16, UInt32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64]
                )
            @Expect("assertion#9555: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int16, UInt32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#9556: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#9557: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int16, UInt32> got.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int16, UInt32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#9558: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<UInt8, Int16, UInt32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>()]
                )
            @Expect("assertion#9559: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int16, UInt32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9560: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int16, UInt32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9561: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int16, UInt32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#9562: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int16, UInt32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#9563: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<UInt8, Int16, UInt32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64]
                )
            @Expect("assertion#9564: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<UInt8, Int16, UInt32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64]
                )
            @Expect("assertion#9565: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int16, UInt32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#9566: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int16, UInt32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9567: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int16, UInt32>>(),
                    [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#9568: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#9569: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int16, UInt32>>(), [])
            @Expect("assertion#9570: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9571: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int16, UInt32>>(), [])
            @Expect("assertion#9572: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9573: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int16, UInt32>>(),
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#9574: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#9575: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int16, UInt32>>(), [()])
            @Expect("assertion#9576: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_106")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9577: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("testcase TestCase_323 ends.")
    }

    @TestCase
    func TestCase_324(): Unit {
        logger.info("testcase TestCase_324 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, Int32, Int8>>().getStaticFunctions("classStaticMemberFunction_107").size)
        logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int16, Int32, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_107")[0i64]
            .apply(
                TypeInfo.of<StandardClassType<Int16, Int32, Int8>>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                [GenericStructWith2TypeParameters<UInt16, UInt16>()]
            )
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#9578: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int32, Int8> got.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#9579: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int32, Int8> got.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int32, Int8>>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#9580: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int32, Int8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#9581: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9582: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int32, Int8> got.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#9583: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int32, Int8> got.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<Int16, Int32, Int8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64]
                )
            @Expect("assertion#9584: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int32, Int8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#9585: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#9586: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int32, Int8> got.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int32, Int8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#9587: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<Int16, Int32, Int8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>()]
                )
            @Expect("assertion#9588: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int32, Int8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#9589: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int32, Int8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9590: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int32, Int8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#9591: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int32, Int8>>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#9592: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<Int16, Int32, Int8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64]
                )
            @Expect("assertion#9593: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int32, Int8>>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#9594: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int32, Int8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#9595: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int32, Int8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9596: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int32, Int8>>(),
                    [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#9597: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#9598: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int32, Int8>>(), [])
            @Expect("assertion#9599: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9600: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int32, Int8>>(), [])
            @Expect("assertion#9601: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9602: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int32, Int8>>(),
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#9603: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#9604: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int32, Int8>>(), [()])
            @Expect("assertion#9605: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_107")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9606: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("testcase TestCase_324 ends.")
    }

    @TestCase
    func TestCase_325(): Unit {
        logger.info("testcase TestCase_325 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>().getStaticFunctions("classStaticMemberFunction_108").size)
        logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int64, Float64, UInt64>>()
            .getStaticFunctions("classStaticMemberFunction_108")[0i64]
            .apply(
                TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()],
                [GenericStructWith2TypeParameters<Int32, Int32>()]
            )
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#9607: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Float64, UInt64> got.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#9608: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Float64, UInt64> got.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#9609: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#9610: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9611: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Float64, UInt64> got.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#9612: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Float64, UInt64> got.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64]
                )
            @Expect("assertion#9613: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#9614: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#9615: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Float64, UInt64> got.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#9616: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>()]
                )
            @Expect("assertion#9617: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#9618: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9619: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#9620: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#9621: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64]
                )
            @Expect("assertion#9622: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64]
                )
            @Expect("assertion#9623: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#9624: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9625: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#9626: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#9627: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(), [])
            @Expect("assertion#9628: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9629: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(), [])
            @Expect("assertion#9630: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9631: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#9632: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#9633: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(), [()])
            @Expect("assertion#9634: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9635: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("testcase TestCase_325 ends.")
    }

    @TestCase
    func TestCase_326(): Unit {
        logger.info("testcase TestCase_326 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>().getStaticFunctions("classStaticMemberFunction_109").size)
        logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, UInt8, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_109")[0i64]
            .apply(
                TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>()],
                [GenericStructWith2TypeParameters<Int32, Int32>()]
            )
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#9636: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, UInt8, Int64> got.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#9637: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, UInt8, Int64> got.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#9638: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9639: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9640: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, UInt8, Int64> got.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#9641: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, UInt8, Int64> got.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64]
                )
            @Expect("assertion#9642: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#9643: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#9644: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, UInt8, Int64> got.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#9645: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>()]
                )
            @Expect("assertion#9646: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9647: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9648: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#9649: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#9650: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64]
                )
            @Expect("assertion#9651: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64]
                )
            @Expect("assertion#9652: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9653: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9654: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(),
                    [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#9655: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#9656: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(), [])
            @Expect("assertion#9657: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9658: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(), [])
            @Expect("assertion#9659: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9660: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(),
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#9661: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#9662: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(), [()])
            @Expect("assertion#9663: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9664: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("testcase TestCase_326 ends.")
    }
}
