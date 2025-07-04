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

package ohos.file_fs.interop

import ohos.ark_interop.*
import ohos.ark_interop_helper.*
import ohos.file_fs.*
import ohos.labels.*

foreign {
    func FfiConvertFile2Napi(env: napi_env, id: Int64): napi_value

    func FfiCreateFileFromNapi(env: napi_env, object: napi_value): Int64

    func FfiConvertRandomAccessFile2Napi(env: napi_env, id: Int64): napi_value

    func FfiCreateRandomAccessFileFromNapi(env: napi_env, object: napi_value): Int64

    func FfiCreateStreamFromNapi(env: napi_env, stream: napi_value): Int64

    func FfiConvertStream2Napi(env: napi_env, id: Int64): napi_value
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public interface JSSystemObjectInteropType<T> {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    static func fromJSValue(context: JSContext, input: JSValue): T
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    func toJSValue(context: JSContext): JSValue
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
extend File <: JSSystemObjectInteropType<File> {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func fromJSValue(context: JSContext, input: JSValue): File {
        let env = context.getNapiEnv()
        let napiValue = arkTsValuetoNapiValue(context.getNapiEnv(), input)
        let remoteId = unsafe { FfiCreateFileFromNapi(env, napiValue) }
        File(remoteId)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func toJSValue(context: JSContext): JSValue {
        let napiValue = unsafe { FfiConvertFile2Napi(context.getNapiEnv(), getID()) }
        JSValue(context, unsafe { napiValueToArkTsValue(napiValue) })
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
extend RandomAccessFile <: JSSystemObjectInteropType<RandomAccessFile> {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func fromJSValue(context: JSContext, input: JSValue): RandomAccessFile {
        let env = context.getNapiEnv()
        let napiValue = arkTsValuetoNapiValue(context.getNapiEnv(), input)
        let remoteId = unsafe { FfiCreateRandomAccessFileFromNapi(env, napiValue) }
        RandomAccessFile(remoteId)
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func toJSValue(context: JSContext): JSValue {
        let napiValue = unsafe { FfiConvertRandomAccessFile2Napi(context.getNapiEnv(), getID()) }
        JSValue(context, unsafe { napiValueToArkTsValue(napiValue) })
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
extend Stream <: JSSystemObjectInteropType<Stream> {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public static func fromJSValue(context: JSContext, input: JSValue): Stream {
        let env = context.getNapiEnv()
        let napiValue = arkTsValuetoNapiValue(context.getNapiEnv(), input)
        let remoteId = unsafe { FfiCreateStreamFromNapi(env, napiValue) }
        Stream(remoteId)
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func toJSValue(context: JSContext): JSValue {
        let napiValue = unsafe { FfiConvertStream2Napi(context.getNapiEnv(), getID()) }
        JSValue(context, unsafe { napiValueToArkTsValue(napiValue) })
    }
}
