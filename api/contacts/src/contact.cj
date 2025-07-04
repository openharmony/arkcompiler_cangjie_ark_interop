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
import ohos.base.*
import ohos.labels.*

/**
 * Defines a contact.
 *
 * @syscap SystemCapability.Applications.ContactsData
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public struct Contact {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public static const INVALID_CONTACT_ID: Int64 = -1

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public Contact(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var id!: Int64 = INVALID_CONTACT_ID,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var key!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var name!: Name = Name(),
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var nickName!: NickName = NickName(""),
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var note!: Note = Note(""),
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var organization!: Organization = Organization(),
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var portrait!: Portrait = Portrait(""),
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var emails!: ArrayList<Email> = ArrayList<Email>(),
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var events!: ArrayList<Event> = ArrayList<Event>(),
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var groups!: ArrayList<Group> = ArrayList<Group>(),
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var imAddresses!: ArrayList<ImAddress> = ArrayList<ImAddress>(),
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var phoneNumbers!: ArrayList<PhoneNumber> = ArrayList<PhoneNumber>(),
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var postalAddresses!: ArrayList<PostalAddress> = ArrayList<PostalAddress>(),
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var relations!: ArrayList<Relation> = ArrayList<Relation>(),
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var sipAddresses!: ArrayList<SipAddress> = ArrayList<SipAddress>(),
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var websites!: ArrayList<Website> = ArrayList<Website>()
    ) {}

    func contactAttributes(): ContactAttributes {
        let attrs = ArrayList<Attribute>()
        if (this.emails.size > 0) {
            attrs.add(Attribute.ATTR_EMAIL)
        }
        if (this.events.size > 0) {
            attrs.add(Attribute.ATTR_CONTACT_EVENT)
        }
        if (this.groups.size > 0) {
            attrs.add(Attribute.ATTR_GROUP_MEMBERSHIP)
        }
        if (this.imAddresses.size > 0) {
            attrs.add(Attribute.ATTR_IM)
        }
        if (this.portrait.uri.size > 0) {
            attrs.add(Attribute.ATTR_PORTRAIT)
        }
        if (this.phoneNumbers.size > 0) {
            attrs.add(Attribute.ATTR_PHONE)
        }
        if (this.postalAddresses.size > 0) {
            attrs.add(Attribute.ATTR_POSTAL_ADDRESS)
        }
        if (this.relations.size > 0) {
            attrs.add(Attribute.ATTR_RELATION)
        }
        if (this.sipAddresses.size > 0) {
            attrs.add(Attribute.ATTR_SIP_ADDRESS)
        }
        if (this.websites.size > 0) {
            attrs.add(Attribute.ATTR_WEBSITE)
        }
        if (this.name.fullName.size > 0) {
            attrs.add(Attribute.ATTR_NAME)
        }
        if (this.nickName.nickName.size > 0) {
            attrs.add(Attribute.ATTR_NICKNAME)
        }
        if (this.note.noteContent.size > 0) {
            attrs.add(Attribute.ATTR_NOTE)
        }
        if (this.organization.name.size > 0) {
            attrs.add(Attribute.ATTR_ORGANIZATION)
        }
        ContactAttributes(attrs.toArray())
    }

    // incoming data can also contain buckets for `id` and `key` attributes of Contact
    static func fromCContactData(cContact: CContactData): Contact {
        var contact = Contact()

        for (i in 0..cContact.bucketCount) {
            let bucket: CachedKeysValuesBucket = unsafe { cContact.data.read(i) }
            // preformance is maximized for those who put content type at the beginning of the bucket
            let contentType: CValueType = match (bucket.lookupKey(CS_CONTENT_TYPE)) {
                case Some(cContentType) => cContentType
                case None =>
                    LOG.warn("Contact.fromCContactData: content_type is not provided for bucket - skip it.");
                    continue
            }

            if (equals(CS_CT_ID, contentType)) {
                let detailInfo = detailInfoFromValuesBucket(bucket)
                contact.id = match (detailInfo) {
                    case "" =>
                        LOG.warn(
                            "Contact.fromCContactData: empty detail_info for CT_ID bucket - use INVALID_CONTACT_ID.");
                        INVALID_CONTACT_ID
                    case str => Int64.parse(str)
                }
            } else if (equals(CS_CT_KEY, contentType)) {
                let detailInfo = detailInfoFromValuesBucket(bucket)
                contact.key = match (detailInfo) {
                    case "" =>
                        LOG.warn("Contact.fromCContactData: empty detail_info for CT_KEY bucket - use \"\".");
                        ""
                    case str => str
                }
            } else {
                contact.addInfoFromBucket(Attribute.fromContentType(contentType), bucket);
            }
        }

        contact
    }

    private mut func addInfoFromBucket(attr: Option<Attribute>, bucket: CachedKeysValuesBucket): Unit {
        match (attr) {
            case Some(ATTR_NAME) => this.name.fillFromValuesBucket(bucket)
            case Some(ATTR_ORGANIZATION) => this.organization.fillFromValuesBucket(bucket)
            case Some(ATTR_NICKNAME) => this.nickName = NickName(detailInfoFromValuesBucket(bucket))
            case Some(ATTR_PORTRAIT) => this.portrait = Portrait(detailInfoFromValuesBucket(bucket))
            case Some(ATTR_NOTE) => this.note = Note(detailInfoFromValuesBucket(bucket))
            case Some(ATTR_EMAIL) => this.emails.add(Email.fromValuesBucket(bucket))
            case Some(ATTR_IM) => this.imAddresses.add(ImAddress.fromValuesBucket(bucket))
            case Some(ATTR_PHONE) => this.phoneNumbers.add(PhoneNumber.fromValuesBucket(bucket))
            case Some(ATTR_POSTAL_ADDRESS) => this.postalAddresses.add(PostalAddress.fromValuesBucket(bucket))
            case Some(ATTR_GROUP_MEMBERSHIP) => this.groups.add(Group.fromValuesBucket(bucket))
            case Some(ATTR_CONTACT_EVENT) => this.events.add(Event.fromValuesBucket(bucket))
            case Some(ATTR_WEBSITE) => this.websites.add(Website(detailInfoFromValuesBucket(bucket)))
            case Some(ATTR_RELATION) => this.relations.add(Relation.fromValuesBucket(bucket))
            case Some(ATTR_SIP_ADDRESS) => this.sipAddresses.add(SipAddress.fromValuesBucket(bucket))
            case _ => () // ignore bucket with unsupported content
        }
    }

    func asCRawContact(): CPointer<CachedKeysValuesBucket> {
        // the content of ValuesBucket to be passed to RawContactInsert
        let parts = ArrayList<(CString, String)>(3)
        appendNonEmptyAttr(parts, CS_DISPLAY_NAME, this.name.fullName)
        appendNonEmptyAttr(parts, CS_COMPANY, this.organization.name)
        appendNonEmptyAttr(parts, CS_POSITION, this.organization.title)

        let bucket = match (CachedKeysValuesBucket.create(parts.toArray())) {
            case Some(bucket) => bucket
            case None =>
                LOG.error("Contact.asCRawContact: faield to create a bucket.")
                return CachedKeysValuesBucket.NULL
        }

        let valuesBucket: CPointer<CachedKeysValuesBucket> = calloc<CachedKeysValuesBucket>()
        if (valuesBucket.isNull()) {
            LOG.error("Contact.asCRawContact: faield to allocate a bucket")
            bucket.free()
        } else {
            unsafe { valuesBucket.write(0, bucket) }
        }
        valuesBucket
    }

    func checkAttrEmail(oomWhenAdd: (Option<CachedKeysValuesBucket>) -> Bool, attrs: ContactAttributes): Bool {
        if (attrs.has(ATTR_EMAIL)) {
            for (one in this.emails) {
                if (oomWhenAdd(one.asValuesBucket())) {
                    return true
                }
            }
        }
        return false
    }

    func checkAttrContactEvent(oomWhenAdd: (Option<CachedKeysValuesBucket>) -> Bool, attrs: ContactAttributes): Bool {
        if (attrs.has(ATTR_CONTACT_EVENT)) {
            for (one in this.events) {
                if (oomWhenAdd(one.asValuesBucket())) {
                    return true
                }
            }
        }
        return false
    }

    func checkAttrGroupMembership(oomWhenAdd: (Option<CachedKeysValuesBucket>) -> Bool, attrs: ContactAttributes): Bool {
        if (attrs.has(ATTR_GROUP_MEMBERSHIP)) {
            for (one in this.groups) {
                if (oomWhenAdd(one.asValuesBucket())) {
                    return true
                }
            }
        }
        return false
    }

    func checkAttrIm(oomWhenAdd: (Option<CachedKeysValuesBucket>) -> Bool, attrs: ContactAttributes): Bool {
        if (attrs.has(ATTR_IM)) {
            for (one in this.imAddresses) {
                if (oomWhenAdd(one.asValuesBucket())) {
                    return true
                }
            }
        }
        return false
    }

    func checkAttrPortrait(oomWhenAdd: (Option<CachedKeysValuesBucket>) -> Bool, attrs: ContactAttributes): Bool {
        if (attrs.has(ATTR_PORTRAIT)) {
            if (oomWhenAdd(this.portrait.asValuesBucket())) {
                return true
            }
        }
        return false
    }

    func checkAttrPhone(oomWhenAdd: (Option<CachedKeysValuesBucket>) -> Bool, attrs: ContactAttributes): Bool {
        if (attrs.has(ATTR_PHONE)) {
            for (one in this.phoneNumbers) {
                if (oomWhenAdd(one.asValuesBucket())) {
                    return true
                }
            }
        }
        return false
    }

    func checkAttrPostalAddress(oomWhenAdd: (Option<CachedKeysValuesBucket>) -> Bool, attrs: ContactAttributes): Bool {
        if (attrs.has(ATTR_POSTAL_ADDRESS)) {
            for (one in this.postalAddresses) {
                if (oomWhenAdd(one.asValuesBucket())) {
                    return true
                }
            }
        }
        return false
    }

    func checkAttrRelation(oomWhenAdd: (Option<CachedKeysValuesBucket>) -> Bool, attrs: ContactAttributes): Bool {
        if (attrs.has(ATTR_RELATION)) {
            for (one in this.relations) {
                if (oomWhenAdd(one.asValuesBucket())) {
                    return true
                }
            }
        }
        return false
    }

    func checkAttrSipAddress(oomWhenAdd: (Option<CachedKeysValuesBucket>) -> Bool, attrs: ContactAttributes): Bool {
        if (attrs.has(ATTR_SIP_ADDRESS)) {
            for (one in this.sipAddresses) {
                if (oomWhenAdd(one.asValuesBucket())) {
                    return true
                }
            }
        }
        return false
    }

    func checkAttrWebSite(oomWhenAdd: (Option<CachedKeysValuesBucket>) -> Bool, attrs: ContactAttributes): Bool {
        if (attrs.has(ATTR_WEBSITE)) {
            for (one in this.websites) {
                if (oomWhenAdd(one.asValuesBucket())) {
                    return true
                }
            }
        }
        return false
    }

    func checkAttrName(oomWhenAdd: (Option<CachedKeysValuesBucket>) -> Bool, attrs: ContactAttributes): Bool {
        if (attrs.has(ATTR_NAME)) {
            if (oomWhenAdd(this.name.asValuesBucket())) {
                return true
            }
        }
        return false
    }

    func checkAttrNickName(oomWhenAdd: (Option<CachedKeysValuesBucket>) -> Bool, attrs: ContactAttributes): Bool {
        if (attrs.has(ATTR_NICKNAME)) {
            if (oomWhenAdd(this.nickName.asValuesBucket())) {
                return true
            }
        }
        return false
    }

    func checkAttrNote(oomWhenAdd: (Option<CachedKeysValuesBucket>) -> Bool, attrs: ContactAttributes): Bool {
        if (attrs.has(ATTR_NOTE)) {
            if (oomWhenAdd(this.note.asValuesBucket())) {
                return true
            }
        }
        return false
    }

    func checkAttrOrganization(oomWhenAdd: (Option<CachedKeysValuesBucket>) -> Bool, attrs: ContactAttributes): Bool {
        if (attrs.has(ATTR_ORGANIZATION)) {
            if (oomWhenAdd(this.organization.asValuesBucket())) {
                return true
            }
        }
        return false
    }

    func arrayCachedKeysValuesBucketFree(allocatedBuckets: ArrayList<CachedKeysValuesBucket>) {
        for (b in allocatedBuckets) {
            b.free()
        }
        allocatedBuckets.clear()
    }

    func checkContactAttributes(attrs: ContactAttributes, allocatedBuckets: ArrayList<CachedKeysValuesBucket>): Bool {
        let oomWhenAddOrFree: (Option<CachedKeysValuesBucket>) -> Bool = {
            ob => match (ob) {
                case Some(bucket) =>
                    if (!bucket.isEmpty()) {
                        allocatedBuckets.add(bucket)
                    };
                    false
                case None =>
                    arrayCachedKeysValuesBucketFree(allocatedBuckets)
                    true
            }
        }

        let checkFuncArr = [
            checkAttrEmail,
            checkAttrContactEvent,
            checkAttrGroupMembership,
            checkAttrIm,
            checkAttrPortrait,
            checkAttrPhone,
            checkAttrPostalAddress,
            checkAttrRelation,
            checkAttrSipAddress,
            checkAttrWebSite,
            checkAttrName,
            checkAttrNickName,
            checkAttrNote,
            checkAttrOrganization
        ]

        for (f in checkFuncArr) {
            if (f(oomWhenAddOrFree, attrs)) {
                return false
            }
        }
        true
    }

    func asCContactDataProc(allocatedBuckets: ArrayList<CachedKeysValuesBucket>, allocatedCount: Int64,
        valuesBucketArray: CPointer<CachedKeysValuesBucket>): CPointer<CContactData> {
        unsafe {
            let contactData: CPointer<CContactData> = calloc<CContactData>()
            if (contactData.isNull()) {
                LOG.error("Contact.asCContactData: failed to allocate contactData.")
                arrayCachedKeysValuesBucketFree(allocatedBuckets)
                LibC.free(valuesBucketArray)
                return CContactData.NULL
            } else {
                for (i in 0..allocatedCount) {
                    valuesBucketArray.write(i, allocatedBuckets[i])
                }
                let data = CContactData(valuesBucketArray, allocatedCount)
                contactData.write(0, data)
                return contactData
            }
        }
    }

    func asCContactData(attrs!: ContactAttributes = ContactAttributes.ALL): CPointer<CContactData> {
        let allocatedBuckets = ArrayList<CachedKeysValuesBucket>()
        let check = checkContactAttributes(attrs, allocatedBuckets)
        if (!check) {
            return CContactData.NULL
        }

        let allocatedCount = allocatedBuckets.size
        let valuesBucketArray: CPointer<CachedKeysValuesBucket> = unsafe {
            calloc<CachedKeysValuesBucket>(count: allocatedCount)
        }
        if (valuesBucketArray.isNull() || allocatedCount == 0) {
            LOG.error("Faield to allocate buckets array at asCContactData")
            arrayCachedKeysValuesBucketFree(allocatedBuckets)
            return CContactData.NULL
        }

        return asCContactDataProc(allocatedBuckets, allocatedCount, valuesBucketArray)
    }
}

/**
 * Defines a contact's portrait.
 *
 * @syscap SystemCapability.Applications.ContactsData
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public struct Portrait {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public Portrait(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public let uri: String
    ) {}
    func asValuesBucket(): Option<CachedKeysValuesBucket> {
        singleStringAsValuesBucket("photo", {=> this.uri})
    }
}

/**
 * Defines a contact's website.
 *
 * @syscap SystemCapability.Applications.ContactsData
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public struct Website {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public Website(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public let website: String
    ) {}
    func asValuesBucket(): Option<CachedKeysValuesBucket> {
        singleStringAsValuesBucket("website", {=> this.website})
    }
}

/**
 * Defines a contact's nickName.
 *
 * @syscap SystemCapability.Applications.ContactsData
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public struct NickName {
    static let EMPTY = NickName("")
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public NickName(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public let nickName: String
    ) {}
    func asValuesBucket(): Option<CachedKeysValuesBucket> {
        singleStringAsValuesBucket("nickname", {=> this.nickName})
    }
}

/**
 * Defines a contact's note.
 *
 * @syscap SystemCapability.Applications.ContactsData
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public struct Note {
    static let EMPTY = Note("")
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public Note(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public let noteContent: String
    ) {}
    func asValuesBucket(): Option<CachedKeysValuesBucket> {
        singleStringAsValuesBucket("note", {=> this.noteContent})
    }
}

/**
 * Defines the contact selection options.
 *
 * @syscap SystemCapability.Applications.ContactsData
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public class ContactSelectOptions {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public ContactSelectOptions(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var isMultiSelect!: Bool = false
    ) {}
}
