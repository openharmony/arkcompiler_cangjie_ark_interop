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

package ohos.image.interop

import ohos.image.*
import ohos.ark_interop.*
import ohos.ark_interop_helper.*
import ohos.labels.*

foreign func FfiConvertPixelMap2Napi(env: napi_env, id: Int64): napi_value

foreign func FfiCreatePixelMapFromNapi(env: napi_env, object: napi_value): Int64

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public interface JSSystemObjectInteropType {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    static func fromJSValue(context: JSContext, input: JSValue): PixelMap
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    func toJSValue(context: JSContext): JSValue
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
extend PixelMap <: JSSystemObjectInteropType {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public static func fromJSValue(context: JSContext, input: JSValue): PixelMap {
        let env = context.getNapiEnv()
        let napiValue = arkTsValuetoNapiValue(context.getNapiEnv(), input)
        let remoteId = unsafe { FfiCreatePixelMapFromNapi(env, napiValue) }
        PixelMap(remoteId)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func toJSValue(context: JSContext): JSValue {
        let napiValue = unsafe { FfiConvertPixelMap2Napi(context.getNapiEnv(), getID()) }
        JSValue(context, napiValueToArkTsValue(napiValue))
    }
}
