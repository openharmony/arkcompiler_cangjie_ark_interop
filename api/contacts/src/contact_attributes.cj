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
import ohos.data_share_predicates.DataSharePredicates as DSPredicates
import ohos.values_bucket.ValueType
import ohos.base.*

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public enum Attribute {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    ATTR_CONTACT_EVENT
    | // Important dates such as birthday and anniversaries of the contact.
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    ATTR_EMAIL
    | // Email address of the contact.
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    ATTR_GROUP_MEMBERSHIP
    | // Groups of the contact.
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    ATTR_IM
    | // IM addresses of the contact.
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    ATTR_NAME
    | // Contact name.
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    ATTR_NICKNAME
    | // Contact nickname.
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    ATTR_NOTE
    | // Contact notes.
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    ATTR_ORGANIZATION
    | // Organization of the contact.
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    ATTR_PHONE
    | // Phone number of the contacts.
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    ATTR_PORTRAIT
    | // Contact portrait.
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    ATTR_POSTAL_ADDRESS
    | // Postal address of the contact.
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    ATTR_RELATION
    | // Relationship with the contact.
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    ATTR_SIP_ADDRESS
    | // SIP addresses of the contact.
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    ATTR_WEBSITE
    | // Website that stores the contact information.
        ...

    static func fromContentType(contentType: CValueType): Option<Attribute> {
        let attrChars: CPointer<UInt8> = contentType.string
        if (equals(CS_CT_EMAIL, attrChars)) {
            ATTR_EMAIL
        } else if (equals(CS_CT_IM, attrChars)) {
            ATTR_IM
        } else if (equals(CS_CT_NICKNAME, attrChars)) {
            ATTR_NICKNAME
        } else if (equals(CS_CT_ORGANIZATION, attrChars)) {
            ATTR_ORGANIZATION
        } else if (equals(CS_CT_PHONE, attrChars)) {
            ATTR_PHONE
        } else if (equals(CS_CT_NAME, attrChars)) {
            ATTR_NAME
        } else if (equals(CS_CT_POST_ADDR, attrChars)) {
            ATTR_POSTAL_ADDRESS
        } else if (equals(CS_CT_PHOTO, attrChars)) {
            ATTR_PORTRAIT
        } else if (equals(CS_CT_GROUP, attrChars)) {
            ATTR_GROUP_MEMBERSHIP
        } else if (equals(CS_CT_NOTE, attrChars)) {
            ATTR_NOTE
        } else if (equals(CS_CT_EVENT, attrChars)) {
            ATTR_CONTACT_EVENT
        } else if (equals(CS_CT_WEBSITE, attrChars)) {
            ATTR_WEBSITE
        } else if (equals(CS_CT_RELATION, attrChars)) {
            ATTR_RELATION
        } else if (equals(CS_CT_SIP_ADDR, attrChars)) {
            ATTR_SIP_ADDRESS
        } else {
            LOG.warn("unsupported contentType ${CString(attrChars).toString()}")
            None
        }
    }

    func encode(): Int32 {
        match (this) {
            case ATTR_EMAIL => 1
            case ATTR_IM => 2
            case ATTR_NICKNAME => 3
            case ATTR_ORGANIZATION => 4
            case ATTR_PHONE => 5
            case ATTR_NAME => 6
            case ATTR_POSTAL_ADDRESS => 7
            case ATTR_PORTRAIT => 8
            case ATTR_GROUP_MEMBERSHIP => 9
            case ATTR_NOTE => 10
            case ATTR_CONTACT_EVENT => 11
            case ATTR_WEBSITE => 12
            case ATTR_RELATION => 13
            // 14 - unused
            // 15 - unused
            // 16 - unused
            case ATTR_SIP_ADDRESS => 17
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Provides a list of contact attributes, which are generally used as arguments.
 *
 * @syscap SystemCapability.Applications.ContactsData
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public struct ContactAttributes {
    var attrmask: UInt64 = 0

    // unused attributes are not included
    static let ALL_ATTRIBUTES: Array<Attribute> = [
        ATTR_EMAIL,
        ATTR_IM,
        ATTR_NICKNAME,
        ATTR_ORGANIZATION,
        ATTR_PHONE,
        ATTR_NAME,
        ATTR_POSTAL_ADDRESS,
        ATTR_PORTRAIT,
        ATTR_GROUP_MEMBERSHIP,
        ATTR_NOTE,
        ATTR_CONTACT_EVENT,
        ATTR_WEBSITE,
        ATTR_RELATION,
        ATTR_SIP_ADDRESS
    ]
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public static let ALL: ContactAttributes = ContactAttributes(ALL_ATTRIBUTES)

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public ContactAttributes(attributes: Array<Attribute>) {
        for (attr in attributes) {
            add(attr)
        }
    }

    mut func add(attr: Attribute): Unit {
        attrmask = attrmask | (1 << attr.encode())
    }

    mut func drop(attr: Attribute): Unit {
        attrmask = attrmask & !(1 << attr.encode())
    }

    func has(attr: Attribute): Bool {
        0 != (attrmask & (1 << attr.encode()))
    }

    // when ContactAttributes is not empty, it produces non-trivial Predicates
    // this func is needed while DSPredicates has no API like isEmpty
    func isEmpty(): Bool {
        attrmask == 0
    }

    static const STR_TYPE_ID: String = "type_id"

    // use this `passedPredsAreNotEmpty` while DSPredicates has no API like isEmpty
    func asPredicates(): DSPredicates {
        appendToPredicates(DSPredicates(), passedPredsAreNotEmpty: false)
    }

    func appendToPredicates(predicates: DSPredicates, passedPredsAreNotEmpty!: Bool = true): DSPredicates {
        if (!isEmpty()) {
            if (passedPredsAreNotEmpty) {
                predicates.and()
            }
            predicates.beginWrap()
        }

        var notFirst = false
        for (attr in ALL_ATTRIBUTES) {
            if (has(attr)) {
                if (notFirst) {
                    predicates.or()
                } else {
                    notFirst = true
                }
                predicates.equalTo(STR_TYPE_ID, ValueType.Str("${attr.encode()}"))
            }
        }

        if (!isEmpty()) {
            predicates.endWrap()
        }
        predicates
    }
}
