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

import ohos.ark_interop.*
import std.unittest.testmacro.*
import std.unittest.common.*
import std.unittest.*

func testExceptionThrow<T>(callback: () -> Unit): Unit where T <: JSInteropException {
    let isExpThrow = try {
        callback()
        false
    } catch (exp: T) {
        exp.toString()
        true
    } catch (exp: Exception) {
        println("unexpected exception: ${exp}")
        false
    }
    @Expect(isExpThrow)
}

@Test
class TestException {
    @TestCase
    func testExceptionThread() {
        let jsContext = getJSContext()
        testExceptionThrow<JSThreadMisMatch> {
            throw JSThreadMisMatch(0, 1, message: "fake mismatch")
        }
    }

    @TestCase
    func testExceptionTypeMismatch() {
        let jsContext = getJSContext()
        let value = jsContext
            .number(1.0)
            .toJSValue()
        testExceptionThrow<JSTypeMisMatch> {
            await(jsContext) {
                value.asNull()
            }
        }
    }

    @TestCase
    func testExceptionOutofRange() {
        let jsContext = getJSContext()
        let array = await(jsContext) {jsContext.array()}
        testExceptionThrow<JSArrayRangeMisMatch> {
            await(jsContext) {
                array[-1] = jsContext
                    .null()
                    .toJSValue()
            }
        }
    }

    @TestCase
    func testExceptionUseAfterFree() {
        let jsContext = getJSContext()
        let promiseCap = await(jsContext) {jsContext.promiseCapability()}
        await(jsContext) {
            promiseCap.resolve(jsContext
                .null()
                .toJSValue())
        }
        testExceptionThrow<JSObjUseAfterFree> {
            await(jsContext) {
                promiseCap.reject(jsContext
                    .string("xxx")
                    .toJSValue())
            }
        }
    }

    @TestCase
    func testJSCodeError() {
        let jsContext = getJSContext()
        let jsFunc = await(jsContext) {
            jsContext.function {
                _, callInfo =>
                throw Exception("this is an exception")
                jsContext
                    .undefined()
                    .toJSValue()
            }
        }
        testExceptionThrow<JSCodeError> {
            await(jsContext) {
                jsFunc.call()
            }
        }
    }

    @TestCase
    func testExceptionNative() {
        let jsContext = getJSContext()
        testExceptionThrow<JSInteropNativeError> {
            throw JSInteropNativeError("test")
        }
    }
}
