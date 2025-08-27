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

package ohos.uri

import ohos.ffi.*
import ohos.labels.*

class UriImpl {
    init() {}
}

/**
 * URI Represents a Uniform Resource Identifier (URI) reference.
 *
 * @relation class URI
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Utils.Lang"
]
public open class Uri <: RemoteDataLite & ToString {
    private let impl_: UriImpl = UriImpl()
    protected init(id: Int64) {
        super(id)
    }

    /**
     * Gets/Sets the path portion of the URI.
     *
     * @relation path: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Lang"
    ]
    public open prop path: String {
        get() {
            throw IllegalArgumentException("The prop is not supported.")
        }
    }

    /**
     * Converts this URI into an encoded string.
     *
     * @relation toString(): string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Utils.Lang"
    ]
    public open func toString(): String {
        throw IllegalArgumentException("The function is not supported.")
    }
}
