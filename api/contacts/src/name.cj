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
 * Defines a contact's name.
 *
 * @syscap SystemCapability.Applications.ContactsData
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public struct Name {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public Name(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var familyName!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var familyNamePhonetic!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var fullName!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var givenName!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var givenNamePhonetic!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var middleName!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var middleNamePhonetic!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var namePrefix!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var nameSuffix!: String = ""
    ) {}

    mut func fillFromValuesBucket(bucket: CachedKeysValuesBucket): Unit {
        for (i in 0..bucket.size) {
            let keyCStr: CString = unsafe { bucket.key.read(i) }
            let valCStr: CPointer<UInt8> = unsafe { bucket.value.read(i).string }
            if (CS_DETAIL_INFO.getOrThrow().equals(keyCStr)) {
                this.fullName = createStrFromCPointer(valCStr)
            } else if (CS_ALPHA_NAME.getOrThrow().equals(keyCStr)) {
                this.namePrefix = createStrFromCPointer(valCStr)
            } else if (CS_OTHER_LAN_LAST_NAME.getOrThrow().equals(keyCStr)) {
                this.middleName = createStrFromCPointer(valCStr)
            } else if (CS_OTHER_LAN_FIRST_NAME.getOrThrow().equals(keyCStr)) {
                this.nameSuffix = createStrFromCPointer(valCStr)
            } else if (CS_FAMILY_NAME.getOrThrow().equals(keyCStr)) {
                this.familyName = createStrFromCPointer(valCStr)
            } else if (CS_MIDDLE_NAME_PHONETIC.getOrThrow().equals(keyCStr)) {
                this.middleNamePhonetic = createStrFromCPointer(valCStr)
            } else if (CS_GIVEN_NAME.getOrThrow().equals(keyCStr)) {
                this.givenName = createStrFromCPointer(valCStr)
            } else if (CS_GIVEN_NAME_PHONETIC.getOrThrow().equals(keyCStr)) {
                this.givenNamePhonetic = createStrFromCPointer(valCStr)
            } else if (CS_PHONETIC_NAME.getOrThrow().equals(keyCStr)) {
                this.familyNamePhonetic = createStrFromCPointer(valCStr)
            }
        }
    }

    func asValuesBucket(): Option<CachedKeysValuesBucket> {
        if (this.fullName.size > 0) {
            let parts = ArrayList<(CString, String)>()
            parts.add((CS_DETAIL_INFO.getOrThrow(), this.fullName))
            appendNonEmptyAttr(parts, CS_ALPHA_NAME, this.namePrefix)
            appendNonEmptyAttr(parts, CS_OTHER_LAN_LAST_NAME, this.middleName)
            appendNonEmptyAttr(parts, CS_OTHER_LAN_FIRST_NAME, this.nameSuffix)
            appendNonEmptyAttr(parts, CS_FAMILY_NAME, this.familyName)
            appendNonEmptyAttr(parts, CS_MIDDLE_NAME_PHONETIC, this.middleNamePhonetic)
            appendNonEmptyAttr(parts, CS_GIVEN_NAME, this.givenName)
            appendNonEmptyAttr(parts, CS_GIVEN_NAME_PHONETIC, this.givenNamePhonetic)
            appendNonEmptyAttr(parts, CS_PHONETIC_NAME, this.familyNamePhonetic)
            parts.add((CS_CONTENT_TYPE.getOrThrow(), "name"))
            CachedKeysValuesBucket.create(parts.toArray())
        } else {
            CachedKeysValuesBucket.EMPTY
        }
    }
}
