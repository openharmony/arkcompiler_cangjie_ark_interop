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

package ohos.ark_interop

@FastNative
foreign func ARKTS_CreateExternal(env: JSEnv, data: Int64): JSValue_

@FastNative
foreign func ARKTS_GetExternalData(env: JSEnv, value: JSValue_): Int64

@C
func cjExternalDestructor(id: Int64, env: JSEnv): Unit {
    let context = JSContext.getOrCreate(env)
    if (let Some(data) <- context.sharedObjects_.get(id)) {
        data.shareCnt_--
        if (data.shareCnt_ == 0) {
            context.sharedObjects_.remove(id)
        }
    }
}

/**
 * base class of objects to share with arkts, it has an unique id, when shared to arkts, the object would be kept to
 *  a global table, the id used to index the object.
 */
@!APILevel[
    13,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
public open class SharedObject {
    var nativeId_: Int64 = -1
    var shareCnt_: Int64 = 0

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public init() {}

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public prop nativeId: Int64 {
        get() {
            nativeId_
        }
    }
}

/**
 * the js presentation of an cj object, it holds the id of cj object, and affects the lifecycle of the cj object
 */
@!APILevel[
    13,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Napi"
]
public class JSExternal <: JSHeapObject {
    static func createExternal(context: JSContext, data: SharedObject): JSValue_ {
        let id = if (data.nativeId_ < 0) {
            let id = context.sharedObjects_.append(data)
            data.nativeId_ = id
            id
        } else {
            data.nativeId_
        }
        data.shareCnt_++
        unsafe { ARKTS_CreateExternal(context.env, id) }
    }

    private var id_: ?Int64

    init(context: JSContext, value: JSValue_) {
        super(context, value)
        id_ = None
    }

    init(context: JSContext, data: SharedObject) {
        super(context, createExternal(context, data))
        id_ = data.nativeId_
    }

    private init(context: JSContext, value: JSValue, id: Int64) {
        super(context, value.value)
        id_ = id
    }

    ~init() {
        unsafe { ARKTS_DisposeGlobal(context.env_, globalValue_) }
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func getData(): SharedObject {
        context.sharedObjects_[id]
    }

    @!APILevel[
        13,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Napi"
    ]
    public func cast<T>(): Option<T> where T <: SharedObject {
        getData() as T
    }

    prop id: Int64 {
        get() {
            match (id_) {
                case Some(v) => v
                case None =>
                    let v = unsafe { ARKTS_GetExternalData(context.env, innerValue) }
                    id_ = v
                    v
            }
        }
    }
}
