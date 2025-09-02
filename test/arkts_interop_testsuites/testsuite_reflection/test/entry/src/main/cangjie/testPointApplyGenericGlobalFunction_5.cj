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
class testPointApplyGenericGlobalFunction_5 {
    @TestCase
    func TestCase_456(): Unit {
        logger.info("testcase TestCase_456 begins.")
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_21")[0i64].apply([], [114.514000f64])
            @Expect("assertion#12620: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_21")[0i64].apply([TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#12621: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_21")[0i64].apply([], [])
            @Expect("assertion#12622: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_21")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12623: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_21")[0i64].apply([], [])
            @Expect("assertion#12624: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_21")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12625: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_21")[0i64].apply([], [114.514000f64, 114.514000f64])
            @Expect("assertion#12626: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo
                .getFunctions("globalFunction_21")[0i64]
                .apply([TypeInfo.of<Float32>()], [114.514000f64, 114.514000f64])
            @Expect("assertion#12627: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_21")[0i64].apply([], [()])
            @Expect("assertion#12628: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_21")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#12629: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("testcase TestCase_456 ends.")
    }

    @TestCase
    func TestCase_457(): Unit {
        logger.info("testcase TestCase_457 begins.")
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_22")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#12630: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_22")[0i64].apply([TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#12631: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_22")[0i64].apply([], [])
            @Expect("assertion#12632: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_22")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12633: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_22")[0i64].apply([], [])
            @Expect("assertion#12634: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_22")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12635: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_22")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#12636: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo
                .getFunctions("globalFunction_22")[0i64]
                .apply([TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#12637: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_22")[0i64].apply([], [()])
            @Expect("assertion#12638: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_22")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#12639: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("testcase TestCase_457 ends.")
    }

    @TestCase
    func TestCase_458(): Unit {
        logger.info("testcase TestCase_458 begins.")
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_23")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#12640: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_23")[0i64].apply([TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#12641: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_23")[0i64].apply([], [])
            @Expect("assertion#12642: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_23")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12643: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_23")[0i64].apply([], [])
            @Expect("assertion#12644: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_23")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12645: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_23")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#12646: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo
                .getFunctions("globalFunction_23")[0i64]
                .apply([TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#12647: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_23")[0i64].apply([], [()])
            @Expect("assertion#12648: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_23")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#12649: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("testcase TestCase_458 ends.")
    }

    @TestCase
    func TestCase_459(): Unit {
        logger.info("testcase TestCase_459 begins.")
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_24")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#12650: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_24")[0i64].apply([TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#12651: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_24")[0i64].apply([], [])
            @Expect("assertion#12652: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_24")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12653: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_24")[0i64].apply([], [])
            @Expect("assertion#12654: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_24")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12655: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_24")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#12656: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo
                .getFunctions("globalFunction_24")[0i64]
                .apply([TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#12657: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_24")[0i64].apply([], [()])
            @Expect("assertion#12658: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_24")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#12659: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("testcase TestCase_459 ends.")
    }

    @TestCase
    func TestCase_460(): Unit {
        logger.info("testcase TestCase_460 begins.")
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_25")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#12660: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_25")[0i64].apply([TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#12661: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_25")[0i64].apply([], [])
            @Expect("assertion#12662: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_25")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12663: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_25")[0i64].apply([], [])
            @Expect("assertion#12664: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_25")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12665: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_25")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#12666: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo
                .getFunctions("globalFunction_25")[0i64]
                .apply([TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#12667: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_25")[0i64].apply([], [()])
            @Expect("assertion#12668: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("非泛型函数指定了类型实参列表")
        try {
            moduleInfo.getFunctions("globalFunction_25")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#12669: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        logger.info("testcase TestCase_460 ends.")
    }
}
