# IPC与RPC通信开发指导

## 场景介绍

客户端和服务段使用消息队列进行通信。

## 示例

### 有符号整型

```cangjie
import kit.IPCKit.*

let data = MessageSequence.create()
let num: Int64 = 100
data.writeLong(num)
let res = data.readLong()
```

### 单精度浮点数

```cangjie
import kit.IPCKit.*

let data = MessageSequence.create()
let num: Float32 = 100.0
data.writeFloat(num)
let res = data.readFloat()
```

### 双精度浮点数

```cangjie
import kit.IPCKit.*

let data = MessageSequence.create()
let num: Float64 = 100.0
data.writeDouble(num)
let res = data.readDouble()
```

### 布尔类型

```cangjie
import kit.IPCKit.*

let data = MessageSequence.create()
let flag: Bool = true
data.writeBoolean(flag)
let res = data.readBoolean()
```

### 字符

```cangjie
import kit.IPCKit.*

let data = MessageSequence.create()
let char: Uint8 = 1
data.writeChar(char)
let res = data.readChar()
```

### 字符串

```cangjie
import kit.IPCKit.*

let data = MessageSequence.create()
let str: String = 'abc'
data.writeString(str)
let res = data.readString()
```

### 数组

```cangjie
import kit.IPCKit.*

let data = MessageSequence.create()
let arr: Array<Int64>([1,2,3])
data.writeLongArray(arr)
let res = data.readLongArray()
```

### fd

```cangjie
import kit.IPCKit.*

let data = MessageSequence.create()
let filePath = "path/to/file"
let file = FileFs.open(filePath, mode: (OpenMode.CREATE.mode | OpenMode.READ_WRITE.mode))
data.writeFileDescriptor(file.fd)
let fd = data.readFileDescriptor()
```

### 匿名共享内存对象

```cangjie
import kit.IPCKit.*

let data = MessageSequence.create()
let ashmem = Ashmem.create("ashmem", 1024)
data.writeAshmem(ashmem)
let res = data.readAshmem()
```

### 自定义序列化对象

```cangjie
import kit.IPCKit.*

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