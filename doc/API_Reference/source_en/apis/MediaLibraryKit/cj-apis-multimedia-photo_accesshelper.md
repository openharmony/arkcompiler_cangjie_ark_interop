# ohos.file.photo_access_helper (Photo Album Management Module)

This module provides photo album management capabilities, including creating albums and accessing/modifying media data information within albums.

## Import Module

```cangjie
import kit.MediaLibraryKit.*
```

## Permission List

ohos.permission.READ_IMAGEVIDEO

ohos.permission.WRITE_IMAGEVIDEO

## Usage Instructions

API sample code usage instructions:

- If the sample code has a "// index.cj" comment in the first line, it indicates the sample can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-app-ability-ui_ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the sample project and configuration template mentioned above, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#cangjie-sample-code-instructions).

## interface MediaChangeRequest

```cangjie
public interface MediaChangeRequest {}
```

**Description:** Media change request, the parent type for asset change requests and album change requests.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

## class ChangeData

```cangjie
public class ChangeData {
    public var notifyType: NotifyType
    public var uris: Array<String>
    public var extraUris: Array<String>
}
```

**Description:** Listener callback function value.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var extraUris

```cangjie
public var extraUris: Array<String>
```

**Description:** Array of URIs for changed files in the album.

**Type:** Array\<String>

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var notifyType

```cangjie
public var notifyType: NotifyType
```

**Description:** Notification type of ChangeData.

