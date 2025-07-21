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

protected package ohos.metadata

import ohos.labels.*
import ohos.ffi.*
import std.collection.ArrayList

/**
* Indicates the Metadata
*
* @relation export interface Metadata
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class Metadata {
    /**
     * Indicates the metadata name
     *
     * @relation name: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var name: String
    /**
     * Indicates the metadata value
     *
     * @relation value: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var value: String
    /**
     * Indicates the metadata resource
     *
     * @relation resource: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var resource: String

    protected init(name: String, value: String, resource: String) {
        this.name = name
        this.value = value
        this.resource = resource
    }

    protected init(ret: RetMetadata) {
        this.name = ret.name.toString()
        this.value = ret.value.toString()
        this.resource = ret.resource.toString()
    }
}

@C
protected struct RetMetadata {
    protected RetMetadata(
        var name: CString,
        var value: CString,
        var resource: CString
    ) {}

    protected func free(): Unit {
        unsafe {
            LibC.free(this.name)
            LibC.free(this.value)
            LibC.free(this.resource)
        }
    }
}

@C
protected struct CArrMetadata {
    protected CArrMetadata(
        protected let head: CPointer<RetMetadata>,
        protected let size: Int64
    ) {}
}

protected func freeCArrMetadata(cArr: CArrMetadata) {
    if (cArr.head.isNotNull()) {
        unsafe {
            for (i in 0..cArr.size) {
                cArr.head.read(i).free()
            }
            LibC.free<RetMetadata>(cArr.head)
        }
    }
}

protected func readArrMetadata(cArr: CArrMetadata): Array<Metadata> {
    let result = ArrayList<Metadata>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(Metadata(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}