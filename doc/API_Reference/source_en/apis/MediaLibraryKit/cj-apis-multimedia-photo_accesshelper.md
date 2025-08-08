# ohos.multimedia.photo_accesshelper (Photo Album Management Module)

This module provides photo album management capabilities, including creating albums and accessing/modifying media data information within albums.

## Importing the Module

```cangjie
import kit.MediaLibraryKit.*
```

## Permission List

ohos.permission.READ_IMAGEVIDEO

ohos.permission.WRITE_IMAGEVIDEO

## Usage Instructions

API sample code usage instructions:

- If the sample code's first line contains a "// index.cj" comment, it indicates the sample can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the sample project and configuration template mentioned above, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#仓颉示例代码说明).

## interface MediaChangeRequest

```cangjie
public interface MediaChangeRequest {}
```

**Description:** The parent type for media change requests, asset change requests, and album change requests.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

## class Album

```cangjie
public class Album {}
```

**Description:** Physical photo album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### prop albumName

```cangjie
public mut prop albumName: String
```

**Description:** Gets the album name.

**Type:** String

**Read/Write Permission:** Read-write

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### prop albumSubtype

```cangjie
public prop albumSubtype: AlbumSubtype
```

**Description:** Gets the album subtype.

**Type:** [AlbumSubtype](#enum-albumsubtype)

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### prop albumType

```cangjie
public prop albumType: AlbumType
```

**Description:** Gets the album type.

**Type:** [AlbumType](#enum-albumtype)

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### prop albumUri

```cangjie
public prop albumUri: String
```

**Description:** Gets the album URI.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### prop count

```cangjie
public prop count: Int32
```

**Description:** Number of files in the album.

**Type:** Int32

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### prop coverUri

```cangjie
public prop coverUri: String
```

**Description:** Gets the cover file URI.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### prop imageCount

```cangjie
public prop imageCount: Int32
```

**Description:** Gets the number of images in the album.

**Type:** Int32

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### prop videoCount

```cangjie
public prop videoCount: Int32
```

**Description:** Gets the number of videos in the album.

**Type:** Int32

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func commitModify()

```cangjie
public func commitModify(): Unit
```

**Description:** Commits album property modifications to the database.

**Required Permission:** ohos.permission.WRITE_IMAGEVIDEO

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

| Error Code ID | Error Message |
| :---- | :--- |
| 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types. |
| 13900012 | Permission denied. |
| 13900020 | Invalid argument. |
| 14000011 | System inner fail. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
predicates.equalTo('album_name', Str('test1'))
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let fetchResult: FetchResult<Album> = phAccessHelper.getAlbums(AlbumType.USER,
    AlbumSubtype.USER_GENERIC, options: fetchOptions)
let firstAlbum = fetchResult.getFirstObject()
firstAlbum.albumName = "test10086"
firstAlbum.commitModify()
```

### func getAssets(FetchOptions)

```cangjie
public func getAssets(options: FetchOptions): FetchResult<PhotoAsset>
```

**Description:** Gets files from the album.

**Required Permission:** ohos.permission.READ_IMAGEVIDEO

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| options | [FetchOptions](#class-fetchoptions) | Yes | - | Retrieval options. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| [FetchResult](#class-fetchresult)\<[PhotoAsset](#class-photoasset)> | Returns the image and video dataset. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types; 3. Parameter verification failed. |
  | 13900012 | Permission denied. |
  | 13900020 | Invalid argument. |
  | 14000011 | System inner fail. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
predicates.equalTo('album_name', Str('test1'))
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let fetchResult: FetchResult<Album> = phAccessHelper.getAlbums(AlbumType.USER,
    AlbumSubtype.USER_GENERIC, options: fetchOptions)
let firstAlbum = fetchResult.getFirstObject()
let photoCount = firstAlbum.count
let predicates1 = DataSharePredicates()
let fetchOptions1: FetchOptions = FetchOptions(fetchColumns: [], predicates: predicates1)
let fetchResult1: FetchResult<PhotoAsset> = firstAlbum.getAssets(fetchOptions1)
```

## class BaseSelectOptions

```cangjie
public open class BaseSelectOptions {
    public BaseSelectOptions(
        public var MIMEType!: PhotoViewMIMETypes = IMAGE_VIDEO_TYPE,
        public var maxSelectNumber!: Int32 = 50,
        public var isPhotoTakingSupported!: Bool = true,
        public var isSearchSupported!: Bool = true,
        public var recommendationOptions!: RecommendationOptions = RecommendationOptions(),
        public var preselectedUris!: Array<String> = Array<String>(),
        public var isPreviewForSingleSelectionSupported!: Bool = true
    )
}
```
**Feature:** Base class for gallery selection options.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var MIMEType

```cangjie
public var MIMEType: PhotoViewMIMETypes = IMAGE_VIDEO_TYPE
```

**Feature:** Media file type.

**Type:** [PhotoViewMIMETypes](#enum-photoviewmimetypes)

**Access:** Read-write

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var isPhotoTakingSupported

```cangjie
public var isPhotoTakingSupported: Bool = true
```

**Feature:** Whether photo capture is supported.

**Type:** Bool

**Access:** Read-write

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var isPreviewForSingleSelectionSupported

```cangjie
public var isPreviewForSingleSelectionSupported: Bool = true
```

**Feature:** Whether to enter full-screen preview in single-selection mode.

**Type:** Bool

**Access:** Read-write

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var isSearchSupported

```cangjie
public var isSearchSupported: Bool = true
```

**Feature:** Whether search is supported.

**Type:** Bool

**Access:** Read-write

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var maxSelectNumber

```cangjie
public var maxSelectNumber: Int32 = 50
```

**Feature:** Maximum number of selectable media files.

**Type:** Int32

**Access:** Read-write

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var preselectedUris

```cangjie
public var preselectedUris: Array<String>= Array<String>()
```

**Feature:** URI data of pre-selected images.

**Type:** Array\<String>

**Access:** Read-write

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var recommendationOptions

```cangjie
public var recommendationOptions: RecommendationOptions = RecommendationOptions()
```

**Feature:** Configuration parameters for image recommendations.

**Type:** [RecommendationOptions](#struct-recommendationoptions)

**Access:** Read-write

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### BaseSelectOptions(PhotoViewMIMETypes, Int32, Bool, Bool, RecommendationOptions, Array\<String>, Bool)

```cangjie
public BaseSelectOptions(
    public var MIMEType!: PhotoViewMIMETypes = IMAGE_VIDEO_TYPE,
    public var maxSelectNumber!: Int32 = 50,
    public var isPhotoTakingSupported!: Bool = true,
    public var isSearchSupported!: Bool = true,
    public var recommendationOptions!: RecommendationOptions = RecommendationOptions(),
    public var preselectedUris!: Array<String> = Array<String>(),
    public var isPreviewForSingleSelectionSupported!: Bool = true
)
```

**Feature:** Constructs a BaseSelectOptions object.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| MIMEType | [PhotoViewMIMETypes](#enum-photoviewmimetypes) | No | IMAGE_VIDEO_TYPE | **Named parameter.** Selectable media file types. Defaults to image and video types if not specified. |
| maxSelectNumber | Int32 | No | 50 | **Named parameter.** Maximum number of selectable media files (maximum configurable value is 500; defaults to 50 if not set). |
| isPhotoTakingSupported | Bool | No | true | **Named parameter.** Whether photo capture is supported. true: supported; false: not supported. Defaults to true. |
| isSearchSupported | Bool | No | true | **Named parameter.** Whether search is supported. true: supported; false: not supported. Defaults to true. |
| recommendationOptions | [RecommendationOptions](#struct-recommendationoptions) | No | RecommendationOptions() | **Named parameter.** Configuration parameters for image recommendations. |
| preselectedUris | Array\<String> | No | Array\<String>() | **Named parameter.** URI data of pre-selected images. |
| isPreviewForSingleSelectionSupported | Bool | No | true | **Named parameter.** Whether to enter full-screen preview in single-selection mode. true: required; false: not required. Defaults to true. |

## class ChangeData

```cangjie
public class ChangeData {}
```

**Feature:** Callback value for listener functions.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### let `type`

```cangjie
public let `type`: NotifyType
```

**Feature:** Notification type of ChangeData.

**Type:** [NotifyType](#enum-notifytype)

**Access:** Read-only

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### let extraUris

```cangjie
public let extraUris: Array<String>
```

**Feature:** Array of URIs for changed files in the album.

**Type:** Array\<String>

**Access:** Read-only

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### let uris

```cangjie
public let uris: Array<String>
```

**Feature:** All URIs with the same [NotifyType](#enum-notifytype), which can be PhotoAsset or Album.

**Type:** Array\<String>

**Access:** Read-only

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

## class FetchOptions

```cangjie
public class FetchOptions {
    public FetchOptions(
        public var fetchColumns!: Array<String> = [],
        public var predicates!: DataSharePredicates = DataSharePredicates()
    )
}
```

**Feature:** Retrieval conditions.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var fetchColumns

```cangjie
public var fetchColumns: Array<String>=[]
```

**Feature:** Retrieval conditions.

**Type:** Array\<String>

**Access:** Read-write

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var predicates

```cangjie
public var predicates: DataSharePredicates = DataSharePredicates()
```

**Feature:** Predicate query.

**Type:** [DataSharePredicates](../ArkData/cj-apis-data_share_predicates.md#class-datasharepredicates)

**Access:** Read-write

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### FetchOptions(Array\<String>, DataSharePredicates)

```cangjie
public FetchOptions(
    public var fetchColumns!: Array<String> = [],
    public var predicates!: DataSharePredicates = DataSharePredicates()
)
```

**Feature:** Constructs a FetchOptions object.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| fetchColumns | Array\<String> | No | \[] | **Named parameter.** Retrieval conditions, specifying column names for query.<br>For photos: If empty, defaults to querying 'uri', 'media_type', 'subtype', and 'display_name'. Calling [get](#func-getstring) for other properties will throw an error. Example: fetchColumns: ['uri', 'title'].<br>For albums: If empty, defaults to querying 'uri' and 'album_name'. |
| predicates | [DataSharePredicates](../ArkData/cj-apis-data_share_predicates.md#class-datasharepredicates) | No | DataSharePredicates() | **Named parameter.** Predicate query for displaying filter conditions. |

## class FetchResult

```cangjie
public class FetchResult<T> <: where T <: & FetchData <T> {}
```

**Feature:** File retrieval result set.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func close()

```cangjie
public func close(): Unit
```
**Function:** Releases the FetchResult instance and invalidates it. No other methods can be called.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 13900020 | Invalid argument. |
  | 14000011 | System inner fail. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // Context application context is required. See usage instructions in this document.
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let fetchResult: FetchResult<PhotoAsset> = phAccessHelper.getAssets(fetchOptions)
fetchResult.close()
```

### func getAllObjects()

```cangjie
public func getAllObjects(): Array<T>
```

**Function:** Retrieves all file assets in the file search result.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| Array\<T> | Returns an array of all file assets in the result set. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 13900020 | Invalid argument. |
  | 14000011 | System inner fail. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // Context application context is required. See usage instructions in this document.
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let fetchResult: FetchResult<PhotoAsset> = phAccessHelper.getAssets(fetchOptions)
let photoAssetArray = fetchResult.getAllObjects()
```

### func getCount()

```cangjie
public func getCount(): Int32
```

**Function:** Retrieves the total number of files in the file search result.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| Int32 | The total number of files retrieved. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 13900020 | Invalid argument. |
  | 14000011 | System inner fail. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // Context application context is required. See usage instructions in this document.
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let fetchResult: FetchResult<PhotoAsset> = phAccessHelper.getAssets(fetchOptions)
let count = fetchResult.getCount()
```

### func getFirstObject()

```cangjie
public func getFirstObject(): T
```

**Function:** Retrieves the first file asset in the file search result.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| T | Returns the first object in the result set. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 13900020 | Invalid argument. |
  | 14000011 | System inner fail. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // Context application context is required. See usage instructions in this document.
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let fetchResult: FetchResult<PhotoAsset> = phAccessHelper.getAssets(fetchOptions)
let firstPhotoAsset = fetchResult.getFirstObject()
```

### func getLastObject()

```cangjie
public func getLastObject(): T
```

**Function:** Retrieves the last file asset in the file search result.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| T | Returns the last object in the result set. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 13900020 | Invalid argument. |
  | 14000011 | System inner fail. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // Context application context is required. See usage instructions in this document.
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let fetchResult: FetchResult<PhotoAsset> = phAccessHelper.getAssets(fetchOptions)
let firstPhotoAsset = fetchResult.getLastObject()
```

### func getNextObject()

```cangjie
public func getNextObject(): T
```

**Function:** Retrieves the next file asset in the file search result.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| T | Returns the next object in the result set. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 13900020 | Invalid argument. |
  | 14000011 | System inner fail. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // Context application context is required. See usage instructions in this document.
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let fetchResult: FetchResult<PhotoAsset> = phAccessHelper.getAssets(fetchOptions)
let firstPhotoAsset = fetchResult.getNextObject()
```

### func getObjectByPosition(Int32)

```cangjie
public func getObjectByPosition(position: Int32): T
```

**Function:** Retrieves the file asset at the specified index in the file search result.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| position | Int32 | Yes | - | The index of the file to retrieve, starting from 0. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| T | Returns the object at the specified index in the result set. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 13900020 | Invalid argument. |
  | 14000011 | System inner fail. |

**Example:**

<!-- compile -->
```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // Context application context needs to be obtained, see usage instructions in this article
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let fetchResult: FetchResult<PhotoAsset> = phAccessHelper.getAssets(fetchOptions)
let positionPhotoAsset = fetchResult.getObjectByPosition(1)
```

### func isAfterLast()

```cangjie
public func isAfterLast(): Bool
```

**Function:** Checks whether the result set points to the last row.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| Bool | Returns true if there are no more records after reading the last record, otherwise returns false. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 13900020 | Invalid argument. |
  | 14000011 | System inner fail. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // Context application context needs to be obtained, see usage instructions in this article
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let fetchResult: FetchResult<PhotoAsset> = phAccessHelper.getAssets(fetchOptions)
let isAfterLast = fetchResult.isAfterLast()
```

## class MediaAlbumChangeRequest

```cangjie
public class MediaAlbumChangeRequest <: MediaChangeRequest {
    public init(album: Album)
}
```

**Function:** Album change request.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Type:**

- [MediaChangeRequest](#interface-mediachangerequest)

### init(Album)

```cangjie
public init(album: Album)
```

**Function:** Constructs a MediaAlbumChangeRequest object.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| album | [Album](#class-album) | Yes | - | The album to be modified. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401 | Parameter error. Possible causes: Parameter verification failed. |
  | 14000011 | System inner fail. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // Context application context needs to be obtained, see usage instructions in this article
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let fetchResult = phAccessHelper.getAlbums(AlbumType.USER, AlbumSubtype.USER_GENERIC,
    options: fetchOptions)
let album = fetchResult.getFirstObject()
let albumChangeRequest = MediaAlbumChangeRequest(album)
```

### func addAssets(Array\<PhotoAsset>)

```cangjie
public func addAssets(assets: Array<PhotoAsset>): Unit
```

**Function:** Adds assets to the album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| assets | Array\<[PhotoAsset](#class-photoasset)> | Yes | - | Array of assets to be added to the album. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 14000011 | System inner fail. |
  | 14000016 | Operation Not Support. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // Context application context needs to be obtained, see usage instructions in this article
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let fetchResult = phAccessHelper.getAssets(fetchOptions)
let asset = fetchResult.getFirstObject()
let albumFetchResult = phAccessHelper.getAlbums(AlbumType.USER, AlbumSubtype.USER_GENERIC)
let album = albumFetchResult.getFirstObject()
let albumChangeRequest = MediaAlbumChangeRequest(album)
albumChangeRequest.addAssets([asset, asset])
```

### func getAlbum()

```cangjie
public func getAlbum(): ?Album
```

**Function:** Gets the album in the current album change request.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| ?[Album](#class-album) | Returns the album in the current album change request. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 14000011 | System inner fail. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // Context application context needs to be obtained, see usage instructions in this article
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let fetchResult = phAccessHelper.getAlbums(AlbumType.USER, AlbumSubtype.USER_GENERIC,
    options: fetchOptions)
let album = fetchResult.getFirstObject()
let albumChangeRequest = MediaAlbumChangeRequest(album)
var changeRequestAlbum = albumChangeRequest.getAlbum()
```

### func removeAssets(Array\<PhotoAsset>)

```cangjie
public func removeAssets(assets: Array<PhotoAsset>): Unit
```

**Function:** Removes assets from the album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| assets | Array\<[PhotoAsset](#class-photoasset)> | Yes | - | Array of assets to be removed from the album. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401 | Parameter error. Possible causes: Parameter verification failed. |
  | 14000011 | System inner fail. |
  | 14000016 | Operation Not Support. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // Context application context needs to be obtained, see usage instructions in this article
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let albumFetchResult = phAccessHelper.getAlbums(AlbumType.USER, AlbumSubtype.USER_GENERIC)
let album = albumFetchResult.getFirstObject()
let fetchResult = album.getAssets(fetchOptions)
let asset = fetchResult.getFirstObject()
let albumChangeRequest = MediaAlbumChangeRequest(album)
albumChangeRequest.removeAssets([asset])
phAccessHelper.applyChanges(albumChangeRequest)
```

### func setAlbumName(String)

```cangjie
public func setAlbumName(name: String): Unit
```

**Function:** Sets the album name.

The specifications for the album name parameter are as follows:

- The length of the album name string must be between 1 and 255 characters.
- Illegal characters are not allowed, including: . .. \ / : * ? " ' ` < > | { } [ ]
- English characters are case-insensitive.
- Duplicate album names are not allowed.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| name | String | Yes | - | The album name to be set. |**Exceptions:**

- BusinessException: For detailed information on the corresponding error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 14000011 | System inner fail. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // Context application context needs to be obtained. See usage instructions in this document.
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let fetchResult = phAccessHelper.getAlbums(AlbumType.USER, AlbumSubtype.USER_GENERIC,
    options: fetchOptions)
let album = fetchResult.getFirstObject()
let albumChangeRequest = MediaAlbumChangeRequest(album)
let newAlbumName = "newAAA"
albumChangeRequest.setAlbumName(newAlbumName)
```

## class MediaAssetChangeRequest

```cangjie
public class MediaAssetChangeRequest <: MediaChangeRequest {
    public init(asset: PhotoAsset)
}
```

**Function:** Asset change request.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Type:**

- [MediaChangeRequest](#interface-mediachangerequest)

### init(PhotoAsset)

```cangjie
public init(asset: PhotoAsset)
```

**Function:** Constructs a MediaAssetChangeRequest object.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| asset | [PhotoAsset](#class-photoasset) | Yes | - | The asset to be modified. |

**Exceptions:**

- BusinessException: For detailed information on the corresponding error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401 | Parameter error. Possible causes: Parameter verification failed. |
  | 14000011 | System inner fail. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // Context application context needs to be obtained. See usage instructions in this document.
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let fetchResult = phAccessHelper.getAssets(fetchOptions)
let photoAsset = fetchResult.getFirstObject()
let assetChangeRequest = MediaAssetChangeRequest(photoAsset)
```

### static func createAssetRequest(UIAbilityContext, PhotoType, String, CreateOptions)

```cangjie
public static func createAssetRequest(context: UIAbilityContext, photoType: PhotoType, extension: String,
    options!: CreateOptions = CreateOptions()): MediaAssetChangeRequest
```

**Function:** Creates an asset change request by specifying the file type and extension to be created.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| context | [UIAbilityContext](../AbilityKit/cj-apis-ability.md#class-uiabilitycontext) | Yes | - | The Context of the Ability instance. |
| photoType | [PhotoType](#enum-phototype) | Yes | - | The file type to be created, either IMAGE or VIDEO. |
| extension | String | Yes | - | The file extension, e.g., 'jpg'. |
| options | [CreateOptions](#struct-createoptions) | No | CreateOptions() | **Named parameter.** Creation options, e.g., {title: 'testPhoto'}. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| [MediaAssetChangeRequest](#class-mediaassetchangerequest) | Returns the asset change request for creation. |

**Exceptions:**

- BusinessException: For detailed information on the corresponding error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 202 | Called by non-system application |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 14000001 | Invalid display name. |
  | 14000011 | System inner fail. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*

let ctx = Global.getAbilityContext() // Context application context needs to be obtained. See usage instructions in this document.
let photoType = PhotoType.IMAGE
let extension = "jpg"
let options = CreateOptions(title: "testPhoto")
let assetChangeRequest = MediaAssetChangeRequest.createAssetRequest(ctx, photoType,
    extension, options: options)
```

### static func createImageAssetRequest(UIAbilityContext, String)

```cangjie
public static func createImageAssetRequest(context: UIAbilityContext, fileUri: String): MediaAssetChangeRequest
```

**Function:** Creates an image asset change request.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| context | [UIAbilityContext](../AbilityKit/cj-apis-ability.md#class-uiabilitycontext) | Yes | - | The Context of the Ability instance. |
| fileUri | String | Yes | - | The data source of the image asset, a URI within the application sandbox. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| [MediaAssetChangeRequest](#class-mediaassetchangerequest) | Returns the asset change request for creation. |

**Exceptions:**

- BusinessException: For detailed information on the corresponding error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 13900002 | No such file. |
  | 14000011 | System inner fail. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*

let ctx = Global.getAbilityContext() // Context application context needs to be obtained. See usage instructions in this document.
let phAccessHelper = getPhotoAccessHelper(ctx)
let fileUri = "file://com.example.xxx/data/storage/el2/base/haps/entry/files/test.jpg"
let assetChangeRequest = MediaAssetChangeRequest.createImageAssetRequest(ctx,
    fileUri)
phAccessHelper.applyChanges(assetChangeRequest)
```

### static func createVideoAssetRequest(UIAbilityContext, String)

```cangjie
public static func createVideoAssetRequest(context: UIAbilityContext, fileUri: String): MediaAssetChangeRequest
```

**Function:** Creates a video asset change request.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| context | [UIAbilityContext](../AbilityKit/cj-apis-ability.md#class-uiabilitycontext) | Yes | - | The Context of the Ability instance. |
| fileUri | String | Yes | - | The data source of the video asset, a URI within the application sandbox. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| [MediaAssetChangeRequest](#class-mediaassetchangerequest) | Returns the asset change request for creation. |

**Exceptions:**

- BusinessException: For detailed information on the corresponding error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401 | Parameter error. Possible causes: Parameter verification failed. |
  | 13900002 | No such file. |
  | 14000011 | System inner fail. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*

let ctx = Global.getAbilityContext() // Context application context needs to be obtained. See usage instructions in this document.
let phAccessHelper = getPhotoAccessHelper(ctx)
let fileUri = "file://com.example.xxx/data/storage/el2/base/haps/entry/files/test.mp4"
let assetChangeRequest = MediaAssetChangeRequest.createVideoAssetRequest(ctx,
    fileUri)
phAccessHelper.applyChanges(assetChangeRequest)
```

### static func deleteAssets(UIAbilityContext, Array\<PhotoAsset>)

```cangjie
public static func deleteAssets(context: UIAbilityContext, assets: Array<PhotoAsset>): Unit
```

**Function:** Deletes media files, moving the deleted files to the recycle bin.

**Required Permission:** ohos.permission.WRITE_IMAGEVIDEO

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| context | [UIAbilityContext](../AbilityKit/cj-apis-ability.md#class-uiabilitycontext) | Yes | - | The Context of the Ability instance. |
| assets | Array\<[PhotoAsset](#class-photoasset)> | Yes | - | The array of media files to be deleted. |

**Exceptions:**

- BusinessException: For detailed information on the corresponding error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 201 | Permission denied |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 14000011 | System inner fail. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // Context application context needs to be obtained. See usage instructions in this document.
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let fetchResult = phAccessHelper.getAssets(fetchOptions)
let asset = fetchResult.getFirstObject()
MediaAssetChangeRequest.deleteAssets(ctx, asset.uri)
```

### static func deleteAssets(UIAbilityContext, Array\<String>)

```cangjie
public static func deleteAssets(context: UIAbilityContext, assets: Array<String>): Unit
```

**Function:** Deletes media files, which will be moved to the recycle bin.

**Required Permission:** ohos.permission.WRITE_IMAGEVIDEO

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| context | [UIAbilityContext](../AbilityKit/cj-apis-ability.md#class-uiabilitycontext) | Yes | - | The Context of the Ability instance. |
| assets | Array\<String> | Yes | - | Array of URIs of media files to be deleted. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  |:----|:---|
  | 201 | Permission denied |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 14000002 | Invalid asset URI. |
  | 14000011 | System internal failure. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // Context application context needs to be obtained, see usage instructions in this document
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let fetchResult = phAccessHelper.getAssets(fetchOptions)
let asset = fetchResult.getFirstObject()
MediaAssetChangeRequest.deleteAssets(ctx, asset.uri)
```

### func addResource(ResourceType, String)

```cangjie
public func addResource(resourceType: ResourceType, fileUri: String): Unit
```

**Function:** Adds resources via ArrayBuffer data.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| resourceType | [ResourceType](#enum-resourcetype) | Yes | - | Type of the resource to be added. |
| fileUri | String | Yes | - | URI of the data source for the resource to be added, under the application sandbox. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  |:----|:---|
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 13900002 | No such file. |
  | 14000011 | System internal failure. |
  | 14000016 | Operation Not Supported. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*

let ctx = Global.getAbilityContext() // Context application context needs to be obtained, see usage instructions in this document
let phAccessHelper = getPhotoAccessHelper(ctx)
let photoType = PhotoType.IMAGE
let extension = "jpg"
let assetChangeRequest = MediaAssetChangeRequest.createAssetRequest(ctx, photoType,
    extension)
let buffer = Array<Byte>(2048, repeat: 0)
assetChangeRequest.addResource(IMAGE_RESOURCE, buffer)
phAccessHelper.applyChanges(assetChangeRequest)
```

### func addResource(ResourceType, Array\<Byte>)

```cangjie
public func addResource(resourceType: ResourceType, data: Array<Byte>): Unit
```

**Function:** Adds resources via ArrayBuffer data.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| resourceType | [ResourceType](#enum-resourcetype) | Yes | - | Type of the resource to be added. |
| data | Array\<Byte> | Yes | - | Data of the resource to be added. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  |:----|:---|
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 14000011 | System internal failure. |
  | 14000016 | Operation Not Supported. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*

let ctx = Global.getAbilityContext() // Context application context needs to be obtained, see usage instructions in this document
let phAccessHelper = getPhotoAccessHelper(ctx)
let photoType = PhotoType.IMAGE
let extension = "jpg"
let assetChangeRequest = MediaAssetChangeRequest.createAssetRequest(ctx, photoType,
    extension)
let buffer = Array<Byte>(2048, repeat: 0)
assetChangeRequest.addResource(IMAGE_RESOURCE, buffer)
phAccessHelper.applyChanges(assetChangeRequest)
```

### func discardCameraPhoto()

```cangjie
public func discardCameraPhoto(): Unit
```

**Function:** Saves photos taken by the camera.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  |:----|:---|
  | 14000011 | Internal system error. |
  | 14000016 | Operation Not Supported. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // Context application context needs to be obtained, see usage instructions in this document
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let fetchResult = phAccessHelper.getAssets(fetchOptions)
let photoAsset = fetchResult.getFirstObject()
let assetChangeRequest = MediaAssetChangeRequest(photoAsset)
assetChangeRequest.discardCameraPhoto()
phAccessHelper.applyChanges(assetChangeRequest)
```

### func getAsset()

```cangjie
public func getAsset(): ?PhotoAsset
```

**Function:** Gets the asset in the current asset change request.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| ?[PhotoAsset](#class-photoasset) | Returns the asset in the current asset change request. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  |:----|:---|
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 14000011 | System internal failure. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // Context application context needs to be obtained, see usage instructions in this document
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let fetchResult = phAccessHelper.getAssets(fetchOptions)
let photoAsset = fetchResult.getFirstObject()
let assetChangeRequest = MediaAssetChangeRequest(photoAsset)
let asset = assetChangeRequest.getAsset()
```

### func getWriteCacheHandler()

```cangjie
public func getWriteCacheHandler(): Int32
```

**Function:** Gets the temporary file write handle.

**Required Permission:** ohos.permission.WRITE_IMAGEVIDEO

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | Returns the temporary file write handle. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  |:----|:---|
  | 201 | Permission denied |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 14000011 | System internal failure. |
  | 14000016 | Operation Not Supported. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.CoreFileKit.*

let ctx = Global.getAbilityContext() // Context application context needs to be obtained, see usage instructions in this document
let phAccessHelper = getPhotoAccessHelper(ctx)
let assetChangeRequest = MediaAssetChangeRequest.createAssetRequest(ctx,
    PhotoType.VIDEO, "mp4")
let fd = assetChangeRequest.getWriteCacheHandler()
FileFs.close(fd)
phAccessHelper.applyChanges(assetChangeRequest)
```

### func saveCameraPhoto()

```cangjie
public func saveCameraPhoto(): Unit
```
**Function:** Save photos taken by the camera.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  |Error Code ID|Error Message|
  |:----|:---|
  |14000011|System inner fail.|
  |14000016|Operation Not Support.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let fetchResult = phAccessHelper.getAssets(fetchOptions)
let photoAsset = fetchResult.getFirstObject()
let assetChangeRequest = MediaAssetChangeRequest(photoAsset)
assetChangeRequest.saveCameraPhoto()
phAccessHelper.applyChanges(assetChangeRequest)
```

### func setTitle(String)

```cangjie
public func setTitle(title: String): Unit
```

**Function:** Modify the title of a media asset.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|title|String|Yes|-|The title of the asset to be modified.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  |Error Code ID|Error Message|
  |:----|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed.|
  |14000011|System inner fail.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let fetchResult = phAccessHelper.getAssets(fetchOptions)
let photoAsset = fetchResult.getFirstObject()
let assetChangeRequest = MediaAssetChangeRequest(photoAsset)
let newTitle = "newTitle"
assetChangeRequest.setTitle(newTitle)
phAccessHelper.applyChanges(assetChangeRequest)
```

## class PhotoAccessHelper

```cangjie
public class PhotoAccessHelper {}
```

**Function:** Retrieve image and video resources.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func applyChanges(MediaChangeRequest)

```cangjie
public func applyChanges(mediaChangeRequest: MediaChangeRequest): Unit
```

**Function:** Commit media change requests.

**Required Permission:** ohos.permission.WRITE_IMAGEVIDEO

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|mediaChangeRequest|[MediaChangeRequest](#interface-mediachangerequest)|Yes|-|Media change request, supporting asset change requests and album change requests.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  |Error Code ID|Error Message|
  |:----|:---|
  |201|Permission denied|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed.|
  |14000011|System inner fail.|

### func getAlbums(AlbumType, AlbumSubtype, FetchOptions)

```cangjie
public func getAlbums(`type`: AlbumType, subtype: AlbumSubtype, options!: FetchOptions = FetchOptions()): FetchResult<Album>
```

**Function:** Retrieve albums based on search options and album type. Ensure the album exists before retrieval.

**Required Permission:** ohos.permission.READ_IMAGEVIDEO

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|\`type\`|[AlbumType](#enum-albumtype)|Yes|-|Album type.|
|subtype|[AlbumSubtype](#enum-albumsubtype)|Yes|-|Album subtype.|
|options|[FetchOptions](#class-fetchoptions)|No|FetchOptions()| **Named parameter.** Search options.|

**Return Value:**

|Type|Description|
|:----|:----|
|[FetchResult](#class-fetchresult)\<[Album](#class-album)>|Returns the result set of retrieved albums.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  |Error Code ID|Error Message|
  |:----|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed.|
  |13900012|Permission denied.|
  |13900020|Invalid argument.|
  |14000011|System inner fail.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
predicates
    .equalTo('album_name', Str('test1'))
    .and()
    .equalTo('count', Integer(2))
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let fetchResult: FetchResult<Album> = phAccessHelper.getAlbums(AlbumType.USER,
    AlbumSubtype.USER_GENERIC, options: fetchOptions)
```

### func getAssets(FetchOptions)

```cangjie
public func getAssets(options: FetchOptions): FetchResult<PhotoAsset>
```

**Function:** Retrieve image and video resources.

**Required Permission:** ohos.permission.READ_IMAGEVIDEO

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|options|[FetchOptions](#class-fetchoptions)|Yes|-|Image and video search options.|

**Return Value:**

|Type|Description|
|:----|:----|
|[FetchResult](#class-fetchresult)\<[PhotoAsset](#class-photoasset)>|Returns the result set of image and video data.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  |Error Code ID|Error Message|
  |:----|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed.|
  |13900012|Permission denied.|
  |13900020|Invalid argument.|
  |14000011|System inner fail.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let fetchResult: FetchResult<PhotoAsset> = phAccessHelper.getAssets(fetchOptions)
```

### func getBurstAssets(String, FetchOptions)

```cangjie
public func getBurstAssets(burstKey: String, options: FetchOptions): FetchResult<PhotoAsset>
```

**Function:** Retrieve burst photo resources.

**Required Permission:** ohos.permission.READ_IMAGEVIDEO

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|burstKey|String|Yes|-|Unique identifier for a set of burst photos: uuid (can pass [PhotoKeys](#enum-photokeys)'s BURST_KEY).|
|options|[FetchOptions](#class-fetchoptions)|Yes|-|Burst photo search options.|

**Return Value:**

|Type|Description|
|:----|:----|
|[FetchResult](#class-fetchresult)\<[PhotoAsset](#class-photoasset)>|Returns the result set of burst photo data.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  |Error Code ID|Error Message|
  |:----|:---|
  |201|Permission denied|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed.|
  |14000011|Internal system error.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let burstKey = "a042847b-2f1a-492a-897e-028b7d6dc475"
let fetchResult: FetchResult<PhotoAsset> = phAccessHelper.getBurstAssets(burstKey, fetchOptions)
```

### func registerChange(String, Bool, Callback1Argument\<ChangeData>)

```cangjie
public func registerChange(uri: String, forChildUris: Bool, callback: Callback1Argument\<ChangeData>): Unit
```

**Function:** Registers a listener for the specified URI and returns asynchronous results via callback.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| uri | String | Yes | - | The URI of PhotoAsset, Album, or a value from [DefaultChangeUri](#enum-defaultchangeuri). |
| forChildUris | Bool | Yes | - | Whether to enable fuzzy listening. When URI is an album URI, setting `forChildUris` to `true` allows listening to changes in files within the album; if `false`, only changes to the album itself are monitored. For PhotoAsset URIs, `forChildUris` has no effect. For `DefaultChangeUri`, `forChildUris` must be `true`; if `false`, the URI will not be found, and no messages will be received. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[ChangeData](#class-changedata)> | Yes | - | Returns the [ChangeData](#class-changedata) to be monitored. Note: Multiple different callbacks can be registered for the same URI. [unRegisterChange](#func-unregisterchangestring-callback1argumentchangedata) can close all listeners for the URI or only the specified callback listener. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  |:----|:---|
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 13900012 | Permission denied. |
  | 13900020 | Invalid argument. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*
import ohos.base.*

// This code can be added to dependency definitions
class MyCallback<T> <: Callback1Argument<T> {
    public let callabck_: (T) -> Unit
    public init(callabck: (T) -> Unit) {
        callabck_ = callabck
    }
    public open func invoke(arg: T): Unit {
        callabck_(arg)
    }
}

let ctx = Global.getAbilityContext() // Context application context required; see usage instructions
let phAccessHelper = getPhotoAccessHelper(ctx)
let callback1 = MyCallback<ChangeData>(
    {
        arg: ChangeData => AppLog.info(
            "onCallback1. ChangeData: type = ${arg.`type`.toString()}, uris.size: ${arg.uris.size}, extraUris.size = ${arg.extraUris.size}"
        )
    })
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: ['title'], predicates: predicates)
let fetchResult: FetchResult<PhotoAsset> = phAccessHelper.getAssets(fetchOptions)
let firstPhotoAsset = fetchResult.getFirstObject()
phAccessHelper.registerChange(firstPhotoAsset.uri, false, callback1)
```

### func release()

```cangjie
public func release(): Unit
```

**Function:** Releases the PhotoAccessHelper instance. Call this when the methods of the PhotoAccessHelper instance are no longer needed.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  |:----|:---|
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 13900020 | Invalid argument. |
  | 14000011 | System inner fail. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // Context application context required; see usage instructions
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let fetchResult: FetchResult<PhotoAsset> = phAccessHelper.getAssets(fetchOptions)
fetchResult.close()
phAccessHelper.release()
```

### func showAssetsCreationDialog(Array\<String>, Array\<PhotoCreationConfig>, Callback1Argument\<Array\<String>>)

```cangjie
public func showAssetsCreationDialog(srcFileUris: Array<String>, photoCreationConfigs: Array<PhotoCreationConfig>,
    callback: Callback1Argument<Array<String>>): Unit
```

**Function:** Invokes an interface to display a save confirmation dialog. If the user agrees to save, the callback returns a list of URIs that have been created and granted save permissions. This list is permanently valid, and the application can use these URIs to write images/videos. If the user refuses to save, an empty list is returned.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| srcFileUris | Array\<String> | Yes | - | The media library URIs of the image/video files to be saved. <br>**Note:** Only image and video URIs are supported. |
| photoCreationConfigs | Array\<[PhotoCreationConfig](#struct-photocreationconfig)> | Yes | - | Configuration for saving images/videos to the media library, including filenames, etc. Must correspond one-to-one with `srcFileUris`. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<Array\<String>> | Yes | - | Callback function to retrieve the list of media library file URIs returned to the application. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  |:----|:---|
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 14000011 | Internal system error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*
import ohos.base.*

// This code can be added to dependency definitions
class MyCallback<T> <: Callback1Argument<T> {
    public let callabck_: (T) -> Unit
    public init(callabck: (T) -> Unit) {
        callabck_ = callabck
    }
    public open func invoke(arg: T): Unit {
        callabck_(arg)
    }
}

let ctx = Global.getAbilityContext() // Context application context required; see usage instructions
let phAccessHelper = getPhotoAccessHelper(ctx)
let callback3 = MyCallback<Array<String>>(
    {
        arg: Array<String> =>
        AppLog.info("oncallback3: Array.size: ${arg.size}")
        for (str in arg) {
            AppLog.info("oncallback3: uri: ${str}")
        }
    }
)
// Get the URIs of images/videos located in the application sandbox that need to be saved to the media library
// Use actual URIs in real scenarios
let srcFileUris: Array<String> = ["file://media/Photo/37/IMG_1731463495_028/IMG_20241113_100315.jpg"]
let photoCreationConfigs: Array<PhotoCreationConfig> = [
    PhotoCreationConfig(
        'jpg',
        PhotoType.IMAGE,
        title: "test4",
        subtype: PhotoSubtype.DEFAULT
    )
]
phAccessHelper.showAssetsCreationDialog(srcFileUris, photoCreationConfigs, callback3)
```

### func unRegisterChange(String, ?Callback1Argument\<ChangeData>)

```cangjie
public func unRegisterChange(uri: String, callback!: ?Callback1Argument<ChangeData> = None): Unit
```

**Function:** Cancels the listener for the specified URI. Multiple callbacks can be registered for a URI. When multiple callbacks exist, a specific registered callback can be canceled. If no callback is specified, all listeners for the URI are canceled.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| uri | String | Yes | - | The URI of PhotoAsset, Album, or a value from [DefaultChangeUri](#enum-defaultchangeuri). |
| callback | ?[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[ChangeData](#class-changedata)> | No | None | **Named parameter.** Cancels the listener for the callback registered via [registerChange](#func-registerchangestring-bool-callback1argumentchangedata). If not specified, all listeners for the URI are canceled. Note: After unregistering a specific callback, it will no longer trigger. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  |:----|:---|
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 13900012 | Permission denied. |
  | 13900020 | Invalid argument. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*
import ohos.base.*

// This code can be added to dependency definitions
class MyCallback<T> <: Callback1Argument<T> {
    public let callabck_: (T) -> Unit
    public init(callabck: (T) -> Unit) {
        callabck_ = callabck
    }
    public open func invoke(arg: T): Unit {
        callabck_(arg)
    }
}

let ctx = Global.getAbilityContext() // Context application context required; see usage instructions
let phAccessHelper = getPhotoAccessHelper(ctx)
let callback1 = MyCallback<ChangeData>(
    {
        arg: ChangeData => AppLog.info(
            "onCallback1. ChangeData: type = ${arg.`type`.toString()}, uris.size: ${arg.uris.size}, extraUris.size = ${arg.extraUris.size}"
        )
    })

let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: ['title'], predicates: predicates)
let fetchResult: FetchResult<PhotoAsset> = phAccessHelper.getAssets(fetchOptions)
let firstPhotoAsset = fetchResult.getFirstObject()

phAccessHelper.registerChange(firstPhotoAsset.uri, false, callback1)
phAccessHelper.unRegisterChange(firstPhotoAsset.uri, callback: callback1)
phAccessHelper.unRegisterChange(firstPhotoAsset.uri)
```

## class PhotoAsset

```cangjie
public class PhotoAsset {}
```

**Function:** Provides methods to encapsulate file attributes.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### prop displayName

```cangjie
public prop displayName: String
```

**Function:** Gets the filename, including the extension.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### prop photoType

```cangjie
public prop photoType: PhotoType
```

**Function:** Gets the media file type.

**Type:** [PhotoType](#enum-phototype)

**Access:** Read-only

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### prop uri

```cangjie
public prop uri: String
```

**Function:** Gets the URI of the media file resource.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func commitModify()

```cangjie
public func commitModify(): Unit
```

**Function:** Modifies the metadata of the file.

**Required Permission:** ohos.permission.WRITE_IMAGEVIDEO

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  |Error Code ID|Error Message|
  |:----|:---|
  |401| Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types.|
  |13900012|Permission denied.|
  |13900020|Invalid argument.|
  |14000001|Invalid display name.|
  |14000011|System inner fail.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*
import ohos.base.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchColumns = [PhotoKeys
    .TITLE
    .toString()]
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: fetchColumns, predicates: predicates
)
let fetchResult: FetchResult<PhotoAsset> = phAccessHelper.getAssets(fetchOptions)
let firstPhotoAsset = fetchResult.getFirstObject()
let photoAssetTitle = firstPhotoAsset
    .get('title')
    .getString()
let newTitle = "123456789"
firstPhotoAsset.set('title', newTitle)
firstPhotoAsset.commitModify()
```

### func get(String)

```cangjie
public func get(member: String): MemberType
```

**Function:** Gets the member parameters of PhotoAsset.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|member|String|Yes|-|Member parameter name. When getting, except for 'uri', 'media_type', 'subtype', and 'display_name', other attributes need to include the required [PhotoKeys](#enum-photokeys) in fetchColumns, e.g., to get the title attribute: fetchColumns: ['title'].|

**Return Value:**

|Type|Description|
|:----|:----|
|[MemberType](#enum-membertype)|The value of the PhotoAsset member parameter.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  |Error Code ID|Error Message|
  |:----|:---|
  |401| Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types; 3. Parameter verification failed.|
  |13900020|Invalid argument.|
  |14000014|Member is not a valid PhotoKey.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*
import ohos.base.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchColumns = [PhotoKeys
    .TITLE
    .toString()]
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: fetchColumns, predicates: predicates
)
let fetchResult: FetchResult<PhotoAsset> = phAccessHelper.getAssets(fetchOptions)
let firstPhotoAsset = fetchResult.getFirstObject()
let photoAssetTitle = firstPhotoAsset
    .get('title')
    .getString()
```

### func getThumbnail(?Size)

```cangjie
public func getThumbnail(size!: ?Size = None): PixelMap
```

**Function:** Gets the thumbnail of the file with the specified size.

**Required Permission:** ohos.permission.READ_IMAGEVIDEO

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|size|?[Size](../ImageKit/cj-apis-image.md#struct-size)|No|None| **Named parameter.** Thumbnail size.|

**Return Value:**

|Type|Description|
|:----|:----|
|[PixelMap](../ImageKit/cj-apis-image.md#class-pixelmap)|Returns the PixelMap of the thumbnail.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  |Error Code ID|Error Message|
  |:----|:---|
  |401| Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types.|
  |13900012|Permission denied.|
  |13900020|Invalid argument.|
  |14000011|System inner fail.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*
import ohos.base.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchColumns = [PhotoKeys
    .TITLE
    .toString()]
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: fetchColumns, predicates: predicates
)
let fetchResult: FetchResult<PhotoAsset> = phAccessHelper.getAssets(fetchOptions)
let firstPhotoAsset = fetchResult.getFirstObject()
let pixm = firstPhotoAsset.getThumbnail()
```

### func set(String, String)

```cangjie
public func set(member: String, data: String): Unit
```

**Function:** Sets the member parameters of PhotoAsset.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|member|String|Yes|-|Member parameter name, e.g., [PhotoKeys](#enum-photokeys).TITLE.|
|data|String|Yes|-|Sets the member parameter name. Only the value of [PhotoKeys](#enum-photokeys).TITLE can be modified.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  |Error Code ID|Error Message|
  |:----|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types; 3. Parameter verification failed.|
  |13900020|Invalid argument.|
  |14000014|Member is not a valid PhotoKey.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*
import ohos.base.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchColumns = [PhotoKeys
    .TITLE
    .toString()]
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: fetchColumns, predicates: predicates
)
let fetchResult: FetchResult<PhotoAsset> = phAccessHelper.getAssets(fetchOptions)
let firstPhotoAsset = fetchResult.getFirstObject()
let photoAssetTitle = firstPhotoAsset
    .get('title')
    .getString()
let newTitle = "123456789"
firstPhotoAsset.set('title', newTitle)
```

## class PhotoSelectOptions

```cangjie
public class PhotoSelectOptions <: BaseSelectOptions {
    public var isEditSupported: Bool = true
    public var isOriginalSupported: Bool = false
    public var subWindowName:?String = None
    public init(
        MIMEType!: PhotoViewMIMETypes = IMAGE_VIDEO_TYPE,
        maxSelectNumber!: Int32 = 50,
        isPhotoTakingSupported!: Bool = true,
        isSearchSupported!: Bool = true,
        recommendationOptions!: RecommendationOptions = RecommendationOptions(),
        preselectedUris!: Array<String> = Array<String>(),
        isPreviewForSingleSelectionSupported!: Bool = true,
        isEditSupported!: Bool = true,
        isOriginalSupported!: Bool = false,
        subWindowName!: ?String = None
    )
}
```

**Function:** Gallery selection options subclass, inherits from BaseSelectOptions.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Type:**

- [BaseSelectOptions](#class-baseselectoptions)

### var isEditSupported

```cangjie
public var isEditSupported: Bool = true
```

**Function:** Whether photo editing is supported.

**Type:** Bool

**Read-Write Capability:** Read-write

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var isOriginalSupported

```cangjie
public var isOriginalSupported: Bool = false
```

**Function:** Whether the original file is supported.

**Type:** Bool

**Read-Write Capability:** Read-write

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21**Feature:** Whether to display the original image selection button.

**Type:** Bool

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var subWindowName

```cangjie
public var subWindowName:?String = None
```

**Feature:** Sub-window name.

**Type:** ?String

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### init(PhotoViewMIMETypes, Int32, Bool, Bool, RecommendationOptions, Array\<String>, Bool, Bool, Bool, ?String)

```cangjie
public init(
    MIMEType!: PhotoViewMIMETypes = IMAGE_VIDEO_TYPE,
    maxSelectNumber!: Int32 = 50,
    isPhotoTakingSupported!: Bool = true,
    isSearchSupported!: Bool = true,
    recommendationOptions!: RecommendationOptions = RecommendationOptions(),
    preselectedUris!: Array<String> = Array<String>(),
    isPreviewForSingleSelectionSupported!: Bool = true,
    isEditSupported!: Bool = true,
    isOriginalSupported!: Bool = false,
    subWindowName!: ?String = None
)
```

**Feature:** Constructs a PhotoSelectOptions object.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|MIMEType|[PhotoViewMIMETypes](#enum-photoviewmimetypes)|No|IMAGE_VIDEO_TYPE| **Named parameter.** Selectable media file types. If not specified, defaults to image and video types.|
|maxSelectNumber|Int32|No|50| **Named parameter.** Maximum number of selectable media files (maximum settable value is 500; defaults to 50 if not set).|
|isPhotoTakingSupported|Bool|No|true| **Named parameter.** Whether photo capture is supported. true indicates support, false indicates no support. Defaults to true.|
|isSearchSupported|Bool|No|true| **Named parameter.** Whether search is supported. true indicates support, false indicates no support. Defaults to true.|
|recommendationOptions|[RecommendationOptions](#struct-recommendationoptions)|No|RecommendationOptions()| **Named parameter.** Image recommendation configuration parameters.|
|preselectedUris|Array\<String>|No|Array\<String>()| **Named parameter.** URIs of preselected images.|
|isPreviewForSingleSelectionSupported|Bool|No|true| **Named parameter.** Whether to enable large image preview in single-selection mode. true indicates yes, false indicates no. Defaults to true.|
|isEditSupported|Bool|No|true| **Named parameter.** Whether photo editing is supported. true indicates support, false indicates no support. Defaults to true.|
|isOriginalSupported|Bool|No|false| **Named parameter.** Whether to display the original image selection button. true indicates display, false indicates no display. Defaults to false.|
|subWindowName|?String|No|None| **Named parameter.** Sub-window name.|

## class RequestOptions

```cangjie
public class PhotoViewPicker {
    public init(gcontext: UIAbilityContext)
}
```

**Feature:** Gallery picker object used to support user scenarios such as selecting images/videos. A PhotoViewPicker instance must be created before use.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var deliveryMode

```cangjie
public var deliveryMode: DeliveryMode
```

**Feature:** Resource request delivery mode.

**Type:** [DeliveryMode](#enum-deliverymode)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### RequestOptions(DeliveryMode)

```cangjie
public RequestOptions(
    public var deliveryMode: DeliveryMode
)
```

**Feature:** Constructs a RequestOptions object.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|deliveryMode|[DeliveryMode](#enum-deliverymode)|Yes|-|Resource request delivery mode, which specifies the request strategy for the resource. Can be configured as FAST, HIGH_QUALITY, or BALANCED mode.|

## struct CreateOptions

```cangjie
public struct CreateOptions {
    public CreateOptions(
        public var title!: ?String = None,
        public var subtype!: ?PhotoSubtype = None
    )
}
```

**Feature:** Creation options for images or videos, including titles, etc.

Specifications for the title parameter:

- Should not contain file extensions.
- Filename string length must be 1–255 characters.
- The following invalid English characters are not allowed in filenames: `. .. \ / : * ? " ' ` < > | { } [ ]`

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var subtype

```cangjie
public var subtype:?PhotoSubtype = None
```

**Feature:** Subtype of the image or video.

**Type:** ?[PhotoSubtype](#enum-photosubtype)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var title

```cangjie
public var title:?String = None
```

**Feature:** Title of the image or video.

**Type:** ?String

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### CreateOptions(?String, ?PhotoSubtype)

```cangjie
public CreateOptions(
    public var title!: ?String = None,
    public var subtype!: ?PhotoSubtype = None
)
```

**Feature:** Constructs a CreateOptions object.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|title|?String|No|None| **Named parameter.** Title of the image or video.|
|subtype|?[PhotoSubtype](#enum-photosubtype)|No|None| **Named parameter.** Subtype of the image or video.|

## struct PhotoCreationConfig

```cangjie
public struct PhotoCreationConfig {
    public PhotoCreationConfig(
        public let fileNameExtension: String,
        public let photoType: PhotoType,
        public let title!: String = "",
        public let subtype!: PhotoSubtype = DEFAULT
    )
}
```

**Feature:** Configuration for saving images/videos to the media library, including filenames, etc.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### let fileNameExtension

```cangjie
public let fileNameExtension: String
```

**Feature:** File extension.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### let photoType

```cangjie
public let photoType: PhotoType
```

**Feature:** File type.

**Type:** [PhotoType](#enum-phototype)

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### let subtype

```cangjie
public let subtype: PhotoSubtype = DEFAULT
```

**Feature:** File subtype.

**Type:** [PhotoSubtype](#enum-photosubtype)

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### let title

```cangjie
public let title: String = ""
```

**Feature:** Title of the image or video.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### PhotoCreationConfig(String, PhotoType, String, PhotoSubtype)

```cangjie
public PhotoCreationConfig(
    public let fileNameExtension: String,
    public let photoType: PhotoType,
    public let title!: String = "",
    public let subtype!: PhotoSubtype = DEFAULT
)
```

**Feature:** Constructs a PhotoCreationConfig object.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|fileNameExtension|String|Yes|-|File extension, e.g., 'jpg'.|
|photoType|[PhotoType](#enum-phototype)|Yes|-|Type of file to create: IMAGE or VIDEO.|
|title|String|No|""| **Named parameter.** Title of the image or video.|
|subtype|[PhotoSubtype](#enum-photosubtype)|No|DEFAULT| **Named parameter.** Subtype of the image or video: DEFAULT or MOVING_PHOTO.|## struct PhotoSelectResult

```cangjie
public struct PhotoSelectResult {
    public PhotoSelectResult(
        public var photoUris: Array<String>,
        public var isOriginalPhoto: Bool
    )
}
```

**Function:** Returns the result set after gallery selection.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var isOriginalPhoto

```cangjie
public var isOriginalPhoto: Bool
```

**Function:** Indicates whether the photo is original.

**Type:** Bool

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var photoUris

```cangjie
public var photoUris: Array<String>
```

**Function:** URI array of media files.

**Type:** Array\<String>

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### PhotoSelectResult(Array\<String>, Bool)

```cangjie
public PhotoSelectResult(
    public var photoUris: Array<String>,
    public var isOriginalPhoto: Bool
)
```

**Function:** Constructs a PhotoSelectResult object.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| photoUris | Array\<String> | Yes | - | URI array of media files after gallery selection. This URI array can only be used by calling the [getAssets interface](#func-getassetsfetchoptions) through temporary authorization. |
| isOriginalPhoto | Bool | Yes | - | Indicates whether the media files after gallery selection are original. |

## struct RecommendationOptions

```cangjie
public struct RecommendationOptions {
    public RecommendationOptions(
        public var recommendationType!: ?RecommendationType = None,
        public var textContextInfo!: ?TextContextInfo = None
    )
}
```

**Function:** Image recommendation options (based on image data analysis results, dependent on device adaptation).

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var recommendationType

```cangjie
public var recommendationType:?RecommendationType = None
```

**Function:** Text.

**Type:** ?[RecommendationType](#enum-recommendationtype)

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var textContextInfo

```cangjie
public var textContextInfo:?TextContextInfo = None
```

**Function:** Text.

**Type:** ?[TextContextInfo](#struct-textcontextinfo)

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### RecommendationOptions(?RecommendationType, ?TextContextInfo)

```cangjie
public RecommendationOptions(
    public var recommendationType!: ?RecommendationType = None,
    public var textContextInfo!: ?TextContextInfo = None
)
```

**Function:** Constructs a RecommendationOptions object.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| recommendationType | ?[RecommendationType](#enum-recommendationtype) | No | None | **Named parameter.** Configure this parameter if you need to recommend corresponding images based on enumeration values. |
| textContextInfo | ?[TextContextInfo](#struct-textcontextinfo) | No | None | **Named parameter.** Configure this parameter if you need to recommend corresponding images based on text information (if recommendationType is also configured, only textContextInfo takes effect). |

## struct TextContextInfo

```cangjie
public struct TextContextInfo {
    public TextContextInfo (
        public let text!: String = ""
    )
}
```

**Function:** Text information used for recommending images.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### let text

```cangjie
public let text: String = ""
```

**Function:** Text.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### TextContextInfo(String)

```cangjie
public TextContextInfo (public let text!: String = "")
```

**Function:** Constructs a TextContextInfo object.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| text | String | No | "" | **Named parameter.** Configure this parameter if you need to recommend corresponding images based on text (supports simplified Chinese within 250 characters). |

## enum AlbumKeys

```cangjie
public enum AlbumKeys <: ToString & Equatable<AlbumKeys> {
    | URI
    | ALBUM_NAME
    | ...
}
```

**Function:** Key information of albums.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Types:**

- ToString
- Equatable\<AlbumKeys>

### ALBUM_NAME

```cangjie
ALBUM_NAME
```

**Function:** Album name.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### URI

```cangjie
URI
```

**Function:** Album URI.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func !=(AlbumKeys)

```cangjie
public operator func !=(other: AlbumKeys): Bool 
```

**Function:** Determines whether two enumeration values are not equal.

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [AlbumKeys](#enum-albumkeys) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enumeration values are not equal, otherwise returns false. |

### func ==(AlbumKeys)

```cangjie
public operator func ==(other: AlbumKeys): Bool
```

**Function:** Determines whether two enumeration values are equal.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [AlbumKeys](#enum-albumkeys) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enumeration values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enumeration.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Description of the enumeration. |## enum AlbumSubtype

```cangjie
public enum AlbumSubtype <: Equatable<AlbumSubtype> & ToString {
    | USER_GENERIC
    | FAVORITE
    | VIDEO
    | IMAGE
    | ANY
    | ...
}
```

**Description:** Album subtype, representing specific album types.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Types:**

- Equatable\<AlbumSubtype>
- ToString

### ANY

```cangjie
ANY
```

**Description:** Any album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### FAVORITE

```cangjie
FAVORITE
```

**Description:** Favorites album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### IMAGE

```cangjie
IMAGE
```

**Description:** Image album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### USER_GENERIC

```cangjie
USER_GENERIC
```

**Description:** User album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### VIDEO

```cangjie
VIDEO
```

**Description:** Video album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func !=(AlbumSubtype)

```cangjie
public operator func !=(other: AlbumSubtype): Bool 
```

**Description:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[AlbumSubtype](#enum-albumsubtype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are not equal, otherwise returns false.|

### func ==(AlbumSubtype)

```cangjie
public operator func ==(other: AlbumSubtype): Bool
```

**Description:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[AlbumSubtype](#enum-albumsubtype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

### func toString()

```cangjie
public func toString(): String
```

**Description:** Gets the value of the enum.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Description of the enum.|

## enum AlbumType

```cangjie
public enum AlbumType <: Equatable<AlbumType> & ToString {
    | USER
    | SYSTEM
    | ...
}
```

**Description:** Album type, indicating whether it is a user album or a system preset album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Types:**

- Equatable\<AlbumType>
- ToString

### SYSTEM

```cangjie
SYSTEM
```

**Description:** System preset album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### USER

```cangjie
USER
```

**Description:** User album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func !=(AlbumType)

```cangjie
public operator func !=(other: AlbumType): Bool
```

**Description:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[AlbumType](#enum-albumtype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are not equal, otherwise returns false.|

### func ==(AlbumType)

```cangjie
public operator func ==(other: AlbumType): Bool
```

**Description:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[AlbumType](#enum-albumtype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

### func toString()

```cangjie
public func toString(): String
```

**Description:** Gets the value of the enum.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Description of the enum.|

## enum DefaultChangeUri

```cangjie
public enum DefaultChangeUri <: ToString & Equatable<DefaultChangeUri> {
    | DEFAULT_PHOTO_URI
    | DEFAULT_ALBUM_URI
    | ...
}
```

**Description:** DefaultChangeUri subtype.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Types:**

- ToString
- Equatable\<DefaultChangeUri>

### DEFAULT_ALBUM_URI

```cangjie
DEFAULT_ALBUM_URI
```

**Description:** Default album URI, used with forSubUri{true} to receive change notifications for all albums.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### DEFAULT_PHOTO_URI

```cangjie
DEFAULT_PHOTO_URI
```
**Function:** The default URI for PhotoAsset, used in conjunction with `forSubUri{true}`, will receive change notifications for all PhotoAssets.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func !=(DefaultChangeUri)

```cangjie
public operator func !=(other: DefaultChangeUri): Bool
```

**Function:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [DefaultChangeUri](#enum-defaultchangeuri) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are not equal; otherwise, returns `false`. |

### func ==(DefaultChangeUri)

```cangjie
public operator func ==(other: DefaultChangeUri): Bool
```

**Function:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [DefaultChangeUri](#enum-defaultchangeuri) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are equal; otherwise, returns `false`. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enum.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enum. |

## enum DeliveryMode

```cangjie
public enum DeliveryMode <: Equatable<DeliveryMode> & ToString {
    | FAST_MODE
    | HIGH_QUALITY_MODE
    | BALANCE_MODE
    | ...
}
```

**Function:** Resource delivery mode.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Types:**

- Equatable\<DeliveryMode>
- ToString

### BALANCE_MODE

```cangjie
BALANCE_MODE
```

**Function:** Balanced mode.

**Since:** 21

### FAST_MODE

```cangjie
FAST_MODE
```

**Function:** Fast mode.

**Since:** 21

### HIGH_QUALITY_MODE

```cangjie
HIGH_QUALITY_MODE
```

**Function:** High-quality mode.

**Since:** 21

### func !=(DeliveryMode)

```cangjie
public operator func !=(other: DeliveryMode): Bool
```

**Function:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [DeliveryMode](#enum-deliverymode) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are not equal; otherwise, returns `false`. |

### func ==(DeliveryMode)

```cangjie
public operator func ==(other: DeliveryMode): Bool
```

**Function:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [DeliveryMode](#enum-deliverymode) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are equal; otherwise, returns `false`. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enum.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enum. |

## enum DynamicRangeType

```cangjie
public enum DynamicRangeType <: Equatable<DynamicRangeType> & ToString {
    | SDR
    | HDR
    | ...
}
```

**Function:** The dynamic range type of media files.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Types:**

- Equatable\<DynamicRangeType>
- ToString

### HDR

```cangjie
HDR
```

**Function:** High dynamic range type.

**Since:** 21

### SDR

```cangjie
SDR
```

**Function:** Standard dynamic range type.

**Since:** 21

### func !=(DynamicRangeType)

```cangjie
public operator func !=(other: DynamicRangeType): Bool
```

**Function:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [DynamicRangeType](#enum-dynamicrangetype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are not equal; otherwise, returns `false`. |

### func ==(DynamicRangeType)

```cangjie
public operator func ==(other: DynamicRangeType): Bool
```

**Function:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [DynamicRangeType](#enum-dynamicrangetype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are equal; otherwise, returns `false`. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enum.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enum. |

## enum MemberType
```cangjie
public enum MemberType {
    | INT64(Int64)
    | STRING(String)
    | BOOL(Bool)
    | ...
}
```

**Function:** Member type of PhotoAsset.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### BOOL(Bool)

```cangjie
BOOL(Bool)
```

**Function:** Represents a boolean value type.

**Since:** 21

### INT64(Int64)

```cangjie
INT64(Int64)
```

**Function:** Represents a numeric value type that can take any value.

**Since:** 21

### STRING(String)

```cangjie
STRING(String)
```

**Function:** Represents a string value type that can take any value.

**Since:** 21

### func getBool()

```cangjie
public func getBool(): Bool
```

**Function:** Gets the value from BOOL(Bool).

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns the value from BOOL(Bool).|

### func getNumber()

```cangjie
public func getNumber(): Int64
```

**Function:** Gets the value from INT64(Int64).

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Int64|Returns the value from INT64(Int64).|

### func getString()

```cangjie
public func getString(): String
```

**Function:** Gets the value from STRING(String).

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Returns the value from STRING(String).|

## enum NotifyType

```cangjie
public enum NotifyType <: Equatable<NotifyType> & ToString {
    | NOTIFY_ADD
    | NOTIFY_UPDATE
    | NOTIFY_REMOVE
    | NOTIFY_ALBUM_ADD_ASSET
    | NOTIFY_ALBUM_REMOVE_ASSET
    | ...
}
```

**Function:** Types of notification events.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Types:**

- Equatable\<NotifyType>
- ToString

### NOTIFY_ADD

```cangjie
NOTIFY_ADD
```

**Function:** Notification type for adding a file set or album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### NOTIFY_ALBUM_ADD_ASSET

```cangjie
NOTIFY_ALBUM_ADD_ASSET
```

**Function:** Notification type for adding a file set to an album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### NOTIFY_ALBUM_REMOVE_ASSET

```cangjie
NOTIFY_ALBUM_REMOVE_ASSET
```

**Function:** Notification type for removing a file set from an album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### NOTIFY_REMOVE

```cangjie
NOTIFY_REMOVE
```

**Function:** Notification type for removing a file set or album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### NOTIFY_UPDATE

```cangjie
NOTIFY_UPDATE
```

**Function:** Notification type for updating a file set or album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func !=(NotifyType)

```cangjie
public operator func !=(other: NotifyType): Bool
```

**Function:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[NotifyType](#enum-notifytype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are not equal, otherwise returns false.|

### func ==(NotifyType)

```cangjie
public operator func ==(other: NotifyType): Bool
```

**Function:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[NotifyType](#enum-notifytype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enum.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Description of the enum.|

## enum PhotoKeys

```cangjie
public enum PhotoKeys <: ToString & Equatable<PhotoKeys> {
    | URI
    | PHOTO_TYPE
    | DISPLAY_NAME
    | SIZE
    | DATE_ADDED
    | DATE_MODIFIED
    | DURATION
    | WIDTH
    | HEIGHT
    | DATE_TAKEN
    | ORIENTATION
    | FAVORITE
    | TITLE
    | DATE_ADDED_MS
    | DATE_MODIFIED_MS
    | PHOTO_SUBTYPE
    | DYNAMIC_RANGE_TYPE
    | COVER_POSITION
    | BURST_KEY
    | LCD_SIZE
    | THM_SIZE
    | ...
}
```

**Function:** Key information of photo and video files.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Types:**

- ToString
- [Equatable\<PhotoKeys>]

### BURST_KEY

```cangjie
BURST_KEY
```

**Function:** Unique identifier (UUID) for a burst photo set.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21### COVER_POSITION

```cangjie
COVER_POSITION
```

**Function:** Cover position for dynamic photos, specifically indicating the video timestamp (in microseconds) corresponding to the cover frame.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### DATE_ADDED

```cangjie
DATE_ADDED
```

**Function:** Date added (seconds elapsed since January 1, 1970, when the file was added).

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### DATE_ADDED_MS

```cangjie
DATE_ADDED_MS
```

**Function:** Date added (milliseconds elapsed since January 1, 1970, when the file was added).

Note: Sorting based on this field is not supported when querying photos.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### DATE_MODIFIED

```cangjie
DATE_MODIFIED
```

**Function:** Modification date (seconds elapsed since January 1, 1970, when the file was modified; renaming the file does not change this value; it updates only when the file content is modified).

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### DATE_MODIFIED_MS

```cangjie
DATE_MODIFIED_MS
```

**Function:** Modification date (milliseconds elapsed since January 1, 1970, when the file was modified; renaming the file does not change this value; it updates only when the file content is modified).

Note: Sorting based on this field is not supported when querying photos.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### DATE_TAKEN

```cangjie
DATE_TAKEN
```

**Function:** Capture date (seconds elapsed since January 1, 1970, when the photo was taken).

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### DISPLAY_NAME

```cangjie
DISPLAY_NAME
```

**Function:** Display name.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### DURATION

```cangjie
DURATION
```

**Function:** Duration (in milliseconds).

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### DYNAMIC_RANGE_TYPE

```cangjie
DYNAMIC_RANGE_TYPE
```

**Function:** Dynamic range type of the media file.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### FAVORITE

```cangjie
FAVORITE
```

**Function:** Favorite.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### HEIGHT

```cangjie
HEIGHT
```

**Function:** Image height (in pixels).

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### LCD_SIZE

```cangjie
LCD_SIZE
```

**Function:** Width and height of the LCD image, represented as a string concatenated as `width:height`.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### ORIENTATION

```cangjie
ORIENTATION
```

**Function:** Rotation angle of the file, in degrees.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### PHOTO_SUBTYPE

```cangjie
PHOTO_SUBTYPE
```

**Function:** Dynamic range type of the media file.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### PHOTO_TYPE

```cangjie
PHOTO_TYPE
```

**Function:** Media file type.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### SIZE

```cangjie
SIZE
```

**Function:** File size (in bytes).

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### THM_SIZE

```cangjie
THM_SIZE
```

**Function:** Width and height of the thumbnail image, represented as a string concatenated as `width:height`.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### TITLE

```cangjie
TITLE
```

**Function:** File title.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### URI

```cangjie
URI
```

**Function:** File URI.

Note: When querying photos, this field supports only the [DataSharePredicates.equalTo](../ArkData/cj-apis-data_share_predicates.md#func-equaltostring-valuetype) predicate.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### WIDTH

```cangjie
WIDTH
```

**Function:** Image width (in pixels).

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func !=(PhotoKeys)

```cangjie
public operator func !=(other: PhotoKeys): Bool
```

**Function:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [PhotoKeys](#enum-photokeys) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are not equal; otherwise, returns `false`. |

### func ==(PhotoKeys)

```cangjie
public operator func ==(other: PhotoKeys): Bool
```

**Function:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [PhotoKeys](#enum-photokeys) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are equal; otherwise, returns `false`. |

### func toString()

```cangjie
public func toString(): String
```
**Function:** Get the value of an enumeration.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

| Type   | Description          |
|:------|:-------------------|
| String | Description of the enumeration. |

## enum PhotoSubtype

```cangjie
public enum PhotoSubtype <: Equatable<PhotoSubtype> & ToString {
    | DEFAULT
    | MOVING_PHOTO
    | BURST
    | ...
}
```

**Function:** Burst photo file type.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Types:**

- Equatable\<PhotoSubtype>
- ToString

### BURST

```cangjie
BURST
```

**Function:** Burst photo file type.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### DEFAULT

```cangjie
DEFAULT
```

**Function:** Default photo type.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### MOVING_PHOTO

```cangjie
MOVING_PHOTO
```

**Function:** Moving photo file type.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func !=(PhotoSubtype)

```cangjie
public operator func !=(other: PhotoSubtype): Bool
```

**Function:** Determine if two enumeration values are not equal.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---------|:-----|:--------|:--------|:------------|
| other | [PhotoSubtype](#enum-photosubtype) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:-----|:-----------|
| Bool | Returns `true` if the two enumeration values are not equal, otherwise returns `false`. |

### func ==(PhotoSubtype)

```cangjie
public operator func ==(other: PhotoSubtype): Bool
```

**Function:** Determine if two enumeration values are equal.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---------|:-----|:--------|:--------|:------------|
| other | [PhotoSubtype](#enum-photosubtype) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:-----|:-----------|
| Bool | Returns `true` if the two enumeration values are equal, otherwise returns `false`. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Get the value of an enumeration.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:-----|:-----------|
| String | Description of the enumeration. |

## enum PhotoType

```cangjie
public enum PhotoType <: Equatable<PhotoType> & ToString {
    | IMAGE
    | VIDEO
    | ...
}
```

**Function:** Media file type.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Types:**

- Equatable\<PhotoType>
- ToString

### IMAGE

```cangjie
IMAGE
```

**Function:** Image.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### VIDEO

```cangjie
VIDEO
```

**Function:** Video.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func !=(PhotoType)

```cangjie
public operator func !=(other: PhotoType): Bool
```

**Function:** Determine if two enumeration values are not equal.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---------|:-----|:--------|:--------|:------------|
| other | [PhotoType](#enum-phototype) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:-----|:-----------|
| Bool | Returns `true` if the two enumeration values are not equal, otherwise returns `false`. |

### func ==(PhotoType)

```cangjie
public operator func ==(other: PhotoType): Bool
```

**Function:** Determine if two enumeration values are equal.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---------|:-----|:--------|:--------|:------------|
| other | [PhotoType](#enum-phototype) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:-----|:-----------|
| Bool | Returns `true` if the two enumeration values are equal, otherwise returns `false`. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Get the value of an enumeration.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:-----|:-----------|
| String | Description of the enumeration. |

## enum PhotoViewMIMETypes

```cangjie
public enum PhotoViewMIMETypes <: Equatable<PhotoViewMIMETypes> & ToString {
    | IMAGE_TYPE
    | VIDEO_TYPE
    | IMAGE_VIDEO_TYPE
    | MOVING_PHOTO_IMAGE_TYPE
    | ...
}
```

**Function:** Selectable media file types.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Types:**

- Equatable\<PhotoViewMIMETypes>
- ToString

### IMAGE_TYPE

```cangjie
IMAGE_TYPE
```

**Function:** Image type.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### IMAGE_VIDEO_TYPE

```cangjie
IMAGE_VIDEO_TYPE
```

**Function:** Image and video types.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### MOVING_PHOTO_IMAGE_TYPE

```cangjie
MOVING_PHOTO_IMAGE_TYPE
```
**Feature:** Dynamic photo type.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### VIDEO_TYPE

```cangjie
VIDEO_TYPE
```

**Feature:** Video type.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func !=(PhotoViewMIMETypes)

```cangjie
public operator func !=(other: PhotoViewMIMETypes): Bool
```

**Feature:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [PhotoViewMIMETypes](#enum-photoviewmimetypes) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are not equal; otherwise, returns `false`. |

### func ==(PhotoViewMIMETypes)

```cangjie
public operator func ==(other: PhotoViewMIMETypes): Bool
```

**Feature:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [PhotoViewMIMETypes](#enum-photoviewmimetypes) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are equal; otherwise, returns `false`. |

### func toString()

```cangjie
public func toString(): String
```

**Feature:** Gets the value of the enum.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enum. |

## enum RecommendationType

```cangjie
public enum RecommendationType <: Equatable<RecommendationType> & ToString {
    | QR_OR_BAR_CODE
    | QR_CODE
    | BAR_CODE
    | ID_CARD
    | PROFILE_PICTURE
    | PASSPORT
    | BANK_CARD
    | DRIVER_LICENSE
    | DRIVING_LICENSE
    | FEATURED_SINGLE_PORTRAIT
    | ...
}
```

**Feature:** Recommended image types.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Types:**

- Equatable\<RecommendationType>
- ToString

### BANK_CARD

```cangjie
BANK_CARD
```

**Feature:** Bank card.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### BAR_CODE

```cangjie
BAR_CODE
```

**Feature:** Barcode.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### DRIVER_LICENSE

```cangjie
DRIVER_LICENSE
```

**Feature:** Driver's license.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### DRIVING_LICENSE

```cangjie
DRIVING_LICENSE
```

**Feature:** Vehicle license.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### FEATURED_SINGLE_PORTRAIT

```cangjie
FEATURED_SINGLE_PORTRAIT
```

**Feature:** Recommended portrait.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### ID_CARD

```cangjie
ID_CARD
```

**Feature:** ID card.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### PASSPORT

```cangjie
PASSPORT
```

**Feature:** Passport.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### PROFILE_PICTURE

```cangjie
PROFILE_PICTURE
```

**Feature:** Profile picture.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### QR_CODE

```cangjie
QR_CODE
```

**Feature:** QR code.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### QR_OR_BAR_CODE

```cangjie
QR_OR_BAR_CODE
```

**Feature:** QR code or barcode.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func !=(RecommendationType)

```cangjie
public operator func !=(other: RecommendationType): Bool
```

**Feature:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [RecommendationType](#enum-recommendationtype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are not equal; otherwise, returns `false`. |

### func ==(RecommendationType)

```cangjie
public operator func ==(other: RecommendationType): Bool
```

**Feature:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [RecommendationType](#enum-recommendationtype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are equal; otherwise, returns `false`. |

### func toString()

```cangjie
public func toString(): String
```

**Feature:** Gets the value of the enum.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enum. |## enum ResourceType

```cangjie
public enum ResourceType <: Equatable<ResourceType> & ToString {
    | IMAGE_RESOURCE
    | VIDEO_RESOURCE
    | ...
}
```

**Function:** Represents image resources.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Types:**

- Equatable\<ResourceType>
- ToString

### IMAGE_RESOURCE

```cangjie
IMAGE_RESOURCE
```

**Function:** Represents image resources.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### VIDEO_RESOURCE

```cangjie
VIDEO_RESOURCE
```

**Function:** Represents video resources.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func !=(ResourceType)

```cangjie
public operator func !=(other: ResourceType): Bool
```

**Function:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ResourceType](#enum-resourcetype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are not equal, otherwise returns false.|

### func ==(ResourceType)

```cangjie
public operator func ==(other: ResourceType): Bool
```

**Function:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ResourceType](#enum-resourcetype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enum.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Description of the enum.|