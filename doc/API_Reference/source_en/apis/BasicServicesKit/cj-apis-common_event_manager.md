# ohos.common_event_manager (Common Event Module)

This module provides capabilities related to common events, including publishing common events, subscribing to common events, and unsubscribing from common events.

## Importing the Module

```cangjie
import kit.BasicServicesKit.*
```

## Usage Instructions

API example code usage instructions:

- If the first line of example code contains a "// index.cj" comment, it indicates that the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the example requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the example project and configuration template mentioned above, refer to [Cangjie Example Code Instructions](../../cj-development-intro.md#Cangjie-Example-Code-Instructions).

## class CommonEventManager

```cangjie
public class CommonEventManager {}
```

**Description:** This structure provides management capabilities for common events.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static func createSubscriber(CommonEventSubscribeInfo)

```cangjie
public static func createSubscriber(subscribeInfo: CommonEventSubscribeInfo): CommonEventSubscriber
```

**Description:** Creates a subscriber.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:--------------|:-----|:--------|:-------------|:------------|
| subscribeInfo | [CommonEventSubscribeInfo](#class-commoneventsubscribeinfo) | Yes | - | Indicates the subscription information. |

**Return Value:**

| Type | Description |
|:-----|:------------|
| [CommonEventSubscriber](#class-commoneventsubscriber) | Subscriber object. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import ohos.base.*

let subscriber: CommonEventSubscriber // Used to store the successfully created subscriber object for subsequent subscription and unsubscription actions
let support = Support.COMMON_EVENT_ABILITY_ADDED
// Subscriber information
let subscribeInfo: CommonEventSubscribeInfo = CommonEventSubscribeInfo([support])
// Create subscriber
try {
    subscriber = CommonEventManager.createSubscriber(subscribeInfo)
} catch (e: BusinessException) {
    AppLog.info("errorCode = ${e.code}, errorMsg = ${e.message}")
}
```

### static func publish(String)

```cangjie
public static func publish(event: String): Unit
```

**Description:** Publishes a common event.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:--------------|:-----|:--------|:-------------|:------------|
| event | String | Yes | - | Indicates the common event to be published. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Event Error Codes](../../errorcodes/cj-errorcode-common_event_service.md).

  | Error Code ID | Error Message |
  |:-------------|:--------------|
  | 1500004 | not System services. |
  | 1500007 | error sending message to Common Event Service. |
  | 1500008 | Common Event Service does not complete initialization. |
  | 1500009 | error obtaining system parameters. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import ohos.base.*

try {
    // Publish common event
    CommonEventManager.publish(Support.COMMON_EVENT_SCREEN_ON)
} catch (e: BusinessException) {
    let code = e.code
    let message = e.message
    AppLog.info("publish failed, error code: ${code}, message: ${message}.")
}
```

### static func publish(String, CommonEventPublishData)

```cangjie
public static func publish(event: String, options: CommonEventPublishData): Unit
```

**Description:** Publishes a common event.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:--------------|:-----|:--------|:-------------|:------------|
| event | String | Yes | - | Indicates the common event to be published. |
| options | [CommonEventPublishData](#struct-commoneventpublishdata) | Yes | - | Indicates the properties of the published common event. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Event Error Codes](../../errorcodes/cj-errorcode-common_event_service.md).

  | Error Code ID | Error Message |
  |:-------------|:--------------|
  | 1500004 | not System services. |
  | 1500007 | error sending message to Common Event Service. |
  | 1500008 | Common Event Service does not complete initialization. |
  | 1500009 | error obtaining system parameters. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import ohos.base.*

try {
    // Common event properties
    let pData = CommonEventPublishData("com.example.myapplication", "123321", 123321)
    // Publish common event
    CommonEventManager.publish(Support.COMMON_EVENT_SCREEN_ON, pData)
} catch (e: BusinessException) {
    let code = e.code
    let message = e.message
    AppLog.info("publish failed, error code: ${code}, message: ${message}.")
}
```

### static func subscribe(CommonEventSubscriber, (CommonEventData) -> Unit)

```cangjie
public static func subscribe(subscriber: CommonEventSubscriber, callback: (CommonEventData) -> Unit): Unit
```

**Description:** Subscribes to common events in callback form.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:--------------|:-----|:--------|:-------------|:------------|
| subscriber | [CommonEventSubscriber](#class-commoneventsubscriber) | Yes | - | Indicates the subscriber object. |
| callback | ([CommonEventData](#struct-commoneventdata))->Unit | Yes | - | Indicates the callback function for receiving common event data. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Event Error Codes](../../errorcodes/cj-errorcode-common_event_service.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:-------------|:--------------|
  | 801 | capability not supported. |
  | 1500007 | error sending message to Common Event Service. |
  | 1500008 | Common Event Service does not complete initialization. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.ValueType as CMEValueType
import kit.BasicServicesKit.*
import ohos.base.*
import std.collection.*

// Subscribe to event: screen on
let events = [Support.COMMON_EVENT_SCREEN_ON]
// Subscriber information
let info = CommonEventSubscribeInfo(events)
// Subscriber
let sub = CommonEventManager.createSubscriber(info)
let strV = CMEValueType.STRING("Hello")
let intV = CMEValueType.INT(11)
let parameter = HashMap<String, CMEValueType>()
parameter.add("1", strV)
parameter.add("2", intV)
// Callback function for subscribed event
func callback(c: CommonEventData): Unit {
    AppLog.info("Callback")
}
// Publish data
let pData = CommonEventPublishData("com.example.myapplication", "123321", 123321, parameters: parameter)
try {
    // Subscribe
    CommonEventManager.subscribe(sub, callback)
    // Publish
    CommonEventManager.publish(Support.COMMON_EVENT_SCREEN_ON, pData)
} catch (e: BusinessException) {
    AppLog.info("errorCode = ${e.code}, errorMsg = ${e.message}")
}
```

### static func unsubscribe(CommonEventSubscriber)

```cangjie
public static func unsubscribe(subscriber: CommonEventSubscriber): Unit
```

**Description:** Unsubscribes from common events.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:--------------|:-----|:--------|:-------------|:------------|
| subscriber | [CommonEventSubscriber](#class-commoneventsubscriber) | Yes | - | Indicates the subscriber object. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Event Error Codes](../../errorcodes/cj-errorcode-common_event_service.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:-------------|:--------------|
  | 801 | capability not supported. |
  | 1500007 | error sending message to Common Event Service. |
  | 1500008 | Common Event Service does not complete initialization. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import ohos.base.*

// Subscribe to event: screen on
let events = [Support.COMMON_EVENT_SCREEN_ON]
// Subscriber information
let info = CommonEventSubscribeInfo(events)
// Subscriber
let sub = CommonEventManager.createSubscriber(info)
// Unsubscribe
try {
    CommonEventManager.unsubscribe(sub)
} catch (e: BusinessException) {
    AppLog.info("errorCode = ${e.code}, errorMsg = ${e.message}")
}
```

## class CommonEventSubscribeInfo
```cangjie
public class CommonEventSubscribeInfo {
    public init(
        events: Array<String>,
        publisherPermission!: ?String = None,
        publisherDeviceId!: ?String = None,
        userId!: ?Int32 = None,
        priority!: ?Int32 = None,
        publisherBundleName!: ?String = None
    )
}
```

**Function:** Represents subscriber information.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### prop events

```cangjie
public prop events: Array<String>
```

**Function:** Indicates the common events to subscribe to.

**Type:** Array\<string>

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### prop priority

```cangjie
public prop priority: ?Int32
```

**Function:** Indicates the subscriber's priority. The value range is -100 to 1000. Priorities exceeding the limits will be set to the boundary values.

**Type:** ?Int32

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### prop publisherBundleName

```cangjie
public prop publisherBundleName: ?String
```

**Function:** Indicates the bundleName of the publisher to subscribe to.

**Type:** ?String

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### prop publisherDeviceId

```cangjie
public prop publisherDeviceId: ?String
```

**Function:** Indicates the device ID. Obtain the udid through [@ohos.deviceInfo](./cj-apis-device_info.md) as the subscriber's device ID.

**Type:** ?String

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### prop publisherPermission

```cangjie
public prop publisherPermission: ?String
```

**Function:** Indicates the publisher's permission. The subscriber will only receive events published by senders with this permission.

**Type:** ?String

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### prop userId

```cangjie
public prop userId: ?Int32
```

**Function:** Indicates the user ID. This parameter is optional, with the default value being the current user's ID. If specified, the value must be an existing user ID in the system.

**Type:** ?Int32

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### init(Array\<String>, ?String, ?String, ?Int32, ?Int32, ?String)

```cangjie
public init(
    events: Array<String>,
    publisherPermission!: ?String = None,
    publisherDeviceId!: ?String = None,
    userId!: ?Int32 = None,
    priority!: ?Int32 = None,
    publisherBundleName!: ?String = None
)
```

**Function:** Constructs a CommonEventSubscribeInfo object.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| events | Array\<String> | Yes | - | Indicates the common events to subscribe to. |
| publisherPermission | ?String | No | None | **Named parameter.** Indicates the publisher's permission. The subscriber will only receive events published by senders with this permission. |
| publisherDeviceId | ?String | No | None | **Named parameter.** Indicates the device ID. Obtain the udid through [@ohos.deviceInfo](./cj-apis-device_info.md) as the subscriber's device ID. |
| userId | ?Int32 | No | None | **Named parameter.** Indicates the user ID. This parameter is optional, with the default value being the current user's ID. If specified, the value must be an existing user ID in the system. |
| priority | ?Int32 | No | None | **Named parameter.** Indicates the subscriber's priority. The value range is -100 to 1000. Priorities exceeding the limits will be set to the boundary values. |
| publisherBundleName | ?String | No | None | **Named parameter.** Indicates the bundleName of the publisher to subscribe to. |

## class CommonEventSubscriber

```cangjie
public class CommonEventSubscriber {}
```

**Function:** Describes a common event subscriber.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

## struct CommonEventData

```cangjie
public struct CommonEventData {
    public let event: String
    public let bundleName: String
    public let code: Int32
    public let data: String
    public let parameters: HashMap<String, ValueType>
}
```

**Function:** Data of a common event.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### let bundleName

```cangjie
public let bundleName: String
```

**Function:** Indicates the bundle name, currently empty by default.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### let code

```cangjie
public let code: Int32
```

**Function:** Indicates the common event data (Int32 type) received by the subscriber. This field's value corresponds to the data passed through the `code` field in [CommonEventPublishData](#struct-commoneventpublishdata) when the publisher uses [commonEventManager.publish](#static-func-publishstring) to publish the common event. Default value is 0.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### let data

```cangjie
public let data: String
```

**Function:** Indicates the common event data (string type) received by the subscriber. This field's value corresponds to the data passed through the `data` field in [CommonEventPublishData](#struct-commoneventpublishdata) when the publisher uses [commonEventManager.publish](#static-func-publishstring) to publish the common event.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### let event

```cangjie
public let event: String
```

**Function:** Indicates the name of the currently received common event.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### let parameters

```cangjie
public let parameters: HashMap<String, ValueType>
```

**Function:** Indicates additional information of the common event received by the subscriber. This field's value corresponds to the data passed through the `parameters` field in [CommonEventPublishData](#struct-commoneventpublishdata) when the publisher uses [commonEventManager.publish](#static-func-publishstring) to publish the common event.

**Type:** HashMap\<String, [ValueType](#enum-valuetype)>

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

## struct CommonEventPublishData

```cangjie
public struct CommonEventPublishData {
    public CommonEventPublishData (
        public let bundleName: String,
        public let data: String,
        public let code: Int32,
        public let subscriberPermissions!: Array<String> = Array<String>(),
        public let isOrdered!: Bool = false,
        public let isSticky!: Bool = false,
        public let parameters!: HashMap<String, ValueType> = HashMap<String, ValueType>()
    )
}
```

**Function:** Contains common event content and attributes.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### let bundleName

```cangjie
public let bundleName: String
```

**Function:** Indicates the subscriber's bundle name. Only subscribers with the specified bundleName can receive this common event.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### let code

```cangjie
public let code: Int32
```

**Function:** Indicates the result code of the common event.
**Type:** Int32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### let data

```cangjie
public let data: String
```

**Function:** Represents the custom result data of a common event.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### let isOrdered

```cangjie
public let isOrdered: Bool = false
```

**Function:** Indicates whether the event is ordered.

**Type:** Bool

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### let isSticky

```cangjie
public let isSticky: Bool = false
```

**Function:** Indicates whether the event is sticky. Only system applications or system services are allowed to send sticky events.

**Type:** Bool

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### let parameters

```cangjie
public let parameters: HashMap<String, ValueType>= HashMap<String, ValueType>()
```

**Function:** Represents the additional information of a common event.

**Type:** HashMap\<String, [ValueType](#enum-valuetype)>

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### let subscriberPermissions

```cangjie
public let subscriberPermissions: Array<String>= Array<String>()
```

**Function:** Represents the permissions of the subscriber.

**Type:** Array\<String>

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### CommonEventPublishData(String, String, Int32, Array\<String>, Bool, Bool, HashMap\<String, ValueType>)

```cangjie
public CommonEventPublishData (
    let bundleName: String,
        let data: String,
        let code: Int32,
        let subscriberPermissions!: Array<String> = Array<String>(),
        let isOrdered!: Bool = false,
        let isSticky!: Bool = false,
        let parameters!: HashMap<String, ValueType> = HashMap<String, ValueType>()
)
```

**Function:** Constructs a CommonEventPublishData object.

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|bundleName|String|Yes|-|Represents the package name of the subscriber. Only subscribers with this package name can receive the common event.|
|data|String|Yes|-|Represents the custom result data of the common event.|
|code|Int32|Yes|-|Represents the result code of the common event.|
|subscriberPermissions|Array\<String>|No|Array\<String>()| **Named parameter.** Represents the permissions of the subscriber.|
|isOrdered|Bool|No|false| **Named parameter.** Indicates whether the event is ordered.|
|isSticky|Bool|No|false| **Named parameter.** Indicates whether the event is sticky. Only system applications or system services are allowed to send sticky events.|
|parameters|HashMap\<String, [ValueType](#enum-valuetype)>|No|HashMap\<String, ValueType>()| **Named parameter.** Represents the additional information of the common event.|

## struct Support

```cangjie
public struct Support {
    public static const COMMON_EVENT_ABILITY_ADDED: String = "common.event.ABILITY_ADDED"
    public static const COMMON_EVENT_ABILITY_REMOVED: String = "common.event.ABILITY_REMOVED"
    public static const COMMON_EVENT_ABILITY_UPDATED: String = "common.event.ABILITY_UPDATED"
    public static const COMMON_EVENT_ACCOUNT_DELETED: String = "usual.event.data.ACCOUNT_DELETED"
    public static const COMMON_EVENT_AIRPLANE_MODE_CHANGED: String = "usual.event.AIRPLANE_MODE"
    public static const COMMON_EVENT_AUDIO_QUALITY_CHANGE: String = "usual.event.AUDIO_QUALITY_CHANGE"
    public static const COMMON_EVENT_BATTERY_CHANGED: String = "usual.event.BATTERY_CHANGED"
    public static const COMMON_EVENT_BATTERY_LOW: String = "usual.event.BATTERY_LOW"
    public static const COMMON_EVENT_BATTERY_OKAY: String = "usual.event.BATTERY_OKAY"
    public static const COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_CONNECT_STATE_UPDATE: String = "usual.event.bluetooth.handsfree.ag.CONNECT_STATE_UPDATE"
    public static const COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_CURRENT_DEVICE_UPDATE: String = "usual.event.bluetooth.handsfree.ag.CURRENT_DEVICE_UPDATE"
    public static const COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_AUDIO_STATE_UPDATE: String = "usual.event.bluetooth.handsfree.ag.AUDIO_STATE_UPDATE"
    public static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CONNECT_STATE_UPDATE: String = "usual.event.bluetooth.a2dpsource.CONNECT_STATE_UPDATE"
    public static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CURRENT_DEVICE_UPDATE: String = "usual.event.bluetooth.a2dpsource.CURRENT_DEVICE_UPDATE"
    public static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_PLAYING_STATE_UPDATE: String = "usual.event.bluetooth.a2dpsource.PLAYING_STATE_UPDATE"
    public static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_AVRCP_CONNECT_STATE_UPDATE: String = "usual.event.bluetooth.a2dpsource.AVRCP_CONNECT_STATE_UPDATE"
    public static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CODEC_VALUE_UPDATE: String = "usual.event.bluetooth.a2dpsource.CODEC_VALUE_UPDATE"
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_DISCOVERED: String = "usual.event.bluetooth.remotedevice.DISCOVERED"
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CLASS_VALUE_UPDATE: String = "usual.event.bluetooth.remotedevice.CLASS_VALUE_UPDATE"
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_ACL_CONNECTED: String = "usual.event.bluetooth.remotedevice.ACL_CONNECTED"
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_ACL_DISCONNECTED: String = "usual.event.bluetooth.remotedevice.ACL_DISCONNECTED"
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_NAME_UPDATE: String = "usual.event.bluetooth.remotedevice.NAME_UPDATE"
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIR_STATE: String = "usual.event.bluetooth.remotedevice.PAIR_STATE"
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_BATTERY_VALUE_UPDATE: String = "usual.event.bluetooth.remotedevice.BATTERY_VALUE_UPDATE"
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_SDP_RESULT: String = "usual.event.bluetooth.remotedevice.SDP_RESULT"
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_UUID_VALUE: String = "usual.event.bluetooth.remotedevice.UUID_VALUE"
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIRING_REQ: String = "usual.event.bluetooth.remotedevice.PAIRING_REQ"
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIRING_CANCEL: String = "usual.event.bluetooth.remotedevice.PAIRING_CANCEL"
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_REQ: String = "usual.event.bluetooth.remotedevice.CONNECT_REQ"
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_REPLY: String = "usual.event.bluetooth.remotedevice.CONNECT_REPLY"
    public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_CANCEL: String = "usual.event.bluetooth.remotedevice.CONNECT_CANCEL"
    public static const COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_CONNECT_STATE_UPDATE: String = "usual.event.bluetooth.handsfreeunit.CONNECT_STATE_UPDATE"
    public static const COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AUDIO_STATE_UPDATE: String = "usual.event.bluetooth.handsfreeunit.AUDIO_STATE_UPDATE"
    public static const COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AG_COMMON_EVENT: String = "usual.event.bluetooth.handsfreeunit.AG_COMMON_EVENT"
    public static const COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AG_CALL_STATE_UPDATE: String = "usual.event.bluetooth.handsfreeunit.AG_CALL_STATE_UPDATE"
    public static const COMMON_EVENT_BLUETOOTH_HOST_STATE_UPDATE: String = "usual.event.bluetooth.host.STATE_UPDATE"
    public static const COMMON_EVENT_BLUETOOTH_HOST_REQ_DISCOVERABLE: String = "usual.event.bluetooth.host.REQ_DISCOVERABLE"
    public static const COMMON_EVENT_BLUETOOTH_HOST_REQ_ENABLE: String = "usual.event.bluetooth.host.REQ_ENABLE"
    public static const COMMON_EVENT_BLUETOOTH_HOST_REQ_DISABLE: String = "usual.event.bluetooth.host.REQ_DISABLE"
    public static const COMMON_EVENT_BLUETOOTH_HOST_SCAN_MODE_UPDATE: String = "usual.event.bluetooth.host.SCAN_MODE_UPDATE"
    public static const COMMON_EVENT_BLUETOOTH_HOST_DISCOVERY_STARTED: String = "usual.event.bluetooth.host.DISCOVERY_STARTED"
    public static const COMMON_EVENT_BLUETOOTH_HOST_DISCOVERY_FINISHED: String = "usual.event.bluetooth.host.DISCOVERY_FINISHED"
    public static const COMMON_EVENT_BLUETOOTH_HOST_NAME_UPDATE: String = "usual.event.bluetooth.host.NAME_UPDATE"
    public static const COMMON_EVENT_BLUETOOTH_A2DPSINK_CONNECT_STATE_UPDATE: String = "usual.event.bluetooth.a2dpsink.CONNECT_STATE_UPDATE"
    public static const COMMON_EVENT_BLUETOOTH_A2DPSINK_PLAYING_STATE_UPDATE: String = "usual.event.bluetooth.a2dpsink.PLAYING_STATE_UPDATE"
    public static const COMMON_EVENT_BLUETOOTH_A2DPSINK_AUDIO_STATE_UPDATE: String = "usual.event.bluetooth.a2dpsink.AUDIO_STATE_UPDATE"
    public static const COMMON_EVENT_BUNDLE_REMOVED: String = "usual.event.BUNDLE_REMOVED"
    public static const COMMON_EVENT_BOOT_COMPLETED: String = "usual.event.BOOT_COMPLETED"
    public static const COMMON_EVENT_CONNECTIVITY_CHANGE: String = "usual.event.CONNECTIVITY_CHANGE"
    public static const COMMON_EVENT_CELLULAR_DATA_STATE_CHANGED: String = "usual.event.CELLULAR_DATA_STATE_CHANGED"
    public static const COMMON_EVENT_CALL_STATE_CHANGED: String = "usual.event.CALL_STATE_CHANGED"
    public static const COMMON_EVENT_CHARGE_IDLE_MODE_CHANGED: String = "usual.event.CHARGE_IDLE_MODE_CHANGED"
    public static const COMMON_EVENT_CHARGE_TYPE_CHANGED: String = "usual.event.CHARGE_TYPE_CHANGED"
    public static const COMMON_EVENT_CHARGING: String = "usual.event.CHARGING"
    public static const COMMON_EVENT_CONFIGURATION_CHANGED: String = "usual.event.CONFIGURATION_CHANGED"
    public static const COMMON_EVENT_CLOSE_SYSTEM_DIALOGS: String = "usual.event.CLOSE_SYSTEM_DIALOGS"
    public static const COMMON_EVENT_DEVICE_IDLE_EXEMPTION_LIST_UPDATED: String = "usual.event.DEVICE_IDLE_EXEMPTION_LIST_UPDATED"
    public static const COMMON_EVENT_DOMAIN_ACCOUNT_STATUS_CHANGED: String = "usual.event.DOMAIN_ACCOUNT_STATUS_CHANGED"
    public static const COMMON_EVENT_DISK_EJECT: String = "usual.event.data.DISK_EJECT"
    public static const COMMON_EVENT_DISK_UNMOUNTABLE: String = "usual.event.data.DISK_UNMOUNTABLE"
    public static const COMMON_EVENT_DISK_BAD_REMOVAL: String = "usual.event.data.DISK_BAD_REMOVAL"
    public static const COMMON_EVENT_DISK_MOUNTED: String = "usual.event.data.DISK_MOUNTED"
    public static const COMMON_EVENT_DISK_UNMOUNTED: String = "usual.event.data.DISK_UNMOUNTED"
    public static const COMMON_EVENT_DISK_REMOVED: String = "usual.event.data.DISK_REMOVED"
    public static const COMMON_EVENT_DEVICE_IDLE_MODE_CHANGED: String = "usual.event.DEVICE_IDLE_MODE_CHANGED"
    public static const COMMON_EVENT_DISCHARGING: String = "usual.event.DISCHARGING"
    public static const COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGOFF: String = "common.event.DISTRIBUTED_ACCOUNT_LOGOFF"
    public static const COMMON_EVENT_DISTRIBUTED_ACCOUNT_TOKEN_INVALID: String = "common.event.DISTRIBUTED_ACCOUNT_TOKEN_INVALID"
    public static const COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGOUT: String = "common.event.DISTRIBUTED_ACCOUNT_LOGOUT"
    public static const COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGIN: String = "common.event.DISTRIBUTED_ACCOUNT_LOGIN"
    public static const COMMON_EVENT_DRIVE_MODE: String = "common.event.DRIVE_MODE"
    public static const COMMON_EVENT_DATE_CHANGED: String = "usual.event.DATE_CHANGED"
    public static const COMMON_EVENT_EXTERNAL_APPLICATIONS_UNAVAILABLE: String = "usual.event.EXTERNAL_APPLICATIONS_UNAVAILABLE"
    public static const COMMON_EVENT_EXTERNAL_APPLICATIONS_AVAILABLE: String = "usual.event.EXTERNAL_APPLICATIONS_AVAILABLE"
    public static const COMMON_EVENT_FOUNDATION_READY: String = "common.event.FOUNDATION_READY"
    public static const COMMON_EVENT_HOME_MODE: String = "common.event.HOME_MODE"
    public static const COMMON_EVENT_HTTP_PROXY_CHANGE: String = "usual.event.HTTP_PROXY_CHANGE"
    public static const COMMON_EVENT_IVI_SLEEP: String = "common.event.IVI_SLEEP"
    public static const COMMON_EVENT_IVI_PAUSE: String = "common.event.IVI_PAUSE"
    public static const COMMON_EVENT_IVI_STANDBY: String = "common.event.IVI_STANDBY"
    public static const COMMON_EVENT_IVI_LASTMODE_SAVE: String = "common.event.IVI_LASTMODE_SAVE"
    public static const COMMON_EVENT_IVI_VOLTAGE_ABNORMAL: String = "common.event.IVI_VOLTAGE_ABNORMAL"
    public static const COMMON_EVENT_IVI_HIGH_TEMPERATURE: String = "common.event.IVI_HIGH_TEMPERATURE"
    public static const COMMON_EVENT_IVI_EXTREME_TEMPERATURE: String = "common.event.IVI_EXTREME_TEMPERATURE"
    public static const COMMON_EVENT_IVI_TEMPERATURE_ABNORMAL: String = "common.event.IVI_TEMPERATURE_ABNORMAL"
    public static const COMMON_EVENT_IVI_VOLTAGE_RECOVERY: String = "common.event.IVI_VOLTAGE_RECOVERY"
    public static const COMMON_EVENT_IVI_TEMPERATURE_RECOVERY: String = "common.event.IVI_TEMPERATURE_RECOVERY"
    public static const COMMON_EVENT_IVI_ACTIVE: String = "common.event.IVI_ACTIVE"
    public static const COMMON_EVENT_INCOMING_CALL_MISSED: String = "usual.event.INCOMING_CALL_MISSED"
    public static const COMMON_EVENT_LOCKED_BOOT_COMPLETED: String = "usual.event.LOCKED_BOOT_COMPLETED"
    public static const COMMON_EVENT_LOCALE_CHANGED: String = "usual.event.LOCALE_CHANGED"
    public static const COMMON_EVENT_LOCATION_MODE_STATE_CHANGED: String = "usual.event.location.MODE_STATE_CHANGED"
    public static const COMMON_EVENT_MY_PACKAGE_REPLACED: String = "usual.event.MY_PACKAGE_REPLACED"
    public static const COMMON_EVENT_MY_PACKAGE_SUSPENDED: String = "usual.event.MY_PACKAGE_SUSPENDED"
    public static const COMMON_EVENT_MY_PACKAGE_UNSUSPENDED: String = "usual.event.MY_PACKAGE_UNSUSPENDED"
    public static const COMMON_EVENT_MANAGE_PACKAGE_STORAGE: String = "usual.event.MANAGE_PACKAGE_STORAGE"
    public static const COMMON_EVENT_NFC_ACTION_ADAPTER_STATE_CHANGED: String = "usual.event.nfc.action.ADAPTER_STATE_CHANGED"
    public static const COMMON_EVENT_NFC_ACTION_RF_FIELD_ON_DETECTED: String = "usual.event.nfc.action.RF_FIELD_ON_DETECTED"
    public static const COMMON_EVENT_NFC_ACTION_RF_FIELD_OFF_DETECTED: String = "usual.event.nfc.action.RF_FIELD_OFF_DETECTED"
    public static const COMMON_EVENT_NETWORK_STATE_CHANGED: String = "usual.event.NETWORK_STATE_CHANGED"
    public static const COMMON_EVENT_OFFICE_MODE: String = "common.event.OFFICE_MODE"
    public static const COMMON_EVENT_OPERATOR_CONFIG_CHANGED: String = "usual.event.OPERATOR_CONFIG_CHANGED"
    public static const COMMON_EVENT_POWER_CONNECTED: String = "usual.event.POWER_CONNECTED"
    public static const COMMON_EVENT_POWER_DISCONNECTED: String = "usual.event.POWER_DISCONNECTED"
    public static const COMMON_EVENT_PACKAGE_ADDED: String = "usual.event.PACKAGE_ADDED"
    public static const COMMON_EVENT_PACKAGE_REPLACED: String = "usual.event.PACKAGE_REPLACED"
    public static const COMMON_EVENT_PACKAGE_REMOVED: String = "usual.event.PACKAGE_REMOVED"
    public static const COMMON_EVENT_PACKAGE_FULLY_REMOVED: String = "usual.event.PACKAGE_FULLY_REMOVED"
    public static const COMMON_EVENT_PACKAGE_CHANGED: String = "usual.event.PACKAGE_CHANGED"
    public static const COMMON_EVENT_PACKAGE_RESTARTED: String = "usual.event.PACKAGE_RESTARTED"
    public static const COMMON_EVENT_PACKAGE_DATA_CLEARED: String = "usual.event.PACKAGE_DATA_CLEARED"
    public static const COMMON_EVENT_PACKAGE_CACHE_CLEARED: String = "usual.event.PACKAGE_CACHE_CLEARED"
    public static const COMMON_EVENT_PACKAGES_SUSPENDED: String = "usual.event.PACKAGES_SUSPENDED"
    public static const COMMON_EVENT_PACKAGES_UNSUSPENDED: String = "usual.event.PACKAGES_UNSUSPENDED"
    public static const COMMON_EVENT_PACKAGE_FIRST_LAUNCH: String = "usual.event.PACKAGE_FIRST_LAUNCH"
    public static const COMMON_EVENT_PACKAGE_NEEDS_VERIFICATION: String = "usual.event.PACKAGE_NEEDS_VERIFICATION"
    public static const COMMON_EVENT_PACKAGE_VERIFIED: String = "usual.event.PACKAGE_VERIFIED"
    public static const COMMON_EVENT_POWER_SAVE_MODE_CHANGED: String = "usual.event.POWER_SAVE_MODE_CHANGED"
    public static const COMMON_EVENT_PRIVACY_STATE_CHANGED: String = "usual.event.PRIVACY_STATE_CHANGED"
    public static const COMMON_EVENT_PRIMARY_SLOT_ROAMING: String = "usual.event.PRIMARY_SLOT_ROAMING"
    public static const COMMON_EVENT_QUICK_FIX_APPLY_RESULT: String = "usual.event.QUICK_FIX_APPLY_RESULT"
    public static const COMMON_EVENT_QUICK_FIX_REVOKE_RESULT: String = "usual.event.QUICK_FIX_REVOKE_RESULT"
    public static const COMMON_EVENT_RADIO_STATE_CHANGE: String = "usual.event.RADIO_STATE_CHANGE"
    public static const COMMON_EVENT_SHUTDOWN: String = "usual.event.SHUTDOWN"
    public static const COMMON_EVENT_SCREEN_OFF: String = "usual.event.SCREEN_OFF"
    public static const COMMON_EVENT_SCREEN_ON: String = "usual.event.SCREEN_ON"
    public static const COMMON_EVENT_SPLIT_SCREEN: String = "common.event.SPLIT_SCREEN"
    public static const COMMON_EVENT_SLOT_CHANGE: String = "usual.event.SLOT_CHANGE"
    public static const COMMON_EVENT_SPN_INFO_CHANGED: String = "usual.event.SPN_INFO_CHANGED"
    public static const COMMON_EVENT_SIGNAL_INFO_CHANGED: String = "usual.event.SIGNAL_INFO_CHANGED"
    public static const COMMON_EVENT_SIM_STATE_CHANGED: String = "usual.event.SIM_STATE_CHANGED"
    public static const COMMON_EVENT_STK_SESSION_END: String = "usual.event.STK_SESSION_END"
    public static const COMMON_EVENT_SMS_EMERGENCY_CB_RECEIVE_COMPLETED: String = "usual.event.SMS_EMERGENCY_CB_RECEIVE_COMPLETED"
    public static const COMMON_EVENT_STK_COMMAND: String = "usual.event.STK_COMMAND"
    public static const COMMON_EVENT_STK_ALPHA_IDENTIFIER: String = "usual.event.STK_ALPHA_IDENTIFIER"
    public static const COMMON_EVENT_SIM_CARD_DEFAULT_VOICE_SUBSCRIPTION_CHANGED: String = "usual.event.SIM.DEFAULT_VOICE_SUBSCRIPTION_CHANGED"
    public static const COMMON_EVENT_SIM_CARD_DEFAULT_MAIN_SUBSCRIPTION_CHANGED: String = "usual.event.SIM.DEFAULT_MAIN_SUBSCRIPTION_CHANGED"
    public static const COMMON_EVENT_STK_CARD_STATE_CHANGED: String = "usual.event.STK_CARD_STATE_CHANGED"
    public static const COMMON_EVENT_SCREEN_LOCKED: String = "usual.event.SCREEN_LOCKED"
    public static const COMMON_EVENT_SIM_CARD_DEFAULT_DATA_SUBSCRIPTION_CHANGED: String = "usual.event.SIM.DEFAULT_DATA_SUBSCRIPTION_CHANGED"
    public static const COMMON_EVENT_SMS_RECEIVE_COMPLETED: String = "usual.event.SMS_RECEIVE_COMPLETED"
    public static const COMMON_EVENT_SMS_WAPPUSH_RECEIVE_COMPLETED: String = "usual.event.SMS_WAPPUSH_RECEIVE_COMPLETED"
    public static const COMMON_EVENT_SCREEN_UNLOCKED: String = "usual.event.SCREEN_UNLOCKED"
    public static const COMMON_EVENT_SIM_CARD_DEFAULT_SMS_SUBSCRIPTION_CHANGED: String = "usual.event.SIM.DEFAULT_SMS_SUBSCRIPTION_CHANGED"
    public static const COMMON_EVENT_SMS_CB_RECEIVE_COMPLETED: String = "usual.event.SMS_CB_RECEIVE_COMPLETED"
    public static const COMMON_EVENT_SPECIAL_CODE: String = "common.event.SPECIAL_CODE"
    public static const COMMON_EVENT_SET_PRIMARY_SLOT_STATUS: String = "usual.event.SET_PRIMARY_SLOT_STATUS"
    public static const COMMON_EVENT_THERMAL_LEVEL_CHANGED: String = "usual.event.THERMAL_LEVEL_CHANGED"
    public static const COMMON_EVENT_TIME_TICK: String = "usual.event.TIME_TICK"
    public static const COMMON_EVENT_TIME_CHANGED: String = "usual.event.TIME_CHANGED"
    public static const COMMON_EVENT_TIMEZONE_CHANGED: String = "usual.event.TIMEZONE_CHANGED"
    public static const COMMON_EVENT_UID_REMOVED: String = "usual.event.UID_REMOVED"
    public static const COMMON_EVENT_USER_STARTED: String = "usual.event.USER_STARTED"
    public static const COMMON_EVENT_USER_BACKGROUND: String = "usual.event.USER_BACKGROUND"
    public static const COMMON_EVENT_USER_FOREGROUND: String = "usual.event.USER_FOREGROUND"
    public static const COMMON_EVENT_USER_SWITCHED: String = "usual.event.USER_SWITCHED"
    public static const COMMON_EVENT_USER_STARTING: String = "usual.event.USER_STARTING"
    public static const COMMON_EVENT_USER_UNLOCKED: String = "usual.event.USER_UNLOCKED"
    public static const COMMON_EVENT_USER_STOPPING: String = "usual.event.USER_STOPPING"
    public static const COMMON_EVENT_USER_STOPPED: String = "usual.event.USER_STOPPED"
    public static const COMMON_EVENT_USER_ADDED: String = "usual.event.USER_ADDED"
    public static const COMMON_EVENT_USER_REMOVED: String = "usual.event.USER_REMOVED"
    public static const COMMON_EVENT_USB_STATE: String = "usual.event.hardware.usb.action.USB_STATE"
    public static const COMMON_EVENT_USB_PORT_CHANGED: String = "usual.event.hardware.usb.action.USB_PORT_CHANGED"
    public static const COMMON_EVENT_USB_DEVICE_ATTACHED: String = "usual.event.hardware.usb.action.USB_DEVICE_ATTACHED"
    public static const COMMON_EVENT_USB_DEVICE_DETACHED: String = "usual.event.hardware.usb.action.USB_DEVICE_DETACHED"
    public static const COMMON_EVENT_USB_ACCESSORY_ATTACHED: String = "usual.event.hardware.usb.action.USB_ACCESSORY_ATTACHED"
    public static const COMMON_EVENT_USB_ACCESSORY_DETACHED: String = "usual.event.hardware.usb.action.USB_ACCESSORY_DETACHED"
    public static const COMMON_EVENT_USER_INFO_UPDATED: String = "usual.event.USER_INFO_UPDATED"
    public static const COMMON_EVENT_VOLUME_REMOVED: String = "usual.event.data.VOLUME_REMOVED"
    public static const COMMON_EVENT_VOLUME_UNMOUNTED: String = "usual.event.data.VOLUME_UNMOUNTED"
    public static const COMMON_EVENT_VOLUME_MOUNTED: String = "usual.event.data.VOLUME_MOUNTED"
    public static const COMMON_EVENT_VOLUME_BAD_REMOVAL: String = "usual.event.data.VOLUME_BAD_REMOVAL"
    public static const COMMON_EVENT_VOLUME_EJECT: String = "usual.event.data.VOLUME_EJECT"
    public static const COMMON_EVENT_VISIBLE_ACCOUNTS_UPDATED: String = "usual.event.data.VISIBLE_ACCOUNTS_UPDATED"
    public static const COMMON_EVENT_WIFI_POWER_STATE: String = "usual.event.wifi.POWER_STATE"
    public static const COMMON_EVENT_WIFI_SCAN_FINISHED: String = "usual.event.wifi.SCAN_FINISHED"
    public static const COMMON_EVENT_WIFI_RSSI_VALUE: String = "usual.event.wifi.RSSI_VALUE"
    public static const COMMON_EVENT_WIFI_CONN_STATE: String = "usual.event.wifi.CONN_STATE"
    public static const COMMON_EVENT_WIFI_HOTSPOT_STATE: String = "usual.event.wifi.HOTSPOT_STATE"
    public static const COMMON_EVENT_WIFI_AP_STA_JOIN: String = "usual.event.wifi.WIFI_HS_STA_JOIN"
    public static const COMMON_EVENT_WIFI_AP_STA_LEAVE: String = "usual.event.wifi.WIFI_HS_STA_LEAVE"
    public static const COMMON_EVENT_WIFI_MPLINK_STATE_CHANGE: String = "usual.event.wifi.mplink.STATE_CHANGE"
    public static const COMMON_EVENT_WIFI_P2P_CONN_STATE: String = "usual.event.wifi.p2p.CONN_STATE_CHANGE"
    public static const COMMON_EVENT_WIFI_P2P_STATE_CHANGED: String = "usual.event.wifi.p2p.STATE_CHANGE"
    public static const COMMON_EVENT_WIFI_P2P_PEERS_STATE_CHANGED: String = "usual.event.wifi.p2p.DEVICES_CHANGE"
    public static const COMMON_EVENT_WIFI_P2P_PEERS_DISCOVERY_STATE_CHANGED: String = "usual.event.wifi.p2p.PEER_DISCOVERY_STATE_CHANGE"
    public static const COMMON_EVENT_WIFI_P2P_CURRENT_DEVICE_STATE_CHANGED: String = "usual.event.wifi.p2p.CURRENT_DEVICE_CHANGE"
    public static const COMMON_EVENT_WIFI_P2P_GROUP_STATE_CHANGED: String = "usual.event.wifi.p2p.GROUP_STATE_CHANGED"
}
```

**Function:** This structure provides system common event management capabilities. System common events refer to events published by system services or system applications, which require specific permissions and corresponding values to subscribe.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_ABILITY_ADDED

```cangjie
public static const COMMON_EVENT_ABILITY_ADDED: String = "common.event.ABILITY_ADDED"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for added capability.

**Required Permission:** ohos.permission.LISTEN_BUNDLE_CHANGE

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_ABILITY_REMOVED

```cangjie
public static const COMMON_EVENT_ABILITY_REMOVED: String = "common.event.ABILITY_REMOVED"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for removed capability.

**Required Permission:** ohos.permission.LISTEN_BUNDLE_CHANGE

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_ABILITY_UPDATED

```cangjie
public static const COMMON_EVENT_ABILITY_UPDATED: String = "common.event.ABILITY_UPDATED"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for updated capability.

**Required Permission:** ohos.permission.LISTEN_BUNDLE_CHANGE

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_ACCOUNT_DELETED

```cangjie
public static const COMMON_EVENT_ACCOUNT_DELETED: String = "usual.event.data.ACCOUNT_DELETED"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for deleted account.

**Required Permission:** ohos.permission.INTERACT_ACROSS_LOCAL_ACCOUNTS (This permission can only be requested by system applications)

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_AIRPLANE_MODE_CHANGED

```cangjie
public static const COMMON_EVENT_AIRPLANE_MODE_CHANGED: String = "usual.event.AIRPLANE_MODE"
```

**Function:** Indicates a common event for changed airplane mode.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_AUDIO_QUALITY_CHANGE

```cangjie
public static const COMMON_EVENT_AUDIO_QUALITY_CHANGE: String = "usual.event.AUDIO_QUALITY_CHANGE"
```

**Function:** Indicates a common event for changed audio quality.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BATTERY_CHANGED

```cangjie
public static const COMMON_EVENT_BATTERY_CHANGED: String = "usual.event.BATTERY_CHANGED"
```

**Function:** Indicates a common event for changed battery charging state, level, and other information.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BATTERY_LOW

```cangjie
public static const COMMON_EVENT_BATTERY_LOW: String = "usual.event.BATTERY_LOW"
```

**Function:** Indicates a common event for low battery level.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BATTERY_OKAY

```cangjie
public static const COMMON_EVENT_BATTERY_OKAY: String = "usual.event.BATTERY_OKAY"
```

**Function:** Indicates a common event for exited low battery level state.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_A2DPSINK_AUDIO_STATE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_A2DPSINK_AUDIO_STATE_UPDATE: String = "usual.event.bluetooth.a2dpsink.AUDIO_STATE_UPDATE"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for changed Bluetooth A2DP sink audio state.

**Required Permission:** ohos.permission.USE_BLUETOOTH

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_A2DPSINK_CONNECT_STATE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_A2DPSINK_CONNECT_STATE_UPDATE: String = "usual.event.bluetooth.a2dpsink.CONNECT_STATE_UPDATE"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for changed Bluetooth A2DP sink connection state.

**Required Permission:** ohos.permission.USE_BLUETOOTH

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_A2DPSINK_PLAYING_STATE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_A2DPSINK_PLAYING_STATE_UPDATE: String = "usual.event.bluetooth.a2dpsink.PLAYING_STATE_UPDATE"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for changed Bluetooth A2DP sink playing state.

**Required Permission:** ohos.permission.USE_BLUETOOTH

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_AVRCP_CONNECT_STATE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_AVRCP_CONNECT_STATE_UPDATE: String = "usual.event.bluetooth.a2dpsource.AVRCP_CONNECT_STATE_UPDATE"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for changed Bluetooth A2DP AVRCP connection state.

**Required Permission:** ohos.permission.USE_BLUETOOTH

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CODEC_VALUE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CODEC_VALUE_UPDATE: String = "usual.event.bluetooth.a2dpsource.CODEC_VALUE_UPDATE"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for changed Bluetooth A2DP audio codec state.

**Required Permission:** ohos.permission.USE_BLUETOOTH

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CONNECT_STATE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CONNECT_STATE_UPDATE: String = "usual.event.bluetooth.a2dpsource.CONNECT_STATE_UPDATE"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for changed Bluetooth A2DP connection state.

**Required Permission:** ohos.permission.USE_BLUETOOTH

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CURRENT_DEVICE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CURRENT_DEVICE_UPDATE: String = "usual.event.bluetooth.a2dpsource.CURRENT_DEVICE_UPDATE"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for active device connected via Bluetooth A2DP.

**Required Permission:** ohos.permission.USE_BLUETOOTH

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_PLAYING_STATE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_PLAYING_STATE_UPDATE: String = "usual.event.bluetooth.a2dpsource.PLAYING_STATE_UPDATE"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for changed Bluetooth A2DP playing state.

**Required Permission:** ohos.permission.USE_BLUETOOTH

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AG_CALL_STATE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AG_CALL_STATE_UPDATE: String = "usual.event.bluetooth.handsfreeunit.AG_CALL_STATE_UPDATE"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for changed Bluetooth hands-free call state.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AG_COMMON_EVENT
```cangjie
public static const COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AG_COMMON_EVENT: String = "usual.event.bluetooth.handsfreeunit.AG_COMMON_EVENT"
```

**Function:** (Reserved event, not currently supported) Indicates a common event for Bluetooth hands-free audio gateway status changes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AUDIO_STATE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AUDIO_STATE_UPDATE: String = "usual.event.bluetooth.handsfreeunit.AUDIO_STATE_UPDATE"
```

**Function:** (Reserved event, not currently supported) Indicates a common event for Bluetooth hands-free audio status changes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_CONNECT_STATE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_CONNECT_STATE_UPDATE: String = "usual.event.bluetooth.handsfreeunit.CONNECT_STATE_UPDATE"
```

**Function:** (Reserved event, not currently supported) Indicates a common event for Bluetooth hands-free connection status changes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_AUDIO_STATE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_AUDIO_STATE_UPDATE: String = "usual.event.bluetooth.handsfree.ag.AUDIO_STATE_UPDATE"
```

**Function:** (Reserved event, not currently supported) Indicates a common event for Bluetooth A2DP connection status changes.

**Required Permission:** ohos.permission.USE_BLUETOOTH

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_CONNECT_STATE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_CONNECT_STATE_UPDATE: String = "usual.event.bluetooth.handsfree.ag.CONNECT_STATE_UPDATE"
```

**Function:** (Reserved event, not currently supported) Indicates a common event for Bluetooth hands-free communication connection status changes.

**Required Permission:** ohos.permission.USE_BLUETOOTH

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_CURRENT_DEVICE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_CURRENT_DEVICE_UPDATE: String = "usual.event.bluetooth.handsfree.ag.CURRENT_DEVICE_UPDATE"
```

**Function:** (Reserved event, not currently supported) Indicates a common event when a device connected to Bluetooth hands-free becomes active.

**Required Permission:** ohos.permission.USE_BLUETOOTH

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HOST_DISCOVERY_FINISHED

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HOST_DISCOVERY_FINISHED: String = "usual.event.bluetooth.host.DISCOVERY_FINISHED"
```

**Function:** Indicates a common event for Bluetooth scan completion on the device.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HOST_DISCOVERY_STARTED

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HOST_DISCOVERY_STARTED: String = "usual.event.bluetooth.host.DISCOVERY_STARTED"
```

**Function:** Indicates a common event for Bluetooth scan initiation on the device.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HOST_NAME_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HOST_NAME_UPDATE: String = "usual.event.bluetooth.host.NAME_UPDATE"
```

**Function:** Indicates a common event for Bluetooth adapter name changes on the device.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HOST_REQ_DISABLE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HOST_REQ_DISABLE: String = "usual.event.bluetooth.host.REQ_DISABLE"
```

**Function:** (Reserved event, not currently supported) Indicates a common event for user request to disable Bluetooth.

**Required Permission:** ohos.permission.USE_BLUETOOTH

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HOST_REQ_DISCOVERABLE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HOST_REQ_DISCOVERABLE: String = "usual.event.bluetooth.host.REQ_DISCOVERABLE"
```

**Function:** Indicates a common event for user permission to scan Bluetooth requests.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HOST_REQ_ENABLE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HOST_REQ_ENABLE: String = "usual.event.bluetooth.host.REQ_ENABLE"
```

**Function:** (Reserved event, not currently supported) Indicates a common event for user request to enable Bluetooth.

**Required Permission:** ohos.permission.USE_BLUETOOTH

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HOST_SCAN_MODE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HOST_SCAN_MODE_UPDATE: String = "usual.event.bluetooth.host.SCAN_MODE_UPDATE"
```

**Function:** (Reserved event, not currently supported) Indicates a common event for Bluetooth scan mode changes on the device.

**Required Permission:** ohos.permission.USE_BLUETOOTH

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HOST_STATE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HOST_STATE_UPDATE: String = "usual.event.bluetooth.host.STATE_UPDATE"
```

**Function:** Indicates a common event for Bluetooth adapter status changes, such as Bluetooth being turned on or off.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_ACL_CONNECTED

```cangjie
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_ACL_CONNECTED: String = "usual.event.bluetooth.remotedevice.ACL_CONNECTED"
```

**Function:** (Reserved event, not currently supported) Indicates a common event for establishing a low-level (ACL) connection with a remote Bluetooth device.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_ACL_DISCONNECTED

```cangjie
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_ACL_DISCONNECTED: String = "usual.event.bluetooth.remotedevice.ACL_DISCONNECTED"
```

**Function:** (Reserved event, not currently supported) Indicates a common event for disconnection of low-level (ACL) connection from a remote Bluetooth device.

**Required Permission:** ohos.permission.USE_BLUETOOTH

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_BATTERY_VALUE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_BATTERY_VALUE_UPDATE: String = "usual.event.bluetooth.remotedevice.BATTERY_VALUE_UPDATE"
```

**Function:** (Reserved event, not currently supported) Indicates a common event when a remote Bluetooth device's battery level is retrieved for the first time or changed since last retrieval.

**Required Permission:** ohos.permission.USE_BLUETOOTH

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CLASS_VALUE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CLASS_VALUE_UPDATE: String = "usual.event.bluetooth.remotedevice.CLASS_VALUE_UPDATE"
```

**Function:** (Reserved event, not currently supported) Indicates a common event for Bluetooth class changes of a remote device.

**Required Permission:** ohos.permission.USE_BLUETOOTH

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_CANCEL

```cangjie
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_CANCEL: String = "usual.event.bluetooth.remotedevice.CONNECT_CANCEL"
```

**Function:** (Reserved event, not currently supported) Indicates a common event for cancellation of connection with a remote Bluetooth device.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_REPLY

```cangjie
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_REPLY: String = "usual.event.bluetooth.remotedevice.CONNECT_REPLY"
```

**Function:** (Reserved event, not currently supported) Indicates a common event for response to connection request from a remote Bluetooth device.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent**Initial Version:** 21  

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_REQ  

```cangjie  
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_REQ: String = "usual.event.bluetooth.remotedevice.CONNECT_REQ"  
```  

**Description:** (Reserved event, not yet supported) Indicates a common event for remote Bluetooth device connection requests.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_DISCOVERED  

```cangjie  
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_DISCOVERED: String = "usual.event.bluetooth.remotedevice.DISCOVERED"  
```  

**Description:** (Reserved event, not yet supported) Indicates a common event for discovering remote Bluetooth devices.  

**Required Permissions for Subscribers:** ohos.permission.LOCATION and ohos.permission.USE_BLUETOOTH  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_NAME_UPDATE  

```cangjie  
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_NAME_UPDATE: String = "usual.event.bluetooth.remotedevice.NAME_UPDATE"  
```  

**Description:** Indicates a common event for the first retrieval or subsequent update of the friendly name of a remote Bluetooth device.  

**Required Permissions for Subscribers:** ohos.permission.ACCESS_BLUETOOTH  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIRING_CANCEL  

```cangjie  
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIRING_CANCEL: String = "usual.event.bluetooth.remotedevice.PAIRING_CANCEL"  
```  

**Description:** (Reserved event, not yet supported) Indicates a common event for canceling Bluetooth pairing.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIRING_REQ  

```cangjie  
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIRING_REQ: String = "usual.event.bluetooth.remotedevice.PAIRING_REQ"  
```  

**Description:** (Reserved event, not yet supported) Indicates a common event for remote Bluetooth device pairing requests.  

**Required Permissions for Subscribers:** ohos.permission.DISCOVER_BLUETOOTH  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIR_STATE  

```cangjie  
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIR_STATE: String = "usual.event.bluetooth.remotedevice.PAIR_STATE"  
```  

**Description:** (Reserved event, not yet supported) Indicates a common event for changes in the connection state of a remote Bluetooth device.  

**Required Permissions for Subscribers:** ohos.permission.USE_BLUETOOTH  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_SDP_RESULT  

```cangjie  
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_SDP_RESULT: String = "usual.event.bluetooth.remotedevice.SDP_RESULT"  
```  

**Description:** (Reserved event, not yet supported) Indicates a common event for the SDP state of a remote Bluetooth device.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_UUID_VALUE  

```cangjie  
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_UUID_VALUE: String = "usual.event.bluetooth.remotedevice.UUID_VALUE"  
```  

**Description:** Indicates a common event for the UUID connection state of a remote Bluetooth device.  

**Required Permissions for Subscribers:** ohos.permission.ACCESS_BLUETOOTH  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_BOOT_COMPLETED  

```cangjie  
public static const COMMON_EVENT_BOOT_COMPLETED: String = "usual.event.BOOT_COMPLETED"  
```  

**Description:** Indicates a common event for when the user has completed booting and the system is loaded.  

**Required Permissions for Subscribers:** ohos.permission.RECEIVER_STARTUP_COMPLETED (This permission can only be requested by system applications.)  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_BUNDLE_REMOVED  

```cangjie  
public static const COMMON_EVENT_BUNDLE_REMOVED: String = "usual.event.BUNDLE_REMOVED"  
```  

**Description:** (Reserved event, not yet supported) Indicates a common event for when an installed bundle has been uninstalled from the device, but the application data is still retained.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_CALL_STATE_CHANGED  

```cangjie  
public static const COMMON_EVENT_CALL_STATE_CHANGED: String = "usual.event.CALL_STATE_CHANGED"  
```  

**Description:** Indicates a common event for call state updates.  

**Required Permissions for Subscribers:** ohos.permission.GET_TELEPHONY_STATE (This permission can only be requested by system applications.)  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_CELLULAR_DATA_STATE_CHANGED  

```cangjie  
public static const COMMON_EVENT_CELLULAR_DATA_STATE_CHANGED: String = "usual.event.CELLULAR_DATA_STATE_CHANGED"  
```  

**Description:** Indicates a common event for cellular data state updates.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_CHARGE_IDLE_MODE_CHANGED  

```cangjie  
public static const COMMON_EVENT_CHARGE_IDLE_MODE_CHANGED: String = "usual.event.CHARGE_IDLE_MODE_CHANGED"  
```  

**Description:** Indicates a common event for when the device enters charging idle mode.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_CHARGE_TYPE_CHANGED  

```cangjie  
public static const COMMON_EVENT_CHARGE_TYPE_CHANGED: String = "usual.event.CHARGE_TYPE_CHANGED"  
```  

**Description:** Indicates a common event for changes in the system charging type. Only for system applications.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_CHARGING  

```cangjie  
public static const COMMON_EVENT_CHARGING: String = "usual.event.CHARGING"  
```  

**Description:** Indicates a common event for when the system starts charging the battery.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_CLOSE_SYSTEM_DIALOGS  

```cangjie  
public static const COMMON_EVENT_CLOSE_SYSTEM_DIALOGS: String = "usual.event.CLOSE_SYSTEM_DIALOGS"  
```  

**Description:** (Reserved event, not yet supported) Indicates a common event for when the user closes temporary system dialogs.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_CONFIGURATION_CHANGED  

```cangjie  
public static const COMMON_EVENT_CONFIGURATION_CHANGED: String = "usual.event.CONFIGURATION_CHANGED"  
```  

**Description:** (Reserved event, not yet supported) Indicates a common event for when the device state (e.g., orientation and locale) has changed.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_CONNECTIVITY_CHANGE  

```cangjie  
public static const COMMON_EVENT_CONNECTIVITY_CHANGE: String = "usual.event.CONNECTIVITY_CHANGE"  
```  

**Description:** Indicates a common event for network connection state changes.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_DATE_CHANGED  

```cangjie  
public static const COMMON_EVENT_DATE_CHANGED: String = "usual.event.DATE_CHANGED"  
```  

**Description:** (Reserved event, not yet supported) Indicates a common event for when the system date has changed.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_DEVICE_IDLE_EXEMPTION_LIST_UPDATED  

```cangjie  
public static const COMMON_EVENT_DEVICE_IDLE_EXEMPTION_LIST_UPDATED: String = "usual.event.DEVICE_IDLE_EXEMPTION_LIST_UPDATED"  
```  

**Description:** Indicates a common event for when the exemption list of applications in system standby idle mode has been updated. Only for system applications.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_DEVICE_IDLE_MODE_CHANGED  

```cangjie
public static const COMMON_EVENT_DEVICE_IDLE_MODE_CHANGED: String = "usual.event.DEVICE_IDLE_MODE_CHANGED"
```

**Description:** Represents a common event indicating that the system idle mode has changed.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DISCHARGING

```cangjie
public static const COMMON_EVENT_DISCHARGING: String = "usual.event.DISCHARGING"
```

**Description:** Represents a common event indicating that the system has stopped charging the battery.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DISK_BAD_REMOVAL

```cangjie
public static const COMMON_EVENT_DISK_BAD_REMOVAL: String = "usual.event.data.DISK_BAD_REMOVAL"
```

**Description:** (Reserved event, not yet supported) Represents a common event indicating that the external storage device status has changed to removed while mounted.

**Required Permission:** ohos.permission.STORAGE_MANAGER (This permission can only be requested by system applications)

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DISK_EJECT

```cangjie
public static const COMMON_EVENT_DISK_EJECT: String = "usual.event.data.DISK_EJECT"
```

**Description:** (Reserved event, not yet supported) Represents a common event indicating that the user has expressed the intention to remove the external storage medium.

**Required Permission:** ohos.permission.STORAGE_MANAGER (This permission can only be requested by system applications)

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DISK_MOUNTED

```cangjie
public static const COMMON_EVENT_DISK_MOUNTED: String = "usual.event.data.DISK_MOUNTED"
```

**Description:** (Reserved event, not yet supported) Represents a common event indicating that the external storage device status has changed to mounted.

**Required Permission:** ohos.permission.STORAGE_MANAGER (This permission can only be requested by system applications)

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DISK_REMOVED

```cangjie
public static const COMMON_EVENT_DISK_REMOVED: String = "usual.event.data.DISK_REMOVED"
```

**Description:** (Reserved event, not yet supported) Represents a common event indicating that the external storage device status has changed to removed.

**Required Permission:** ohos.permission.STORAGE_MANAGER (This permission can only be requested by system applications)

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DISK_UNMOUNTABLE

```cangjie
public static const COMMON_EVENT_DISK_UNMOUNTABLE: String = "usual.event.data.DISK_UNMOUNTABLE"
```

**Description:** (Reserved event, not yet supported) Represents a common event indicating that the external storage device status has changed to unmountable while inserted.

**Required Permission:** ohos.permission.STORAGE_MANAGER (This permission can only be requested by system applications)

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DISK_UNMOUNTED

```cangjie
public static const COMMON_EVENT_DISK_UNMOUNTED: String = "usual.event.data.DISK_UNMOUNTED"
```

**Description:** (Reserved event, not yet supported) Represents a common event indicating that the external storage device status has changed to unmounted.

**Required Permission:** ohos.permission.STORAGE_MANAGER (This permission can only be requested by system applications)

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGIN

```cangjie
public static const COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGIN: String = "common.event.DISTRIBUTED_ACCOUNT_LOGIN"
```

**Description:** (Reserved event, not yet supported) Represents a common event indicating successful distributed account login.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGOFF

```cangjie
public static const COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGOFF: String = "common.event.DISTRIBUTED_ACCOUNT_LOGOFF"
```

**Description:** (Reserved event, not yet supported) Represents a common event indicating distributed account logout.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGOUT

```cangjie
public static const COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGOUT: String = "common.event.DISTRIBUTED_ACCOUNT_LOGOUT"
```

**Description:** (Reserved event, not yet supported) Represents a common event indicating successful distributed account logout.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DISTRIBUTED_ACCOUNT_TOKEN_INVALID

```cangjie
public static const COMMON_EVENT_DISTRIBUTED_ACCOUNT_TOKEN_INVALID: String = "common.event.DISTRIBUTED_ACCOUNT_TOKEN_INVALID"
```

**Description:** (Reserved event, not yet supported) Represents a common event indicating that the distributed account token is invalid.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DOMAIN_ACCOUNT_STATUS_CHANGED

```cangjie
public static const COMMON_EVENT_DOMAIN_ACCOUNT_STATUS_CHANGED: String = "usual.event.DOMAIN_ACCOUNT_STATUS_CHANGED"
```

**Description:** Represents a common event indicating that the domain account status has changed.

**Required Permission:** ohos.permission.GET_LOCAL_ACCOUNTS (This permission can only be requested by system applications)

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DRIVE_MODE

```cangjie
public static const COMMON_EVENT_DRIVE_MODE: String = "common.event.DRIVE_MODE"
```

**Description:** (Reserved event, not yet supported) Represents a common event indicating that the system is in drive mode.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_EXTERNAL_APPLICATIONS_AVAILABLE

```cangjie
public static const COMMON_EVENT_EXTERNAL_APPLICATIONS_AVAILABLE: String = "usual.event.EXTERNAL_APPLICATIONS_AVAILABLE"
```

**Description:** (Reserved event, not yet supported) Represents a common event indicating that applications installed on external storage are available to the system.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_EXTERNAL_APPLICATIONS_UNAVAILABLE

```cangjie
public static const COMMON_EVENT_EXTERNAL_APPLICATIONS_UNAVAILABLE: String = "usual.event.EXTERNAL_APPLICATIONS_UNAVAILABLE"
```

**Description:** (Reserved event, not yet supported) Represents a common event indicating that applications installed on external storage are unavailable to the system.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_FOUNDATION_READY

```cangjie
public static const COMMON_EVENT_FOUNDATION_READY: String = "common.event.FOUNDATION_READY"
```

**Description:** (Reserved event, not yet supported) Represents a common event indicating that the foundation is ready.

**Required Permission:** ohos.permission.RECEIVER_STARTUP_COMPLETED (This permission can only be requested by system applications)

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_HOME_MODE

```cangjie
public static const COMMON_EVENT_HOME_MODE: String = "common.event.HOME_MODE"
```

**Description:** (Reserved event, not yet supported) Represents a common event indicating that the system is in HOME mode.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_HTTP_PROXY_CHANGE

```cangjie
public static const COMMON_EVENT_HTTP_PROXY_CHANGE: String = "usual.event.HTTP_PROXY_CHANGE"
```

**Description:** Represents a common event indicating that the HTTP proxy configuration has changed.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_INCOMING_CALL_MISSED

```cangjie
public static const COMMON_EVENT_INCOMING_CALL_MISSED: String = "usual.event.INCOMING_CALL_MISSED"
```

**Description:** Represents a common event indicating a missed incoming call.

**Required Permission:** ohos.permission.GET_TELEPHONY_STATE (This permission can only be requested by system applications)

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_IVI_ACTIVE

```cangjie
public static const COMMON_EVENT_IVI_ACTIVE: String = "common.event.IVI_ACTIVE"
```
**Function:** (Reserved event, not yet supported) Indicates a public event where the battery service is active.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_IVI_EXTREME_TEMPERATURE

```cangjie
public static const COMMON_EVENT_IVI_EXTREME_TEMPERATURE: String = "common.event.IVI_EXTREME_TEMPERATURE"
```

**Function:** (Reserved event, not yet supported) Indicates a public event where the IVI temperature is extremely high.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_IVI_HIGH_TEMPERATURE

```cangjie
public static const COMMON_EVENT_IVI_HIGH_TEMPERATURE: String = "common.event.IVI_HIGH_TEMPERATURE"
```

**Function:** (Reserved event, not yet supported) Indicates a public event where the IVI temperature is excessively high.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_IVI_LASTMODE_SAVE

```cangjie
public static const COMMON_EVENT_IVI_LASTMODE_SAVE: String = "common.event.IVI_LASTMODE_SAVE"
```

**Function:** (Reserved event, not yet supported) Indicates a public event where a third-party application saves its last mode.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_IVI_PAUSE

```cangjie
public static const COMMON_EVENT_IVI_PAUSE: String = "common.event.IVI_PAUSE"
```

**Function:** (Reserved event, not yet supported) Indicates a public event where the IVI has entered sleep mode and notifies applications to stop playback.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_IVI_SLEEP

```cangjie
public static const COMMON_EVENT_IVI_SLEEP: String = "common.event.IVI_SLEEP"
```

**Function:** (Reserved event, not yet supported) Indicates a public event where the vehicle's In-Vehicle Infotainment (IVI) system is entering sleep mode.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_IVI_STANDBY

```cangjie
public static const COMMON_EVENT_IVI_STANDBY: String = "common.event.IVI_STANDBY"
```

**Function:** (Reserved event, not yet supported) Indicates a public event where a third-party application pauses its current operation.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_IVI_TEMPERATURE_ABNORMAL

```cangjie
public static const COMMON_EVENT_IVI_TEMPERATURE_ABNORMAL: String = "common.event.IVI_TEMPERATURE_ABNORMAL"
```

**Function:** (Reserved event, not yet supported) Indicates a public event where the vehicle system has extreme temperature conditions.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_IVI_TEMPERATURE_RECOVERY

```cangjie
public static const COMMON_EVENT_IVI_TEMPERATURE_RECOVERY: String = "common.event.IVI_TEMPERATURE_RECOVERY"
```

**Function:** (Reserved event, not yet supported) Indicates a public event where the vehicle system temperature has returned to normal.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_IVI_VOLTAGE_ABNORMAL

```cangjie
public static const COMMON_EVENT_IVI_VOLTAGE_ABNORMAL: String = "common.event.IVI_VOLTAGE_ABNORMAL"
```

**Function:** (Reserved event, not yet supported) Indicates a public event where the vehicle power system voltage is abnormal.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_IVI_VOLTAGE_RECOVERY

```cangjie
public static const COMMON_EVENT_IVI_VOLTAGE_RECOVERY: String = "common.event.IVI_VOLTAGE_RECOVERY"
```

**Function:** (Reserved event, not yet supported) Indicates a public event where the vehicle power system voltage has returned to normal.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_LOCALE_CHANGED

```cangjie
public static const COMMON_EVENT_LOCALE_CHANGED: String = "usual.event.LOCALE_CHANGED"
```

**Function:** Indicates a public event where the device locale setting has changed.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_LOCATION_MODE_STATE_CHANGED

```cangjie
public static const COMMON_EVENT_LOCATION_MODE_STATE_CHANGED: String = "usual.event.location.MODE_STATE_CHANGED"
```

**Function:** (Reserved event, not yet supported) Indicates a public event where the system location mode has changed.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_LOCKED_BOOT_COMPLETED

```cangjie
public static const COMMON_EVENT_LOCKED_BOOT_COMPLETED: String = "usual.event.LOCKED_BOOT_COMPLETED"
```

**Function:** (Reserved event, not yet supported) Indicates a public event where the user has completed booting, the system is loaded, but the screen remains locked.

**Required Permission for Subscribers:** ohos.permission.RECEIVER_STARTUP_COMPLETED (This permission can only be requested by system applications.)

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_MANAGE_PACKAGE_STORAGE

```cangjie
public static const COMMON_EVENT_MANAGE_PACKAGE_STORAGE: String = "usual.event.MANAGE_PACKAGE_STORAGE"
```

**Function:** (Reserved event, not yet supported) Indicates a public event where the device storage space is insufficient.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_MY_PACKAGE_REPLACED

```cangjie
public static const COMMON_EVENT_MY_PACKAGE_REPLACED: String = "usual.event.MY_PACKAGE_REPLACED"
```

**Function:** (Reserved event, not yet supported) Indicates a public event where a new version of the application package has replaced the previous version.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_MY_PACKAGE_SUSPENDED

```cangjie
public static const COMMON_EVENT_MY_PACKAGE_SUSPENDED: String = "usual.event.MY_PACKAGE_SUSPENDED"
```

**Function:** Indicates a public event where the application package is suspended.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_MY_PACKAGE_UNSUSPENDED

```cangjie
public static const COMMON_EVENT_MY_PACKAGE_UNSUSPENDED: String = "usual.event.MY_PACKAGE_UNSUSPENDED"
```

**Function:** Indicates a public event where the application package is not suspended.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_NETWORK_STATE_CHANGED

```cangjie
public static const COMMON_EVENT_NETWORK_STATE_CHANGED: String = "usual.event.NETWORK_STATE_CHANGED"
```

**Function:** Indicates a public event where the network status is updated.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_NFC_ACTION_ADAPTER_STATE_CHANGED

```cangjie
public static const COMMON_EVENT_NFC_ACTION_ADAPTER_STATE_CHANGED: String = "usual.event.nfc.action.ADAPTER_STATE_CHANGED"
```

**Function:** Indicates a public event where the device's NFC state has changed.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_NFC_ACTION_RF_FIELD_OFF_DETECTED

```cangjie
public static const COMMON_EVENT_NFC_ACTION_RF_FIELD_OFF_DETECTED: String = "usual.event.nfc.action.RF_FIELD_OFF_DETECTED"
```

**Function:** Indicates a public event where the NFC field strength has been detected to leave.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_NFC_ACTION_RF_FIELD_ON_DETECTED

```cangjie
public static const COMMON_EVENT_NFC_ACTION_RF_FIELD_ON_DETECTED: String = "usual.event.nfc.action.RF_FIELD_ON_DETECTED"
```

**Function:** Indicates a public event where the NFC field strength has been detected to enter.

**Type:** String**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_OFFICE_MODE

```cangjie
public static const COMMON_EVENT_OFFICE_MODE: String = "common.event.OFFICE_MODE"
```

**Description:** (Reserved event, not currently supported) Indicates a public event when the system enters office mode.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_OPERATOR_CONFIG_CHANGED

```cangjie
public static const COMMON_EVENT_OPERATOR_CONFIG_CHANGED: String = "usual.event.OPERATOR_CONFIG_CHANGED"
```

**Description:** Indicates a public event when carrier configuration has been updated.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_PACKAGES_SUSPENDED

```cangjie
public static const COMMON_EVENT_PACKAGES_SUSPENDED: String = "usual.event.PACKAGES_SUSPENDED"
```

**Description:** (Reserved event, not currently supported) Indicates a public event when application packages have been suspended.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_PACKAGES_UNSUSPENDED

```cangjie
public static const COMMON_EVENT_PACKAGES_UNSUSPENDED: String = "usual.event.PACKAGES_UNSUSPENDED"
```

**Description:** (Reserved event, not currently supported) Indicates a public event when application packages are no longer suspended.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_PACKAGE_ADDED

```cangjie
public static const COMMON_EVENT_PACKAGE_ADDED: String = "usual.event.PACKAGE_ADDED"
```

**Description:** Indicates a public event when a new application package has been installed on the device.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_PACKAGE_CACHE_CLEARED

```cangjie
public static const COMMON_EVENT_PACKAGE_CACHE_CLEARED: String = "usual.event.PACKAGE_CACHE_CLEARED"
```

**Description:** Indicates a public event when a user clears the cache data of an application package.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_PACKAGE_CHANGED

```cangjie
public static const COMMON_EVENT_PACKAGE_CHANGED: String = "usual.event.PACKAGE_CHANGED"
```

**Description:** Indicates a public event when an application package has been changed (e.g., components in the package are enabled or disabled).

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_PACKAGE_DATA_CLEARED

```cangjie
public static const COMMON_EVENT_PACKAGE_DATA_CLEARED: String = "usual.event.PACKAGE_DATA_CLEARED"
```

**Description:** Indicates a public event when a user clears the data of an application package.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_PACKAGE_FIRST_LAUNCH

```cangjie
public static const COMMON_EVENT_PACKAGE_FIRST_LAUNCH: String = "usual.event.PACKAGE_FIRST_LAUNCH"
```

**Description:** (Reserved event, not currently supported) Indicates a public event when an installed application is launched for the first time.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_PACKAGE_FULLY_REMOVED

```cangjie
public static const COMMON_EVENT_PACKAGE_FULLY_REMOVED: String = "usual.event.PACKAGE_FULLY_REMOVED"
```

**Description:** (Reserved event, not currently supported) Indicates a public event when an installed application has been completely uninstalled from the device (including application data and code).

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_PACKAGE_NEEDS_VERIFICATION

```cangjie
public static const COMMON_EVENT_PACKAGE_NEEDS_VERIFICATION: String = "usual.event.PACKAGE_NEEDS_VERIFICATION"
```

**Description:** (Reserved event, not currently supported) Indicates a public event when an application requires system verification.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_PACKAGE_REMOVED

```cangjie
public static const COMMON_EVENT_PACKAGE_REMOVED: String = "usual.event.PACKAGE_REMOVED"
```

**Description:** Indicates a public event when an installed application has been uninstalled from the device, but its data is retained.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_PACKAGE_REPLACED

```cangjie
public static const COMMON_EVENT_PACKAGE_REPLACED: String = "usual.event.PACKAGE_REPLACED"
```

**Description:** (Reserved event, not currently supported) Indicates a public event when a new version of an installed application package has replaced the old version on the device.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_PACKAGE_RESTARTED

```cangjie
public static const COMMON_EVENT_PACKAGE_RESTARTED: String = "usual.event.PACKAGE_RESTARTED"
```

**Description:** Indicates a public event when a user restarts an application package and kills all its processes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_PACKAGE_VERIFIED

```cangjie
public static const COMMON_EVENT_PACKAGE_VERIFIED: String = "usual.event.PACKAGE_VERIFIED"
```

**Description:** (Reserved event, not currently supported) Indicates a public event when an application has been verified by the system.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_POWER_CONNECTED

```cangjie
public static const COMMON_EVENT_POWER_CONNECTED: String = "usual.event.POWER_CONNECTED"
```

**Description:** Indicates a public event when the device is connected to an external power source.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_POWER_DISCONNECTED

```cangjie
public static const COMMON_EVENT_POWER_DISCONNECTED: String = "usual.event.POWER_DISCONNECTED"
```

**Description:** Indicates a public event when the device is disconnected from an external power source.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_POWER_SAVE_MODE_CHANGED

```cangjie
public static const COMMON_EVENT_POWER_SAVE_MODE_CHANGED: String = "usual.event.POWER_SAVE_MODE_CHANGED"
```

**Description:** Indicates a public event when the system's power save mode has changed.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_PRIMARY_SLOT_ROAMING

```cangjie
public static const COMMON_EVENT_PRIMARY_SLOT_ROAMING: String = "usual.event.PRIMARY_SLOT_ROAMING"
```

**Description:** Indicates a public event when the roaming status of the default primary SIM card has been updated.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_PRIVACY_STATE_CHANGED

```cangjie
public static const COMMON_EVENT_PRIVACY_STATE_CHANGED: String = "usual.event.PRIVACY_STATE_CHANGED"
```

**Description:** Indicates a public event when the action to set the default primary SIM card is in progress or completed.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_QUICK_FIX_APPLY_RESULT

```cangjie
public static const COMMON_EVENT_QUICK_FIX_APPLY_RESULT: String = "usual.event.QUICK_FIX_APPLY_RESULT"
```

**Description:** Indicates a public event for quick fix application results.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_QUICK_FIX_REVOKE_RESULT
```cangjie
public static const COMMON_EVENT_QUICK_FIX_REVOKE_RESULT: String = "usual.event.QUICK_FIX_REVOKE_RESULT"
```

**Function:** Represents a public event for revoking quick fixes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_RADIO_STATE_CHANGE

```cangjie
public static const COMMON_EVENT_RADIO_STATE_CHANGE: String = "usual.event.RADIO_STATE_CHANGE"
```

**Function:** Represents a public event for modem power state changes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SCREEN_LOCKED

```cangjie
public static const COMMON_EVENT_SCREEN_LOCKED: String = "usual.event.SCREEN_LOCKED"
```

**Function:** Represents a public event for screen locking.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SCREEN_OFF

```cangjie
public static const COMMON_EVENT_SCREEN_OFF: String = "usual.event.SCREEN_OFF"
```

**Function:** Represents a public event when the device screen turns off and enters sleep mode.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SCREEN_ON

```cangjie
public static const COMMON_EVENT_SCREEN_ON: String = "usual.event.SCREEN_ON"
```

**Function:** Represents a public event when the device screen turns on and enters interactive mode.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SCREEN_UNLOCKED

```cangjie
public static const COMMON_EVENT_SCREEN_UNLOCKED: String = "usual.event.SCREEN_UNLOCKED"
```

**Function:** Represents a public event for screen unlocking.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SET_PRIMARY_SLOT_STATUS

```cangjie
public static const COMMON_EVENT_SET_PRIMARY_SLOT_STATUS: String = "usual.event.SET_PRIMARY_SLOT_STATUS"
```

**Function:** Indicates the action of setting the default primary SIM card, with status updated to in-progress or completed.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SHUTDOWN

```cangjie
public static const COMMON_EVENT_SHUTDOWN: String = "usual.event.SHUTDOWN"
```

**Function:** Represents a public event when the device is shutting down.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SIGNAL_INFO_CHANGED

```cangjie
public static const COMMON_EVENT_SIGNAL_INFO_CHANGED: String = "usual.event.SIGNAL_INFO_CHANGED"
```

**Function:** Represents a public event for signal information updates.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SIM_CARD_DEFAULT_DATA_SUBSCRIPTION_CHANGED

```cangjie
public static const COMMON_EVENT_SIM_CARD_DEFAULT_DATA_SUBSCRIPTION_CHANGED: String = "usual.event.SIM.DEFAULT_DATA_SUBSCRIPTION_CHANGED"
```

**Function:** Represents a public event when the default data SIM card is updated.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SIM_CARD_DEFAULT_MAIN_SUBSCRIPTION_CHANGED

```cangjie
public static const COMMON_EVENT_SIM_CARD_DEFAULT_MAIN_SUBSCRIPTION_CHANGED: String = "usual.event.SIM.DEFAULT_MAIN_SUBSCRIPTION_CHANGED"
```

**Function:** Represents a public event when the default primary SIM card is updated.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SIM_CARD_DEFAULT_SMS_SUBSCRIPTION_CHANGED

```cangjie
public static const COMMON_EVENT_SIM_CARD_DEFAULT_SMS_SUBSCRIPTION_CHANGED: String = "usual.event.SIM.DEFAULT_SMS_SUBSCRIPTION_CHANGED"
```

**Function:** Represents a public event when the default SMS SIM card is updated.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SIM_CARD_DEFAULT_VOICE_SUBSCRIPTION_CHANGED

```cangjie
public static const COMMON_EVENT_SIM_CARD_DEFAULT_VOICE_SUBSCRIPTION_CHANGED: String = "usual.event.SIM.DEFAULT_VOICE_SUBSCRIPTION_CHANGED"
```

**Function:** Represents a public event when the default voice SIM card is updated.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SIM_STATE_CHANGED

```cangjie
public static const COMMON_EVENT_SIM_STATE_CHANGED: String = "usual.event.SIM_STATE_CHANGED"
```

**Function:** Represents a public event for SIM card state updates.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SLOT_CHANGE

```cangjie
public static const COMMON_EVENT_SLOT_CHANGE: String = "usual.event.SLOT_CHANGE"
```

**Function:** Represents a public event for notification channel updates.

**Required Permission:** ohos.permission.NOTIFICATION_CONTROLLER

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SMS_CB_RECEIVE_COMPLETED

```cangjie
public static const COMMON_EVENT_SMS_CB_RECEIVE_COMPLETED: String = "usual.event.SMS_CB_RECEIVE_COMPLETED"
```

**Function:** Represents a public event when cell broadcast SMS reception is completed.

**Required Permission:** ohos.permission.RECEIVE_SMS (This permission is only available to system applications)

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SMS_EMERGENCY_CB_RECEIVE_COMPLETED

```cangjie
public static const COMMON_EVENT_SMS_EMERGENCY_CB_RECEIVE_COMPLETED: String = "usual.event.SMS_EMERGENCY_CB_RECEIVE_COMPLETED"
```

**Function:** Represents a public event when emergency cell broadcast SMS reception is completed.

**Required Permission:** ohos.permission.RECEIVE_SMS (This permission is only available to system applications)

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SMS_RECEIVE_COMPLETED

```cangjie
public static const COMMON_EVENT_SMS_RECEIVE_COMPLETED: String = "usual.event.SMS_RECEIVE_COMPLETED"
```

**Function:** Represents the action of receiving a message on the device.

**Required Permission:** ohos.permission.RECEIVE_SMS (This permission is only available to system applications)

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SMS_WAPPUSH_RECEIVE_COMPLETED

```cangjie
public static const COMMON_EVENT_SMS_WAPPUSH_RECEIVE_COMPLETED: String = "usual.event.SMS_WAPPUSH_RECEIVE_COMPLETED"
```

**Function:** Represents a public event when WAP push SMS reception is completed.

**Required Permission:** ohos.permission.RECEIVE_SMS (This permission is only available to system applications)

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SPECIAL_CODE

```cangjie
public static const COMMON_EVENT_SPECIAL_CODE: String = "common.event.SPECIAL_CODE"
```

**Function:** Indicates successful sending of a secret code. When a secret code is successfully sent on the device, the event notification service will publish this system public event.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SPLIT_SCREEN

```cangjie
public static const COMMON_EVENT_SPLIT_SCREEN: String = "common.event.SPLIT_SCREEN"
```

**Function:** Represents a public event for split-screen mode.

**Required Permission:** ohos.permission.RECEIVER_SPLIT_SCREEN

**Type:** String**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_SPN_INFO_CHANGED  

```cangjie  
public static const COMMON_EVENT_SPN_INFO_CHANGED: String = "usual.event.SPN_INFO_CHANGED"  
```  

**Description:** Indicates the common event for updated SPN display information.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_STK_ALPHA_IDENTIFIER  

```cangjie  
public static const COMMON_EVENT_STK_ALPHA_IDENTIFIER: String = "usual.event.STK_ALPHA_IDENTIFIER"  
```  

**Description:** (Reserved event, not yet supported) Indicates the common event for STK ALPHA identifier.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_STK_CARD_STATE_CHANGED  

```cangjie  
public static const COMMON_EVENT_STK_CARD_STATE_CHANGED: String = "usual.event.STK_CARD_STATE_CHANGED"  
```  

**Description:** (Reserved event, not yet supported) Indicates the common event for updated STK card state.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_STK_COMMAND  

```cangjie  
public static const COMMON_EVENT_STK_COMMAND: String = "usual.event.STK_COMMAND"  
```  

**Description:** (Reserved event, not yet supported) Indicates the common event for sending STK commands.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_STK_SESSION_END  

```cangjie  
public static const COMMON_EVENT_STK_SESSION_END: String = "usual.event.STK_SESSION_END"  
```  

**Description:** (Reserved event, not yet supported) Indicates the common event for the end of an STK session.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_THERMAL_LEVEL_CHANGED  

```cangjie  
public static const COMMON_EVENT_THERMAL_LEVEL_CHANGED: String = "usual.event.THERMAL_LEVEL_CHANGED"  
```  

**Description:** Indicates the common event for the thermal state of the device.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_TIMEZONE_CHANGED  

```cangjie  
public static const COMMON_EVENT_TIMEZONE_CHANGED: String = "usual.event.TIMEZONE_CHANGED"  
```  

**Description:** Indicates the common event for a change in the system timezone.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_TIME_CHANGED  

```cangjie  
public static const COMMON_EVENT_TIME_CHANGED: String = "usual.event.TIME_CHANGED"  
```  

**Description:** Indicates the common event for setting the system time.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_TIME_TICK  

```cangjie  
public static const COMMON_EVENT_TIME_TICK: String = "usual.event.TIME_TICK"  
```  

**Description:** Indicates the common event for a change in the system time.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_UID_REMOVED  

```cangjie  
public static const COMMON_EVENT_UID_REMOVED: String = "usual.event.UID_REMOVED"  
```  

**Description:** (Reserved event, not yet supported) Indicates the common event for the removal of a user ID from the system.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_USB_ACCESSORY_ATTACHED  

```cangjie  
public static const COMMON_EVENT_USB_ACCESSORY_ATTACHED: String = "usual.event.hardware.usb.action.USB_ACCESSORY_ATTACHED"  
```  

**Description:** (Reserved event, not yet supported) Indicates the common event for the attachment of a USB accessory.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_USB_ACCESSORY_DETACHED  

```cangjie  
public static const COMMON_EVENT_USB_ACCESSORY_DETACHED: String = "usual.event.hardware.usb.action.USB_ACCESSORY_DETACHED"  
```  

**Description:** (Reserved event, not yet supported) Indicates the common event for the detachment of a USB accessory.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_USB_DEVICE_ATTACHED  

```cangjie  
public static const COMMON_EVENT_USB_DEVICE_ATTACHED: String = "usual.event.hardware.usb.action.USB_DEVICE_ATTACHED"  
```  

**Description:** Indicates the common event for the attachment of a USB device when the user device acts as a USB host.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_USB_DEVICE_DETACHED  

```cangjie  
public static const COMMON_EVENT_USB_DEVICE_DETACHED: String = "usual.event.hardware.usb.action.USB_DEVICE_DETACHED"  
```  

**Description:** Indicates the common event for the detachment of a USB device when the user device acts as a USB host.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_USB_PORT_CHANGED  

```cangjie  
public static const COMMON_EVENT_USB_PORT_CHANGED: String = "usual.event.hardware.usb.action.USB_PORT_CHANGED"  
```  

**Description:** Indicates the common event for a change in the USB port state of the user device.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_USB_STATE  

```cangjie  
public static const COMMON_EVENT_USB_STATE: String = "usual.event.hardware.usb.action.USB_STATE"  
```  

**Description:** Indicates the common event for a change in the USB device state.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_USER_ADDED  

```cangjie  
public static const COMMON_EVENT_USER_ADDED: String = "usual.event.USER_ADDED"  
```  

**Description:** Indicates the common event for the addition of a user to the system.  

**Required Permission:** ohos.permission.MANAGE_LOCAL_ACCOUNTS (This permission is only available to system applications.)  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_USER_BACKGROUND  

```cangjie  
public static const COMMON_EVENT_USER_BACKGROUND: String = "usual.event.USER_BACKGROUND"  
```  

**Description:** (Reserved event, not yet supported) Indicates the common event for a user being moved to the background.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_USER_FOREGROUND  

```cangjie  
public static const COMMON_EVENT_USER_FOREGROUND: String = "usual.event.USER_FOREGROUND"  
```  

**Description:** (Reserved event, not yet supported) Indicates the common event for a user being moved to the foreground.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_USER_INFO_UPDATED  

```cangjie  
public static const COMMON_EVENT_USER_INFO_UPDATED: String = "usual.event.USER_INFO_UPDATED"  
```  

**Description:** Indicates the common event for updated user information.  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent  

**Initial Version:** 21  

### static const COMMON_EVENT_USER_REMOVED  

```cangjie  
public static const COMMON_EVENT_USER_REMOVED: String = "usual.event.USER_REMOVED"  
```  

**Description:** Indicates the common event for the removal of a user from the system.  

**Required Permission:** ohos.permission.MANAGE_LOCAL_ACCOUNTS (This permission is only available to system applications.)  

**Type:** String  

**System Capability:** SystemCapability.Notification.CommonEvent**Initial Version:** 21

### static const COMMON_EVENT_USER_STARTED

```cangjie
public static const COMMON_EVENT_USER_STARTED: String = "usual.event.USER_STARTED"
```

**Description:** (Reserved event, not yet supported) Indicates a common event for user startup.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_USER_STARTING

```cangjie
public static const COMMON_EVENT_USER_STARTING: String = "usual.event.USER_STARTING"
```

**Description:** (Reserved event, not yet supported) Indicates a common event for user startup.

**Required Permission for Subscribers:** ohos.permission.INTERACT_ACROSS_LOCAL_ACCOUNTS (This permission is only available to system applications)

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_USER_STOPPED

```cangjie
public static const COMMON_EVENT_USER_STOPPED: String = "usual.event.USER_STOPPED"
```

**Description:** (Reserved event, not yet supported) Indicates a common event for user stop.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_USER_STOPPING

```cangjie
public static const COMMON_EVENT_USER_STOPPING: String = "usual.event.USER_STOPPING"
```

**Description:** (Reserved event, not yet supported) Indicates a common event for stopping a user.

**Required Permission for Subscribers:** ohos.permission.INTERACT_ACROSS_LOCAL_ACCOUNTS (This permission is only available to system applications)

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_USER_SWITCHED

```cangjie
public static const COMMON_EVENT_USER_SWITCHED: String = "usual.event.USER_SWITCHED"
```

**Description:** Indicates a common event for ongoing user switching.

**Required Permission for Subscribers:** ohos.permission.MANAGE_LOCAL_ACCOUNTS (This permission is only available to system applications)

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_USER_UNLOCKED

```cangjie
public static const COMMON_EVENT_USER_UNLOCKED: String = "usual.event.USER_UNLOCKED"
```

**Description:** Indicates a common event when the credential-encrypted storage of the current user is unlocked after device reboot.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_VISIBLE_ACCOUNTS_UPDATED

```cangjie
public static const COMMON_EVENT_VISIBLE_ACCOUNTS_UPDATED: String = "usual.event.data.VISIBLE_ACCOUNTS_UPDATED"
```

**Description:** (Reserved event, not yet supported) Indicates a common event for account visibility changes.

**Required Permission for Subscribers:** ohos.permission.GET_APP_ACCOUNTS (This permission is only available to system applications)

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_VOLUME_BAD_REMOVAL

```cangjie
public static const COMMON_EVENT_VOLUME_BAD_REMOVAL: String = "usual.event.data.VOLUME_BAD_REMOVAL"
```

**Description:** Indicates a common event for external storage device status changing to removed while mounted.

**Required Permission for Subscribers:** ohos.permission.STORAGE_MANAGER

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_VOLUME_EJECT

```cangjie
public static const COMMON_EVENT_VOLUME_EJECT: String = "usual.event.data.VOLUME_EJECT"
```

**Description:** Indicates a common event when the user has expressed the desire to remove external storage media.

**Required Permission for Subscribers:** ohos.permission.STORAGE_MANAGER

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_VOLUME_MOUNTED

```cangjie
public static const COMMON_EVENT_VOLUME_MOUNTED: String = "usual.event.data.VOLUME_MOUNTED"
```

**Description:** Indicates a common event for external storage device status changing to mounted.

**Required Permission for Subscribers:** ohos.permission.STORAGE_MANAGER

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_VOLUME_REMOVED

```cangjie
public static const COMMON_EVENT_VOLUME_REMOVED: String = "usual.event.data.VOLUME_REMOVED"
```

**Description:** Indicates a common event for external storage device status changing to removed.

**Required Permission for Subscribers:** ohos.permission.STORAGE_MANAGER

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_VOLUME_UNMOUNTED

```cangjie
public static const COMMON_EVENT_VOLUME_UNMOUNTED: String = "usual.event.data.VOLUME_UNMOUNTED"
```

**Description:** Indicates a common event for external storage device status changing to unmounted.

**Required Permission for Subscribers:** ohos.permission.STORAGE_MANAGER

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_WIFI_AP_STA_JOIN

```cangjie
public static const COMMON_EVENT_WIFI_AP_STA_JOIN: String = "usual.event.wifi.WIFI_HS_STA_JOIN"
```

**Description:** Indicates a common event for a client joining the current device's Wi-Fi hotspot.

**Required Permission for Subscribers:** ohos.permission.GET_WIFI_INFO

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_WIFI_AP_STA_LEAVE

```cangjie
public static const COMMON_EVENT_WIFI_AP_STA_LEAVE: String = "usual.event.wifi.WIFI_HS_STA_LEAVE"
```

**Description:** Indicates a common event for a client disconnecting from the current device's Wi-Fi hotspot.

**Required Permission for Subscribers:** ohos.permission.GET_WIFI_INFO

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_WIFI_CONN_STATE

```cangjie
public static const COMMON_EVENT_WIFI_CONN_STATE: String = "usual.event.wifi.CONN_STATE"
```

**Description:** Indicates a common event for Wi-Fi connection state changes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_WIFI_HOTSPOT_STATE

```cangjie
public static const COMMON_EVENT_WIFI_HOTSPOT_STATE: String = "usual.event.wifi.HOTSPOT_STATE"
```

**Description:** Indicates a common event for Wi-Fi hotspot states, such as enabled or disabled.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_WIFI_MPLINK_STATE_CHANGE

```cangjie
public static const COMMON_EVENT_WIFI_MPLINK_STATE_CHANGE: String = "usual.event.wifi.mplink.STATE_CHANGE"
```

**Description:** Indicates a common event for MPLink (enhanced Wi-Fi feature) state changes.

**Required Permission for Subscribers:** ohos.permission.MPLINK_CHANGE_STATE

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_WIFI_P2P_CONN_STATE

```cangjie
public static const COMMON_EVENT_WIFI_P2P_CONN_STATE: String = "usual.event.wifi.p2p.CONN_STATE_CHANGE"
```

**Description:** Indicates a common event for Wi-Fi P2P connection state changes.

**Required Permission for Subscribers:** ohos.permission.GET_WIFI_INFO and ohos.permission.LOCATION

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_WIFI_P2P_CURRENT_DEVICE_STATE_CHANGED

```cangjie
public static const COMMON_EVENT_WIFI_P2P_CURRENT_DEVICE_STATE_CHANGED: String = "usual.event.wifi.p2p.CURRENT_DEVICE_CHANGE"
```

**Description:** Indicates a common event for Wi-Fi P2P current device state changes.

**Required Permission for Subscribers:** ohos.permission.GET_WIFI_INFO

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Initial Version:** 21

### static const COMMON_EVENT_WIFI_P2P_GROUP_STATE_CHANGED

```cangjie
public static const COMMON_EVENT_WIFI_P2P_GROUP_STATE_CHANGED: String = "usual.event.wifi.p2p.GROUP_STATE_CHANGED"
```

**Function:** Indicates a common event for Wi-Fi P2P group information changes.

**Required Permission:** ohos.permission.GET_WIFI_INFO

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_WIFI_P2P_PEERS_DISCOVERY_STATE_CHANGED

```cangjie
public static const COMMON_EVENT_WIFI_P2P_PEERS_DISCOVERY_STATE_CHANGED: String = "usual.event.wifi.p2p.PEER_DISCOVERY_STATE_CHANGE"
```

**Function:** Indicates a common event for Wi-Fi P2P discovery state changes.

**Required Permission:** ohos.permission.GET_WIFI_INFO

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_WIFI_P2P_PEERS_STATE_CHANGED

```cangjie
public static const COMMON_EVENT_WIFI_P2P_PEERS_STATE_CHANGED: String = "usual.event.wifi.p2p.DEVICES_CHANGE"
```

**Function:** Indicates a common event for Wi-Fi P2P peer state changes.

**Required Permission:** ohos.permission.GET_WIFI_INFO

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_WIFI_P2P_STATE_CHANGED

```cangjie
public static const COMMON_EVENT_WIFI_P2P_STATE_CHANGED: String = "usual.event.wifi.p2p.STATE_CHANGE"
```

**Function:** Indicates a common event for Wi-Fi P2P state changes (e.g., enabled/disabled).

**Required Permission:** ohos.permission.GET_WIFI_INFO

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_WIFI_POWER_STATE

```cangjie
public static const COMMON_EVENT_WIFI_POWER_STATE: String = "usual.event.wifi.POWER_STATE"
```

**Function:** Indicates a common event for Wi-Fi state changes (e.g., enabled/disabled).

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_WIFI_RSSI_VALUE

```cangjie
public static const COMMON_EVENT_WIFI_RSSI_VALUE: String = "usual.event.wifi.RSSI_VALUE"
```

**Function:** Indicates a common event for Wi-Fi signal strength (RSSI) changes.

**Required Permission:** ohos.permission.GET_WIFI_INFO

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_WIFI_SCAN_FINISHED

```cangjie
public static const COMMON_EVENT_WIFI_SCAN_FINISHED: String = "usual.event.wifi.SCAN_FINISHED"
```

**Function:** Indicates a common event when Wi-Fi access points have been scanned and verified as available.

**Required Permission:** ohos.permission.LOCATION

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

## enum ValueType

```cangjie
public enum ValueType {
    | INT(Int32)
    | FLOAT64(Float64)
    | STRING(String)
    | BOOL(Bool)
    | FD(Int32)
    | ARRSTRING(Array<String>)
    | ARRAYI32(Array<Int32>)
    | ARRAYI64(Array<Int64>)
    | ARRAYBOOL(Array<Bool>)
    | ARRAYF64(Array<Float64>)
    | ARRAYFD(Array<Int32>)
    | ...
}
```

**Function:** Contains value types for common event additional information.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### ARRAYBOOL(Array\<Bool>)

```cangjie
ARRAYBOOL(Array<Bool>)
```

**Function:** Represents Bool array type data.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### ARRAYF64(Array\<Float64>)

```cangjie
ARRAYF64(Array<Float64>)
```

**Function:** Represents Float64 array type data.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### ARRAYFD(Array\<Int32>)

```cangjie
ARRAYFD(Array<Int32>)
```

**Function:** Represents file descriptor array data.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### ARRAYI32(Array\<Int32>)

```cangjie
ARRAYI32(Array<Int32>)
```

**Function:** Represents Int32 array type data.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### ARRAYI64(Array\<Int64>)

```cangjie
ARRAYI64(Array<Int64>)
```

**Function:** Represents Int64 array type data.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### ARRSTRING(Array\<String>)

```cangjie
ARRSTRING(Array<String>)
```

**Function:** Represents String array type data.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### BOOL(Bool)

```cangjie
BOOL(Bool)
```

**Function:** Represents Bool type data.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### FD(Int32)

```cangjie
FD(Int32)
```

**Function:** Represents file descriptor data.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### FLOAT64(Float64)

```cangjie
FLOAT64(Float64)
```

**Function:** Represents Float64 type data.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### INT(Int32)

```cangjie
INT(Int32)
```

**Function:** Represents Int32 type data.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### STRING(String)

```cangjie
STRING(String)
```

**Function:** Represents String type data.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21