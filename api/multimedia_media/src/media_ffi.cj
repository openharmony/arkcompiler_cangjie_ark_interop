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

import ohos.image.PixelMap
import ohos.ffi.*
import ohos.base.*
import std.collection.*

@C
struct CValueType {
    CValueType(
        let number: Int32,
        let dou: Float64,
        let str: CString
    ) {}
}

@C
protected struct CAVFileDescriptor {
    private var fd_: Int32
    private var offset_: Int64
    private var length_: Int64

    protected init(fileDescriptor: AVFileDescriptor) {
        this(fileDescriptor.fd, fileDescriptor.offset, fileDescriptor.length)
    }

    init(fd: Int32, offset: ?Int64, length: ?Int64) {
        fd_ = fd
        offset_ = offset ?? 0
        length_ = length ?? 0
    }

    protected func toCJObject(): AVFileDescriptor {
        return AVFileDescriptor(fd_, offset_, length_)
    }
}

@C
protected struct CPixelMapParams {
    protected var width_: Int32
    protected var height_: Int32

    protected init(param: PixelMapParams) {
        this(param.width, param.height)
    }

    protected init(width: Int32, height: Int32) {
        width_ = width
        height_ = height
    }
}
