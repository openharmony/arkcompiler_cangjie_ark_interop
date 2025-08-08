# ohos.file_fs（文件管理）

该模块为基础文件操作API，提供基础文件操作能力，包括文件基本管理、文件目录管理、文件信息统计、文件流式读写等常用功能。

## 导入模块

```cangjie
import kit.CoreFileKit.*
```

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](../AbilityKit/cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## class ConflictFileException

```cangjie
public class ConflictFileException <: BusinessException {
    public let data: Array<ConflictFiles>
}
```

**功能：** 异常类型，支持moveDir、copyDir使用。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**父类型：**

- [BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)

### let data

```cangjie
public let data: Array<ConflictFiles>
```

**功能：** 冲突文件信息。

**类型：** Array\<[ConflictFiles](#struct-conflictfiles)>

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

## class File

```cangjie
public class File {}
```

**功能：** 由open接口打开的File对象。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### prop fd

```cangjie
public prop fd: Int32
```

**功能：** 打开的文件描述符。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### prop name

```cangjie
public prop name: String
```

**功能：** 文件名。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### prop path

```cangjie
public prop path: String
```

**功能：** 文件路径。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### func getParent()

```cangjie
public func getParent(): String
```

**功能：** 获取File对象对应文件父目录。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|返回父目录路径。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*
import kit.PerformanceAnalysisKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let file = FileFs.open(filePath, mode: (READ_WRITE.mode | CREATE.mode))
AppLog.info("The parent path is: " + file.getParent())
FileFs.close(file)
```

### func tryLock(Bool)

```cangjie
public func tryLock(exclusive!: Bool = false): Unit
```

**功能：** 文件非阻塞式施加共享锁或独占锁。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|exclusive|Bool|否|false| **命名参数。** 是否施加独占锁，默认false。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let file = FileFs.open(filePath, mode:(READ_WRITE.mode | CREATE.mode))
file.tryLock(exclusive: true)
FileFs.close(file)
```

### func unLock()

```cangjie
public func unLock(): Unit
```

**功能：** 以同步方式给文件解锁。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let file = FileFs.open(filePath, mode: (READ_WRITE.mode | CREATE.mode))
file.tryLock(exclusive: true)
file.unLock()
FileFs.close(file)
```

## class FileFs

```cangjie
public class FileFs {}
```

**功能：** 文件管理工具类，提供基础文件操作能力。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### static func access(String)

```cangjie
public static func access(path: String): Bool
```

**功能：** 检查文件是否存在。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|path|String|是|-|文件应用沙箱路径。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|返回true，表示文件存在；返回false，表示文件不存在。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*
import kit.PerformanceAnalysisKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let res = FileFs.access(filePath)
if (res) {
    AppLog.info("file exists")
} else {
    AppLog.info("file not exists")
}
```

### static func close(Int32)

```cangjie
public static func close(file: Int32): Unit
```

**功能：** 以同步方法关闭文件。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|file|Int32|是|-|已打开的File对象，关闭后file对象不再具备实际意义，不可再用于进行读写等操作。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let file = FileFs.open(filePath)
FileFs.close(file.fd)
```

### static func close(File)

```cangjie
public static func close(file: File): Unit
```

**功能：** 以同步方法关闭文件。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|file|[File](#class-file)|是|-|已打开的File对象，关闭后file对象不再具备实际意义，不可再用于进行读写等操作。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let file = FileFs.open(filePath)
FileFs.close(file)
```

### static func copyDir(String, String, Int32)

```cangjie
public static func copyDir(src: String, dest: String, mode!: Int32 = 0): Unit
```

**功能：** 复制源文件夹至目标路径下。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|src|String|是|-|源文件夹的应用沙箱路径。|
|dest|String|是|-|目标文件夹的应用沙箱路径。|
|mode|Int32|否|0| **命名参数。** 复制模式。默认mode为0。<br/>-&nbsp; mode为0，文件级别抛异常。目标文件夹下存在与源文件夹名冲突的文件夹，若冲突文件夹下存在同名文件，则抛出异常。源文件夹下未冲突的文件全部移动至目标文件夹下，目标文件夹下未冲突文件将继续保留，且冲突文件信息将在抛出异常(ConfilictFileException)的data属性中以Array\<ConflictFiles>形式提供。<br/>-&nbsp; mode为1，文件级别强制覆盖。目标文件夹下存在与源文件夹名冲突的文件夹，若冲突文件夹下存在同名文件，则强制覆盖冲突文件夹下所有同名文件，未冲突文件将继续保留。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let srcPath = pathDir + "/srcDir/"
let destPath = pathDir + "/destDir/"
FileFs.copyDir(srcPath, destPath, mode: 0)
```

### static func copyFile(String, String, Int32)

```cangjie
public static func copyFile(src: String, dest: String, mode!: Int32 = 0): Unit
```

**功能：** 复制文件。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|src|String|是|-|待复制文件的文件描述符。|
|dest|String|是|-|目标文件的文件描述符。|
|mode|Int32|否|0| **命名参数。** mode提供覆盖文件的选项，当前仅支持0，且默认为0。<br/>0：完全覆盖目标文件，未覆盖部分将被裁切掉。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let srcPath = pathDir + "/srcDir/test.txt"
let dstPath = pathDir + "/dstDir/test.txt"
FileFs.copyFile(srcPath, dstPath, mode: 0)
```

### static func copyFile(String, Int32, Int32)

```cangjie
public static func copyFile(src: String, dest: Int32, mode!: Int32 = 0): Unit
```

**功能：** 复制文件。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|src|String|是|-|待复制文件的文件描述符。|
|dest|Int32|是|-|目标文件的文件描述符。|
|mode|Int32|否|0| **命名参数。** mode提供覆盖文件的选项，当前仅支持0，且默认为0。<br/>0：完全覆盖目标文件，未覆盖部分将被裁切掉。|

### static func copyFile(Int32, String, Int32)

```cangjie
public static func copyFile(src: Int32, dest: String, mode!: Int32 = 0): Unit
```

**功能：** 复制文件。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|src|Int32|是|-|待复制文件的文件描述符。|
|dest|String|是|-|目标文件的文件描述符。|
|mode|Int32|否|0| **命名参数。** mode提供覆盖文件的选项，当前仅支持0，且默认为0。<br/>0：完全覆盖目标文件，未覆盖部分将被裁切掉。|

### static func copyFile(Int32, Int32, Int32)

```cangjie
public static func copyFile(src: Int32, dest: Int32, mode!: Int32 = 0): Unit
```

**功能：** 复制文件。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|src|Int32|是|-|待复制文件的文件描述符。|
|dest|Int32|是|-|目标文件的文件描述符。|
|mode|Int32|否|0| **命名参数。** mode提供覆盖文件的选项，当前仅支持0，且默认为0。<br/>0：完全覆盖目标文件，未覆盖部分将被裁切掉。|

### static func createRandomAccessFile(String, Int64)

```cangjie
public static func createRandomAccessFile(file: String, mode!: Int64 = 0): RandomAccessFile
```

**功能：** 基于文件路径或文件对象创建RandomAccessFile文件对象。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|file|String|是|-|已打开的File对象。|
|mode|Int64|否|0|**命名参数。** 创建文件RandomAccessFile对象的[选项](#enum-openmode)，仅当传入文件沙箱路径时生效，必须指定如下选项中的一个，默认以只读方式创建：<br/>-&nbsp;OpenMode.READ_ONLY(0o0)：只读创建。<br/>-&nbsp;OpenMode.WRITE_ONLY(0o1)：只写创建。<br/>-&nbsp;OpenMode.READ_WRITE(0o2)：读写创建。<br/>给定如下功能选项，以按位或的方式追加，默认不给定任何额外选项：<br/>-&nbsp;OpenMode.CREATE(0o100)：若文件不存在，则创建文件。<br/>-&nbsp;OpenMode.TRUNC(0o1000)：如果RandomAccessFile对象存在且文件具有写权限，则将其长度裁剪为零。<br/>-&nbsp;OpenMode.APPEND(0o2000)：以追加方式打开，后续写将追加到RandomAccessFile对象末尾。<br/>-&nbsp;OpenMode.NONBLOCK(0o4000)：如果path指向FIFO、块特殊文件或字符特殊文件，则本次打开及后续&nbsp;IO&nbsp;进行非阻塞操作。<br/>-&nbsp;OpenMode.DIR(0o200000)：如果path不指向目录，则出错。不允许附加写权限。<br/>-&nbsp;OpenMode.NOFOLLOW(0o400000)：如果path指向符号链接，则出错。<br/>-&nbsp;OpenMode.SYNC(0o4010000)：以同步IO的方式创建RandomAccessFile对象。|

**返回值：**

|类型|说明|
|:----|:----|
|[RandomAccessFile](#class-randomaccessfile)|返回RandomAccessFile文件对象。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let file = FileFs.open(filePath, mode: (OpenMode.CREATE.mode | READ_WRITE.mode))
FileFs.write(file.fd, "hello world")
FileFs.fdatasync(file.fd)
let randomAccessFile = FileFs.createRandomAccessFile(file)
randomAccessFile.close()
```

### static func createRandomAccessFile(File, Int64)

```cangjie
public static func createRandomAccessFile(file: File, mode!: Int64 = 0): RandomAccessFile
```

**功能：** 基于文件路径或文件对象创建RandomAccessFile文件对象。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|file|[File](#class-file)|是|-|已打开的File对象。|
|mode|Int64|否|0|**命名参数。** 创建文件RandomAccessFile对象的[选项](#enum-openmode)，仅当传入文件沙箱路径时生效，必须指定如下选项中的一个，默认以只读方式创建：<br/>-&nbsp;OpenMode.READ_ONLY(0o0)：只读创建。<br/>-&nbsp;OpenMode.WRITE_ONLY(0o1)：只写创建。<br/>-&nbsp;OpenMode.READ_WRITE(0o2)：读写创建。<br/>给定如下功能选项，以按位或的方式追加，默认不给定任何额外选项：<br/>-&nbsp;OpenMode.CREATE(0o100)：若文件不存在，则创建文件。<br/>-&nbsp;OpenMode.TRUNC(0o1000)：如果RandomAccessFile对象存在且文件具有写权限，则将其长度裁剪为零。<br/>-&nbsp;OpenMode.APPEND(0o2000)：以追加方式打开，后续写将追加到RandomAccessFile对象末尾。<br/>-&nbsp;OpenMode.NONBLOCK(0o4000)：如果path指向FIFO、块特殊文件或字符特殊文件，则本次打开及后续&nbsp;IO&nbsp;进行非阻塞操作。<br/>-&nbsp;OpenMode.DIR(0o200000)：如果path不指向目录，则出错。不允许附加写权限。<br/>-&nbsp;OpenMode.NOFOLLOW(0o400000)：如果path指向符号链接，则出错。<br/>-&nbsp;OpenMode.SYNC(0o4010000)：以同步IO的方式创建RandomAccessFile对象。|

**返回值：**

|类型|说明|
|:----|:----|
|[RandomAccessFile](#class-randomaccessfile)|返回RandomAccessFile文件对象。|

### static func createStream(String, String)

```cangjie
public static func createStream(path: String, mode: String): Stream
```

**功能：** 基于文件路径创建文件流。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|path|String|是|-|文件的应用沙箱路径。|
|mode|String|是|-|-&nbsp;r：打开只读文件，该文件必须存在。<br/>-&nbsp;r+：打开可读写的文件，该文件必须存在。<br/>-&nbsp;w：打开只写文件，若文件存在则文件长度清0，即该文件内容会消失。若文件不存在则建立该文件。<br/>-&nbsp;w+：打开可读写文件，若文件存在则文件长度清0，即该文件内容会消失。若文件不存在则建立该文件。<br/>-&nbsp;a：以附加的方式打开只写文件。若文件不存在，则会建立该文件，如果文件存在，写入的数据会被加到文件尾，即文件原先的内容会被保留。<br/>-&nbsp;a+：以附加方式打开可读写的文件。若文件不存在，则会建立该文件，如果文件存在，写入的数据会被加到文件尾后，即文件原先的内容会被保留。|

**返回值：**

|类型|说明|
|:----|:----|
|[Stream](#class-stream)|返回文件流的结果。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*
import kit.PerformanceAnalysisKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let stream = FileFs.createStream(filePath, "r+")
AppLog.info("createStream succeed")
stream.close()
```

### static func dup(Int32)

```cangjie
public static func dup(fd: Int32): File
```

**功能：** 将文件描述符转化为File。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fd|Int32|是|-|文件描述符。|

**返回值：**

|类型|说明|
|:----|:----|
|[File](#class-file)|打开的File对象。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*
import kit.PerformanceAnalysisKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let file1 = FileFs.open(filePath, mode: (READ_WRITE.mode | CREATE.mode))
let fd = file1.fd
let file2 = FileFs.dup(fd)
AppLog.info("The name of the file2 is " + file2.name)
FileFs.close(file1)
FileFs.close(file2)
```

### static func fdatasync(Int32)

```cangjie
public static func fdatasync(fd: Int32): Unit
```

**功能：** 以同步方法实现文件内容数据同步。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fd|Int32|是|-|已打开的文件描述符。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let file = FileFs.open(filePath)
FileFs.fdatasync(file.fd)
FileFs.close(file)
```

### static func fdopenStream(Int32, String)

```cangjie
public static func fdopenStream(fd: Int32, mode: String): Stream
```

**功能：** 以同步方法基于文件描述符打开文件流。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fd|Int32|是|-|已打开的文件描述符。|
|mode|String|是|-|-&nbsp;r：打开只读文件，该文件必须存在。<br/>-&nbsp;r+：打开可读写的文件，该文件必须存在。<br/>-&nbsp;w：打开只写文件，若文件存在原文件内容将被覆盖。<br/>-&nbsp;w+：打开可读写文件，若文件存在原文件内容将被覆盖。<br/>-&nbsp;a：以附加的方式打开只写文件，写入的数据会被加到文件尾，即文件原先的内容会被保留。<br/>-&nbsp;a+：以附加方式打开可读写的文件，写入的数据会被加到文件尾后，即文件原先的内容会被保留。|

**返回值：**

|类型|说明|
|:----|:----|
|[Stream](#class-stream)|返回文件流的结果。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let file = FileFs.open(filePath, mode: (READ_ONLY.mode | CREATE.mode))
let stream = FileFs.fdopenStream(file.fd, "r+")
FileFs.close(file)
stream.close()
```

### static func fsync(Int32)

```cangjie
public static func fsync(fd: Int32): Unit
```

**功能：** 以同步方法同步文件数据。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fd|Int32|是|-|已打开的文件描述符。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let file = FileFs.open(filePath)
FileFs.fsync(file.fd)
FileFs.close(file)
```

### static func listFile(String, ListFileOptions)

```cangjie
public static func listFile(path: String, options!: ListFileOptions = ListFileOptions()): Array<String>
```

**功能：** 以同步方式列出文件夹下所有文件名，支持递归列出所有文件名（包含子目录下），支持文件过滤。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|path|String|是|-|文件夹的应用沙箱路径。|
|options|[ListFileOptions](#struct-listfileoptions)|否|ListFileOptions()|**命名参数。** 文件过滤选项。默认不进行过滤。|

**options参数说明：**

| 参数名    | 类型     | 必填   | 说明                          |
| :------ | :------ | :---- | :--------------------------- |
| recursion | Bool | 否    | 是否递归子目录下文件名，默认为false。当recursion为false时，返回当前目录下满足过滤要求的文件名及文件夹名。当recursion为true时，返回此目录下所有满足过滤要求的文件的相对路径（以/开头）。 |
| listNum | Int32 | 否    | 列出文件名数量。当设置0时，列出所有文件，默认为0。 |
| filter | [Filter](#struct-filter) | 否    |文件过滤选项。当前仅支持后缀名匹配、文件名模糊查询、文件大小过滤、最近修改时间过滤。|

**返回值：**

|类型|说明|
|:----|:----|
|Array\<String>|返回文件名数组。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*
import kit.PerformanceAnalysisKit.*

let pathDir = "path/to/file"
let filter = Filter(suffix: [".png", ".jpg", ".jpeg"], displayName: ["*abc", "efg*"])
let listFileOptions = ListFileOptions(recursion: false, listNum: 0, filter: filter)
let filenames = FileFs.listFile(pathDir, options: listFileOptions)
for (name in filenames) {
  AppLog.info(name)
}
```

### static func lseek(Int32, Int64, WhenceType)

```cangjie
public static func lseek(fd: Int32, offset: Int64, whence!: WhenceType = SEEK_SET): Int64
```

**功能：** 调整文件偏置指针位置。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fd|Int32|是|-|文件描述符。|
|offset|Int64|是|-|相对偏移位置。|
|whence|[WhenceType](#enum-whencetype)|否|SEEK_SET|**命名参数。** 偏移指针相对位置类型。|

**返回值：**

|类型|说明|
|:----|:----|
|Int64|当前文件偏置指针位置（相对于文件头的偏移量）。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*
import kit.PerformanceAnalysisKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let file = FileFs.open(filePath, mode: CREATE.mode)
let offset = FileFs.lseek(file.fd, 5, whence: WhenceType.SEEK_SET)
AppLog.info("The current offset is at " + offset.toString())
FileFs.close(file)
```

### static func lstat(String)

```cangjie
public static func lstat(path: String): Stat
```

**功能：** 以同步方法获取链接文件信息。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|path|String|是|-|文件的应用沙箱路径。|

**返回值：**

|类型|说明|
|:----|:----|
|[Stat](#class-stat)|表示文件的具体信息。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/linkToFile"
let fileStat = FileFs.lstat(filePath)
```

### static func mkdir(String)

```cangjie
public static func mkdir(path: String): Unit
```

**功能：** 创建目录。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|path|String|是|-|目录的应用沙箱路径。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let dirPath = pathDir + "/testDir1/testDir2/testDir3"
FileFs.mkdir(dirPath)
```

### static func mkdir(String, Bool)

```cangjie
public static func mkdir(path: String, recursion: Bool): Unit
```

**功能：** 创建目录。当recursion指定为true，可多层级创建目录。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|path|String|是|-|目录的应用沙箱路径。|
|recursion|Bool|是|-|是否多层级创建目录。`recursion`指定为`true`时，可多层级创建目录。`recursion`指定为`false`时，仅可创建单层目录。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let dirPath = pathDir + "/testDir1/testDir2/testDir3"
FileFs.mkdir(dirPath, true)
```

### static func mkdtemp(String)

```cangjie
public static func mkdtemp(prefix: String): String
```

**功能：** 以同步的方法创建临时目录。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|prefix|String|是|-|指定目录路径，命名时需要以"XXXXXX"作为结尾。路径末尾的"XXXXXX"字符串将被替换为随机字符，以创建唯一的目录名。|

**返回值：**

|类型|说明|
|:----|:----|
|String|产生的唯一目录路径。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let res = FileFs.mkdtemp(pathDir + "/XXXXXX")
```

### static func moveDir(String, String, Int32)

```cangjie
public static func moveDir(src: String, dest: String, mode!: Int32 = 0): Unit
```

**功能：** 移动源文件夹至目标路径下。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|src|String|是|-|源文件夹的应用沙箱路径。|
|dest|String|是|-|目标文件夹的应用沙箱路径。|
|mode|Int32|否|0| **命名参数。** 移动模式。默认mode为0。<br/>-&nbsp;mode为0，文件夹级别抛异常。若目标文件夹下存在与源文件夹名冲突的同名非空文件夹，则抛出异常。<br/>-&nbsp;mode为1，文件级别抛异常。目标文件夹下存在与源文件夹名冲突的文件夹，若冲突文件夹下存在同名文件，则抛出异常。源文件夹下未冲突的文件全部移动至目标文件夹下，目标文件夹下未冲突文件将继续保留，且冲突文件信息将在抛出异常(ConfilictFileException)的data属性中以Array\<ConflictFiles>形式提供。<br/>-&nbsp; mode为2，文件级别强制覆盖。目标文件夹下存在与源文件夹名冲突的文件夹，若冲突文件夹下存在同名文件，则强制覆盖冲突文件夹下所有同名文件，未冲突文件将继续保留。<br/>-&nbsp; mode为3，文件夹级别强制覆盖。移动源文件夹至目标文件夹下，目标文件夹下移动的文件夹内容与源文件夹完全一致。若目标文件夹下存在与源文件夹名冲突的文件夹，该文件夹下所有原始文件将不会保留。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
// move directory from srcPath to destPath
let srcPath = pathDir + "/srcDir/"
let destPath = pathDir + "/destDir/"
FileFs.moveDir(srcPath, destPath, mode: 1)
```

### static func moveFile(String, String, Int32)

```cangjie
public static func moveFile(src: String, dest: String, mode!: Int32 = 0): Unit
```

**功能：** 以同步方式移动文件。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|src|String|是|-|源文件的应用沙箱路径。|
|dest|String|是|-|目的文件的应用沙箱路径。|
|mode|Int32|否|0| **命名参数。** 移动模式。若mode为0，移动位置存在同名文件时，强制移动覆盖。若mode为1，移动位置存在同名文件时，抛出异常。默认为0。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*
import kit.PerformanceAnalysisKit.*

let pathDir = "path/to/file"
let srcPath = pathDir + "/srcDir/"
let destPath = pathDir + "/destDir/"
FileFs.moveFile(srcPath, destPath, mode: 0)
AppLog.info("move file succeed")
```

### static func open(String, Int64)

```cangjie
public static func open(path: String, mode!: Int64 = READ_ONLY.mode): File
```

**功能：** 以同步方法打开文件。支持使用URI打开文件。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|path|String|是|-|打开文件的应用沙箱路径或URI。|
|mode|Int64|否|READ_ONLY.mode|**命名参数。** 打开文件的[选项](#enum-openmode)，必须指定如下选项中的一个，默认以只读方式打开：<br/>-&nbsp;OpenMode.READ_ONLY(0o0)：只读打开。<br/>-&nbsp;OpenMode.WRITE_ONLY(0o1)：只写打开。<br/>-&nbsp;OpenMode.READ_WRITE(0o2)：读写打开。<br/>给定如下功能选项，以按位或的方式追加，默认不给定任何额外选项：<br/>-&nbsp;OpenMode.CREATE(0o100)：若文件不存在，则创建文件。<br/>-&nbsp;OpenMode.TRUNC(0o1000)：如果文件存在且文件具有写权限，则将其长度裁剪为零。<br/>-&nbsp;OpenMode.APPEND(0o2000)：以追加方式打开，后续写将追加到文件末尾。<br/>-&nbsp;OpenMode.NONBLOCK(0o4000)：如果path指向FIFO、块特殊文件或字符特殊文件，则本次打开及后续&nbsp;IO&nbsp;进行非阻塞操作。<br/>-&nbsp;OpenMode.DIR(0o200000)：如果path不指向目录，则出错。不允许附加写权限。<br/>-&nbsp;OpenMode.NOFOLLOW(0o400000)：如果path指向符号链接，则出错。<br/>-&nbsp;OpenMode.SYNC(0o4010000)：以同步IO的方式打开文件。|

**返回值：**

|类型|说明|
|:----|:----|
|[File](#class-file)|打开的File对象。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*
import kit.PerformanceAnalysisKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let file = FileFs.open(filePath, mode: (READ_WRITE.mode | CREATE.mode))
AppLog.info("open file success, file fd: " + file.fd.toString())
FileFs.close(file)
```

### static func read(Int32, Array\<Byte>, ReadOptions)

```cangjie
public static func read(fd: Int32, buffer: Array<Byte>, options!: ReadOptions = ReadOptions()): Int64
```

**功能：** 以同步方法从文件读取数据。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fd|Int32|是|-|已打开的文件描述符。|
|buffer|Array\<Byte>|是|-|用于保存读取到的文件数据的缓冲区。|
|options|[ReadOptions](#struct-readoptions)|否|ReadOptions()| **命名参数。** 支持如下选项：<br/>-&nbsp;offset，Int64类型，表示期望读取文件的位置。默认从当前位置开始读。<br/>-&nbsp;length，UIntNative类型，表示期望读取数据的长度。默认缓冲区长度。|

**返回值：**

|类型|说明|
|:----|:----|
|Int64|返回实际读取的长度。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let file = FileFs.open(filePath, mode: (READ_WRITE.mode | CREATE.mode))
let buf = Array<Byte>(4096, repeat: 0)
FileFs.read(file.fd, buf)
FileFs.close(file)
```

### static func readLines(String, Options)

```cangjie
public static func readLines(filePath: String, options!: Options = Options()): ReaderIterator
```

**功能：** 以同步方式逐行读取文件文本内容。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|filePath|String|是|-|文件的应用沙箱路径。|
|options|[Options](#struct-options)|否|Options()|**命名参数。** 可选项。支持以下选项：<br/>-&nbsp;encoding，String类型，当数据是&nbsp;String&nbsp;类型时有效，表示数据的编码方式，默认&nbsp;"utf-8"，仅支持&nbsp;"utf-8"。|

**返回值：**

|类型|说明|
|:----|:----|
|[ReaderIterator](#class-readeriterator)|返回文件读取迭代器。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*
import kit.PerformanceAnalysisKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let options: Options = Options(encoding: "utf-8")
let readerIterator = FileFs.readLines(filePath, options: options)
var result = readerIterator.next()
```

### static func readText(String, ReadTextOptions)

```cangjie
public static func readText(filePath: String, option!: ReadTextOptions = ReadTextOptions()): String
```

**功能：** 以同步方法基于文本方式读取文件（即直接读取文件的文本内容）。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|filePath|String|是|-|文件的应用沙箱路径。|
|option|[ReadTextOptions](#struct-readtextoptions)|否|ReadTextOptions()|**命名参数。** 支持如下选项：<br/>-&nbsp;offset，Int64类型，表示期望读取文件的位置。可选，默认从初始位置开始读取。<br/>-&nbsp;length，Int64类型，表示期望读取数据的长度。可选，默认文件长度。<br/>-&nbsp;encoding，String类型，当数据是&nbsp;String&nbsp;类型时有效，表示数据的编码方式，默认&nbsp;"utf-8"，仅支持&nbsp;"utf-8"。|

**返回值：**

|类型|说明|
|:----|:----|
|String|返回读取文件的内容。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let str = FileFs.readText(filePath)
```

### static func rename(String, String)

```cangjie
public static func rename(oldPath: String, newPath: String): Unit
```

**功能：** 重命名文件或文件夹。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|oldPath|String|是|-|文件的应用沙箱原路径。|
|newPath|String|是|-|文件的应用沙箱新路径。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let srcFile = pathDir + "/test.txt"
let dstFile = pathDir + "/new.txt"
FileFs.rename(srcFile, dstFile)
```

### static func rmdir(String)

```cangjie
public static func rmdir(path: String): Unit
```

**功能：** 删除目录。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|path|String|是|-|目录的应用沙箱路径。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let dirPath = pathDir + "/testDir"
FileFs.rmdir(dirPath)
```

### static func stat(Int32)

```cangjie
public static func stat(file: Int32): Stat
```

**功能：** 获取文件详细属性信息。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|file|Int32|是|-|已打开的文件描述符fd。|

**返回值：**

|类型|说明|
|:----|:----|
|[Stat](#class-stat)|表示文件的具体信息。|

### static func stat(String)

```cangjie
public static func stat(file: String): Stat
```

**功能：** 获取文件详细属性信息。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|file|String|是|-|文件应用沙箱路径path。|

**返回值：**

|类型|说明|
|:----|:----|
|[Stat](#class-stat)|表示文件的具体信息。|

### static func truncate(String, Int64)

```cangjie
public static func truncate(file: String, len!: Int64 = 0): Unit
```

**功能：** 以同步方法截断文件。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|file|String|是|-|文件的应用沙箱路径。|
|len|Int64|否|0| **命名参数。** 文件截断后的长度，以字节为单位。默认为0。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let len: Int64 = 5
FileFs.truncate(filePath, len: len)
```

### static func truncate(Int32, Int64)

```cangjie
public static func truncate(file: Int32, len!: Int64 = 0): Unit
```

**功能：** 以同步方法截断文件。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|file|Int32|是|-|已打开的文件描述符fd。|
|len|Int64|否|0| **命名参数。** 文件截断后的长度，以字节为单位。默认为0。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let len: Int64 = 5
let file  = FileFs.open(filePath, mode: READ_WRITE.mode)
FileFs.truncate(file.fd, len: len)
```

### static func unlink(String)

```cangjie
public static func unlink(path: String): Unit
```

**功能：** 删除文件。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|path|String|是|-|文件的应用沙箱路径。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
FileFs.unlink(filePath)
```

### static func utimes(String, Float64)

```cangjie
public static func utimes(path: String, mtime: Float64): Unit
```

**功能：** 修改文件最近访问时间属性。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|path|String|是|-|文件的应用沙箱路径。|
|mtime|Float64|是|-|待更新的时间戳。自1970年1月1日起至目标时间的毫秒数。仅支持修改文件最近访问时间属性。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*
import std.time.DateTime

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let file = FileFs.open(filePath, mode: (CREATE.mode | READ_WRITE.mode))
FileFs.write(file.fd, "test data")
FileFs.close(file)
FileFs.utimes(filePath, Float64(DateTime.UnixEpoch.second))
```

### static func write(Int32, Array\<Byte>, WriteOptions)

```cangjie
public static func write(fd: Int32, buffer: Array<Byte>, options!: WriteOptions = WriteOptions()): Int64
```

**功能：** 以同步方法将数据写入文件。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fd|Int32|是|-|已打开的文件描述符。|
|buffer|Array\<Byte>|是|-|待写入文件的数据，来自字符串。|
|options|[WriteOptions](#struct-writeoptions)|否|WriteOptions()|**命名参数。** 支持如下选项：<br/>-&nbsp;offset，?Int64类型，表示期望写入文件的位置。可选，默认从当前位置开始写。<br/>-&nbsp;length，?UIntNative类型，表示期望写入数据的长度。可选，默认缓冲区长度。<br/>-&nbsp;encoding，String类型，当数据是String类型时有效，表示数据的编码方式，默认&nbsp;"utf-8"。当前仅支持&nbsp;"utf-8"。|

**返回值：**

|类型|说明|
|:----|:----|
|Int64|实际写入的长度。|

### static func write(Int32, String, WriteOptions)

```cangjie
public static func write(fd: Int32, buffer: String, options!: WriteOptions = WriteOptions()): Int64
```

**功能：** 以同步方法将数据写入文件。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fd|Int32|是|-|已打开的文件描述符。|
|buffer|String|是|-|待写入文件的数据，来自字符串。|
|options|[WriteOptions](#struct-writeoptions)|否|WriteOptions()|**命名参数。** 支持如下选项：<br/>-&nbsp;offset，?Int64类型，表示期望写入文件的位置。可选，默认从当前位置开始写。<br/>-&nbsp;length，?UIntNative类型，表示期望写入数据的长度。可选，默认缓冲区长度。<br/>-&nbsp;encoding，String类型，当数据是String类型时有效，表示数据的编码方式，默认&nbsp;"utf-8"。当前仅支持&nbsp;"utf-8"。|

**返回值：**

|类型|说明|
|:----|:----|
|Int64|实际写入的长度。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let file = FileFs.open(filePath, mode: (CREATE.mode | READ_WRITE.mode))
let str = "hello, world"
let writeLen = FileFs.write(file.fd, str)
FileFs.close(file)
```

## class RandomAccessFile

```cangjie
public class RandomAccessFile {}
```

**功能：** 随机读写文件流。在调用RandomAccessFile的方法前，需要先通过[createRandomAccessFile](#static-func-createrandomaccessfilefile-int64)方法来构建一个RandomAccessFile实例。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### prop fd

```cangjie
public prop fd: Int32
```

**功能：** 打开的文件描述符。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### prop filePointer

```cangjie
public prop filePointer: Int64
```

**功能：** RandomAccessFile对象的偏置指针。

**类型：** Int64

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### func close()

```cangjie
public func close(): Unit
```

**功能：** 同步关闭RandomAccessFile对象。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let randomAccessFile = FileFs.createRandomAccessFile(filePath, mode: (CREATE.mode | READ_WRITE.mode))
randomAccessFile.close()
```

### func read(Array\<Byte>, ReadOptions)

```cangjie
public func read(buffer: Array<Byte>, readOptions!: ReadOptions = ReadOptions()): Int64
```

**功能：** 以同步方法从文件读取数据。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|buffer|Array\<Byte>|是|-|用于读取文件的缓冲区。|
|readOptions|[ReadOptions](#struct-readoptions)|否|ReadOptions()|**命名参数。** 支持如下选项：<br>- length，?UIntNative类型，表示期望读取数据的长度。可选，默认缓冲区长度。<br>- offset，?Int64类型，表示期望读取文件的位置。可选，默认从当前位置开始读。|

**返回值：**

|类型|说明|
|:----|:----|
|Int64|实际读取的长度。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let file = FileFs.open(filePath, mode: (CREATE.mode | READ_WRITE.mode))
let randomAccessFile = FileFs.createRandomAccessFile(file)
let length: Int64 = 4096
let arrayBuffer = Array<Byte>(length, repeat: 0)
let readLength = randomAccessFile.read(arrayBuffer)
randomAccessFile.close()
FileFs.close(file)
```

### func setFilePointer(Int64)

```cangjie
public func setFilePointer(fp: Int64): Unit
```

**功能：** 设置文件偏置指针。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fp|Int64|是|-|RandomAccessFile对象的偏置指针。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let randomAccessFile = FileFs.createRandomAccessFile(filePath, mode: (CREATE.mode | READ_WRITE.mode))
randomAccessFile.setFilePointer(1)
randomAccessFile.close()
```

### func write(String, WriteOptions)

```cangjie
public func write(buffer: String, writeOptions!: WriteOptions = WriteOptions()): Int64
```

**功能：** 以同步方法将数据写入文件。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|buffer|String|是|-|待写入文件的数据。|
|writeOptions|[WriteOptions](#struct-writeoptions)|否|WriteOptions()|**命名参数。** 支持如下选项：<br>- length，?UIntNative类型，表示期望写入数据的长度。默认缓冲区长度。<br>- offset，?Int64类型，表示期望写入文件的位置。可选，默认从当前位置开始写。<br>- encoding，String类型，当数据是String类型时有效，表示数据的编码方式，默认"utf-8"。仅支持"utf-8"。|

**返回值：**

|类型|说明|
|:----|:----|
|Int64|实际写入的长度。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let randomAccessFile = FileFs.createRandomAccessFile(filePath,
    mode: (CREATE.mode | READ_WRITE.mode))
let option = WriteOptions(length: 5, offset: 5)
let bytesWritten = randomAccessFile.write("hello, world", writeOptions: option)
randomAccessFile.close()
```

### func write(Array\<Byte>, WriteOptions)

```cangjie
public func write(buffer: Array<Byte>, writeOptions!: WriteOptions = WriteOptions()): Int64
```

**功能：** 以同步方法将数据写入文件。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|buffer|Array\<Byte>|是|-|待写入文件的数据。|
|writeOptions|[WriteOptions](#struct-writeoptions)|否|WriteOptions()|**命名参数。** 支持如下选项：<br>- length，?UIntNative类型，表示期望写入数据的长度。默认缓冲区长度。<br>- offset，?Int64类型，表示期望写入文件的位置。可选，默认从当前位置开始写。<br>- encoding，String类型，当数据是String类型时有效，表示数据的编码方式，默认"utf-8"。仅支持"utf-8"。|

**返回值：**

|类型|说明|
|:----|:----|
|Int64|实际写入的长度。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let randomAccessFile = FileFs.createRandomAccessFile(filePath, mode: (CREATE.mode | READ_WRITE.mode))
let option = WriteOptions(length: 5, offset: 5)
let arr: Array<UInt8> = [104, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100]
let bytesWritten = randomAccessFile.write(arr, writeOptions: option)
randomAccessFile.close()
```

## class ReaderIterator

```cangjie
public class ReaderIterator {}
```

**功能：** 文件读取迭代器。在调用ReaderIterator的方法前，需要先通过readLines方法来构建一个ReaderIterator实例。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### func next()

```cangjie
public func next(): ReaderIteratorResult
```

**功能：** 取迭代器下一项内容。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[ReaderIteratorResult](#struct-readeriteratorresult)|文件读取迭代器返回结果。|

## class Stat

```cangjie
public class Stat {}
```

**功能：** 文件具体信息。在调用Stat的方法前，需要先通过[FileFs.stat()](#static-func-statstring)方法来构建一个Stat实例。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### prop atime

```cangjie
public prop atime: Int64
```

**功能：** 上次访问该文件的时间，表示距1970年1月1日0时0分0秒的秒数。

**类型：** Int64

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### prop ctime

```cangjie
public prop ctime: Int64
```

**功能：** 最近改变文件状态的时间，表示距1970年1月1日0时0分0秒的秒数。

**类型：** Int64

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### prop gid

```cangjie
public prop gid: Int64
```

**功能：** 文件所有组的ID。

**类型：** Int64

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### prop ino

```cangjie
public prop ino: Int64
```

**功能：** 标识该文件。通常同设备上的不同文件的INO不同。

**类型：** Int64

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### prop mode

```cangjie
public prop mode: Int64
```

**功能：** 表示文件权限，各特征位的含义如下。

>**说明：**
>
>以下值为八进制，取得的返回值为十进制，请换算后查看。<br/>-&nbsp;0o400：用户读，对于普通文件，所有者可读取文件；对于目录，所有者可读取目录项。<br/>-&nbsp;0o200：用户写，对于普通文件，所有者可写入文件；对于目录，所有者可创建/删除目录项。<br/>-&nbsp;0o100：用户执行，对于普通文件，所有者可执行文件；对于目录，所有者可在目录中搜索给定路径名。<br/>-&nbsp;0o040：用户组读，对于普通文件，所有用户组可读取文件；对于目录，所有用户组可读取目录项。<br/>-&nbsp;0o020：用户组写，对于普通文件，所有用户组可写入文件；对于目录，所有用户组可创建/删除目录项。<br/>-&nbsp;0o010：用户组执行，对于普通文件，所有用户组可执行文件；对于目录，所有用户组是否可在目录中搜索给定路径名。<br/>-&nbsp;0o004：其他读，对于普通文件，其余用户可读取文件；对于目录，其他用户组可读取目录项。<br/>-&nbsp;0o002：其他写，对于普通文件，其余用户可写入文件；对于目录，其他用户组可创建/删除目录项。<br/>-&nbsp;0o001：其他执行，对于普通文件，其余用户可执行文件；对于目录，其他用户组可在目录中搜索给定路径名。

**类型：** Int64

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### prop mtime

```cangjie
public prop mtime: Int64
```

**功能：** 上次修改该文件的时间，表示距1970年1月1日0时0分0秒的秒数。

**类型：** Int64

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### prop size

```cangjie
public prop size: Int64
```

**功能：** 文件的大小，以字节为单位。仅对普通文件有效。

**类型：** Int64

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### prop uid

```cangjie
public prop uid: Int64
```

**功能：** 文件所有者的ID。

**类型：** Int64

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### func isBlockDevice()

```cangjie
public func isBlockDevice(): Bool
```

**功能：** 用于判断文件是否是块特殊文件。一个块特殊文件只能以块为粒度进行访问，且访问的时候带缓存。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|表示文件是否是块特殊设备。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let isBLockDevice = FileFs.stat(filePath).isBlockDevice()
```

### func isCharacterDevice()

```cangjie
public func isCharacterDevice(): Bool
```

**功能：** 用于判断文件是否是字符特殊文件。一个字符特殊设备可进行随机访问，且访问的时候不带缓存。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|表示文件是否是字符特殊设备。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let isCharacterDevice = FileFs.stat(filePath).isCharacterDevice()
```

### func isDirectory()

```cangjie
public func isDirectory(): Bool
```

**功能：** 用于判断文件是否是目录。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|表示文件是否是目录。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let dirPath = pathDir + "/test"
let isDirectory = FileFs.stat(dirPath).isDirectory()
```

### func isFIFO()

```cangjie
public func isFIFO(): Bool
```

**功能：** 用于判断文件是否是命名管道（有时也称为FIFO）。命名管道通常用于进程间通信。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|表示文件是否是&nbsp;FIFO。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let isFIFO = FileFs.stat(filePath).isFIFO()
```

### func isFile()

```cangjie
public func isFile(): Bool
```

**功能：** 用于判断文件是否是普通文件。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|表示文件是否是普通文件。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let isFile = FileFs.stat(filePath).isFile()
```

### func isSocket()

```cangjie
public func isSocket(): Bool
```

**功能：** 用于判断文件是否是套接字。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|表示文件是否是套接字。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let isSocket = FileFs.stat(filePath).isSocket()
```

### func isSymbolicLink()

```cangjie
public func isSymbolicLink(): Bool
```

**功能：** 用于判断文件是否是符号链接。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|表示文件是否是符号链接。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let isSymbolicLink = FileFs.stat(filePath).isSymbolicLink()
```

## class Stream

```cangjie
public class Stream {}
```

**功能：** 文件流。在调用Stream的方法前，需要先通过[FileFs.createStream](#static-func-createstreamstring-string)方法或者[FileFs.fdopenStream](#static-func-fdopenstreamint32-string)来构建一个Stream实例。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### func close()

```cangjie
public func close(): Unit
```

**功能：** 同步关闭文件流。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let stream = FileFs.createStream(filePath, "r+")
stream.close()
```

### func flush()

```cangjie
public func flush(): Unit
```

**功能：** 同步刷新文件流。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let stream = FileFs.createStream(filePath, "r+")
stream.flush()
stream.close()
```

### func read(Array\<Byte>, ReadOptions)

```cangjie
public func read(arrayBuffer: Array<Byte>, options!: ReadOptions = ReadOptions()): Int64
```

**功能：** 以同步方法从流文件读取数据。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|arrayBuffer|Array\<Byte>|是|-|用于读取文件的缓冲区。|
|options|[ReadOptions](#struct-readoptions)|否|ReadOptions()|**命名参数。** 支持如下选项：<br/>-&nbsp;length，UIntNative类型，表示期望读取数据的长度。可选，默认缓冲区长度。<br/>-&nbsp;offset，Int64类型，表示期望读取文件的位置。可选，默认从当前位置开始读。<br/>|

**返回值：**

|类型|说明|
|:----|:----|
|Int64|实际读取的长度。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let stream = FileFs.createStream(filePath, "r+")
let buf = Array<Byte>(4096, repeat: 0)
let num = stream.read(buf)
stream.close()
```

### func write(String, WriteOptions)

```cangjie
public func write(buffer: String, options!: WriteOptions = WriteOptions()): Int64
```

**功能：** 将数据写入流文件。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|buffer|String|是|-|待写入文件的数据。|
|options|[WriteOptions](#struct-writeoptions)|否|WriteOptions()|**命名参数。** 支持如下选项：<br/>-&nbsp;length，?UIntNative类型，表示期望写入数据的长度。默认缓冲区长度。<br/>-&nbsp;offset，?Int64类型，表示期望写入文件的位置。可选，默认从当前位置开始写。<br/>-&nbsp;encoding，String类型，当数据是String类型时有效，表示数据的编码方式，默认&nbsp;"utf-8"。仅支持&nbsp;"utf-8"。|

**返回值：**

|类型|说明|
|:----|:----|
|Int64|实际写入的长度。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let stream = FileFs.createStream(filePath, "r+")
let num = stream.write("hello, world")
stream.close()
```

### func write(Array\<Byte>, WriteOptions)

```cangjie
public func write(buffer: Array<Byte>, options!: WriteOptions = WriteOptions()): Int64
```

**功能：** 将数据写入流文件。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|buffer|Array\<Byte>|是|-|待写入文件的数据。|
|options|[WriteOptions](#struct-writeoptions)|否|WriteOptions()|**命名参数。** 支持如下选项：<br/>-&nbsp;length，?UIntNative类型，表示期望写入数据的长度。默认缓冲区长度。<br/>-&nbsp;offset，?Int64类型，表示期望写入文件的位置。可选，默认从当前位置开始写。<br/>-&nbsp;encoding，String类型，当数据是String类型时有效，表示数据的编码方式，默认&nbsp;"utf-8"。仅支持&nbsp;"utf-8"。|

**返回值：**

|类型|说明|
|:----|:----|
|Int64|实际写入的长度。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let stream = FileFs.createStream(filePath, "r+")
let arr: Array<UInt8> = [104, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100]
let num = stream.write(arr)
stream.close()
```

## struct ConflictFiles

```cangjie
public struct ConflictFiles {
    public ConflictFiles(
        public let srcFile: String,
        public let destFile: String
    )
}
```

**功能：** 冲突文件信息，支持copyDir及moveDir接口使用。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### let destFile

```cangjie
public let destFile: String
```

**功能：** 目标冲突文件路径。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### let srcFile

```cangjie
public let srcFile: String
```

**功能：** 源冲突文件路径。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### ConflictFiles(String, String)

```cangjie
public ConflictFiles(
    public let srcFile: String,
    public let destFile: String
)
```

**功能：** 构造ConflictFiles对象。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|srcFile|String|是|-|源冲突文件路径。|
|destFile|String|是|-|目标冲突文件路径。|

## struct Filter

```cangjie
public struct Filter {
    public Filter(
        public var suffix!: Array<String> = Array<String>(),
        public var displayName!: Array<String> = Array<String>(),
        public var mimeType!: Array<String> = Array<String>(),
        public var fileSizeOver!: ?Int64 = None,
        public var lastModifiedAfter!: ?Float64 = None,
        public var excludeMedia!: Bool = false
    )
}
```

**功能：** 文件过滤配置项类型，支持listFile接口使用。其中mimeType与excludeMedia过滤暂不支持。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### var displayName

```cangjie
public var displayName: Array<String> = Array<String>()
```

**功能：** 文件名模糊匹配，各个关键词OR关系。当前仅支持通配符*。

**类型：** Array\<String>

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### var excludeMedia

```cangjie
public var excludeMedia: Bool = false
```

**功能：** 是否排除Media中已有的文件。预留能力，暂不支持。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### var fileSizeOver

```cangjie
public var fileSizeOver: ?Int64 = None
```

**功能：** 文件大小匹配，大于指定大小的文件。

**类型：** ?Int64

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### var lastModifiedAfter

```cangjie
public var lastModifiedAfter: ?Float64 = None
```

**功能：** 文件最近修改时间匹配，在指定时间点之后的文件。

**类型：** ?Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### var mimeType

```cangjie
public var mimeType: Array<String> = Array<String>()
```

**功能：** mime类型完全匹配，各个关键词OR关系。预留能力，暂不支持。

**类型：** Array\<String>

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### var suffix

```cangjie
public var suffix: Array<String> = Array<String>()
```

**功能：** 文件后缀名完全匹配，各个关键词OR关系。

**类型：** Array\<String>

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### Filter(Array\<String>, Array\<String>, Array\<String>, ?Int64, ?Float64, Bool)

```cangjie
public Filter(
    public var suffix!: Array<String> = Array<String>(),
    public var displayName!: Array<String> = Array<String>(),
    public var mimeType!: Array<String> = Array<String>(),
    public var fileSizeOver!: ?Int64 = None,
    public var lastModifiedAfter!: ?Float64 = None,
    public var excludeMedia!: Bool = false
)
```

**功能：** 构造Filter对象。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|suffix|Array\<String>|否|Array\<String>()| **命名参数。** 文件后缀名完全匹配，各个关键词OR关系。|
|displayName|Array\<String>|否|Array\<String>()| **命名参数。** 文件名模糊匹配，各个关键词OR关系。当前仅支持通配符*。|
|mimeType|Array\<String>|否|Array\<String>()| **命名参数。** mime类型完全匹配，各个关键词OR关系。预留能力，暂不支持。|
|fileSizeOver|?Int64|否|None| **命名参数。** 文件大小匹配，大于指定大小的文件。|
|lastModifiedAfter|?Float64|否|None| **命名参数。** 文件最近修改时间匹配，在指定时间点之后的文件。|
|excludeMedia|Bool|否|false| **命名参数。** 是否排除Media中已有的文件。预留能力，暂不支持。|

## struct ListFileOptions

```cangjie
public struct ListFileOptions {
    public ListFileOptions(
        public let recursion!: Bool = false,
        public let listNum!: Int32 = 0,
        public let filter!: Filter = Filter()
    )
}
```

**功能：** 可选项类型，支持listFile接口使用。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### let filter

```cangjie
public let filter: Filter = Filter()
```

**功能：** 当数据是String类型时有效，表示数据的编码方式，默认"utf-8"。仅支持"utf-8"。

**类型：** [Filter](#struct-filter)

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### let listNum

```cangjie
public let listNum: Int32 = 0
```

**功能：** 列出文件名数量。当设置0时，列出所有文件，默认为0。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### let recursion

```cangjie
public let recursion: Bool = false
```

**功能：** 是否递归子目录下文件名。默认为false。当recursion为false时，返回当前目录下满足过滤要求的文件名及文件夹名。当recursion为true时，返回此目录下所有满足过滤要求的文件的相对路径（以/开头）。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### ListFileOptions(Bool, Int32, Filter)

```cangjie
public ListFileOptions(
   public let recursion!: Bool = false,
   public let listNum!: Int32 = 0,
   public let filter!: Filter = Filter()
)
```

**功能：** 构造ListFileOptions对象。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|recursion|Bool|否|false| **命名参数。** 是否递归子目录下文件名。默认为false。当recursion为false时，返回当前目录下满足过滤要求的文件名及文件夹名。当recursion为true时，返回此目录下所有满足过滤要求的文件的相对路径（以/开头）。|
|listNum|Int32|否|0| **命名参数。** 列出文件名数量。当设置0时，列出所有文件，默认为0。|
|filter|[Filter](#struct-filter)|否|Filter()| **命名参数。** 当数据是String类型时有效，表示数据的编码方式，默认"utf-8"。仅支持"utf-8"。|

## struct Options

```cangjie
public struct Options {
    public Options(public var encoding!: String = "utf-8")
}
```

**功能：** 可选项类型，支持readLines接口使用。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### var encoding

```cangjie
public var encoding: String = "utf-8"
```

**功能：** 文件编码方式。可选项。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### Options(String)

```cangjie
public Options(public var encoding!: String = "utf-8")
```

**功能：** 构造Options对象。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|encoding|String|否|"utf-8"|**命名参数。** 用于指定字符串的编码方式。|

## struct ReadOptions

```cangjie
public struct ReadOptions {
    public ReadOptions(
        public var length!: Option<UIntNative> = None,
        public var offset!: Option<Int64> = None
    )
}
```

**功能：** 可选项类型，支持read接口使用。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### var length

```cangjie
public var length: Option<UIntNative>= None
```

**功能：** 期望读取数据的长度。默认缓冲区长度。

**类型：** Option\<UIntNative>

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### var offset

```cangjie
public var offset: Option<Int64>= None
```

**功能：** 期望读取文件位置（基于当前filePointer加上offset的位置）。默认从偏置指针（filePointer）开始读。

**类型：** Option\<Int64>

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### ReadOptions(Option\<UIntNative>, Option\<Int64>)

```cangjie
public ReadOptions(
    public var length!: Option<UIntNative> = None,
    public var offset!: Option<Int64> = None
)
```

**功能：** 构造ReadOptions对象。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|length|Option\<UIntNative>|否|None| **命名参数。** 期望读取数据的长度。默认缓冲区长度。|
|offset|Option\<Int64>|否|None| **命名参数。** 期望读取文件位置（基于当前filePointer加上offset的位置）。默认从偏置指针（filePointer）开始读。|

## struct ReadTextOptions

```cangjie
public struct ReadTextOptions {
    public ReadTextOptions(
    public var length!: Option<Int64> = None,
    public var offset!: Int64 = 0,
    public var encoding!: String = "utf-8")
}
```

**功能：** 可选项类型，支持readText接口使用。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### var encoding

```cangjie
public var encoding: String = "utf-8"
```

**功能：** 当数据是String类型时有效，表示数据的编码方式，默认"utf-8"，仅支持"utf-8"。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### var length

```cangjie
public var length: Option<Int64>= None
```

**功能：** 期望读取数据的长度。默认文件长度。

**类型：** Option\<Int64>

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### var offset

```cangjie
public var offset: Int64 = 0
```

**功能：** 期望读取文件的位置。默认从当前位置开始读取。

**类型：** Int64

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### ReadTextOptions(Option\<Int64>, Int64, String)

```cangjie
public ReadTextOptions(
public var length!: Option<Int64> = None,
public var offset!: Int64 = 0,
public var encoding!: String = "utf-8")
```

**功能：** 构造ReadTextOptions对象。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|length|Option\<Int64>|否|None| **命名参数。** 期望读取数据的长度。默认文件长度。|
|offset|Int64|否|0| **命名参数。** 期望读取文件的位置。默认从当前位置开始读取。|
|encoding|String|否|"utf-8"| **命名参数。** 当数据是String类型时有效，表示数据的编码方式，默认"utf-8"，仅支持"utf-8"。|

## struct ReaderIteratorResult

```cangjie
public struct ReaderIteratorResult {}
```

**功能：** 文件读取迭代器返回结果，支持ReaderIterator接口使用。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### let done

```cangjie
public let done: Bool
```

**功能：** 迭代器是否已完成迭代。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### let value

```cangjie
public let value: String
```

**功能：** 逐行读取的文件文本内容。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

## struct WriteOptions

```cangjie
public struct WriteOptions {
    public WriteOptions(
    public var length!: Option<UIntNative> = None,
    public var offset!: Option<Int64> = None,
    public var encoding!: String = "utf-8")
}
```

**功能：** 可选项类型，支持write接口使用。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### var encoding

```cangjie
public var encoding: String = "utf-8"
```

**功能：** 当数据是String类型时有效，表示数据的编码方式，默认"utf-8"。仅支持"utf-8"。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### var length

```cangjie
public var length: Option<UIntNative>= None
```

**功能：** 期望写入数据的长度。默认缓冲区长度。

**类型：** Option\<UIntNative>

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### var offset

```cangjie
public var offset: Option<Int64>= None
```

**功能：** 期望写入文件位置（基于当前filePointer加上offset的位置）。默认从偏置指针（filePointer）开始写。

**类型：** Option\<Int64>

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### WriteOptions(Option\<UIntNative>, Option\<Int64>, String)

```cangjie
public WriteOptions(
    public var length!: Option<UIntNative> = None,
    public var offset!: Option<Int64> = None,
    public var encoding!: String = "utf-8"
)
```

**功能：** 构造WriteOptions对象。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|length|Option\<UIntNative>|否|None| **命名参数。** 期望写入数据的长度。默认缓冲区长度。|
|offset|Option\<Int64>|否|None| **命名参数。** 期望写入文件位置（基于当前filePointer加上offset的位置）。默认从偏置指针（filePointer）开始写。|
|encoding|String|否|"utf-8"| **命名参数。** 当数据是String类型时有效，表示数据的编码方式，默认"utf-8"。仅支持"utf-8"。|

## enum OpenMode

```cangjie
public enum OpenMode {
    | READ_ONLY
    | WRITE_ONLY
    | READ_WRITE
    | CREATE
    | TRUNC
    | APPEND
    | NONBLOCK
    | DIR
    | NOFOLLOW
    | SYNC
    | ...
}
```

**功能：** open接口flags参数常量。文件打开标签。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### APPEND

```cangjie
APPEND
```

**功能：** 以追加方式打开，后续写将追加到文件末尾。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### CREATE

```cangjie
CREATE
```

**功能：** 若文件不存在，则创建文件。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### DIR

```cangjie
DIR
```

**功能：** 如果path不指向目录，则出错。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### NOFOLLOW

```cangjie
NOFOLLOW
```

**功能：** 如果path指向符号链接，则出错。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### NONBLOCK

```cangjie
NONBLOCK
```

**功能：** 如果path指向FIFO、块特殊文件或字符特殊文件，则本次打开及后续IO进行非阻塞操作。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### READ_ONLY

```cangjie
READ_ONLY
```

**功能：** 只读打开。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### READ_WRITE

```cangjie
READ_WRITE
```

**功能：** 读写打开。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### SYNC

```cangjie
SYNC
```

**功能：** 以同步IO的方式打开文件。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### TRUNC

```cangjie
TRUNC
```

**功能：** 如果文件存在且以只写或读写的方式打开文件，则将其长度裁剪为零。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### WRITE_ONLY

```cangjie
WRITE_ONLY
```

**功能：** 只写打开。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### prop mode

```cangjie
public prop mode: Int64
```

**功能：** 获取文件打开标签类型对应具体数值。

**类型：** Int64

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

## enum WhenceType

```cangjie
public enum WhenceType {
    | SEEK_SET
    | SEEK_CUR
    | SEEK_END
    | ...
}
```

**功能：** 文件偏移指针相对偏移位置类型，支持lseek接口使用。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### SEEK_CUR

```cangjie
SEEK_CUR
```

**功能：** 当前文件偏置指针位置处。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### SEEK_END

```cangjie
SEEK_END
```

**功能：** 文件末尾位置处。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### SEEK_SET

```cangjie
SEEK_SET
```

**功能：** 文件起始位置处。

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21

### prop whenceType

```cangjie
public prop whenceType: Int32
```

**功能：** 获取该文件偏移指针相对偏移位置类型对应具体数值。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.File.FileIO

**起始版本：** 21
