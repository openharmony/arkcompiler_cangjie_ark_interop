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
 * Defines a contact's instant messenger address.
 *
 * @syscap SystemCapability.Applications.ContactsData
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public struct ImAddress {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public static const INVALID_LABEL_ID: Int32 = -2
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public static const CUSTOM_LABEL: Int32 = -1
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public static const IM_AIM: Int32 = 0
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public static const IM_MSN: Int32 = 1
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public static const IM_YAHOO: Int32 = 2
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public static const IM_SKYPE: Int32 = 3
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public static const IM_QQ: Int32 = 4
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public static const IM_ICQ: Int32 = 6 // yes, 5 is skipped
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public static const IM_JABBER: Int32 = 7

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public ImAddress(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var imAddress: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var labelName!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var labelId!: Int32 = INVALID_LABEL_ID
    ) {}

    static func fromValuesBucket(bucket: CachedKeysValuesBucket): ImAddress {
        var imAddress: String = ""
        var labelName: String = ""
        var labelId: Int32 = INVALID_LABEL_ID
        for (i in 0..bucket.size) {
            let keyCStr: CString = unsafe { bucket.key.read(i) }
            let valCValue: CValueType = unsafe { bucket.value.read(i) }
            if (CS_DETAIL_INFO.getOrThrow().equals(keyCStr)) {
                imAddress = createStrFromCPointer(valCValue.string)
            } else if (CS_CUSTOM_DATA.getOrThrow().equals(keyCStr)) {
                labelName = createStrFromCPointer(valCValue.string)
            } else if (CS_EXTEND7.getOrThrow().equals(keyCStr)) {
                if (createStrFromCPointer(valCValue.string) == "") {
                    labelId = -1
                } else {
                    labelId = Int32.parse(createStrFromCPointer(valCValue.string))
                }
            }
        }
        // fixup labelId
        if (labelName.size > 0) {
            labelId = CUSTOM_LABEL
        }
        ImAddress(imAddress, labelName: labelName, labelId: labelId)
    }

    func asValuesBucket(): Option<CachedKeysValuesBucket> {
        let parts = ArrayList<(CString, String)>()
        parts.add((CS_DETAIL_INFO.getOrThrow(), this.imAddress))
        if (this.labelName.size > 0) {
            parts.add((CS_CUSTOM_DATA.getOrThrow(), this.labelName))
            parts.add((CS_EXTEND7.getOrThrow(), "${CUSTOM_LABEL}"))
        } else if (this.labelId != CUSTOM_LABEL) {
            parts.add((CS_EXTEND7.getOrThrow(), "${this.labelId}"))
        }
        parts.add((CS_CONTENT_TYPE.getOrThrow(), "im"))
        CachedKeysValuesBucket.create(parts.toArray())
    }
}
