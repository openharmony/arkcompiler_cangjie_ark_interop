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

import ohos.base.*
import ohos.labels.*
import ohos.values_bucket.ValueType
import std.collection.ArrayList
import std.convert.Parsable
import ohos.data_share_predicates.DataSharePredicates as DSPredicates

/**
 * Defines an application that creates the contact.
 *
 * @syscap SystemCapability.Applications.ContactsData
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.ContactsData"
]
public struct Holder {
    static const INVALID_HOLDER_ID: Int64 = -1
    static const BUNDLE_NAME_DEFAULT: String = "com.ohos.contacts"
    static let EMPTY: Holder = Holder("", INVALID_HOLDER_ID, bundleName: "")

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.ContactsData"
    ]
    public Holder(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var displayName: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var holderId: Int64,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Applications.ContactsData"
        ]
        public var bundleName!: String = BUNDLE_NAME_DEFAULT
    ) {}

    static func fromValuesBucket(bucket: CachedKeysValuesBucket): Holder {
        var displayName: String = ""
        var holderId: Int64 = INVALID_HOLDER_ID
        var bundleName: String = BUNDLE_NAME_DEFAULT
        for (i in 0..bucket.size) {
            let keyCStr: CString = unsafe { bucket.key.read(i) }
            let valCValue: CValueType = unsafe { bucket.value.read(i) }
            if (CS_DETAIL_INFO.getOrThrow().equals(keyCStr)) {
                displayName = createStrFromCPointer(valCValue.string)
            } else if (CS_CUSTOM_DATA.getOrThrow().equals(keyCStr)) {
                if (valCValue.string.isNotNull()) {
                    bundleName = createStrFromCPointer(valCValue.string)
                } else {
                    LOG.warn(
                        "Holder.fromValuesBucket sees null pointer for custom_data, bundleName is set to the default")
                    bundleName = BUNDLE_NAME_DEFAULT
                }
            } else if (CS_EXTEND7.getOrThrow().equals(keyCStr)) {
                holderId = valCValue.integer
            }
        }

        Holder(displayName, holderId, bundleName: bundleName)
    }

    // when Holder is not empty, it produces non-trivial Predicates
    // this func is needed while DSPredicates has no API like isEmpty
    func isEmpty(): Bool {
        this.holderId > 0 || this.bundleName.size > 0 || this.displayName.size > 0
    }

    static const STR_ACCOUNT_TYPE: String = "account_type"
    static const STR_ACCOUNT_NAME: String = "account_name"
    static const STR_ACCOUNT_ID: String = "account_id"

    // use this `passedPredsAreNotEmpty` while DSPredicates has no API like isEmpty
    func asPredicates(): DSPredicates {
        appendToPredicates(DSPredicates(), passedPredsAreNotEmpty: false)
    }
    func appendToPredicates(predicates: DSPredicates, passedPredsAreNotEmpty!: Bool = true): DSPredicates {
        var needAnd = passedPredsAreNotEmpty

        if (this.bundleName.size > 0) {
            if (needAnd) {
                predicates.and()
            } else {
                needAnd = true
            }
            predicates.equalTo(STR_ACCOUNT_TYPE, ValueType.Str(this.bundleName))
        }
        if (this.displayName.size > 0) {
            if (needAnd) {
                predicates.and()
            } else {
                needAnd = true
            }
            predicates.equalTo(STR_ACCOUNT_NAME, ValueType.Str(this.displayName))
        }
        if (this.holderId > 0) {
            if (needAnd) {
                predicates.and()
            } else {
                needAnd = true
            }
            predicates.equalTo(STR_ACCOUNT_ID, ValueType.Str("${this.holderId}"))
        }

        predicates
    }
}
