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

import ohos.ark_interop.{JSModule, JSContext, JSCallInfo, JSValue, JSArrayRangeMisMatch, JSClass, JSObject, SharedObject, 
    JSRuntime}

class MyClass_test_instanceof_02 {
    static var _jsClass: Option<JSClass> = None
    static init() {
        JSModule.registerFunc("testInstanceOf02", testInstanceOf02)
        JSModule.registerClass("MyClass_test_instanceof_02") {
            jsContext: JSContext =>
            let jsClass = jsContext.clazz(MyClass_test_instanceof_02.constructor)
            _jsClass = jsClass
            jsClass
        }
    }
    static func constructor(jsContext: JSContext, jsCallInfo: JSCallInfo): JSValue {
        let jsObject = jsContext.object()
        jsObject.toJSValue()
    }
    static func getJsClass(): JSClass {
        _jsClass.getOrThrow()
    }
}

func testInstanceOf02(jsContext: JSContext, jsCallInfo: JSCallInfo): JSValue {
    Assert.equals(jsCallInfo.count, 1)
    logger.info("1")
    //    Assert.isTrue(jsCallInfo[0].isObject())
    //    logger.info("2")
    //    let jsObject = jsCallInfo[0].asObject(jsContext)
    //    logger.info("3")
    //    let jsClass = MyClass_test_instanceof_02.getJsClass()
    //    logger.info("4")
    //    Assert.isTrue(jsObject.instanceOf(jsClass), reason: "jsObject is instance of jsClass")
    //    logger.info("5")
    jsContext.undefined().toJSValue()
}
