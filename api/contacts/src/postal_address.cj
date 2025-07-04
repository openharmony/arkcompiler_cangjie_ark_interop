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
 * Defines a contact's postal address.
 *
 * @syscap SystemCapability.Applications.ContactsData
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public struct PostalAddress {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public static const INVALID_LABEL_ID: Int32 = -1
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public static const CUSTOM_LABEL: Int32 = 0
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public static const ADDR_HOME: Int32 = 1
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public static const ADDR_WORK: Int32 = 2
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public static const ADDR_OTHER: Int32 = 3

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public PostalAddress(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var postalAddress: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var city!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var country!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var neighborhood!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var pobox!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var postcode!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var region!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var street!: String = "",
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

    static func fromValuesBucket(bucket: CachedKeysValuesBucket): PostalAddress {
        var postalAddress: String = ""
        var city: String = ""
        var country: String = ""
        var neighborhood: String = ""
        var pobox: String = ""
        var postcode: String = ""
        var region: String = ""
        var street: String = ""
        var labelName: String = ""
        var labelId: Int32 = INVALID_LABEL_ID
        for (i in 0..bucket.size) {
            let keyCStr: CString = unsafe { bucket.key.read(i) }
            let valCValue: CValueType = unsafe { bucket.value.read(i) }
            if (CS_DETAIL_INFO.getOrThrow().equals(keyCStr)) {
                postalAddress = createStrFromCPointer(valCValue.string)
            } else if (CS_CITY.getOrThrow().equals(keyCStr)) {
                city = createStrFromCPointer(valCValue.string)
            } else if (CS_COUNTRY.getOrThrow().equals(keyCStr)) {
                country = createStrFromCPointer(valCValue.string)
            } else if (CS_NEIGHBORHOOD.getOrThrow().equals(keyCStr)) {
                neighborhood = createStrFromCPointer(valCValue.string)
            } else if (CS_POBOX.getOrThrow().equals(keyCStr)) {
                pobox = createStrFromCPointer(valCValue.string)
            } else if (CS_POSTCODE.getOrThrow().equals(keyCStr)) {
                postcode = createStrFromCPointer(valCValue.string)
            } else if (CS_REGION.getOrThrow().equals(keyCStr)) {
                region = createStrFromCPointer(valCValue.string)
            } else if (CS_STREET.getOrThrow().equals(keyCStr)) {
                street = createStrFromCPointer(valCValue.string)
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
        PostalAddress(postalAddress, city: city, country: country, neighborhood: neighborhood, pobox: pobox,
            postcode: postcode, region: region, street: street, labelName: labelName, labelId: labelId)
    }

    func asValuesBucket(): Option<CachedKeysValuesBucket> {
        let parts = ArrayList<(CString, String)>()
        parts.add((CS_DETAIL_INFO.getOrThrow(), this.postalAddress))
        if (this.labelName.size > 0) {
            parts.add((CS_CUSTOM_DATA.getOrThrow(), this.labelName))
            parts.add((CS_EXTEND7.getOrThrow(), "${CUSTOM_LABEL}"))
        } else if (this.labelId != CUSTOM_LABEL) {
            parts.add((CS_EXTEND7.getOrThrow(), "${this.labelId}"))
        }
        appendNonEmptyAttr(parts, CS_NEIGHBORHOOD, this.neighborhood)
        appendNonEmptyAttr(parts, CS_POBOX, this.pobox)
        appendNonEmptyAttr(parts, CS_POSTCODE, this.postcode)
        appendNonEmptyAttr(parts, CS_REGION, this.region)
        appendNonEmptyAttr(parts, CS_STREET, this.street)
        appendNonEmptyAttr(parts, CS_CITY, this.city)
        appendNonEmptyAttr(parts, CS_COUNTRY, this.country)
        parts.add((CS_CONTENT_TYPE.getOrThrow(), "postal_address"))
        CachedKeysValuesBucket.create(parts.toArray())
    }
}
