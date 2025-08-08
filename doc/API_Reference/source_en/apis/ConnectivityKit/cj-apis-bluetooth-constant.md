# ohos.bluetooth.constant (Bluetooth Constant Module)

The constant module provides definitions for Bluetooth-related constants.

## Import Module

```cangjie
import kit.ConnectivityKit.*
```

## enum ProfileConnectionState

```cangjie
public enum ProfileConnectionState <: Equatable<ProfileConnectionState> & ToString {
    | STATE_DISCONNECTED
    | STATE_CONNECTING
    | STATE_CONNECTED
    | STATE_DISCONNECTING
    | ...
}
```

**Description:** Connection state of Bluetooth device profiles.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parent Types:**

- Equatable\<ProfileConnectionState>
- ToString

### STATE_CONNECTED

```cangjie
STATE_CONNECTED
```

**Description:** Indicates the profile is connected.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### STATE_CONNECTING

```cangjie
STATE_CONNECTING
```

**Description:** Indicates the profile is connecting.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### STATE_DISCONNECTED

```cangjie
STATE_DISCONNECTED
```

**Description:** Indicates the profile is disconnected.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### STATE_DISCONNECTING

```cangjie
STATE_DISCONNECTING
```

**Description:** Indicates the profile is disconnecting.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### func !=(ProfileConnectionState)

```cangjie
public operator func !=(other: ProfileConnectionState): Bool 
```

**Description:** Compares inequality of Bluetooth device profile connection states.

**Parameters:**

| Name | Type | Mandatory | Description |
|:---|:---|:---|:---|
| other | [ProfileConnectionState](#enum-profileconnectionstate) | Yes | The profile connection state of Bluetooth device. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the profile connection states are different, otherwise returns false. |

### func ==(ProfileConnectionState)

```cangjie
public operator func ==(other: ProfileConnectionState): Bool 
```

**Description:** Compares equality of Bluetooth device profile connection states.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Name | Type | Mandatory | Description |
|:---|:---|:---|:---|
| other | [ProfileConnectionState](#enum-profileconnectionstate) | Yes | The profile connection state of Bluetooth device. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the profile connection states are identical, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String 
```

**Description:** Returns the string representation of Bluetooth device profile connection state.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The string representation of Bluetooth device profile connection state. |