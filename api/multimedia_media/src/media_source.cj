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

package ohos.multimedia_media

import std.deriving.*
import ohos.labels.*
import ohos.ffi.*
import ohos.base.*
import std.collection.*

foreign func FfiMediaCreateMediaSourceWithUrl(url: CString, headers: ArrHeaders, errCode: CPointer<Int32>): Int64

unsafe func freeHeaders(cp: CPointer<CHeader>, index: Int64): Unit {
    for (i in 0..index) {
        let header = cp.read(i)
        header.free()
    }
}

unsafe func map2ArrHeaders(headers: HashMap<String, String>, exceptionHandle: () -> Unit): ArrHeaders {
    if (headers.size == 0) {
        return ArrHeaders(CPointer<CHeader>(), 0)
    }
    let arrHeaders = safeMalloc<CHeader>(headers.size) {
        exceptionHandle()
    }
    var index = 0
    for ((k, v) in headers) {
        var header = CHeader(CString(CPointer<UInt8>()), CString(CPointer<UInt8>()))
        try {
            header.key = LibC.mallocCString(k)
            header.value = LibC.mallocCString(v)
        } catch (e: Exception) {
            header.free()
            freeHeaders(arrHeaders, index)
            exceptionHandle()
            throw e
        }
        arrHeaders.write(index, header)
        index++
    }
    ArrHeaders(arrHeaders, headers.size)
}

/**
 * Create MediaSource from url.
 * @param { String } url : The location for the media source.
 * @param { HashMap<String, String> } headers : Headers attached to network request while player request data.
 * @returns { MediaSource } MediaSource instance if the operation is successful; returns null otherwise.
 * @throws { BusinessError } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
 * <br>2. Incorrect parameter types. 3.Parameter verification failed.
 * @throws { BusinessError } 5400101 - No memory.
 * @syscap SystemCapability.Multimedia.Media.Core
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.Core"
]
public func createMediaSourceWithUrl(url: String, headers!: HashMap<String, String> = HashMap<String, String>()): MediaSource {
    unsafe {
        var errCode: Int32 = 0
        let cUrl = LibC.mallocCString(url)
        let arrHeaders = map2ArrHeaders(headers) {
            LibC.free(cUrl)
        }
        let id = FfiMediaCreateMediaSourceWithUrl(cUrl, arrHeaders, inout errCode)
        LibC.free(cUrl)
        arrHeaders.free()
        throwIfNotSuccess(errCode, "media", "createAVPlayer")
        return MediaSource(id)
    }
}

/**
 * Set Media Mime Type to help player handle extended Media source.
 * @param { AVMimeTypes } mimeType - for MediaSource define. see @ AVMimeTypes.
 * @syscap SystemCapability.Multimedia.Media.Core
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.Core"
]
public class MediaSource <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }
}
