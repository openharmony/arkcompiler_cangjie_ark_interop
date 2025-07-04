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

import std.collection.HashMap
import ohos.ability.UIAbilityContext as Context
import ohos.ability.AbilityResult
import ohos.ability.StartOptions
import ohos.ability.Want
import ohos.ability.WindowMode
import ohos.base.*
import ohos.encoding.json.*
import ohos.data_share_predicates.DataSharePredicates as DSPredicates
import ohos.labels.*
import ohos.values_bucket.ValueType

let ERR_MESSAGES: HashMap<Int32, String> = HashMap<Int32, String>(
    [(ERR_NO_PERMISSION, "Permission denied."), (ERR_PARAMETER_ERROR, "Parameter error.")])
const SELECT_CONTACTS_ABILITY_NAME = "com.ohos.contacts.MainAbility"
const SELECT_CONTACTS_BUNDLE_NAME = "com.ohos.contacts"
const STR_IS_DELETED: String = "is_deleted"
const STR_QUICK_SEARCH_KEY: String = "quick_search_key"

/*
 * Adds a contact.
 *
 * @param { Context } context   Application context.
 * @param { Contact } contact   Contact information.
 * @returns { Int64 } ID of added contact or INVALID_CONTACT_ID when failed.
 *
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: Mandatory parameters are left unspecified.
 * @syscap SystemCapability.Applications.ContactsData
 * @brief static addContact(context: Context, contact: Contact): Int64
 */
