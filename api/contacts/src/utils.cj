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

import ohos.hilog.*
import std.collection.ArrayList
import ohos.labels.*
import ohos.base.*

let LOG = HilogChannel(0, 0xD001F09, "CJ-contacts")

@FastNative
foreign func strcmp(source: CPointer<UInt8>, target: CPointer<UInt8>): Int32

// Cached values for haevily used content type values
let CS_CT_ID = mallocCString("id")
let CS_CT_KEY = mallocCString("key")
let CS_CT_EMAIL = mallocCString("email")
let CS_CT_EVENT = mallocCString("contact_event")
let CS_CT_GROUP = mallocCString("group_membership")
let CS_CT_IM = mallocCString("im")
let CS_CT_PHOTO = mallocCString("photo")
let CS_CT_PHONE = mallocCString("phone")
let CS_CT_POST_ADDR = mallocCString("postal_address")
let CS_CT_RELATION = mallocCString("relation")
let CS_CT_SIP_ADDR = mallocCString("sip_address")
let CS_CT_WEBSITE = mallocCString("website")
let CS_CT_NAME = mallocCString("name")
let CS_CT_NICKNAME = mallocCString("nickname")
let CS_CT_NOTE = mallocCString("note")
let CS_CT_ORGANIZATION = mallocCString("organization")
let CS_CT_HOLDER = mallocCString("holder")
let CS_CT_CACHE_IS_READY = CS_CT_ID.isSome() && CS_CT_KEY.isSome() && CS_CT_EMAIL.isSome() && CS_CT_EVENT.isSome() &&
    CS_CT_GROUP.isSome() && CS_CT_IM.isSome() && CS_CT_PHOTO.isSome() && CS_CT_PHONE.isSome() && CS_CT_POST_ADDR
    .isSome() && CS_CT_RELATION.isSome() && CS_CT_SIP_ADDR.isSome() && CS_CT_WEBSITE.isSome() && CS_CT_NAME.isSome() &&
    CS_CT_NICKNAME.isSome() && CS_CT_NOTE.isSome() && CS_CT_ORGANIZATION.isSome() && CS_CT_HOLDER.isSome()

// Cached values for heavily used strings (keys in ValuesBucket)
let CS_CONTENT_TYPE = mallocCString("content_type")
let CS_DETAIL_INFO = mallocCString("detail_info")

// Email
let CS_ALIAS_DETAIL_INFO = mallocCString("alias_detail_info")
let CS_CUSTOM_DATA = mallocCString("custom_data")
let CS_EXTEND7 = mallocCString("extend7")

// RawContact
let CS_DISPLAY_NAME = mallocCString("display_name")
let CS_COMPANY = mallocCString("company")
let CS_POSITION = mallocCString("position")

// Name
let CS_ALPHA_NAME = mallocCString("alpha_name")
let CS_OTHER_LAN_LAST_NAME = mallocCString("other_lan_last_name")
let CS_OTHER_LAN_FIRST_NAME = mallocCString("other_lan_first_name")
let CS_FAMILY_NAME = mallocCString("family_name")
let CS_MIDDLE_NAME_PHONETIC = mallocCString("middle_name_phonetic")
let CS_GIVEN_NAME = mallocCString("given_name")
let CS_GIVEN_NAME_PHONETIC = mallocCString("given_name_phonetic")
let CS_PHONETIC_NAME = mallocCString("phonetic_name")

// Postal address
let CS_NEIGHBORHOOD = mallocCString("neighborhood")
let CS_POBOX = mallocCString("pobox")
let CS_POSTCODE = mallocCString("postcode")
let CS_REGION = mallocCString("region")
let CS_STREET = mallocCString("street")
let CS_CITY = mallocCString("city")
let CS_COUNTRY = mallocCString("country")

// Group
let CS_GROUP_NAME = mallocCString("group_name")
let CS_CACHE_IS_READY = CS_CONTENT_TYPE.isSome() && CS_DETAIL_INFO.isSome() && CS_CUSTOM_DATA.isSome() &&
    CS_EXTEND7.isSome() && CS_DISPLAY_NAME.isSome() && CS_COMPANY.isSome() && CS_POSITION.isSome() &&
    CS_ALPHA_NAME.isSome() && CS_OTHER_LAN_LAST_NAME.isSome() && CS_OTHER_LAN_FIRST_NAME.isSome() &&
    CS_FAMILY_NAME.isSome() && CS_MIDDLE_NAME_PHONETIC.isSome() && CS_GIVEN_NAME.isSome() &&
    CS_GIVEN_NAME_PHONETIC.isSome() && CS_PHONETIC_NAME.isSome() && CS_NEIGHBORHOOD.isSome() && CS_POBOX.isSome() &&
    CS_POSTCODE.isSome() && CS_REGION.isSome() && CS_STREET.isSome() && CS_CITY.isSome() && CS_COUNTRY.isSome() &&
    CS_GROUP_NAME.isSome()
let CACHE_IS_READY = CS_CT_CACHE_IS_READY && CS_CACHE_IS_READY

func equals(cString: Option<CString>, cValueType: CValueType): Bool {
    if (let Some(cStr) <- cString) {
        return equals(cStr, cValueType.string)
    }
    false
}

func equals(cString: Option<CString>, chars: CPointer<UInt8>): Bool {
    if (let Some(cStr) <- cString) {
        return equals(cStr, chars)
    }
    false
}

func equals(cString: CString, chars: CPointer<UInt8>): Bool {
    if (chars.isNull() || cString.isNull()) {
        return false
    }
    let cmpRet = unsafe { strcmp(cString.getChars(), chars) }
    return cmpRet == 0
}

// EMPTY bucket is returned for empty value produced by detail_info
func singleStringAsValuesBucket(content_type: String, detail_info: () -> String): Option<CachedKeysValuesBucket> {
    let valueString = detail_info()
    if (valueString.size > 0 && let Some(cContentTypeStr) <- CS_CONTENT_TYPE && let Some(cDetailInfoStr) <- CS_DETAIL_INFO) {
        CachedKeysValuesBucket.create([(cContentTypeStr, content_type), (cDetailInfoStr, valueString)])
    } else {
        CachedKeysValuesBucket.EMPTY
    }
}

func createStrFromCPointer(chars: CPointer<UInt8>): String {
    if (chars.isNotNull()) {
        CString(chars).toString()
    } else {
        LOG.error("createStrFromCPointer gets the null pointer, so it returns empty string")
        ""
    }
}

func detailInfoFromValuesBucket(bucket: CachedKeysValuesBucket): String {
    match (bucket.lookupKey(CS_DETAIL_INFO, reverse: true)) {
        case Some(cStr) => createStrFromCPointer(cStr.string)
        case None => ""
    }
}

func appendNonEmptyAttr(list: ArrayList<(CString, String)>, aKey: Option<CString>, aVal: String): Unit {
    if (aVal.size > 0 && let Some(cAKeyStr) <- aKey) {
        list.add((cAKeyStr, aVal))
    }
}
