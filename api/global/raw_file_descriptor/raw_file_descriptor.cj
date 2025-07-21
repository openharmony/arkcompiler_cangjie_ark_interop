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

protected package ohos.raw_file_descriptor

import ohos.ffi.*
import ohos.base.*
import ohos.labels.*

/**
 * Contains rawFile descriptor information.
 *
 * @relation export interface RawFileDescriptor
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.ResourceManager"
]
public class RawFileDescriptor {
    /**
     * rawfile descriptor
     *
     * @relation fd: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public var fd: Int32
    /**
     * the offset from where the raw file starts in the HAP
     *
     * @relation offset: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public var offset: Int64
    /**
     * the length of the raw file in the HAP
     *
     * @relation length: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public var length: Int64

    /**
     * RawFileDescriptor constructor.
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public init(fd: Int32, offset: Int64, length: Int64) {
        this.fd = fd
        this.offset = offset
        this.length = length
    }

    protected init(raw: RetDataRawFileDescriptor) {
        this.fd = raw.fd
        this.offset = raw.offset
        this.length = raw.length
    }
}

@C
protected struct RetDataRawFileDescriptor {
    protected RetDataRawFileDescriptor(
        protected let fd: Int32,
        protected let offset: Int64,
        protected let length: Int64
    ) {}
}
