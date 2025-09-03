# ohos.file.fileuri

This module provides the capability to obtain a Uniform Resource Identifier (URI) from a PATH, enabling subsequent file operations such as open, read, and write through [ohos.file_fs (File Management)](cj-apis-file_fs.md), thereby facilitating file sharing.

## Import Module

```cangjie
import kit.CoreFileKit.*
```

## Usage Instructions

API example code usage instructions:

- If the first line of the example code contains a "// index.cj" comment, it indicates that the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the example requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it must be configured in the "main_ability.cj" file of the Cangjie template project.

For details on the example project and configuration template mentioned above, refer to [Cangjie Example Code Description](../../cj-development-intro.md#Cangjie-Example-Code-Description).

## class FileUri

```cangjie
public class FileUri <: Uri {


    public init(uriOrPath: String)
}
```

**Functionality:** Provides interfaces for converting a URI to a shared path during sharing, generating a corresponding URI for an application's own sandbox path during sharing, and obtaining the URI of the directory path where the URI is located, facilitating URI access in file sharing operations.

**System Capability:** SystemCapability.FileManagement.AppFileService

**Since:** 21

**Parent Type:**

- [Uri](#class-uri)

### prop name

```cangjie
public prop name: String
```

**Functionality:** Gets the filename corresponding to the FileUri.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.FileManagement.AppFileService

**Since:** 21

### prop path

```cangjie
public prop path: String
```

**Functionality:** Gets the pathname corresponding to the FileUri.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.FileManagement.AppFileService

**Since:** 21

### init(String)

```cangjie

public init(uriOrPath: String)
```

**Functionality:** Constructor for FileUri.

**System Capability:** SystemCapability.FileManagement.AppFileService

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| uriOrPath | String | Yes | - | URI or path. URI types: <br/>- Application sandbox URI: file://\<bundleName>/\<sandboxPath> <br/>- Public directory file URI: file://docs/storage/Users/currentUser/\<publicPath> <br/>- Public directory media URI: file://media/\<mediaType>/IMG_DATATIME_ID/\<displayName> |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900005 | I/O error |
  | 13900011 | Out of memory |
  | 13900020 | Invalid argument |
  | 13900042 | Unknown error |
  | 14300002 | Invalid uri |

### static func getUriFromPath(String)

```cangjie

public static func getUriFromPath(path: String): String
```

**Functionality:** Generates an application-specific URI from the provided path (does not support obtaining media-type URIs). When converting a path to a URI, Chinese characters and non-alphanumeric special characters in the path will be encoded into corresponding ASCII codes and concatenated into the URI.

**System Capability:** SystemCapability.FileManagement.AppFileService

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| path | String | Yes | - | Sandbox path of the file. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | Returns the file URI. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The input parameter is invalid. |

### func toString()

```cangjie

public override func toString(): String
```

**Functionality:** Returns the URI as a string.

**System Capability:** SystemCapability.FileManagement.AppFileService

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Returns the URI as a string. |