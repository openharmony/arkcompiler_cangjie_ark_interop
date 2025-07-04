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

package ohos.contact

import std.collection.ArrayList
import ohos.labels.*
import ohos.base.*

/**
 * Defines a contact's organization.
 *
 * @syscap SystemCapability.Applications.ContactsData
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public struct Organization {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public Organization(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var name!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var title!: String = ""
    ) {}

    mut func fillFromValuesBucket(bucket: CachedKeysValuesBucket): Unit {
        for (i in 0..bucket.size) {
            let keyCStr: CString = unsafe { bucket.key.read(i) }
            let valCValue: CValueType = unsafe { bucket.value.read(i) }
            if (CS_DETAIL_INFO.getOrThrow().equals(keyCStr)) {
                this.name = createStrFromCPointer(valCValue.string)
            } else if (CS_POSITION.getOrThrow().equals(keyCStr)) {
                this.title = createStrFromCPointer(valCValue.string)
            }
        }
    }

    func asValuesBucket(): Option<CachedKeysValuesBucket> {
        if (this.name.size > 0) {
            let parts = ArrayList<(CString, String)>()
            parts.add((CS_DETAIL_INFO.getOrThrow(), this.name))
            appendNonEmptyAttr(parts, CS_POSITION, this.title)
            parts.add((CS_CONTENT_TYPE.getOrThrow(), "organization"))
            CachedKeysValuesBucket.create(parts.toArray())
        } else {
            CachedKeysValuesBucket.EMPTY
        }
    }
}
