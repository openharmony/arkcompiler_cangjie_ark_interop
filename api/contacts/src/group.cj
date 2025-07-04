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
import std.convert.Parsable
import ohos.labels.*
import ohos.base.*

/**
 * Defines a contact's group.
 *
 * @syscap SystemCapability.Applications.ContactsData
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public struct Group {
    static const INVALID_GROUP_ID: Int64 = -1

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public Group(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var title: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var groupId!: Int64 = INVALID_GROUP_ID
    ) {}

    static func fromValuesBucket(bucket: CachedKeysValuesBucket): Group {
        var title: String = ""
        var groupId: Int64 = INVALID_GROUP_ID
        for (i in 0..bucket.size) {
            let keyCStr: CString = unsafe { bucket.key.read(i) }
            let valCValue: CValueType = unsafe { bucket.value.read(i) }
            if (CS_DETAIL_INFO.getOrThrow().equals(keyCStr)) {
                groupId = valCValue.integer
            } else if (CS_GROUP_NAME.getOrThrow().equals(keyCStr) || CS_ALIAS_DETAIL_INFO.getOrThrow().equals(keyCStr)) {
                title = createStrFromCPointer(valCValue.string)
            }
        }
        Group(title, groupId: groupId)
    }

    func asValuesBucket(): Option<CachedKeysValuesBucket> {
        let parts = ArrayList<(CString, String)>()
        if (this.groupId != INVALID_GROUP_ID) {
            parts.add((CS_DETAIL_INFO.getOrThrow(), "${this.groupId}"))
        }
        parts.add((CS_ALIAS_DETAIL_INFO.getOrThrow(), this.title))
        parts.add((CS_CONTENT_TYPE.getOrThrow(), "group_membership"))
        CachedKeysValuesBucket.create(parts.toArray())
    }
}
