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

package ohos.asset_store

import ohos.labels.*

/**
 * An enum type containing the data type definitions for Asset attribute value.
 *
 * @syscap SystemCapability.Security.Asset
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Asset"
]
public struct AssetTagType {
    /**
     * The data type of Asset attribute value is bool.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const BOOL: UInt32 = 0x01 << 28
    /**
     * The data type of Asset attribute value is uint32.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const NUMBER: UInt32 = 0x02 << 28
    /**
     * The data type of Asset attribute value is byte array.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const BYTES: UInt32 = 0x03 << 28
}

/**
 * An enum type containing the Asset attribute tags.
 *
 * @syscap SystemCapability.Security.Asset
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Asset"
]
public class AssetTag {
    /**
     * A tag whose value is a byte array indicating the sensitive user data such as passwords and tokens.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const SECRET: UInt32 = AssetTagType.BYTES | 0x01
    /**
     * A tag whose value is a byte array identifying an Asset.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const ALIAS: UInt32 = AssetTagType.BYTES | 0x02
    /**
     * A tag whose value is a 32-bit unsigned integer indicating when the Asset can be accessed.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const ACCESSIBILITY: UInt32 = AssetTagType.NUMBER | 0x03
    /**
     * A tag whose value is a bool indicating whether a screen lock password is required for the device.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const REQUIRE_PASSWORD_SET: UInt32 = AssetTagType.BOOL | 0x04
    /**
     * A tag whose value is a 32-bit unsigned integer indicating the user authentication type for Asset access control.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const AUTH_TYPE: UInt32 = AssetTagType.NUMBER | 0x05
    /**
     * A tag whose value is a 32-bit unsigned integer indicating the validity period in seconds of user authentication.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const AUTH_VALIDITY_PERIOD: UInt32 = AssetTagType.NUMBER | 0x06
    /**
     * A tag whose value is a byte array indicating the authentication challenge for anti-replay protection.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const AUTH_CHALLENGE: UInt32 = AssetTagType.BYTES | 0x07
    /**
     * A tag whose value is a byte array indicating the authentication token after a user is verified.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const AUTH_TOKEN: UInt32 = AssetTagType.BYTES | 0x08
    /**
     * A tag whose value is a 32-bit unsigned integer indicating the type of Asset synchronization.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const SYNC_TYPE: UInt32 = AssetTagType.NUMBER | 0x10
    /**
     * A tag whose value is a bool indicating whether Asset is stored persistently.
     * The permission needs to be verified only when this attribute is set in the {@link add} function.
     *
     * @permission ohos.permission.STORE_PERSISTENT_DATA
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const IS_PERSISTENT: UInt32 = AssetTagType.BOOL | 0x11
    /**
     * A tag whose value is a byte array indicating the first user-defined Asset data label (not allow to update).
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const DATA_LABEL_CRITICAL_1: UInt32 = AssetTagType.BYTES | 0x20
    /**
     * A tag whose value is a byte array indicating the second user-defined Asset data label (not allow to update).
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const DATA_LABEL_CRITICAL_2: UInt32 = AssetTagType.BYTES | 0x21
    /**
     * A tag whose value is a byte array indicating the third user-defined Asset data label (not allow to update).
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const DATA_LABEL_CRITICAL_3: UInt32 = AssetTagType.BYTES | 0x22
    /**
     * A tag whose value is a byte array indicating the fourth user-defined Asset data label (not allow to update).
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const DATA_LABEL_CRITICAL_4: UInt32 = AssetTagType.BYTES | 0x23
    /**
     * A tag whose value is a byte array indicating the first user-defined Asset data label (allow to update).
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const DATA_LABEL_NORMAL_1: UInt32 = AssetTagType.BYTES | 0x30
    /**
     * A tag whose value is a byte array indicating the second user-defined Asset data label (allow to update).
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const DATA_LABEL_NORMAL_2: UInt32 = AssetTagType.BYTES | 0x31
    /**
     * A tag whose value is a byte array indicating the third user-defined Asset data label (allow to update).
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const DATA_LABEL_NORMAL_3: UInt32 = AssetTagType.BYTES | 0x32
    /**
     * A tag whose value is a byte array indicating the fourth user-defined Asset data label (allow to update).
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const DATA_LABEL_NORMAL_4: UInt32 = AssetTagType.BYTES | 0x33
    /**
     * A local tag whose value is a byte array indicating the first user-defined Asset data label (allow to update).
     * The information of a local tag will not be synchronized.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const DATA_LABEL_NORMAL_LOCAL_1: UInt32 = AssetTagType.BYTES | 0x34
    /**
     * A local tag whose value is a byte array indicating the second user-defined Asset data label (allow to update).
     * The information of a local tag will not be synchronized.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const DATA_LABEL_NORMAL_LOCAL_2: UInt32 = AssetTagType.BYTES | 0x35
    /**
     * A local tag whose value is a byte array indicating the third user-defined Asset data label (allow to update).
     * The information of a local tag will not be synchronized.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const DATA_LABEL_NORMAL_LOCAL_3: UInt32 = AssetTagType.BYTES | 0x36
    /**
     * A local tag whose value is a byte array indicating the fourth user-defined Asset data label (allow to update).
     * The information of a local tag will not be synchronized.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const DATA_LABEL_NORMAL_LOCAL_4: UInt32 = AssetTagType.BYTES | 0x37
    /**
     * A tag whose value is a 32-bit unsigned integer indicating the return type of the queried Asset.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const RETURN_TYPE: UInt32 = AssetTagType.NUMBER | 0x40
    /**
     * A tag whose value is a 32-bit unsigned integer indicating the maximum number of returned Assets in one query.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const RETURN_LIMIT: UInt32 = AssetTagType.NUMBER | 0x41
    /**
     * A tag whose value is a 32-bit unsigned integer indicating the offset of return data in batch query.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const RETURN_OFFSET: UInt32 = AssetTagType.NUMBER | 0x42
    /**
     * A tag whose value is a 32-bit unsigned integer indicating how the query results are sorted.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const RETURN_ORDERED_BY: UInt32 = AssetTagType.NUMBER | 0x43
    /**
     * A tag whose value is a 32-bit unsigned integer indicating the strategy for resolving Asset conflicts.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const CONFLICT_RESOLUTION: UInt32 = AssetTagType.NUMBER | 0x44
    /**
     * A tag whose value is a byte array indicating the update time of an Asset.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const UPDATE_TIME: UInt32 = AssetTagType.BYTES | 0x45
    /**
     * A tag whose value is a 32-bit unsigned integer indicating the additional action to be performed during operation.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const OPERATION_TYPE: UInt32 = AssetTagType.NUMBER | 0x46
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Asset"
]
public struct AssetAccessibility {
    /**
     * The secret value in the Asset can only be accessed after the device is powered on.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const DEVICE_POWERED_ON: UInt32 = 0
    /**
     * The secret value in the Asset can only be accessed after the device is first unlocked.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const DEVICE_FIRST_UNLOCKED: UInt32 = 1
    /**
     * The secret value in the Asset can only be accessed while the device is unlocked.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const DEVICE_UNLOCKED: UInt32 = 2
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Asset"
]
public struct AssetAuthType {
    /**
     * The access to an Asset doesn't require user authentication.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const NONE: UInt32 = 0x00
    /**
     * The access to an Asset requires user authentication using either PIN/pattern/password or biometric traits.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const ANY: UInt32 = 0xFF
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Asset"
]
public struct AssetSyncType {
    /**
     * An Asset with this attribute value is never allowed to be transferred out.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const NEVER: UInt32 = 0
    /**
     * An Asset with this attribute value can only be restored to the device from which it was transferred out.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const THIS_DEVICE: UInt32 = 1 << 0
    /**
     * An Asset with this attribute value can only be transferred out to a trusted device (user authorized).
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const TRUSTED_DEVICE: UInt32 = 1 << 1
    /**
     * An Asset with this attribute value can only be transferred out to devices logged in with trusted accounts.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const TRUSTED_ACCOUNT: UInt32 = 1 << 2
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Asset"
]
public struct AssetConflictResolution {
    /**
     * Directly overwrite an Asset with duplicated alias when a conflict is detected.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const OVERWRITE: UInt32 = 0
    /**
     * Throw an error so that the caller can take measures when a conflict is detected.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const THROW_ERROR: UInt32 = 1
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Asset"
]
public struct AssetReturnType {
    /**
     * Specify that the return data should contain both secret value and attributes.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const ALL: UInt32 = 0
    /**
     * Specify that the return data contains only attributes.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const ATTRIBUTES: UInt32 = 1
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Asset"
]
public struct AssetOperationType {
    /**
     * Synchronization is required during operation.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const NEED_SYNC: UInt32 = 0
    /**
     * Logout is required during operation.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const NEED_LOGOUT: UInt32 = 1
}
