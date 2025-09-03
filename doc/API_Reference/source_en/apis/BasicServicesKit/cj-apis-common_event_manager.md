# ohos.common_event_manager

This module provides capabilities related to common events, including publishing common events, subscribing to common events, and unsubscribing from common events.

## Import Module

```cangjie
import kit.BasicServicesKit.*
```

## Usage Instructions

API example code usage instructions:

- If the first line of example code contains a "// index.cj" comment, it indicates that the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the example requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For the above example projects and configuration templates, please refer to [Cangjie Example Code Instructions](../../cj-development-intro.md#Cangjie-Example-Code-Instructions).

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
|:---|:---|:---|:---|:---|
| subscribeInfo | [CommonEventSubscribeInfo](#class-commoneventsubscribeinfo) | Yes | - | Represents subscription information. |

**Return Value:**

| Type | Description |
|:----|:----|
| [CommonEventSubscriber](#class-commoneventsubscriber) | Subscriber object. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.base.*
import ohos.business_exception.*

let subscriber: CommonEventSubscriber // Used to save the successfully created subscriber object for subsequent subscription and unsubscription actions
let support = Support.COMMON_EVENT_ABILITY_ADDED
// Subscriber information
let subscribeInfo: CommonEventSubscribeInfo = CommonEventSubscribeInfo([support])
// Create subscriber
try {
    subscriber = CommonEventManager.createSubscriber(subscribeInfo)
} catch (e: BusinessException) {
    Hilog.error(0, "AppLogCj", "errorCode = ${e.code}, errorMsg = ${e.message}")
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
|:---|:---|:---|:---|:---|
| event | String | Yes | - | Represents the common event to be sent. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Event Error Codes](../../../source_zh_cn/errorcodes/cj-errorcode-common_event_service.md).

  | Error Code ID | Error Message |
  | :------- | :----------------------------------- |
  | 1500004 | Not System services. |
  | 1500007 | Error sending message to Common Event Service. |
  | 1500008 | Common Event Service does not complete initialization. |
  | 1500009 | Error obtaining system parameters. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.base.*
import ohos.business_exception.*

try {
    // Publish common event
    CommonEventManager.publish(Support.COMMON_EVENT_SCREEN_ON)
} catch (e: BusinessException) {
    let code = e.code
    let message = e.message
    Hilog.error(0, "AppLogCj", "publish failed, error code: ${code}, message: ${message}.")
}
```

### static func publish(String, CommonEventPublishData)

```cangjie
public static func publish(event: String, options!: CommonEventPublishData = CommonEventPublishData()): Unit
```

**Description:** Publishes a common event.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | String | Yes | - | Represents the common event to be sent. |
| options | [CommonEventPublishData](#struct-commoneventpublishdata) | No | CommonEventPublishData() | **Named parameter.** Represents the properties of the published common event. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, refer to [Event Error Codes](../../../source_zh_cn/errorcodes/cj-errorcode-common_event_service.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 1500004 | If not System services or System app. |
  | 1500007 | If error sending message to Common Event Service. |
  | 1500008 | If Common Event Service does not complete initialization. |
  | 1500009 | If error obtaining system parameters. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.base.*
import ohos.business_exception.*

try {
    // Common event properties
    let pData = CommonEventPublishData(bundleName: "com.example.myapplication", data: "123321", code: 123321)
    // Publish common event
    CommonEventManager.publish(Support.COMMON_EVENT_SCREEN_ON, options: pData)
} catch (e: BusinessException) {
    let code = e.code
    let message = e.message
    Hilog.error(0, "AppLogCj", "publish failed, error code: ${code}, message: ${message}.")
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
|:---|:---|:---|:---|:---|
| subscriber | [CommonEventSubscriber](#class-commoneventsubscriber) | Yes | - | Represents the subscriber object. |
| callback | ([CommonEventData](#struct-commoneventdata))->Unit | Yes | - | Represents the callback function for receiving common event data. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, refer to [Event Error Codes](../../../source_zh_cn/errorcodes/cj-errorcode-common_event_service.md).

  | Error Code ID | Error Message |
  | :-------- | :----------------------------------- |
  | 801 | Capability not supported. |
  | 1500007 | Error sending message to Common Event Service. |
  | 1500008 | Common Event Service does not complete initialization. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.ValueType as CMEValueType
import kit.BasicServicesKit.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.base.*
import ohos.business_exception.*
import std.collection.*
import kit.PerformanceAnalysisKit.Hilog

// Subscribe to event: screen on
let events = [Support.COMMON_EVENT_SCREEN_ON]
// Subscriber information
let info = CommonEventSubscribeInfo(events)
// Subscriber
let sub = CommonEventManager.createSubscriber(info)
let strV = CMEValueType.StringValue("Hello")
let intV = CMEValueType.Int32Value(11)
let parameter = HashMap<String, CMEValueType>()
parameter.add("1", strV)
parameter.add("2", intV)
// Callback function for subscribed events
func callback(err: ?BusinessException, c: ?CommonEventData): Unit {
    Hilog.info(0, "cangjieTest", "Callback")
}
// Publish data
let pData = CommonEventPublishData(bundleName: "com.example.myapplication", data: "123321", code: 123321)
try {
    // Subscribe
    CommonEventManager.subscribe(sub, callback)
    // Publish
    CommonEventManager.publish(Support.COMMON_EVENT_SCREEN_ON, options: pData)
} catch (e: BusinessException) {
    Hilog.error(0, "AppLogCj", "errorCode = ${e.code}, errorMsg = ${e.message}")
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
|:---|:---|:---|:---|:---|
| subscriber | [CommonEventSubscriber](#class-commoneventsubscriber) | Yes | - | Represents the subscriber object. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, refer to [Event Error Codes](../../../source_zh_cn/errorcodes/cj-errorcode-common_event_service.md).

  | Error Code ID | Error Message |
  | :------- | :----------------------------------- |
  | 801 | Capability not supported. |
  | 1500007 | Error sending message to Common Event Service. |
  | 1500008 | Common Event Service does not complete initialization. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import ohos.base.*
import ohos.business_exception.*
import kit.PerformanceAnalysisKit.Hilog

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
    Hilog.error(0, "AppLogCj", "errorCode = ${e.code}, errorMsg = ${e.message}")
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

**Description:** Represents subscriber information.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### prop events

```cangjie
public prop events: Array<String>
```

**Description:** Represents the common events to subscribe to.

**Type:** Array\<String>

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### prop priority

```cangjie
public prop priority: ?Int32
```

**Description:** Represents the priority of the subscriber. The value range is -100 to 1000. Priorities exceeding the upper or lower limits will be set to the limit values.

**Type:** ?Int32

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### prop publisherBundleName

```cangjie
public prop publisherBundleName: ?String
```

**Description:** Represents the bundleName of the publisher to subscribe to.

**Type:** ?String

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### prop publisherDeviceId

```cangjie
public prop publisherDeviceId: ?String
```

**Description:** Represents the device ID. Obtain the udid via [@ohos.deviceInfo](./cj-apis-device_info.md) as the subscriber's device ID.

**Type:** ?String

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### prop publisherPermission

```cangjie
public prop publisherPermission: ?String
```

**Description:** Represents the publisher's permission. The subscriber will only receive events published by senders with this permission.

**Type:** ?String

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### prop userId

```cangjie
public prop userId: ?Int32
```

**Description:** Represents the user ID. This parameter is optional, with the default value being the current user's ID. If specified, the value must be an existing user ID in the system.

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

**Description:** Constructs a CommonEventSubscribeInfo object.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| events | Array\<String> | Yes | - | Represents the common events to subscribe to. |
| publisherPermission | ?String | No | None | **Named parameter.** Represents the publisher's permission. The subscriber will only receive events published by senders with this permission. |
| publisherDeviceId | ?String | No | None | **Named parameter.** Represents the device ID. Obtain the udid via [@ohos.deviceInfo](./cj-apis-device_info.md) as the subscriber's device ID. |
| userId | ?Int32 | No | None | **Named parameter.** Represents the user ID. This parameter is optional, with the default value being the current user's ID. If specified, the value must be an existing user ID in the system. |
| priority | ?Int32 | No | None | **Named parameter.** Represents the subscriber's priority. The value range is -100 to 1000. Priorities exceeding the upper or lower limits will be set to the limit values. |
| publisherBundleName | ?String | No | None | **Named parameter.** Represents the bundleName of the publisher to subscribe to. |## class CommonEventSubscriber

```cangjie
public class CommonEventSubscriber {}
```

**Function:** Describes a subscriber of common events.

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

**Function:** Indicates the bundle name, which is empty by default.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### let code

```cangjie
public let code: Int32
```

**Function:** Indicates the common event data (Int32 type) received by the subscriber. The value of this field is the same as the data passed through the `code` field in [CommonEventPublishData](#struct-commoneventpublishdata) when the publisher publishes the common event using [commonEventManager.publish](#static-func-publishstring). The default value is 0.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### let data

```cangjie
public let data: String
```

**Function:** Indicates the common event data (string type) received by the subscriber. The value of this field is the same as the data passed through the `data` field in [CommonEventPublishData](#struct-commoneventpublishdata) when the publisher publishes the common event using [commonEventManager.publish](#static-func-publishstring).

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### let event

```cangjie
public let event: String
```

**Function:** Indicates the name of the current received common event.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### let parameters

```cangjie
public let parameters: HashMap<String, ValueType>
```

**Function:** Indicates the additional information of the common event received by the subscriber. The value of this field is the same as the data passed through the `parameters` field in [CommonEventPublishData](#struct-commoneventpublishdata) when the publisher publishes the common event using [commonEventManager.publish](#static-func-publishstring).

**Type:** [HashMap](../../.../../../../User_Manual/source_zh_cn/collections/collection_hashmap.md)\<String,[ValueType](#enum-valuetype)>

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

## struct CommonEventPublishData

```cangjie
public struct CommonEventPublishData {
    public CommonEventPublishData(
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

**Function:** Contains the content and attributes of a common event.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### let bundleName

```cangjie
public let bundleName: String
```

**Function:** Indicates the bundle name of the subscriber. Only subscribers with the specified bundle name can receive this common event.

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

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### let data

```cangjie
public let data: String
```

**Function:** Indicates the custom result data of the common event.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### let isOrdered

```cangjie
public let isOrdered: Bool = false
```

**Function:** Indicates whether the event is ordered.

**Type:** Bool

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### let isSticky

```cangjie
public let isSticky: Bool = false
```

**Function:** Indicates whether the event is sticky. Only system applications or system services are allowed to send sticky events.

**Type:** Bool

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### let parameters

```cangjie
public let parameters: HashMap<String, ValueType>= HashMap<String, ValueType>()
```

**Function:** Indicates the additional information of the common event.

**Type:** [HashMap](../../.../../../../User_Manual/source_zh_cn/collections/collection_hashmap.md)\<String,[ValueType](#enum-valuetype)>

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### let subscriberPermissions

```cangjie
public let subscriberPermissions: Array<String>= Array<String>()
```

**Function:** Indicates the permissions of the subscriber.

**Type:** Array\<String>

**Access:** Read-only

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### CommonEventPublishData(String, String, Int32, Array\<String>, Bool, Bool, HashMap\<String,ValueType>)

```cangjie
public CommonEventPublishData(
    public let bundleName: String,
    public let data: String,
    public let code: Int32,
    public let subscriberPermissions!: Array<String> = Array<String>(),
    public let isOrdered!: Bool = false,
    public let isSticky!: Bool = false,
    public let parameters!: HashMap<String, ValueType> = HashMap<String, ValueType>()
)
```

**Function:** Constructs a CommonEventPublishData object.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

**Parameters:**

| Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| bundleName | String | Yes | - | Indicates the bundle name of the subscriber. Only subscribers with the specified bundle name can receive this common event. |
| data | String | Yes | - | Indicates the custom result data of the common event. |
| code | Int32 | Yes | - | Indicates the result code of the common event. |
| subscriberPermissions | Array\<String> | No | Array\<String>() | **Named parameter.** Indicates the permissions of the subscriber. |
| isOrdered | Bool | No | false | **Named parameter.** Indicates whether the event is ordered. |
| isSticky | Bool | No | false | **Named parameter.** Indicates whether the event is sticky. Only system applications or system services are allowed to send sticky events. |
| parameters | HashMap\<String, [ValueType](#enum-valuetype)> | No | HashMap\<String, ValueType>() | **Named parameter.** Indicates the additional information of the common event. |

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
    public static const COMMON_EVENT_BLUETOOTH_HOST_STATE_UPDATE: String = "usual.event.bluetooth.hhost.STATE_UPDATE"
    public static const COMMON_EVENT_BLUETOOTH_HOST_REQ_DISCOVERABLE: String = "usual.event.bluetooth.hhost.REQ_DISCOVERABLE"
    public static const COMMON_EVENT_BLUETOOTH_HOST_REQ_ENABLE: String = "usual.event.bluetooth.hhost.REQ_ENABLE"
    public static const COMMON_EVENT_BLUETOOTH_HOST_REQ_DISABLE: String = "usual.event.bluetooth.hhost.REQ_DISABLE"
    public static const COMMON_EVENT_BLUETOOTH_HOST_SCAN_MODE_UPDATE: String = "usual.event.bluetooth.hhost.SCAN_MODE_UPDATE"
    public static const COMMON_EVENT_BLUETOOTH_HOST_DISCOVERY_STARTED: String = "usual.event.bluetooth.hhost.DISCOVERY_STARTED"
    public static const COMMON_EVENT_BLUETOOTH_HOST_DISCOVERY_FINISHED: String = "usual.event.bluetooth.hhost.DISCOVERY_FINISHED"
    public static const COMMON_EVENT_BLUETOOTH_HOST_NAME_UPDATE: String = "usual.event.bluetooth.hhost.NAME_UPDATE"
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
### static const COMMON_EVENT_ABILITY_ADDED

```cangjie
public static const COMMON_EVENT_ABILITY_ADDED: String = "common.event.ABILITY_ADDED"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for ability addition.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_ABILITY_REMOVED

```cangjie
public static const COMMON_EVENT_ABILITY_REMOVED: String = "common.event.ABILITY_REMOVED"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for ability removal.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_ABILITY_UPDATED

```cangjie
public static const COMMON_EVENT_ABILITY_UPDATED: String = "common.event.ABILITY_UPDATED"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for ability update.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_ACCOUNT_DELETED

```cangjie
public static const COMMON_EVENT_ACCOUNT_DELETED: String = "usual.event.data.ACCOUNT_DELETED"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for account deletion.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_AIRPLANE_MODE_CHANGED

```cangjie
public static const COMMON_EVENT_AIRPLANE_MODE_CHANGED: String = "usual.event.AIRPLANE_MODE"
```

**Function:** Indicates a common event for airplane mode change on the device.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_AUDIO_QUALITY_CHANGE

```cangjie
public static const COMMON_EVENT_AUDIO_QUALITY_CHANGE: String = "usual.event.AUDIO_QUALITY_CHANGE"
```

**Function:** Indicates a common event for audio quality change.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BATTERY_CHANGED

```cangjie
public static const COMMON_EVENT_BATTERY_CHANGED: String = "usual.event.BATTERY_CHANGED"
```

**Function:** Indicates a common event for changes in battery charging status, level, and other information.

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

**Function:** Indicates a common event for battery exiting low-level state.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_A2DPSINK_AUDIO_STATE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_A2DPSINK_AUDIO_STATE_UPDATE: String = "usual.event.bluetooth.a2dpsink.AUDIO_STATE_UPDATE"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for Bluetooth A2DP sink audio state change.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_A2DPSINK_CONNECT_STATE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_A2DPSINK_CONNECT_STATE_UPDATE: String = "usual.event.bluetooth.a2dpsink.CONNECT_STATE_UPDATE"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for Bluetooth A2DP sink connection state change.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_A2DPSINK_PLAYING_STATE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_A2DPSINK_PLAYING_STATE_UPDATE: String = "usual.event.bluetooth.a2dpsink.PLAYING_STATE_UPDATE"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for Bluetooth A2DP sink playback state change.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_AVRCP_CONNECT_STATE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_AVRCP_CONNECT_STATE_UPDATE: String = "usual.event.bluetooth.a2dpsource.AVRCP_CONNECT_STATE_UPDATE"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for Bluetooth A2DP source AVRCP connection state change.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CODEC_VALUE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CODEC_VALUE_UPDATE: String = "usual.event.bluetooth.a2dpsource.CODEC_VALUE_UPDATE"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for Bluetooth A2DP audio codec state change.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CONNECT_STATE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CONNECT_STATE_UPDATE: String = "usual.event.bluetooth.a2dpsource.CONNECT_STATE_UPDATE"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for Bluetooth A2DP connection state.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CURRENT_DEVICE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CURRENT_DEVICE_UPDATE: String = "usual.event.bluetooth.a2dpsource.CURRENT_DEVICE_UPDATE"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for active device connected via Bluetooth A2DP.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_PLAYING_STATE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_A2DPSOURCE_PLAYING_STATE_UPDATE: String = "usual.event.bluetooth.a2dpsource.PLAYING_STATE_UPDATE"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for Bluetooth A2DP playback state change.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AG_CALL_STATE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AG_CALL_STATE_UPDATE: String = "usual.event.bluetooth.handsfreeunit.AG_CALL_STATE_UPDATE"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for Bluetooth hands-free call state change.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AG_COMMON_EVENT

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AG_COMMON_EVENT: String = "usual.event.bluetooth.handsfreeunit.AG_COMMON_EVENT"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for Bluetooth hands-free audio gateway state change.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AUDIO_STATE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AUDIO_STATE_UPDATE: String = "usual.event.bluetooth.handsfreeunit.AUDIO_STATE_UPDATE"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for Bluetooth hands-free audio state change.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_CONNECT_STATE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_CONNECT_STATE_UPDATE: String = "usual.event.bluetooth.handsfreeunit.CONNECT_STATE_UPDATE"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for Bluetooth hands-free connection state change.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_AUDIO_STATE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_AUDIO_STATE_UPDATE: String = "usual.event.bluetooth.handsfree.ag.AUDIO_STATE_UPDATE"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for Bluetooth A2DP connection state change.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_CONNECT_STATE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_CONNECT_STATE_UPDATE: String = "usual.event.bluetooth.handsfree.ag.CONNECT_STATE_UPDATE"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for Bluetooth hands-free communication connection state.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_CURRENT_DEVICE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_CURRENT_DEVICE_UPDATE: String = "usual.event.bluetooth.handsfree.ag.CURRENT_DEVICE_UPDATE"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for active device connected via Bluetooth hands-free.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HOST_DISCOVERY_FINISHED

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HOST_DISCOVERY_FINISHED: String = "usual.event.bluetooth.host.DISCOVERY_FINISHED"
```

**Function:** Indicates a common event for Bluetooth scan completion on the device.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HOST_DISCOVERY_STARTED

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HOST_DISCOVERY_STARTED: String = "usual.event.bluetooth.host.DISCOVERY_STARTED"
```

**Function:** Indicates a common event for Bluetooth scan initiation on the device.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HOST_NAME_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HOST_NAME_UPDATE: String = "usual.event.bluetooth.host.NAME_UPDATE"
```

**Function:** Indicates a common event for Bluetooth adapter name change on the device.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HOST_REQ_DISABLE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HOST_REQ_DISABLE: String = "usual.event.bluetooth.hhost.REQ_DISABLE"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for user request to disable Bluetooth.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HOST_REQ_DISCOVERABLE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HOST_REQ_DISCOVERABLE: String = "usual.event.bluetooth.host.REQ_DISCOVERABLE"
```

**Function:** Indicates a common event for user request to enable Bluetooth scanning.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21### static const COMMON_EVENT_BLUETOOTH_HOST_REQ_ENABLE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HOST_REQ_ENABLE: String = "usual.event.bluetooth.host.REQ_ENABLE"
```

**Function:** (Reserved event, not yet supported) Represents a common event for user request to enable Bluetooth.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HOST_SCAN_MODE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HOST_SCAN_MODE_UPDATE: String = "usual.event.bluetooth.host.SCAN_MODE_UPDATE"
```

**Function:** (Reserved event, not yet supported) Represents a common event for changes in Bluetooth scanning mode of the device.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_HOST_STATE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_HOST_STATE_UPDATE: String = "usual.event.bluetooth.hhost.STATE_UPDATE"
```

**Function:** Represents a common event for Bluetooth adapter state changes, such as Bluetooth being turned on or off.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_ACL_CONNECTED

```cangjie
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_ACL_CONNECTED: String = "usual.event.bluetooth.remotedevice.ACL_CONNECTED"
```

**Function:** (Reserved event, not yet supported) Represents a common event for establishing a low-level (ACL) connection with a remote Bluetooth device.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_ACL_DISCONNECTED

```cangjie
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_ACL_DISCONNECTED: String = "usual.event.bluetooth.remotedevice.ACL_DISCONNECTED"
```

**Function:** (Reserved event, not yet supported) Represents a common event for disconnection of a low-level (ACL) connection from a remote Bluetooth device.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_BATTERY_VALUE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_BATTERY_VALUE_UPDATE: String = "usual.event.bluetooth.remotedevice.BATTERY_VALUE_UPDATE"
```

**Function:** (Reserved event, not yet supported) Represents a common event for when the battery level of a remote Bluetooth device is retrieved for the first time or changed since last retrieval.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CLASS_VALUE_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CLASS_VALUE_UPDATE: String = "usual.event.bluetooth.remotedevice.CLASS_VALUE_UPDATE"
```

**Function:** (Reserved event, not yet supported) Represents a common event for when the battery level of a remote Bluetooth device is retrieved for the first time or changed since last retrieval.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_CANCEL

```cangjie
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_CANCEL: String = "usual.event.bluetooth.remotedevice.CONNECT_CANCEL"
```

**Function:** (Reserved event, not yet supported) Represents a common event for cancellation of connection with a remote Bluetooth device.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_REPLY

```cangjie
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_REPLY: String = "usual.event.bluetooth.remotedevice.CONNECT_REPLY"
```

**Function:** (Reserved event, not yet supported) Represents a common event for response to a remote Bluetooth device connection request.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_REQ

```cangjie
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_REQ: String = "usual.event.bluetooth.remotedevice.CONNECT_REQ"
```

**Function:** (Reserved event, not yet supported) Represents a common event for a remote Bluetooth device connection request.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_DISCOVERED

```cangjie
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_DISCOVERED: String = "usual.event.bluetooth.remotedevice.DISCOVERED"
```

**Function:** (Reserved event, not yet supported) Represents a common event for discovery of a remote Bluetooth device.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_NAME_UPDATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_NAME_UPDATE: String = "usual.event.bluetooth.remotedevice.NAME_UPDATE"
```

**Function:** Represents a common event for when the friendly name of a remote Bluetooth device is retrieved for the first time or changed since last retrieval.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIRING_CANCEL

```cangjie
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIRING_CANCEL: String = "usual.event.bluetooth.remotedevice.PAIRING_CANCEL"
```

**Function:** (Reserved event, not yet supported) Represents a common event for cancellation of Bluetooth pairing.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIRING_REQ

```cangjie
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIRING_REQ: String = "usual.event.bluetooth.remotedevice.PAIRING_REQ"
```

**Function:** (Reserved event, not yet supported) Represents a common event for a remote Bluetooth device pairing request.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIR_STATE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIR_STATE: String = "usual.event.bluetooth.remotedevice.PAIR_STATE"
```

**Function:** (Reserved event, not yet supported) Represents a common event for changes in connection state of a remote Bluetooth device.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_SDP_RESULT

```cangjie
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_SDP_RESULT: String = "usual.event.bluetooth.remotedevice.SDP_RESULT"
```

**Function:** (Reserved event, not yet supported) Represents a common event for SDP state of a remote Bluetooth device.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_UUID_VALUE

```cangjie
public static const COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_UUID_VALUE: String = "usual.event.bluetooth.remotedevice.UUID_VALUE"
```

**Function:** Represents a common event for UUID connection state of a remote Bluetooth device.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BOOT_COMPLETED

```cangjie
public static const COMMON_EVENT_BOOT_COMPLETED: String = "usual.event.BOOT_COMPLETED"
```

**Function:** Represents a common event for when the user has completed booting and the system is loaded.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_BUNDLE_REMOVED

```cangjie
public static const COMMON_EVENT_BUNDLE_REMOVED: String = "usual.event.BUNDLE_REMOVED"
```

**Function:** (Reserved event, not yet supported) Represents a common event for when an installed bundle has been uninstalled from the device but application data is still retained.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_CALL_STATE_CHANGED

```cangjie
public static const COMMON_EVENT_CALL_STATE_CHANGED: String = "usual.event.CALL_STATE_CHANGED"
```

**Function:** Represents a common event for call state updates.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_CELLULAR_DATA_STATE_CHANGED

```cangjie
public static const COMMON_EVENT_CELLULAR_DATA_STATE_CHANGED: String = "usual.event.CELLULAR_DATA_STATE_CHANGED"
```

**Function:** Represents a common event for cellular data state updates.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_CHARGE_IDLE_MODE_CHANGED

```cangjie
public static const COMMON_EVENT_CHARGE_IDLE_MODE_CHANGED: String = "usual.event.CHARGE_IDLE_MODE_CHANGED"
```

**Function:** Represents a common event for when the device enters charging idle mode.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_CHARGE_TYPE_CHANGED

```cangjie
public static const COMMON_EVENT_CHARGE_TYPE_CHANGED: String = "usual.event.CHARGE_TYPE_CHANGED"
```

**Function:** Represents a common event for changes in system charging type. For system applications only.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_CHARGING

```cangjie
public static const COMMON_EVENT_CHARGING: String = "usual.event.CHARGING"
```

**Function:** Represents a common event for when the system starts charging the battery.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_CLOSE_SYSTEM_DIALOGS

```cangjie
public static const COMMON_EVENT_CLOSE_SYSTEM_DIALOGS: String = "usual.event.CLOSE_SYSTEM_DIALOGS"
```

**Function:** (Reserved event, not yet supported) Represents a common event for when the user closes temporary system dialogs.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_CONFIGURATION_CHANGED

```cangjie
public static const COMMON_EVENT_CONFIGURATION_CHANGED: String = "usual.event.CONFIGURATION_CHANGED"
```

**Function:** (Reserved event, not yet supported) Represents a common event for changes in device state (e.g., orientation and locale).

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_CONNECTIVITY_CHANGE

```cangjie
public static const COMMON_EVENT_CONNECTIVITY_CHANGE: String = "usual.event.CONNECTIVITY_CHANGE"
```

**Function:** Represents a common event for network connection state changes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DATE_CHANGED

```cangjie
public static const COMMON_EVENT_DATE_CHANGED: String = "usual.event.DATE_CHANGED"
```

**Function:** (Reserved event, not yet supported) Represents a common event for when the system date has changed.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DEVICE_IDLE_EXEMPTION_LIST_UPDATED

```cangjie
public static const COMMON_EVENT_DEVICE_IDLE_EXEMPTION_LIST_UPDATED: String = "usual.event.DEVICE_IDLE_EXEMPTION_LIST_UPDATED"
```

**Function:** Represents a common event for when the exemption list of applications in system standby idle mode has been updated. For system applications only.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21### static const COMMON_EVENT_DEVICE_IDLE_MODE_CHANGED

```cangjie
public static const COMMON_EVENT_DEVICE_IDLE_MODE_CHANGED: String = "usual.event.DEVICE_IDLE_MODE_CHANGED"
```

**Description:** Indicates a common event for system idle standby mode change.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DISCHARGING

```cangjie
public static const COMMON_EVENT_DISCHARGING: String = "usual.event.DISCHARGING"
```

**Description:** Indicates a common event when the system stops charging the battery.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DISK_BAD_REMOVAL

```cangjie
public static const COMMON_EVENT_DISK_BAD_REMOVAL: String = "usual.event.data.DISK_BAD_REMOVAL"
```

**Description:** (Reserved event, not yet supported) Indicates a common event when external storage device status changes to removed while mounted.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DISK_EJECT

```cangjie
public static const COMMON_EVENT_DISK_EJECT: String = "usual.event.data.DISK_EJECT"
```

**Description:** (Reserved event, not yet supported) Indicates a common event when the user requests to remove external storage media.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DISK_MOUNTED

```cangjie
public static const COMMON_EVENT_DISK_MOUNTED: String = "usual.event.data.DISK_MOUNTED"
```

**Description:** (Reserved event, not yet supported) Indicates a common event when external storage device status changes to mounted.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DISK_REMOVED

```cangjie
public static const COMMON_EVENT_DISK_REMOVED: String = "usual.event.data.DISK_REMOVED"
```

**Description:** (Reserved event, not yet supported) Indicates a common event when external storage device status changes to removed.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DISK_UNMOUNTABLE

```cangjie
public static const COMMON_EVENT_DISK_UNMOUNTABLE: String = "usual.event.data.DISK_UNMOUNTABLE"
```

**Description:** (Reserved event, not yet supported) Indicates a common event when external storage device status changes to unmountable while inserted.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DISK_UNMOUNTED

```cangjie
public static const COMMON_EVENT_DISK_UNMOUNTED: String = "usual.event.data.DISK_UNMOUNTED"
```

**Description:** (Reserved event, not yet supported) Indicates a common event when external storage device status changes to unmounted.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGIN

```cangjie
public static const COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGIN: String = "common.event.DISTRIBUTED_ACCOUNT_LOGIN"
```

**Description:** (Reserved event, not yet supported) Indicates a common event for successful distributed account login.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGOFF

```cangjie
public static const COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGOFF: String = "common.event.DISTRIBUTED_ACCOUNT_LOGOFF"
```

**Description:** (Reserved event, not yet supported) Indicates a common event for distributed account logout.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGOUT

```cangjie
public static const COMMON_EVENT_DISTRIBUTED_ACCOUNT_LOGOUT: String = "common.event.DISTRIBUTED_ACCOUNT_LOGOUT"
```

**Description:** (Reserved event, not yet supported) Indicates a common event for successful distributed account sign-out.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DISTRIBUTED_ACCOUNT_TOKEN_INVALID

```cangjie
public static const COMMON_EVENT_DISTRIBUTED_ACCOUNT_TOKEN_INVALID: String = "common.event.DISTRIBUTED_ACCOUNT_TOKEN_INVALID"
```

**Description:** (Reserved event, not yet supported) Indicates a common event when distributed account token becomes invalid.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DOMAIN_ACCOUNT_STATUS_CHANGED

```cangjie
public static const COMMON_EVENT_DOMAIN_ACCOUNT_STATUS_CHANGED: String = "usual.event.DOMAIN_ACCOUNT_STATUS_CHANGED"
```

**Description:** Indicates a common event when domain account status changes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_DRIVE_MODE

```cangjie
public static const COMMON_EVENT_DRIVE_MODE: String = "common.event.DRIVE_MODE"
```

**Description:** (Reserved event, not yet supported) Indicates a common event when the system enters drive mode.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_EXTERNAL_APPLICATIONS_AVAILABLE

```cangjie
public static const COMMON_EVENT_EXTERNAL_APPLICATIONS_AVAILABLE: String = "usual.event.EXTERNAL_APPLICATIONS_AVAILABLE"
```

**Description:** (Reserved event, not yet supported) Indicates a common event when applications installed on external storage become available to the system.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_EXTERNAL_APPLICATIONS_UNAVAILABLE

```cangjie
public static const COMMON_EVENT_EXTERNAL_APPLICATIONS_UNAVAILABLE: String = "usual.event.EXTERNAL_APPLICATIONS_UNAVAILABLE"
```

**Description:** (Reserved event, not yet supported) Indicates a common event when applications installed on external storage become unavailable to the system.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_FOUNDATION_READY

```cangjie
public static const COMMON_EVENT_FOUNDATION_READY: String = "common.event.FOUNDATION_READY"
```

**Description:** (Reserved event, not yet supported) Indicates a common event when foundation becomes ready.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_HOME_MODE

```cangjie
public static const COMMON_EVENT_HOME_MODE: String = "common.event.HOME_MODE"
```

**Description:** (Reserved event, not yet supported) Indicates a common event when the system enters HOME mode.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_HTTP_PROXY_CHANGE

```cangjie
public static const COMMON_EVENT_HTTP_PROXY_CHANGE: String = "usual.event.HTTP_PROXY_CHANGE"
```

**Description:** Indicates a common event when HTTP proxy configuration changes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_INCOMING_CALL_MISSED

```cangjie
public static const COMMON_EVENT_INCOMING_CALL_MISSED: String = "usual.event.INCOMING_CALL_MISSED"
```

**Description:** Indicates a common event for missed incoming calls.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_IVI_ACTIVE

```cangjie
public static const COMMON_EVENT_IVI_ACTIVE: String = "common.event.IVI_ACTIVE"
```

**Description:** (Reserved event, not yet supported) Indicates a common event when battery service becomes active.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_IVI_EXTREME_TEMPERATURE

```cangjie
public static const COMMON_EVENT_IVI_EXTREME_TEMPERATURE: String = "common.event.IVI_EXTREME_TEMPERATURE"
```

**Description:** (Reserved event, not yet supported) Indicates a common event when IVI temperature becomes extremely high.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_IVI_HIGH_TEMPERATURE

```cangjie
public static const COMMON_EVENT_IVI_HIGHT_TEMPERATURE: String = "common.event.IVI_HIGH_TEMPERATURE"
```

**Description:** (Reserved event, not yet supported) Indicates a common event when IVI temperature becomes excessively high.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_IVI_LASTMODE_SAVE

```cangjie
public static const COMMON_EVENT_IVI_LASTMODE_SAVE: String = "common.event.IVI_LASTMODE_SAVE"
```

**Description:** (Reserved event, not yet supported) Indicates a common event when third-party applications save their last mode.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_IVI_PAUSE

```cangjie
public static const COMMON_EVENT_IVI_PAUSE: String = "common.event.IVI_PAUSE"
```

**Description:** (Reserved event, not yet supported) Indicates a common event when IVI enters sleep mode and notifies applications to stop playback.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_IVI_SLEEP

```cangjie
public static const COMMON_EVENT_IVI_SLEEP: String = "common.event.IVI_SLEEP"
```

**Description:** (Reserved event, not yet supported) Indicates a common event when the vehicle's In-Vehicle Infotainment (IVI) system enters sleep mode.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_IVI_STANDBY

```cangjie
public static const COMMON_EVENT_IVI_STANDBY: String = "common.event.IVI_STANDBY"
```

**Description:** (Reserved event, not yet supported) Indicates a common event when third-party applications pause current operations.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_IVI_TEMPERATURE_ABNORMAL

```cangjie
public static const COMMON_EVENT_IVI_TEMPERATURE_ABNORMAL: String = "common.event.IVI_TEMPERATURE_ABNORMAL"
```

**Description:** (Reserved event, not yet supported) Indicates a common event when the IVI system experiences extreme temperature conditions.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_IVI_TEMPERATURE_RECOVERY

```cangjie
public static const COMMON_EVENT_IVI_TEMPERATURE_RECOVERY: String = "common.event.IVI_TEMPERATURE_RECOVERY"
```

**Description:** (Reserved event, not yet supported) Indicates a common event when IVI system temperature returns to normal.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21### static const COMMON_EVENT_IVI_VOLTAGE_ABNORMAL

```cangjie
public static const COMMON_EVENT_IVI_VOLTAGE_ABNORMAL: String = "common.event.IVI_VOLTAGE_ABNORMAL"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for abnormal vehicle power system voltage.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_IVI_VOLTAGE_RECOVERY

```cangjie
public static const COMMON_EVENT_IVI_VOLTAGE_RECOVERY: String = "common.event.IVI_VOLTAGE_RECOVERY"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for vehicle power system voltage returning to normal.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_LOCALE_CHANGED

```cangjie
public static const COMMON_EVENT_LOCALE_CHANGED: String = "usual.event.LOCALE_CHANGED"
```

**Function:** Indicates a common event for device locale settings being changed.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_LOCATION_MODE_STATE_CHANGED

```cangjie
public static const COMMON_EVENT_LOCATION_MODE_STATE_CHANGED: String = "usual.event.location.MODE_STATE_CHANGED"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for system location mode being changed.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_LOCKED_BOOT_COMPLETED

```cangjie
public static const COMMON_EVENT_LOCKED_BOOT_COMPLETED: String = "usual.event.LOCKED_BOOT_COMPLETED"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for user completing boot, system being loaded, but screen remaining locked.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_MANAGE_PACKAGE_STORAGE

```cangjie
public static const COMMON_EVENT_MANAGE_PACKAGE_STORAGE: String = "usual.event.MANAGE_PACKAGE_STORAGE"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for insufficient device storage space.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_MY_PACKAGE_REPLACED

```cangjie
public static const COMMON_EVENT_MY_PACKAGE_REPLACED: String = "usual.event.MY_PACKAGE_REPLACED"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for a new version of an application package replacing the previous version.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_MY_PACKAGE_SUSPENDED

```cangjie
public static const COMMON_EVENT_MY_PACKAGE_SUSPENDED: String = "usual.event.MY_PACKAGE_SUSPENDED"
```

**Function:** Indicates a common event for an application package being suspended.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_MY_PACKAGE_UNSUSPENDED

```cangjie
public static const COMMON_EVENT_MY_PACKAGE_UNSUSPENDED: String = "usual.event.MY_PACKAGE_UNSUSPENDED"
```

**Function:** Indicates a common event for an application package being unsuspended.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_NETWORK_STATE_CHANGED

```cangjie
public static const COMMON_EVENT_NETWORK_STATE_CHANGED: String = "usual.event.NETWORK_STATE_CHANGED"
```

**Function:** Indicates a common event for network status updates.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_NFC_ACTION_ADAPTER_STATE_CHANGED

```cangjie
public static const COMMON_EVENT_NFC_ACTION_ADAPTER_STATE_CHANGED: String = "usual.event.nfc.action.ADAPTER_STATE_CHANGED"
```

**Function:** Indicates a common event for device NFC status being changed.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_NFC_ACTION_RF_FIELD_OFF_DETECTED

```cangjie
public static const COMMON_EVENT_NFC_ACTION_RF_FIELD_OFF_DETECTED: String = "usual.event.nfc.action.RF_FIELD_OFF_DETECTED"
```

**Function:** Indicates a common event for detecting NFC field strength leaving.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_NFC_ACTION_RF_FIELD_ON_DETECTED

```cangjie
public static const COMMON_EVENT_NFC_ACTION_RF_FIELD_ON_DETECTED: String = "usual.event.nfc.action.RF_FIELD_ON_DETECTED"
```

**Function:** Indicates a common event for detecting NFC field strength entering.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_OFFICE_MODE

```cangjie
public static const COMMON_EVENT_OFFICE_MODE: String = "common.event.OFFICE_MODE"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for the system being in office mode.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENTOPERATOR_CONFIG_CHANGED

```cangjie
public static const COMMON_EVENT_OPERATOR_CONFIG_CHANGED: String = "usual.event.OPERATOR_CONFIG_CHANGED"
```

**Function:** Indicates a common event for operator configuration being updated.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_PACKAGES_SUSPENDED

```cangjie
public static const COMMON_EVENT_PACKAGES_SUSPENDED: String = "usual.event.PACKAGES_SUSPENDED"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for application packages being suspended.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_PACKAGES_UNSUSPENDED

```cangjie
public static const COMMON_EVENT_PACKAGES_UNSUSPENDED: String = "usual.event.PACKAGES_UNSUSPENDED"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for application packages being unsuspended.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_PACKAGE_ADDED

```cangjie
public static const COMMON_EVENT_PACKAGE_ADDED: String = "usual.event.PACKAGE_ADDED"
```

**Function:** Indicates a common event for a new application package being installed on the device.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_PACKAGE_CACHE_CLEARED

```cangjie
public static const COMMON_EVENT_PACKAGE_CACHE_CLEARED: String = "usual.event.PACKAGE_CACHE_CLEARED"
```

**Function:** Indicates a common event for user clearing application package cache data.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_PACKAGE_CHANGED

```cangjie
public static const COMMON_EVENT_PACKAGE_CHANGED: String = "usual.event.PACKAGE_CHANGED"
```

**Function:** Indicates a common event for an application package being changed (e.g., components in the package being enabled or disabled).

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_PACKAGE_DATA_CLEARED

```cangjie
public static const COMMON_EVENT_PACKAGE_DATA_CLEARED: String = "usual.event.PACKAGE_DATA_CLEARED"
```

**Function:** Indicates a common event for user clearing application package data.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_PACKAGE_FIRST_LAUNCH

```cangjie
public static const COMMON_EVENT_PACKAGE_FIRST_LAUNCH: String = "usual.event.PACKAGE_FIRST_LAUNCH"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for first launch of an installed application.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_PACKAGE_FULLY_REMOVED

```cangjie
public static const COMMON_EVENT_PACKAGE_FULLY_REMOVED: String = "usual.event.PACKAGE_FULLY_REMOVED"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for an installed application being completely uninstalled from the device (including application data and code).

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_PACKAGE_NEEDS_VERIFICATION

```cangjie
public static const COMMON_EVENT_PACKAGE_NEEDS_VERIFICATION: String = "usual.event.PACKAGE_NEEDS_VERIFICATION"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for an application requiring system verification.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_PACKAGE_REMOVED

```cangjie
public static const COMMON_EVENT_PACKAGE_REMOVED: String = "usual.event.PACKAGE_REMOVED"
```

**Function:** Indicates a common event for an installed application being uninstalled from the device, but application data being retained.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_PACKAGE_REPLACED

```cangjie
public static const COMMON_EVENT_PACKAGE_REPLACED: String = "usual.event.PACKAGE_REPLACED"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for a new version of an installed application package replacing the old version on the device.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_PACKAGE_RESTARTED

```cangjie
public static const COMMON_EVENT_PACKAGE_RESTARTED: String = "usual.event.PACKAGE_RESTARTED"
```

**Function:** Indicates a common event for user restarting an application package and killing all its processes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_PACKAGE_VERIFIED

```cangjie
public static const COMMON_EVENT_PACKAGE_VERIFIED: String = "usual.event.PACKAGE_VERIFIED"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for an application being verified by the system.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_POWER_CONNECTED

```cangjie
public static const COMMON_EVENT_POWER_CONNECTED: String = "usual.event.POWER_CONNECTED"
```

**Function:** Indicates a common event for the device being connected to an external power source.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21### static const COMMON_EVENT_POWER_DISCONNECTED

```cangjie
public static const COMMON_EVENT_POWER_DISCONNECTED: String = "usual.event.POWER_DISCONNECTED"
```

**Description:** Represents a common event for device disconnection from external power supply.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_POWER_SAVE_MODE_CHANGED

```cangjie
public static const COMMON_EVENT_POWER_SAVE_MODE_CHANGED: String = "usual.event.POWER_SAVE_MODE_CHANGED"
```

**Description:** Represents a common event for system power-saving mode changes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_PRIMARY_SLOT_ROAMING

```cangjie
public static const COMMON_EVENT_PRIMARY_SLOT_ROAMING: String = "usual.event.PRIMARY_SLOT_ROAMING"
```

**Description:** Represents a common event for updated roaming status of the default primary SIM card.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_PRIVACY_STATE_CHANGED

```cangjie
public static const COMMON_EVENT_PRIVACY_STATE_CHANGED: String = "usual.event.PRIVACY_STATE_CHANGED"
```

**Description:** Indicates the action of setting the default primary SIM card, with status updated to in-progress or completed.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_QUICK_FIX_APPLY_RESULT

```cangjie
public static const COMMON_EVENT_QUICK_FIX_APPLY_RESULT: String = "usual.event.QUICK_FIX_APPLY_RESULT"
```

**Description:** Represents a common event for quick fix application.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_QUICK_FIX_REVOKE_RESULT

```cangjie
public static const COMMON_EVENT_QUICK_FIX_REVOKE_RESULT: String = "usual.event.QUICK_FIX_REVOKE_RESULT"
```

**Description:** Represents a common event for revoking quick fixes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_RADIO_STATE_CHANGE

```cangjie
public static const COMMON_EVENT_RADIO_STATE_CHANGE: String = "usual.event.RADIO_STATE_CHANGE"
```

**Description:** Represents a common event for device modem power state changes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SCREEN_LOCKED

```cangjie
public static const COMMON_EVENT_SCREEN_LOCKED: String = "usual.event.SCREEN_LOCKED"
```

**Description:** Represents a common event for screen lock.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SCREEN_OFF

```cangjie
public static const COMMON_EVENT_SCREEN_OFF: String = "usual.event.SCREEN_OFF"
```

**Description:** Represents a common event for device screen turning off and entering sleep state.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SCREEN_ON

```cangjie
public static const COMMON_EVENT_SCREEN_ON: String = "usual.event.SCREEN_ON"
```

**Description:** Represents a common event for device screen turning on and entering interactive state.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SCREEN_UNLOCKED

```cangjie
public static const COMMON_EVENT_SCREEN_UNLOCKED: String = "usual.event.SCREEN_UNLOCKED"
```

**Description:** Represents a common event for screen unlock.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SET_PRIMARY_SLOT_STATUS

```cangjie
public static const COMMON_EVENT_SET_PRIMARY_SLOT_STATUS: String = "usual.event.SET_PRIMARY_SLOT_STATUS"
```

**Description:** Indicates the action of setting the default primary SIM card, with status updated to in-progress or completed.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SHUTDOWN

```cangjie
public static const COMMON_EVENT_SHUTDOWN: String = "usual.event.SHUTDOWN"
```

**Description:** Represents a common event for device shutdown.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SIGNAL_INFO_CHANGED

```cangjie
public static const COMMON_EVENT_SIGNAL_INFO_CHANGED: String = "usual.event.SIGNAL_INFO_CHANGED"
```

**Description:** Represents a common event for signal information updates.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SIM_CARD_DEFAULT_DATA_SUBSCRIPTION_CHANGED

```cangjie
public static const COMMON_EVENT_SIM_CARD_DEFAULT_DATA_SUBSCRIPTION_CHANGED: String = "usual.event.SIM.DEFAULT_DATA_SUBSCRIPTION_CHANGED"
```

**Description:** Represents a common event for updated default data primary SIM card.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SIM_CARD_DEFAULT_MAIN_SUBSCRIPTION_CHANGED

```cangjie
public static const COMMON_EVENT_SIM_CARD_DEFAULT_MAIN_SUBSCRIPTION_CHANGED: String = "usual.event.SIM.DEFAULT_MAIN_SUBSCRIPTION_CHANGED"
```

**Description:** Represents a common event for updated default primary SIM card.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SIM_CARD_DEFAULT_SMS_SUBSCRIPTION_CHANGED

```cangjie
public static const COMMON_EVENT_SIM_CARD_DEFAULT_SMS_SUBSCRIPTION_CHANGED: String = "usual.event.SIM.DEFAULT_SMS_SUBSCRIPTION_CHANGED"
```

**Description:** Represents a common event for updated default SMS primary SIM card.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SIM_CARD_DEFAULT_VOICE_SUBSCRIPTION_CHANGED

```cangjie
public static const COMMON_EVENT_SIM_CARD_DEFAULT_VOICE_SUBSCRIPTION_CHANGED: String = "usual.event.SIM.DEFAULT_VOICE_SUBSCRIPTION_CHANGED"
```

**Description:** Represents a common event for updated default voice primary SIM card.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SIM_STATE_CHANGED

```cangjie
public static const COMMON_EVENT_SIM_STATE_CHANGED: String = "usual.event.SIM_STATE_CHANGED"
```

**Description:** Represents a common event for SIM card status updates.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SLOT_CHANGE

```cangjie
public static const COMMON_EVENT_SLOT_CHANGE: String = "usual.event.SLOT_CHANGE"
```

**Description:** Represents a common event for notification channel updates.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SMS_CB_RECEIVE_COMPLETED

```cangjie
public static const COMMON_EVENT_SMS_CB_RECEIVE_COMPLETED: String = "usual.event.SMS_CB_RECEIVE_COMPLETED"
```

**Description:** Represents a common event for completed cell broadcast SMS reception.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SMS_EMERGENCY_CB_RECEIVE_COMPLETED

```cangjie
public static const COMMON_EVENT_SMS_EMERGENCY_CB_RECEIVE_COMPLETED: String = "usual.event.SMS_EMERGENCY_CB_RECEIVE_COMPLETED"
```

**Description:** Represents a common event for completed emergency cell broadcast SMS reception.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SMS_RECEIVE_COMPLETED

```cangjie
public static const COMMON_EVENT_SMS_RECEIVE_COMPLETED: String = "usual.event.SMS_RECEIVE_COMPLETED"
```

**Description:** Indicates the action of device receiving a message.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SMS_WAPPUSH_RECEIVE_COMPLETED

```cangjie
public static const COMMON_EVENT_SMS_WAPPUSH_RECEIVE_COMPLETED: String = "usual.event.SMS_WAPPUSH_RECEIVE_COMPLETED"
```

**Description:** Represents a common event for completed service information SMS reception.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SPECIAL_CODE

```cangjie
public static const COMMON_EVENT_SPECIAL_CODE: String = "common.event.SPECIAL_CODE"
```

**Description:** Indicates successful special code transmission. When a special code is successfully sent on the device, the event notification service will publish this system common event.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SPLIT_SCREEN

```cangjie
public static const COMMON_EVENT_SPLIT_SCREEN: String = "common.event.SPLIT_SCREEN"
```

**Description:** Represents a common event for split-screen.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_SPN_INFO_CHANGED

```cangjie
public static const COMMON_EVENT_SPN_INFO_CHANGED: String = "usual.event.SPN_INFO_CHANGED"
```

**Description:** Represents a common event for updated SPN display information.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_STK_ALPHA_IDENTIFIER

```cangjie
public static const COMMON_EVENT_STK_ALPHA_IDENTIFIER: String = "usual.event.STK_ALPHA_IDENTIFIER"
```

**Description:** (Reserved event, not yet supported) Represents a common event for STK ALPHA identifier.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_STK_CARD_STATE_CHANGED

```cangjie
public static const COMMON_EVENT_STK_CARD_STATE_CHANGED: String = "usual.event.STK_CARD_STATE_CHANGED"
```

**Description:** (Reserved event, not yet supported) Represents a common event for updated STK card status.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21### static const COMMON_EVENT_STK_COMMAND

```cangjie
public static const COMMON_EVENT_STK_COMMAND: String = "usual.event.STK_COMMAND"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for sending STK commands.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_STK_SESSION_END

```cangjie
public static const COMMON_EVENT_STK_SESSION_END: String = "usual.event.STK_SESSION_END"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for STK session termination.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_THERMAL_LEVEL_CHANGED

```cangjie
public static const COMMON_EVENT_THERMAL_LEVEL_CHANGED: String = "usual.event.THERMAL_LEVEL_CHANGED"
```

**Function:** Indicates a common event for device thermal state changes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_TIMEZONE_CHANGED

```cangjie
public static const COMMON_EVENT_TIMEZONE_CHANGED: String = "usual.event.TIMEZONE_CHANGED"
```

**Function:** Indicates a common event for system timezone changes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_TIME_CHANGED

```cangjie
public static const COMMON_EVENT_TIME_CHANGED: String = "usual.event.TIME_CHANGED"
```

**Function:** Indicates a common event for system time setting changes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_TIME_TICK

```cangjie
public static const COMMON_EVENT_TIME_TICK: String = "usual.event.TIME_TICK"
```

**Function:** Indicates a common event for system time changes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_UID_REMOVED

```cangjie
public static const COMMON_EVENT_UID_REMOVED: String = "usual.event.UID_REMOVED"
```

**Function:** (Reserved event, not yet supported) Indicates a common event when a user ID is removed from the system.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_USB_ACCESSORY_ATTACHED

```cangjie
public static const COMMON_EVENT_USB_ACCESSORY_ATTACHED: String = "usual.event.hardware.usb.action.USB_ACCESSORY_ATTACHED"
```

**Function:** (Reserved event, not yet supported) Indicates a common event when a USB accessory is connected.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_USB_ACCESSORY_DETACHED

```cangjie
public static const COMMON_EVENT_USB_ACCESSORY_DETACHED: String = "usual.event.hardware.usb.action.USB_ACCESSORY_DETACHED"
```

**Function:** (Reserved event, not yet supported) Indicates a common event when a USB accessory is detached.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_USB_DEVICE_ATTACHED

```cangjie
public static const COMMON_EVENT_USB_DEVICE_ATTACHED: String = "usual.event.hardware.usb.action.USB_DEVICE_ATTACHED"
```

**Function:** Indicates a common event when a USB device is mounted while the user device acts as a USB host.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_USB_DEVICE_DETACHED

```cangjie
public static const COMMON_EVENT_USB_DEVICE_DETACHED: String = "usual.event.hardware.usb.action.USB_DEVICE_DETACHED"
```

**Function:** Indicates a common event when a USB device is detached while the user device acts as a USB host.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_USB_PORT_CHANGED

```cangjie
public static const COMMON_EVENT_USB_PORT_CHANGED: String = "usual.event.hardware.usb.action.USB_PORT_CHANGED"
```

**Function:** Indicates a common event when the USB port state of the user device changes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_USB_STATE

```cangjie
public static const COMMON_EVENT_USB_STATE: String = "usual.event.hardware.usb.action.USB_STATE"
```

**Function:** Indicates a common event for USB device state changes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_USER_ADDED

```cangjie
public static const COMMON_EVENT_USER_ADDED: String = "usual.event.USER_ADDED"
```

**Function:** Indicates a common event when a user is added to the system.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_USER_BACKGROUND

```cangjie
public static const COMMON_EVENT_USER_BACKGROUND: String = "usual.event.USER_BACKGROUND"
```

**Function:** (Reserved event, not yet supported) Indicates a common event when a user is brought to the background.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_USER_FOREGROUND

```cangjie
public static const COMMON_EVENT_USER_FOREGROUND: String = "usual.event.USER_FOREGROUND"
```

**Function:** (Reserved event, not yet supported) Indicates a common event when a user is brought to the foreground.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_USER_INFO_UPDATED

```cangjie
public static const COMMON_EVENT_USER_INFO_UPDATED: String = "usual.event.USER_INFO_UPDATED"
```

**Function:** Indicates a common event when user information is updated.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_USER_REMOVED

```cangjie
public static const COMMON_EVENT_USER_REMOVED: String = "usual.event.USER_REMOVED"
```

**Function:** Indicates a common event when a user is removed from the system.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_USER_STARTED

```cangjie
public static const COMMON_EVENT_USER_STARTED: String = "usual.event.USER_STARTED"
```

**Function:** (Reserved event, not yet supported) Indicates a common event when a user is started.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_USER_STARTING

```cangjie
public static const COMMON_EVENT_USER_STARTING: String = "usual.event.USER_STARTING"
```

**Function:** (Reserved event, not yet supported) Indicates a common event when a user is starting.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_USER_STOPPED

```cangjie
public static const COMMON_EVENT_USER_STOPPED: String = "usual.event.USER_STOPPED"
```

**Function:** (Reserved event, not yet supported) Indicates a common event when a user is stopped.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_USER_STOPPING

```cangjie
public static const COMMON_EVENT_USER_STOPPING: String = "usual.event.USER_STOPPING"
```

**Function:** (Reserved event, not yet supported) Indicates a common event when a user is about to be stopped.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_USER_SWITCHED

```cangjie
public static const COMMON_EVENT_USER_SWITCHED: String = "usual.event.USER_SWITCHED"
```

**Function:** Indicates a common event when user switching occurs.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_USER_UNLOCKED

```cangjie
public static const COMMON_EVENT_USER_UNLOCKED: String = "usual.event.USER_UNLOCKED"
```

**Function:** Indicates a common event when the credential-encrypted storage of the current user is unlocked after device reboot.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_VISIBLE_ACCOUNTS_UPDATED

```cangjie
public static const COMMON_EVENT_VISIBLE_ACCOUNTS_UPDATED: String = "usual.event.data.VISIBLE_ACCOUNTS_UPDATED"
```

**Function:** (Reserved event, not yet supported) Indicates a common event for account visibility changes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_VOLUME_BAD_REMOVAL

```cangjie
public static const COMMON_EVENT_VOLUME_BAD_REMOVAL: String = "usual.event.data.VOLUME_BAD_REMOVAL"
```

**Function:** Indicates a common event when external storage device state changes to "removed while mounted".

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_VOLUME_EJECT

```cangjie
public static const COMMON_EVENT_VOLUME_EJECT: String = "usual.event.data.VOLUME_EJECT"
```

**Function:** Indicates a common event when the user expresses intent to remove external storage media.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_VOLUME_MOUNTED

```cangjie
public static const COMMON_EVENT_VOLUME_MOUNTED: String = "usual.event.data.VOLUME_MOUNTED"
```

**Function:** Indicates a common event when external storage device state changes to "mounted".

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_VOLUME_REMOVED

```cangjie
public static const COMMON_EVENT_VOLUME_REMOVED: String = "usual.event.data.VOLUME_REMOVED"
```

**Function:** Indicates a common event when external storage device state changes to "removed".

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_VOLUME_UNMOUNTED

```cangjie
public static const COMMON_EVENT_VOLUME_UNMOUNTED: String = "usual.event.data.VOLUME_UNMOUNTED"
```

**Function:** Indicates a common event when external storage device state changes to "unmounted".

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_WIFI_AP_STA_JOIN

```cangjie
public static const COMMON_EVENT_WIFI_AP_STA_JOIN: String = "usual.event.wifi.WIFI_HS_STA_JOIN"
```

**Function:** Indicates a common event when a client joins the current device's Wi-Fi hotspot.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_WIFI_AP_STA_LEAVE

```cangjie
public static const COMMON_EVENT_WIFI_AP_STA_LEAVE: String = "usual.event.wifi.WIFI_HS_STA_LEAVE"
```

**Function:** Indicates a common event when a client disconnects from the current device's Wi-Fi hotspot.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_WIFI_CONN_STATE

```cangjie
public static const COMMON_EVENT_WIFI_CONN_STATE: String = "usual.event.wifi.CONN_STATE"
```

**Function:** Indicates a common event for Wi-Fi connection state changes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_WIFI_HOTSPOT_STATE

```cangjie
public static const COMMON_EVENT_WIFI_HOTSPOT_STATE: String = "usual.event.wifi.HOTSPOT_STATE"
```

**Function:** Indicates a common event for Wi-Fi hotspot state changes (enabled/disabled).

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_WIFI_MPLINK_STATE_CHANGE

```cangjie
public static const COMMON_EVENT_WIFI_MPLINK_STATE_CHANGE: String = "usual.event.wifi.mplink.STATE_CHANGE"
```

**Function:** Indicates a common event when MPLink (enhanced Wi-Fi capability) state changes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_WIFI_P2P_CONN_STATE

```cangjie
public static const COMMON_EVENT_WIFI_P2P_CONN_STATE: String = "usual.event.wifi.p2p.CONN_STATE_CHANGE"
```

**Function:** Indicates a common event for Wi-Fi P2P connection state changes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_WIFI_P2P_CURRENT_DEVICE_STATE_CHANGED

```cangjie
public static const COMMON_EVENT_WIFI_P2P_CURRENT_DEVICE_STATE_CHANGED: String = "usual.event.wifi.p2p.CURRENT_DEVICE_CHANGE"
```

**Function:** Indicates a common event for Wi-Fi P2P current device state changes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_WIFI_P2P_GROUP_STATE_CHANGED

```cangjie
public static const COMMON_EVENT_WIFI_P2P_GROUP_STATE_CHANGED: String = "usual.event.wifi.p2p.GROUP_STATE_CHANGED"
```

**Function:** Indicates a common event when Wi-Fi P2P group information changes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_WIFI_P2P_PEERS_DISCOVERY_STATE_CHANGED

```cangjie
public static const COMMON_EVENT_WIFI_P2P_PEERS_DISCOVERY_STATE_CHANGED: String = "usual.event.wifi.p2p.PEER_DISCOVERY_STATE_CHANGE"
```

**Function:** Indicates a common event for Wi-Fi P2P discovery state changes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_WIFI_P2P_PEERS_STATE_CHANGED

```cangjie
public static const COMMON_EVENT_WIFI_P2P_PEERS_STATE_CHANGED: String = "usual.event.wifi.p2p.DEVICES_CHANGE"
```

**Function:** Indicates a common event for Wi-Fi P2P peer state changes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_WIFI_P2P_STATE_CHANGED

```cangjie
public static const COMMON_EVENT_WIFI_P2P_STATE_CHANGED: String = "usual.event.wifi.p2p.STATE_CHANGE"
```

**Function:** Indicates a common event for Wi-Fi P2P state changes (enabled/disabled).

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_WIFI_POWER_STATE

```cangjie
public static const COMMON_EVENT_WIFI_POWER_STATE: String = "usual.event.wifi.POWER_STATE"
```

**Function:** Indicates a common event for Wi-Fi state changes (enabled/disabled).

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_WIFI_RSSI_VALUE

```cangjie
public static const COMMON_EVENT_WIFI_RSSI_VALUE: String = "usual.event.wifi.RSSI_VALUE"
```

**Function:** Indicates a common event for Wi-Fi signal strength (RSSI) changes.

**Type:** String

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### static const COMMON_EVENT_WIFI_SCAN_FINISHED

```cang## enum ValueType

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

**Function:** Contains the value types for additional information in public events.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### ARRAYBOOL(Array\<Bool>)

```cangjie
ARRAYBOOL(Array<Bool>)
```

**Function:** Represents an array of Bool type data.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### ARRAYF64(Array\<Float64>)

```cangjie
ARRAYF64(Array<Float64>)
```

**Function:** Represents an array of Float64 type data.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### ARRAYFD(Array\<Int32>)

```cangjie
ARRAYFD(Array<Int32>)
```

**Function:** Represents an array of file descriptor data.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### ARRAYI32(Array\<Int32>)

```cangjie
ARRAYI32(Array<Int32>)
```

**Function:** Represents an array of Int32 type data.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### ARRAYI64(Array\<Int64>)

```cangjie
ARRAYI64(Array<Int64>)
```

**Function:** Represents an array of Int64 type data.

**System Capability:** SystemCapability.Notification.CommonEvent

**Since:** 21

### ARRSTRING(Array\<String>)

```cangjie
ARRSTRING(Array<String>)
```

**Function:** Represents an array of String type data.

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