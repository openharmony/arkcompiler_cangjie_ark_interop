# ohos.file.fs (File Management)

This module provides basic file operation APIs, including common functionalities such as basic file management, directory management, file information statistics, and stream-based file reading/writing.

## Import Module

```cangjie
import kit.CoreFileKit.*
```

## Usage Instructions

API sample code usage instructions:

- If the sample code's first line contains a "// index.cj" comment, it indicates the example can be compiled and run in the "index.cj" file of a Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the sample project and configuration template mentioned above, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#仓颉示例代码说明).

## class ConflictFiles

```cangjie
public class ConflictFiles {
    public var srcFile: String
    public var destFile: String
}
```

**Function:** Conflict file information, supports copyDir and moveDir interfaces.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var destFile

```cangjie
public var destFile: String
```

**Function:** Target conflict file path.

**Type:** String

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var srcFile

```cangjie
public var srcFile: String
```

**Function:** Source conflict file path.

**Type:** String

**Read-Write Capability:** Readable and Writable

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

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### prop name

```cangjie
public prop name: String
```

**Function:** File name.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### prop path

```cangjie
public prop path: String
```

**Function:** File path.

**Type:** String

**Read-Write Capability:** Read-only

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

**Exceptions:**

- BusinessException: Corresponding error codes as shown in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900005 | I/O error |
  | 13900042 | Unknown error |
  | 14300002 | Invalid URI |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*
import kit.PerformanceAnalysisKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let file = FileIo.open(filePath, mode: (OpenMode.READ_WRITE | OpenMode.CREATE))
Hilog.info(0, "", "The parent path is: " + file.getParent())
FileIo.close(file)
```

### func tryLock(Bool)

```cangjie
public func tryLock(exclusive!: Bool = false): Unit
```

**Function:** Non-blocking application of shared or exclusive locks to a file.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|exclusive|Bool|No|false|**Named parameter.** Whether to apply an exclusive lock, default is false.|

**Exceptions:**

- BusinessException: Corresponding error codes as shown in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900004 | Interrupted system call |
  | 13900008 | Bad file descriptor |
  | 13900020 | Invalid argument |
  | 13900034 | Operation would block |
  | 13900042 | Unknown error |
  | 13900043 | No record locks available |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let file = FileIo.open(filePath, mode:(OpenMode.READ_WRITE | OpenMode.CREATE))
file.tryLock(exclusive: true)
FileIo.close(file)
```

### func unlock()

```cangjie
public func unlock(): Unit
```

**Function:** Synchronously unlocks a file.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Exceptions:**

- BusinessException: Corresponding error codes as shown in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900004 | Interrupted system call |
  | 13900008 | Bad file descriptor |
  | 13900020 | Invalid argument |
  | 13900034 | Operation would block |
  | 13900042 | Unknown error |
  | 13900043 | No record locks available |

## class FileIo

```cangjie
public class FileIo {}
```

**Function:** Provides basic file operation capabilities.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### static func access(String, AccessModeType, AccessFlagType)

```cangjie
public static func access(path: String, mode!: AccessModeType = AccessModeType.Exist,
    flag!: AccessFlagType = AccessFlagType.Local): Bool
```

