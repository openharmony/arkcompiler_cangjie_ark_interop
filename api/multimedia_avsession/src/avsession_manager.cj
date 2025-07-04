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

package ohos.multimedia_avsession

import ohos.ability.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.*

foreign func FfiMultimediaAVSessionManagerCreateAVSession(context: CPointer<Unit>, tag: CPointer<CString>,
    `type`: CPointer<Int32>, session: CPointer<Int64>, sessionId: CPointer<CString>): Int32

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public func createAVSession(context: CPointer<Unit>, tag: String, `type`: AVSessionType): AVSession {
    if (context.isNull()) {
        throw IllegalArgumentException("Invalid context: context must not be null")
    }
    if (tag.isEmpty()) {
        throw IllegalArgumentException("Invalid tag: tag must not be null")
    }
    try (
        tagPtr = safeMalloc<CString>().asResource(),
        sessionIdPtr = safeMalloc<CString>().asResource(),
        tagStr = unsafe { LibC.mallocCString(tag).asResource() }
    ) {
        unsafe { tagPtr.value.write(tagStr.value) }
        var session = 0i64
        var typeValue = `type`.value
        let code = unsafe { FfiMultimediaAVSessionManagerCreateAVSession(context, tagPtr.value, inout typeValue,
            inout session, sessionIdPtr.value) }
        checkAndReturn(code, "createAVSession")
        let sessionId = unsafe { sessionIdPtr.value.read().toString() }
        unsafe { LibC.free(sessionIdPtr.value.read()) }
        return unsafe { AVSession(session, sessionId, `type`) }
    }
    throwBusinessException(ERR_NO_MEMORY)
}
