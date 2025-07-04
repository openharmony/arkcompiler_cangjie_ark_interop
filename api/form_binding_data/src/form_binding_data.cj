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

package ohos.app.form.formBindingData

import ohos.base.*
import ohos.ffi.*
import ohos.hilog.*
import std.collection.HashMap
import ohos.encoding.json.JsonValue
import ohos.encoding.json.JsonObject
import ohos.labels.*

/**
 * Defines the createFormBindingData result interface.
 *
 * @typedef FormBindingData
 * @syscap SystemCapability.Ability.Form
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.Form"
]
public class FormBindingData {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public FormBindingData(
        /**
         * Data for updating.
         *
         * @type { JsonObject }
         * @syscap SystemCapability.Ability.Form
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.Form"
        ]
        public var data: String,

        /**
         * proxies for updating.
         *
         * @type { ?Array<ProxyData> }
         * @syscap SystemCapability.Ability.Form
         * @StageModelOnly
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.Form"
        ]
        public var proxies!: ?Array<ProxyData> = Array<ProxyData>()
    ) {}
}

/**
 * Defines the form proxy data.
 *
 * @typedef ProxyData
 * @syscap SystemCapability.Ability.Form
 * @StageModelOnly
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.Form"
]
public class ProxyData {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public ProxyData(
        /**
         * Key for proxy. The value depend data publisher.
         *
         * @type { String }
         * @syscap SystemCapability.Ability.Form
         * @StageModelOnly
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.Form"
        ]
        public var key: String,

        /**
         * SubscriberId. The value depend data publisher. The default value is current formId.
         *
         * @type { ?String }
         * @syscap SystemCapability.Ability.Form
         * @StageModelOnly
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.Form"
        ]
        public var subscriberId!: ?String = None
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.Form"
]
public func createFormBindingData(obj!: ?String = None): FormBindingData {
    unsafe {
        var str = match (obj) {
            case Some(v) => v
            case None => ""
        }

        try (cStr = LibC.mallocCString(str).asResource()) {
            let ret = FfiFormBindingDataCreateFormBindingData(cStr.value)
            if (ret.errCode != SUCCESS_CODE) {
                throw BusinessException(ret.errCode, "createFormBindingData failed: ${ret.errCode}")
            }
            let formBindingData = ret.cFormBindingData.toFormBindingData()
            ret.cFormBindingData.free()
            return formBindingData
        }
        throw BusinessException(16500001, "Internal error.")
    }
}