**Function:** Checks whether a file exists or verifies operation permissions. Verification of read, write, or read-write permissions failing will throw error code 13900012 (Permission denied).

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|path|String|Yes|-|Application sandbox path of the file or directory.|
|mode|[AccessModeType](#enum-accessmodetype)|No|AccessModeType.Exist|Permission to verify for the file or directory.|
|flag|[AccessFlagType](#enum-accessflagtype)|No|AccessFlagType.Local|Location to verify for the file or directory.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the file exists locally and the verified permissions exist; returns false if the file does not exist or the file is on the cloud or other distributed devices.|

**Exceptions:**

- BusinessException: Corresponding error codes as shown in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900002 | No such file or directory |
  | 13900005 | I/O error |
  | 13900008 | Bad file descriptor |
  | 13900011 | Out of memory |
  | 13900012 | Permission denied |
  | 13900013 | Bad address |
  | 13900018 | Not a directory |
  | 13900020 | Invalid argument |
  | 13900023 | Text file busy |
  | 13900030 | File name too long |
  | 13900033 | Too many symbolic links encountered |
  | 13900042 | Unknown error |

### static func close(Int32)

```cangjie
public static func close(file: Int32): Unit
```

**Function:** Closes a file synchronously.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|file|Int32|Yes|-|Opened File object. After closing, the file object no longer has practical meaning and cannot be used for operations such as reading and writing.|

**Exceptions:**

- BusinessException: Corresponding error codes as shown in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900004 | Interrupted system call |
  | 13900005 | I/O error |
  | 13900008 | Bad file descriptor |
  | 13900025 | No space left on device |
  | 13900041 | Quota exceeded |
  | 13900042 | Unknown error |

### static func close(File)

```cangjie
public static func close(file: File): Unit
```

**Function:** Closes a file synchronously.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|file|[File](#class-file)|Yes|-|Opened File object. After closing, the file object no longer has practical meaning and cannot be used for operations such as reading and writing.|

**Exceptions:**

- BusinessException: Corresponding error codes as shown in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900004 | Interrupted system call |
  | 13900005 | I/O error |
  | 13900008 | Bad file descriptor |
  | 13900025 | No space left on device |
  | 13900041 | Quota exceeded |
  | 13900042 | Unknown error |

### static func copyDir(String, String, Int32)

```cangjie
public static func copyDir(src: String, dest: String, mode!: Int32 = 0): Unit
```

**Function:** Copies the source directory to the target path.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|src|String|Yes|-|Application sandbox path of the source directory.|
|dest|String|Yes|-|Application sandbox path of the target directory.|
|mode|Int32|No|0| **Named parameter.** Copy mode. Default mode is 0.<br/>- mode 0: File-level exception throwing. If there is a directory name conflict in the target directory and the conflicting directory contains files with the same names, an exception is thrown. All non-conflicting files from the source directory are moved to the target directory, non-conflicting files in the target directory remain, and conflict file information is provided in the data attribute of the thrown exception (ConfilictFileException) as Array\<ConflictFiles>.<br/>- mode 1: File-level forced overwrite. If there is a directory name conflict in the target directory and the conflicting directory contains files with the same names, all same-named files in the conflicting directory are forcibly overwritten, and non-conflicting files remain.|

**Exceptions:**

- BusinessException: Corresponding error codes as shown in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900002 | No such file or directory |
  | 13900004 | Interrupted system call |
  | 13900005 | I/O error |
  | 13900008 | Bad file descriptor |
  | 13900010 | Try again |
  | 13900011 | Out of memory |
  | 13900012 | Permission denied |
  | 13900013 | Bad address |
  | 13900015 | File exists |
  | 13900018 | Not a directory |
  | 13900019 | Is a directory |
  | 13900020 | Invalid argument |
  | 13900030 | File name too long |
  | 13900031 | Function not implemented |
  | 13900033 | Too many symbolic links encountered |
  | 13900034 | Operation would block |
  | 13900038 | Value too large for defined data type |
  | 13900042 | Unknown error |
  | 13900044 | Network is unreachable |### static func copyFile(String, String, Int32)

```cangjie
public static func copyFile(src: String, dest: String, mode!: Int32 = 0): Unit
```

**Function:** Copy a file.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| src | String | Yes | - | File descriptor of the source file to be copied. |
| dest | String | Yes | - | File descriptor of the destination file. |
| mode | Int32 | No | 0 | **Named parameter.** Provides options for file overwriting. Currently only supports 0, with a default value of 0.<br/>0: Completely overwrites the target file, and any non-overwritten portions will be truncated. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900002 | No such file or directory |
  | 13900004 | Interrupted system call |
  | 13900005 | I/O error |
  | 13900008 | Bad file descriptor |
  | 13900010 | Try again |
  | 13900011 | Out of memory |
  | 13900012 | Permission denied |
  | 13900013 | Bad address |
  | 13900018 | Not a directory |
  | 13900019 | Is a directory |
  | 13900020 | Invalid argument |
  | 13900030 | File name too long |
  | 13900031 | Function not implemented |
  | 13900033 | Too many symbolic links encountered |
  | 13900034 | Operation would block |
  | 13900038 | Value too large for defined data type |
  | 13900042 | Unknown error |
  | 13900044 | Network is unreachable |

### static func copyFile(String, Int32, Int32)

```cangjie
public static func copyFile(src: String, dest: Int32, mode!: Int32 = 0): Unit
```

**Function:** Copy a file.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| src | String | Yes | - | File descriptor of the source file to be copied. |
| dest | Int32 | Yes | - | File descriptor of the destination file. |
| mode | Int32 | No | 0 | **Named parameter.** Provides options for file overwriting. Currently only supports 0, with a default value of 0.<br/>0: Completely overwrites the target file, and any non-overwritten portions will be truncated. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900002 | No such file or directory |
  | 13900004 | Interrupted system call |
  | 13900005 | I/O error |
  | 13900008 | Bad file descriptor |
  | 13900010 | Try again |
  | 13900011 | Out of memory |
  | 13900012 | Permission denied |
  | 13900013 | Bad address |
  | 13900018 | Not a directory |
  | 13900019 | Is a directory |
  | 13900020 | Invalid argument |
  | 13900030 | File name too long |
  | 13900031 | Function not implemented |
  | 13900033 | Too many symbolic links encountered |
  | 13900034 | Operation would block |
  | 13900038 | Value too large for defined data type |
  | 13900042 | Unknown error |
  | 13900044 | Network is unreachable |

### static func copyFile(Int32, String, Int32)

```cangjie
public static func copyFile(src: Int32, dest: String, mode!: Int32 = 0): Unit
```

**Function:** Copy a file.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| src | Int32 | Yes | - | File descriptor of the source file to be copied. |
| dest | String | Yes | - | File descriptor of the destination file. |
| mode | Int32 | No | 0 | **Named parameter.** Provides options for file overwriting. Currently only supports 0, with a default value of 0.<br/>0: Completely overwrites the target file, and any non-overwritten portions will be truncated. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900002 | No such file or directory |
  | 13900004 | Interrupted system call |
  | 13900005 | I/O error |
  | 13900008 | Bad file descriptor |
  | 13900010 | Try again |
  | 13900011 | Out of memory |
  | 13900012 | Permission denied |
  | 13900013 | Bad address |
  | 13900018 | Not a directory |
  | 13900019 | Is a directory |
  | 13900020 | Invalid argument |
  | 13900030 | File name too long |
  | 13900031 | Function not implemented |
  | 13900033 | Too many symbolic links encountered |
  | 13900034 | Operation would block |
  | 13900038 | Value too large for defined data type |
  | 13900042 | Unknown error |
  | 13900044 | Network is unreachable |

### static func copyFile(Int32, Int32, Int32)

```cangjie
public static func copyFile(src: Int32, dest: Int32, mode!: Int32 = 0): Unit
```

**Function:** Copy a file.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| src | Int32 | Yes | - | File descriptor of the source file to be copied. |
| dest | Int32 | Yes | - | File descriptor of the destination file. |
| mode | Int32 | No | 0 | **Named parameter.** Provides options for file overwriting. Currently only supports 0, with a default value of 0.<br/>0: Completely overwrites the target file, and any non-overwritten portions will be truncated. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900002 | No such file or directory |
  | 13900004 | Interrupted system call |
  | 13900005 | I/O error |
  | 13900008 | File descriptor |
  | 13900010 | Try again |
  | 13900011 | Out of memory |
  | 13900012 | Permission denied |
  | 13900013 | Bad address |
  | 13900018 | Not a directory |
  | 13900019 | Is a directory |
  | 13900020 | Invalid argument |
  | 13900030 | File name too long |
  | 13900031 | Function not implemented |
  | 13900033 | Too many symbolic links encountered |
  | 13900034 | Operation would block |
  | 13900038 | Value too large for defined data type |
  | 13900042 | Unknown error |
  | 13900044 | Network is unreachable |

### static func createRandomAccessFile(String, Int64, RandomAccessFileOptions)

```cangjie
public static func createRandomAccessFile(file: String, mode!: Int64 = OpenMode.READ_ONLY,
    options!: RandomAccessFileOptions = RandomAccessFileOptions()): RandomAccessFile
```

**Function:** Creates a RandomAccessFile object based on a file path or file object.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| file | String | Yes | - | An opened File object. |
| mode | Int64 | No | OpenMode.READ_ONLY | **Named parameter.** Options for creating the RandomAccessFile object (see [enum OpenMode](#enum-openmode)). Only effective when a sandbox file path is provided. Must specify one of the following options, with read-only as the default:<br/>- OpenMode.READ_ONLY(0o0): Create in read-only mode.<br/>- OpenMode.WRITE_ONLY(0o1): Create in write-only mode.<br/>- OpenMode.READ_WRITE(0o2): Create in read-write mode.<br/>Additional functional options can be appended using bitwise OR, with no additional options by default:<br/>- OpenMode.CREATE(0o100): Create the file if it does not exist.<br/>- OpenMode.TRUNC(0o1000): If the RandomAccessFile object exists and has write permissions, truncate its length to zero.<br/>- OpenMode.APPEND(0o2000): Open in append mode; subsequent writes will append to the end of the RandomAccessFile object.<br/>- OpenMode.NONBLOCK(0o4000): If the path points to a FIFO, block special file, or character special file, perform non-blocking operations for this and subsequent I/O operations.<br/>- OpenMode.DIR(0o200000): Error if the path does not point to a directory. Write permissions cannot be appended.<br/>- OpenMode.NOFOLLOW(0o400000): Error if the path points to a symbolic link.<br/>- OpenMode.SYNC(0o4010000): Create the RandomAccessFile object in synchronous I/O mode. |
| options | [RandomAccessFileOptions](#class-randomaccessfileoptions) | No | RandomAccessFileOptions() | Supports the following options:<br/>- start: number type, indicates the desired starting position for reading the file. Optional, defaults to the current position.<br/>- end: number type, indicates the desired ending position for reading the file. Optional, defaults to the end of the file. |

**Return Value:**

| Type | Description |
|:----|:----|
| [RandomAccessFile](#class-randomaccessfile) | Returns the RandomAccessFile file object. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900001 | Operation not permitted |
  | 13900002 | No such file or directory |
  | 13900004 | Interrupted system call |
  | 13900006 | No such device or address |
  | 13900008 | Bad file descriptor |
  | 13900011 | Out of memory |
  | 13900012 | Permission denied |
  | 13900013 | Bad address |
  | 13900014 | Device or resource busy |
  | 13900015 | File exists |
  | 13900017 | No such device |
  | 13900018 | Not a directory |
  | 13900019 | Is a directory |
  | 13900020 | Invalid argument |
  | 13900022 | Too many open files |
  | 13900023 | Text file busy |
  | 13900024 | File too large |
  | 13900025 | No space left on device |
  | 13900027 | Read-only file system |
  | 13900029 | Resource deadlock would occur |
  | 13900030 | File name too long |
  | 13900033 | Too many symbolic links encountered |
  | 13900034 | Operation would block |
  | 13900038 | Value too large for defined data type |
  | 13900041 | Quota exceeded |
  | 13900042 | Unknown error |
  | 13900044 | Network is unreachable |

### static func createRandomAccessFile(File, Int64, RandomAccessFileOptions)

```cangjie
public static func createRandomAccessFile(file: File, mode!: Int64 = OpenMode.READ_ONLY,
    options!: RandomAccessFileOptions = RandomAccessFileOptions()): RandomAccessFile
```

**Function:** Creates a RandomAccessFile object based on a file path or file object.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| file | [File](#class-file) | Yes | - | An opened File object. |
| mode | Int64 | No | OpenMode.READ_ONLY | Options for creating the RandomAccessFile object. Only effective when a sandbox file path is provided. Must specify one of the following options, with read-only as the default:<br/>- OpenMode.READ_ONLY(0o0): Create in read-only mode.<br/>- OpenMode.WRITE_ONLY(0o1): Create in write-only mode.<br/>- OpenMode.READ_WRITE(0o2): Create in read-write mode.<br/>Additional functional options can be appended using bitwise OR, with no additional options by default:<br/>- OpenMode.CREATE(0o100): Create the file if it does not exist.<br/>- OpenMode.TRUNC(0o1000): If the RandomAccessFile object exists and has write permissions, truncate its length to zero.<br/>- OpenMode.APPEND(0o2000): Open in append mode; subsequent writes will append to the end of the RandomAccessFile object.<br/>- OpenMode.NONBLOCK(0o4000): If the path points to a FIFO, block special file, or character special file, perform non-blocking operations for this and subsequent I/O operations.<br/>- OpenMode.DIR(0o200000): Error if the path does not point to a directory. Write permissions cannot be appended.<br/>- OpenMode.NOFOLLOW(0o400000): Error if the path points to a symbolic link.<br/>- OpenMode.SYNC(0o4010000): Create the RandomAccessFile object in synchronous I/O mode. |
| options | [RandomAccessFileOptions](#class-randomaccessfileoptions) | No | RandomAccessFileOptions() | Supports the following options:<br/>- start: number type, indicates the desired starting position for reading the file. Optional, defaults to the current position.<br/>- end: number type, indicates the desired ending position for reading the file. Optional, defaults to the end of the file. |

**Return Value:**

| Type | Description |
|:----|:----|
| [RandomAccessFile](#class-randomaccessfile) | Returns the RandomAccessFile file object. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900001 | Operation not permitted |
  | 13900002 | No such file or directory |
  | 13900004 | Interrupted system call |
  | 13900006 | No such device or address |
  | 13900008 | Bad file descriptor |
  | 13900011 | Out of memory |
  | 13900012 | Permission denied |
  | 13900013 | Bad address |
  | 13900014 | Device or resource busy |
  | 13900015 | File exists |
  | 13900017 | No such device |
  | 13900018 | Not a directory |
  | 13900019 | Is a directory |
  | 13900020 | Invalid argument |
  | 13900022 | Too many open files |
  | 13900023 | Text file busy |
  | 13900024 | File too large |
  | 13900025 | No space left on device |
  | 13900027 | Read-only file system |
  | 13900029 | Resource deadlock would occur |
  | 13900030 | File name too long |
  | 13900033 | Too many symbolic links encountered |
  | 13900034 | Operation would block |
  | 13900038 | Value too large for defined data type |
  | 13900041 | Quota exceeded |
  | 13900042 | Unknown error |
  | 13900044 | Network is unreachable |

### static func createStream(String, String)

```cangjie
public static func createStream(path: String, mode: String): Stream
```

**Function:** Creates a file stream based on a file path.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| path | String | Yes | - | Sandbox path of the file. |
| mode | String | Yes | - | - r: Open a read-only file; the file must exist.<br/>- r+: Open a readable and writable file; the file must exist.<br/>- w: Open a write-only file; if the file exists, its length is truncated to zero (i.e., the file content is erased). If the file does not exist, it is created.<br/>- w+: Open a readable and writable file; if the file exists, its length is truncated to zero (i.e., the file content is erased). If the file does not exist, it is created.<br/>- a: Open a write-only file in append mode. If the file does not exist, it is created. If the file exists, data is appended to the### static func fdopenStream(Int32, String)

```cangjie
public static func fdopenStream(fd: Int32, mode: String): Stream
```

**Function:** Opens a file stream synchronously based on a file descriptor.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| fd | Int32 | Yes | - | The file descriptor of an opened file. |
| mode | String | Yes | - | -&nbsp;r: Open a file for reading only. The file must exist.<br/>-&nbsp;r+: Open a file for reading and writing. The file must exist.<br/>-&nbsp;w: Open a file for writing only. If the file exists, its contents will be overwritten.<br/>-&nbsp;w+: Open a file for reading and writing. If the file exists, its contents will be overwritten.<br/>-&nbsp;a: Open a file for appending (writing only). Data written will be added to the end of the file, preserving the original contents.<br/>-&nbsp;a+: Open a file for reading and appending. Data written will be added to the end of the file, preserving the original contents. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Stream](#class-stream) | Returns the file stream object. |

**Exceptions:**

- BusinessException: Error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900001 | Operation not permitted |
  | 13900002 | No such file or directory |
  | 13900004 | Interrupted system call |
  | 13900006 | No such device or address |
  | 13900008 | Bad file descriptor |
  | 13900010 | Try again |
  | 13900011 | Out of memory |
  | 13900012 | Permission denied |
  | 13900013 | Bad address |
  | 13900014 | Device or resource busy |
  | 13900015 | File exists |
  | 13900017 | No such device |
  | 13900018 | Not a directory |
  | 13900019 | Is a directory |
  | 13900020 | Invalid argument |
  | 13900022 | Too many open files |
  | 13900023 | Text file busy |
  | 13900024 | File too large |
  | 13900025 | No space left on device |
  | 13900027 | Read-only file system |
  | 13900029 | Resource deadlock would occur |
  | 13900030 | File name too long |
  | 13900033 | Too many symbolic links encountered |
  | 13900034 | Operation would block |
  | 13900038 | Value too large for defined data type |
  | 13900041 | Quota exceeded |
  | 13900042 | Unknown error |

### static func fsync(Int32)

```cangjie
public static func fsync(fd: Int32): Unit
```

**Function:** Synchronizes file data synchronously.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| fd | Int32 | Yes | - | The file descriptor of an opened file. |

**Exceptions:**

- BusinessException: Error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900005 | I/O error |
  | 13900008 | Bad file descriptor |
  | 13900020 | Invalid argument |
  | 13900025 | No space left on device |
  | 13900027 | Read-only file system |
  | 13900041 | Quota exceeded |
  | 13900042 | Unknown error |

### static func listFile(String, ListFileOptions)

```cangjie
public static func listFile(path: String, options!: ListFileOptions = ListFileOptions()): Array<String>
```

**Function:** Lists all filenames in a directory synchronously, supporting recursive listing (including subdirectories) and file filtering.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| path | String | Yes | - | The application sandbox path of the directory. |
| options | [ListFileOptions](#class-listfileoptions) | No | ListFileOptions() | File filtering options. No filtering by default. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<String> | Returns an array of filenames. |

**Exceptions:**

- BusinessException: Error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900002 | No such file or directory |
  | 13900008 | Bad file descriptor |
  | 13900011 | Out of memory |
  | 13900018 | Not a directory |
  | 13900042 | Unknown error |

### static func lseek(Int32, Int64, WhenceType)

```cangjie
public static func lseek(fd: Int32, offset: Int64, whence!: WhenceType = SeekSet): Int64
```

**Function:** Adjusts the file offset pointer position.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| fd | Int32 | Yes | - | The file descriptor. |
| offset | Int64 | Yes | - | The relative offset position. |
| whence | [WhenceType](#enum-whencetype) | No | SeekSet | The type of relative offset position. |

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | The current file offset pointer position (relative to the start of the file). |

**Exceptions:**

- BusinessException: Error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900008 | Bad file descriptor |
  | 13900020 | Invalid argument |
  | 13900026 | Illegal seek |
  | 13900038 | Value too large for defined data type |
  | 13900042 | Unknown error |

### static func lstat(String)

```cangjie
public static func lstat(path: String): Stat
```

**Function:** Retrieves symbolic link file information synchronously.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| path | String | Yes | - | The application sandbox path of the file. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Stat](#class-stat) | Represents detailed file information. |

**Exceptions:**

- BusinessException: Error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900002 | No such file or directory |
  | 13900008 | Bad file descriptor |
  | 13900011 | Out of memory |
  | 13900012 | Permission denied |
  | 13900013 | Bad address |
  | 13900018 | Not a directory |
  | 13900030 | File name too long |
  | 13900033 | Too many symbolic links encountered |
  | 13900038 | Value too large for defined data type |
  | 13900042 | Unknown error |

### static func mkdir(String)

```cangjie
public static func mkdir(path: String): Unit
```

**Function:** Creates a directory.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| path | String | Yes | - | The application sandbox path of the directory. |

**Exceptions:**

- BusinessException: Error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900001 | Operation not permitted |
  | 13900002 | No such file or directory |
  | 13900008 | Bad file descriptor |
  | 13900011 | Out of memory |
  | 13900012 | Permission denied |
  | 13900013 | Bad address |
  | 13900015 | File exists |
  | 13900018 | Not a directory |
  | 13900020 | Invalid argument |
  | 13900025 | No space left on device |
  | 13900028 | Too many links |
  | 13900030 | File name too long |
  | 13900033 | Too many symbolic links encountered |
  | 13900041 | Quota exceeded |
  | 13900042 | Unknown error |

### static func mkdir(String, Bool)

```cangjie
public static func mkdir(path: String, recursion: Bool): Unit
```

**Function:** Creates a directory. When `recursion` is set to `true`, multi-level directories can be created.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| path | String | Yes | - | The application sandbox path of the directory. |
| recursion | Bool | Yes | - | Whether to create multi-level directories. When `recursion` is `true`, multi-level directories can be created. When `recursion` is `false`, only a single-level directory can be created. |

**Exceptions:**

- BusinessException: Error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900001 | Operation not permitted |
  | 13900002 | No such file or directory |
  | 13900008 | Bad file descriptor |
  | 13900011 | Out of memory |
  | 13900012 | Permission denied |
  | 13900013 | Bad address |
  | 13900015 | File exists |
  | 13900018 | Not a directory |
  | 13900020 | Invalid argument |
  | 13900025 | No space left on device |
  | 13900028 | Too many links |
  | 13900030 | File name too long |
  | 13900033 | Too many symbolic links encountered |
  | 13900041 | Quota exceeded |
  | 13900042 | Unknown error |

### static func mkdtemp(String)

```cangjie
public static func mkdtemp(prefix: String): String
```

**Function:** Creates a temporary directory synchronously.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| prefix | String | Yes | - | The directory path, which must end with "XXXXXX". The "XXXXXX" at the end of the path will be replaced with random characters to create a unique directory name. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | The generated unique directory path. |

**Exceptions:**

- BusinessException: Error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900001 | Operation not permitted |
  | 13900002 | No such file or directory |
  | 13900008 | Bad file descriptor |
  | 13900011 | Out of memory |
  | 13900012 | Permission denied |
  | 13900013 | Bad address |
  | 13900015 | File exists |
  | 13900018 | Not a directory |
  | 13900020 | Invalid argument |
  | 13900025 | No space left on device |
  | 13900028 | Too many links |
  | 13900030 | File name too long |
  | 13900033 | Too many symbolic links encountered |
  | 13900041 | Quota exceeded |
  | 13900042 | Unknown error |

### static func moveDir(String, String, Int32)

```cangjie
public static func moveDir(src: String, dest: String, mode!: Int32 = 0): Unit
```

**Function:** Moves a source directory to the target path.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| src | String | Yes | - | The application sandbox path of the source directory. |
| dest | String | Yes | - | The application sandbox path of the target directory. |
| mode | Int32 | No | 0 | The move mode. Default is 0.<br/>-&nbsp;mode 0: Directory-level exception. If a non-empty directory with the same name as the source directory exists in the target directory, an exception is thrown.<br/>-&nbsp;mode 1: File-level exception. If a directory with the same name as the source directory exists in the target directory and contains files with the same names, an exception is thrown. Non-conflicting files from the source directory will be moved to the target directory, and non-conflicting files in the target directory will be retained. Conflict file information will be provided in the `data` property of the thrown exception (ConfilictFileException) as an Array\<ConflictFiles>.<br/>-&nbsp;mode 2: File-level force overwrite. If a directory with the same name as the source directory exists in the target directory and contains files with the same names, all conflicting files will be forcibly overwritten, and non-conflicting files will be retained.<br/>-&nbsp;mode 3: Directory-level force overwrite. The moved directory in the target directory will exactly match the source directory. If a directory with the same name as the source directory exists in the target directory, all original files in that directory will not be retained. |

**Exceptions:**

- BusinessException: Error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900001 | Operation not permitted |
  | 13900002 | No such file or directory |
  | 13900008 | Bad file descriptor |
  | 13900011 | Out of memory |
  | 13900012 | Permission denied |
  | 13900013 | Bad address |
  | 13900014 | Device or resource busy |
  | 13900015 | File exists |
  | 13900016 | Cross-device link |
  | 13900018 | Not a directory |
  | 13900019 | Is a directory |
  | 13900020 | Invalid argument |
  | 13900025 | No space left on device |
  | 13900027 | Read-only file system |
  | 13900028 | Too many links |
  | 13900032 | Directory not empty |
  | 13900033 | Too many symbolic links encountered |
  | 13900041 | Quota exceeded |
  | 13900042 | Unknown error |

### static func moveFile(String, String, Int32)

```cangjie
public static func moveFile(src: String, dest: String, mode!: Int32 = 0): Unit
```

**Function:** Moves a source directory to the target path.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| src | String | Yes | - | The application sandbox path of the source directory. |
| dest | String | Yes | - | The application sandbox path of the target directory. |
| mode | Int32 | No | 0 | The move mode. Default is 0.<br/>-&nbsp;mode 0: Directory-level exception. If a non-empty directory with the same name as the source directory exists in the target directory, an exception is thrown.<br/>-&nbsp;mode 1: File-level exception. If a directory with the same name as the source directory exists in the target directory and contains files with the same names, an exception is thrown. Non-conflicting files from the source directory will be moved to the target directory, and non-conflicting files in the target directory will be retained. Conflict file information will be provided in the `data` property of the thrown exception (ConfilictFileException) as an Array\<ConflictFiles>.<br/>-&nbsp;mode 2: File-level force overwrite. If a directory with the same name as the source directory exists in the target directory and contains files with the same names, all conflicting files will be forcibly overwritten, and non-conflicting files will be retained.<br/>-&nbsp;mode 3: Directory-level force overwrite. The moved directory in the target directory will exactly match the source directory. If a directory with the same name as the source directory exists in the target directory, all original files in that directory will not be retained. |

**Exceptions:**

- BusinessException: Error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode### static func open(String, Int64)

```cangjie
public static func open(path: String, mode!: Int64 = OpenMode.READ_ONLY): File
```

**Function:** Opens a file synchronously. Supports opening files using URI.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| path | String | Yes | - | Application sandbox path or URI of the file to open. |
| mode | Int64 | No | OpenMode.READ_ONLY | Options for opening the file. Must specify one of the following options, defaults to read-only mode:<br/>- OpenMode.READ_ONLY(0o0): Open in read-only mode.<br/>- OpenMode.WRITE_ONLY(0o1): Open in write-only mode.<br/>- OpenMode.READ_WRITE(0o2): Open in read-write mode.<br/>Additional functional options can be appended using bitwise OR, with no extra options by default:<br/>- OpenMode.CREATE(0o100): Create the file if it does not exist.<br/>- OpenMode.TRUNC(0o1000): If the file exists and has write permissions, truncate its length to zero.<br/>- OpenMode.APPEND(0o2000): Open in append mode, subsequent writes will append to the end of the file.<br/>- OpenMode.NONBLOCK(0o4000): If path points to a FIFO, block special file, or character special file, perform non-blocking operations for this open and subsequent I/O.<br/>- OpenMode.DIR(0o200000): Error if path does not point to a directory. Write permissions cannot be appended.<br/>- OpenMode.NOFOLLOW(0o400000): Error if path points to a symbolic link.<br/>- OpenMode.SYNC(0o4010000): Open the file in synchronous I/O mode. |

**Return Value:**

| Type | Description |
|:----|:----|
| [File](#class-file) | The opened File object. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900001 | Operation not permitted |
  | 13900002 | No such file or directory |
  | 13900004 | Interrupted system call |
  | 13900006 | No such device or address |
  | 13900008 | Bad file descriptor |
  | 13900011 | Out of memory |
  | 13900012 | Permission denied |
  | 13900013 | Bad address |
  | 13900014 | Device or resource busy |
  | 13900015 | File exists |
  | 13900017 | No such device |
  | 13900018 | Not a directory |
  | 13900019 | Is a directory |
  | 13900020 | Invalid argument |
  | 13900022 | Too many open files |
  | 13900023 | Text file busy |
  | 13900024 | File too large |
  | 13900025 | No space left on device |
  | 13900027 | Read-only file system |
  | 13900029 | Resource deadlock would occur |
  | 13900030 | File name too long |
  | 13900033 | Too many symbolic links encountered |
  | 13900034 | Operation would block |
  | 13900038 | Value too large for defined data type |
  | 13900041 | Quota exceeded |
  | 13900042 | Unknown error |
  | 13900044 | Network is unreachable |

### static func read(Int32, Array\<Byte>, ReadOptions)

```cangjie
public static func read(fd: Int32, buffer: Array<Byte>, options!: ReadOptions = ReadOptions()): Int64
```

**Function:** Reads data from a file synchronously.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| fd | Int32 | Yes | - | Opened file descriptor. |
| buffer | Array\<[Byte](../../../../User_Manual/source_zh_cn/basic_data_type/integer.md#unsigned-integer-types)> | Yes | - | Buffer to store the read file data. |
| options | [ReadOptions](#class-readoptions) | No | ReadOptions() | Supports the following options:<br/>- offset, Int64 type, indicates the desired position to read from the file. Defaults to the current position.<br/>- length, UIntNative type, indicates the desired length of data to read. Defaults to the buffer length. |

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | The actual length of data read. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900004 | Interrupted system call |
  | 13900005 | I/O error |
  | 13900008 | Bad file descriptor |
  | 13900010 | Try again |
  | 13900013 | Bad address |
  | 13900019 | Is a directory |
  | 13900020 | Invalid argument |
  | 13900034 | Operation would block |
  | 13900042 | Unknown error |
  | 13900044 | Network is unreachable |

### static func readLines(String, Options)

```cangjie
public static func readLines(filePath: String, options!: Options = Options()): ReaderIterator
```

**Function:** Reads file text content line by line synchronously.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| filePath | String | Yes | - | Application sandbox path of the file. |
| options | [Options](#class-options) | No | Options() | Optional. Supports the following options:<br/>- encoding, String type, valid when data is of String type, indicates the encoding method of the data, defaults to "utf-8", only supports "utf-8". |

**Return Value:**

| Type | Description |
|:----|:----|
| [ReaderIterator](#class-readeriterator) | Returns a file reading iterator. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900002 | No such file or directory |
  | 13900012 | Permission denied |
  | 13900015 | File exists |
  | 13900019 | Is a directory |
  | 13900020 | Invalid argument |
  | 13900022 | Too many open files |
  | 13900025 | No space left on device |
  | 13900027 | Read-only file system |
  | 13900030 | File name too long |
  | 13900033 | Too many symbolic links encountered |
  | 13900041 | Quota exceeded |
  | 13900042 | Unknown error |
  | 13900044 | Network is unreachable |

### static func readText(String, ReadTextOptions)

```cangjie
public static func readText(filePath: String, options!: ReadTextOptions = ReadTextOptions()): String
```

**Function:** Reads file content synchronously in text mode (i.e., directly reads the text content of the file).

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| filePath | String | Yes | - | Application sandbox path of the file. |
| options | [ReadTextOptions](#class-readtextoptions) | No | ReadTextOptions() | Supports the following options:<br/>- offset, Int64 type, indicates the desired position to read from the file. Optional, defaults to the initial position.<br/>- length, Int64 type, indicates the desired length of data to read. Optional, defaults to the file length.<br/>- encoding, String type, valid when data is of String type, indicates the encoding method of the data, defaults to "utf-8", only supports "utf-8". |

**Return Value:**

| Type | Description |
|:----|:----|
| String | Returns the content read from the file. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900001 | Operation not permitted |
  | 13900004 | Interrupted system call |
  | 13900005 | I/O error |
  | 13900008 | Bad file descriptor |
  | 13900010 | Try again |
  | 13900013 | Bad address |
  | 13900019 | Is a directory |
  | 13900020 | Invalid argument |
  | 13900024 | File too large |
  | 13900025 | No space left on device |
  | 13900034 | Operation would block |
  | 13900041 | Quota exceeded |
  | 13900042 | Unknown error |
  | 13900044 | Network is unreachable |

### static func rename(String, String)

```cangjie
public static func rename(oldPath: String, newPath: String): Unit
```

**Function:** Renames a file or directory.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| oldPath | String | Yes | - | Original application sandbox path of the file. |
| newPath | String | Yes | - | New application sandbox path of the file. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900001 | Operation not permitted |
  | 13900002 | No such file or directory |
  | 13900008 | Bad file descriptor |
  | 13900011 | Out of memory |
  | 13900012 | Permission denied |
  | 13900013 | Bad address |
  | 13900014 | Device or resource busy |
  | 13900015 | File exists |
  | 13900016 | Cross-device link |
  | 13900018 | Not a directory |
  | 13900019 | Is a directory |
  | 13900020 | Invalid argument |
  | 13900025 | No space left on device |
  | 13900027 | Read-only file system |
  | 13900028 | Too many links |
  | 13900032 | Directory not empty |
  | 13900033 | Too many symbolic links encountered |
  | 13900041 | Quota exceeded |
  | 13900042 | Unknown error |

### static func rmdir(String)

```cangjie
public static func rmdir(path: String): Unit
```

**Function:** Deletes a directory.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| path | String | Yes | - | Application sandbox path of the directory. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900001 | Operation not permitted |
  | 13900002 | No such file or directory |
  | 13900011 | Out of memory |
  | 13900012 | Permission denied |
  | 13900013 | Bad address |
  | 13900014 | Device or resource busy |
  | 13900018 | Not a directory |
  | 13900020 | Invalid argument |
  | 13900027 | Read-only file system1 |
  | 13900030 | File name too long |
  | 13900032 | Directory not empty |
  | 13900042 | Unknown error |

### static func stat(Int32)

```cangjie
public static func stat(file: Int32): Stat
```

**Function:** Retrieves detailed attribute information of a file.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| file | Int32 | Yes | - | Opened file descriptor fd. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Stat](#class-stat) | Represents the specific information of the file. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900002 | No such file or directory |
  | 13900004 | Interrupted system call |
  | 13900005 | I/O error |
  | 13900008 | Bad file descriptor |
  | 13900011 | Out of memory |
  | 13900012 | Permission denied |
  | 13900013 | Bad address |
  | 13900018 | Not a directory |
  | 13900030 | File name too long |
  | 13900031 | Function not implemented |
  | 13900033 | Too many symbolic links encountered |
  | 13900038 | Value too large for defined data type |
  | 13900042 | Unknown error |

### static func stat(String)

```cangjie
public static func stat(file: String): Stat
```

**Function:** Retrieves detailed attribute information of a file.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| file | String | Yes | - | Application sandbox path of the file. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Stat](#class-stat) | Represents the specific information of the file. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900002 | No such file or directory |
  | 13900004 | Interrupted system call |
  | 13900005 | I/O error |
  | 13900008 | Bad file descriptor |
  | 13900011 | Out of memory |
  | 13900012 | Permission denied |
  | 13900013 | Bad address |
  | 13900018 | Not a directory |
  | 13900030 | File name too long |
  | 13900031 | Function not implemented |
  | 13900033 | Too many symbolic links encountered |
  | 13900038 | Value too large for defined data type |
  | 13900042 | Unknown error |

### static func truncate(String, Int64)

```cangjie
public static func truncate(file: String, len!: Int64 = 0): Unit
```

**Function:** Truncates a file synchronously.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| file | String | Yes | - | Application sandbox path of the file. |
| len | Int64 | No | 0 | Length of the file after truncation, in bytes. Defaults to 0. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900001 | Operation not permitted |
  | 13900002 | No such file or directory |
  | 13900004 | Interrupted system call |
  | 13900005 | I/O error |
  | 13900008 | Bad file descriptor |
  | 13900012 | Permission denied |
  | 13900013 | Bad address |
  | 13900018 | Not a directory |
  | 13900019 | Is a directory |
  | 13900020 | Invalid argument |
  | 13900023 | Text file busy |
  | 13900024 | File too large |
  | 13900027 | Read-only file system |
  | 13900030 | File name too long |
  | 13900033 | Too many symbolic links encountered |
  | 13900042 | Unknown error |

### static func truncate(Int32, Int64)

```cangjie
public static func truncate(file: Int32, len!: Int64 = 0): Unit
```

**Function:** Truncates a file synchronously.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| file | Int32 | Yes | - | Opened file descriptor fd. |
| len | Int64 | No | 0 | Length of the file after truncation, in bytes. Defaults to 0. |

**Exceptions:**

-## class Filter

```cangjie
public class Filter {
    public var suffix: Array<String>
    public var displayName: Array<String>
    public var mimeType: Array<String>
    public var fileSizeOver:?Int64
    public var lastModifiedAfter:?Float64
    public var excludeMedia: Bool
    public init(
        suffix!: Array<String> = Array<String>(),
        displayName!: Array<String> = Array<String>(),
        mimeType!: Array<String> = Array<String>(),
        fileSizeOver!: ?Int64 = None,
        lastModifiedAfter!: ?Float64 = None,
        excludeMedia!: Bool = false
    )
}
```

**Function:** File filtering configuration type, used by the listFile interface. Note: mimeType and excludeMedia filtering are currently unsupported.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var displayName

```cangjie
public var displayName: Array<String>
```

**Function:** Fuzzy filename matching with OR relationship between keywords. Currently only supports wildcard *.

**Type:** Array\<String>

**Access:** Read-write

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var excludeMedia

```cangjie
public var excludeMedia: Bool
```

**Function:** Whether to exclude files already present in Media. Reserved capability, currently unsupported.

**Type:** Bool

**Access:** Read-write

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var fileSizeOver

```cangjie
public var fileSizeOver:?Int64
```

**Function:** File size matching - files larger than specified size.

**Type:** ?Int64

**Access:** Read-write

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var lastModifiedAfter

```cangjie
public var lastModifiedAfter:?Float64
```

**Function:** File last modified time matching - files modified after specified timestamp.

**Type:** ?Float64

**Access:** Read-write

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var mimeType

```cangjie
public var mimeType: Array<String>
```

**Function:** Exact mime type matching with OR relationship between keywords. Reserved capability, currently unsupported.

**Type:** Array\<String>

**Access:** Read-write

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var suffix

```cangjie
public var suffix: Array<String>
```

**Function:** Exact file extension matching with OR relationship between keywords.

**Type:** Array\<String>

**Access:** Read-write

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### init(Array\<String>, Array\<String>, Array\<String>, ?Int64, ?Float64, Bool)

```cangjie
public init(
    suffix!: Array<String> = Array<String>(),
    displayName!: Array<String> = Array<String>(),
    mimeType!: Array<String> = Array<String>(),
    fileSizeOver!: ?Int64 = None,
    lastModifiedAfter!: ?Float64 = None,
    excludeMedia!: Bool = false
)
```

**Function:** Constructs a Filter object.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| suffix | Array\<String> | No | Array<String>() | Exact file extension matching with OR relationship between keywords. |
| displayName | Array\<String> | No | Array<String>() | Fuzzy filename matching with OR relationship between keywords. Currently only supports wildcard *. |
| mimeType | Array\<String> | No | Array<String>() | Exact mime type matching with OR relationship between keywords. Reserved capability, currently unsupported. |
| fileSizeOver | ?Int64 | No | None | File size matching - files larger than specified size. |
| lastModifiedAfter | ?Float64 | No | None | File last modified time matching - files modified after specified timestamp. |
| excludeMedia | Bool | No | false | Whether to exclude files already present in Media. Reserved capability, currently unsupported. |

**Exceptions:**

- BusinessException: Error codes as shown below, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900020 | Invalid argument |


## class ListFileOptions

```cangjie
public class ListFileOptions {
    public var recursion: Bool
    public var listNum: Int32
    public var filter: Filter
    public init(
        recursion!: Bool = false,
        listNum!: Int32 = 0,
        filter!: Filter = Filter()
    )
}
```

**Function:** Options type supported by the listFile interface.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var filter

```cangjie
public var filter: Filter
```

**Function:** Valid when data is String type, indicates data encoding method (default "utf-8"). Only "utf-8" is supported.

**Type:** [Filter](#class-filter)

**Access:** Read-write

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var listNum

```cangjie
public var listNum: Int32
```

**Function:** Number of filenames to list. When set to 0, lists all files (default is 0).

**Type:** Int32

**Access:** Read-write

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var recursion

```cangjie
public var recursion: Bool
```

**Function:** Whether to recursively list filenames in subdirectories. Default is false. When recursion is false, returns filenames and folder names in current directory that meet filtering requirements. When recursion is true, returns relative paths (starting with /) of all files meeting filtering requirements in this directory.

**Type:** Bool

**Access:** Read-write

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### init(Bool, Int32, Filter)

```cangjie
public init(
    recursion!: Bool = false,
    listNum!: Int32 = 0,
    filter!: Filter = Filter()
)
```

**Function:** Constructs a ListFileOptions object.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| recursion | Bool | No | false | Whether to recursively list filenames in subdirectories. Default is false. When recursion is false, returns filenames and folder names in current directory that meet filtering requirements. When recursion is true, returns relative paths (starting with /) of all files meeting filtering requirements in this directory. |
| listNum | Int32 | No | 0 | Number of filenames to list. When set to 0, lists all files (default is 0). |
| filter | [Filter](#class-filter) | No | Filter() | File filtering options. Currently only supports extension matching, fuzzy filename query, file size filtering, and last modified time filtering. |


## class OpenMode

```cangjie
public class OpenMode {
    public static const READ_ONLY: Int64 = 0o0
    public static const WRITE_ONLY: Int64 = 0o1
    public static const READ_WRITE: Int64 = 0o2
    public static const CREATE: Int64 = 0o100
    public static const TRUNC: Int64 = 0o1000
    public static const APPEND: Int64 = 0o2000
    public static const NONBLOCK: Int64 = 0o4000
    public static const DIR: Int64 = 0o200000
    public static const NOFOLLOW: Int64 = 0o400000
    public static const SYNC: Int64 = 0o4010000
}
```

**Function:** Constants for flags parameter in open interface. File opening flags.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### static const APPEND

```cangjie
public static const APPEND: Int64 = 0o2000
```

**Function:** Open in append mode - subsequent writes will append to end of file.

**Type:** Int64

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### static const CREATE

```cangjie
public static const CREATE: Int64 = 0o100
```

**Function:** Create file if it does not exist.

**Type:** Int64

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### static const DIR

```cangjie
public static const DIR: Int64 = 0o200000
```

**Function:** Error if path does not point to directory.

**Type:** Int64

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### static const NOFOLLOW

```cangjie
public static const NOFOLLOW: Int64 = 0o400000
```

**Function:** Error if path points to symbolic link.

**Type:** Int64

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### static const NONBLOCK

```cangjie
public static const NONBLOCK: Int64 = 0o4000
```

**Function:** If path points to FIFO, block special file or character special file, this open and subsequent I/O operations will be non-blocking.

**Type:** Int64

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### static const READ_ONLY

```cangjie
public static const READ_ONLY: Int64 = 0o0
```

**Function:** Open for reading only.

**Type:** Int64

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### static const READ_WRITE

```cangjie
public static const READ_WRITE: Int64 = 0o2
```

**Function:** Open for reading and writing.

**Type:** Int64

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### static const SYNC

```cangjie
public static const SYNC: Int64 = 0o4010000
```

**Function:** Open file with synchronous I/O.

**Type:** Int64

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### static const TRUNC

```cangjie
public static const TRUNC: Int64 = 0o1000
```

**Function:** If file exists and is opened for writing or reading/writing, truncate its length to zero.

**Type:** Int64

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### static const WRITE_ONLY

```cangjie
public static const WRITE_ONLY: Int64 = 0o1
```

**Function:** Open for writing only.

**Type:** Int64

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21## class Options

```cangjie
public open class Options {
    public var encoding: String
    public init(
        encoding!: String = "utf-8"
    )
}
```

**Function:** Optional type, supports the use of readLines interface.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var encoding

```cangjie
public var encoding: String
```

**Function:** File encoding method. Optional.

**Type:** String

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### init(String)

```cangjie
public init(
    encoding!: String = "utf-8"
)
```

**Function:** Constructs an Options object.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| encoding | String | No | "utf-8" | Specifies the encoding method for strings. |


## class RandomAccessFile

```cangjie
public class RandomAccessFile {}
```

**Function:** Random access file stream. Before calling methods of RandomAccessFile, you need to construct a RandomAccessFile instance via the [createRandomAccessFile](#func-createrandomaccessfilestring-string) method.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### prop fd

```cangjie
public prop fd: Int32
```

**Function:** The opened file descriptor.

**Type:** Int32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### prop filePointer

```cangjie
public prop filePointer: Int64
```

**Function:** The offset pointer of the RandomAccessFile object.

**Type:** Int64

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### func close()

```cangjie
public func close(): Unit
```

**Function:** Synchronously closes the RandomAccessFile object.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let randomAccessFile = FileIo.createRandomAccessFile(filePath, mode: (OpenMode.CREATE | OpenMode.READ_WRITE))
randomAccessFile.close()
```

### func read(Array\<Byte>, ReadOptions)

```cangjie
public func read(buffer: Array<Byte>, options!: ReadOptions = ReadOptions()): Int64
```

**Function:** Reads data from the file synchronously.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| buffer | Array\<[Byte](../../../../User_Manual/source_zh_cn/basic_data_type/integer.md#unsigned-integer-types)> | Yes | - | Buffer for reading the file. |
| options | [ReadOptions](#class-readoptions) | No | ReadOptions() | **Named parameter.** Supports the following options: <br>- length: ?UIntNative type, indicating the expected length of data to read. Optional, defaults to buffer length. <br>- offset: ?Int64 type, indicating the expected position to read from the file. Optional, defaults to the current position. |

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | The actual length read. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900004 | Interrupted system call |
  | 13900005 | I/O error |
  | 13900008 | Bad file descriptor |
  | 13900010 | Try again |
  | 13900013 | Bad address |
  | 13900019 | Is a directory |
  | 13900020 | Invalid argument |
  | 13900034 | Operation would block |
  | 13900042 | Unknown error |
  | 13900044 | Network is unreachable |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let file = FileIo.open(filePath, mode: (OpenMode.CREATE | OpenMode.READ_WRITE))
let randomAccessFile = FileIo.createRandomAccessFile(file)
let length: Int64 = 4096
let arrayBuffer = Array<Byte>(length, repeat: 0)
let readLength = randomAccessFile.read(arrayBuffer)
randomAccessFile.close()
FileIo.close(file)
```

### func setFilePointer(Int64)

```cangjie
public func setFilePointer(fp: Int64): Unit
```

**Function:** Sets the file offset pointer.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| fp | Int64 | Yes | - | The offset pointer of the RandomAccessFile object. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let randomAccessFile = FileIo.createRandomAccessFile(filePath, mode: (OpenMode.CREATE | OpenMode.READ_WRITE))
randomAccessFile.setFilePointer(1)
randomAccessFile.close()
```

### func write(String, WriteOptions)

```cangjie
public func write(buffer: String, options!: WriteOptions = WriteOptions()): Int64
```

**Function:** Writes data to the file synchronously.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| buffer | String | Yes | - | Data to be written to the file. |
| options | [WriteOptions](#class-writeoptions) | No | WriteOptions() | **Named parameter.** Supports the following options: <br>- length: ?UIntNative type, indicating the expected length of data to write. Defaults to buffer length. <br>- offset: ?Int64 type, indicating the expected position to write to the file. Optional, defaults to the current position. <br>- encoding: String type, valid when data is of String type, indicating the encoding method of the data. Defaults to "utf-8". Only "utf-8" is supported. |

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | The actual length written. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900001 | Operation not permitted |
  | 13900004 | Interrupted system call |
  | 13900005 | I/O error |
  | 13900008 | Bad file descriptor |
  | 13900010 | Try again |
  | 13900013 | Bad address |
  | 13900020 | Invalid argument |
  | 13900024 | File too large |
  | 13900025 | No space left on device |
  | 13900034 | Operation would block |
  | 13900041 | Quota exceeded |
  | 13900042 | Unknown error |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let randomAccessFile = FileIo.createRandomAccessFile(filePath, mode: (OpenMode.CREATE | OpenMode.READ_WRITE))
let option = WriteOptions(length: 5, offset: 5)
let bytesWritten = randomAccessFile.write("hello, world", options: option)
randomAccessFile.close()
```

### func write(Array\<Byte>, WriteOptions)

```cangjie
public func write(buffer: Array<Byte>, options!: WriteOptions = WriteOptions()): Int64
```

**Function:** Writes data to the file synchronously.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| buffer | Array\<[Byte](../../../../User_Manual/source_zh_cn/basic_data_type/integer.md#unsigned-integer-types)> | Yes | - | Data to be written to the file. |
| options | [WriteOptions](#class-writeoptions) | No | WriteOptions() | **Named parameter.** Supports the following options: <br>- length: ?UIntNative type, indicating the expected length of data to write. Defaults to buffer length. <br>- offset: ?Int64 type, indicating the expected position to write to the file. Optional, defaults to the current position. <br>- encoding: String type, valid when data is of String type, indicating the encoding method of the data. Defaults to "utf-8". Only "utf-8" is supported. |

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | The actual length written. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900001 | Operation not permitted |
  | 13900004 | Interrupted system call |
  | 13900005 | I/O error |
  | 13900008 | Bad file descriptor |
  | 13900010 | Try again |
  | 13900013 | Bad address |
  | 13900020 | Invalid argument |
  | 13900024 | File too large |
  | 13900025 | No space left on device |
  | 13900034 | Operation would block |
  | 13900041 | Quota exceeded |
  | 13900042 | Unknown error |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let randomAccessFile = FileIo.createRandomAccessFile(filePath, mode: (OpenMode.CREATE | OpenMode.READ_WRITE))
let option = WriteOptions(length: 5, offset: 5)
let arr: Array<UInt8> = [104, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100]
let bytesWritten = randomAccessFile.write(arr, options: option)
randomAccessFile.close()
```


## class RandomAccessFileOptions

```cangjie
public class RandomAccessFileOptions {
    public var start: Option<Int64>
    public var end: Option<Int64>
    public init(
        start!: Option<Int64> = None,
        end!: Option<Int64> = None
    )
}
```

**Function:** Optional type, supports the use of createRandomAccessFile interface.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var end

```cangjie
public var end: Option<Int64>
```

**Function:** The expected end position for reading. Optional, defaults to the end of the file.

**Type:** [Option](#initoptionint-optionint)\<Int64>

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var start

```cangjie
public var start: Option<Int64>
```

**Function:** The expected starting position for reading the file. Optional, defaults to the current position.

**Type:** [Option](#initoptionint-optionint)\<Int64>

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### init(Option\<Int64>, Option\<Int64>)

```cangjie
public init(
    start!: Option<Int64> = None,
    end!: Option<Int64> = None
)
```

**Function:** Constructs a RandomAccessFileOptions object.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| start | [Option](#initoptionint-optionint)\<Int64> | No | None | The expected starting position for reading the file. Optional, defaults to the current position. |
| end | [Option](#initoptionint-optionint)\<Int64> | No | None | The expected end position for reading. Optional, defaults to the end of the file. |## class ReaderIterator

```cangjie
public class ReaderIterator {}
```

**Function:** File reading iterator. Before calling methods of ReaderIterator, a ReaderIterator instance must first be constructed via the readLines method.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### func next()

```cangjie
public func next(): ReaderIteratorResult
```

**Function:** Gets the next item from the iterator.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| [ReaderIteratorResult](#class-readeriteratorresult) | File reading iterator result. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900005 | I/O error |
  | 13900037 | No data available |
  | 13900042 | Unknown error |


## class ReaderIteratorResult

```cangjie
public class ReaderIteratorResult {
    public var done: Bool
    public var value: String
}
```

**Function:** File reading iterator result, supporting the ReaderIterator interface.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var done

```cangjie
public var done: Bool
```

**Function:** Indicates whether the iterator has completed iteration.

**Type:** Bool

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var value

```cangjie
public var value: String
```

**Function:** File text content read line by line.

**Type:** String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21


## class ReadOptions

```cangjie
public open class ReadOptions {
    public var offset: Option<Int64>
    public var length: Option<UIntNative>
    public init(
        offset!: Option<Int64> = None,
        length!: Option<UIntNative> = None
    )
}
```

**Function:** Optional type, supporting the read interface.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var length

```cangjie
public var length: Option<UIntNative>
```

**Function:** Expected length of data to read. Defaults to buffer length.

**Type:** [Option](#initoptionint-optionint)\<UIntNative>

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var offset

```cangjie
public var offset: Option<Int64>
```

**Function:** Expected file position to read (based on current filePointer plus offset). Defaults to reading from the offset pointer (filePointer).

**Type:** [Option](#initoptionint-optionint)\<Int64>

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### init(Option\<Int64>, Option\<UIntNative>)

```cangjie
public init(
    offset!: Option<Int64> = None,
    length!: Option<UIntNative> = None
)
```

**Function:** Constructs a ReadOptions object.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| offset | [Option](#initoptionint-optionint)\<Int64> | No | None | Expected file position to read (based on current filePointer plus offset). Defaults to reading from the offset pointer (filePointer). |
| length | [Option](#initoptionint-optionint)\<UIntNative> | No | None | Expected length of data to read. Defaults to buffer length. |


## class ReadTextOptions

```cangjie
public class ReadTextOptions <: ReadOptions {
    public var encoding: String
    public init(
        offset!: Option<Int64> = None,
        length!: Option<UIntNative> = None,
        encoding!: String = "utf-8"
    )
}
```

**Function:** Optional type, supporting the readText interface.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parent Type:**

- [ReadOptions](#class-readoptions)

### var encoding

```cangjie
public var encoding: String
```

**Function:** Valid when data is of String type, indicates the encoding method of the data. Default is "utf-8", only "utf-8" is supported.

**Type:** String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### init(Option\<Int64>, Option\<UIntNative>, String)

```cangjie
public init(
    offset!: Option<Int64> = None,
    length!: Option<UIntNative> = None,
    encoding!: String = "utf-8"
)
```

**Function:** Constructs a ReadOptions object.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| offset | [Option](#initoptionint-optionint)\<Int64> | No | None | Expected file position to read (based on current filePointer plus offset). Defaults to reading from the offset pointer (filePointer). |
| length | [Option](#initoptionint-optionint)\<UIntNative> | No | None | Expected length of data to read. Defaults to buffer length. |
| encoding | String | No | "utf-8" | Valid when data is of String type, indicates the encoding method of the data. Default is "utf-8", only "utf-8" is supported. |


## class Stat

```cangjie
public class Stat {}
```

**Function:** File details. Before calling methods of Stat, a Stat instance must first be constructed via the [FileIo.stat()](#func-statstring-string) method.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### prop atime

```cangjie
public prop atime: Int64
```

**Function:** Last access time of the file, represented as seconds since 00:00:00 on January 1, 1970.

**Type:** Int64

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### prop ctime

```cangjie
public prop ctime: Int64
```

**Function:** Last time the file status was changed, represented as seconds since 00:00:00 on January 1, 1970.

**Type:** Int64

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### prop gid

```cangjie
public prop gid: Int64
```

**Function:** Group ID of the file owner.

**Type:** Int64

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### prop ino

```cangjie
public prop ino: Int64
```

**Function:** Identifies the file. Typically, different files on the same device have different INOs.

**Type:** Int64

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### prop mode

```cangjie
public prop mode: Int64
```

**Function:** Represents file permissions. The meanings of each bit are as follows.

>**Note:**
>
>The following values are in octal. The returned value is in decimal; convert it before checking.<br/>- 0o400: User read. For regular files, the owner can read the file; for directories, the owner can read directory entries.<br/>- 0o200: User write. For regular files, the owner can write to the file; for directories, the owner can create/delete directory entries.<br/>- 0o100: User execute. For regular files, the owner can execute the file; for directories, the owner can search for a given pathname in the directory.<br/>- 0o040: Group read. For regular files, the group can read the file; for directories, the group can read directory entries.<br/>- 0o020: Group write. For regular files, the group can write to the file; for directories, the group can create/delete directory entries.<br/>- 0o010: Group execute. For regular files, the group can execute the file; for directories, the group can search for a given pathname in the directory.<br/>- 0o004: Others read. For regular files, other users can read the file; for directories, other groups can read directory entries.<br/>- 0o002: Others write. For regular files, other users can write to the file; for directories, other groups can create/delete directory entries.<br/>- 0o001: Others execute. For regular files, other users can execute the file; for directories, other groups can search for a given pathname in the directory.

**Type:** Int64

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### prop mtime

```cangjie
public prop mtime: Int64
```

**Function:** Last modification time of the file, represented as seconds since 00:00:00 on January 1, 1970.

**Type:** Int64

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### prop size

```cangjie
public prop size: Int64
```

**Function:** Size of the file in bytes. Only valid for regular files.

**Type:** Int64

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### prop uid

```cangjie
public prop uid: Int64
```

**Function:** User ID of the file owner.

**Type:** Int64

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### func isBlockDevice()

```cangjie
public func isBlockDevice(): Bool
```

**Function:** Determines whether the file is a block special file. A block special file can only be accessed in blocks and is accessed with caching.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| Bool | Indicates whether the file is a block special device. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let isBLockDevice = FileIo.stat(filePath).isBlockDevice()
```

### func isCharacterDevice()

```cangjie
public func isCharacterDevice(): Bool
```

**Function:** Determines whether the file is a character special file. A character special device can be accessed randomly and is accessed without caching.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| Bool | Indicates whether the file is a character special device. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let isCharacterDevice = FileIo.stat(filePath).isCharacterDevice()
```

### func isDirectory()

```cangjie
public func isDirectory(): Bool
```

**Function:** Determines whether the file is a directory.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| Bool | Indicates whether the file is a directory. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let dirPath = pathDir + "/test"
let isDirectory = FileIo.stat(dirPath).isDirectory()
```

### func isFIFO()

```cangjie
public func isFIFO(): Bool
```

**Function:** Determines whether the file is a named pipe (sometimes called FIFO). Named pipes are typically used for inter-process communication.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| Bool | Indicates whether the file is a FIFO. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let isFIFO = FileIo.stat(filePath).isFIFO()
```

### func isFile()

```cangjie
public func isFile(): Bool
```

**Function:** Determines whether the file is a regular file.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| Bool | Indicates whether the file is a regular file. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let isFile = FileIo.stat(filePath).isFile()
```

### func isSocket()

```cangjie
public func isSocket(): Bool
```

**Function:** Determines whether the file is a socket.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| Bool | Indicates whether the file is a socket. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let isSocket = FileIo.stat(filePath).isSocket()
```

### func isSymbolicLink()

```cangjie
public func isSymbolicLink(): Bool
```

**Function:** Determines whether the file is a symbolic link.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| Bool | Indicates whether the file is a symbolic link. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let isSymbolicLink = FileIo.stat(filePath).isSymbolicLink()
```## class Stream

```cangjie
public class Stream {}
```

**Function:** File stream. Before calling Stream methods, a Stream instance must first be constructed via the [FileIo.createStream](#func-createstreamstring-string) method or [FileIo.fdopenStream](#func-fdopenstreamint32-string).

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### func close()

```cangjie
public func close(): Unit
```

**Function:** Synchronously closes the file stream.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900004 | Interrupted system call |
  | 13900005 | I/O error |
  | 13900008 | Bad file descriptor |
  | 13900025 | No space left on device |
  | 13900041 | Quota exceeded |
  | 13900042 | Unknown error |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let stream = FileIo.createStream(filePath, "r+")
stream.close()
```

### func flush()

```cangjie
public func flush(): Unit
```

**Function:** Synchronously flushes the file stream.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900001 | Operation not permitted |
  | 13900004 | Interrupted system call |
  | 13900005 | I/O error |
  | 13900008 | Bad file descriptor |
  | 13900010 | Try again |
  | 13900013 | Bad address |
  | 13900020 | Invalid argument |
  | 13900024 | File too large |
  | 13900025 | No space left on device |
  | 13900034 | Operation would block |
  | 13900041 | Quota exceeded |
  | 13900042 | Unknown error |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let stream = FileIo.createStream(filePath, "r+")
stream.flush()
stream.close()
```

### func read(Array\<Byte>, ReadOptions)

```cangjie
public func read(buffer: Array<Byte>, options!: ReadOptions = ReadOptions()): Int64
```

**Function:** Reads data from the stream file synchronously.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| buffer | Array\<[Byte](../../../../User_Manual/source_zh_cn/basic_data_type/integer.md#unsigned-integer-types)> | Yes | - | Buffer used for reading the file. |
| options | [ReadOptions](#class-readoptions) | No | ReadOptions() | **Named parameter.** Supports the following options: <br/>-&nbsp;length, UIntNative type, indicates the expected length of data to read. Optional, defaults to buffer length. <br/>-&nbsp;offset, Int64 type, indicates the expected position to read from the file. Optional, defaults to current position. <br/> |

**Return Value:**

| Type | Description |
| :---- | :---- |
| Int64 | Actual length of data read. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900004 | Interrupted system call |
  | 13900005 | I/O error |
  | 13900008 | Bad file descriptor |
  | 13900010 | Try again |
  | 13900013 | Bad address |
  | 13900019 | Is a directory |
  | 13900020 | Invalid argument |
  | 13900034 | Operation would block |
  | 13900042 | Unknown error |
  | 13900044 | Network is unreachable |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let stream = FileIo.createStream(filePath, "r+")
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

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| buffer | String | Yes | - | Data to be written to the file. |
| options | [WriteOptions](#class-writeoptions) | No | WriteOptions() | **Named parameter.** Supports the following options: <br/>-&nbsp;length, ?UIntNative type, indicates the expected length of data to write. Defaults to buffer length. <br/>-&nbsp;offset, ?Int64 type, indicates the expected position to write to the file. Optional, defaults to current position. <br/>-&nbsp;encoding, String type, valid when data is of String type, indicates the encoding method of the data. Defaults to "utf-8". Only "utf-8" is supported. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| Int64 | Actual length of data written. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900001 | Operation not permitted |
  | 13900004 | Interrupted system call |
  | 13900005 | I/O error |
  | 13900008 | Bad file descriptor |
  | 13900010 | Try again |
  | 13900013 | Bad address |
  | 13900020 | Invalid argument |
  | 13900024 | File too large |
  | 13900025 | No space left on device |
  | 13900034 | Operation would block |
  | 13900041 | Quota exceeded |
  | 13900042 | Unknown error |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let stream = FileIo.createStream(filePath, "r+")
let arr: Array<UInt8> = [104, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100]
let num = stream.write(arr)
stream.close()
```

### func write(Array\<Byte>, WriteOptions)

```cangjie
public func write(buffer: Array<Byte>, options!: WriteOptions = WriteOptions()): Int64
```

**Function:** Writes data to the stream file.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| buffer | Array\<[Byte](../../../../User_Manual/source_zh_cn/basic_data_type/integer.md#unsigned-integer-types)> | Yes | - | Data to be written to the file. |
| options | [WriteOptions](#class-writeoptions) | No | WriteOptions() | **Named parameter.** Supports the following options: <br/>-&nbsp;length, ?UIntNative type, indicates the expected length of data to write. Defaults to buffer length. <br/>-&nbsp;offset, ?Int64 type, indicates the expected position to write to the file. Optional, defaults to current position. <br/>-&nbsp;encoding, String type, valid when data is of String type, indicates the encoding method of the data. Defaults to "utf-8". Only "utf-8" is supported. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| Int64 | Actual length of data written. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900001 | Operation not permitted |
  | 13900004 | Interrupted system call |
  | 13900005 | I/O error |
  | 13900008 | Bad file descriptor |
  | 13900010 | Try again |
  | 13900013 | Bad address |
  | 13900020 | Invalid argument |
  | 13900024 | File too large |
  | 13900025 | No space left on device |
  | 13900034 | Operation would block |
  | 13900041 | Quota exceeded |
  | 13900042 | Unknown error |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = "path/to/file"
let filePath = pathDir + "/test.txt"
let stream = FileIo.createStream(filePath, "r+")
let arr: Array<UInt8> = [104, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100]
let num = stream.write(arr)
stream.close()
```

## class WriteOptions

```cangjie
public class WriteOptions <: Options {
    public var length: Option<UIntNative>
    public var offset: Option<Int64>
    public init(
        length!: Option<UIntNative> = None,
        offset!: Option<Int64> = None,
        encoding!: String = "utf-8"
    )
}
```

**Function:** Optional type, supports the write interface.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parent Type:**

- [Options](#class-options)

### var length

```cangjie
public var length: Option<UIntNative>
```

**Function:** Expected length of data to write. Defaults to buffer length.

**Type:** [Option](#initoptionint-optionint)\<UIntNative>

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### var offset

```cangjie
public var offset: Option<Int64>
```

**Function:** Expected position to write to the file (based on the current filePointer plus offset). Defaults to writing from the offset pointer (filePointer).

**Type:** [Option](#initoptionint-optionint)\<Int64>

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### init(Option\<UIntNative>, Option\<Int64>, String)

```cangjie
public init(
    length!: Option<UIntNative> = None,
    offset!: Option<Int64> = None,
    encoding!: String = "utf-8"
)
```

**Function:** Constructs a WriteOptions object.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| length | [Option](#initoptionint-optionint)\<UIntNative> | No | None | Expected length of data to write. Defaults to buffer length. |
| offset | [Option](#initoptionint-optionint)\<Int64> | No | None | Expected position to write to the file (based on the current filePointer plus offset). Defaults to writing from the offset pointer (filePointer). |
| encoding | String | No | "utf-8" | Valid when data is of String type, indicates the encoding method of the data. Defaults to "utf-8". Only "utf-8" is supported. |


## enum AccessFlagType

```cangjie
public enum AccessFlagType {
    | Local
    | ...
}
```

**Function:** Indicates the file location to be verified.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### Local

```cangjie
Local
```

**Function:** Whether the file is local.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21


## enum AccessModeType

```cangjie
public enum AccessModeType {
    | Exist
    | Write
    | Read
    | ReadWrite
    | ...
}
```

**Function:** Indicates the specific permissions to be verified. Default is to verify file existence.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### Exist

```cangjie
Exist
```

**Function:** Whether the file exists.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### Read

```cangjie
Read
```

**Function:** Whether the file has read permissions.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### ReadWrite

```cangjie
ReadWrite
```

**Function:** Whether the file has read and write permissions.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### Write

```cangjie
Write
```

**Function:** Whether the file has write permissions.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21## enum WhenceType

```cangjie
public enum WhenceType {
    | SeekSet
    | SeekCur
    | SeekEnd
    | ...
}
```

**Function:** File offset pointer relative position type, used by the lseek interface.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### SeekCur

```cangjie
SeekCur
```

**Function:** Current position of the file offset pointer.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### SeekEnd

```cangjie
SeekEnd
```

**Function:** End position of the file.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21

### SeekSet

```cangjie
SeekSet
```

**Function:** Starting position of the file.

**System Capability:** SystemCapability.FileManagement.File.FileIO

**Since:** 21