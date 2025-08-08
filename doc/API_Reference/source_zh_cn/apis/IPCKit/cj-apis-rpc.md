# ohos.rpc（RPC通信）

本模块提供进程间通信能力，包括设备内的进程间通信（IPC）和设备间的进程间通信（RPC），前者基于Binder驱动，后者基于软总线驱动。

## 导入模块

```cangjie
import kit.IPCKit.*
```

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](../AbilityKit/cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## interface IRemoteBroker

```cangjie
public interface IRemoteBroker {
    func asObject(): IRemoteObject
}
```

**功能：** 远端对象的代理持有者。用于获取代理对象。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### func asObject()

```cangjie
func asObject(): IRemoteObject
```

**功能：** 需派生类实现，获取代理或远端对象。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[IRemoteObject](#interface-iremoteobject)|如果调用者是RemoteObject对象，则直接返回本身；如果调用者是[RemoteProxy](#class-remoteproxy)对象，则返回它的持有者[IRemoteObject](#interface-iremoteobject)。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 该接口可用于查询或获取接口描述符、添加或删除死亡通知、转储对象状态到特定文件、发送消息。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### func getDescriptor()

```cangjie
func getDescriptor(): String
```

**功能：** 获取对象的接口描述符，接口描述符为字符串。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|返回接口描述符。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900008|The proxy or remote object is invalid.|

### func getLocalInterface(String)

```cangjie
func getLocalInterface(descriptor: String): IRemoteBroker
```

**功能：** 查询接口描述符的字符串。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|descriptor|String|是|-|接口描述符的字符串。|

**返回值：**

|类型|说明|
|:----|:----|
|[IRemoteBroker](#interface-iremotebroker)|返回绑定到指定接口描述符的IRemoteBroker对象。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: <br/> 1.The number of parameters is incorrect; <br/> 2.The parameter type does not match; <br/> 3.The string length exceeds 40960 bytes; <br/> 4.The number of bytes copied to the buffer is different from the length of the obtained string.|

### func isObjectDead()

```cangjie
func isObjectDead(): Bool
```

**功能：** 检查当前对象是否死亡。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|true：对象死亡，false：对象未死亡。|

### func registerDeathRecipient(DeathRecipient, Int32)

```cangjie
func registerDeathRecipient(recipient: DeathRecipient, flags: Int32): Unit
```

**功能：** 注册用于接收远程对象死亡通知的回调。如果与RemoteProxy对象匹配的远程对象进程死亡，则调用此方法。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|recipient|[DeathRecipient](#class-deathrecipient)|是|-|要注册的回调。|
|flags|Int32|是|-|死亡通知标志。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: <br/> 1.The number of parameters is incorrect; <br/> 2.The parameter type does not match; <br/> 3.The callback used to receive remote object death notifications is empty.|
  |1900008|The proxy or remote object is invalid.|

### func sendMessageRequest(UInt32, MessageSequence, MessageSequence, MessageOption, Callback1Argument\<RequestResult>)

```cangjie
func sendMessageRequest(code: UInt32, data: MessageSequence, reply: MessageSequence, options: MessageOption,
    callback: Callback1Argument<RequestResult>): Unit
```

**功能：** 以同步或异步方式向对端进程发送MessageSequence消息。如果为选项设置了异步模式，则立即收到回调，reply报文里没有内容，具体回复需要在业务侧的回调中获取。如果为选项设置了同步模式，则将在sendRequest返回时收到回调，回复内容在reply报文里。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|code|UInt32|是|-|本次请求调用的消息码（1-16777215），由通信双方确定。如果接口由IDL工具生成，则消息代码由IDL自动生成。|
|data|[MessageSequence](#class-messagesequence)|是|-|保存待发送数据的MessageSequence对象。|
|reply|[MessageSequence](#class-messagesequence)|是|-|接收应答数据的MessageSequence对象。|
|options|[MessageOption](#class-messageoption)|是|-|本次请求的同异步模式，默认同步调用。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[RequestResult](#struct-requestresult)>|是|-|接收发送结果的回调。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: <br/> 1.The number of parameters is incorrect; <br/> 2.The parameter type does not match; <br/> 3.Failed to obtain the passed object instance.|

### func unregisterDeathRecipient(DeathRecipient, Int32)

```cangjie
func unregisterDeathRecipient(recipient: DeathRecipient, flags: Int32): Unit
```

**功能：** 注销用于接收远程对象死亡通知的回调。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|recipient|[DeathRecipient](#class-deathrecipient)|是|-|要注销的回调。|
|flags|Int32|是|-|死亡通知标志。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
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

**功能：** 在进程间通信（IPC）期间，将类的对象写入MessageSequence并从MessageSequence中恢复它们。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### func marshalling(MessageSequence)

```cangjie
func marshalling(dataOut: MessageSequence): Bool
```

**功能：** 将此可序列对象封送到MessageSequence中。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|dataOut|[MessageSequence](#class-messagesequence)|是|-|可序列对象将被封送到的MessageSequence对象。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|true：封送成功，false：封送失败。|

### func unmarshalling(MessageSequence)

```cangjie
func unmarshalling(dataIn: MessageSequence): Bool
```

**功能：** 从MessageSequence中解封此可序列对象。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|dataIn|[MessageSequence](#class-messagesequence)|是|-|已将可序列对象封送到其中的MessageSequence对象。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|true：反序列化成功，false：反序列化失败。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 提供与匿名共享内存对象相关的方法，包括创建、关闭、映射和取消映射Ashmem、从Ashmem读取数据和写入数据、获取Ashmem大小、设置Ashmem保护。

共享内存只适用与本设备内跨进程通信。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static const PROT_EXEC

```cangjie
public static const PROT_EXEC: UInt32 = 4
```

**功能：** 映射的内存可执行。

**类型：** UInt32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static const PROT_NONE

```cangjie
public static const PROT_NONE: UInt32 = 0
```

**功能：** 映射的内存不可访问。

**类型：** UInt32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static const PROT_READ

```cangjie
public static const PROT_READ: UInt32 = 1
```

**功能：** 映射的内存可读。

**类型：** UInt32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static const PROT_WRITE

```cangjie
public static const PROT_WRITE: UInt32 = 2
```

**功能：** 映射的内存可写。

**类型：** UInt32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static func create(String, Int32)

```cangjie
public static func create(name: String, size: Int32): Ashmem
```

**功能：** 静态方法，通过复制现有Ashmem对象的文件描述符（fd）来创建Ashmem对象。两个Ashmem对象指向同一个共享内存区域。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|名称，用于查询Ashmem信息。|
|size|Int32|是|-|Ashmem的大小，以字节为单位。|

**返回值：**

|类型|说明|
|:----|:----|
|[Ashmem](#class-ashmem)|返回创建的Ashmem对象。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The passed parameter is not an Ahmem object;<br>3.3.The ashmem instance for obtaining packaging is empty.|

**示例：**

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

**功能：** 静态方法，通过复制现有Ashmem对象的文件描述符（fd）来创建Ashmem对象。两个Ashmem对象指向同一个共享内存区域。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|ashmem|[Ashmem](#class-ashmem)|是|-|已存在的Ashmem对象。|

**返回值：**

|类型|说明|
|:----|:----|
|[Ashmem](#class-ashmem)|返回创建的Ashmem对象。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The passed parameter is not an Ahmem object;<br>3.3.The ashmem instance for obtaining packaging is empty.|

**示例：**

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

**功能：** 关闭这个Ashmem。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**示例：**

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

**功能：** 获取Ashmem对象的内存大小。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|返回Ashmem对象的内存大小。|

**示例：**

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

**功能：** 在此进程虚拟地址空间上创建可读写的共享文件映射。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter is not an instance of the Ashmem object.|
  |1900001|Failed to call mmap.|

**示例：**

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

**功能：** 在此进程虚拟地址空间上创建只读的共享文件映射。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900001|Failed to call mmap.|

**示例：**

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

**功能：** 在此进程的虚拟地址空间上创建共享文件映射，映射区域大小由此Ashmem对象指定。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|mapType|UInt32|是|-|指定映射的内存区域的保护等级。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter type does not match;<br>3.The passed mapType exceeds the maximum protection level.|
  |1900001|Failed to call mmap.|

**示例：**

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

**功能：** 从此Ashmem对象关联的共享文件中读取数据。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|size|Int64|是|-|要读取的数据的大小。|
|offset|Int64|是|-|要读取的数据在此Ashmem对象关联的内存区间的起始位置。|

**返回值：**

|类型|说明|
|:----|:----|
|Array\<Byte>|返回读取的数据。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: <br/> 1.The number of parameters is incorrect; <br/> 2.The parameter type does not match.|
  |1900004|Failed to read data from the shared memory.|

### func setProtectionType(UInt32)

```cangjie
public func setProtectionType(protectionType: UInt32): Unit
```

**功能：** 设置映射内存区域的保护等级。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|protectionType|UInt32|是|-|要设置的保护类型。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter type does not match.|
  |1900002|Failed to call ioctl.|

**示例：**

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

**功能：** 删除该Ashmem对象的地址映射。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**示例：**

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

**功能：** 将数据写入此Ashmem对象关联的共享文件。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|buf|Array\<Byte>|是|-|写入Ashmem对象的数据。|
|size|Int64|是|-|要写入的数据大小。|
|offset|Int64|是|-|要写入的数据在此Ashmem对象关联的内存区间的起始位置。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: <br/> 1.The number of parameters is incorrect; <br/> 2.The parameter type does not match; <br/> 3.Failed to obtain arrayBuffer information.|
  |1900003|Failed to write data to the shared memory.|

## class DeathRecipient

```cangjie
public abstract class DeathRecipient {}
```

**功能：** 用于订阅远端对象的死亡通知。当被订阅该通知的远端对象死亡时，本端可收到消息，调用[onRemoteDied](#func-onremotedied)接口。远端对象死亡可以为远端对象所在进程死亡，远端对象所在设备关机或重启，当远端对象与本端对象属于不同设备时，也可为远端对象离开组网时。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### func onRemoteDied()

```cangjie
public open func onRemoteDied(): Unit
```

**功能：** 在成功添加死亡通知订阅后，当远端对象死亡时，将自动调用本方法。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 错误码对应数值及含义。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static const CALL_JS_METHOD_ERROR

```cangjie
public static const CALL_JS_METHOD_ERROR: Int32 = 1900012
```

**功能：** 执行JS回调方法失败。

**类型：** Int32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static const CHECK_PARAM_ERROR

```cangjie
public static const CHECK_PARAM_ERROR: Int32 = 401
```

**功能：** 检查参数失败。

**类型：** Int32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static const COMMUNICATION_ERROR

```cangjie
public static const COMMUNICATION_ERROR: Int32 = 1900007
```

**功能：** 和远端对象进行进程间通信失败。

**类型：** Int32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static const ONLY_PROXY_OBJECT_PERMITTED_ERROR

```cangjie
public static const ONLY_PROXY_OBJECT_PERMITTED_ERROR: Int32 = 1900005
```

**功能：** 只有proxy对象允许该操作。

**类型：** Int32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static const ONLY_REMOTE_OBJECT_PERMITTED_ERROR

```cangjie
public static const ONLY_REMOTE_OBJECT_PERMITTED_ERROR: Int32 = 1900006
```

**功能：** 只有remote对象允许该操作。

**类型：** Int32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static const OS_DUP_ERROR

```cangjie
public static const OS_DUP_ERROR: Int32 = 1900013
```

**功能：** 执行系统调用dup失败。

**类型：** Int32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static const OS_IOCTL_ERROR

```cangjie
public static const OS_IOCTL_ERROR: Int32 = 1900002
```

**功能：** 在共享内存文件描述符上执行系统调用ioctl失败。

**类型：** Int32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static const OS_MMAP_ERROR

```cangjie
public static const OS_MMAP_ERROR: Int32 = 1900001
```

**功能：** 执行系统调用mmap失败。

**类型：** Int32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static const PARCEL_MEMORY_ALLOC_ERROR

```cangjie
public static const PARCEL_MEMORY_ALLOC_ERROR: Int32 = 1900011
```

**功能：** 序列化过程中内存分配失败。

**类型：** Int32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static const PROXY_OR_REMOTE_OBJECT_INVALID_ERROR

```cangjie
public static const PROXY_OR_REMOTE_OBJECT_INVALID_ERROR: Int32 = 1900008
```

**功能：** 非法的代理对象或者远端对象。

**类型：** Int32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static const READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR

```cangjie
public static const READ_DATA_FROM_MESSAGE_SEQUENCE_ERROR: Int32 = 1900010
```

**功能：** 读取MessageSequence数据失败。

**类型：** Int32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static const READ_FROM_ASHMEM_ERROR

```cangjie
public static const READ_FROM_ASHMEM_ERROR: Int32 = 1900004
```

**功能：** 从共享内存读数据失败。

**类型：** Int32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static const WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR

```cangjie
public static const WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR: Int32 = 1900009
```

**功能：** 向MessageSequence写数据失败。

**类型：** Int32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static const WRITE_TO_ASHMEM_ERROR

```cangjie
public static const WRITE_TO_ASHMEM_ERROR: Int32 = 1900003
```

**功能：** 向共享内存写数据失败。

**类型：** Int32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

## class IPCSkeleton

```cangjie
public class IPCSkeleton {}
```

**功能：** 用于获取IPC上下文信息，包括获取UID和PID、获取本端和对端设备ID、检查接口调用是否在同一设备上。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static func flushCmdBuffer(IRemoteObject)

```cangjie
public static func flushCmdBuffer(object: IRemoteObject): Unit
```

**功能：** 静态方法，将所有挂起的命令从指定的RemoteProxy刷新到相应的RemoteObject。建议在任何时间执行敏感操作之前调用此方法。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|object|[IRemoteObject](#interface-iremoteobject)|是|-|返回系统能力管理者。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter type does not match;<br>3.The passed mapType exceeds the maximum protection level.|

### static func getCallingDeviceID()

```cangjie
public static func getCallingDeviceID(): String
```

**功能：** 静态方法，获取调用者进程所在的设备ID。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|返回调用者进程所在的设备ID。|

### static func getCallingPid()

```cangjie
public static func getCallingPid(): Int32
```

**功能：** 静态方法，获取调用者的PID。此方法由[RemoteObject](#class-remoteobject)对象在onRemoteRequest方法中调用，不在IPC上下文环境（onRemoteRequest）中调用则返回本进程的PID。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|返回调用者的PID。|

### static func getCallingTokenId()

```cangjie
public static func getCallingTokenId(): UInt32
```

**功能：** 静态方法，获取调用者的TokenId，用于被调用方对调用方的身份校验。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|UInt32|返回调用者的TokenId。|

### static func getCallingUid()

```cangjie
public static func getCallingUid(): Int32
```

**功能：** 静态方法，获取调用者的UID。此方法由RemoteObject对象在onRemoteRequest方法中调用，不在IPC上下文环境（onRemoteRequest）中调用则返回本进程的UID。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|返回调用者的UID。|

### static func getContextObject()

```cangjie
public static func getContextObject(): IRemoteObject
```

**功能：** 静态方法，获取系统能力的管理者。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[IRemoteObject](#interface-iremoteobject)|返回系统能力管理者。|

### static func getLocalDeviceID()

```cangjie
public static func getLocalDeviceID(): String
```

**功能：** 静态方法，获取本端设备ID。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|返回本地设备的ID。|

### static func isLocalCalling()

```cangjie
public static func isLocalCalling(): Bool
```

**功能：** 静态方法，检查当前通信对端是否是本设备的进程。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|true：调用在同一台设备，false：调用未在同一台设备。|

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

**功能：** 公共消息选项，使用指定的标志类型，构造指定的MessageOption对象。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static const TF_ACCEPT_FDS

```cangjie
public static const TF_ACCEPT_FDS: Int32 = 0x10
```

**功能：** 指示sendMessageRequest9+接口可以传递文件描述符。

**类型：** Int32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static const TF_ASYNC

```cangjie
public static const TF_ASYNC: Int32 = 0x01
```

**功能：** 异步调用标识。

**类型：** Int32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static const TF_SYNC

```cangjie
public static const TF_SYNC: Int32 = 0x00
```

**功能：** 同步调用标识。

**类型：** Int32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static const TF_WAIT_TIME

```cangjie
public static const TF_WAIT_TIME: Int32 = 0x8
```

**功能：** RPC等待时间（单位/秒），不用于IPC的情况。

**类型：** Int32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### init(Bool, Int32)

```cangjie
public init(async!: Bool = false, waitTime!: Int32 = MessageOption.TF_WAIT_TIME)
```

**功能：** MessageOption构造函数。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|async|Bool|否|false|**命名参数。** true：表示异步调用标志，false：表示同步调用标志。默认同步调用。|
|waitTime|Int32|否|MessageOption.TF_WAIT_TIME|**命名参数。** 调用rpc最长等待时间。默认TF_WAIT_TIME。|

**示例：**

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

**功能：** 获取同步调用或异步调用标志。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|调用成功返回同步调用或异步调用标志。|

**示例：**

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

**功能：** 获取rpc调用的最长等待时间。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|rpc最长等待时间。|

**示例：**

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

**功能：** 获取SendMessageRequest调用中确定同步或是异步的标志。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|true：异步调用成功，false：同步调用成功。|

**示例：**

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

**功能：** 设置SendMessageRequest调用中确定同步或是异步的标志。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|async|Bool|是|-|true：表示异步调用标志，false：表示同步调用标志。|

**示例：**

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

**功能：** 设置同步调用或异步调用标志。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|flags|Int32|是|-|同步调用或异步调用标志。|

**示例：**

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

**功能：** 设置rpc调用最长等待时间。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|waitTime|Int32|是|-|rpc调用最长等待时间，上限为3000秒。|

**示例：**

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

**功能：** 在RPC或IPC过程中，发送方可以使用MessageSequence提供的写方法，将待发送的数据以特定格式写入该对象。接收方可以使用MessageSequence提供的读方法从该对象中读取特定格式的数据。数据格式包括：基础类型及数组、IPC对象、接口描述符和自定义序列化对象。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static func closeFileDescriptor(Int32)

```cangjie
public static func closeFileDescriptor(fd: Int32): Unit
```

**功能：** 静态方法，关闭给定的文件描述符。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fd|Int32|是|-|要关闭的文件描述符。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter type does not match.|

**示例：**

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

**功能：** 静态方法，创建MessageSequence对象。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[MessageSequence](#class-messagesequence)|返回创建的MessageSequence对象。|

**示例：**

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

**功能：** 静态方法，复制给定的文件描述符。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fd|Int32|是|-|表示已存在的文件描述符。|

**返回值：**

|类型|说明|
|:----|:----|
|Int32|返回新的文件描述符。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter type does not match.|
  |1900013|Failed to call dup.|

**示例：**

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

**功能：** 检查此MessageSequence对象是否包含文件描述符。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|true：包含文件描述符，false：不包含文件描述符。|

**示例：**

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

**功能：** 获取当前MessageSequence对象的容量大小。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|UInt32|获取的MessageSequence实例的容量大小。以字节为单位。|

**示例：**

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

**功能：** 获取MessageSequence可以容纳的最大原始数据量。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|UInt32|返回MessageSequence可以容纳的最大原始数据量，即128MB。|

**示例：**

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

**功能：** 获取MessageSequence的读位置。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|UInt32|返回MessageSequence实例中的当前读取位置。|

**示例：**

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

**功能：** 获取MessageSequence的可读字节空间。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|UInt32|获取到的MessageSequence实例的可读字节空间。以字节为单位。|

**示例：**

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

**功能：** 获取当前创建的MessageSequence对象的数据大小。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|UInt32|获取的MessageSequence实例的数据大小。以字节为单位。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter type does not match.|

**示例：**

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

**功能：** 获取MessageSequence的可写字节空间大小。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|UInt32|获取到的MessageSequence实例的可写字节空间。以字节为单位。|

**示例：**

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

**功能：** 获取MessageSequence的写位置。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|UInt32|返回MessageSequence实例中的当前写入位置。|

**示例：**

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

**功能：** 从MessageSequence读取匿名共享对象。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[Ashmem](#class-ashmem)|返回匿名共享对象。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|check param failed.|
  |1900004|Failed to read data from the shared memory.|

### func readBoolean()

```cangjie
public func readBoolean(): Bool
```

**功能：** 从MessageSequence实例读取布尔值。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|返回读取到的布尔值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例中读取布尔数组。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|dataIn|ArrayList\<Bool>|是|-|要读取的布尔数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match.|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例中读取所有布尔数组。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<Bool>|返回布尔数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例读取字节值。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int8|返回字节值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例中读取字节数组。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|dataIn|ArrayList\<Int8>|是|-|要读取的字节数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:1.The parameter is an empty array;2.The number of parameters is incorrect;3.The parameter type does not match.|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例中读取字节数组。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<Int8>|返回字节数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例中读取单个字符值。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|UInt8|返回单个字符数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例读取单个字符数组。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|dataIn|ArrayList\<UInt8>|是|-|要读取的单个字符数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例读取单个字符数组。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<UInt8>|返回单个字符数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例读取双精度浮点值。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Float64|返回双精度浮点值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例读取所有双精度浮点数组。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|dataIn|ArrayList\<Float64>|是|-|要读取的双精度浮点数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match.|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例读取所有双精度浮点数组。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<Float64>|返回双精度浮点数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence中读取异常。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence中读取文件描述符。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|返回文件描述符。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例中读取浮点值。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Float32|返回浮点值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例中读取Array\<Float32>类型数据。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<Float32>|读取的数据。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例中读取Array\<Float64>类型数据。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<Float64>|读取的数据。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例中读取浮点数组。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|dataIn|ArrayList\<Float32>|是|-|要读取的浮点数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter type does not match;<br>3.The obtained value of typeCode is incorrect.|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例中读取浮点数组。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<Float32>|返回浮点数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例读取整数值。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|返回整数值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例中读取Array\<Int16>类型数据。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<Int16>|读取的数据。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例中读取Array\<Int32>类型数据。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<Int32>|读取的数据。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例中读取Array\<Int64>类型数据。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<Int64>|读取的数据。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例中读取Array\<Int8>类型数据。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<Int8>|读取的数据。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例中读取整数数组。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|dataIn|ArrayList\<Int32>|是|-|要读取的整数数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match. |
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例中读取整数数组。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<Int32>|返回整数数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence对象中读取接口描述符，接口描述符按写入MessageSequence的顺序读取，本地对象可使用该信息检验本次通信。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|返回读取到的接口描述符。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

### func readLong()

```cangjie
public func readLong(): Int64
```

**功能：** 从MessageSequence实例中读取长整数值。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int64|返回长整数值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例中读取所有的长整数数组。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|dataIn|ArrayList\<Int64>|是|-|要写入的整数数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match.|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例中读取所有的长整数数组。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<Int64>|返回整数数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例中读取成员变量到指定的对象（dataIn）。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|dataIn|[Parcelable](#interface-parcelable)|是|-|需要从MessageSequence读取成员变量的对象。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect.|
  |1900010|Failed to read data from the message sequence.|
  |1900012|Failed to call the JS callback function.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 从MessageSequence实例读取可序列化对象数组。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|parcelableArray|Array\<[Parcelable](#interface-parcelable)>|是|-|要读取的可序列化对象数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match;<br>4.The length of the array passed when reading is not equal to the length passed when writing to the array;<br>5.The element does not exist in the array.|
  |1900010|Failed to read data from the message sequence.|
  |1900012|Failed to call the JS callback function.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.IPCKit.*

// 此处代码可添加在依赖项定义中
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
data.writeParcelableArray(parcelable,parcelable2,parcelable3)
let ret: Array<Parcelable> = [MyParcelable(0, ""), MyParcelable(0, ""), MyParcelable(0, "")]
data.readParcelableArray(ret)
```

### func readRawDataBuffer(Int64)

```cangjie
public func readRawDataBuffer(size: Int64): Array<Byte>
```

**功能：** 从MessageSequence读取原始数据。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|size|Int64|是|-|要读取的原始数据的大小。|

**返回值：**

|类型|说明|
|:----|:----|
|Array\<Byte>|返回原始数据（以字节为单位）。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: <br/> 1.The number of parameters is incorrect; <br/> 2.The parameter type does not match.|
  |1900010|Failed to read data from the message sequence.|

### func readShort()

```cangjie
public func readShort(): Int16
```

**功能：** 从MessageSequence实例读取短整数值。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int16|返回短整数值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例中读取短整数数组。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|dataIn|ArrayList\<Int16>|是|-|要读取的短整数数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match. |
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例中读取短整数数组。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<Int16>|返回短整数数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例读取字符串值。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|返回字符串值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例读取字符串数组。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|dataIn|ArrayList\<String>|是|-|要读取的字符串数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  | 401 | Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match. |
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例读取字符串数组。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<String>|返回字符串数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例中读取Array\<UInt16>类型数据。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<UInt16>|读取的数据。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter type does not match;<br>3.The obtained value of typeCode is incorrect.|
  |1900010|Failed to read data from the message sequence.|

### func readUInt32Array()

```cangjie
public func readUInt32Array(): Array<UInt32>
```

**功能：** 从MessageSequence实例中读取Array\<UInt32>类型数据。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<UInt32>|读取的数据。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter type does not match;<br>3.The obtained value of typeCode is incorrect.|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例中读取Array\<UInt64>类型数据。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<UInt64>|读取的数据。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter type does not match;<br>3.The obtained value of typeCode is incorrect.|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 从MessageSequence实例中读取Array\<UInt8>类型数据。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<UInt8>|读取的数据。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter type does not match;<br>3.The obtained value of typeCode is incorrect.|
  |1900010|Failed to read data from the message sequence.|

**示例：**

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

**功能：** 释放不再使用的MessageSequence对象。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**示例：**

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

**功能：** 重新偏移读取位置到指定的位置。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|pos|UInt32|是|-|开始读取数据的目标位置。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter type does not match.|

**示例：**

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

**功能：** 重新偏移写位置到指定的位置。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|pos|UInt32|是|-|开始写入数据的目标位置。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter type does not match.|

**示例：**

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

**功能：** 设置MessageSequence对象的存储容量。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|size|UInt32|是|-|MessageSequence实例的存储容量。以字节为单位。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter type does not match.|
  |1900011|Memory allocation failed.|

**示例：**

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

**功能：** 设置MessageSequence对象中包含的数据大小。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|size|UInt32|是|-|MessageSequence实例的数据大小。以字节为单位。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter type does not match.|

**示例：**

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

**功能：** 将指定的匿名共享对象写入此MessageSequence。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|ashmem|[Ashmem](#class-ashmem)|是|-|要写入MessageSequence的匿名共享对象。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter is not an instance of the Ashmem object.|
  |1900003|Failed to write data to the shared memory.|

**示例：**

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

**功能：** 将布尔值写入MessageSequence实例。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|val|Bool|是|-|要写入的布尔值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter type does not match.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将布尔数组写入MessageSequence实例。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|booleanArray|Array\<Bool>|是|-|要写入的布尔数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match;<br>4.The element does not exist in the array;<br>5.The type of the element in the array is incorrect.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将字节值写入MessageSequence实例。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|val|Int8|是|-|要写入的字节值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter type does not match.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将字节数组写入MessageSequence实例。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|byteArray|Array\<Int8>|是|-|要写入的字节数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match;<br>4.The element does not exist in the array;<br>5.The type of the element in the array is incorrect.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将单个字符值写入MessageSequence实例。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|val|UInt8|是|-|要写入的单个字符值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter type does not match.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将单个字符数组写入MessageSequence实例。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|charArray|Array\<UInt8>|是|-|要写入的单个字符数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match;<br>4.The element does not exist in the array;<br>5.The type of the element in the array is incorrect.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将双精度浮点值写入MessageSequence实例。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|val|Float64|是|-|要写入的双精度浮点值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter type does not match.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将双精度浮点数组写入MessageSequence实例。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|doubleArray|Array\<Float64>|是|-|要写入的双精度浮点数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match;<br>4.The element does not exist in the array;<br>5.The type of the element in the array is incorrect.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

<!-- compile -->

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

**功能：** 写入文件描述符到MessageSequence。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fd|Int32|是|-|文件描述符。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter type does not match.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将浮点值写入MessageSequence实例。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|val|Float32|是|-|要写入的浮点值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter type does not match.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将Array\<Float32>类型数据写入MessageSequence对象。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|buf|Array\<Float32>|是|-|要写入的数据。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match;<br>4.The obtained value of typeCode is incorrect;<br>5.Failed to obtain arrayBuffer information.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将Array\<Float64>类型数据写入MessageSequence对象。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|buf|Array\<Float64>|是|-|要写入的数据。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match;<br>4.The obtained value of typeCode is incorrect;<br>5.Failed to obtain arrayBuffer information.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将浮点数组写入MessageSequence实例。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|floatArray|Array\<Float32>|是|-|要写入的浮点数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match;<br>4.The element does not exist in the array;<br>5.The type of the element in the array is incorrect.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将整数值写入MessageSequence实例。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|val|Int32|是|-|要写入的整数值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter type does not match.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将Array\<Int16>类型数据写入MessageSequence对象。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|buf|Array\<Int16>|是|-|要写入的数据。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match;<br>4.The obtained value of typeCode is incorrect;<br>5.Failed to obtain arrayBuffer information.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将Array\<Int32>类型数据写入MessageSequence对象。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|buf|Array\<Int32>|是|-|要写入的数据。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match;<br>4.The obtained value of typeCode is incorrect;<br>5.Failed to obtain arrayBuffer information.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将Array\<Int64>类型数据写入MessageSequence对象。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|buf|Array\<Int64>|是|-|要写入的数据。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match;<br>4.The obtained value of typeCode is incorrect;<br>5.Failed to obtain arrayBuffer information.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将Array\<Int8>类型数据写入MessageSequence对象。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|buf|Array\<Int8>|是|-|要写入的数据。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match;<br>4.The obtained value of typeCode is incorrect;<br>5.Failed to obtain arrayBuffer information.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将整数数组写入MessageSequence实例。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|intArray|Array\<Int32>|是|-|要写入的整数数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match;<br>4.The element does not exist in the array;<br>5.The type of the element in the array is incorrect.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将接口描述符写入MessageSequence对象，远端对象可使用该信息校验本次通信。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|token|String|是|-|字符串类型描述符。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter type does not match;<br>3.The string length exceeds 40960 bytes;<br>4.The number of bytes copied to the buffer is different from the length of the obtained string.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将长整数值写入MessageSequence实例。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|val|Int64|是|-|要写入的长整数值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter type does not match.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将长整数数组写入MessageSequence实例。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|longArray|Array\<Int64>|是|-|要写入的长整数数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match;<br>4.The element does not exist in the array;<br>5.The type of the element in the array is incorrect.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 向MessageSequence写入“指示未发生异常”的信息。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将自定义序列化对象写入MessageSequence实例。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|val|[Parcelable](#interface-parcelable)|是|-|要写入的可序列对象。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The parameter type does not match.|
  |1900009|Failed to write data to the message sequence.|

### func writeParcelableArray(Array\<Parcelable>)

```cangjie
public func writeParcelableArray(parcelableArray: Array<Parcelable>): Unit
```

**功能：** 将可序列化对象数组写入MessageSequence实例。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|parcelableArray|Array\<[Parcelable](#interface-parcelable)>|是|-|要写入的可序列化对象数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match;<br>4.The element does not exist in the array.|
  |1900009|Failed to write data to the message sequence.|

### func writeRawDataBuffer(Array\<Byte>, Int64)

```cangjie
public func writeRawDataBuffer(rawData: Array<Byte>, size: Int64): Unit
```

**功能：** 将原始数据写入MessageSequence对象。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|rawData|Array\<Byte>|是|-|要写入的原始数据。|
|size|Int64|是|-|发送的原始数据大小，以字节为单位。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: <br/> 1.The number of parameters is incorrect; <br/> 2.The parameter type does not match; <br/> 3.Failed to obtain arrayBuffer information; <br/> 4.The transferred size cannot be obtained; <br/> 5.The transferred size is less than or equal to 0; <br/> 6.The transferred size is greater than the byte length of ArrayBuffer.|
  |1900009|Failed to write data to the message sequence.|

### func writeShort(Int16)

```cangjie
public func writeShort(val: Int16): Unit
```

**功能：** 将短整数值写入MessageSequence实例。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|val|Int16|是|-|要写入的短整数值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter type does not match.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将短整数数组写入MessageSequence实例。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|shortArray|Array\<Int16>|是|-|要写入的短整数数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match;<br>4.The element does not exist in the array;<br>5.The type of the element in the array is incorrect.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将字符串值写入MessageSequence实例。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|val|String|是|-|要写入的字符串值，其长度应小于40960字节。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The number of parameters is incorrect;<br>2.The parameter type does not match.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将字符串数组写入MessageSequence实例。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|stringArray|Array\<String>|是|-|要写入的字符串数组，数组单个元素的长度应小于40960字节。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match;<br>4.The element does not exist in the array;<br>5.The type of the element in the array is incorrect.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将Array\<UInt16>类型数据写入MessageSequence对象。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|buf|Array\<UInt16>|是|-|要写入的数据。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match;<br>4.The obtained value of typeCode is incorrect;<br>5.Failed to obtain arrayBuffer information.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将Array\<UInt32>类型数据写入MessageSequence对象。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|buf|Array\<UInt32>|是|-|要写入的数据。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match;<br>4.The obtained value of typeCode is incorrect;<br>5.Failed to obtain arrayBuffer information.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将Array\<UInt64>类型数据写入MessageSequence对象。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|buf|Array\<UInt64>|是|-|要写入的数据。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match;<br>4.The obtained value of typeCode is incorrect;<br>5.Failed to obtain arrayBuffer information.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 将Array\<UInt8>类型数据写入MessageSequence对象。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|buf|Array\<UInt8>|是|-|要写入的数据。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes:<br>1.The parameter is an empty array;<br>2.The number of parameters is incorrect;<br>3.The parameter type does not match;<br>4.The obtained value of typeCode is incorrect;<br>5.Failed to obtain arrayBuffer information.|
  |1900009|Failed to write data to the message sequence.|

**示例：**

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

**功能：** 实现远程对象。服务提供者必须继承此类。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**父类型：**

- [IRemoteObject](#interface-iremoteobject)

### init(String)

```cangjie
public init(descriptor: String)
```

**功能：** RemoteObject构造函数。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|descriptor|String|是|-|接口描述符。|

### func getCallingPid()

```cangjie
public func getCallingPid(): Int32
```

**功能：** 获取通信对端的进程Pid。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|返回通信对端的进程Pid。|

### func getCallingUid()

```cangjie
public func getCallingUid(): Int32
```

**功能：** 获取通信对端的进程Uid。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|返回通信对端的进程Uid。|

### func getDescriptor()

```cangjie
public func getDescriptor(): String
```

**功能：** 获取对象的接口描述符。接口描述符为字符串。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|返回接口描述符。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900008|The proxy or remote object is invalid.|

### func getLocalInterface(String)

```cangjie
public func getLocalInterface(descriptor: String): IRemoteBroker
```

**功能：** 查询接口描述符的字符串。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|descriptor|String|是|-|接口描述符的字符串。|

**返回值：**

|类型|说明|
|:----|:----|
|[IRemoteBroker](#interface-iremotebroker)|返回绑定到指定接口描述符的IRemoteBroker对象。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: <br/> 1.The number of parameters is incorrect; <br/> 2.The parameter type does not match; <br/> 3.The string length exceeds 40960 bytes; <br/> 4.The number of bytes copied to the buffer is different from the length of the obtained string.|

### func isObjectDead()

```cangjie
public func isObjectDead(): Bool
```

**功能：** 检查当前对象是否死亡。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|true：对象死亡，false：对象未死亡。|

### func modifyLocalInterface(IRemoteBroker, String)

```cangjie
public func modifyLocalInterface(localInterface: IRemoteBroker, descriptor: String): Unit
```

**功能：** 此接口用于把接口描述符和IRemoteBroker对象绑定。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|localInterface|[IRemoteBroker](#interface-iremotebroker)|是|-|将与描述符绑定的IRemoteBroker对象。|
|descriptor|String|是|-|用于与IRemoteBroker对象绑定的描述符。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: <br/> 1.The number of parameters is incorrect; <br/> 2.The parameter type does not match; <br/> 3.The string length exceeds 40960 bytes; <br/> 4.The number of bytes copied to the buffer is different from the length of the obtained string.|

### func registerDeathRecipient(DeathRecipient, Int32)

```cangjie
public func registerDeathRecipient(recipient: DeathRecipient, flags: Int32): Unit
```

**功能：** 注册用于接收远程对象死亡通知的回调。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|recipient|[DeathRecipient](#class-deathrecipient)|是|-|要注册的回调。|
|flags|Int32|是|-|死亡通知标志。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: <br/> 1.The number of parameters is incorrect; <br/> 2.The parameter type does not match; <br/> 3.The callback used to receive remote object death notifications is empty.|
  |1900008|The proxy or remote object is invalid.|

### func sendMessageRequest(UInt32, MessageSequence, MessageSequence, MessageOption, Callback1Argument\<RequestResult>)

```cangjie
public func sendMessageRequest(code: UInt32, data: MessageSequence, reply: MessageSequence, options: MessageOption,
    callback: Callback1Argument<RequestResult>): Unit
```

**功能：** 以同步或异步方式向对端进程发送MessageSequence消息。如果为选项设置了异步模式，则立即收到回调，reply报文里没有内容，具体回复需要在业务侧的回调中获取。如果为选项设置了同步模式，则将在sendMessageRequest返回时收到回调，回复内容在reply报文里。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|code|UInt32|是|-|本次请求调用的消息码（1-16777215），由通信双方确定。如果接口由IDL工具生成，则消息代码由IDL自动生成。|
|data|[MessageSequence](#class-messagesequence)|是|-|保存待发送数据的MessageSequence对象。|
|reply|[MessageSequence](#class-messagesequence)|是|-|接收应答数据的MessageSequence对象。|
|options|[MessageOption](#class-messageoption)|是|-|本次请求的同异步模式，默认同步调用。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[RequestResult](#struct-requestresult)>|是|-|接收发送结果的回调。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: <br/> 1.The number of parameters is incorrect; <br/> 2.The parameter type does not match; <br/> 3.Failed to obtain the passed object instance.|

### func unregisterDeathRecipient(DeathRecipient, Int32)

```cangjie
public func unregisterDeathRecipient(recipient: DeathRecipient, flags: Int32): Unit
```

**功能：** 注销用于接收远程对象死亡通知的回调。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|recipient|[DeathRecipient](#class-deathrecipient)|是|-|要注销的回调。|
|flags|Int32|是|-|死亡通知标志。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: <br/> 1.The number of parameters is incorrect; <br/> 2.The parameter type does not match; <br/> 3.The callback used to receive remote object death notifications is empty.|
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

**功能：** 实现IRemoteObject代理对象。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**父类型：**

- [IRemoteObject](#interface-iremoteobject)

### static const DUMP_TRANSACTION

```cangjie
public static const DUMP_TRANSACTION: Int32 = 0x5f444d50
```

**功能：** 内部指令码，获取Binder内部状态。

**类型：** Int32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static const INTERFACE_TRANSACTION

```cangjie
public static const INTERFACE_TRANSACTION: Int32 = 0x5f4e5446
```

**功能：** 内部指令码，获取对端接口描述符。

**类型：** Int32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static const MAX_TRANSACTION_ID

```cangjie
public static const MAX_TRANSACTION_ID: Int32 = 0x00FFFFFF
```

**功能：** 最大有效指令码。

**类型：** Int32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static const MIN_TRANSACTION_ID

```cangjie
public static const MIN_TRANSACTION_ID: Int32 = 0x00000001
```

**功能：** 最小有效指令码。

**类型：** Int32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### static const PING_TRANSACTION

```cangjie
public static const PING_TRANSACTION: Int32 = 0x5f504e47
```

**功能：** 内部指令码，用于测试IPC服务正常。

**类型：** Int32

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### func getDescriptor()

```cangjie
public func getDescriptor(): String
```

**功能：** 获取对象的接口描述符，接口描述符为字符串。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|返回接口描述符。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |1900007|communication failed.|
  |1900008|The proxy or remote object is invalid.|

### func getLocalInterface(String)

```cangjie
public func getLocalInterface(descriptor: String): IRemoteBroker
```

**功能：** 查询并获取当前接口描述符对应的本地接口对象。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|descriptor|String|是|-|需要查询的接口描述符。|

**返回值：**

|类型|说明|
|:----|:----|
|[IRemoteBroker](#interface-iremotebroker)|默认返回Null，标识该接口是一个代理侧接口。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|check param failed.|
  |1900006|Operation allowed only for the remote object.|

### func isObjectDead()

```cangjie
public func isObjectDead(): Bool
```

**功能：** 指示对应的RemoteObject是否死亡。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|true：对应的对象已经死亡，false：对应的对象未死亡。|

### func registerDeathRecipient(DeathRecipient, Int32)

```cangjie
public func registerDeathRecipient(recipient: DeathRecipient, flags: Int32): Unit
```

**功能：** 注册用于接收远程对象死亡通知的回调。如果与RemoteProxy对象匹配的远程对象进程死亡，则调用此方法。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|recipient|[DeathRecipient](#class-deathrecipient)|是|-|要注册的回调。|
|flags|Int32|是|-|死亡通知标志。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: <br/> 1.The number of parameters is incorrect; <br/> 2.The parameter type does not match; <br/> 3.The callback used to receive remote object death notifications is empty.|
  |1900008|The proxy or remote object is invalid.|

### func sendMessageRequest(UInt32, MessageSequence, MessageSequence, MessageOption, Callback1Argument\<RequestResult>)

```cangjie
public func sendMessageRequest(code: UInt32, data: MessageSequence, reply: MessageSequence, options: MessageOption,
    callback: Callback1Argument<RequestResult>): Unit
```

**功能：** 以同步或异步方式向对端进程发送MessageSequence消息。如果为选项设置了异步模式，则立即收到回调，reply报文里没有内容，具体回复需要在业务侧的回调中获取。如果为选项设置了同步模式，则将在sendMessageRequest返回后的某个时机执行回调，回复内容在RequestResult的reply报文里。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|code|UInt32|是|-|本次请求调用的消息码（1-16777215），由通信双方确定。如果接口由IDL工具生成，则消息代码由IDL自动生成。|
|data|[MessageSequence](#class-messagesequence)|是|-|保存待发送数据的MessageSequence对象。|
|reply|[MessageSequence](#class-messagesequence)|是|-|接收应答数据的MessageSequence对象。|
|options|[MessageOption](#class-messageoption)|是|-|本次请求的同异步模式，默认同步调用。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[RequestResult](#struct-requestresult)>|是|-|接收发送结果的回调。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: <br/> 1.The number of parameters is incorrect; <br/> 2.The parameter type does not match; <br/> 3.Failed to obtain the passed object instance.|

### func unregisterDeathRecipient(DeathRecipient, Int32)

```cangjie
public func unregisterDeathRecipient(recipient: DeathRecipient, flags: Int32): Unit
```

**功能：** 注销用于接收远程对象死亡通知的回调。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|recipient|[DeathRecipient](#class-deathrecipient)|是|-|要注销的回调。|
|flags|Int32|是|-|死亡通知标志。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[RPC错误码](../../errorcodes/cj-errorcode-rpc.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: <br/> 1.The number of parameters is incorrect; <br/> 2.The parameter type does not match; <br/> 3.The callback used to receive remote object death notifications is empty.|
  |1900008|The proxy or remote object is invalid.|

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

**功能：** 发送请求的响应结果。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### let code

```cangjie
public let code: UInt32
```

**功能：** 消息代码。

**类型：** UInt32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### let data

```cangjie
public let data: MessageSequence
```

**功能：** 发送给对端进程的MessageSequence对象。

**类型：** [MessageSequence](#class-messagesequence)

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### let errCode

```cangjie
public let errCode: Int32
```

**功能：** 错误码。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### let reply

```cangjie
public let reply: MessageSequence
```

**功能：** 对端进程返回的MessageSequence对象。

**类型：** [MessageSequence](#class-messagesequence)

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### RequestResult(Int32, UInt32, MessageSequence, MessageSequence)

```cangjie
public RequestResult(
    public let errCode: Int32,
    public let code: UInt32,
    public let data: MessageSequence,
    public let reply: MessageSequence
)
```

**功能：** 构建发送请求的响应结果的对象。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|errCode|Int32|是|-|错误码。|
|code|UInt32|是|-|消息代码。|
|data|[MessageSequence](#class-messagesequence)|是|-|发送给对端进程的MessageSequence对象。|
|reply|[MessageSequence](#class-messagesequence)|是|-|对端进程返回的MessageSequence对象。|

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

**功能：** 传递数据时通过具体类型值来分辨业务是以哪一种TypedArray去进行数据的读写。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**父类型：**

- Equatable\<TypeCode>
- ToString

### BIGINT64_ARRAY

```cangjie
BIGINT64_ARRAY
```

**功能：** TypedArray类型为BIGINT64_ARRAY。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### BIGUINT64_ARRAY

```cangjie
BIGUINT64_ARRAY
```

**功能：** TypedArray类型为BIGUINT64_ARRAY。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### FLOAT32_ARRAY

```cangjie
FLOAT32_ARRAY
```

**功能：** TypedArray类型为FLOAT32_ARRAY。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### FLOAT64_ARRAY

```cangjie
FLOAT64_ARRAY
```

**功能：** TypedArray类型为FLOAT64_ARRAY。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### INT16_ARRAY

```cangjie
INT16_ARRAY
```

**功能：** TypedArray类型为INT16_ARRAY。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### INT32_ARRAY

```cangjie
INT32_ARRAY
```

**功能：** TypedArray类型为INT32_ARRAY。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### INT8_ARRAY

```cangjie
INT8_ARRAY
```

**功能：** TypedArray类型为INT8_ARRAY。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### UINT16_ARRAY

```cangjie
UINT16_ARRAY
```

**功能：** TypedArray类型为UINT16_ARRAY。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### UINT32_ARRAY

```cangjie
UINT32_ARRAY
```

**功能：** TypedArray类型为UINT32_ARRAY。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### UINT8_ARRAY

```cangjie
UINT8_ARRAY
```

**功能：** TypedArray类型为UINT8_ARRAY。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

### func !=(TypeCode)

```cangjie
public operator func !=(other: TypeCode): Bool
```

**功能：** 比较两个枚举值是否不相等。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[TypeCode](#enum-typecode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值是否不相等。|

### func ==(TypeCode)

```cangjie
public operator func ==(other: TypeCode): Bool
```

**功能：** 比较两个枚举值是否相等。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[TypeCode](#enum-typecode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值是否相等。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 枚举值的字符串表达。

**系统能力：** SystemCapability.Communication.IPC.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举值的字符串表达。|