**Type:** [NotifyType](#enum-notifytype)

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var uris

```cangjie
public var uris: Array<String>
```

**Description:** All URIs with the same [NotifyType](#enum-notifytype), which can be PhotoAsset or Album.

**Type:** Array\<String>

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

## class CreateOptions

```cangjie
public class CreateOptions {
    public var title: String = ""
    public var subtype: PhotoSubtype
    public init(title!: String = "", subtype!: PhotoSubtype = Default)
}
```

**Description:** Creation options for images or videos.

Title parameter specifications:

- Should not contain file extensions.
- Filename string length: 1~255 characters.
- Illegal English characters not allowed in filenames include: . .. \ / : * ? " ' ` < > | { } [ ]

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var subtype

```cangjie
public var subtype: PhotoSubtype
```

**Description:** Title of the image or video.

**Type:** [PhotoSubtype](#enum-photosubtype)

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var title

```cangjie
public var title: String = ""
```

**Description:** Title of the image or video.

**Type:** String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### init(String, PhotoSubtype)

```cangjie
public init(title!: String = "", subtype!: PhotoSubtype = Default)
```

**Description:** Constructs a CreateOptions object.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| title | String | No | "" | **Named parameter.** Title of the image or video. |
| subtype | [PhotoSubtype](#enum-photosubtype) | No | Default | **Named parameter.** File subtype of the image or video. |

## class FetchOptions

```cangjie
public class FetchOptions {
    public var fetchColumns: Array<String>
    public var predicates: DataSharePredicates
    public init(fetchColumns: Array<String>, predicates: DataSharePredicates)
}
```

**Description:** Retrieval conditions.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var fetchColumns

```cangjie
public var fetchColumns: Array<String>
```

**Description:** Retrieval conditions.

**Type:** Array\<String>

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var predicates

```cangjie
public var predicates: DataSharePredicates
```

**Description:** Predicate query.

**Type:** [DataSharePredicates](../ArkData/cj-apis-data_share_predicates.md#class-datasharepredicates)

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### init(Array\<String>, DataSharePredicates)

```cangjie
public init(fetchColumns: Array<String>, predicates: DataSharePredicates)
```

**Description:** Constructs a FetchOptions object.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| fetchColumns | Array\<String> | Yes | - | Retrieval conditions, specifying column names for query.<br>For photos, if this parameter is empty, it defaults to querying 'uri', 'media_type', 'subtype', and 'display_name'. Example: fetchColumns: ['uri', 'title'].<br>For albums, if this parameter is empty, it defaults to querying 'uri' and 'album_name'. |
| predicates | [DataSharePredicates](../ArkData/cj-apis-data_share_predicates.md#class-datasharepredicates) | Yes | - | Predicate query, displaying filter conditions. |

## class FetchResult

```cangjie
public class FetchResult<T> {}
```

**Description:** File retrieval result set.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func close()

```cangjie
public func close(): Unit
```

**Description:** Releases the FetchResult instance and invalidates it. No other methods can be called.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900020 | Invalid argument |
  | 14000011 | System inner fail |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.abilityContext // Context application context needs to be obtained. See usage instructions above.
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions([], predicates)
let fetchResult: PhotoAccessResult = phAccessHelper.getAssets(fetchOptions)
fetchResult.close()
```

### func getCount()

```cangjie
public func getCount(): Int32
```

**Description:** Gets the total number of files in the file retrieval result.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | Total number of files retrieved. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 13900020 | Invalid argument |
  | 14000011 | System inner fail |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.abilityContext // Context application context needs to be obtained. See usage instructions above.
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions([], predicates)
let fetchResult: PhotoAccessResult = phAccessHelper.getAssets(fetchOptions)
let count = fetchResult.getCount()
```

### func isAfterLast()

```cangjie
public func isAfterLast(): Bool
```

**Description:** Checks if the result set points to the last row.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true when reading the last record and no subsequent records exist; otherwise, returns false. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13900020 | Invalid argument |
  | 14000011 | System inner fail |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.abilityContext // Context application context needs to be obtained. See usage instructions above.
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions([], predicates)
let fetchResult: PhotoAccessResult = phAccessHelper.getAssets(fetchOptions)
let isAfterLast = fetchResult.isAfterLast()
```

## class MediaAlbumChangeRequest

```cangjie
public class MediaAlbumChangeRequest MediaChangeRequest {
    /**
     * The constructor to create a MediaAlbumChangeRequest instance.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 14000011 - System inner fail
     * @relation constructor(album: Album)
     */
    public init(album: Album)
}
```

**Description:** Album change request.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Type:**

- [MediaChangeRequest](#interface-mediachangerequest)

### init(Album)

```cangjie
/**
 * The constructor to create a MediaAlbumChangeRequest instance.
 *
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br>2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessException } 14000011 - System inner fail
 * @relation constructor(album: Album)
 */
public init(album: Album)
```

**Description:** Constructs a MediaAlbumChangeRequest object.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| album | [Album](./cj-apis-file-photo_access_helper.md#class-album) | Yes | - | Album to be modified. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.abilityContext // Context application context needs to be obtained. See usage instructions above.
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions([], predicates)
let fetchResult = phAccessHelper.getAlbums(AlbumType.User, AlbumSubtype.UserGeneric,
    options: fetchOptions)
let album = fetchResult.getFirstObject()
let albumChangeRequest = MediaAlbumChangeRequest(album)
```

### func addAssets(Array\<PhotoAsset>)

```cangjie
public func addAssets(assets: Array<PhotoAsset>): Unit
```

**Description:** Adds assets to the album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| assets | Array\<[PhotoAsset](./cj-apis-file-photo_access_helper.md#class-photoasset)> | Yes | - | Array of assets to be added to the album. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 14000011 | System inner fail |
  | 14000016 | Operation Not Support |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.abilityContext // Context application context needs to be obtained. See usage instructions above.
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions([], predicates)
let fetchResult = phAccessHelper.getAssets(fetchOptions)
let asset = fetchResult.getFirstObject()
let albumFetchResult = phAccessHelper.getAlbums(AlbumType.User, AlbumSubtype.UserGeneric)
let album = albumFetchResult.getFirstObject()
let albumChangeRequest = MediaAlbumChangeRequest(album)
albumChangeRequest.addAssets([asset, asset])
```

### func getAlbum()

```cangjie
public func getAlbum(): Album
```

**Description:** Gets the album in the current album change request.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [Album](./cj-apis-file-photo_access_helper.md#class-album) | Returns the album in the current album change request. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 14000011 | System inner fail |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.abilityContext // Context application context needs to be obtained. See usage instructions above.
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions([], predicates)
let fetchResult = phAccessHelper.getAlbums(AlbumType.User, AlbumSubtype.UserGeneric,
    options: fetchOptions)
let album = fetchResult.getFirstObject()
let albumChangeRequest = MediaAlbumChangeRequest(album)
var changeRequestAlbum = albumChangeRequest.getAlbum()
```

### func removeAssets(Array\<PhotoAsset>)

```cangjie
public func removeAssets(assets: Array<PhotoAsset>): Unit
```

**Description:** Removes assets from the album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| assets | Array\<[PhotoAsset](./cj-apis-file-photo_access_helper.md#class-photoasset)> | Yes | - | Array of assets to be removed from the album. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 14000011 | System inner fail |
  | 14000016 | Operation Not Support |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.abilityContext // Context application context needs to be obtained. See usage instructions above.
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions([], predicates)
let albumFetchResult = phAccessHelper.getAlbums(AlbumType.User, AlbumSubtype.UserGeneric)
let album = albumFetchResult.getFirstObject()
let fetchResult = phAccessHelper.getAssets(fetchOptions)
let asset = fetchResult.getFirstObject()
let albumChangeRequest = MediaAlbumChangeRequest(album)
albumChangeRequest.removeAssets([asset])
phAccessHelper.applyChanges(albumChangeRequest)
```

### func setAlbumName(String)

```cangjie
public func setAlbumName(name: String): Unit
```

**Description:** Sets the album## class MediaAssetChangeRequest

```cangjie
public class MediaAssetChangeRequest MediaChangeRequest {
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
|:---|:---|:---|:---|:---|
| asset | [PhotoAsset](./cj-apis-file-photo_access_helper.md#class-photoasset) | Yes | - | The asset to be modified. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 14000011 | System inner fail |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.abilityContext // Context application context needs to be obtained. See usage instructions for details.
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions = FetchOptions([], predicates)
let fetchResult = phAccessHelper.getAssets(fetchOptions)
let photoAsset = fetchResult.getFirstObject()
let assetChangeRequest = MediaAssetChangeRequest(photoAsset)
```

### static func createAssetRequest(UIAbilityContext, PhotoType, String, CreateOptions)

```cangjie
public static func createAssetRequest(context: UIAbilityContext, photoType: PhotoType, extension: String,
    options!: CreateOptions = CreateOptions(title: "", subtype: Default)): MediaAssetChangeRequest
```

**Function:** Creates an asset change request by specifying the file type and extension to be created.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [UIAbilityContext](../AbilityKit/cj-apis-app-ability-ui_ability.md#class-uiabilitycontext) | Yes | - | The Context of the Ability instance. |
| photoType | [PhotoType](./cj-apis-file-photo_access_helper.md#enum-phototype) | Yes | - | The file type to be created, either IMAGE or VIDEO. |
| extension | String | Yes | - | The file extension, for example: 'jpg'. |
| options | [CreateOptions](#class-createoptions) | No | CreateOptions(title: "", subtype: Default) | **Named parameter.** Creation options, for example: {title: 'testPhoto'}. |

**Return Value:**

| Type | Description |
|:----|:----|
| [MediaAssetChangeRequest](#class-mediaassetchangerequest) | Returns the asset change request for creation. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 14000011 | System inner fail |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*

let ctx = Global.abilityContext // Context application context needs to be obtained. See usage instructions for details.
let photoType = PhotoType.Image
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

Specifies the data source of the asset to be created via fileUri. Refer to [FileUri](../CoreFileKit/cj-apis-file_fileuri.md).

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [UIAbilityContext](../AbilityKit/cj-apis-app-ability-ui_ability.md#class-uiabilitycontext) | Yes | - | The Context of the Ability instance. |
| fileUri | String | Yes | - | The data source of the image asset, a URI within the application sandbox. |

**Return Value:**

| Type | Description |
|:----|:----|
| [MediaAssetChangeRequest](#class-mediaassetchangerequest) | Returns the asset change request for creation. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 13900002 | The file corresponding to the URI is not in the app sandbox. |
  | 14000011 | System inner fail |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*

let ctx = Global.abilityContext // Context application context needs to be obtained. See usage instructions for details.
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

Specifies the data source of the asset to be created via fileUri. Refer to [FileUri](../CoreFileKit/cj-apis-file_fileuri.md).

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [UIAbilityContext](../AbilityKit/cj-apis-app-ability-ui_ability.md#class-uiabilitycontext) | Yes | - | The Context of the Ability instance. |
| fileUri | String | Yes | - | The data source of the video asset, a URI within the application sandbox. |

**Return Value:**

| Type | Description |
|:----|:----|
| [MediaAssetChangeRequest](#class-mediaassetchangerequest) | Returns the asset change request for creation. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 13900002 | The file corresponding to the URI is not in the app sandbox. |
  | 14000011 | System inner fail |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*

let ctx = Global.abilityContext // Context application context needs to be obtained. See usage instructions for details.
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

**Function:** Deletes media files. Deleted files are moved to the recycle bin.

**Required Permission:** ohos.permission.WRITE_IMAGEVIDEO

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [UIAbilityContext](../AbilityKit/cj-apis-app-ability-ui_ability.md#class-uiabilitycontext) | Yes | - | The Context of the Ability instance. |
| assets | Array\<[PhotoAsset](./cj-apis-file-photo_access_helper.md#class-photoasset)> | Yes | - | The array of URIs of the media files to be deleted. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 201 | Permission denied |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 14000011 | System inner fail |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.abilityContext // Context application context needs to be obtained. See usage instructions for details.
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions([], predicates)
let fetchResult = phAccessHelper.getAssets(fetchOptions)
let asset = fetchResult.getFirstObject()
MediaAssetChangeRequest.deleteAssets(ctx, asset.uri)
```

### static func deleteAssets(UIAbilityContext, Array\<String>)

```cangjie
public static func deleteAssets(context: UIAbilityContext, assets: Array<String>): Unit
```

**Function:** Deletes media files. Deleted files are moved to the recycle bin.

**Required Permission:** ohos.permission.WRITE_IMAGEVIDEO

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [UIAbilityContext](../AbilityKit/cj-apis-app-ability-ui_ability.md#class-uiabilitycontext) | Yes | - | The Context of the Ability instance. |
| assets | Array\<String> | Yes | - | The array of URIs of the media files to be deleted. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 201 | Permission denied |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 14000002 | The uri format is incorrect or does not exist. |
  | 14000011 | System inner fail |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.abilityContext // Context application context needs to be obtained. See usage instructions for details.
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions([], predicates)
let fetchResult = phAccessHelper.getAssets(fetchOptions)
let asset = fetchResult.getFirstObject()
MediaAssetChangeRequest.deleteAssets(ctx, asset.uri)
```

### func addResource(ResourceType, String)

```cangjie
public func addResource(resourceType: ResourceType, fileUri: String): Unit
```

**Function:** Adds a resource via ArrayBuffer data.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| resourceType | [ResourceType](#enum-resourcetype) | Yes | - | The type of resource to be added. |
| fileUri | String | Yes | - | The data source of the resource to be added, a URI within the application sandbox. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 13900002 | The file corresponding to the URI is not in the app sandbox. |
  | 14000011 | System inner fail |
  | 14000016 | Operation Not Support |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*

let ctx = Global.abilityContext // Context application context needs to be obtained. See usage instructions for details.
let phAccessHelper = getPhotoAccessHelper(ctx)
let photoType = PhotoType.Image
let extension = "jpg"
let assetChangeRequest = MediaAssetChangeRequest.createAssetRequest(ctx, photoType,
    extension)
let buffer = Array<Byte>(2048, repeat: 0)
assetChangeRequest.addResource(ResourceType.ImageResource, buffer)
phAccessHelper.applyChanges(assetChangeRequest)
```

### func addResource(ResourceType, Array\<Byte>)

```cangjie
public func addResource(resourceType: ResourceType, data: Array<Byte>): Unit
```

**Function:** Adds a resource via ArrayBuffer data.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| resourceType | [ResourceType](#enum-resourcetype) | Yes | - | The type of resource to be added. |
| data | Array\<Byte> | Yes | - | The data of the resource to be added. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 14000011 | System inner fail |
  | 14000016 | Operation Not Support |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*

let ctx = Global.abilityContext // Context application context needs to be obtained. See usage instructions for details.
let phAccessHelper = getPhotoAccessHelper(ctx)
let photoType = PhotoType.Image
let extension = "jpg"
let assetChangeRequest = MediaAssetChangeRequest.createAssetRequest(ctx, photoType,
    extension)
let buffer = Array<Byte>(2048, repeat: 0)
assetChangeRequest.addResource(ResourceType.ImageResource, buffer)
phAccessHelper.applyChanges(assetChangeRequest)
```

### func discardCameraPhoto()

```cangjie
public func discardCameraPhoto(): Unit
```

**Function:** Saves a photo taken by the camera.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 14000011 | Internal system error |
  | 14000016 | Operation Not Support |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.abilityContext // Context application context needs to be obtained. See usage instructions for details.
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions = FetchOptions([], predicates)
let fetchResult = phAccessHelper.getAssets(fetchOptions)
let photoAsset = fetchResult.getFirstObject()
let assetChangeRequest = MediaAssetChangeRequest(photoAsset)
assetChangeRequest.discardCameraPhoto()
phAccessHelper.applyChanges(assetChangeRequest)
```

### func getAsset()

```cangjie
public func getAsset(): PhotoAsset
```

**Function:** Obtains the asset in the current asset change request.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [## class PhotoAccessHelper

```cangjie
public class PhotoAccessHelper {}
```

**Description:** Obtains image and video resources.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func applyChanges(MediaChangeRequest)

```cangjie
public func applyChanges(mediaChangeRequest: MediaChangeRequest): Unit
```

**Description:** Submits a media change request.

**Required Permission:** ohos.WRITE_IMAGEVIDEO

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| mediaChangeRequest | [MediaChangeRequest](#interface-mediachangerequest) | Yes | - | Media change request, supporting asset change requests and album change requests. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 201 | Permission denied |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 14000011 | System inner fail |

### func getAlbums(AlbumType, AlbumSubtype, FetchOptions)

```cangjie
public func getAlbums(albumType: AlbumType, subtype: AlbumSubtype,
    options!: FetchOptions = FetchOptions(["uri", "album_name"], DataSharePredicates())): AlbumResult
```

**Description:** Retrieves albums based on search options and album type. Ensure the album exists before retrieval.

**Required Permission:** ohos.READ_IMAGEVIDEO

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| albumType | [AlbumType](#enum-albumtype) | Yes | - | Album type. |
| subtype | [AlbumSubtype](#enum-albumsubtype) | Yes | - | Album subtype. |
| options | [FetchOptions](#class-fetchoptions) | No | FetchOptions(["uri", "album_name"], DataSharePredicates()) | **Named parameter.** Search options. |

**Return Value:**

| Type | Description |
|:----|:----|
| AlbumResult | Returns the result set of retrieved albums. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 201 | Permission denied |
  | 13900020 | Invalid argument |
  | 14000011 | System inner fail |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.abilityContext // Obtain the Context application context as described in the usage instructions
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions([], predicates)
let fetchResult: AlbumResult = phAccessHelper.getAlbums(AlbumType.User,
    AlbumSubtype.UserGeneric, options: fetchOptions)
```

### func getAssets(FetchOptions)

```cangjie
public func getAssets(options: FetchOptions): PhotoAssetResult
```

**Description:** Retrieves image and video resources.

**Required Permission:** ohos.READ_IMAGEVIDEO

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| options | [FetchOptions](#class-fetchoptions) | Yes | - | Image and video search options. |

**Return Value:**

| Type | Description |
|:----|:----|
| PhotoAssetResult | Returns the result set of retrieved burst photos. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 201 | Permission denied |
  | 13900020 | Invalid argument |
  | 14000011 | System inner fail |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.abilityContext // Obtain the Context application context as described in the usage instructions
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions([], predicates)
let fetchResult: PhotoAssetResult = phAccessHelper.getAssets(fetchOptions)
```

### func getBurstAssets(String, FetchOptions)

```cangjie
public func getBurstAssets(burstKey: String, options: FetchOptions): PhotoAssetResult
```

**Description:** Retrieves burst photo resources.

**Required Permission:** ohos.READ_IMAGEVIDEO

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| burstKey | String | Yes | - | Unique identifier for a set of burst photos: uuid (can pass the BURST_KEY of [PhotoKeys](#enum-photokeys)). |
| options | [FetchOptions](#class-fetchoptions) | Yes | - | Burst photo search options. |

**Return Value:**

| Type | Description |
|:----|:----|
| PhotoAssetResult | Returns the result set of retrieved burst photos. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 201 | Permission denied |
  | 14000011 | Internal system error |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.abilityContext // Obtain the Context application context as described in the usage instructions
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions([], predicates)
let burstKey = YOUR_UUID //The UUID of the submitted photo.
let fetchResult: PhotoAssetResult = phAccessHelper.getBurstAssets(burstKey, fetchOptions)
```

### func registerChange(String, Bool, Callback1Argument\<ChangeData>)

```cangjie
public func registerChange(uri: String, forChildUris: Bool, callback: Callback1Argument<ChangeData>): Unit
```

**Description:** Registers a listener for the specified URI and returns the asynchronous result via callback.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| uri | String | Yes | - | URI of PhotoAsset, Album, or value of [DefaultChangeUri](#enum-defaultchangeuri). |
| forChildUris | Bool | Yes | - | Whether to listen broadly. When URI is an album URI, setting forChildUris to true allows listening to changes in files within the album; if false, only changes to the album itself are listened to. When URI is a photoAsset, forChildUris being true or false makes no difference. When URI is DefaultChangeUri, forChildUris must be true; if false, the URI cannot be found, and no messages will be received. |
| callback | [Callback1Argument](../../arkinterop/cj-api-callback_invoke.md#class-callback1argument)\<[ChangeData](#class-changedata)> | Yes | - | Returns the [ChangeData](#class-changedata) to be listened to. Note: Multiple different callbacks can be registered for the same URI. [unRegisterChange](#func-unregisterchangestring-callback1argumentchangedata) can close all listeners for the URI or only the specified callback listener. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 13900012 | Permission denied |
  | 13900020 | Invalid argument |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

import ohos.base.*
import ohos.business_exception.BusinessException
import ohos.callback_invoke.*

// This code can be added to dependency definitions
class MyCallback<T> <: Callback1Argument<T> {
    public let callabck_: (T) -> Unit
    public init(callabck: (T) -> Unit) {
        callabck_ = callabck
    }
    public open func invoke(err: ?BusinessException, arg: T): Unit {
        callabck_(arg)
    }
}

let ctx = Global.abilityContext // Obtain the Context application context as described in the usage instructions
let phAccessHelper = getPhotoAccessHelper(ctx)
let callback1 = MyCallback<ChangeData>(
    {
        arg: ChangeData => Hilog.info(0, "AppLogCj",
            "onCallback1. ChangeData: type = ${arg.notifyType.toString()}, uris.size: ${arg.uris.size}, extraUris.size = ${arg.extraUris.size}"
        )
    })
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions(['title'], predicates)
let fetchResult: PhotoAssetResult = phAccessHelper.getAssets(fetchOptions)
let firstPhotoAsset = fetchResult.getFirstObject()
phAccessHelper.registerChange(firstPhotoAsset.uri, false, callback1)
```

### func release()

```cangjie
public func release(): Unit
```

**Description:** Releases the PhotoAccessHelper instance. Call this method when the methods in the PhotoAccessHelper instance are no longer needed.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 13900020 | Invalid argument |
  | 14000011 | System inner fail |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.abilityContext // Obtain the Context application context as described in the usage instructions
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions([], predicates)
let fetchResult: PhotoAssetResult = phAccessHelper.getAssets(fetchOptions)
fetchResult.close()
phAccessHelper.release()
```

### func showAssetsCreationDialog(Array\<String>, Array\<PhotoCreationConfig>, Callback1Argument\<Array\<String>>)

```cangjie
public func showAssetsCreationDialog(srcFileUris: Array<String>, photoCreationConfigs: Array<PhotoCreationConfig>,
    callback: Callback1Argument<Array<String>>): Unit
```

**Description:** Invokes the interface to display a save confirmation dialog. If the user agrees to save, the callback returns a list of URIs that have been created and granted save permissions. This list is permanently effective, and the application can use these URIs to write images/videos. If the user refuses to save, an empty list is returned.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| srcFileUris | Array\<String> | Yes | - | URIs of the image/video files to be saved to the media library.<br>**Note:** Only image and video URIs are supported. |
| photoCreationConfigs | Array\<[PhotoCreationConfig](#class-photocreationconfig)> | Yes | - | Configuration for saving images/videos to the media library, including file names, etc., corresponding one-to-one with srcFileUris. |
| callback | [Callback1Argument](../../arkinterop/cj-api-callback_invoke.md#class-callback1argument)\<Array\<String>> | Yes | - | Callback function to obtain the list of media library file URIs returned to the application. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 14000011 | Internal system error |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

import ohos.base.*
import ohos.business_exception.BusinessException
import ohos.callback_invoke.*

// This code can be added to dependency definitions
class MyCallback<T> <: Callback1Argument<T> {
    public let callabck_: (T) -> Unit
    public init(callabck: (T) -> Unit) {
        callabck_ = callabck
    }
    public open func invoke(err: ?BusinessException, arg: T): Unit {
        callabck_(arg)
    }
}

let ctx = Global.abilityContext // Obtain the Context application context as described in the usage instructions
let phAccessHelper = getPhotoAccessHelper(ctx)
let callback3 = MyCallback<Array<String>>(
    {
        arg: Array<String> =>
        Hilog.info(0, "AppLogCj", "oncallback3: Array.size: ${arg.size}")
        for (str in arg) {
            Hilog.info(0, "AppLogCj", "oncallback3: uri: ${str}")
        }
    }
)
// Obtain the URIs of images/videos located in the application sandbox that need to be saved to the media library
// In actual scenarios, use real URIs
let srcFileUris: Array<String> = ["file://media/Photo/37/IMG_1731463495_028/IMG_20241113_100315.jpg"]
let photoCreationConfigs: Array<PhotoCreationConfig> = [
    PhotoCreationConfig(
        'jpg',
        PhotoType.Image,
        title: "test4",
        subtype: PhotoSubtype.Default
    )
]
phAccessHelper.showAssetsCreationDialog(srcFileUris, photoCreationConfigs, callback3)
```

### func unRegisterChange(String, ?Callback1Argument\<ChangeData>)

```cangjie
public func unRegisterChange(uri: String, callback!: ?Callback1Argument<ChangeData> = None): Unit
```

**Description:** Unregisters the listener for the specified URI. Multiple callbacks can be registered for a URI. When multiple callback listeners exist, you can unregister a specific callback listener. If no callback is specified, all listeners for the URI are unregistered.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| uri | String | Yes | - | URI of PhotoAsset, Album, or value of [DefaultChangeUri](#enum-defaultchangeuri). |
| callback | ?[Callback1Argument](../../arkinterop/cj-api-callback_invoke.md#class-callback1argument)\<[ChangeData](#class-changedata)> | No | None | **Named parameter.** Unregisters the callback listener registered via [registerChange](#func-registerchangestring-bool-callback1argumentchangedata). If not specified, all listeners for the URI are unregistered. Note: After unregistering a specific callback, it will no longer trigger this callback. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [File Management Error Codes](../../errorcodes/cj-errorcode-filemanagement.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 13900012 | Permission denied |
  | 13900020 | Invalid argument |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

import ohos.base.*
import ohos.callback_invoke.*
import ohos.business_exception.BusinessException

//## class PhotoCreationConfig

```cangjie
public class PhotoCreationConfig {
    public var fileNameExtension: String
    public var photoType: PhotoType
    public var title: String
    public var subtype: PhotoSubtype
    public init(fileNameExtension: String, photoType: PhotoType, title!: String = "", subtype!: PhotoSubtype = Default)
}
```

**Description:** Configuration for saving images/videos to the media library, including file naming etc.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var fileNameExtension

```cangjie
public var fileNameExtension: String
```

**Description:** File extension.

**Type:** String

**Read-Write Permission:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var photoType

```cangjie
public var photoType: PhotoType
```

**Description:** File type.

**Type:** [PhotoType](./cj-apis-file-photo_access_helper.md#enum-phototype)

**Read-Write Permission:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var subtype

```cangjie
public var subtype: PhotoSubtype
```

**Description:** File subtype.

**Type:** [PhotoSubtype](#enum-photosubtype)

**Read-Write Permission:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var title

```cangjie
public var title: String
```

**Description:** Title of the image or video.

**Type:** String

**Read-Write Permission:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### init(String, PhotoType, String, PhotoSubtype)

```cangjie
public init(fileNameExtension: String, photoType: PhotoType, title!: String = "", subtype!: PhotoSubtype = Default)
```

**Description:** Constructs a PhotoCreationConfig object.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| fileNameExtension | String | Yes | - | File extension, e.g. 'jpg'. |
| photoType | [PhotoType](./cj-apis-file-photo_access_helper.md#enum-phototype) | Yes | - | Type of file to create, IMAGE or VIDEO. |
| title | String | No | "" | **Named parameter.** Title of the image or video. |
| subtype | [PhotoSubtype](#enum-photosubtype) | No | Default | **Named parameter.** Subtype of the image or video file, Default or MovingPhoto. |

## class RequestOptions

```cangjie
public class RequestOptions {
    public var deliveryMode: DeliveryMode
}
```

**Description:** Request strategy.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### var deliveryMode

```cangjie
public var deliveryMode: DeliveryMode
```

**Description:** Resource delivery mode for requests.

**Type:** [DeliveryMode](#enum-deliverymode)

**Read-Write Permission:** Readable and Writable

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

## enum AlbumKeys

```cangjie
public enum AlbumKeys <: ToString & Equatable<AlbumKeys> {
    | Uri
    | AlbumName
    | ...
}
```

**Description:** Key album information.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Types:**

- ToString
- Equatable\<AlbumKeys>

### AlbumName

```cangjie
AlbumName
```

**Description:** Album name.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### Uri

```cangjie
Uri
```

**Description:** Album URI.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func !=(AlbumKeys)

```cangjie
public operator func !=(other: AlbumKeys): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [AlbumKeys](#enum-albumkeys) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are unequal, otherwise false. |

### func ==(AlbumKeys)

```cangjie
public operator func ==(other: AlbumKeys): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [AlbumKeys](#enum-albumkeys) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are equal, otherwise false. |

### func toString()

```cangjie
public func toString(): String
```

**Description:** Gets the value of the enum.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Description of the enum. |

## enum AlbumSubtype

```cangjie
public enum AlbumSubtype <: Equatable<AlbumSubtype> & ToString {
    | UserGeneric
    | Favorite
    | Video
    | Image
    | AnyAlbum
    | ...
}
```

**Description:** Album subtype, indicating specific album types.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Types:**

- Equatable\<AlbumSubtype>
- ToString

### AnyAlbum

```cangjie
AnyAlbum
```

**Description:** Any album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### Favorite

```cangjie
Favorite
```

**Description:** Favorites album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### Image

```cangjie
Image
```

**Description:** Image album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### UserGeneric

```cangjie
UserGeneric
```

**Description:** User album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### Video

```cangjie
Video
```

**Description:** Video album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func !=(AlbumSubtype)

```cangjie
public operator func !=(other: AlbumSubtype): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [AlbumSubtype](#enum-albumsubtype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are unequal, otherwise false. |

### func ==(AlbumSubtype)

```cangjie
public operator func ==(other: AlbumSubtype): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [AlbumSubtype](#enum-albumsubtype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are equal, otherwise false. |

### func toString()

```cangjie
public func toString(): String
```

**Description:** Gets the value of the enum.

**Return Value:**

| Type | Description |
|:----|:----|
| String | Description of the enum. |

## enum AlbumType

```cangjie
public enum AlbumType <: Equatable<AlbumType> & ToString {
    | User
    | System
    | ...
}
```

**Description:** Album type, indicating whether it's a user album or a system preset album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Types:**

- Equatable\<AlbumType>
- ToString

### System

```cangjie
System
```

**Description:** System preset album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### User

```cangjie
User
```

**Description:** User album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func !=(AlbumType)

```cangjie
public operator func !=(other: AlbumType): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [AlbumType](#enum-albumtype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are unequal, otherwise false. |

### func ==(AlbumType)

```cangjie
public operator func ==(other: AlbumType): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [AlbumType](#enum-albumtype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are equal, otherwise false. |

### func toString()

```cangjie
public func toString(): String
```

**Description:** Gets the value of the enum.

**Return Value:**

| Type | Description |
|:----|:----|
| String | Description of the enum. |

## enum DefaultChangeUri

```cangjie
public enum DefaultChangeUri <: ToString & Equatable<DefaultChangeUri> {
    | DefaultPhotoUri
    | DefaultAlbumUri
    | ...
}
```

**Function:** Subtype of DefaultChangeUri.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Types:**

- ToString
- Equatable\<DefaultChangeUri>

### DefaultAlbumUri

```cangjie
DefaultAlbumUri
```

**Function:** The Uri of the default album. When used with forSubUri{true}, it will receive change notifications for all albums.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### DefaultPhotoUri

```cangjie
DefaultPhotoUri
```

**Function:** The Uri of the default PhotoAsset. When used with forSubUri{true}, it will receive change notifications for all PhotoAssets.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func !=(DefaultChangeUri)

```cangjie
public operator func !=(other: DefaultChangeUri): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [DefaultChangeUri](#enum-defaultchangeuri) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false. |

### func ==(DefaultChangeUri)

```cangjie
public operator func ==(other: DefaultChangeUri): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [DefaultChangeUri](#enum-defaultchangeuri) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

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
    | FastMode
    | HighQualityMode
    | BalanceMode
    | ...
}
```

**Function:** Resource delivery mode.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Types:**

- Equatable\<DeliveryMode>
- ToString

### BalanceMode

```cangjie
BalanceMode
```

**Function:** Balanced mode.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### FastMode

```cangjie
FastMode
```

**Function:** Fast mode.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### HighQualityMode

```cangjie
HighQualityMode
```

**Function:** High-quality mode.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func !=(DeliveryMode)

```cangjie
public operator func !=(other: DeliveryMode): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [DeliveryMode](#enum-deliverymode) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false. |

### func ==(DeliveryMode)

```cangjie
public operator func ==(other: DeliveryMode): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [DeliveryMode](#enum-deliverymode) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enum.

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enum. |

## enum DynamicRangeType

```cangjie
public enum DynamicRangeType <: Equatable<DynamicRangeType> & ToString {
    | Sdr
    | Hdr
    | ...
}
```

**Function:** The dynamic range type of media files.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Types:**

- Equatable\<DynamicRangeType>
- ToString

### Hdr

```cangjie
Hdr
```

**Function:** High dynamic range type.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### Sdr

```cangjie
Sdr
```

**Function:** Standard dynamic range type.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func !=(DynamicRangeType)

```cangjie
public operator func !=(other: DynamicRangeType): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [DynamicRangeType](#enum-dynamicrangetype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false. |

### func ==(DynamicRangeType)

```cangjie
public operator func ==(other: DynamicRangeType): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [DynamicRangeType](#enum-dynamicrangetype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enum.

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enum. |

## enum NotifyType

```cangjie
public enum NotifyType <: Equatable<NotifyType> & ToString {
    | NotifyAdd
    | NotifyUpdate
    | NotifyRemove
    | NotifyAlbumAddAsset
    | NotifyAlbumRemoveAsset
    | ...
}
```

**Function:** The type of notification event.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Types:**

- Equatable\<NotifyType>
- ToString

### NotifyAdd

```cangjie
NotifyAdd
```

**Function:** The type of notification for adding a file set or album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### NotifyAlbumAddAsset

```cangjie
NotifyAlbumAddAsset
```

**Function:** The type of notification for adding a file set to an album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### NotifyAlbumRemoveAsset

```cangjie
NotifyAlbumRemoveAsset
```

**Function:** The type of notification for removing a file set from an album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### NotifyRemove

```cangjie
NotifyRemove
```

**Function:** The type of notification for removing a file set or album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### NotifyUpdate

```cangjie
NotifyUpdate
```

**Function:** The type of notification for updating a file set or album.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func !=(NotifyType)

```cangjie
public operator func !=(other: NotifyType): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [NotifyType](#enum-notifytype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false. |

### func ==(NotifyType)

```cangjie
public operator func ==(other: NotifyType): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [NotifyType](#enum-notifytype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enum.

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enum. |
```## enum PhotoKeys

```cangjie
public enum PhotoKeys <: ToString & Equatable<PhotoKeys> {
    | Uri
    | PhotoType
    | DisplayName
    | Size
    | DateAdded
    | DateModified
    | Duration
    | Width
    | Height
    | DateTaken
    | Orientation
    | Favorite
    | Title
    | DateAddedMs
    | DateModifiedMs
    | PhotoSubtype
    | DynamicRangeType
    | CoverPosition
    | BurstKey
    | LcdSize
    | ThmSize
    | ...
}
```

**Function:** Key information for image and video files.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Types:**

- ToString
- Equatable\<PhotoKeys>

### BurstKey

```cangjie
BurstKey
```

**Function:** Unique identifier for a burst photo sequence: uuid.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### CoverPosition

```cangjie
CoverPosition
```

**Function:** Cover position for motion photos, representing the video timestamp (in microseconds) corresponding to the cover frame.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### DateAdded

```cangjie
DateAdded
```

**Function:** Date added (seconds since January 1, 1970).

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### DateAddedMs

```cangjie
DateAddedMs
```

**Function:** Date added (milliseconds since January 1, 1970).

Note: This field cannot be used for sorting when querying photos.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### DateModified

```cangjie
DateModified
```

**Function:** Modification date (seconds since January 1, 1970; renaming files does not update this value, only content modifications do).

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### DateModifiedMs

```cangjie
DateModifiedMs
```

**Function:** Modification date (milliseconds since January 1, 1970; renaming files does not update this value, only content modifications do).

Note: This field cannot be used for sorting when querying photos.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### DateTaken

```cangjie
DateTaken
```

**Function:** Capture date (seconds since January 1, 1970).

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### DisplayName

```cangjie
DisplayName
```

**Function:** Display name.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### Duration

```cangjie
Duration
```

**Function:** Duration (in milliseconds).

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### DynamicRangeType

```cangjie
DynamicRangeType
```

**Function:** Dynamic range type of the media file.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### Favorite

```cangjie
Favorite
```

**Function:** Favorite status.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### Height

```cangjie
Height
```

**Function:** Image height (in pixels).

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### LcdSize

```cangjie
LcdSize
```

**Function:** Dimensions of LCD image, represented as a string concatenating width and height (width:height).

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### Orientation

```cangjie
Orientation
```

**Function:** Rotation angle of the file (in degrees).

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### PhotoSubtype

```cangjie
PhotoSubtype
```

**Function:** Dynamic range type of the media file.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### PhotoType

```cangjie
PhotoType
```

**Function:** Media file type.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### Size

```cangjie
Size
```

**Function:** File size (in bytes).

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### ThmSize

```cangjie
ThmSize
```

**Function:** Dimensions of THUMB image, represented as a string concatenating width and height (width:height).

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### Title

```cangjie
Title
```

**Function:** File title.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### Uri

```cangjie
Uri
```

**Function:** File URI.

Note: When querying photos, this field only supports the [DataSharePredicates.equalTo](../ArkData/cj-apis-data_share_predicates.md#func-equaltostring-valuetype) predicate.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### Width

```cangjie
Width
```

**Function:** Image width (in pixels).

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func !=(PhotoKeys)

```cangjie
public operator func !=(other: PhotoKeys): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[PhotoKeys](#enum-photokeys)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the enum values are unequal, otherwise false.|

### func ==(PhotoKeys)

```cangjie
public operator func ==(other: PhotoKeys): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[PhotoKeys](#enum-photokeys)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the enum values are equal, otherwise false.|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the enum value.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Description of the enum.|

## enum PhotoSubtype

```cangjie
public enum PhotoSubtype <: Equatable<PhotoSubtype> & ToString {
    | Default
    | MovingPhoto
    | Burst
    | ...
}
```

**Function:** Burst photo file type.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Types:**

- Equatable\<PhotoSubtype>
- ToString

### Burst

```cangjie
Burst
```

**Function:** Burst photo file type.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### Default

```cangjie
Default
```

**Function:** Default photo type.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### MovingPhoto

```cangjie
MovingPhoto
```

**Function:** Motion photo file type.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func !=(PhotoSubtype)

```cangjie
public operator func !=(other: PhotoSubtype): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[PhotoSubtype](#enum-photosubtype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the enum values are unequal, otherwise false.|

### func ==(PhotoSubtype)

```cangjie
public operator func ==(other: PhotoSubtype): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[PhotoSubtype](#enum-photosubtype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the enum values are equal, otherwise false.|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the enum value.

**Return Value:**

|Type|Description|
|:----|:----|
|String|Description of the enum.|

## enum PhotoViewMIMETypes

```cangjie
public enum PhotoViewMIMETypes <: Equatable<PhotoViewMIMETypes> & ToString {
    | ImageType
    | VideoType
    | ImageVideoType
    | MovingPhotoImageType
    | ...
}
```

**Description:** Selectable media file types.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Types:**

- Equatable\<PhotoViewMIMETypes>
- ToString

### ImageType

```cangjie
ImageType
```

**Description:** Image type.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### ImageVideoType

```cangjie
ImageVideoType
```

**Description:** Image and video types.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### MovingPhotoImageType

```cangjie
MovingPhotoImageType
```

**Description:** Moving photo type.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### VideoType

```cangjie
VideoType
```

**Description:** Video type.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func !=(PhotoViewMIMETypes)

```cangjie
public operator func !=(other: PhotoViewMIMETypes): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [PhotoViewMIMETypes](#enum-photoviewmimetypes) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are unequal, otherwise returns false. |

### func ==(PhotoViewMIMETypes)

```cangjie
public operator func ==(other: PhotoViewMIMETypes): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [PhotoViewMIMETypes](#enum-photoviewmimetypes) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Description:** Gets the value of the enum.

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enum. |

## enum RecommendationType

```cangjie
public enum RecommendationType <: Equatable<RecommendationType> & ToString {
    | QrOrBarCode
    | QrCode
    | BarCode
    | IdCard
    | ProfilePicture
    | PassPort
    | BankCard
    | DriverLicense
    | DrivingLicense
    | FeaturedSinglePortrait
    | ...
}
```

**Description:** Recommended image types.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Types:**

- Equatable\<RecommendationType>
- ToString

### BankCard

```cangjie
BankCard
```

**Description:** Bank card.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### BarCode

```cangjie
BarCode
```

**Description:** Barcode.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### DriverLicense

```cangjie
DriverLicense
```

**Description:** Driver's license.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### DrivingLicense

```cangjie
DrivingLicense
```

**Description:** Vehicle license.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### FeaturedSinglePortrait

```cangjie
FeaturedSinglePortrait
```

**Description:** Recommended portrait.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### IdCard

```cangjie
IdCard
```

**Description:** ID card.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### PassPort

```cangjie
PassPort
```

**Description:** Passport.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### ProfilePicture

```cangjie
ProfilePicture
```

**Description:** Profile picture.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### QrCode

```cangjie
QrCode
```

**Description:** QR code.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### QrOrBarCode

```cangjie
QrOrBarCode
```

**Description:** QR code or barcode.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func !=(RecommendationType)

```cangjie
public operator func !=(other: RecommendationType): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [RecommendationType](#enum-recommendationtype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are unequal, otherwise returns false. |

### func ==(RecommendationType)

```cangjie
public operator func ==(other: RecommendationType): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [RecommendationType](#enum-recommendationtype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Description:** Gets the value of the enum.

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enum. |

## enum ResourceType

```cangjie
public enum ResourceType <: Equatable<ResourceType> & ToString {
    | ImageResource
    | VideoResource
    | ...
}
```

**Description:** Represents image resources.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

**Parent Types:**

- Equatable\<ResourceType>
- ToString

### ImageResource

```cangjie
ImageResource
```

**Description:** Represents image resources.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### VideoResource

```cangjie
VideoResource
```

**Description:** Represents video resources.

**System Capability:** SystemCapability.FileManagement.PhotoAccessHelper.Core

**Since:** 21

### func !=(ResourceType)

```cangjie
public operator func !=(other: ResourceType): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [ResourceType](#enum-resourcetype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are unequal, otherwise returns false. |

### func ==(ResourceType)

```cangjie
public operator func ==(other: ResourceType): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [ResourceType](#enum-resourcetype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are equal, otherwise returns false. |
```### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enumeration.

**Return Value:**

|Type|Description|
|:----|:----|
|String|The description of the enumeration.|