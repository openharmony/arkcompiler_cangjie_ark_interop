# ohos.file.photo_access_helper

该模块提供相册管理模块能力，包括创建相册以及访问、修改相册中的媒体数据信息等。

## 导入模块

```cangjie
import kit.MediaLibraryKit.*
```

## 权限列表

ohos.permission.READ_IMAGEVIDEO

ohos.permission.WRITE_IMAGEVIDEO

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](../AbilityKit/cj-apis-app-ability-ui_ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## func getPhotoAccessHelper(UIAbilityContext)

```cangjie
public func getPhotoAccessHelper(context: UIAbilityContext): PhotoAccessHelper
```

**功能：** 获取相册管理模块的实例，用于访问和修改相册中的媒体文件。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[UIAbilityContext](../AbilityKit/cj-apis-app-ability-ui_ability.md#class-uiabilitycontext)|是|-|传入Ability实例的Context。|

**返回值：**

|类型|说明|
|:----|:----|
|[PhotoAccessHelper](./cj-apis-multimedia-photo_accesshelper.md#class-photoaccesshelper)|相册管理模块的实例。|

**异常：**

- BusinessException：对应错误码如下表，详见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 13900020 | Invalid argument |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let phAccessHelper = getPhotoAccessHelper(ctx)
```

## class AbsAlbum

```cangjie
public open class AbsAlbum {}
```

**功能：** AbsAlbum模块。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### prop albumName

```cangjie
public mut prop albumName: String
```

**功能：** 相册名称。预置相册不可写，用户相册可写。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### prop albumSubtype

```cangjie
public prop albumSubtype: AlbumSubtype
```

**功能：** 相册子类型。

**类型：** [AlbumSubtype](./cj-apis-multimedia-photo_accesshelper.md#enum-albumsubtype)

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### prop albumType

```cangjie
public prop albumType: AlbumType
```

**功能：** 相册类型。

**类型：** [AlbumType](./cj-apis-multimedia-photo_accesshelper.md#enum-albumtype)

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### prop albumUri

```cangjie
public prop albumUri: String
```

**功能：** 相册uri。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### prop count

```cangjie
public prop count: Int32
```

**功能：** 相册中文件数量。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### prop coverUri

```cangjie
public prop coverUri: String
```

**功能：** 封面文件uri。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### func getAssets(FetchOptions)

```cangjie
public func getAssets(options: FetchOptions): PhotoAssetResult
```

**功能：** 获取相册中的文件。

**需要权限：** ohos.READ_IMAGEVIDEO

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|options|[FetchOptions](./cj-apis-multimedia-photo_accesshelper.md#class-fetchoptions)|是|-| 检索选项。|

**返回值：**

|类型|说明|
|:----|:----|
|[PhotoAssetResult](#class-photoassetresult)|返回图片和视频数据结果集。|

**异常：**

- BusinessException：对应错误码如下表，详见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 201 | Permission denied |
  | 13900020 | Invalid argument |
  | 14000011 | System inner fail |

### init(Int64)

```cangjie
public protected init(id: Int64)
```

**功能：** 构造AbsAlbum对象。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|id|Int64|是|-|需要构建的AbsAlbum对象id。|

## class Album

```cangjie
public class Album <: AbsAlbum {}
```

**功能：** 实体相册。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**父类型：**

- [AbsAlbum](#class-absalbum)

### prop imageCount

```cangjie
public prop imageCount: Int32
```

**功能：** 获取相册中图片数量。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### prop videoCount

```cangjie
public prop videoCount: Int32
```

**功能：** 获取相册中图片数量。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### func commitModify()

```cangjie
public func commitModify(): Unit
```

**功能：** 更新相册属性修改到数据库中。

**需要权限：** ohos.WRITE_IMAGEVIDEO

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码如下表，详见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 201 | Permission denied |
  | 13900020 | Invalid argument |
  | 14000011 | System inner fail |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

## class AlbumResult

```cangjie
public class AlbumResult <: FetchResult {}
```

**功能：** 相册结果模块。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**父类型：**

- [FetchResult](#class-fetchresult)

### func getAllObjects()

```cangjie
public func getAllObjects(): Array<Album>
```

**功能：** 获取相册中的所有资产。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<[Album](#class-album)>|返回相册列表。|

**异常：**

- BusinessException：对应错误码如下表，详见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 13900020 | Invalid argument |
  | 14000011 | System inner fail |

### func getFirstObject()

```cangjie
public func getFirstObject(): Album
```

**功能：** 获取相册中的第一个文件资产。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[Album](#class-album)|返回第一个相册|

**异常：**

- BusinessException：对应错误码如下表，详见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 13900020 | Invalid argument |
  | 14000011 | System inner fail |

### func getLastObject()

```cangjie
public func getLastObject(): Album
```

**功能：** 获取相册中的最后一个文件资产。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[Album](#class-album)|返回最后一个相册|

**异常：**

- BusinessException：对应错误码如下表，详见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 13900020 | Invalid argument |
  | 14000011 | System inner fail |

### func getNextObject()

```cangjie
public func getNextObject(): Album
```

**功能：** 获取相册中的下一个文件资产。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[Album](#class-album)|返回下一个相册|

**异常：**

- BusinessException：对应错误码如下表，详见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 13900020 | Invalid argument |
  | 14000011 | System inner fail |

### func getObjectByPosition(Int32)

```cangjie
public func getObjectByPosition(index: Int32): Album
```

**功能：** 获取文件检索结果中具有指定索引的文件资产。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|index|Int32|是|-|要获取的文件的索引，从0开始。|

**返回值：**

|类型|说明|
|:----|:----|
|[Album](#class-album)|获取的文件资产。|

**异常：**

- BusinessException：对应错误码如下表，详见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 13900020 | Invalid argument |
  | 14000011 | System inner fail |

## class FetchResult

```cangjie
public open class FetchResult {}
```

**功能：** 文件检索结果集。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### func close()

```cangjie
public func close(): Unit
```

**功能：** 释放FetchResult实例并使其失效。无法调用其他方法。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码如下表，详见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 13900020 | Invalid argument |
  | 14000011 | System inner fail |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.abilityContext // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 获取文件检索结果中的文件总数。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|检索到的文件总数。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 13900020 | Invalid argument |
  | 14000011 | System inner fail |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.abilityContext // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 检查结果集是否指向最后一行。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|当读到最后一条记录后，后续没有记录返回true，否则返回false。|

**异常：**

- BusinessException：对应错误码如下表，详见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 13900020 | Invalid argument |
  | 14000011 | System inner fail |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.abilityContext // 需获取Context应用上下文，详见本文使用说明
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions([], predicates)
let fetchResult: PhotoAccessResult = phAccessHelper.getAssets(fetchOptions)
let isAfterLast = fetchResult.isAfterLast()
```

### init(Int64)

```cangjie
public protected init(id: Int64)
```

**功能：** 构造FetchResult对象。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|id|Int64|是|-|需要构建的FetchResult对象id。|

## class PhotoAsset

```cangjie
public class PhotoAsset {}
```

**功能：** 提供封装文件属性的方法。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### prop displayName

```cangjie
public prop displayName: String
```

**功能：** 获取文件名，包含后缀名。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### prop photoType

```cangjie
public prop photoType: PhotoType
```

**功能：** 获取媒体文件类型。

**类型：** [PhotoType](#enum-phototype)

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### prop uri

```cangjie
public prop uri: String
```

**功能：** 获取媒体文件资源uri。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### func commitModify()

```cangjie
public func commitModify(): Unit
```

**功能：** 修改文件的元数据。

**需要权限：** ohos.permission.WRITE_IMAGEVIDEO

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码如下表，详见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 201 | Permission denied |
  | 13900020 | Invalid argument |
  | 14000001 | Invalid display name |
  | 14000011 | System inner fail |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*
import ohos.base.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 获取PhotoAsset成员参数。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|member|String|是|-|成员参数名称，在get时，除了'uri'、'media_type'、'subtype'和'display_name'四个属性之外，其他的属性都需要在fetchColumns中填入需要get的[PhotoKeys](./cj-apis-multimedia-photo_accesshelper.md#enum-photokeys)，例如：get title属性fetchColumns: ['title']。|

**返回值：**

|类型|说明|
|:----|:----|
|[MemberType](#enum-membertype)|获取PhotoAsset成员参数的值。|

**异常：**

- BusinessException：对应错误码如下表，详见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 13900020 | Invalid argument |
  | 14000014 | The provided member must be a property name of PhotoKey. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*
import ohos.base.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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
public func getThumbnail(size!: ?Size = Size(256, 256)): PixelMap
```

**功能：** 获取文件的缩略图，传入缩略图尺寸。

**需要权限：** ohos.permission.WRITE_IMAGEVIDEO

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|size|?[Size](../ImageKit/cj-apis-image.md#class-size)|否|Size(256, 256)|**命名参数。** 缩略图尺寸。|

**返回值：**

|类型|说明|
|:----|:----|
|[PixelMap](../ImageKit/cj-apis-image.md#class-pixelmap)|返回缩略图的PixelMap。|

**异常：**

- BusinessException：对应错误码如下表，详见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 13900012 | Permission denied |
  | 13900020 | Invalid argument |
  | 14000011 | System inner fail |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*
import ohos.base.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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
public func set(member: String, value: String): Unit
```

**功能：** 设置PhotoAsset成员参数。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|member|String|是|-|成员参数名称例如：[PhotoKeys](./cj-apis-multimedia-photo_accesshelper.md#enum-photokeys).TITLE。|
|value|String|是|-|设置成员参数名称，只能修改[PhotoKeys](./cj-apis-multimedia-photo_accesshelper.md#enum-photokeys).TITLE的值。|

**异常：**

- BusinessException：对应错误码如下表，详见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 13900020 | Invalid argument |
  | 14000014 | The provided member must be a property name of PhotoKey. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*
import ohos.base.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

## class PhotoAssetResult

```cangjie
public class PhotoAssetResult <: FetchResult {}
```

**功能：** 提供封装文件属性的方法。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**父类型：**

- [FetchResult](#class-fetchresult)

### func getAllObjects()

```cangjie
public func getAllObjects(): Array<PhotoAsset>
```

**功能：** 获取文件检索结果中的所有文件资产。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<[PhotoAsset](#class-photoasset)>|返回结果集中所有文件资产数组。|

**异常：**

- BusinessException：对应错误码如下表，详见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 13900020 | Invalid argument |
  | 14000011 | System inner fail |

### func getFirstObject()

```cangjie
public func getFirstObject(): PhotoAsset
```

**功能：** 获取文件检索结果中的第一个文件资产。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[PhotoAsset](#class-photoasset)|返回结果集中第一个对象。|

**异常：**

- BusinessException：对应错误码如下表，详见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 13900020 | Invalid argument |
  | 14000011 | System inner fail |

### func getLastObject()

```cangjie
public func getLastObject(): PhotoAsset
```

**功能：** 获取文件检索结果中的最后一个文件资产。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[PhotoAsset](#class-photoasset)|返回结果集中最后一个对象。|

**异常：**

- BusinessException：对应错误码如下表，详见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 13900020 | Invalid argument |
  | 14000011 | System inner fail |

### func getNextObject()

```cangjie
public func getNextObject(): PhotoAsset
```

**功能：** 获取文件检索结果中的下一个文件资产。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[PhotoAsset](#class-photoasset)|返回结果集中下一个对象。|

**异常：**

- BusinessException：对应错误码如下表，详见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 13900020 | Invalid argument |
  | 14000011 | System inner fail |

### func getObjectByPosition(Int32)

```cangjie
public func getObjectByPosition(index: Int32): PhotoAsset
```

**功能：** 获取文件检索结果中具有指定索引的文件资产。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|index|Int32|是|-|要获取的文件的索引，从0开始。|

**返回值：**

|类型|说明|
|:----|:----|
|[PhotoAsset](#class-photoasset)|获取的文件资产。|

**异常：**

- BusinessException：对应错误码如下表，详见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 13900020 | Invalid argument |
  | 14000011 | System inner fail |

## enum MemberType

```cangjie
public enum MemberType {
    | Int64Value(Int64)
    | StringValue(String)
    | BoolValue(Bool)
    | ...
}
```

**功能：** PhotoAsset的成员类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### Int64Value

```cangjie
Int64Value(Int64)
```

**功能：** Int64类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### StringValue

```cangjie
StringValue(String)
```

**功能：** String类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### BoolValue

```cangjie
BoolValue(Bool)
```

**功能：** Bool类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

## enum PhotoType

```cangjie
public enum PhotoType <: Equatable<PhotoType> & ToString {
    | Image
    | Video
    | ...
}
```

**功能：** 媒体文件类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**父类型：**

- Equatable\<PhotoType>
- ToString

### Image

```cangjie
Image
```

**功能：** 图片。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### Video

```cangjie
Video
```

**功能：** 视频。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### func !=(PhotoType)

```cangjie
public operator func !=(other: PhotoType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[PhotoType](#enum-phototype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(PhotoType)

```cangjie
public operator func ==(other: PhotoType): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[PhotoType](#enum-phototype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|