@!APILevel[
    19,
    atomicservice: true,
    permission: "ohos.permission.WRITE_CONTACTS",
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public func addContact(context: Context, contact: Contact): Int64 {
    if (!CACHE_IS_READY) {
        throw IllegalMemoryException("Out of memory.")
    }
    unsafe {
        let cRawContact = contact.asCRawContact()
        if (cRawContact.isNull()) {
            throw IllegalMemoryException("Out of memory.")
        }

        let cContactData = contact.asCContactData()
        if (cContactData.isNull()) {
            cRawContact.read(0).free()
            LibC.free(cRawContact)
            throw IllegalMemoryException("Out of memory.")
        }

        var code: Int32 = 0
        let contactID: Int64 = FfiOHOSContactAddContact(context.getID(), cRawContact, cContactData, inout code)

        cRawContact.read(0).free()
        LibC.free(cRawContact)

        releaseCData(cContactData, alsoFreeKeysContent: false)

        throwIfError("Contact.addContact", code)

        contactID
    }
}

/*
 * Deletes a contact based on the specified contact key.
 *
 * @param { Context } context   Application context.
 * @param { String }  key       Unique query key of a contact. One contact corresponds to one key.
 *
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: Mandatory parameters are left unspecified.
 * @syscap SystemCapability.Applications.ContactsData
 * @brief static deleteContact(context: Context, key: String): Unit
 */
@!APILevel[
    19,
    permission: "ohos.permission.WRITE_CONTACTS",
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public func deleteContact(context: Context, key: String): Unit {
    if (!CACHE_IS_READY) {
        throw IllegalMemoryException("Out of memory.")
    }
    unsafe {
        let predicatesId = DSPredicates().equalTo(STR_IS_DELETED, ValueType.Str("0")).and().equalTo(
            STR_QUICK_SEARCH_KEY, ValueType.Str(key)).getID()

        var code: Int32 = 0
        FfiOHOSContactDeleteContact(context.getID(), predicatesId, inout code)

        throwIfError("Contact.deleteContact", code)
    }
}

/*
 * Updates a contact based on the specified contact information.
 *
 * @param { Context } context   Application context.
 * @param { Contact } contact   Contact information.
 * @param {ContactAttributes}   Optional parameter to specify the list of attributes to be updated.
 *
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: Mandatory parameters are left unspecified.
 * @syscap SystemCapability.Applications.ContactsData
 * @brief static updateContact(context: Context, contact: Contact, attrs!: ContactAttributes = ContactAttributes.ALL): Unit
 */
@!APILevel[
    19,
    permission: "ohos.permission.WRITE_CONTACTS",
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public func updateContact(context: Context, contact: Contact, attrs!: ContactAttributes = ContactAttributes.ALL): Unit {
    if (!CACHE_IS_READY) {
        throw IllegalMemoryException("Out of memory.")
    }
    unsafe {
        if (contact.id == Contact.INVALID_CONTACT_ID) {
            throw BusinessException(ERR_PARAMETER_ERROR, ERR_MESSAGES[ERR_PARAMETER_ERROR])
        }

        let predicatesId = attrs.asPredicates().getID()

        let cContactData = contact.asCContactData(attrs: attrs)
        if (cContactData.isNull()) {
            throw IllegalMemoryException("Out of memory.")
        }

        var code: Int32 = 0
        FfiOHOSContactUpdateContact(context.getID(), contact.id, cContactData, predicatesId, inout code)

        releaseCData(cContactData, alsoFreeKeysContent: false)

        throwIfError("Contact.updateContact", code)
    }
}

/*
 * Checks whether the ID of this contact is in the local address book.
 *
 * @param { Context } context   Application context.
 * @param { Int64   } id        Contact ID.
 * @returns { Bool } The value true indicates that the contact ID is in the local phonebook, and the value false indicates the opposite.
 *
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: Mandatory parameters are left unspecified.
 * @syscap SystemCapability.Applications.ContactsData
 * @brief static isLocalContact(context: Context, id: Int64): Bool
 */
@!APILevel[
    19,
    permission: "ohos.permission.READ_CONTACTS",
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public func isLocalContact(context: Context, id: Int64): Bool {
    if (!CACHE_IS_READY) {
        throw IllegalMemoryException("Out of memory.")
    }
    unsafe {
        var code: Int32 = 0
        let isLocal: Bool = FfiOHOSContactIsLocalContact(context.getID(), id, inout code)

        throwIfError("Contact.isLocal", code)

        isLocal
    }
}

/*
 * Checks whether a contact is included in my card.
 *
 * @param { Context } context   Application context.
 * @param { Int64   } id        Contact ID.
 * @returns { Bool } The value true indicates that the contact is included in my card, and the value false indicates the opposite.
 *
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: Mandatory parameters are left unspecified.
 * @syscap SystemCapability.Applications.ContactsData
 * @brief static isMyCard(context: Context, id: Int64): Bool
 */
@!APILevel[
    19,
    permission: "ohos.permission.READ_CONTACTS",
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public func isMyCard(context: Context, id: Int64): Bool {
    if (!CACHE_IS_READY) {
        throw IllegalMemoryException("Out of memory.")
    }
    unsafe {
        var code: Int32 = 0
        let isMyCard: Bool = FfiOHOSContactIsMyCard(context.getID(), id, inout code)

        throwIfError("Contact.isMyCard", code)

        isMyCard
    }
}

/*
 * Queries my card.
 *
 * @param { Context } context   Application context.
 * @param {ContactAttributes}   Optional parameter to specify the list of attributes to be updated.
 * @returns { Contact }  If the operation is successful, information about my card is returned.
 *
 * @throws { BusinessException } err - The operation failed with code `err`.
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: Mandatory parameters are left unspecified.
 * @syscap SystemCapability.Applications.ContactsData
 * @brief static queryMyCard(context: Context, attrs!: ContactAttributes = ContactAttributes.ALL): Contact
 */
@!APILevel[
    19,
    permission: "ohos.permission.READ_CONTACTS",
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public func queryMyCard(context: Context, attrs!: ContactAttributes = ContactAttributes.ALL): Contact {
    if (!CACHE_IS_READY) {
        throw IllegalMemoryException("Out of memory.")
    }
    unsafe {
        let predicates = DSPredicates().equalTo("is_deleted", ValueType.Str("0"))
        let predicatesId = attrs.appendToPredicates(predicates).getID()

        var code: Int32 = 0
        let cContactsData: CPointer<CContactsData> = FfiOHOSContactQueryMyCard(
            context.getID(),
            predicatesId,
            inout code
        )

        throwIfError("Contact.queryMyCard", code, releaser: {=> releaseCData(cContactsData)})

        let count = if (cContactsData.isNull()) {
            LOG.error("Contact.queryMyCard returned pointer is null");
            -1
        } else {
            cContactsData.read(0).contactsCount
        }
        LOG.info("Contact.queryMyCard returned ${count} contact")
        if (count <= 0) {
            releaseCData(cContactsData)
            throw BusinessException(ERR_PARAMETER_ERROR, ERR_MESSAGES[ERR_PARAMETER_ERROR])
        }

        let cContactData: CContactData = cContactsData.read(0).contacts.read(0)
        let contact = Contact.fromCContactData(cContactData)

        // do free keys, as they are allocated at native, so - not cached
        releaseCData(cContactsData)

        contact
    }
}

/*
 * Queries a contact based on the specified key, holder, and attributes.
 *
 * @param { Context }           context     Application context.
 * @param { String  }           key         Contact key. Each contact corresponds to one key.
 * @param { Holder  }           holder      Application that creates the contacts.
 * @param { ContactAttributes } attrs       List of contact attributes.
 * @returns { Contact } If the operation is successful, the queried contact is returned.
 *
 * @throws { BusinessException } err - The operation failed with code `err`.
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: Mandatory parameters are left unspecified.
 * @syscap SystemCapability.Applications.ContactsData
 * @brief static queryContact(context: Context, key: String, holder!: Holder = Holder.EMPTY, attrs!: ContactAttributes = ContactAttributes.ALL): Contact
 */
@!APILevel[
    19,
    permission: "ohos.permission.READ_CONTACTS",
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public func queryContact(context: Context, key: String, holder!: Holder = Holder.EMPTY,
    attrs!: ContactAttributes = ContactAttributes.ALL): Contact {
    if (!CACHE_IS_READY) {
        throw IllegalMemoryException("Out of memory.")
    }
    unsafe {
        let predicates = DSPredicates().equalTo("is_deleted", ValueType.Str("0")).and().equalTo("quick_search_key",
            ValueType.Str(key))
        holder.appendToPredicates(predicates)
        attrs.appendToPredicates(predicates)
        let predicatesId = predicates.getID()

        var code: Int32 = 0
        let cContactsData: CPointer<CContactsData> = FfiOHOSContactQueryContacts(context.getID(), predicatesId,
            inout code)

        throwIfError("Contact.queryContact", code, releaser: {=> releaseCData(cContactsData)})

        let count = if (cContactsData.isNull()) {
            -1
        } else {
            cContactsData.read(0).contactsCount
        }
        if (count <= 0) {
            releaseCData(cContactsData)
            throw BusinessException(ERR_PARAMETER_ERROR, ERR_MESSAGES[ERR_PARAMETER_ERROR])
        }

        // count > 1 is not treated as error, just take the first one
        let cContactData: CContactData = cContactsData.read(0).contacts.read(0)
        let contact = Contact.fromCContactData(cContactData)

        // do free keys, as they are allocated at native, so - not cached
        releaseCData(cContactsData)

        contact
    }
}

/*
 * Queries contacts based on the specified holder and attributes.
 *
 * @param { Context }           context     Application context.
 * @param { Holder  }           holder      Application that creates the contacts.
 * @param { ContactAttributes } attrs       List of contact attributes.
 * @returns { Array<Contact> } If the operation is successful, an array of queried contacts is returned.
 *
 * @throws { BusinessException } err - The operation failed with code `err`.
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: Mandatory parameters are left unspecified.
 * @syscap SystemCapability.Applications.ContactsData
 * @brief static queryContacts(context: Context, holder!: Holder = Holder.EMPTY, attrs!: ContactAttributes = ContactAttributes.ALL): Array<Contact>
 */
@!APILevel[
    19,
    permission: "ohos.permission.READ_CONTACTS",
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public func queryContacts(
    context: Context,
    holder!: Holder = Holder.EMPTY,
    attrs!: ContactAttributes = ContactAttributes.ALL
): Array<Contact> {
    if (!CACHE_IS_READY) {
        throw IllegalMemoryException("Out of memory.")
    }
    unsafe {
        let predicates = DSPredicates().equalTo("is_deleted", ValueType.Str("0"))
        holder.appendToPredicates(predicates)
        attrs.appendToPredicates(predicates)
        let predicatesId = predicates.getID()

        var code: Int32 = 0
        let cContactsData: CPointer<CContactsData> = FfiOHOSContactQueryContacts(context.getID(), predicatesId,
            inout code)

        throwIfError("Contact.queryContacts", code, releaser: {=> releaseCData(cContactsData)})

        let count = if (cContactsData.isNull()) {
            0
        } else {
            cContactsData.read(0).contactsCount
        }
        if (count < 0) {
            releaseCData(cContactsData)
            throw BusinessException(ERR_PARAMETER_ERROR, ERR_MESSAGES[ERR_PARAMETER_ERROR])
        }

        let contactsArray = Array<Contact>(count,
            {
                i => Contact.fromCContactData(cContactsData.read(0).contacts.read(i))
            })

        // do free keys, as they are allocated at native, so - not cached
        releaseCData(cContactsData)

        contactsArray
    }
}

/*
 * Queries a contact based on the specified email, holder, and attributes
 *
 * @param { Context }           context     Application context.
 * @param { String  }           email       Email address of the contact.
 * @param { Holder  }           holder      Application that creates the contacts.
 * @param { ContactAttributes } attrs       List of contact attributes.
 * @returns { Array<Contact> } If the operation is successful, an array of queried contacts is returned.
 *
 * @throws { BusinessException } err - The operation failed with code `err`.
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: Mandatory parameters are left unspecified.
 * @syscap SystemCapability.Applications.ContactsData
 * @brief static queryContactsByEmail(context: Context, email: String, holder!: Holder = Holder.EMPTY, attrs!: ContactAttributes = ContactAttributes.ALL): Array<Contact>
 */
@!APILevel[
    19,
    permission: "ohos.permission.READ_CONTACTS",
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public func queryContactsByEmail(context: Context, email: String, holder!: Holder = Holder.EMPTY,
    attrs!: ContactAttributes = ContactAttributes.ALL): Array<Contact> {
    if (!CACHE_IS_READY) {
        throw IllegalMemoryException("Out of memory.")
    }
    unsafe {
        let predicates = DSPredicates().equalTo("is_deleted", ValueType.Str("0")).equalTo("detail_info",
            ValueType.Str(email)).and().equalTo("content_type", ValueType.Str("email"))
        holder.appendToPredicates(predicates)
        attrs.appendToPredicates(predicates)
        let predicatesId = predicates.getID()

        var code: Int32 = 0
        let cContactsData: CPointer<CContactsData> = FfiOHOSContactQueryContacts(context.getID(), predicatesId,
            inout code)

        throwIfError("Contact.queryContactsByEmail", code, releaser: {=> releaseCData(cContactsData)})

        let count = if (cContactsData.isNull()) {
            0
        } else {
            cContactsData.read(0).contactsCount
        }
        if (count < 0) {
            releaseCData(cContactsData)
            throw BusinessException(ERR_PARAMETER_ERROR, ERR_MESSAGES[ERR_PARAMETER_ERROR])
        }

        let contactsArray = Array<Contact>(count,
            {
                i => Contact.fromCContactData(cContactsData.read(0).contacts.read(i))
            })

        // do free keys, as they are allocated at native, so - not cached
        releaseCData(cContactsData)

        contactsArray
    }
}

/*
 * Queries a contact based on the specified phone number, holder, and attributes
 *
 * @param { Context }           context     Application context.
 * @param { String  }           phoneNumber Phone number of the contacts.
 * @param { Holder  }           holder      Application that creates the contacts.
 * @param { ContactAttributes } attrs       List of contact attributes.
 * @returns { Array<Contact> } If the operation is successful, an array of queried contacts is returned.
 *
 * @throws { BusinessException } err - The operation failed with code `err`.
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: Mandatory parameters are left unspecified.
 * @syscap SystemCapability.Applications.ContactsData
 * @brief static queryContactsByPhoneNumber(context: Context, phoneNumber: String, holder!: Holder = Holder.EMPTY, attrs!: ContactAttributes = ContactAttributes.ALL): Array<Contact>
 */
@!APILevel[
    19,
    permission: "ohos.permission.READ_CONTACTS",
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public func queryContactsByPhoneNumber(context: Context, phoneNumber: String, holder!: Holder = Holder.EMPTY,
    attrs!: ContactAttributes = ContactAttributes.ALL): Array<Contact> {
    if (!CACHE_IS_READY) {
        throw IllegalMemoryException("Out of memory.")
    }
    unsafe {
        let predicates = DSPredicates().equalTo("is_deleted", ValueType.Str("0")).equalTo("detail_info",
            ValueType.Str(phoneNumber)).and().equalTo("content_type", ValueType.Str("phone"))
        holder.appendToPredicates(predicates)
        attrs.appendToPredicates(predicates)
        let predicatesId = predicates.getID()

        var code: Int32 = 0
        let cContactsData: CPointer<CContactsData> = FfiOHOSContactQueryContacts(context.getID(), predicatesId,
            inout code)

        throwIfError("Contact.queryContactsByPhoneNumber", code, releaser: {=> releaseCData(cContactsData)})

        let count = if (cContactsData.isNull()) {
            0
        } else {
            cContactsData.read(0).contactsCount
        }
        if (count < 0) {
            releaseCData(cContactsData)
            throw BusinessException(ERR_PARAMETER_ERROR, ERR_MESSAGES[ERR_PARAMETER_ERROR])
        }

        let contactsArray = Array<Contact>(count,
            {
                i => Contact.fromCContactData(cContactsData.read(0).contacts.read(i))
            })

        // do free keys, as they are allocated at native, so - not cached
        releaseCData(cContactsData)

        contactsArray
    }
}

/*
 * Queries all groups of this contact based on the specified holder.
 *
 * @param { Context } context   Application context.
 * @param { Holder  }           holder      Application that creates the contacts.
 * @returns { Array<Group> }    If the operation is successful, an array of the queried applications is returned.
 *
 * @throws { BusinessException } err - The operation failed with code `err`.
 * @syscap SystemCapability.Applications.ContactsData
 * @brief static queryGroups(context: Context, holder!: Holder = Holder.EMPTY): Array<Group>
 */
@!APILevel[
    19,
    permission: "ohos.permission.READ_CONTACTS",
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public func queryGroups(context: Context, holder!: Holder = Holder.EMPTY): Array<Group> {
    if (!CACHE_IS_READY) {
        throw IllegalMemoryException("Out of memory.")
    }
    unsafe {
        let predicates = DSPredicates().equalTo("is_deleted", ValueType.Str("0"))
        let predicatesId = holder.appendToPredicates(predicates).getID()

        var code: Int32 = 0
        let cGroupsData: CPointer<CGroups> = FfiOHOSContactQueryGroups(context.getID(), predicatesId, inout code)

        throwIfError("Contact.queryGroups", code, releaser: {=> releaseCData(cGroupsData)})

        let totalGroups = if (cGroupsData.isNotNull()) {
            cGroupsData.read(0).bucketCount
        } else {
            0
        }

        let groupsArray = Array<Group>(
            totalGroups,
            {
                i =>
                let bucket = cGroupsData.read(0).data.read(i)
                Group.fromValuesBucket(bucket)
            }
        )

        // do free keys, as they are allocated at native, so - not cached
        releaseCData(cGroupsData)

        groupsArray
    }
}

/*
 * Queries all applications that have created contacts.
 *
 * @param { Context } context   Application context.
 * @returns { Array<Holder> }   If the operation is successful, an array of the queried applications is returned.
 *
 * @throws { BusinessException } err - The operation failed with code `err`.
 * @syscap SystemCapability.Applications.ContactsData
 * @brief static queryHolders(context: Context): Array<Holder>
 */
@!APILevel[
    19,
    permission: "ohos.permission.READ_CONTACTS",
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public func queryHolders(context: Context): Array<Holder> {
    if (!CACHE_IS_READY) {
        throw IllegalMemoryException("Out of memory.")
    }

    var code: Int32 = 0
    let cHoldersData: CPointer<CHolders> = unsafe { FfiOHOSContactQueryHolders(context.getID(), inout code) }

    throwIfError("Contact.queryHolders", code, releaser: {=> releaseCData(cHoldersData)})

    let totalHolders = if (cHoldersData.isNotNull()) {
        unsafe { cHoldersData.read(0).bucketCount }
    } else {
        0
    }

    let holdersArray = Array<Holder>(
        totalHolders,
        {
            i =>
            let bucket = unsafe { cHoldersData.read(0).data.read(i) }
            Holder.fromValuesBucket(bucket)
        }
    )

    // do free keys, as they are allocated at native, so - not cached
    unsafe { releaseCData(cHoldersData) }

    holdersArray
}

/*
 * Queries the key of a contact based on the specified contact ID and holder.
 *
 * @param { Context } context   Application context.
 * @param { Int64   } id        Contact ID.
 * @param { Holder  } holder    Application that creates the contacts.
 * @returns { String }  If the operation is successful, the key of the queried contact is returned.
 *
 * @throws { BusinessException } err - The operation failed with code `err`.
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: Mandatory parameters are left unspecified.
 * @syscap SystemCapability.Applications.ContactsData
 * @brief static queryMyCard(context: Context, attrs!: ContactAttributes = ContactAttributes.ALL): String
 */
@!APILevel[
    19,
    permission: "ohos.permission.READ_CONTACTS",
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public func queryKey(context: Context, id: Int64, holder!: Holder = Holder.EMPTY): String {
    if (!CACHE_IS_READY) {
        throw IllegalMemoryException("Out of memory.")
    }
    unsafe {
        let predicates = DSPredicates().equalTo("is_deleted", ValueType.Str("0")).and().equalTo("contact_id",
            ValueType.Str(id.toString()))
        let predicatesId = holder.appendToPredicates(predicates).getID()

        var code: Int32 = 0
        let cContactsData: CPointer<CContactsData> = FfiOHOSContactQueryContacts(context.getID(), predicatesId,
            inout code)

        throwIfError("Contact.queryKeyfailed", code, releaser: {=> releaseCData(cContactsData)})

        let count = if (cContactsData.isNull()) {
            LOG.error("Contact.queryKey cContactsData is null");
            -1
        } else {
            cContactsData.read(0).contactsCount
        }
        if (count <= 0) {
            releaseCData(cContactsData)
            LOG.error("Contact.queryKey cContactsData.contactsCount is ${count}");
            throw BusinessException(ERR_PARAMETER_ERROR, ERR_MESSAGES[ERR_PARAMETER_ERROR])
        } else if (count != 1) {
            LOG.warn("Contact.queryKey cContactsData.contactsCount is ${count}");
        }

        let cContactData: CContactData = cContactsData.read(0).contacts.read(0)
        let contact = Contact.fromCContactData(cContactData)

        // do free keys, as they are allocated at native, so - not cached
        releaseCData(cContactsData)

        contact.key
    }
}

/*
 * Selects contacts.
 *
 * @param { Context }                       context     Application context.
 * @param { AsyncCallback<Array<Contact>> } callback    Callback used to return the result. If the operation
 *                                                      is successful, an array of selected contacts is returned.
 *                                                      If the operation fails, an error code is returned.
 * @param { ContactSelectOptions }          options     Contact selection options.
 *
 * @throws { BusinessException } err - The operation failed with code `err`.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: Mandatory parameters are left unspecified.
 * @syscap SystemCapability.Applications.ContactsData
 * @brief static selectContacts(context: Context, callback: AsyncCallback<Array<Contact>>, options!: ContactSelectOptions = ContactSelectOptions()): Unit
 */
@!APILevel[
    19,
    permission: "ohos.permission.READ_CONTACTS",
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public func selectContacts(
    context: Context,
    callback: AsyncCallback<Array<Contact>>,
    options!: ContactSelectOptions = ContactSelectOptions()
): Unit {
    let selectType = if (options.isMultiSelect) {
        "page_flag_multi_choose"
    } else {
        "page_flag_single_choose"
    }
    let wantType = if (options.isMultiSelect) {
        "multipleselect"
    } else {
        "singleselect"
    }
    let paramMap = HashMap<String, JsonValue>()
    paramMap.add("pageFlag", JsonString(selectType))
    paramMap.add("mime-type", JsonString(wantType))
    let want = Want(
        bundleName: SELECT_CONTACTS_BUNDLE_NAME,
        abilityName: SELECT_CONTACTS_ABILITY_NAME,
        parameters: JsonObject(paramMap).toString(),
        `type`: wantType
    )

    let extractContacts: (JsonValue) -> Array<Contact> = {
        json: JsonValue =>
        let contactsStr = json.asString().getValue()
        if (contactsStr.size > 0) {
            let contactsArr = JsonValue.fromStr(contactsStr).asArray()
            Array<Contact>(
                contactsArr.size(),
                {
                    i =>
                    let contactJson = contactsArr.get(i).getOrThrow().asObject()
                    // While contacts.MainAbility selects ony contacts with fullname and phone, it is OK to just getOrThrow
                    let fullName = contactJson.get("contactName").getOrThrow().asString().getValue()
                    let phone = contactJson.get("telephone").getOrThrow().asString().getValue()
                    let contact = Contact(name: Name(fullName: fullName))
                    contact.phoneNumbers.add(PhoneNumber(phone))
                    contact
                }
            )
        } else {
            Array<Contact>() // 0 contacts selected
        }
    }

    let abilityResultCallback = {
        errorCode: Option<AsyncError>, data: Option<AbilityResult> => match (errorCode) {
            case Some(e) => callback(errorCode, Array<Contact>())
            case _ => match (data) {
                case Some(value) =>
                    let resultPara = JsonValue.fromStr(value.want.parameters).asObject()
                    match (resultPara.get("contactObjects")) {
                        case Some(contactsJson) => callback(errorCode, extractContacts(contactsJson))
                        case None => callback(AsyncError(ERR_PARAMETER_ERROR), Array<Contact>())
                    }
                case _ => callback(errorCode, Array<Contact>())
            }
        }
    }

    context.startAbilityForResult(want, StartOptions(windowMode: WINDOW_MODE_FULLSCREEN), abilityResultCallback)
}

func throwIfError(whoFailed: String, errCode: Int32, releaser!: () -> Unit = {=> ()}) {
    releaser()
    if (errCode == ERR_NO_PERMISSION) {
        throw BusinessException(errCode, ERR_MESSAGES[errCode])
    } else if (errCode == ERR_PARAMETER_ERROR) {
        throw BusinessException(errCode, ERR_MESSAGES[errCode])
    } else if (errCode != 0) {
        throw exceptionForUnexpectedCode(whoFailed, errCode)
    }
}

func exceptionForUnexpectedCode(whoFailed: String, errCode: Int32): BusinessException {
    // log the errCode that comes from ffi
    LOG.error("${whoFailed} failed with code ${errCode}")
    // but throw it as a parameter error similar to ArkTS
    BusinessException(ERR_PARAMETER_ERROR, ERR_MESSAGES[ERR_PARAMETER_ERROR])
}

func releaseCData(cData: CPointer<CContactData>, alsoFreeKeysContent!: Bool = true): Unit {
    if (cData.isNotNull()) {
        unsafe {
            cData.read(0).free(alsoFreeKeysContent: alsoFreeKeysContent)
            LibC.free(cData)
        }
    }
}

func releaseCData(cContactsData: CPointer<CContactsData>, alsoFreeKeysContent!: Bool = true): Unit {
    if (cContactsData.isNotNull()) {
        unsafe {
            cContactsData.read(0).free(alsoFreeKeysContent: alsoFreeKeysContent)
            LibC.free(cContactsData)
        }
    }
}
