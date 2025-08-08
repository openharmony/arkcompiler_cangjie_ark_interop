# ohos.file_fileuri (File URI)

This module provides the capability to obtain Uniform Resource Identifiers (URIs) from file paths, enabling subsequent file operations such as open, read, and write through [ohos.file_fs (File Management)](cj-apis-file_fs.md), thereby facilitating file sharing.

## Importing the Module

```cangjie
import kit.CoreFileKit.*
```

## Usage Instructions

API example code usage instructions:

- If the first line of example code contains a "// index.cj" comment, it indicates that the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the example requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the example project and configuration template mentioned above, refer to [Cangjie Example Code Instructions](../../cj-development-intro.md#仓颉示例代码说明).

## class FileUri

```cangjie
public class FileUri <: ToString {
    public init(uriOrPath: String)
}
```

**Functionality:** Provides interfaces for converting URIs to shared paths during sharing, generating corresponding URIs for an application's own sandbox paths during sharing, and obtaining the URI of the directory path where a URI is located, facilitating access to URIs in file sharing scenarios.

**System Capability:** SystemCapability.FileManagement.AppFileService

**Initial Version:** 21

**Parent Type:**

- ToString

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.CoreFileKit.*

let pathDir = '123'
let path = pathDir + "/test"
let fileUriObject = FileUri(path)
AppLog.info("The path of FileUri is " + fileUriObject.path)
AppLog.info("The name of FileUri is " + fileUriObject.name)
```

### prop name

```cangjie
public prop name: String
```

**Functionality:** Gets the file name corresponding to the FileUri.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.FileManagement.AppFileService

**Initial Version:** 21

### prop path

```cangjie
public prop path: String
```

**Functionality:** Gets the path name corresponding to the FileUri.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.FileManagement.AppFileService

**Initial Version:** 21

### init(String)

```cangjie
public init(uriOrPath: String)
```

**Functionality:** Constructor for FileUri.

**System Capability:** SystemCapability.FileManagement.AppFileService

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| uriOrPath | String | Yes | - | URI or path. URI types: <br/>- Application sandbox URI: file://\<bundleName>/\<sandboxPath> <br/>- Public directory file URI: file://docs/storage/Users/currentUser/\<publicPath> <br/>- Public directory media URI: file://media/\<mediaType>/IMG_DATATIME_ID/\<displayName> |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 13900020 | Invalid argument. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CoreFileKit.*

let pathDir = '123'
let path = pathDir + "/test"
let uri = FileUri.getUriFromPath(path)  // file://<packageName>/data/storage/el2/base/haps/entry/files/test
let fileUriObject = FileUri(uri)
```

### static func getUriFromPath(String)

```cangjie
public static func getUriFromPath(path: String): String
```

**Functionality:** Generates an application-specific URI from the provided path (does not support obtaining media-type URIs). When converting a path to a URI, Chinese characters and non-alphanumeric special characters in the path will be encoded into corresponding ASCII codes and concatenated into the URI.

**System Capability:** SystemCapability.FileManagement.AppFileService

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| path | String | Yes | - | The sandbox path of the file. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | Returns the file URI. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | The input parameter is invalid. |

### func toString()

```cangjie
public func toString(): String
```

**Functionality:** Returns the URI as a string.

**System Capability:** SystemCapability.FileManagement.AppFileService

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Returns the URI as a string. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.CoreFileKit.*

let pathDir = '123'
let path = pathDir + "/test"
let fileUriObject = FileUri(path)
AppLog.info("The uri of FileUri is " + fileUriObject.toString())
```