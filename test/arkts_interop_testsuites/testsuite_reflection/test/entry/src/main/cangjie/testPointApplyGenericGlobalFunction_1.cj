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
class testPointApplyGenericGlobalFunction_1 {
    @TestCase
    func TestCase_436(): Unit {
        logger.info("testcase TestCase_436 begins.")
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_1")[0i64].apply([], [])
            @Expect("assertion#12376: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_1")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12377: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_1")[0i64].apply([], [114.514000f64])
            @Expect("assertion#12378: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_1")[0i64].apply([TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#12379: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("testcase TestCase_436 ends.")
    }

    @TestCase
    func TestCase_437(): Unit {
        logger.info("testcase TestCase_437 begins.")
        logger.info("成功调用")
        moduleInfo.getFunctions("globalFunction_2")[0i64].apply([TypeInfo.of<Float32>()], [])
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_2")[0i64].apply([], [])
            @Expect("assertion#12380: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_2")[0i64].apply([], [])
            @Expect("assertion#12381: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_2")[0i64].apply([TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], []
            )
            @Expect("assertion#12382: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_2")[0i64].apply([TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#12383: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_2")[0i64].apply([], [114.514000f64])
            @Expect("assertion#12384: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_2")[0i64].apply([], [114.514000f64])
            @Expect("assertion#12385: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_2")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [114.514000f64])
            @Expect("assertion#12386: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("testcase TestCase_437 ends.")
    }

    @TestCase
    func TestCase_438(): Unit {
        logger.info("testcase TestCase_438 begins.")
        logger.info("成功调用")
        moduleInfo
            .getFunctions("globalFunction_3")[0i64]
            .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_3")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#12387: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_3")[0i64].apply([TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#12388: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_3")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12389: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_3")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [114.514000f64])
            @Expect("assertion#12390: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_3")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [114.514000f64])
            @Expect("assertion#12391: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_3")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [114.514000f64])
            @Expect("assertion#12392: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_3")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#12393: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("testcase TestCase_438 ends.")
    }

    @TestCase
    func TestCase_439(): Unit {
        logger.info("testcase TestCase_439 begins.")
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_4")[0i64].apply([], [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#12394: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo
                .getFunctions("globalFunction_4")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#12395: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_4")[0i64].apply([], [])
            @Expect("assertion#12396: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_4")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12397: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_4")[0i64].apply([], [])
            @Expect("assertion#12398: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_4")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12399: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo
                .getFunctions("globalFunction_4")[0i64]
                .apply([], [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#12400: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo
                .getFunctions("globalFunction_4")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#12401: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_4")[0i64].apply([], [()])
            @Expect("assertion#12402: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_4")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#12403: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("testcase TestCase_439 ends.")
    }

    @TestCase
    func TestCase_440(): Unit {
        logger.info("testcase TestCase_440 begins.")
        logger.info("成功调用")
        moduleInfo
            .getFunctions("globalFunction_5")[0i64]
            .apply([TypeInfo.of<Float64>()], [GenericStructWith1TypeParameters<UInt8>()])
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_5")[0i64].apply([], [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#12404: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_5")[0i64].apply([], [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#12405: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_5")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#12406: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_5")[0i64].apply([TypeInfo.of<Float64>()], [])
            @Expect("assertion#12407: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_5")[0i64].apply([], [])
            @Expect("assertion#12408: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_5")[0i64].apply([], [])
            @Expect("assertion#12409: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_5")[0i64].apply([TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], []
            )
            @Expect("assertion#12410: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_5")[0i64].apply([TypeInfo.of<Float64>()], [])
            @Expect("assertion#12411: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_5")[0i64].apply([], [])
            @Expect("assertion#12412: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_5")[0i64].apply([], [])
            @Expect("assertion#12413: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_5")[0i64].apply([TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], []
            )
            @Expect("assertion#12414: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("实参个数与形参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_5")[0i64]
                .apply([TypeInfo.of<Float64>()], [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#12415: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_5")[0i64]
                .apply([], [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#12416: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_5")[0i64]
                .apply([], [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#12417: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_5")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#12418: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型检查失败")
        try {
            moduleInfo.getFunctions("globalFunction_5")[0i64].apply([TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12419: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_5")[0i64].apply([], [()])
            @Expect("assertion#12420: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo.getFunctions("globalFunction_5")[0i64].apply([], [()])
            @Expect("assertion#12421: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("类型形参个数与类型实参个数不等")
        try {
            moduleInfo
                .getFunctions("globalFunction_5")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12422: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        logger.info("testcase TestCase_440 ends.")
    }
}
