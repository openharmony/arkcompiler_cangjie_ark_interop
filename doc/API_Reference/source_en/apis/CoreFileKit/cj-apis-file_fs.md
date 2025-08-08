# ohos.file_fs (File Management)

This module provides basic file operation APIs, offering fundamental file handling capabilities including file management, directory management, file information statistics, and stream-based file read/write operations.

## Import Module

```cangjie
import kit.CoreFileKit.*
```

## Usage Instructions

API sample code usage instructions:

- If the sample code has a "// index.cj" comment on the first line, it indicates that the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the aforementioned sample projects and configuration templates, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#仓颉示例代码说明).

## class ConflictFileException

```cangjie
public class ConflictFileException <: BusinessException {
    public let data: Array<ConflictFiles>
}
```

**Function:** Exception type, supports moveDir and copyDir operations.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parent Type:**

- [BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)

### let data

```cangjie
public let data: Array<ConflictFiles>
```

**Function:** Conflict file information.

**Type:** Array\<[ConflictFiles](#struct-conflictfiles)>

**Access:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

## class File

```cangjie
public class File {}
```

**Function:** File object opened via the open interface.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### prop fd

```cangjie
public prop fd: Int32
```

**Function:** Opened file descriptor.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### prop name

```cangjie
public prop name: String
```

**Function:** File name.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### prop path

```cangjie
public prop path: String
```

**Function:** File path.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### func getParent()

```cangjie
public func getParent(): String
```

**Function:** Gets the parent directory of the file corresponding to the File object.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Returns the parent directory path.|

**Example:**

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

**Function:** Applies a non-blocking shared or exclusive lock to the file.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|exclusive|Bool|No|false| **Named parameter.** Whether to apply an exclusive lock, default is false.|

**Example:**

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

**Function:** Unlocks the file synchronously.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Example:**

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

**Function:** File management utility class providing basic file operation capabilities.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### static func access(String)

```cangjie
public static func access(path: String): Bool
```

**Function:** Checks whether a file exists.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|path|String|Yes|-|Application sandbox path of the file.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the file exists; false otherwise.|

**Example:**

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

**Function:** Closes a file synchronously.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|file|Int32|Yes|-|An opened File object. After closing, the file object becomes meaningless and can no longer be used for read/write operations.|

**Example:**

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

**Function:** Closes a file synchronously.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| file | [File](#class-file) | Yes | - | The opened File object. After closing, the file object becomes meaningless and can no longer be used for read/write operations. |

**Example:**

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

**Function:** Copies the source directory to the target path.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| src | String | Yes | - | The application sandbox path of the source directory. |
| dest | String | Yes | - | The application sandbox path of the target directory. |
| mode | Int32 | No | 0 | **Named parameter.** Copy mode. Default mode is 0.<br/>- mode 0: Throws exceptions at the file level. If the target directory contains a conflicting folder with the same name as the source directory, and there are files with the same name in the conflicting folder, an exception will be thrown. Non-conflicting files from the source directory will be moved to the target directory, while non-conflicting files in the target directory will remain. Conflict file information will be provided in the `data` attribute of the thrown exception (ConfilictFileException) as an Array\<ConflictFiles>.<br/>- mode 1: Force overwrite at the file level. If the target directory contains a conflicting folder with the same name as the source directory, and there are files with the same name in the conflicting folder, all conflicting files will be forcibly overwritten, while non-conflicting files will remain. |

**Example:**

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

**Function:** Copies a file.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| src | String | Yes | - | The file descriptor of the source file to be copied. |
| dest | String | Yes | - | The file descriptor of the target file. |
| mode | Int32 | No | 0 | **Named parameter.** Provides options for overwriting files. Currently, only mode 0 is supported, and it is the default.<br/>0: Completely overwrites the target file, and any non-overwritten parts will be truncated. |

**Example:**

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

**Function:** Copies a file.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| src | String | Yes | - | The file descriptor of the source file to be copied. |
| dest | Int32 | Yes | - | The file descriptor of the target file. |
| mode | Int32 | No | 0 | **Named parameter.** Provides options for overwriting files. Currently, only mode 0 is supported, and it is the default.<br/>0: Completely overwrites the target file, and any non-overwritten parts will be truncated. |

### static func copyFile(Int32, String, Int32)

```cangjie
public static func copyFile(src: Int32, dest: String, mode!: Int32 = 0): Unit
```

**Function:** Copies a file.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| src | Int32 | Yes | - | The file descriptor of the source file to be copied. |
| dest | String | Yes | - | The file descriptor of the target file. |
| mode | Int32 | No | 0 | **Named parameter.** Provides options for overwriting files. Currently, only mode 0 is supported, and it is the default.<br/>0: Completely overwrites the target file, and any non-overwritten parts will be truncated. |

### static func copyFile(Int32, Int32, Int32)

```cangjie
public static func copyFile(src: Int32, dest: Int32, mode!: Int32 = 0): Unit
```

**Function:** Copies a file.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| src | Int32 | Yes | - | The file descriptor of the source file to be copied. |
| dest | Int32 | Yes | - | The file descriptor of the target file. |
| mode | Int32 | No | 0 | **Named parameter.** Provides options for overwriting files. Currently, only mode 0 is supported, and it is the default.<br/>0: Completely overwrites the target file, and any non-overwritten parts will be truncated. |

### static func createRandomAccessFile(String, Int64)

```cangjie
public static func createRandomAccessFile(file: String, mode!: Int64 = 0): RandomAccessFile
```

**Function:** Creates a RandomAccessFile object based on a file path or file object.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| file | String | Yes | - | The opened File object. |
| mode | Int64 | No | 0 | **Named parameter.** Options for creating the RandomAccessFile object ([OpenMode](#enum-openmode)). Only effective when a file sandbox path is provided. Must specify one of the following options, with read-only as the default:<br/>- OpenMode.READ_ONLY(0o0): Creates in read-only mode.<br/>- OpenMode.WRITE_ONLY(0o1): Creates in write-only mode.<br/>- OpenMode.READ_WRITE(0o2): Creates in read-write mode.<br/>Additional functional options can be appended using bitwise OR. By default, no additional options are specified:<br/>- OpenMode.CREATE(0o100): Creates the file if it does not exist.<br/>- OpenMode.TRUNC(0o1000): If the RandomAccessFile object exists and the file has write permissions, its length will be truncated to zero.<br/>- OpenMode.APPEND(0o2000): Opens in append mode, and subsequent writes will append to the end of the RandomAccessFile object.<br/>- OpenMode.NONBLOCK(0o4000): If the path points to a FIFO, block special file, or character special file, this open and subsequent I/O operations will be non-blocking.<br/>- OpenMode.DIR(0o200000): Throws an error if the path does not point to a directory. Write permissions cannot be appended.<br/>- OpenMode.NOFOLLOW(0o400000): Throws an error if the path points to a symbolic link.<br/>- OpenMode.SYNC(0o4010000): Creates the RandomAccessFile object in synchronous I/O mode. |

**Returns:**

| Type | Description |
|:----|:----|
| [RandomAccessFile](#class-randomaccessfile) | Returns the RandomAccessFile object. |

**Example:**

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

**Function:** Creates a RandomAccessFile object based on a file path or file object.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| file | [File](#class-file) | Yes | - | The opened File object. |
| mode | Int64 | No | 0 | **Named parameter.** Options for creating the RandomAccessFile object ([OpenMode](#enum-openmode)). Only effective when a file sandbox path is provided. Must specify one of the following options, with read-only as the default:<br/>- OpenMode.READ_ONLY(0o0): Creates in read-only mode.<br/>- OpenMode.WRITE_ONLY(0o1): Creates in write-only mode.<br/>- OpenMode.READ_WRITE(0o2): Creates in read-write mode.<br/>Additional functional options can be appended using bitwise OR. By default, no additional options are specified:<br/>- OpenMode.CREATE(0o100): Creates the file if it does not exist.<br/>- OpenMode.TRUNC(0o1000): If the RandomAccessFile object exists and the file has write permissions, its length will be truncated to zero.<br/>- OpenMode.APPEND(0o2000): Opens in append mode, and subsequent writes will append to the end of the RandomAccessFile object.<br/>- OpenMode.NONBLOCK(0o4000): If the path points to a FIFO, block special file, or character special file, this open and subsequent I/O operations will be non-blocking.<br/>- OpenMode.DIR(0o200000): Throws an error if the path does not point to a directory. Write permissions cannot be appended.<br/>- OpenMode.NOFOLLOW(0o400000): Throws an error if the path points to a symbolic link.<br/>- OpenMode.SYNC(0o4010000): Creates the RandomAccessFile object in synchronous I/O mode. |

**Returns:**

| Type | Description |
|:----|:----|
| [RandomAccessFile](#class-randomaccessfile) | Returns the RandomAccessFile object. |

### static func createStream(String, String)

```cangjie
public static func createStream(path: String, mode: String): Stream
```

**Function:** Creates a file stream based on a file path.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| path | String | Yes | - | The application sandbox path of the file. |
| mode | String | Yes | - | - r: Opens a read-only file; the file must exist.<br/>- r+: Opens a readable and writable file; the file must exist.<br/>- w: Opens a write-only file. If the file exists, its length will be cleared (content will be erased). If the file does not exist, it will be created.<br/>- w+: Opens a readable and writable file. If the file exists, its length will be cleared (content will be erased). If the file does not exist, it will be created.<br/>- a: Opens a write-only file in append mode. If the file does not exist, it will be created. If the file exists, data will be appended to the end (original content will be preserved).<br/>- a+: Opens a readable and writable file in append mode. If the file does not exist, it will be created. If the file exists, data will be appended to the end (original content will be preserved). |

**Returns:**

| Type | Description |
|:----|:----|
| [Stream](#class-stream) | Returns the file stream result. |

**Example:**

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

**Function:** Converts a file descriptor to a File object.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| fd | Int32 | Yes | - | The file descriptor. |

**Returns:**

| Type | Description |
|:----|:----|
| [File](#class-file) | The opened File object. |

**Example:**

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

**Function:** Synchronizes file content data using synchronous method.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| fd | Int32 | Yes | - | File descriptor of the opened file. |

**Example:**

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

**Function:** Opens a file stream based on file descriptor using synchronous method.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| fd | Int32 | Yes | - | File descriptor of the opened file. |
| mode | String | Yes | - | -&nbsp;r: Open file for reading only. The file must exist.<br/>-&nbsp;r+: Open file for reading and writing. The file must exist.<br/>-&nbsp;w: Open file for writing only. If the file exists, its contents will be overwritten.<br/>-&nbsp;w+: Open file for reading and writing. If the file exists, its contents will be overwritten.<br/>-&nbsp;a: Open file for appending (writing only). Data will be added to the end of the file, preserving existing contents.<br/>-&nbsp;a+: Open file for appending (reading and writing). Data will be added to the end of the file, preserving existing contents. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Stream](#class-stream) | Returns the file stream result. |

**Example:**

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

**Function:** Synchronizes file data using synchronous method.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| fd | Int32 | Yes | - | File descriptor of the opened file. |

**Example:**

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

**Function:** Lists all filenames in a directory synchronously, supports recursive listing (including subdirectories), and supports file filtering.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| path | String | Yes | - | Application sandbox path of the directory. |
| options | [ListFileOptions](#struct-listfileoptions) | No | ListFileOptions() | **Named parameter.** File filtering options. No filtering by default. |

**Options Parameter Description:**

| Parameter | Type | Required | Description |
|:------|:------|:----|:---------------------------|
| recursion | Bool | No | Whether to recursively list filenames in subdirectories. Default is false. When recursion is false, returns filenames and directory names in the current directory that meet filtering requirements. When recursion is true, returns relative paths (starting with /) of all files that meet filtering requirements in this directory. |
| listNum | Int32 | No | Number of filenames to list. When set to 0, lists all files. Default is 0. |
| filter | [Filter](#struct-filter) | No | File filtering options. Currently supports suffix matching, filename fuzzy search, file size filtering, and last modified time filtering. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<String> | Returns an array of filenames. |

**Example:**

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

**Function:** Adjusts the file offset pointer position.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| fd | Int32 | Yes | - | File descriptor. |
| offset | Int64 | Yes | - | Relative offset position. |
| whence | [WhenceType](#enum-whencetype) | No | SEEK_SET | **Named parameter.** Type of offset pointer relative position. |

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | Current file offset pointer position (offset relative to the file header). |

**Example:**

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

**Function:** Gets symbolic link file information synchronously.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| path | String | Yes | - | Application sandbox path of the file. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Stat](#class-stat) | Represents detailed file information. |

**Example:**

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

**Function:** Creates a directory.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| path | String | Yes | - | Application sandbox path of the directory. |

**Example:**

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

**Function:** Creates a directory. When recursion is set to true, multi-level directory creation is supported.**System Capability:** SystemCapability.FileManagement.File.FileIO  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| path | String | Yes | - | The application sandbox path of the directory. |  
| recursion | Bool | Yes | - | Whether to create directories recursively. When `recursion` is set to `true`, multi-level directories can be created. When `recursion` is set to `false`, only single-level directories can be created. |  

**Example:**  

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

**Function:** Creates a temporary directory synchronously.  

**System Capability:** SystemCapability.FileManagement.File.FileIO  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| prefix | String | Yes | - | Specifies the directory path, which must end with "XXXXXX". The "XXXXXX" at the end of the path will be replaced with random characters to create a unique directory name. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| String | The generated unique directory path. |  

**Example:**  

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

**Function:** Moves the source directory to the target path.  

**System Capability:** SystemCapability.FileManagement.File.FileIO  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| src | String | Yes | - | The application sandbox path of the source directory. |  
| dest | String | Yes | - | The application sandbox path of the target directory. |  
| mode | Int32 | No | 0 | **Named parameter.** The move mode. Default mode is 0. <br/>- When mode is 0, exceptions are thrown at the directory level. If a non-empty directory with the same name as the source directory exists in the target directory, an exception is thrown. <br/>- When mode is 1, exceptions are thrown at the file level. If a directory with the same name as the source directory exists in the target directory and there are conflicting files, an exception is thrown. Non-conflicting files from the source directory are moved to the target directory, and non-conflicting files in the target directory are retained. Conflict file information is provided in the `data` attribute of the thrown exception (ConfilictFileException) as an Array\<ConflictFiles>. <br/>- When mode is 2, files are forcibly overwritten at the file level. If a directory with the same name as the source directory exists in the target directory and there are conflicting files, all conflicting files are forcibly overwritten, and non-conflicting files are retained. <br/>- When mode is 3, directories are forcibly overwritten at the directory level. The moved directory in the target directory will be identical to the source directory. If a directory with the same name as the source directory exists in the target directory, all original files in that directory will not be retained. |  

**Example:**  

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

**Function:** Moves a file synchronously.  

**System Capability:** SystemCapability.FileManagement.File.FileIO  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| src | String | Yes | - | The application sandbox path of the source file. |  
| dest | String | Yes | - | The application sandbox path of the destination file. |  
| mode | Int32 | No | 0 | **Named parameter.** The move mode. If mode is 0, conflicting files at the destination are forcibly overwritten. If mode is 1, an exception is thrown when conflicting files exist at the destination. Default is 0. |  

**Example:**  

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

**Function:** Opens a file synchronously. Supports opening files using URIs.  

**System Capability:** SystemCapability.FileManagement.File.FileIO  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| path | String | Yes | - | The application sandbox path or URI of the file to open. |  
| mode | Int64 | No | READ_ONLY.mode | **Named parameter.** The [OpenMode](#enum-openmode) for opening the file. One of the following options must be specified. Default is read-only: <br/>- OpenMode.READ_ONLY(0o0): Opens the file in read-only mode. <br/>- OpenMode.WRITE_ONLY(0o1): Opens the file in write-only mode. <br/>- OpenMode.READ_WRITE(0o2): Opens the file in read-write mode. <br/>Additional options can be appended using bitwise OR. By default, no additional options are specified: <br/>- OpenMode.CREATE(0o100): Creates the file if it does not exist. <br/>- OpenMode.TRUNC(0o1000): Truncates the file to zero length if it exists and has write permissions. <br/>- OpenMode.APPEND(0o2000): Opens the file in append mode, with subsequent writes appended to the end. <br/>- OpenMode.NONBLOCK(0o4000): If the path points to a FIFO, block special file, or character special file, this open and subsequent I/O operations are non-blocking. <br/>- OpenMode.DIR(0o200000): Throws an error if the path does not point to a directory. Write permissions cannot be appended. <br/>- OpenMode.NOFOLLOW(0o400000): Throws an error if the path points to a symbolic link. <br/>- OpenMode.SYNC(0o4010000): Opens the file in synchronous I/O mode. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [File](#class-file) | The opened File object. |  

**Example:**  

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

**Function:** Reads data from a file synchronously.  

**System Capability:** SystemCapability.FileManagement.File.FileIO  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| fd | Int32 | Yes | - | The file descriptor of the opened file. |  
| buffer | Array\<Byte> | Yes | - | The buffer to store the read file data. |  
| options | [ReadOptions](#struct-readoptions) | No | ReadOptions() | **Named parameter.** Supports the following options: <br/>- offset, Int64 type, indicates the desired position to read from the file. Default is the current position. <br/>- length, UIntNative type, indicates the desired length of data to read. Default is the buffer length. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Int64 | The actual length of data read. |  

**Example:**  

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

**Function:** Reads the text content of a file line by line synchronously.  

**System Capability:** SystemCapability.FileManagement.File.FileIO  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| filePath | String | Yes | - | The application sandbox path of the file. |  
| options | [Options](#struct-options) | No | Options() | **Named parameter.** Optional. Supports the following options: <br/>- encoding, String type, valid when the data is of type String, indicates the encoding method of the data. Default is "utf-8". Only "utf-8" is supported. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [ReaderIterator](#class-readeriterator) | Returns a file reader iterator. |  

**Example:**  

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

**Function:** Reads the text content of a file synchronously (i.e., directly reads the text content of the file).  

**System Capability:** SystemCapability.FileManagement.File.FileIO  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| filePath | String | Yes | - | The application sandbox path of the file. |  
| option | [ReadTextOptions](#struct-readtextoptions) | No | ReadTextOptions() | **Named parameter.** Supports the following options: <br/>- offset, Int64 type, indicates the desired position to read from the file. Optional, default is the initial position. <br/>- length, Int64 type, indicates the desired length of data to read. Optional, default is the file length. <br/>- encoding, String type, valid when the data is of type String, indicates the encoding method of the data. Default is "utf-8". Only "utf-8" is supported. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| String | Returns the content of the file read. |  

**Example:**  

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

**Function:** Renames a file or directory.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| oldPath | String | Yes | - | Original application sandbox path of the file. |
| newPath | String | Yes | - | New application sandbox path of the file. |

**Example:**

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

**Function:** Deletes a directory.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| path | String | Yes | - | Application sandbox path of the directory. |

**Example:**

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

**Function:** Retrieves detailed attribute information of a file.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| file | Int32 | Yes | - | File descriptor fd of an opened file. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Stat](#class-stat) | Represents detailed file information. |

### static func stat(String)

```cangjie
public static func stat(file: String): Stat
```

**Function:** Retrieves detailed attribute information of a file.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| file | String | Yes | - | Application sandbox path of the file. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Stat](#class-stat) | Represents detailed file information. |

### static func truncate(String, Int64)

```cangjie
public static func truncate(file: String, len!: Int64 = 0): Unit
```

**Function:** Truncates a file synchronously.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| file | String | Yes | - | Application sandbox path of the file. |
| len | Int64 | No | 0 | **Named parameter.** Length of the file after truncation, in bytes. Defaults to 0. |

**Example:**

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

**Function:** Truncates a file synchronously.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| file | Int32 | Yes | - | File descriptor fd of an opened file. |
| len | Int64 | No | 0 | **Named parameter.** Length of the file after truncation, in bytes. Defaults to 0. |

**Example:**

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

**Function:** Deletes a file.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| path | String | Yes | - | Application sandbox path of the file. |

**Example:**

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

**Function:** Modifies the last access time attribute of a file.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| path | String | Yes | - | Application sandbox path of the file. |
| mtime | Float64 | Yes | - | Timestamp to update. Milliseconds from January 1, 1970 to the target time. Only supports modifying the last access time attribute. |

**Example:**

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

**Function:** Writes data to a file synchronously.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| fd | Int32 | Yes | - | File descriptor of an opened file. |
| buffer | Array\<Byte> | Yes | - | Data to be written to the file, from a string. |
| options | [WriteOptions](#struct-writeoptions) | No | WriteOptions() | **Named parameter.** Supports the following options: <br/>- offset, ?Int64 type, indicates the desired position to write in the file. Optional, defaults to the current position. <br/>- length, ?UIntNative type, indicates the desired length of data to write. Optional, defaults to the buffer length. <br/>- encoding, String type, valid when data is of String type, indicates the encoding method of the data, defaults to "utf-8". Currently only supports "utf-8". |

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | Actual length of data written. |

### static func write(Int32, String, WriteOptions)

```cangjie
public static func write(fd: Int32, buffer: String, options!: WriteOptions = WriteOptions()): Int64
```

**Function:** Writes data to a file synchronously.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| fd | Int32 | Yes | - | File descriptor of an opened file. |
| buffer | String | Yes | - | Data to be written to the file, from a string. |
| options | [WriteOptions](#struct-writeoptions) | No | WriteOptions() | **Named parameter.** Supports the following options: <br/>- offset, ?Int64 type, indicates the desired position to write in the file. Optional, defaults to the current position. <br/>- length, ?UIntNative type, indicates the desired length of data to write. Optional, defaults to the buffer length. <br/>- encoding, String type, valid when data is of String type, indicates the encoding method of the data, defaults to "utf-8". Currently only supports "utf-8". |

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | Actual length of data written. |**Return Value:**

| Type   | Description                  |
|:-------|:-----------------------------|
| Int64  | The actual length written.   |

**Example:**

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

**Function:** Random read/write file stream. Before calling methods of RandomAccessFile, you need to first construct a RandomAccessFile instance via the [createRandomAccessFile](#static-func-createrandomaccessfilefile-int64) method.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since Version:** 21

### prop fd

```cangjie
public prop fd: Int32
```

**Function:** The opened file descriptor.

**Type:** Int32

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since Version:** 21

### prop filePointer

```cangjie
public prop filePointer: Int64
```

**Function:** The offset pointer of the RandomAccessFile object.

**Type:** Int64

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since Version:** 21

### func close()

```cangjie
public func close(): Unit
```

**Function:** Synchronously closes the RandomAccessFile object.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since Version:** 21

**Example:**

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

**Function:** Reads data from a file synchronously.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since Version:** 21

**Parameters:**

| Parameter    | Type            | Required | Default Value | Description                                                                 |
|:-------------|:----------------|:---------|:--------------|:----------------------------------------------------------------------------|
| buffer       | Array\<Byte>    | Yes      | -             | Buffer for reading the file.                                                |
| readOptions  | [ReadOptions](#struct-readoptions) | No       | ReadOptions() | **Named parameter.** Supports the following options:<br>- length: ?UIntNative type, indicating the expected length of data to read. Optional, defaults to buffer length.<br>- offset: ?Int64 type, indicating the expected file position to read from. Optional, defaults to current position. |

**Return Value:**

| Type   | Description                  |
|:-------|:-----------------------------|
| Int64  | The actual length read.      |

**Example:**

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

**Function:** Sets the file offset pointer.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description                               |
|:----------|:-----|:---------|:--------------|:------------------------------------------|
| fp        | Int64 | Yes      | -             | The offset pointer of the RandomAccessFile object. |

**Example:**

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

**Function:** Writes data to a file synchronously.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since Version:** 21

**Parameters:**

| Parameter    | Type            | Required | Default Value | Description                                                                 |
|:-------------|:----------------|:---------|:--------------|:----------------------------------------------------------------------------|
| buffer       | String          | Yes      | -             | Data to be written to the file.                                             |
| writeOptions | [WriteOptions](#struct-writeoptions) | No       | WriteOptions() | **Named parameter.** Supports the following options:<br>- length: ?UIntNative type, indicating the expected length of data to write. Defaults to buffer length.<br>- offset: ?Int64 type, indicating the expected file position to write to. Optional, defaults to current position.<br>- encoding: String type, valid when data is of String type, indicating the encoding method. Defaults to "utf-8". Only "utf-8" is supported. |

**Return Value:**

| Type   | Description                  |
|:-------|:-----------------------------|
| Int64  | The actual length written.   |

**Example:**

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

**Function:** Writes data to a file synchronously.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since Version:** 21

**Parameters:**

| Parameter    | Type            | Required | Default Value | Description                                                                 |
|:-------------|:----------------|:---------|:--------------|:----------------------------------------------------------------------------|
| buffer       | Array\<Byte>    | Yes      | -             | Data to be written to the file.                                             |
| writeOptions | [WriteOptions](#struct-writeoptions) | No       | WriteOptions() | **Named parameter.** Supports the following options:<br>- length: ?UIntNative type, indicating the expected length of data to write. Defaults to buffer length.<br>- offset: ?Int64 type, indicating the expected file position to write to. Optional, defaults to current position.<br>- encoding: String type, valid when data is of String type, indicating the encoding method. Defaults to "utf-8". Only "utf-8" is supported. |

**Return Value:**

| Type   | Description                  |
|:-------|:-----------------------------|
| Int64  | The actual length written.   |

**Example:**

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

**Function:** File reading iterator. Before calling methods of ReaderIterator, you need to first construct a ReaderIterator instance via the readLines method.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since Version:** 21

### func next()

```cangjie
public func next(): ReaderIteratorResult
```

**Function:** Gets the next item in the iterator.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since Version:** 21

**Return Value:**

| Type                              | Description                                  |
|:----------------------------------|:---------------------------------------------|
| [ReaderIteratorResult](#struct-readeriteratorresult) | The result returned by the file reading iterator. |

## class Stat

```cangjie
public class Stat {}
```

**Function:** Detailed file information. Before calling methods of Stat, you need to first construct a Stat instance via the [FileFs.stat()](#static-func-statstring) method.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since Version:** 21### prop atime

```cangjie
public prop atime: Int64
```

**Function:** The last access time of the file, represented as the number of seconds since 00:00:00 on January 1, 1970.

**Type:** Int64

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since Version:** 21

### prop ctime

```cangjie
public prop ctime: Int64
```

**Function:** The time when the file status was last changed, represented as the number of seconds since 00:00:00 on January 1, 1970.

**Type:** Int64

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since Version:** 21

### prop gid

```cangjie
public prop gid: Int64
```

**Function:** The ID of the group that owns the file.

**Type:** Int64

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since Version:** 21

### prop ino

```cangjie
public prop ino: Int64
```

**Function:** Identifies the file. Typically, different files on the same device have different INOs.

**Type:** Int64

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since Version:** 21

### prop mode

```cangjie
public prop mode: Int64
```

**Function:** Represents file permissions. The meanings of each bit are as follows.

>**Note:**
>
>The following values are in octal, and the returned value is in decimal. Please convert it before checking.<br/>-&nbsp;0o400: User read. For regular files, the owner can read the file; for directories, the owner can read directory entries.<br/>-&nbsp;0o200: User write. For regular files, the owner can write to the file; for directories, the owner can create/delete directory entries.<br/>-&nbsp;0o100: User execute. For regular files, the owner can execute the file; for directories, the owner can search for a given pathname in the directory.<br/>-&nbsp;0o040: Group read. For regular files, the group can read the file; for directories, the group can read directory entries.<br/>-&nbsp;0o020: Group write. For regular files, the group can write to the file; for directories, the group can create/delete directory entries.<br/>-&nbsp;0o010: Group execute. For regular files, the group can execute the file; for directories, the group can search for a given pathname in the directory.<br/>-&nbsp;0o004: Others read. For regular files, other users can read the file; for directories, other users can read directory entries.<br/>-&nbsp;0o002: Others write. For regular files, other users can write to the file; for directories, other users can create/delete directory entries.<br/>-&nbsp;0o001: Others execute. For regular files, other users can execute the file; for directories, other users can search for a given pathname in the directory.

**Type:** Int64

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since Version:** 21

### prop mtime

```cangjie
public prop mtime: Int64
```

**Function:** The last modification time of the file, represented as the number of seconds since 00:00:00 on January 1, 1970.

**Type:** Int64

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since Version:** 21

### prop size

```cangjie
public prop size: Int64
```

**Function:** The size of the file in bytes. Only valid for regular files.

**Type:** Int64

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since Version:** 21

### prop uid

```cangjie
public prop uid: Int64
```

**Function:** The ID of the owner of the file.

**Type:** Int64

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since Version:** 21

### func isBlockDevice()

```cangjie
public func isBlockDevice(): Bool
```

**Function:** Determines whether the file is a block special file. A block special file can only be accessed in blocks and is accessed with caching.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since Version:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Indicates whether the file is a block special device.|

**Example:**

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

**Function:** Determines whether the file is a character special file. A character special device can be accessed randomly and is accessed without caching.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since Version:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Indicates whether the file is a character special device.|

**Example:**

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

**Function:** Determines whether the file is a directory.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since Version:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Indicates whether the file is a directory.|

**Example:**

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

**Function:** Determines whether the file is a named pipe (sometimes referred to as FIFO). Named pipes are typically used for inter-process communication.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since Version:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Indicates whether the file is a&nbsp;FIFO.|

**Example:**

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

**Function:** Determines whether the file is a regular file.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since Version:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Indicates whether the file is a regular file.|

**Example:**

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

**Function:** Determines whether the file is a socket.**System Capability:** SystemCapability.FileManagement.File.FileIO  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Indicates whether the file is a socket. |  

**Example:**  

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

**Function:** Determines whether the file is a symbolic link.  

**System Capability:** SystemCapability.FileManagement.File.FileIO  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Indicates whether the file is a symbolic link. |  

**Example:**  

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

**Function:** File stream. Before calling Stream methods, a Stream instance must first be constructed via the [FileFs.createStream](#static-func-createstreamstring-string) method or [FileFs.fdopenStream](#static-func-fdopenstreamint32-string).  

**System Capability:** SystemCapability.FileManagement.File.FileIO  

**Initial Version:** 21  

### func close()  

```cangjie  
public func close(): Unit  
```  

**Function:** Synchronously closes the file stream.  

**System Capability:** SystemCapability.FileManagement.File.FileIO  

**Initial Version:** 21  

**Example:**  

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

**Function:** Synchronously flushes the file stream.  

**System Capability:** SystemCapability.FileManagement.File.FileIO  

**Initial Version:** 21  

**Example:**  

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

**Function:** Reads data from the stream file synchronously.  

**System Capability:** SystemCapability.FileManagement.File.FileIO  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| arrayBuffer | Array\<Byte> | Yes | - | Buffer for reading the file. |  
| options | [ReadOptions](#struct-readoptions) | No | ReadOptions() | **Named parameter.** Supports the following options:<br/>-&nbsp;length, UIntNative type, indicates the expected length of data to read. Optional, defaults to buffer length.<br/>-&nbsp;offset, Int64 type, indicates the expected position to read from the file. Optional, defaults to current position.<br/> |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Int64 | Actual length of data read. |  

**Example:**  

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

**Function:** Writes data to the stream file.  

**System Capability:** SystemCapability.FileManagement.File.FileIO  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| buffer | String | Yes | - | Data to be written to the file. |  
| options | [WriteOptions](#struct-writeoptions) | No | WriteOptions() | **Named parameter.** Supports the following options:<br/>-&nbsp;length, ?UIntNative type, indicates the expected length of data to write. Defaults to buffer length.<br/>-&nbsp;offset, ?Int64 type, indicates the expected position to write to the file. Optional, defaults to current position.<br/>-&nbsp;encoding, String type, valid when data is of String type, indicates the encoding method, defaults to "utf-8". Only "utf-8" is supported. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Int64 | Actual length of data written. |  

**Example:**  

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

**Function:** Writes data to the stream file.  

**System Capability:** SystemCapability.FileManagement.File.FileIO  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| buffer | Array\<Byte> | Yes | - | Data to be written to the file. |  
| options | [WriteOptions](#struct-writeoptions) | No | WriteOptions() | **Named parameter.** Supports the following options:<br/>-&nbsp;length, ?UIntNative type, indicates the expected length of data to write. Defaults to buffer length.<br/>-&nbsp;offset, ?Int64 type, indicates the expected position to write to the file. Optional, defaults to current position.<br/>-&nbsp;encoding, String type, valid when data is of String type, indicates the encoding method, defaults to "utf-8". Only "utf-8" is supported. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Int64 | Actual length of data written. |  

**Example:**  

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

**Function:** Conflict file information, used by copyDir and moveDir interfaces.  

**System Capability:** SystemCapability.FileManagement.File.FileIO  

**Initial Version:** 21  

### let destFile  

```cangjie  
public let destFile: String  
```  

**Function:** Path of the destination conflict file.  

**Type:** String  

**Read/Write Capability:** Read-only  

**System Capability:** SystemCapability.FileManagement.File.FileIO  

**Initial Version:** 21  

### let srcFile  

```cangjie  
public let srcFile: String  
```  

**Function:** Path of the source conflict file.  

**Type:** String  

**Read/Write Capability:** Read-only  

**System Capability:** SystemCapability.FileManagement.File.FileIO  

**Initial Version:** 21  

### ConflictFiles(String, String)
```cangjie
public ConflictFiles(
    public let srcFile: String,
    public let destFile: String
)
```

**Function:** Constructs a ConflictFiles object.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| srcFile | String | Yes | - | Source conflict file path. |
| destFile | String | Yes | - | Destination conflict file path. |

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

**Function:** File filtering configuration type, used by the listFile interface. Note: mimeType and excludeMedia filtering are currently not supported.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Initial Version:** 21

### var displayName

```cangjie
public var displayName: Array<String> = Array<String>()
```

**Function:** Fuzzy filename matching with OR relationship between keywords. Currently only supports wildcard *.

**Type:** Array\<String>

**Read-Write Capability:** Read-Write

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Initial Version:** 21

### var excludeMedia

```cangjie
public var excludeMedia: Bool = false
```

**Function:** Whether to exclude files already present in Media. Reserved capability, currently not supported.

**Type:** Bool

**Read-Write Capability:** Read-Write

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Initial Version:** 21

### var fileSizeOver

```cangjie
public var fileSizeOver: ?Int64 = None
```

**Function:** File size matching, files larger than the specified size.

**Type:** ?Int64

**Read-Write Capability:** Read-Write

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Initial Version:** 21

### var lastModifiedAfter

```cangjie
public var lastModifiedAfter: ?Float64 = None
```

**Function:** File last modified time matching, files modified after the specified timestamp.

**Type:** ?Float64

**Read-Write Capability:** Read-Write

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Initial Version:** 21

### var mimeType

```cangjie
public var mimeType: Array<String> = Array<String>()
```

**Function:** Exact mime type matching with OR relationship between keywords. Reserved capability, currently not supported.

**Type:** Array\<String>

**Read-Write Capability:** Read-Write

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Initial Version:** 21

### var suffix

```cangjie
public var suffix: Array<String> = Array<String>()
```

**Function:** Exact file extension matching with OR relationship between keywords.

**Type:** Array\<String>

**Read-Write Capability:** Read-Write

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Initial Version:** 21

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

**Function:** Constructs a Filter object.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| suffix | Array\<String> | No | Array\<String>() | **Named parameter.** Exact file extension matching with OR relationship between keywords. |
| displayName | Array\<String> | No | Array\<String>() | **Named parameter.** Fuzzy filename matching with OR relationship between keywords. Currently only supports wildcard *. |
| mimeType | Array\<String> | No | Array\<String>() | **Named parameter.** Exact mime type matching with OR relationship between keywords. Reserved capability, currently not supported. |
| fileSizeOver | ?Int64 | No | None | **Named parameter.** File size matching, files larger than the specified size. |
| lastModifiedAfter | ?Float64 | No | None | **Named parameter.** File last modified time matching, files modified after the specified timestamp. |
| excludeMedia | Bool | No | false | **Named parameter.** Whether to exclude files already present in Media. Reserved capability, currently not supported. |

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

**Function:** Optional configuration type, used by the listFile interface.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Initial Version:** 21

### let filter

```cangjie
public let filter: Filter = Filter()
```

**Function:** Valid when data is of String type, indicates the encoding method of the data, default is "utf-8". Only "utf-8" is supported.

**Type:** [Filter](#struct-filter)

**Read-Write Capability:** Read-Only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Initial Version:** 21

### let listNum

```cangjie
public let listNum: Int32 = 0
```

**Function:** Number of filenames to list. When set to 0, lists all files (default is 0).

**Type:** Int32

**Read-Write Capability:** Read-Only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Initial Version:** 21

### let recursion

```cangjie
public let recursion: Bool = false
```

**Function:** Whether to recursively list filenames in subdirectories. Default is false. When recursion is false, returns filenames and folder names in the current directory that meet the filtering requirements. When recursion is true, returns relative paths (starting with /) of all files in this directory that meet the filtering requirements.

**Type:** Bool

**Read-Write Capability:** Read-Only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Initial Version:** 21

### ListFileOptions(Bool, Int32, Filter)

```cangjie
public ListFileOptions(
   public let recursion!: Bool = false,
   public let listNum!: Int32 = 0,
   public let filter!: Filter = Filter()
)
```

**Function:** Constructs a ListFileOptions object.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| recursion | Bool | No | false | **Named parameter.** Whether to recursively list filenames in subdirectories. Default is false. When recursion is false, returns filenames and folder names in the current directory that meet the filtering requirements. When recursion is true, returns relative paths (starting with /) of all files in this directory that meet the filtering requirements. |
| listNum | Int32 | No | 0 | **Named parameter.** Number of filenames to list. When set to 0, lists all files (default is 0). |
| filter | [Filter](#struct-filter) | No | Filter() | **Named parameter.** Valid when data is of String type, indicates the encoding method of the data, default is "utf-8". Only "utf-8" is supported. |

## struct Options

```cangjie
public struct Options {
    public Options(public var encoding!: String = "utf-8")
}
```

**Function:** Optional configuration type, used by the readLines interface.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Initial Version:** 21

### var encoding

```cangjie
public var encoding: String = "utf-8"
```

**Function:** File encoding method. Optional.

**Type:** String

**Read-Write Capability:** Read-Write

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Initial Version:** 21

### Options(String)

```cangjie
public Options(public var encoding!: String = "utf-8")
```

**Function:** Constructs an Options object.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Initial Version:** 21

**Parameters:**| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| encoding | String | No | "utf-8" | **Named parameter.** Specifies the encoding method for the string. |

## struct ReadOptions

```cangjie
public struct ReadOptions {
    public ReadOptions(
        public var length!: Option<UIntNative> = None,
        public var offset!: Option<Int64> = None
    )
}
```

**Functionality:** Optional type, supports the use of the read interface.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var length

```cangjie
public var length: Option<UIntNative>= None
```

**Functionality:** Expected length of data to be read. Defaults to buffer length.

**Type:** Option\<UIntNative>

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var offset

```cangjie
public var offset: Option<Int64>= None
```

**Functionality:** Expected file position to read from (based on the current filePointer plus offset). Defaults to reading from the offset pointer (filePointer).

**Type:** Option\<Int64>

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### ReadOptions(Option\<UIntNative>, Option\<Int64>)

```cangjie
public ReadOptions(
    public var length!: Option<UIntNative> = None,
    public var offset!: Option<Int64> = None
)
```

**Functionality:** Constructs a ReadOptions object.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| length | Option\<UIntNative> | No | None | **Named parameter.** Expected length of data to be read. Defaults to buffer length. |
| offset | Option\<Int64> | No | None | **Named parameter.** Expected file position to read from (based on the current filePointer plus offset). Defaults to reading from the offset pointer (filePointer). |

## struct ReadTextOptions

```cangjie
public struct ReadTextOptions {
    public ReadTextOptions(
    public var length!: Option<Int64> = None,
    public var offset!: Int64 = 0,
    public var encoding!: String = "utf-8")
}
```

**Functionality:** Optional type, supports the use of the readText interface.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var encoding

```cangjie
public var encoding: String = "utf-8"
```

**Functionality:** Valid when data is of type String, specifies the encoding method for the data. Defaults to "utf-8", and only "utf-8" is supported.

**Type:** String

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var length

```cangjie
public var length: Option<Int64>= None
```

**Functionality:** Expected length of data to be read. Defaults to file length.

**Type:** Option\<Int64>

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var offset

```cangjie
public var offset: Int64 = 0
```

**Functionality:** Expected file position to read from. Defaults to reading from the current position.

**Type:** Int64

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### ReadTextOptions(Option\<Int64>, Int64, String)

```cangjie
public ReadTextOptions(
public var length!: Option<Int64> = None,
public var offset!: Int64 = 0,
public var encoding!: String = "utf-8")
```

**Functionality:** Constructs a ReadTextOptions object.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| length | Option\<Int64> | No | None | **Named parameter.** Expected length of data to be read. Defaults to file length. |
| offset | Int64 | No | 0 | **Named parameter.** Expected file position to read from. Defaults to reading from the current position. |
| encoding | String | No | "utf-8" | **Named parameter.** Valid when data is of type String, specifies the encoding method for the data. Defaults to "utf-8", and only "utf-8" is supported. |

## struct ReaderIteratorResult

```cangjie
public struct ReaderIteratorResult {}
```

**Functionality:** File reading iterator return result, supports the use of the ReaderIterator interface.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### let done

```cangjie
public let done: Bool
```

**Functionality:** Whether the iterator has completed iteration.

**Type:** Bool

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### let value

```cangjie
public let value: String
```

**Functionality:** File text content read line by line.

**Type:** String

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

## struct WriteOptions

```cangjie
public struct WriteOptions {
    public WriteOptions(
    public var length!: Option<UIntNative> = None,
    public var offset!: Option<Int64> = None,
    public var encoding!: String = "utf-8")
}
```

**Functionality:** Optional type, supports the use of the write interface.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var encoding

```cangjie
public var encoding: String = "utf-8"
```

**Functionality:** Valid when data is of type String, specifies the encoding method for the data. Defaults to "utf-8". Only "utf-8" is supported.

**Type:** String

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var length

```cangjie
public var length: Option<UIntNative>= None
```

**Functionality:** Expected length of data to be written. Defaults to buffer length.

**Type:** Option\<UIntNative>

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var offset

```cangjie
public var offset: Option<Int64>= None
```

**Functionality:** Expected file position to write to (based on the current filePointer plus offset). Defaults to writing from the offset pointer (filePointer).

**Type:** Option\<Int64>

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### WriteOptions(Option\<UIntNative>, Option\<Int64>, String)

```cangjie
public WriteOptions(
    public var length!: Option<UIntNative> = None,
    public var offset!: Option<Int64> = None,
    public var encoding!: String = "utf-8"
)
```

**Functionality:** Constructs a WriteOptions object.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| length | Option\<UIntNative> | No | None | **Named parameter.** Expected length of data to be written. Defaults to buffer length. |
| offset | Option\<Int64> | No | None | **Named parameter.** Expected file position to write to (based on the current filePointer plus offset). Defaults to writing from the offset pointer (filePointer). |
| encoding | String | No | "utf-8" | **Named parameter.** Valid when data is of type String, specifies the encoding method for the data. Defaults to "utf-8". Only "utf-8" is supported. |

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

**Function:** Constants for the flags parameter of the open interface. File opening flags.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### APPEND

```cangjie
APPEND
```

**Function:** Open in append mode, subsequent writes will be appended to the end of the file.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### CREATE

```cangjie
CREATE
```

**Function:** Create the file if it does not exist.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### DIR

```cangjie
DIR
```

**Function:** Error if path does not point to a directory.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### NOFOLLOW

```cangjie
NOFOLLOW
```

**Function:** Error if path points to a symbolic link.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### NONBLOCK

```cangjie
NONBLOCK
```

**Function:** If path points to a FIFO, block special file, or character special file, perform non-blocking operations for this open and subsequent I/O.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### READ_ONLY

```cangjie
READ_ONLY
```

**Function:** Open for reading only.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### READ_WRITE

```cangjie
READ_WRITE
```

**Function:** Open for both reading and writing.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### SYNC

```cangjie
SYNC
```

**Function:** Open the file with synchronous I/O.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### TRUNC

```cangjie
TRUNC
```

**Function:** If the file exists and is opened for writing or reading/writing, truncate its length to zero.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### WRITE_ONLY

```cangjie
WRITE_ONLY
```

**Function:** Open for writing only.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### prop mode

```cangjie
public prop mode: Int64
```

**Function:** Gets the specific numerical value corresponding to the file opening flag type.

**Type:** Int64

**Access:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

## enum WhenceType

```cangjie
public enum WhenceType {
    | SEEK_SET
    | SEEK_CUR
    | SEEK_END
    | ...
}
```

**Function:** File offset pointer relative position types, used by the lseek interface.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### SEEK_CUR

```cangjie
SEEK_CUR
```

**Function:** Current position of the file offset pointer.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### SEEK_END

```cangjie
SEEK_END
```

**Function:** End position of the file.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### SEEK_SET

```cangjie
SEEK_SET
```

**Function:** Starting position of the file.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### prop whenceType

```cangjie
public prop whenceType: Int32
```

**Function:** Gets the specific numerical value corresponding to the file offset pointer relative position type.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21
```