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
class testGetStaticFunctions_StandardClassType_1 {
    @TestCase
    func TestCase_218(): Unit {
        logger.info("testcase TestCase_218 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, Bool, Float64>>().getStaticFunctions("classStaticMemberFunction_1").size)
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_1")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Bool, Float64>>(), [], [])
            @Expect("assertion#6954: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_1")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#6955: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_1")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [114.514000f64])
            @Expect("assertion#6956: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_1")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Bool, Float64>>(), [TypeInfo.of<Float32>()], [114.514000f64]
                )
            @Expect("assertion#6957: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int16, Bool, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_1")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int16, Bool, Float64>>(), [])
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_1")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#6958: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Bool, Float64> got.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_1")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Bool, Float64>>(), [114.514000f64])
            @Expect("assertion#6959: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_1")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#6960: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Bool, Float64> got.")
        }
        logger.info("testcase TestCase_218 ends.")
    }

    @TestCase
    func TestCase_219(): Unit {
        logger.info("testcase TestCase_219 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, Int8, Int8>>().getStaticFunctions("classStaticMemberFunction_2").size)
        logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt8, Int8, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_2")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt8, Int8, Int8>>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()], [])
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#6961: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int8, Int8> got.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()],
                    [114.514000f64])
            @Expect("assertion#6962: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int8, Int8> got.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int8, Int8>>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()],
                    [114.514000f64])
            @Expect("assertion#6963: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int8, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6964: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int8, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6965: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [114.514000f64])
            @Expect("assertion#6966: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int8, Int8> got.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(
                    TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [114.514000f64]
                )
            @Expect("assertion#6967: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int8, Int8> got.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int8, Int8>>(), [])
            @Expect("assertion#6968: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#6969: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int8, Int8>>(), [114.514000f64])
            @Expect("assertion#6970: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#6971: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("testcase TestCase_219 ends.")
    }

    @TestCase
    func TestCase_220(): Unit {
        logger.info("testcase TestCase_220 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, UInt64, UInt16>>().getStaticFunctions("classStaticMemberFunction_3").size)
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt64, UInt16>>(), [],
                    [GenericStructWith1TypeParameters<UInt16>(), NonGenericClass(), NonGenericStruct()])
            @Expect("assertion#6972: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<UInt16>(), NonGenericClass(), NonGenericStruct()])
            @Expect("assertion#6973: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [NonGenericClass(), NonGenericStruct()])
            @Expect("assertion#6974: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt64, UInt16>>(), [TypeInfo.of<Float32>()],
                    [NonGenericClass(), NonGenericStruct()])
            @Expect("assertion#6975: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt64, UInt16>>(), [],
                    [GenericStructWith1TypeParameters<UInt16>(), NonGenericClass()])
            @Expect("assertion#6976: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<UInt16>(), NonGenericClass()])
            @Expect("assertion#6977: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt64, UInt16>>(), [],
                    [GenericStructWith1TypeParameters<UInt16>(), NonGenericClass(), NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6978: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<UInt16>(), NonGenericClass(), NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6979: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt64, UInt16>>(), [],
                    [(), NonGenericClass(), NonGenericStruct()])
            @Expect("assertion#6980: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [(), NonGenericClass(), NonGenericStruct()])
            @Expect("assertion#6981: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt64, UInt16>>(), [],
                    [GenericStructWith1TypeParameters<UInt16>(), (), NonGenericStruct()])
            @Expect("assertion#6982: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<UInt16>(), (), NonGenericStruct()])
            @Expect("assertion#6983: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt64, UInt16>>(), [],
                    [GenericStructWith1TypeParameters<UInt16>(), NonGenericClass(), ()])
            @Expect("assertion#6984: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<UInt16>(), NonGenericClass(), ()])
            @Expect("assertion#6985: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt8, UInt64, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_3")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt8, UInt64, UInt16>>(),
                [GenericStructWith1TypeParameters<UInt16>(), NonGenericClass(), NonGenericStruct()])
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [GenericStructWith1TypeParameters<UInt16>(), NonGenericClass(), NonGenericStruct()])
            @Expect("assertion#6986: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt64, UInt16> got.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt64, UInt16>>(), [NonGenericClass(), NonGenericStruct()])
            @Expect("assertion#6987: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), NonGenericStruct()])
            @Expect("assertion#6988: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt64, UInt16> got.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt64, UInt16>>(),
                    [GenericStructWith1TypeParameters<UInt16>(), NonGenericClass()])
            @Expect("assertion#6989: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt16>(), NonGenericClass()])
            @Expect("assertion#6990: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt64, UInt16> got.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt64, UInt16>>(),
                    [GenericStructWith1TypeParameters<UInt16>(), NonGenericClass(), NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6991: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [GenericStructWith1TypeParameters<UInt16>(), NonGenericClass(), NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6992: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt64, UInt16> got.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt64, UInt16>>(),
                    [(), NonGenericClass(), NonGenericStruct()])
            @Expect("assertion#6993: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(), [(), NonGenericClass(), NonGenericStruct()])
            @Expect("assertion#6994: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt64, UInt16> got.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt64, UInt16>>(),
                    [GenericStructWith1TypeParameters<UInt16>(), (), NonGenericStruct()])
            @Expect("assertion#6995: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt16>(), (), NonGenericStruct()])
            @Expect("assertion#6996: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt64, UInt16> got.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt64, UInt16>>(),
                    [GenericStructWith1TypeParameters<UInt16>(), NonGenericClass(), ()])
            @Expect("assertion#6997: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt16>(), NonGenericClass(), ()])
            @Expect("assertion#6998: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt64, UInt16> got.")
        }
        logger.info("testcase TestCase_220 ends.")
    }

    @TestCase
    func TestCase_221(): Unit {
        logger.info("testcase TestCase_221 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>().getStaticFunctions("classStaticMemberFunction_4").size)
        logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt8, UInt32, UInt8>>()
            .getStaticFunctions("classStaticMemberFunction_4")[0i64]
            .apply(
                TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float32>()],
                [1u8, NonGenericStruct(), NonGenericStruct()]
            )
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Float32>()],
                    [1u8, NonGenericStruct(), NonGenericStruct()])
            @Expect("assertion#6999: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt32, UInt8> got.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float32>()],
                    [NonGenericStruct(), NonGenericStruct()])
            @Expect("assertion#7000: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt32, UInt8> got.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float32>()], [NonGenericStruct(), NonGenericStruct()])
            @Expect("assertion#7001: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [1u8, NonGenericStruct()])
            @Expect("assertion#7002: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(
                    TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [1u8, NonGenericStruct()]
                )
            @Expect("assertion#7003: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt32, UInt8> got.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()],
                    [1u8, NonGenericStruct(), NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7004: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt32, UInt8> got.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [1u8, NonGenericStruct(), NonGenericStruct(), 114.514000f64]
                )
            @Expect("assertion#7005: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float32>()],
                    [114.514000f64, NonGenericStruct(), NonGenericStruct()]
                )
            @Expect("assertion#7006: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Float32>()],
                    [114.514000f64, NonGenericStruct(), NonGenericStruct()])
            @Expect("assertion#7007: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt32, UInt8> got.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float32>()],
                    [1u8, (), NonGenericStruct()]
                )
            @Expect("assertion#7008: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Float32>()],
                    [1u8, (), NonGenericStruct()])
            @Expect("assertion#7009: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt32, UInt8> got.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float32>()],
                    [1u8, NonGenericStruct(), ()]
                )
            @Expect("assertion#7010: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Float32>()],
                    [1u8, NonGenericStruct(), ()])
            @Expect("assertion#7011: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt32, UInt8> got.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [1u8, NonGenericStruct(), NonGenericStruct()])
            @Expect("assertion#7012: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [1u8, NonGenericStruct(), NonGenericStruct()]
                )
            @Expect("assertion#7013: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [NonGenericStruct(), NonGenericStruct()])
            @Expect("assertion#7014: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), NonGenericStruct()]
                )
            @Expect("assertion#7015: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float32>()], [1u8, NonGenericStruct()])
            @Expect("assertion#7016: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float32>()], [1u8, NonGenericStruct()])
            @Expect("assertion#7017: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float32>()],
                    [1u8, NonGenericStruct(), NonGenericStruct(), 114.514000f64]
                )
            @Expect("assertion#7018: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float32>()],
                    [1u8, NonGenericStruct(), NonGenericStruct(), 114.514000f64]
                )
            @Expect("assertion#7019: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()],
                    [114.514000f64, NonGenericStruct(), NonGenericStruct()]
                )
            @Expect("assertion#7020: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [114.514000f64, NonGenericStruct(), NonGenericStruct()]
                )
            @Expect("assertion#7021: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [1u8, (), NonGenericStruct()])
            @Expect("assertion#7022: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [1u8, (), NonGenericStruct()]
                )
            @Expect("assertion#7023: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [1u8, NonGenericStruct(), ()])
            @Expect("assertion#7024: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(
                    TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [1u8, NonGenericStruct(), ()]
                )
            @Expect("assertion#7025: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(),
                    [1u8, NonGenericStruct(), NonGenericStruct()])
            @Expect("assertion#7026: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [1u8, NonGenericStruct(), NonGenericStruct()])
            @Expect("assertion#7027: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(), [NonGenericStruct(), NonGenericStruct()])
            @Expect("assertion#7028: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), NonGenericStruct()])
            @Expect("assertion#7029: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(), [1u8, NonGenericStruct()])
            @Expect("assertion#7030: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [1u8, NonGenericStruct()])
            @Expect("assertion#7031: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(),
                    [1u8, NonGenericStruct(), NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7032: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [1u8, NonGenericStruct(), NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7033: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(),
                    [114.514000f64, NonGenericStruct(), NonGenericStruct()])
            @Expect("assertion#7034: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64, NonGenericStruct(), NonGenericStruct()])
            @Expect("assertion#7035: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(), [1u8, (), NonGenericStruct()])
            @Expect("assertion#7036: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [1u8, (), NonGenericStruct()])
            @Expect("assertion#7037: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, UInt8>>(), [1u8, NonGenericStruct(), ()])
            @Expect("assertion#7038: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [1u8, NonGenericStruct(), ()])
            @Expect("assertion#7039: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        logger.info("testcase TestCase_221 ends.")
    }

    @TestCase
    func TestCase_222(): Unit {
        logger.info("testcase TestCase_222 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Bool, Int64, UInt16>>().getStaticFunctions("classStaticMemberFunction_5").size)
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int64, UInt16>>(), [], [123i64])
            @Expect("assertion#7040: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#7041: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7042: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int64, UInt16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7043: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int64, UInt16>>(), [], [])
            @Expect("assertion#7044: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7045: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int64, UInt16>>(), [], [123i64, 114.514000f64])
            @Expect("assertion#7046: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [123i64, 114.514000f64])
            @Expect("assertion#7047: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int64, UInt16>>(), [], [114.514000f64])
            @Expect("assertion#7048: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#7049: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Bool, Int64, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_5")[0i64]
            .apply(TypeInfo.of<StandardClassType<Bool, Int64, UInt16>>(), [123i64])
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64])
            @Expect("assertion#7050: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Int64, UInt16> got.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int64, UInt16>>(), [])
            @Expect("assertion#7051: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7052: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Int64, UInt16> got.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int64, UInt16>>(), [])
            @Expect("assertion#7053: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7054: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Int64, UInt16> got.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int64, UInt16>>(), [123i64, 114.514000f64])
            @Expect("assertion#7055: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64, 114.514000f64])
            @Expect("assertion#7056: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Int64, UInt16> got.")
        }
        logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int64, UInt16>>(), [114.514000f64])
            @Expect("assertion#7057: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#7058: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Int64, UInt16> got.")
        }
        logger.info("testcase TestCase_222 ends.")
    }
}
