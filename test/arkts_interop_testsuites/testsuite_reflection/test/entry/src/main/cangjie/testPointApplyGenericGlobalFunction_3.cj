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
class testPointApplyGenericGlobalFunction_3 {
    @TestCase
    func TestCase_446(): Unit {
        logger.info("testcase TestCase_446 begins.")
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_11")[0i64].apply([], [true])
            @Expect("assertion#12520: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_11")[0i64].apply([TypeInfo.of<Float32>()], [true])
            @Expect("assertion#12521: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_11")[0i64].apply([], [])
            @Expect("assertion#12522: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_11")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12523: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_11")[0i64].apply([], [])
            @Expect("assertion#12524: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_11")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12525: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_11")[0i64].apply([], [true, 114.514000f64])
            @Expect("assertion#12526: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_11")[0i64].apply([TypeInfo.of<Float32>()], [true, 114.514000f64])
            @Expect("assertion#12527: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_11")[0i64].apply([], [()])
            @Expect("assertion#12528: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_11")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#12529: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("testcase TestCase_446 ends.")
    }

    @TestCase
    func TestCase_447(): Unit {
        logger.info("testcase TestCase_447 begins.")
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_12")[0i64].apply([], [1i8])
            @Expect("assertion#12530: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_12")[0i64].apply([TypeInfo.of<Float32>()], [1i8])
            @Expect("assertion#12531: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_12")[0i64].apply([], [])
            @Expect("assertion#12532: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_12")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12533: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_12")[0i64].apply([], [])
            @Expect("assertion#12534: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_12")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12535: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_12")[0i64].apply([], [1i8, 114.514000f64])
            @Expect("assertion#12536: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_12")[0i64].apply([TypeInfo.of<Float32>()], [1i8, 114.514000f64])
            @Expect("assertion#12537: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_12")[0i64].apply([], [114.514000f64])
            @Expect("assertion#12538: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_12")[0i64].apply([TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#12539: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("testcase TestCase_447 ends.")
    }

    @TestCase
    func TestCase_448(): Unit {
        logger.info("testcase TestCase_448 begins.")
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_13")[0i64].apply([], [1i16])
            @Expect("assertion#12540: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_13")[0i64].apply([TypeInfo.of<Float32>()], [1i16])
            @Expect("assertion#12541: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_13")[0i64].apply([], [])
            @Expect("assertion#12542: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_13")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12543: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_13")[0i64].apply([], [])
            @Expect("assertion#12544: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_13")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12545: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_13")[0i64].apply([], [1i16, 114.514000f64])
            @Expect("assertion#12546: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_13")[0i64].apply([TypeInfo.of<Float32>()], [1i16, 114.514000f64])
            @Expect("assertion#12547: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_13")[0i64].apply([], [114.514000f64])
            @Expect("assertion#12548: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_13")[0i64].apply([TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#12549: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("testcase TestCase_448 ends.")
    }

    @TestCase
    func TestCase_449(): Unit {
        logger.info("testcase TestCase_449 begins.")
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_14")[0i64].apply([], [1i32])
            @Expect("assertion#12550: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_14")[0i64].apply([TypeInfo.of<Float32>()], [1i32])
            @Expect("assertion#12551: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_14")[0i64].apply([], [])
            @Expect("assertion#12552: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_14")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12553: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_14")[0i64].apply([], [])
            @Expect("assertion#12554: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_14")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12555: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_14")[0i64].apply([], [1i32, 114.514000f64])
            @Expect("assertion#12556: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_14")[0i64].apply([TypeInfo.of<Float32>()], [1i32, 114.514000f64])
            @Expect("assertion#12557: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_14")[0i64].apply([], [114.514000f64])
            @Expect("assertion#12558: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_14")[0i64].apply([TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#12559: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("testcase TestCase_449 ends.")
    }

    @TestCase
    func TestCase_450(): Unit {
        logger.info("testcase TestCase_450 begins.")
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_15")[0i64].apply([], [123i64])
            @Expect("assertion#12560: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_15")[0i64].apply([TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#12561: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_15")[0i64].apply([], [])
            @Expect("assertion#12562: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_15")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12563: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_15")[0i64].apply([], [])
            @Expect("assertion#12564: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_15")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12565: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_15")[0i64].apply([], [123i64, 114.514000f64])
            @Expect("assertion#12566: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_15")[0i64].apply([TypeInfo.of<Float32>()], [123i64, 114.514000f64])
            @Expect("assertion#12567: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_15")[0i64].apply([], [114.514000f64])
            @Expect("assertion#12568: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_15")[0i64].apply([TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#12569: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("testcase TestCase_450 ends.")
    }
}
