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

package ohos.zlib

import ohos.labels.APILevel

/**
 * Defines compress or decompress options.
 *
 * @relation interface Options
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.Zlib"
]
public class ZipOptions {
    /**
     * Indicates the compress level.
     *
     * @relation level?: CompressLevel
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public let level: CompressLevel

    /**
     * Indicates the memory level.
     *
     * @relation memLevel?: MemLevel
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public let memLevel: MemLevel

    /**
     * Indicates the compress strategy.
     *
     * @relation strategy?: CompressStrategy
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public let strategy: CompressStrategy

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public init(level: CompressLevel, memLevel: MemLevel, strategy: CompressStrategy) {
        this.level = level
        this.memLevel = memLevel
        this.strategy = strategy
    }
}

@C
struct RetOptions {
    let level: Int32
    let memLevel: Int32
    let strategy: Int32

    init(options: ZipOptions) {
        this.level = options.level.getValue()
        this.memLevel = options.memLevel.getValue()
        this.strategy = options.strategy.getValue()
    }
}
