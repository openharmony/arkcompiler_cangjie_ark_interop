# ohos.rpc (RPC Communication)

This module provides inter-process communication capabilities, including intra-device inter-process communication (IPC) and inter-device inter-process communication (RPC). The former is based on the Binder driver, while the latter is based on the soft bus driver.

## Importing the Module

```cangjie
import kit.IPCKit.*
```

## Usage Instructions

API sample code usage instructions:

- If the first line of sample code contains a "// index.cj" comment, it indicates that the sample can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the above sample project and configuration template, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#cangjie-sample-code-instructions).

## interface IRemoteBroker

```cangjie
public interface IRemoteBroker {
    func asObject(): IRemoteObject
}
```

**Function:** Proxy holder for remote objects. Used to obtain proxy objects.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### func asObject()

```cangjie
func asObject(): IRemoteObject
```

**Function:** Must be implemented by derived classes to obtain the proxy or remote object.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
|[IRemoteObject](#interface-iremoteobject)|If the caller is a RemoteObject object, it directly returns itself; if the caller is a [RemoteProxy](#class-remoteproxy) object, it returns its holder [IRemoteObject](#interface-iremoteobject).|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

// The following code can be added to the dependency definitions
class TestAbility <: IRemoteBroker {
    let remote: IRemoteObject
    init(remote: IRemoteObject) {
        this.remote = remote
    }
    public func asObject(): IRemoteObject {
        return this.remote
    }
}
```

## interface IRemoteObject

```cangjie
public interface IRemoteObject {
    func getLocalInterface(descriptor: String): IRemoteBroker
    func sendMessageRequest(code: UInt32, data: MessageSequence, reply: MessageSequence, options: MessageOption,
        callback: Callback1Argument<RequestResult>): Unit
    func registerDeathRecipient(recipient: DeathRecipient, flags: Int32): Unit
    func unregisterDeathRecipient(recipient: DeathRecipient, flags: Int32): Unit
    func getDescriptor(): String
    func isObjectDead(): Bool
}
```

**Function:** This interface can be used to query or obtain interface descriptors, add or remove death notifications, dump object states to specific files, and send messages.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### func getDescriptor()

```cangjie
func getDescriptor(): String
```

**Function:** Obtains the interface descriptor of the object. The interface descriptor is a string.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
|String|Returns the interface descriptor.|

**Exceptions:**

- BusinessException: For detailed error code information, see [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).

  | Error Code ID | Error Message |
  |:---|:---|
  |1900008|The proxy or remote object is invalid.|

### func getLocalInterface(String)

```cangjie
func getLocalInterface(descriptor: String): IRemoteBroker
```

**Function:** Queries the string of the interface descriptor.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|descriptor|String|Yes|-|The string of the interface descriptor.|

**Return Value:**

| Type | Description |
|:----|:----|
|[IRemoteBroker](#interface-iremotebroker)|Returns the IRemoteBroker object bound to the specified interface descriptor.|

**Exceptions:**

- BusinessException: For detailed error code information, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  |401|Parameter error. Possible causes: <br/> 1.The number of parameters is incorrect; <br/> 2.The parameter type does not match; <br/> 3.The string length exceeds 40960 bytes; <br/> 4.The number of bytes copied to the buffer is different from the length of the obtained string.|

### func isObjectDead()

```cangjie
func isObjectDead(): Bool
```

**Function:** Checks whether the current object is dead.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
|Bool|true: The object is dead; false: The object is not dead.|

### func registerDeathRecipient(DeathRecipient, Int32)

```cangjie
func registerDeathRecipient(recipient: DeathRecipient, flags: Int32): Unit
```

**Function:** Registers a callback to receive death notifications of remote objects. This method is called if the process of the remote object matching the RemoteProxy object dies.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|recipient|[DeathRecipient](#class-deathrecipient)|Yes|-|The callback to register.|
|flags|Int32|Yes|-|The death notification flag.|

**Exceptions:**

- BusinessException: For detailed error code information, see [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  |401|Parameter error. Possible causes: <br/> 1.The number of parameters is incorrect; <br/> 2.The parameter type does not match; <br/> 3.The callback used to receive remote object death notifications is empty.|
  |1900008|The proxy or remote object is invalid.|

### func sendMessageRequest(UInt32, MessageSequence, MessageSequence, MessageOption, Callback1Argument\<RequestResult>)

```cangjie
func sendMessageRequest(code: UInt32, data: MessageSequence, reply: MessageSequence, options: MessageOption,
    callback: Callback1Argument<RequestResult>): Unit
```

**Function:** Sends a MessageSequence message to the peer process in synchronous or asynchronous mode. If the asynchronous mode is set for the option, the callback is received immediately, and the reply message contains no content. The specific reply needs to be obtained from the callback on the service side. If the synchronous mode is set for the option, the callback is received when sendRequest returns, and the reply content is in the reply message.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|code|UInt32|Yes|-|The message code (1-16777215) for this request call, determined by the communicating parties. If the interface is generated by the IDL tool, the message code is automatically generated by the IDL.|
|data|[MessageSequence](#class-messagesequence)|Yes|-|The MessageSequence object that stores the data to be sent.|
|reply|[MessageSequence](#class-messagesequence)|Yes|-|The MessageSequence object that receives the response data.|
|options|[MessageOption](#class-messageoption)|Yes|-|The synchronous or asynchronous mode of this request. The default is synchronous call.|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[RequestResult](#struct-requestresult)>|Yes|-|The callback that receives the sending result.|

**Exceptions:**

- BusinessException: For detailed error code information, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  |401|Parameter error. Possible causes: <br/> 1.The number of parameters is incorrect; <br/> 2.The parameter type does not match; <br/> 3.Failed to obtain the passed object instance.|

### func unregisterDeathRecipient(DeathRecipient, Int32)

```cangjie
func unregisterDeathRecipient(recipient: DeathRecipient, flags: Int32): Unit
```

**Function:** Unregisters the callback used to receive death notifications of remote objects.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|recipient|[DeathRecipient](#class-deathrecipient)|Yes|-|The callback to unregister.|
|flags|Int32|Yes|-|The death notification flag.|

**Exceptions:**

- BusinessException: For detailed error code information, see [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  |401|Parameter error. Possible causes: <br/> 1.The number of parameters is incorrect; <br/> 2.The parameter type does not match; <br/> 3.The callback used to receive remote object death notifications is empty.|
  |1900008|The proxy or remote object is invalid.|

## interface Parcelable

```cangjie
public interface Parcelable {
    func marshalling(dataOut: MessageSequence): Bool
    func unmarshalling(dataIn: MessageSequence): Bool
}
```

**Function:** During inter-process communication (IPC), writes class objects to MessageSequence and restores them from MessageSequence.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### func marshalling(MessageSequence)

```cangjie
func marshalling(dataOut: MessageSequence): Bool
```

**Function:** Marshals this serializable object into MessageSequence.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|dataOut|[MessageSequence](#class-messagesequence)|Yes|-|The MessageSequence object into which the serializable object will be marshaled.|

**Return Value:**

| Type | Description |
|:----|:----|
|Bool|true: Marshaling succeeded; false: Marshaling failed.|

### func unmarshalling(MessageSequence)

```cangjie
func unmarshalling(dataIn: MessageSequence): Bool
```
**Function:** Unmarshals this serializable object from MessageSequence.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| dataIn | [MessageSequence](#class-messagesequence) | Yes | - | The MessageSequence object containing the marshaled serializable object. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | true: Unmarshaling succeeded; false: Unmarshaling failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

// Code can be added in the dependency definition section
class MyParcelable <: Parcelable {
    var num: Int32 = 0
    var str: String = ''
    init(num: Int32, str: String) {
        this.num = num
        this.str = str
    }
    public func marshalling(messageSequence: MessageSequence): Bool {
        messageSequence.writeInt(this.num)
        messageSequence.writeString(this.str)
        return true
    }
    public func unmarshalling(messageSequence: MessageSequence): Bool {
        this.num = messageSequence.readInt()
        this.str = messageSequence.readString()
        return true
    }
}

let parcelable = MyParcelable(1, "aaa")
let data = MessageSequence.create()
parcelable.marshalling(data)
parcelable.unmarshalling(data)
```

## class Ashmem

```cangjie
public class Ashmem {
    public static const PROT_EXEC: UInt32 = 4
    public static const PROT_NONE: UInt32 = 0
    public static const PROT_READ: UInt32 = 1
    public static const PROT_WRITE: UInt32 = 2
}
```

**Function:** Provides methods related to anonymous shared memory objects, including creating, closing, mapping and unmapping Ashmem, reading and writing data from/to Ashmem, obtaining Ashmem size, and setting Ashmem protection.

Shared memory is only applicable for cross-process communication within the same device.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### static const PROT_EXEC

```cangjie
public static const PROT_EXEC: UInt32 = 4
```

**Function:** The mapped memory is executable.

**Type:** UInt32

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### static const PROT_NONE

```cangjie
public static const PROT_NONE: UInt32 = 0
```

**Function:** The mapped memory is inaccessible.

**Type:** UInt32

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### static const PROT_READ

```cangjie
public static const PROT_READ: UInt32 = 1
```

**Function:** The mapped memory is readable.

**Type:** UInt32

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### static const PROT_WRITE

```cangjie
public static const PROT_WRITE: UInt32 = 2
```

**Function:** The mapped memory is writable.

**Type:** UInt32

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### static func create(String, Int32)

```cangjie
public static func create(name: String, size: Int32): Ashmem
```

**Function:** Static method to create an Ashmem object by copying the file descriptor (fd) of an existing Ashmem object. Both Ashmem objects point to the same shared memory region.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | Name used for querying Ashmem information. |
| size | Int32 | Yes | - | Size of Ashmem in bytes. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Ashmem](#class-ashmem) | Returns the created Ashmem object. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. Incorrect number of parameters;<br>2. The passed parameter is not an Ahmem object;<br>3. The ashmem instance for obtaining packaging is empty. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let ashmem = Ashmem.create("ashmem", 1024*1024)
```

### static func create(Ashmem)

```cangjie
public static func create(ashmem: Ashmem): Ashmem
```

**Function:** Static method to create an Ashmem object by copying the file descriptor (fd) of an existing Ashmem object. Both Ashmem objects point to the same shared memory region.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| ashmem | [Ashmem](#class-ashmem) | Yes | - | Existing Ashmem object. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Ashmem](#class-ashmem) | Returns the created Ashmem object. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. Incorrect number of parameters;<br>2. The passed parameter is not an Ahmem object;<br>3. The ashmem instance for obtaining packaging is empty. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let ashmem = Ashmem.create("ashmem", 1024*1024) //static func create(String, Int32)
let ashmem2 = Ashmem.create(ashmem) //static func create(Ashmem)
```

### func closeAshmem()

```cangjie
public func closeAshmem(): Unit
```

**Function:** Closes this Ashmem.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let ashmem = Ashmem.create("ashmem", 1024*1024)
ashmem.closeAshmem()
```

### func getAshmemSize()

```cangjie
public func getAshmemSize(): Int32
```

**Function:** Obtains the memory size of the Ashmem object.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | Returns the memory size of the Ashmem object. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let ashmem = Ashmem.create("ashmem", 1024*1024)
ashmem.getAshmemSize()
```

### func mapReadWriteAshmem()

```cangjie
public func mapReadWriteAshmem(): Unit
```

**Function:** Creates a readable and writable shared file mapping in the virtual address space of this process.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. Incorrect number of parameters;<br>2. The parameter is not an instance of the Ashmem object. |
  | 1900001 | Failed to call mmap. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let ashmem = Ashmem.create("ashmem", 1024*1024)
ashmem.mapReadWriteAshmem()
```

### func mapReadonlyAshmem()

```cangjie
public func mapReadonlyAshmem(): Unit
```

**Function:** Creates a read-only shared file mapping in the process's virtual address space.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |1900001|Failed to call mmap.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let ashmem = Ashmem.create("ashmem", 1024*1024)
ashmem.mapReadonlyAshmem()
```

### func mapTypedAshmem(UInt32)

```cangjie
public func mapTypedAshmem(mapType: UInt32): Unit
```

**Function:** Creates a shared file mapping in the process's virtual address space, with the mapping size specified by this Ashmem object.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|mapType|UInt32|Yes|-|Specifies the protection level of the mapped memory region.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.Incorrect number of parameters;<br>2.Parameter type mismatch;<br>3.The passed mapType exceeds the maximum protection level.|
  |1900001|Failed to call mmap.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let ashmem = Ashmem.create("ashmem", 1024*1024)
ashmem.mapTypedAshmem(Ashmem.PROT_READ | Ashmem.PROT_WRITE)
```

### func readDataFromAshmem(Int64, Int64)

```cangjie
public func readDataFromAshmem(size: Int64, offset: Int64): Array<Byte>
```

**Function:** Reads data from the shared file associated with this Ashmem object.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|size|Int64|Yes|-|Size of the data to read.|
|offset|Int64|Yes|-|Starting position of the data to read in the memory region associated with this Ashmem object.|

**Return Value:**

|Type|Description|
|:----|:----|
|Array\<Byte>|Returns the read data.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|Parameter error. Possible causes: <br/> 1.Incorrect number of parameters; <br/> 2.Parameter type mismatch.|
  |1900004|Failed to read data from the shared memory.|

### func setProtectionType(UInt32)

```cangjie
public func setProtectionType(protectionType: UInt32): Unit
```

**Function:** Sets the protection level of the mapped memory region.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|protectionType|UInt32|Yes|-|The protection type to set.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.Incorrect number of parameters;<br>2.Parameter type mismatch.|
  |1900002|Failed to call ioctl.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let ashmem = Ashmem.create("ashmem", 1024*1024)
ashmem.setProtectionType(Ashmem.PROT_READ)
```

### func unmapAshmem()

```cangjie
public func unmapAshmem(): Unit
```

**Function:** Removes the address mapping of this Ashmem object.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let ashmem = Ashmem.create("ashmem", 1024*1024)
ashmem.unmapAshmem()
```

### func writeDataToAshmem(Array\<Byte>, Int64, Int64)

```cangjie
public func writeDataToAshmem(buf: Array<Byte>, size: Int64, offset: Int64): Unit
```

**Function:** Writes data to the shared file associated with this Ashmem object.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|buf|Array\<Byte>|Yes|-|Data to write to the Ashmem object.|
|size|Int64|Yes|-|Size of the data to write.|
|offset|Int64|Yes|-|Starting position of the data to write in the memory region associated with this Ashmem object.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|Parameter error. Possible causes: <br/> 1.Incorrect number of parameters; <br/> 2.Parameter type mismatch; <br/> 3.Failed to obtain arrayBuffer information.|
  |1900003|Failed to write data to the shared memory.|

## class DeathRecipient

```cangjie
public abstract class DeathRecipient {}
```

**Function:** Used to subscribe to death notifications of remote objects. When a subscribed remote object dies, the local end can receive a message and call the [onRemoteDied](#func-onremotedied) method. A remote object's death can occur when the process hosting the remote object dies, the device hosting the remote object shuts down or restarts, or, when the remote and local objects are on different devices, when the remote object leaves the network.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### func onRemoteDied()

```cangjie
public open func onRemoteDied(): Unit
```

**Function:** Automatically called when a remote object dies after successfully adding a death notification subscription.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

// This code can be added to dependency definitions
class MyDeathRecipient <: DeathRecipient {
    public func onRemoteDied(): Unit {
    }
}
```

## class ErrorCode

```cangjie
public class ErrorCode {
    public static const CHECK_PARAM_ERROR: Int32 = 401
    public static const OS_MMAP_ERROR: Int32 = 1900001
    public static const OS_IOCTL_ERROR: Int32 = 1900002
    public static const WRITE_TO_ASHMEM_ERROR: Int32 = 1900003
    public static const READ_FROM_ASHMEM_ERROR: Int32 = 1900004
    public static const ONLY_PROXY_OBJECT_PERMITTED_ERROR: Int32 = 1900005
    public static const ONLY_REMOTE_OBJECT_PERMITTED_ERROR: Int32 = 1900006
    public static const COMMUNICATION_ERROR: Int32 = 1900007
    public static const PROXY_OR_REMOTE_OBJECT_INVALID_ERROR: Int32 = 1900008
    public static const WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR: Int32 = 1900009
    public static const READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR: Int32 = 1900010
    public static const PARCEL_MEMORY_ALLOC_ERROR: Int32 = 1900011
    public static const CALL_JS_METHOD_ERROR: Int32 = 1900012
    public static const OS_DUP_ERROR: Int32 = 1900013
}
```

**Function:** Numeric values and meanings of error codes.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### static const CALL_JS_METHOD_ERROR

```cangjie
public static const CALL_JS_METHOD_ERROR: Int32 = 1900012
```

**Function:** Failed to execute JS callback method.

**Type:** Int32

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### static const CHECK_PARAM_ERROR

```cangjie
public static const CHECK_PARAM_ERROR: Int32 = 401
```

**Function:** Parameter check failed.

**Type:** Int32
**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

### static const COMMUNICATION_ERROR  

```cangjie  
public static const COMMUNICATION_ERROR: Int32 = 1900007  
```  

**Description:** Failed to perform inter-process communication with a remote object.  

**Type:** Int32  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

### static const ONLY_PROXY_OBJECT_PERMITTED_ERROR  

```cangjie  
public static const ONLY_PROXY_OBJECT_PERMITTED_ERROR: Int32 = 1900005  
```  

**Description:** Only proxy objects are permitted for this operation.  

**Type:** Int32  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

### static const ONLY_REMOTE_OBJECT_PERMITTED_ERROR  

```cangjie  
public static const ONLY_REMOTE_OBJECT_PERMITTED_ERROR: Int32 = 1900006  
```  

**Description:** Only remote objects are permitted for this operation.  

**Type:** Int32  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

### static const OS_DUP_ERROR  

```cangjie  
public static const OS_DUP_ERROR: Int32 = 1900013  
```  

**Description:** Failed to execute the system call `dup`.  

**Type:** Int32  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

### static const OS_IOCTL_ERROR  

```cangjie  
public static const OS_IOCTL_ERROR: Int32 = 1900002  
```  

**Description:** Failed to execute the system call `ioctl` on a shared memory file descriptor.  

**Type:** Int32  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

### static const OS_MMAP_ERROR  

```cangjie  
public static const OS_MMAP_ERROR: Int32 = 1900001  
```  

**Description:** Failed to execute the system call `mmap`.  

**Type:** Int32  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

### static const PARCEL_MEMORY_ALLOC_ERROR  

```cangjie  
public static const PARCEL_MEMORY_ALLOC_ERROR: Int32 = 1900011  
```  

**Description:** Memory allocation failed during serialization.  

**Type:** Int32  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

### static const PROXY_OR_REMOTE_OBJECT_INVALID_ERROR  

```cangjie  
public static const PROXY_OR_REMOTE_OBJECT_INVALID_ERROR: Int32 = 1900008  
```  

**Description:** Invalid proxy or remote object.  

**Type:** Int32  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

### static const READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR  

```cangjie  
public static const READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR: Int32 = 1900010  
```  

**Description:** Failed to read data from MessageSequence.  

**Type:** Int32  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

### static const READ_FROM_ASHMEM_ERROR  

```cangjie  
public static const READ_FROM_ASHMEM_ERROR: Int32 = 1900004  
```  

**Description:** Failed to read data from shared memory.  

**Type:** Int32  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

### static const WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR  

```cangjie  
public static const WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR: Int32 = 1900009  
```  

**Description:** Failed to write data to MessageSequence.  

**Type:** Int32  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

### static const WRITE_TO_ASHMEM_ERROR  

```cangjie  
public static const WRITE_TO_ASHMEM_ERROR: Int32 = 1900003  
```  

**Description:** Failed to write data to shared memory.  

**Type:** Int32  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

## class IPCSkeleton  

```cangjie  
public class IPCSkeleton {}  
```  

**Description:** Used to obtain IPC context information, including UID and PID, local and remote device IDs, and checking whether an interface call is on the same device.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

### static func flushCmdBuffer(IRemoteObject)  

```cangjie  
public static func flushCmdBuffer(object: IRemoteObject): Unit  
```  

**Description:** A static method that flushes all pending commands from the specified RemoteProxy to the corresponding RemoteObject. It is recommended to call this method before performing any sensitive operations.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| object | [IRemoteObject](#interface-iremoteobject) | Yes | - | Returns the system capability manager. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 401 | Parameter error. Possible causes:<br>1. Incorrect number of parameters;<br>2. Parameter type mismatch;<br>3. The passed mapType exceeds the maximum protection level. |  

### static func getCallingDeviceID()  

```cangjie  
public static func getCallingDeviceID(): String  
```  

**Description:** A static method to obtain the device ID of the calling process.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| String | Returns the device ID of the calling process. |  

### static func getCallingPid()  

```cangjie  
public static func getCallingPid(): Int32  
```  

**Description:** A static method to obtain the PID of the caller. This method is called by the [RemoteObject](#class-remoteobject) object in the `onRemoteRequest` method. If called outside the IPC context (onRemoteRequest), it returns the PID of the current process.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Int32 | Returns the PID of the caller. |  

### static func getCallingTokenId()  

```cangjie  
public static func getCallingTokenId(): UInt32  
```  

**Description:** A static method to obtain the TokenId of the caller, used for identity verification by the callee.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| UInt32 | Returns the TokenId of the caller. |  

### static func getCallingUid()  

```cangjie  
public static func getCallingUid(): Int32  
```  

**Description:** A static method to obtain the UID of the caller. This method is called by the RemoteObject object in the `onRemoteRequest` method. If called outside the IPC context (onRemoteRequest), it returns the UID of the current process.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Int32 | Returns the UID of the caller. |  

### static func getContextObject()  

```cangjie  
public static func getContextObject(): IRemoteObject  
```  

**Description:** A static method to obtain the system capability manager.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [IRemoteObject](#interface-iremoteobject) | Returns the system capability manager. |### static func getLocalDeviceID()

```cangjie
public static func getLocalDeviceID(): String
```

**Function:** Static method to retrieve the local device ID.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type   | Description                  |
|:-------|:-----------------------------|
| String | Returns the ID of the local device. |

### static func isLocalCalling()

```cangjie
public static func isLocalCalling(): Bool
```

**Function:** Static method to check whether the current communication peer is a process on the same device.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description                                  |
|:-----|:---------------------------------------------|
| Bool | `true`: The call is on the same device; `false`: The call is not on the same device. |

## class MessageOption

```cangjie
public class MessageOption {
    public static const TF_SYNC: Int32 = 0x00
    public static const TF_ASYNC: Int32 = 0x01
    public static const TF_ACCEPT_FDS: Int32 = 0x10
    public static const TF_WAIT_TIME: Int32 = 0x8
    public init(async!: Bool = false, waitTime!: Int32 = MessageOption.TF_WAIT_TIME)
}
```

**Function:** Public message options, constructing a specified `MessageOption` object using the given flag types.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### static const TF_ACCEPT_FDS

```cangjie
public static const TF_ACCEPT_FDS: Int32 = 0x10
```

**Function:** Indicates that the `sendMessageRequest9+` interface can pass file descriptors.

**Type:** Int32

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### static const TF_ASYNC

```cangjie
public static const TF_ASYNC: Int32 = 0x01
```

**Function:** Asynchronous call flag.

**Type:** Int32

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### static const TF_SYNC

```cangjie
public static const TF_SYNC: Int32 = 0x00
```

**Function:** Synchronous call flag.

**Type:** Int32

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### static const TF_WAIT_TIME

```cangjie
public static const TF_WAIT_TIME: Int32 = 0x8
```

**Function:** RPC wait time (in seconds), not applicable for IPC scenarios.

**Type:** Int32

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### init(Bool, Int32)

```cangjie
public init(async!: Bool = false, waitTime!: Int32 = MessageOption.TF_WAIT_TIME)
```

**Function:** Constructor for `MessageOption`.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter | Type  | Required | Default Value               | Description                                                                 |
|:----------|:------|:---------|:----------------------------|:----------------------------------------------------------------------------|
| async     | Bool  | No       | `false`                     | **Named parameter.** `true`: Indicates an asynchronous call flag; `false`: Indicates a synchronous call flag. Default is synchronous. |
| waitTime  | Int32 | No       | `MessageOption.TF_WAIT_TIME` | **Named parameter.** Maximum wait time for RPC calls. Default is `TF_WAIT_TIME`. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let mo = MessageOption()
```

### func getFlags()

```cangjie
public func getFlags(): Int32
```

**Function:** Retrieves the synchronous or asynchronous call flag.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type  | Description                                  |
|:------|:---------------------------------------------|
| Int32 | Returns the synchronous or asynchronous call flag upon success. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let mo = MessageOption()
mo.getFlags()
```

### func getWaitTime()

```cangjie
public func getWaitTime(): Int32
```

**Function:** Retrieves the maximum wait time for RPC calls.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type  | Description                  |
|:------|:-----------------------------|
| Int32 | Maximum wait time for RPC. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let mo = MessageOption()
mo.getWaitTime()
```

### func isAsync()

```cangjie
public func isAsync(): Bool
```

**Function:** Determines whether the `SendMessageRequest` call is synchronous or asynchronous.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description                                  |
|:-----|:---------------------------------------------|
| Bool | `true`: Asynchronous call succeeded; `false`: Synchronous call succeeded. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let mo = MessageOption()
mo.isAsync()
```

### func setAsync(Bool)

```cangjie
public func setAsync(async: Bool): Unit
```

**Function:** Sets the flag to determine whether the `SendMessageRequest` call is synchronous or asynchronous.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter | Type  | Required | Default Value | Description                                                                 |
|:----------|:------|:---------|:--------------|:----------------------------------------------------------------------------|
| async     | Bool  | Yes      | -             | `true`: Indicates an asynchronous call flag; `false`: Indicates a synchronous call flag. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let mo = MessageOption()
mo.setAsync(true)
```

### func setFlags(Int32)

```cangjie
public func setFlags(flags: Int32): Unit
```

**Function:** Sets the synchronous or asynchronous call flag.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter | Type  | Required | Default Value | Description                  |
|:----------|:------|:---------|:--------------|:-----------------------------|
| flags     | Int32 | Yes      | -             | Synchronous or asynchronous call flag. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let mo = MessageOption()
mo.setFlags(1)
```

### func setWaitTime(Int32)

```cangjie
public func setWaitTime(waitTime: Int32): Unit
```
**Function:** Sets the maximum waiting time for RPC calls.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| waitTime | Int32 | Yes | - | Maximum waiting time for RPC calls, capped at 3000 seconds. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let mo = MessageOption()
mo.setWaitTime(1)
```

## class MessageSequence

```cangjie
public class MessageSequence {}
```

**Function:** During RPC or IPC processes, the sender can use the write methods provided by MessageSequence to write data to be sent in a specific format into this object. The receiver can use the read methods provided by MessageSequence to read data in specific formats from this object. Data formats include: basic types and arrays, IPC objects, interface descriptors, and custom serialized objects.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### static func closeFileDescriptor(Int32)

```cangjie
public static func closeFileDescriptor(fd: Int32): Unit
```

**Function:** Static method to close the given file descriptor.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| fd | Int32 | Yes | - | The file descriptor to be closed. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. Incorrect number of parameters;<br>2. Parameter type mismatch. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*
import kit.CoreFileKit.*

let filePath = "path/to/file"
let file = FileFs.open(filePath, mode: (OpenMode.CREATE.mode | OpenMode.READ_WRITE.mode))
MessageSequence.closeFileDescriptor(file.fd)
```

### static func create()

```cangjie
public static func create(): MessageSequence
```

**Function:** Static method to create a MessageSequence object.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [MessageSequence](#class-messagesequence) | Returns the created MessageSequence object. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
```

### static func dupFileDescriptor(Int32)

```cangjie
public static func dupFileDescriptor(fd: Int32): Int32
```

**Function:** Static method to duplicate the given file descriptor.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| fd | Int32 | Yes | - | Represents an existing file descriptor. |

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | Returns the new file descriptor. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. Incorrect number of parameters;<br>2. Parameter type mismatch. |
  | 1900013 | Failed to call dup. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*
import kit.CoreFileKit.*

let filePath = "path/to/file"
let file = FileFs.open(filePath, mode: (OpenMode.CREATE.mode | OpenMode.READ_WRITE.mode))
MessageSequence.dupFileDescriptor(file.fd)
```

### func containFileDescriptors()

```cangjie
public func containFileDescriptors(): Bool
```

**Function:** Checks whether this MessageSequence object contains file descriptors.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | true: Contains file descriptors; false: Does not contain file descriptors. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.containFileDescriptors()
```

### func getCapacity()

```cangjie
public func getCapacity(): UInt32
```

**Function:** Gets the capacity size of the current MessageSequence object.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| UInt32 | The capacity size of the MessageSequence instance obtained. In bytes. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
let result = data.getCapacity()
```

### func getRawDataCapacity()

```cangjie
public func getRawDataCapacity(): UInt32
```

**Function:** Gets the maximum raw data capacity that MessageSequence can hold.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| UInt32 | Returns the maximum raw data capacity that MessageSequence can hold, which is 128MB. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.getRawDataCapacity()
```

### func getReadPosition()

```cangjie
public func getReadPosition(): UInt32
```

**Function:** Gets the read position of MessageSequence.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| UInt32 | Returns the current read position in the MessageSequence instance. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
let pos = data.getReadPosition()
```

### func getReadableBytes()

```cangjie
public func getReadableBytes(): UInt32
```

**Function:** Gets the readable byte space of MessageSequence.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| UInt32 | The readable byte space of the MessageSequence instance obtained. In bytes. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.getReadableBytes()
```
**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
let bytes = data.getReadableBytes()
```

### func getSize()

```cangjie
public func getSize(): UInt32
```

**Function:** Gets the data size of the current MessageSequence object.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|UInt32|The data size of the obtained MessageSequence instance, in bytes.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.Incorrect number of parameters;<br>2.Parameter type mismatch.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
let size = data.getSize()
```

### func getWritableBytes()

```cangjie
public func getWritableBytes(): UInt32
```

**Function:** Gets the writable byte space size of the MessageSequence.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|UInt32|The obtained writable byte space of the MessageSequence instance, in bytes.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
let bytes = data.getWritableBytes()
```

### func getWritePosition()

```cangjie
public func getWritePosition(): UInt32
```

**Function:** Gets the write position of the MessageSequence.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|UInt32|Returns the current write position in the MessageSequence instance.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
let pos = data.getWritePosition()
```

### func readAshmem()

```cangjie
public func readAshmem(): Ashmem
```

**Function:** Reads an anonymous shared object from the MessageSequence.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|[Ashmem](#class-ashmem)|Returns the anonymous shared object.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|check param failed.|
  |1900004|Failed to read data from the shared memory.|

### func readBoolean()

```cangjie
public func readBoolean(): Bool
```

**Function:** Reads a boolean value from the MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns the read boolean value.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.readBoolean()
```

### func readBooleanArray(ArrayList\<Bool>)

```cangjie
public func readBooleanArray(dataIn: ArrayList<Bool>): Unit
```

**Function:** Reads a boolean array from the MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|dataIn|ArrayList\<Bool>|Yes|-|The boolean array to read.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.Incorrect number of parameters;<br>3.Parameter type mismatch.|
  |1900010|Failed to read data from the message sequence.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*
import std.collection.ArrayList

let data = MessageSequence.create()
let list = ArrayList<Bool>()
data.readBooleanArray(list)
```

### func readBooleanArray()

```cangjie
public func readBooleanArray(): Array<Bool>
```

**Function:** Reads all boolean arrays from the MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Array\<Bool>|Returns the boolean array.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.readBooleanArray()
```

### func readByte()

```cangjie
public func readByte(): Int8
```

**Function:** Reads a byte value from the MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Int8|Returns the byte value.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.readByte()
```
### func readByteArray(ArrayList\<Int8>)

```cangjie
public func readByteArray(dataIn: ArrayList<Int8>): Unit
```

**Function:** Reads a byte array from a MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| dataIn | ArrayList\<Int8> | Yes | - | The byte array to be read. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes: 1. The parameter is an empty array; 2. The number of parameters is incorrect; 3. The parameter type does not match. |
  | 1900010 | Failed to read data from the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*
import std.collection.ArrayList

let data = MessageSequence.create()
let list = ArrayList<Int8>()
data.readByteArray(list)
```

### func readByteArray()

```cangjie
public func readByteArray(): Array<Int8>
```

**Function:** Reads a byte array from a MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<Int8> | Returns the byte array. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 1900010 | Failed to read data from the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.readByteArray()
```

### func readChar()

```cangjie
public func readChar(): UInt8
```

**Function:** Reads a single character value from a MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| UInt8 | Returns the single character array. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 1900010 | Failed to read data from the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.readChar()
```

### func readCharArray(ArrayList\<UInt8>)

```cangjie
public func readCharArray(dataIn: ArrayList<UInt8>): Unit
```

**Function:** Reads a single character array from a MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| dataIn | ArrayList\<UInt8> | Yes | - | The single character array to be read. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 1900010 | Failed to read data from the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*
import std.collection.ArrayList

let data = MessageSequence.create()
let list = ArrayList<UInt8>()
data.readCharArray(list)
```

### func readCharArray()

```cangjie
public func readCharArray(): Array<UInt8>
```

**Function:** Reads a single character array from a MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<UInt8> | Returns the single character array. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 1900010 | Failed to read data from the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.readCharArray()
```

### func readDouble()

```cangjie
public func readDouble(): Float64
```

**Function:** Reads a double-precision floating-point value from a MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Float64 | Returns the double-precision floating-point value. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 1900010 | Failed to read data from the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.readDouble()
```

### func readDoubleArray(ArrayList\<Float64>)

```cangjie
public func readDoubleArray(dataIn: ArrayList<Float64>): Unit
```

**Function:** Reads all double-precision floating-point arrays from a MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| dataIn | ArrayList\<Float64> | Yes | - | The double-precision floating-point array to be read. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. The number of parameters is incorrect;<br>3. The parameter type does not match. |
  | 1900010 | Failed to read data from the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*
import std.collection.ArrayList

let data = MessageSequence.create()
let list = ArrayList<Float64>()
data.readDoubleArray(list)
```

### func readDoubleArray()

```cangjie
public func readDoubleArray(): Array<Float64>
```

**Function:** Reads all double-precision floating-point arrays from a MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<Float64> | Returns the double-precision floating-point array. |

**Exceptions:**- BusinessException: For detailed information about the error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 1900010 | Failed to read data from the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*
import std.collection.ArrayList

let data = MessageSequence.create()
data.readDoubleArray()
```

### func readException()

```cangjie
public func readException(): Unit
```

**Description:** Reads an exception from the MessageSequence.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed information about the error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 1900010 | Failed to read data from the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.readException()
```

### func readFileDescriptor()

```cangjie
public func readFileDescriptor(): Int32
```

**Description:** Reads a file descriptor from the MessageSequence.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | Returns the file descriptor. |

**Exceptions:**

- BusinessException: For detailed information about the error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 1900010 | Failed to read data from the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.readFileDescriptor()
```

### func readFloat()

```cangjie
public func readFloat(): Float32
```

**Description:** Reads a floating-point value from the MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Float32 | Returns the floating-point value. |

**Exceptions:**

- BusinessException: For detailed information about the error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 1900010 | Failed to read data from the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.readFloat()
```

### func readFloat32Array()

```cangjie
public func readFloat32Array(): Array<Float32>
```

**Description:** Reads data of type Array\<Float32> from the MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<Float32> | The read data. |

**Exceptions:**

- BusinessException: For detailed information about the error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 1900010 | Failed to read data from the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.readFloat32Array()
```

### func readFloat64Array()

```cangjie
public func readFloat64Array(): Array<Float64>
```

**Description:** Reads data of type Array\<Float64> from the MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<Float64> | The read data. |

**Exceptions:**

- BusinessException: For detailed information about the error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 1900010 | Failed to read data from the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.readFloat64Array()
```

### func readFloatArray(ArrayList\<Float32>)

```cangjie
public func readFloatArray(dataIn: ArrayList<Float32>): Unit
```

**Description:** Reads a floating-point array from the MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| dataIn | ArrayList\<Float32> | Yes | - | The floating-point array to read. |

**Exceptions:**

- BusinessException: For detailed information about the error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. Incorrect number of parameters;<br>2. Parameter type mismatch;<br>3. Incorrect typeCode value obtained. |
  | 1900010 | Failed to read data from the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*
import std.collection.ArrayList

let data = MessageSequence.create()
let list = ArrayList<Float32>()
data.readFloatArray(list)
```

### func readFloatArray()

```cangjie
public func readFloatArray(): Array<Float32>
```

**Description:** Reads a floating-point array from the MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<Float32> | Returns the floating-point array. |

**Exceptions:**

- BusinessException: For detailed information about the error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 1900010 | Failed to read data from the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.readFloatArray()
```

### func readInt()

```cangjie
public func readInt(): Int32
```

**Description:** Reads an integer value from the MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Int32 | Returns an integer value. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, please refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 1900010 | Failed to read data from the message sequence. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.IPCKit.*  

let data = MessageSequence.create()  
data.readInt()  
```  

### func readInt16Array()  

```cangjie  
public func readInt16Array(): Array<Int16>  
```  

**Function:** Reads Array\<Int16> type data from a MessageSequence instance.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Array\<Int16> | The read data. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, please refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 1900010 | Failed to read data from the message sequence. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.IPCKit.*  

let data = MessageSequence.create()  
data.readInt16Array()  
```  

### func readInt32Array()  

```cangjie  
public func readInt32Array(): Array<Int32>  
```  

**Function:** Reads Array\<Int32> type data from a MessageSequence instance.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Array\<Int32> | The read data. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, please refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 1900010 | Failed to read data from the message sequence. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.IPCKit.*  

let data = MessageSequence.create()  
data.readInt32Array()  
```  

### func readInt64Array()  

```cangjie  
public func readInt64Array(): Array<Int64>  
```  

**Function:** Reads Array\<Int64> type data from a MessageSequence instance.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Array\<Int64> | The read data. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, please refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 1900010 | Failed to read data from the message sequence. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.IPCKit.*  

let data = MessageSequence.create()  
data.readInt64Array()  
```  

### func readInt8Array()  

```cangjie  
public func readInt8Array(): Array<Int8>  
```  

**Function:** Reads Array\<Int8> type data from a MessageSequence instance.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Array\<Int8> | The read data. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, please refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 1900010 | Failed to read data from the message sequence. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.IPCKit.*  

let data = MessageSequence.create()  
data.readInt8Array()  
```  

### func readIntArray(ArrayList\<Int32>)  

```cangjie  
public func readIntArray(dataIn: ArrayList<Int32>): Unit  
```  

**Function:** Reads an integer array from a MessageSequence instance.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| dataIn | ArrayList\<Int32> | Yes | - | The integer array to read. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, please refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 401 | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. The number of parameters is incorrect;<br>3. The parameter type does not match. |  
  | 1900010 | Failed to read data from the message sequence. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.IPCKit.*  
import std.collection.ArrayList  

let data = MessageSequence.create()  
let list = ArrayList<Int32>()  
data.readIntArray(list)  
```  

### func readIntArray()  

```cangjie  
public func readIntArray(): Array<Int32>  
```  

**Function:** Reads an integer array from a MessageSequence instance.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Array\<Int32> | Returns the integer array. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, please refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 1900010 | Failed to read data from the message sequence. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.IPCKit.*  

let data = MessageSequence.create()  
data.readIntArray()  
```  

### func readInterfaceToken()  

```cangjie  
public func readInterfaceToken(): String  
```  

**Function:** Reads an interface descriptor from a MessageSequence object. The interface descriptor is read in the order it was written to the MessageSequence. Local objects can use this information to verify the current communication.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| String | Returns the read interface descriptor. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, please refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 1900010 | Failed to read data from the message sequence. |  

### func readLong()  

```cangjie  
public func readLong(): Int64  
```  

**Function:** Reads a long integer value from a MessageSequence instance.**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Int64 | Returns a long integer value. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 1900010 | Failed to read data from the message sequence. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.IPCKit.*  

let data = MessageSequence.create()  
data.readLong()  
```  

### func readLongArray(ArrayList\<Int64>)  

```cangjie  
public func readLongArray(dataIn: ArrayList<Int64>): Unit  
```  

**Function:** Reads all long integer arrays from a MessageSequence instance.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| dataIn | ArrayList\<Int64> | Yes | - | The integer array to be written. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 401 | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. The number of parameters is incorrect;<br>3. The parameter type does not match. |  
  | 1900010 | Failed to read data from the message sequence. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.IPCKit.*  
import std.collection.ArrayList  

let data = MessageSequence.create()  
let list = ArrayList<Int64>()  
data.readLongArray(list)  
```  

### func readLongArray()  

```cangjie  
public func readLongArray(): Array<Int64>  
```  

**Function:** Reads all long integer arrays from a MessageSequence instance.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Array\<Int64> | Returns an integer array. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 1900010 | Failed to read data from the message sequence. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.IPCKit.*  

let data = MessageSequence.create()  
data.readLongArray()  
```  

### func readParcelable(Parcelable)  

```cangjie  
public func readParcelable(dataIn: Parcelable): Unit  
```  

**Function:** Reads member variables from a MessageSequence instance into the specified object (dataIn).  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| dataIn | [Parcelable](#interface-parcelable) | Yes | - | The object whose member variables need to be read from the MessageSequence. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 401 | Parameter error. Possible causes:<br>1. The number of parameters is incorrect. |  
  | 1900010 | Failed to read data from the message sequence. |  
  | 1900012 | Failed to call the JS callback function. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.IPCKit.*  

// The following code can be added to dependency definitions  
class MyParcelable <: Parcelable {  
    var num: Int32 = 0  
    var str: String = ''  

    init() {}  

    init(num: Int32, str: String) {  
        this.num = num  
        this.str = str  
    }  
    public func marshalling(messageSequence: MessageSequence): Bool {  
        messageSequence.writeInt(this.num)  
        messageSequence.writeString(this.str)  
        return true  
    }  
    public func unmarshalling(messageSequence: MessageSequence): Bool {  
        this.num = messageSequence.readInt()  
        this.str = messageSequence.readString()  
        return true  
    }  
}  

let parcelable = MyParcelable(1, "aaa")  
let data = MessageSequence.create()  
data.writeParcelable(parcelable)  
let ret = MyParcelable()  
data.readParcelable(ret)  
```  

### func readParcelableArray(Array\<Parcelable>)  

```cangjie  
public func readParcelableArray(parcelableArray: Array<Parcelable>): Unit  
```  

**Function:** Reads an array of serializable objects from a MessageSequence instance.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| parcelableArray | Array\<[Parcelable](#interface-parcelable)> | Yes | - | The array of serializable objects to be read. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 401 | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. The number of parameters is incorrect;<br>3. The parameter type does not match;<br>4. The length of the array passed when reading is not equal to the length passed when writing to the array;<br>5. The element does not exist in the array. |  
  | 1900010 | Failed to read data from the message sequence. |  
  | 1900012 | Failed to call the JS callback function. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.IPCKit.*  

// The following code can be added to dependency definitions  
class MyParcelable <: Parcelable {  
    var num: Int32 = 0  
    var str: String = ''  

    init() {}  

    init(num: Int32, str: String) {  
        this.num = num  
        this.str = str  
    }  
    public func marshalling(messageSequence: MessageSequence): Bool {  
        messageSequence.writeInt(this.num)  
        messageSequence.writeString(this.str)  
        return true  
    }  
    public func unmarshalling(messageSequence: MessageSequence): Bool {  
        this.num = messageSequence.readInt()  
        this.str = messageSequence.readString()  
        return true  
    }  
}  

let parcelable = MyParcelable(1, "aaa")  
let parcelable2 = MyParcelable(2, "bbb")  
let parcelable3 = MyParcelable(3, "ccc")  
let data = MessageSequence.create()  
data.writeParcelableArray(parcelable, parcelable2, parcelable3)  
let ret: Array<Parcelable> = [MyParcelable(0, ""), MyParcelable(0, ""), MyParcelable(0, "")]  
data.readParcelableArray(ret)  
```  

### func readRawDataBuffer(Int64)  

```cangjie  
public func readRawDataBuffer(size: Int64): Array<Byte>  
```  

**Function:** Reads raw data from a MessageSequence.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| size | Int64 | Yes | - | The size of the raw data to be read. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Array\<Byte> | Returns the raw data (in bytes). |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 401 | Parameter error. Possible causes: <br/> 1. The number of parameters is incorrect; <br/> 2. The parameter type does not match. |  
  | 1900010 | Failed to read data from the message sequence. |  

### func readShort()  

```cangjie  
public func readShort(): Int16  
```  

**Function:** Reads a short integer value from a MessageSequence instance.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Int16 | Returns a short integer value. |**Exceptions:**

- BusinessException: For detailed information about the error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 1900010 | Failed to read data from the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.readShort()
```

### func readShortArray(ArrayList\<Int16>)

```cangjie
public func readShortArray(dataIn: ArrayList<Int16>): Unit
```

**Description:** Reads an array of short integers from a MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| dataIn | ArrayList\<Int16> | Yes | - | The array of short integers to be read. |

**Exceptions:**

- BusinessException: For detailed information about the error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. The number of parameters is incorrect;<br>3. The parameter type does not match. |
  | 1900010 | Failed to read data from the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*
import std.collection.ArrayList

let data = MessageSequence.create()
let list = ArrayList<Int16>()
data.readShortArray(list)
```

### func readShortArray()

```cangjie
public func readShortArray(): Array<Int16>
```

**Description:** Reads an array of short integers from a MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<Int16> | Returns the array of short integers. |

**Exceptions:**

- BusinessException: For detailed information about the error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 1900010 | Failed to read data from the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.readShortArray()
```

### func readString()

```cangjie
public func readString(): String
```

**Description:** Reads a string value from a MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Returns the string value. |

**Exceptions:**

- BusinessException: For detailed information about the error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 1900010 | Failed to read data from the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.readString()
```

### func readStringArray(ArrayList\<String>)

```cangjie
public func readStringArray(dataIn: ArrayList<String>): Unit
```

**Description:** Reads an array of strings from a MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| dataIn | ArrayList\<String> | Yes | - | The array of strings to be read. |

**Exceptions:**

- BusinessException: For detailed information about the error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. The number of parameters is incorrect;<br>3. The parameter type does not match. |
  | 1900010 | Failed to read data from the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*
import std.collection.ArrayList

let data = MessageSequence.create()
let list = ArrayList<String>()
data.readStringArray(list)
```

### func readStringArray()

```cangjie
public func readStringArray(): Array<String>
```

**Description:** Reads an array of strings from a MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<String> | Returns the array of strings. |

**Exceptions:**

- BusinessException: For detailed information about the error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 1900010 | Failed to read data from the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.readStringArray()
```

### func readUInt16Array()

```cangjie
public func readUInt16Array(): Array<UInt16>
```

**Description:** Reads data of type Array\<UInt16> from a MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<UInt16> | The read data. |

**Exceptions:**

- BusinessException: For detailed information about the error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. The number of parameters is incorrect;<br>2. The parameter type does not match;<br>3. The obtained value of typeCode is incorrect. |
  | 1900010 | Failed to read data from the message sequence. |

### func readUInt32Array()

```cangjie
public func readUInt32Array(): Array<UInt32>
```

**Description:** Reads data of type Array\<UInt32> from a MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<UInt32> | The read data. |

**Exceptions:**

- BusinessException: For detailed information about the error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. The number of parameters is incorrect;<br>2. The parameter type does not match;<br>3. The obtained value of typeCode is incorrect. |
  | 1900010 | Failed to read data from the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.readUInt32Array()
```

### func readUInt64Array()

```cangjie
public func readUInt64Array(): Array<UInt64>
```

**Description:** Reads data of type Array\<UInt64> from a MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21**Return Value:**

| Type | Description |
|:----|:----|
| Array\<UInt64> | The data read. |

**Exceptions:**

- BusinessException: For detailed information about the corresponding error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. Incorrect number of parameters;<br>2. Parameter type mismatch;<br>3. Incorrect obtained value of typeCode. |
  | 1900010 | Failed to read data from the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.readUInt64Array()
```

### func readUInt8Array()

```cangjie
public func readUInt8Array(): Array<UInt8>
```

**Function:** Reads Array\<UInt8> type data from a MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<UInt8> | The data read. |

**Exceptions:**

- BusinessException: For detailed information about the corresponding error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. Incorrect number of parameters;<br>2. Parameter type mismatch;<br>3. Incorrect obtained value of typeCode. |
  | 1900010 | Failed to read data from the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.readUInt8Array()
```

### func reclaim()

```cangjie
public func reclaim(): Unit
```

**Function:** Releases a MessageSequence object that is no longer in use.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.reclaim()
```

### func rewindRead(UInt32)

```cangjie
public func rewindRead(pos: UInt32): Unit
```

**Function:** Resets the read position to the specified offset.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| pos | UInt32 | Yes | - | The target position to start reading data. |

**Exceptions:**

- BusinessException: For detailed information about the corresponding error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. Incorrect number of parameters;<br>2. Parameter type mismatch. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.rewindRead(0)
```

### func rewindWrite(UInt32)

```cangjie
public func rewindWrite(pos: UInt32): Unit
```

**Function:** Resets the write position to the specified offset.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| pos | UInt32 | Yes | - | The target position to start writing data. |

**Exceptions:**

- BusinessException: For detailed information about the corresponding error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. Incorrect number of parameters;<br>2. Parameter type mismatch. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.rewindWrite(0)
```

### func setCapacity(UInt32)

```cangjie
public func setCapacity(size: UInt32): Unit
```

**Function:** Sets the storage capacity of a MessageSequence object.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| size | UInt32 | Yes | - | The storage capacity of the MessageSequence instance, in bytes. |

**Exceptions:**

- BusinessException: For detailed information about the corresponding error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. Incorrect number of parameters;<br>2. Parameter type mismatch. |
  | 1900011 | Memory allocation failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.setCapacity(100)
```

### func setSize(UInt32)

```cangjie
public func setSize(size: UInt32): Unit
```

**Function:** Sets the data size contained in a MessageSequence object.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| size | UInt32 | Yes | - | The data size of the MessageSequence instance, in bytes. |

**Exceptions:**

- BusinessException: For detailed information about the corresponding error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. Incorrect number of parameters;<br>2. Parameter type mismatch. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.setSize(16)
```

### func writeAshmem(Ashmem)

```cangjie
public func writeAshmem(ashmem: Ashmem): Unit
```

**Function:** Writes the specified anonymous shared object into this MessageSequence.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| ashmem | [Ashmem](#class-ashmem) | Yes | - | The anonymous shared object to be written into the MessageSequence. |

**Exceptions:**

- BusinessException: For detailed information about the corresponding error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. Incorrect number of parameters;<br>2. The parameter is not an instance of the Ashmem object. |
  | 1900003 | Failed to write data to the shared memory. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
let ashmem = Ashmem.create("ashmem", 1024)
data.writeAshmem(ashmem)
```

### func writeBoolean(Bool)

```cangjie
public func writeBoolean(val: Bool): Unit
```

**Function:** Writes a boolean value into a MessageSequence instance.**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| val | Bool | Yes | - | The boolean value to be written. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 401 | Parameter error. Possible causes:<br>1. Incorrect number of parameters;<br>2. Parameter type mismatch. |  
  | 1900009 | Failed to write data to the message sequence. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.IPCKit.*  

let data = MessageSequence.create()  
data.writeBoolean(false)  
```  

### func writeBooleanArray(Array\<Bool>)  

```cangjie  
public func writeBooleanArray(booleanArray: Array<Bool>): Unit  
```  

**Function:** Writes a boolean array to the MessageSequence instance.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| booleanArray | Array\<Bool> | Yes | - | The boolean array to be written. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 401 | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. Incorrect number of parameters;<br>3. Parameter type mismatch;<br>4. The element does not exist in the array;<br>5. Incorrect type of the element in the array. |  
  | 1900009 | Failed to write data to the message sequence. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.IPCKit.*  

let data = MessageSequence.create()  
data.writeBooleanArray([false, true, false])  
```  

### func writeByte(Int8)  

```cangjie  
public func writeByte(val: Int8): Unit  
```  

**Function:** Writes a byte value to the MessageSequence instance.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| val | Int8 | Yes | - | The byte value to be written. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 401 | Parameter error. Possible causes:<br>1. Incorrect number of parameters;<br>2. Parameter type mismatch. |  
  | 1900009 | Failed to write data to the message sequence. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.IPCKit.*  

let data = MessageSequence.create()  
data.writeByte(2)  
```  

### func writeByteArray(Array\<Int8>)  

```cangjie  
public func writeByteArray(byteArray: Array<Int8>): Unit  
```  

**Function:** Writes a byte array to the MessageSequence instance.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| byteArray | Array\<Int8> | Yes | - | The byte array to be written. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 401 | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. Incorrect number of parameters;<br>3. Parameter type mismatch;<br>4. The element does not exist in the array;<br>5. Incorrect type of the element in the array. |  
  | 1900009 | Failed to write data to the message sequence. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.IPCKit.*  

let data = MessageSequence.create()  
data.writeByteArray([1])  
```  

### func writeChar(UInt8)  

```cangjie  
public func writeChar(val: UInt8): Unit  
```  

**Function:** Writes a single character value to the MessageSequence instance.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| val | UInt8 | Yes | - | The single character value to be written. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 401 | Parameter error. Possible causes:<br>1. Incorrect number of parameters;<br>2. Parameter type mismatch. |  
  | 1900009 | Failed to write data to the message sequence. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.IPCKit.*  

let data = MessageSequence.create()  
data.writeChar(97)  
```  

### func writeCharArray(Array\<UInt8>)  

```cangjie  
public func writeCharArray(charArray: Array<UInt8>): Unit  
```  

**Function:** Writes a single character array to the MessageSequence instance.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| charArray | Array\<UInt8> | Yes | - | The single character array to be written. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 401 | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. Incorrect number of parameters;<br>3. Parameter type mismatch;<br>4. The element does not exist in the array;<br>5. Incorrect type of the element in the array. |  
  | 1900009 | Failed to write data to the message sequence. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.IPCKit.*  

let data = MessageSequence.create()  
data.writeCharArray([97, 98, 88])  
```  

### func writeDouble(Float64)  

```cangjie  
public func writeDouble(val: Float64): Unit  
```  

**Function:** Writes a double-precision floating-point value to the MessageSequence instance.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| val | Float64 | Yes | - | The double-precision floating-point value to be written. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 401 | Parameter error. Possible causes:<br>1. Incorrect number of parameters;<br>2. Parameter type mismatch. |  
  | 1900009 | Failed to write data to the message sequence. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.IPCKit.*  

let data = MessageSequence.create()  
data.writeDouble(10.2)  
```  

### func writeDoubleArray(Array\<Float64>)  

```cangjie  
public func writeDoubleArray(doubleArray: Array<Float64>): Unit  
```  

**Function:** Writes a double-precision floating-point array to the MessageSequence instance.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| doubleArray | Array\<Float64> | Yes | - | The double-precision floating-point array to be written. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 401 | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. Incorrect number of parameters;<br>3. Parameter type mismatch;<br>4. The element does not exist in the array;<br>5. Incorrect type of the element in the array. |  
  | 1900009 | Failed to write data to the message sequence. |  

**Example:**<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.writeDoubleArray([1.1])
```

### func writeFileDescriptor(Int32)

```cangjie
public func writeFileDescriptor(fd: Int32): Unit
```

**Function:** Writes a file descriptor to the MessageSequence.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| fd | Int32 | Yes | - | File descriptor. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. Incorrect number of parameters;<br>2. Parameter type mismatch. |
  | 1900009 | Failed to write data to the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*
import kit.CoreFileKit.*

let data = MessageSequence.create()
let filePath = "path/to/file"
let file = FileFs.open(filePath, mode: (OpenMode.CREATE.mode | OpenMode.READ_WRITE.mode))
data.writeFileDescriptor(file.fd)
```

### func writeFloat(Float32)

```cangjie
public func writeFloat(val: Float32): Unit
```

**Function:** Writes a floating-point value to the MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| val | Float32 | Yes | - | The floating-point value to write. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. Incorrect number of parameters;<br>2. Parameter type mismatch. |
  | 1900009 | Failed to write data to the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.writeFloat(1.2)
```

### func writeFloat32Array(Array\<Float32>)

```cangjie
public func writeFloat32Array(buf: Array<Float32>): Unit
```

**Function:** Writes Array\<Float32> type data to the MessageSequence object.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| buf | Array\<Float32> | Yes | - | The data to write. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. Incorrect number of parameters;<br>3. Parameter type mismatch;<br>4. Incorrect typeCode value obtained;<br>5. Failed to obtain arrayBuffer information. |
  | 1900009 | Failed to write data to the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.writeFloat32Array([1.1])
```

### func writeFloat64Array(Array\<Float64>)

```cangjie
public func writeFloat64Array(buf: Array<Float64>): Unit
```

**Function:** Writes Array\<Float64> type data to the MessageSequence object.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| buf | Array\<Float64> | Yes | - | The data to write. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. Incorrect number of parameters;<br>3. Parameter type mismatch;<br>4. Incorrect typeCode value obtained;<br>5. Failed to obtain arrayBuffer information. |
  | 1900009 | Failed to write data to the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.writeFloat64Array([1.1])
```

### func writeFloatArray(Array\<Float32>)

```cangjie
public func writeFloatArray(floatArray: Array<Float32>): Unit
```

**Function:** Writes a floating-point array to the MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| floatArray | Array\<Float32> | Yes | - | The floating-point array to write. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. Incorrect number of parameters;<br>3. Parameter type mismatch;<br>4. The element does not exist in the array;<br>5. Incorrect type of the element in the array. |
  | 1900009 | Failed to write data to the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.writeFloatArray([1.1])
```

### func writeInt(Int32)

```cangjie
public func writeInt(val: Int32): Unit
```

**Function:** Writes an integer value to the MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| val | Int32 | Yes | - | The integer value to write. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. Incorrect number of parameters;<br>2. Parameter type mismatch. |
  | 1900009 | Failed to write data to the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.writeInt(10)
```

### func writeInt16Array(Array\<Int16>)

```cangjie
public func writeInt16Array(buf: Array<Int16>): Unit
```

**Function:** Writes Array\<Int16> type data to the MessageSequence object.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| buf | Array\<Int16> | Yes | - | The data to write. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. Incorrect number of parameters;<br>3. Parameter type mismatch;<br>4. Incorrect typeCode value obtained;<br>5. Failed to obtain arrayBuffer information. |
  | 1900009 | Failed to write data to the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.writeInt16Array([1])
```

### func writeInt32Array(Array\<Int32>)

```cangjie
public func writeInt32Array(buf: Array<Int32>): Unit
```
**Function:** Writes Array\<Int32> type data to a MessageSequence object.

**System Capability:** SystemCapability.Communication.IPC.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type          | Required | Default Value | Description               |
|:--------------|:--------------|:---------|:--------------|:--------------------------|
| buf           | Array\<Int32> | Yes      | -             | The data to be written.   |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message                                                                 |
  |:--------------|:------------------------------------------------------------------------------|
  | 401           | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. The number of parameters is incorrect;<br>3. The parameter type does not match;<br>4. The obtained value of typeCode is incorrect;<br>5. Failed to obtain arrayBuffer information. |
  | 1900009       | Failed to write data to the message sequence.                                 |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.writeInt32Array([1])
```

### func writeInt64Array(Array\<Int64>)

```cangjie
public func writeInt64Array(buf: Array<Int64>): Unit
```

**Function:** Writes Array\<Int64> type data to a MessageSequence object.

**System Capability:** SystemCapability.Communication.IPC.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type          | Required | Default Value | Description               |
|:--------------|:--------------|:---------|:--------------|:--------------------------|
| buf           | Array\<Int64> | Yes      | -             | The data to be written.   |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message                                                                 |
  |:--------------|:------------------------------------------------------------------------------|
  | 401           | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. The number of parameters is incorrect;<br>3. The parameter type does not match;<br>4. The obtained value of typeCode is incorrect;<br>5. Failed to obtain arrayBuffer information. |
  | 1900009       | Failed to write data to the message sequence.                                 |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.writeInt64Array([1])
```

### func writeInt8Array(Array\<Int8>)

```cangjie
public func writeInt8Array(buf: Array<Int8>): Unit
```

**Function:** Writes Array\<Int8> type data to a MessageSequence object.

**System Capability:** SystemCapability.Communication.IPC.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type         | Required | Default Value | Description               |
|:--------------|:-------------|:---------|:--------------|:--------------------------|
| buf           | Array\<Int8> | Yes      | -             | The data to be written.   |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message                                                                 |
  |:--------------|:------------------------------------------------------------------------------|
  | 401           | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. The number of parameters is incorrect;<br>3. The parameter type does not match;<br>4. The obtained value of typeCode is incorrect;<br>5. Failed to obtain arrayBuffer information. |
  | 1900009       | Failed to write data to the message sequence.                                 |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.writeInt8Array([1])
```

### func writeIntArray(Array\<Int32>)

```cangjie
public func writeIntArray(intArray: Array<Int32>): Unit
```

**Function:** Writes an integer array to a MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type          | Required | Default Value | Description               |
|:--------------|:--------------|:---------|:--------------|:--------------------------|
| intArray      | Array\<Int32> | Yes      | -             | The integer array to be written. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message                                                                 |
  |:--------------|:------------------------------------------------------------------------------|
  | 401           | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. The number of parameters is incorrect;<br>3. The parameter type does not match;<br>4. The element does not exist in the array;<br>5. The type of the element in the array is incorrect. |
  | 1900009       | Failed to write data to the message sequence.                                 |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.writeIntArray([1])
```

### func writeInterfaceToken(String)

```cangjie
public func writeInterfaceToken(token: String): Unit
```

**Function:** Writes an interface descriptor to a MessageSequence object. The remote object can use this information to validate the current communication.

**System Capability:** SystemCapability.Communication.IPC.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type    | Required | Default Value | Description               |
|:--------------|:--------|:---------|:--------------|:--------------------------|
| token         | String  | Yes      | -             | The string-type descriptor. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message                                                                 |
  |:--------------|:------------------------------------------------------------------------------|
  | 401           | Parameter error. Possible causes:<br>1. The number of parameters is incorrect;<br>2. The parameter type does not match;<br>3. The string length exceeds 40960 bytes;<br>4. The number of bytes copied to the buffer is different from the length of the obtained string. |
  | 1900009       | Failed to write data to the message sequence.                                 |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.writeInterfaceToken("aaa")
```

### func writeLong(Int64)

```cangjie
public func writeLong(val: Int64): Unit
```

**Function:** Writes a long integer value to a MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type  | Required | Default Value | Description               |
|:--------------|:------|:---------|:--------------|:--------------------------|
| val           | Int64 | Yes      | -             | The long integer value to be written. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message                                                                 |
  |:--------------|:------------------------------------------------------------------------------|
  | 401           | Parameter error. Possible causes:<br>1. The number of parameters is incorrect;<br>2. The parameter type does not match. |
  | 1900009       | Failed to write data to the message sequence.                                 |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.writeLong(10000)
```

### func writeLongArray(Array\<Int64>)

```cangjie
public func writeLongArray(longArray: Array<Int64>): Unit
```

**Function:** Writes a long integer array to a MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type          | Required | Default Value | Description               |
|:--------------|:--------------|:---------|:--------------|:--------------------------|
| longArray     | Array\<Int64> | Yes      | -             | The long integer array to be written. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message                                                                 |
  |:--------------|:------------------------------------------------------------------------------|
  | 401           | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. The number of parameters is incorrect;<br>3. The parameter type does not match;<br>4. The element does not exist in the array;<br>5. The type of the element in the array is incorrect. |
  | 1900009       | Failed to write data to the message sequence.                                 |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.writeLongArray([1])
```

### func writeNoException()

```cangjie
public func writeNoException(): Unit
```

**Function:** Writes information indicating "no exception occurred" to the MessageSequence.

**System Capability:** SystemCapability.Communication.IPC.Core

**Initial Version:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).

  | Error Code ID | Error Message                          |
  |:--------------|:---------------------------------------|
  | 1900009       | Failed to write data to the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.writeNoException()

```

### func writeParcelable(Parcelable)

```cangjie
public func writeParcelable(val: Parcelable): Unit
```

**Function:** Writes a custom serializable object to the MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| val | [Parcelable](#interface-parcelable) | Yes | - | The serializable object to be written. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. The parameter type does not match. |
  | 1900009 | Failed to write data to the message sequence. |

### func writeParcelableArray(Array\<Parcelable>)

```cangjie
public func writeParcelableArray(parcelableArray: Array<Parcelable>): Unit
```

**Function:** Writes an array of serializable objects to the MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| parcelableArray | Array\<[Parcelable](#interface-parcelable)> | Yes | - | The array of serializable objects to be written. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. The number of parameters is incorrect;<br>3. The parameter type does not match;<br>4. The element does not exist in the array. |
  | 1900009 | Failed to write data to the message sequence. |

### func writeRawDataBuffer(Array\<Byte>, Int64)

```cangjie
public func writeRawDataBuffer(rawData: Array<Byte>, size: Int64): Unit
```

**Function:** Writes raw data to the MessageSequence object.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| rawData | Array\<Byte> | Yes | - | The raw data to be written. |
| size | Int64 | Yes | - | The size of the raw data to be sent, in bytes. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes: <br/> 1. The number of parameters is incorrect; <br/> 2. The parameter type does not match; <br/> 3. Failed to obtain arrayBuffer information; <br/> 4. The transferred size cannot be obtained; <br/> 5. The transferred size is less than or equal to 0; <br/> 6. The transferred size is greater than the byte length of ArrayBuffer. |
  | 1900009 | Failed to write data to the message sequence. |

### func writeShort(Int16)

```cangjie
public func writeShort(val: Int16): Unit
```

**Function:** Writes a short integer value to the MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| val | Int16 | Yes | - | The short integer value to be written. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. The number of parameters is incorrect;<br>2. The parameter type does not match. |
  | 1900009 | Failed to write data to the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.writeShort(8)
```

### func writeShortArray(Array\<Int16>)

```cangjie
public func writeShortArray(shortArray: Array<Int16>): Unit
```

**Function:** Writes an array of short integers to the MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| shortArray | Array\<Int16> | Yes | - | The array of short integers to be written. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. The number of parameters is incorrect;<br>3. The parameter type does not match;<br>4. The element does not exist in the array;<br>5. The type of the element in the array is incorrect. |
  | 1900009 | Failed to write data to the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.writeShortArray([1])
```

### func writeString(String)

```cangjie
public func writeString(val: String): Unit
```

**Function:** Writes a string value to the MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| val | String | Yes | - | The string value to be written, with a length less than 40960 bytes. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. The number of parameters is incorrect;<br>2. The parameter type does not match. |
  | 1900009 | Failed to write data to the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.writeString('abc')
```

### func writeStringArray(Array\<String>)

```cangjie
public func writeStringArray(stringArray: Array<String>): Unit
```

**Function:** Writes an array of strings to the MessageSequence instance.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| stringArray | Array\<String> | Yes | - | The array of strings to be written, with each element's length less than 40960 bytes. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. The number of parameters is incorrect;<br>3. The parameter type does not match;<br>4. The element does not exist in the array;<br>5. The type of the element in the array is incorrect. |
  | 1900009 | Failed to write data to the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.writeStringArray(["abc", "def"])
```

### func writeUInt16Array(Array\<UInt16>)

```cangjie
public func writeUInt16Array(buf: Array<UInt16>): Unit
```

**Function:** Writes data of type Array\<UInt16> to the MessageSequence object.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| buf | Array\<UInt16> | Yes | - | The data to be written. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. The number of parameters is incorrect;<br>3. The parameter type does not match;<br>4. The obtained value of typeCode is incorrect;<br>5. Failed to obtain arrayBuffer information. |
  | 1900009 | Failed to write data to the message sequence. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

let data = MessageSequence.create()
data.writeUInt16Array([1])
```

### func writeUInt32Array(Array\<UInt32>)

```cangjie
public func writeUInt32Array(buf: Array<UInt32>): Unit
```

**Function:** Writes data of type Array\<UInt32> to the MessageSequence object.

**System Capability:** SystemCapability.Communication.IPC.Core
**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| buf | Array\<UInt32> | Yes | - | The data to be written. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 401 | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. The number of parameters is incorrect;<br>3. The parameter type does not match;<br>4. The obtained value of typeCode is incorrect;<br>5. Failed to obtain arrayBuffer information. |  
  | 1900009 | Failed to write data to the message sequence. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.IPCKit.*  

let data = MessageSequence.create()  
data.writeUInt32Array([1])  
```  

### func writeUInt64Array(Array\<UInt64>)  

```cangjie  
public func writeUInt64Array(buf: Array<UInt64>): Unit  
```  

**Function:** Writes Array\<UInt64> type data into the MessageSequence object.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| buf | Array\<UInt64> | Yes | - | The data to be written. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 401 | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. The number of parameters is incorrect;<br>3. The parameter type does not match;<br>4. The obtained value of typeCode is incorrect;<br>5. Failed to obtain arrayBuffer information. |  
  | 1900009 | Failed to write data to the message sequence. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.IPCKit.*  

let data = MessageSequence.create()  
data.writeUInt64Array([1])  
```  

### func writeUInt8Array(Array\<UInt8>)  

```cangjie  
public func writeUInt8Array(buf: Array<UInt8>): Unit  
```  

**Function:** Writes Array\<UInt8> type data into the MessageSequence object.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| buf | Array\<UInt8> | Yes | - | The data to be written. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 401 | Parameter error. Possible causes:<br>1. The parameter is an empty array;<br>2. The number of parameters is incorrect;<br>3. The parameter type does not match;<br>4. The obtained value of typeCode is incorrect;<br>5. Failed to obtain arrayBuffer information. |  
  | 1900009 | Failed to write data to the message sequence. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.IPCKit.*  

let data = MessageSequence.create()  
data.writeUInt8Array([1])  
```  

## class RemoteObject  

```cangjie  
public open class RemoteObject <: IRemoteObject {  
    public init(descriptor: String)  
}  
```  

**Function:** Implements a remote object. Service providers must inherit this class.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Parent Type:**  

- [IRemoteObject](#interface-iremoteobject)  

### init(String)  

```cangjie  
public init(descriptor: String)  
```  

**Function:** Constructor for RemoteObject.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| descriptor | String | Yes | - | Interface descriptor. |  

### func getCallingPid()  

```cangjie  
public func getCallingPid(): Int32  
```  

**Function:** Gets the process Pid of the communication peer.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Int32 | Returns the process Pid of the communication peer. |  

### func getCallingUid()  

```cangjie  
public func getCallingUid(): Int32  
```  

**Function:** Gets the process Uid of the communication peer.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Int32 | Returns the process Uid of the communication peer. |  

### func getDescriptor()  

```cangjie  
public func getDescriptor(): String  
```  

**Function:** Gets the interface descriptor of the object. The interface descriptor is a string.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| String | Returns the interface descriptor. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 1900008 | The proxy or remote object is invalid. |  

### func getLocalInterface(String)  

```cangjie  
public func getLocalInterface(descriptor: String): IRemoteBroker  
```  

**Function:** Queries the string of the interface descriptor.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| descriptor | String | Yes | - | The string of the interface descriptor. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [IRemoteBroker](#interface-iremotebroker) | Returns the IRemoteBroker object bound to the specified interface descriptor. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 401 | Parameter error. Possible causes: <br/> 1. The number of parameters is incorrect; <br/> 2. The parameter type does not match; <br/> 3. The string length exceeds 40960 bytes; <br/> 4. The number of bytes copied to the buffer is different from the length of the obtained string. |  

### func isObjectDead()  

```cangjie  
public func isObjectDead(): Bool  
```  

**Function:** Checks whether the current object is dead.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | true: The object is dead; false: The object is alive. |  

### func modifyLocalInterface(IRemoteBroker, String)  

```cangjie  
public func modifyLocalInterface(localInterface: IRemoteBroker, descriptor: String): Unit  
```  

**Function:** Binds the interface descriptor with the IRemoteBroker object.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| localInterface | [IRemoteBroker](#interface-iremotebroker) | Yes | - | The IRemoteBroker object to be bound with the descriptor. |  
| descriptor | String | Yes | - | The descriptor to be bound with the IRemoteBroker object. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 401 | Parameter error. Possible causes: <br/> 1. The number of parameters is incorrect; <br/> 2. The parameter type does not match; <br/> 3. The string length exceeds 40960 bytes; <br/> 4. The number of bytes copied to the buffer is different from the length of the obtained string. |  

### func registerDeathRecipient(DeathRecipient, Int32)  

```cangjie  
public func registerDeathRecipient(recipient: DeathRecipient, flags: Int32): Unit  
```  

**Function:** Registers a callback to receive notifications of remote object death.  

**System Capability:** SystemCapability.Communication.IPC.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description ||:---|:---|:---|:---|:---|
|recipient|[DeathRecipient](#class-deathrecipient)|Yes|-|Callback to register.|
|flags|Int32|Yes|-|Death notification flag.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|Parameter error. Possible causes: <br/> 1.Incorrect number of parameters; <br/> 2.Parameter type mismatch; <br/> 3.Callback for receiving remote object death notifications is empty.|
  |1900008|The proxy or remote object is invalid.|

### func sendMessageRequest(UInt32, MessageSequence, MessageSequence, MessageOption, Callback1Argument\<RequestResult>)

```cangjie
public func sendMessageRequest(code: UInt32, data: MessageSequence, reply: MessageSequence, options: MessageOption,
    callback: Callback1Argument<RequestResult>): Unit
```

**Description:** Sends a MessageSequence message to the peer process synchronously or asynchronously. If asynchronous mode is set in the options, the callback is received immediately with no content in the reply packet, and the specific response needs to be obtained in the business-side callback. If synchronous mode is set in the options, the callback will be received when sendMessageRequest returns, with the response content in the reply packet.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|code|UInt32|Yes|-|Message code for this request call (1-16777215), determined by both communication parties. If the interface is generated by the IDL tool, the message code is automatically generated by IDL.|
|data|[MessageSequence](#class-messagesequence)|Yes|-|MessageSequence object containing the data to be sent.|
|reply|[MessageSequence](#class-messagesequence)|Yes|-|MessageSequence object for receiving response data.|
|options|[MessageOption](#class-messageoption)|Yes|-|Synchronous/asynchronous mode for this request, default is synchronous call.|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[RequestResult](#struct-requestresult)>|Yes|-|Callback for receiving the sending result.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|Parameter error. Possible causes: <br/> 1.Incorrect number of parameters; <br/> 2.Parameter type mismatch; <br/> 3.Failed to obtain the passed object instance.|

### func unregisterDeathRecipient(DeathRecipient, Int32)

```cangjie
public func unregisterDeathRecipient(recipient: DeathRecipient, flags: Int32): Unit
```

**Description:** Unregisters the callback for receiving remote object death notifications.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|recipient|[DeathRecipient](#class-deathrecipient)|Yes|-|Callback to unregister.|
|flags|Int32|Yes|-|Death notification flag.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|Parameter error. Possible causes: <br/> 1.Incorrect number of parameters; <br/> 2.Parameter type mismatch; <br/> 3.Callback for receiving remote object death notifications is empty.|
  |1900008|The proxy or remote object is invalid.|

## class RemoteProxy

```cangjie
public class RemoteProxy <: IRemoteObject {
    public static const PING_TRANSACTION: Int32 = 0x5f504e47
    public static const DUMP_TRANSACTION: Int32 = 0x5f444d50
    public static const INTERFACE_TRANSACTION: Int32 = 0x5f4e5446
    public static const MIN_TRANSACTION_ID: Int32 = 0x00000001
    public static const MAX_TRANSACTION_ID: Int32 = 0x00FFFFFF
}
```

**Description:** Implements the IRemoteObject proxy object.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parent Type:**

- [IRemoteObject](#interface-iremoteobject)

### static const DUMP_TRANSACTION

```cangjie
public static const DUMP_TRANSACTION: Int32 = 0x5f444d50
```

**Description:** Internal command code for obtaining the internal state of the Binder.

**Type:** Int32

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### static const INTERFACE_TRANSACTION

```cangjie
public static const INTERFACE_TRANSACTION: Int32 = 0x5f4e5446
```

**Description:** Internal command code for obtaining the peer interface descriptor.

**Type:** Int32

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### static const MAX_TRANSACTION_ID

```cangjie
public static const MAX_TRANSACTION_ID: Int32 = 0x00FFFFFF
```

**Description:** Maximum valid command code.

**Type:** Int32

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### static const MIN_TRANSACTION_ID

```cangjie
public static const MIN_TRANSACTION_ID: Int32 = 0x00000001
```

**Description:** Minimum valid command code.

**Type:** Int32

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### static const PING_TRANSACTION

```cangjie
public static const PING_TRANSACTION: Int32 = 0x5f504e47
```

**Description:** Internal command code for testing IPC service availability.

**Type:** Int32

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### func getDescriptor()

```cangjie
public func getDescriptor(): String
```

**Description:** Gets the interface descriptor of the object, which is a string.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Returns the interface descriptor.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |1900007|Communication failed.|
  |1900008|The proxy or remote object is invalid.|

### func getLocalInterface(String)

```cangjie
public func getLocalInterface(descriptor: String): IRemoteBroker
```

**Description:** Queries and obtains the local interface object corresponding to the current interface descriptor.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|descriptor|String|Yes|-|Interface descriptor to query.|

**Return Value:**

|Type|Description|
|:----|:----|
|[IRemoteBroker](#interface-iremotebroker)|By default, returns Null, indicating that this is a proxy-side interface.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|Check param failed.|
  |1900006|Operation allowed only for the remote object.|

### func isObjectDead()

```cangjie
public func isObjectDead(): Bool
```

**Description:** Indicates whether the corresponding RemoteObject is dead.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|true: The corresponding object is dead; false: The corresponding object is alive.|

### func registerDeathRecipient(DeathRecipient, Int32)

```cangjie
public func registerDeathRecipient(recipient: DeathRecipient, flags: Int32): Unit
```

**Description:** Registers a callback for receiving remote object death notifications. This method is called if the remote object process matching the RemoteProxy object dies.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|recipient|[DeathRecipient](#class-deathrecipient)|Yes|-|Callback to register.|
|flags|Int32|Yes|-|Death notification flag.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|Parameter error. Possible causes: <br/> 1.Incorrect number of parameters; <br/> 2.Parameter type mismatch; <br/> 3.Callback for receiving remote object death notifications is empty.|
  |1900008|The proxy or remote object is invalid.|

### func sendMessageRequest(UInt32, MessageSequence, MessageSequence, MessageOption, Callback1Argument\<RequestResult>)

```cangjie
public func sendMessageRequest(code: UInt32, data: MessageSequence, reply: MessageSequence, options: MessageOption,
    callback: Callback1Argument<RequestResult>): Unit
```

**Description:** Sends a MessageSequence message to the peer process synchronously or asynchronously. If asynchronous mode is set in the options, the callback is received immediately with no content in the reply packet, and the specific response needs to be obtained in the business-side callback. If synchronous mode is set in the options, the callback will be executed at some point after sendMessageRequest returns, with the response content in the RequestResult's reply packet.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|code|UInt32|Yes|-|Message code for this request call (1-16777215), determined by both communication parties. If the interface is generated by the IDL tool, the message code is automatically generated by IDL.|
|data|[MessageSequence](#class-messagesequence)|Yes|-|MessageSequence object containing the data to be sent.|
|reply|[MessageSequence](#class-messagesequence)|Yes|-|MessageSequence object for receiving response data.|
|options|[MessageOption](#class-messageoption)|Yes|-|Synchronous/asynchronous mode for this request, default is synchronous call.|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[RequestResult](#struct-requestresult)>|Yes|-|Callback for receiving the sending result.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|Parameter error. Possible causes: <br/> 1.Incorrect number of parameters; <br/> 2.Parameter type mismatch; <br/> 3.Failed to obtain the passed object instance.|### func unregisterDeathRecipient(DeathRecipient, Int32)

```cangjie
public func unregisterDeathRecipient(recipient: DeathRecipient, flags: Int32): Unit
```

**Function:** Unregisters the callback for receiving remote object death notifications.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| recipient | [DeathRecipient](#class-deathrecipient) | Yes | - | The callback to be unregistered. |
| flags | Int32 | Yes | - | Death notification flags. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [RPC Error Codes](../../errorcodes/cj-errorcode-rpc.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes: <br/> 1. Incorrect number of parameters; <br/> 2. Parameter type mismatch; <br/> 3. The callback for receiving remote object death notifications is empty. |
  | 1900008 | The proxy or remote object is invalid. |

## struct RequestResult

```cangjie
public struct RequestResult {
    public RequestResult(
        public let errCode: Int32,
        public let code: UInt32,
        public let data: MessageSequence,
        public let reply: MessageSequence
    )
}
```

**Function:** Response result of a sent request.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### let code

```cangjie
public let code: UInt32
```

**Function:** Message code.

**Type:** UInt32

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### let data

```cangjie
public let data: MessageSequence
```

**Function:** MessageSequence object sent to the peer process.

**Type:** [MessageSequence](#class-messagesequence)

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### let errCode

```cangjie
public let errCode: Int32
```

**Function:** Error code.

**Type:** Int32

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### let reply

```cangjie
public let reply: MessageSequence
```

**Function:** MessageSequence object returned by the peer process.

**Type:** [MessageSequence](#class-messagesequence)

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### RequestResult(Int32, UInt32, MessageSequence, MessageSequence)

```cangjie
public RequestResult(
    public let errCode: Int32,
    public let code: UInt32,
    public let data: MessageSequence,
    public let reply: MessageSequence
)
```

**Function:** Constructs a response result object for a sent request.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| errCode | Int32 | Yes | - | Error code. |
| code | UInt32 | Yes | - | Message code. |
| data | [MessageSequence](#class-messagesequence) | Yes | - | MessageSequence object sent to the peer process. |
| reply | [MessageSequence](#class-messagesequence) | Yes | - | MessageSequence object returned by the peer process. |

## enum TypeCode

```cangjie
public enum TypeCode <: Equatable<TypeCode> & ToString {
    | INT8_ARRAY
    | UINT8_ARRAY
    | INT16_ARRAY
    | UINT16_ARRAY
    | INT32_ARRAY
    | UINT32_ARRAY
    | FLOAT32_ARRAY
    | FLOAT64_ARRAY
    | BIGINT64_ARRAY
    | BIGUINT64_ARRAY
    | ...
}
```

**Function:** Distinguishes the business type for data read/write operations via specific type values when transferring data.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parent Types:**

- Equatable\<TypeCode>
- ToString

### BIGINT64_ARRAY

```cangjie
BIGINT64_ARRAY
```

**Function:** TypedArray type is BIGINT64_ARRAY.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### BIGUINT64_ARRAY

```cangjie
BIGUINT64_ARRAY
```

**Function:** TypedArray type is BIGUINT64_ARRAY.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### FLOAT32_ARRAY

```cangjie
FLOAT32_ARRAY
```

**Function:** TypedArray type is FLOAT32_ARRAY.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### FLOAT64_ARRAY

```cangjie
FLOAT64_ARRAY
```

**Function:** TypedArray type is FLOAT64_ARRAY.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### INT16_ARRAY

```cangjie
INT16_ARRAY
```

**Function:** TypedArray type is INT16_ARRAY.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### INT32_ARRAY

```cangjie
INT32_ARRAY
```

**Function:** TypedArray type is INT32_ARRAY.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### INT8_ARRAY

```cangjie
INT8_ARRAY
```

**Function:** TypedArray type is INT8_ARRAY.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### UINT16_ARRAY

```cangjie
UINT16_ARRAY
```

**Function:** TypedArray type is UINT16_ARRAY.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### UINT32_ARRAY

```cangjie
UINT32_ARRAY
```

**Function:** TypedArray type is UINT32_ARRAY.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### UINT8_ARRAY

```cangjie
UINT8_ARRAY
```

**Function:** TypedArray type is UINT8_ARRAY.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

### func !=(TypeCode)

```cangjie
public operator func !=(other: TypeCode): Bool
```

**Function:** Compares whether two enum values are not equal.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [TypeCode](#enum-typecode) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Whether the two enumeration values are not equal. |

### func ==(TypeCode)

```cangjie
public operator func ==(other: TypeCode): Bool
```

**Function:** Compares whether two enumeration values are equal.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [TypeCode](#enum-typecode) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Whether the two enumeration values are equal. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** String representation of the enumeration value.

**System Capability:** SystemCapability.Communication.IPC.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | String representation of the enumeration value. |