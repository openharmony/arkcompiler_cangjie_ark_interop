# ohos.multimedia.photo_accesshelper（相册管理模块）

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
- 若示例需获取[Context](../AbilityKit/cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## interface MediaChangeRequest

```cangjie
public interface MediaChangeRequest {}
```

**功能：** 媒体变更请求，资产变更请求和相册变更请求的父类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

## class Album

```cangjie
public class Album {}
```

**功能：** 实体相册。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### prop albumName

```cangjie
public mut prop albumName: String
```

**功能：** 获取相册名称。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### prop albumSubtype

```cangjie
public prop albumSubtype: AlbumSubtype
```

**功能：** 获取相册子类型。

**类型：** [AlbumSubtype](#enum-albumsubtype)

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### prop albumType

```cangjie
public prop albumType: AlbumType
```

**功能：** 获取相册类型。

**类型：** [AlbumType](#enum-albumtype)

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### prop albumUri

```cangjie
public prop albumUri: String
```

**功能：** 获取相册Uri。

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

**功能：** 获取封面文件Uri。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

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

**需要权限：** ohos.permission.WRITE_IMAGEVIDEO

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types. |
| 13900012 | Permission denied. |
| 13900020 | Invalid argument. |
| 14000011 | System inner fail. |

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

### func getAssets(FetchOptions)

```cangjie
public func getAssets(options: FetchOptions): FetchResult<PhotoAsset>
```

**功能：** 获取相册中的文件。

**需要权限：** ohos.permission.READ_IMAGEVIDEO

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|options|[FetchOptions](#class-fetchoptions)|是|-|检索选项。|

**返回值：**

|类型|说明|
|:----|:----|
|[FetchResult](#class-fetchresult)\<[PhotoAsset](#class-photoasset)>|返回图片和视频数据结果集。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types; 3. Parameter verification failed. |
  | 13900012 | Permission denied. |
  | 13900020 | Invalid argument. |
  | 14000011 | System inner fail. |

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

**功能：** 图库选择选项基类。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### var MIMEType

```cangjie
public var MIMEType: PhotoViewMIMETypes = IMAGE_VIDEO_TYPE
```

**功能：** 媒体文件类型。

**类型：** [PhotoViewMIMETypes](#enum-photoviewmimetypes)

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### var isPhotoTakingSupported

```cangjie
public var isPhotoTakingSupported: Bool = true
```

**功能：** 是否支持拍照。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### var isPreviewForSingleSelectionSupported

```cangjie
public var isPreviewForSingleSelectionSupported: Bool = true
```

**功能：** 单选模式下是否需要进大图预览。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### var isSearchSupported

```cangjie
public var isSearchSupported: Bool = true
```

**功能：** 是否支持搜索。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### var maxSelectNumber

```cangjie
public var maxSelectNumber: Int32 = 50
```

**功能：** 媒体文件数量的最大值。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### var preselectedUris

```cangjie
public var preselectedUris: Array<String>= Array<String>()
```

**功能：** 预选择图片的uri数据。

**类型：** Array\<String>

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### var recommendationOptions

```cangjie
public var recommendationOptions: RecommendationOptions = RecommendationOptions()
```

**功能：** 图片推荐相关配置参数。

**类型：** [RecommendationOptions](#struct-recommendationoptions)

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

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

**功能：** 构造BaseSelectOptions对象。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|MIMEType|[PhotoViewMIMETypes](#enum-photoviewmimetypes)|否|IMAGE_VIDEO_TYPE| **命名参数。** 可选择的媒体文件类型，若无此参数，则默认为图片和视频类型。|
|maxSelectNumber|Int32|否|50| **命名参数。** 选择媒体文件数量的最大值(最大可设置的值为500，若不设置则默认为50)。|
|isPhotoTakingSupported|Bool|否|true| **命名参数。** 是否支持拍照，true表示支持，false表示不支持，默认为true。|
|isSearchSupported|Bool|否|true| **命名参数。** 是否支持搜索，true表示支持，false表示不支持，默认为true。|
|recommendationOptions|[RecommendationOptions](#struct-recommendationoptions)|否|RecommendationOptions()| **命名参数。** 图片推荐相关配置参数。|
|preselectedUris|Array\<String>|否|Array\<String>()| **命名参数。** 预选择图片的uri数据。|
|isPreviewForSingleSelectionSupported|Bool|否|true| **命名参数。** 单选模式下是否需要进大图预览，true表示需要，false表示不需要，默认为true。|

## class ChangeData

```cangjie
public class ChangeData {}
```

**功能：** 监听器回调函数的值。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### let `type`

```cangjie
public let `type`: NotifyType
```

**功能：** ChangeData的通知类型。

**类型：** [NotifyType](#enum-notifytype)

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### let extraUris

```cangjie
public let extraUris: Array<String>
```

**功能：** 相册中变动文件的uri数组。

**类型：** Array\<String>

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### let uris

```cangjie
public let uris: Array<String>
```

**功能：** 相同[NotifyType](#enum-notifytype)的所有uri，可以是PhotoAsset或Album。

**类型：** Array\<String>

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

## class FetchOptions

```cangjie
public class FetchOptions {
    public FetchOptions(
        public var fetchColumns!: Array<String> = [],
        public var predicates!: DataSharePredicates = DataSharePredicates()
    )
}
```

**功能：** 检索条件。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### var fetchColumns

```cangjie
public var fetchColumns: Array<String>=[]
```

**功能：** 检索条件。

**类型：** Array\<String>

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### var predicates

```cangjie
public var predicates: DataSharePredicates = DataSharePredicates()
```

**功能：** 谓词查询。

**类型：** [DataSharePredicates](../ArkData/cj-apis-data_share_predicates.md#class-datasharepredicates)

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### FetchOptions(Array\<String>, DataSharePredicates)

```cangjie
public FetchOptions(
    public var fetchColumns!: Array<String> = [],
    public var predicates!: DataSharePredicates = DataSharePredicates()
)
```

**功能：** 构造FetchOptions对象。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fetchColumns|Array\<String>|否|\[]| **命名参数。** 检索条件，指定列名查询。<br>对于照片，如果该参数为空，默认查询'uri'、'media_type'、'subtype'和'display_name'，使用[get](#func-getstring)接口获取当前对象的其他属性时将会报错。示例：fetchColumns: ['uri', 'title']。<br>对于相册，如果该参数为空，默认查询'uri'和'album_name'。|
|predicates|[DataSharePredicates](../ArkData/cj-apis-data_share_predicates.md#class-datasharepredicates)|否|DataSharePredicates()| **命名参数。** 谓词查询，显示过滤条件。|

## class FetchResult

```cangjie
public class FetchResult<T> <: where T <: & FetchData <T> {}
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

- BusinessException：对应错误码的详细介绍请参见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |13900020|Invalid argument. |
  |14000011|System inner fail. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 获取文件检索结果中的所有文件资产。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<T>|返回结果集中所有文件资产数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types. |
  | 13900020 | Invalid argument. |
  | 14000011 | System inner fail. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 获取文件检索结果中的文件总数。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|检索到的文件总数。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types. |
  | 13900020 | Invalid argument. |
  | 14000011 | System inner fail. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 获取文件检索结果中的第一个文件资产。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|T|返回结果集中第一个对象。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types. |
  | 13900020 | Invalid argument. |
  | 14000011 | System inner fail. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 获取文件检索结果中的最后一个文件资产。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|T|返回结果集中最后一个对象。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID| 错误信息|
  |:----|:---|
  |401| Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types.|
  |13900020|Invalid argument.|
  |14000011|System inner fail.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 获取文件检索结果中的下一个文件资产。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|T|返回结果集中下一个对象|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types. |
  | 13900020 | Invalid argument. |
  | 14000011 | System inner fail. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 获取文件检索结果中具有指定索引的文件资产。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|position|Int32|是|-|要获取的文件的索引，从0开始。|

**返回值：**

|类型|说明|
|:----|:----|
|T|返回结果集中指定索引的一个对象。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types; 3. Parameter verification failed. |
  | 13900020 | Invalid argument. |
  | 14000011 | System inner fail. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 检查结果集是否指向最后一行。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|当读到最后一条记录后，后续没有记录返回true，否则返回false。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types. |
  | 13900020 | Invalid argument. |
  | 14000011 | System inner fail. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 相册变更请求。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**父类型：**

- [MediaChangeRequest](#interface-mediachangerequest)

### init(Album)

```cangjie
public init(album: Album)
```

**功能：** 构造MediaAlbumChangeRequest对象。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|album|[Album](#class-album)|是|-|需要变更的相册。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: Parameter verification failed.|
  |14000011|System inner fail.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 向相册中添加资产。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|assets|Array\<[PhotoAsset](#class-photoasset)>|是|-|待添加到相册中的资产数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:----|:---|
  |401| Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types; 3. Parameter verification failed.|
  |14000011|System inner fail.|
  |14000016|Operation Not Support.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 获取当前相册变更请求中的相册。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|?[Album](#class-album)|返回当前相册变更请求中的相册。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:----|:---|
  |401| Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types.|
  |14000011|System inner fail.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 从相册中移除资产。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|assets|Array\<[PhotoAsset](#class-photoasset)>|是|-|待从相册中移除的资产数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: Parameter verification failed. |
  |14000011|System inner fail. |
  |14000016|Operation Not Support. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 设置相册名称。

相册名的参数规格为

- 相册名字符串长度为1~255。
- 不允许出现非法字符，包括：. .. \ / : * ? " ' ` < > | { } [ ]
- 英文字符大小写不敏感。
- 相册名不允许重名。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|待设置的相册名称。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types; 3. Parameter verification failed. |
  | 14000011 | System inner fail. |


**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 资产变更请求。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**父类型：**

- [MediaChangeRequest](#interface-mediachangerequest)

### init(PhotoAsset)

```cangjie
public init(asset: PhotoAsset)
```

**功能：** 构造MediaAssetChangeRequest对象。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|asset|[PhotoAsset](#class-photoasset)|是|-|需要变更的资产。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: Parameter verification failed.|
  |14000011|System inner fail.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 指定待创建的文件类型和扩展名，创建资产变更请求。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[UIAbilityContext](../AbilityKit/cj-apis-ability.md#class-uiabilitycontext)|是|-|传入Ability实例的Context。|
|photoType|[PhotoType](#enum-phototype)|是|-|待创建的文件类型，IMAGE或者VIDEO类型。|
|extension|String|是|-|文件扩展名，例如：'jpg'。|
|options|[CreateOptions](#struct-createoptions)|否|CreateOptions()| **命名参数。** 创建选项，例如：{title: 'testPhoto'}。|

**返回值：**

|类型|说明|
|:----|:----|
|[MediaAssetChangeRequest](#class-mediaassetchangerequest)|返回创建资产的变更请求。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:----|:---|
  |202|Called by non-system application|
  |401| Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types; 3. Parameter verification failed.|
  |14000001|Invalid display name.|
  |14000011|System inner fail.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 创建图片资产变更请求。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[UIAbilityContext](../AbilityKit/cj-apis-ability.md#class-uiabilitycontext)|是|-|传入Ability实例的Context。|
|fileUri|String|是|-|图片资产的数据来源，在应用沙箱下的uri。|

**返回值：**

|类型|说明|
|:----|:----|
|[MediaAssetChangeRequest](#class-mediaassetchangerequest)|返回创建资产的变更请求。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:----|:---|
  |401| Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types; 3. Parameter verification failed.|
  |13900002|No such file.|
  |14000011|System inner fail.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 创建视频资产变更请求。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[UIAbilityContext](../AbilityKit/cj-apis-ability.md#class-uiabilitycontext) |是|-|传入Ability实例的Context。|
|fileUri|String|是|-|视频资产的数据来源，在应用沙箱下的uri。|

**返回值：**

|类型|说明|
|:----|:----|
|[MediaAssetChangeRequest](#class-mediaassetchangerequest)|返回创建资产的变更请求。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: Parameter verification failed.|
  |13900002|No such file.|
  |14000011|System inner fail.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 删除媒体文件，删除的文件进入到回收站。

**需要权限：** ohos.permission.WRITE_IMAGEVIDEO

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[UIAbilityContext](../AbilityKit/cj-apis-ability.md#class-uiabilitycontext)|是|-|传入Ability实例的Context。|
|assets|Array\<[PhotoAsset](#class-photoasset)>|是|-|待删除的媒体文件数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:----|:---|
  |201|Permission denied|
  |401| Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types; 3. Parameter verification failed.|
  |14000011|System inner fail.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 删除媒体文件，删除的文件进入到回收站。

**需要权限：** ohos.permission.WRITE_IMAGEVIDEO

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[UIAbilityContext](../AbilityKit/cj-apis-ability.md#class-uiabilitycontext)|是|-|传入Ability实例的Context。|
|assets|Array\<String>|是|-|待删除的媒体文件uri数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:----|:---|
  |201|Permission denied|
  |401| Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types; 3. Parameter verification failed.|
  |14000002|Invalid asset uri.|
  |14000011| System inner fail.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 通过ArrayBuffer数据添加资源。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resourceType|[ResourceType](#enum-resourcetype)|是|-|待添加资源的类型。|
|fileUri|String|是|-|待添加资源的数据来源，在应用沙箱下的uri。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:----|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types; 3. Parameter verification failed.|
  |13900002|No such file.|
  |14000011|System inner fail.|
  |14000016|Operation Not Support.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 通过ArrayBuffer数据添加资源。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resourceType|[ResourceType](#enum-resourcetype)|是|-|待添加资源的类型。|
|data|Array\<Byte>|是|-|待添加资源的数据。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:----|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types; 3. Parameter verification failed.|
  |14000011|System inner fail.|
  |14000016|Operation Not Support.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 保存相机拍摄的照片。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:----|:---|
  |14000011|Internal system error.|
  |14000016|Operation Not Support.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 获取当前资产变更请求中的资产。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|?[PhotoAsset](#class-photoasset)|返回当前资产变更请求中的资产。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:----|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types.|
  |14000011|System inner fail.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：**  获取临时文件写句柄。

**需要权限：** ohos.permission.WRITE_IMAGEVIDEO

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|返回临时文件写句柄。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:----|:---|
  |201|Permission denied|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types.|
  |14000011|System inner fail.|
  |14000016|Operation Not Support.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.CoreFileKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 保存相机拍摄的照片。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:----|:---|
  |14000011|System inner fail.|
  |14000016|Operation Not Support.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 修改媒体资产的标题。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|title|String|是|-|待修改的资产标题。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:----|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types; 3. Parameter verification failed.|
  |14000011|System inner fail.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 获取图片和视频资源。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### func applyChanges(MediaChangeRequest)

```cangjie
public func applyChanges(mediaChangeRequest: MediaChangeRequest): Unit
```

**功能：**提交媒体变更请求。

**需要权限：** ohos.permission.WRITE_IMAGEVIDEO

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|mediaChangeRequest|[MediaChangeRequest](#interface-mediachangerequest)|是|-|媒体变更请求，支持资产变更请求和相册变更请求。|

**异常：**

- BusinessException：BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:----|:---|
  |201|Permission denied|
  |401| Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types; 3. Parameter verification failed.|
  |14000011|System inner fail.|

### func getAlbums(AlbumType, AlbumSubtype, FetchOptions)

```cangjie
public func getAlbums(`type`: AlbumType, subtype: AlbumSubtype, options!: FetchOptions = FetchOptions()): FetchResult<Album>
```

**功能：** 根据检索选项和相册类型获取相册。获取相册前需先保证相册存在。

**需要权限：** ohos.permission.READ_IMAGEVIDEO

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[AlbumType](#enum-albumtype)|是|-|相册类型。|
|subtype|[AlbumSubtype](#enum-albumsubtype)|是|-|相册子类型。|
|options|[FetchOptions](#class-fetchoptions)|否|FetchOptions()| **命名参数。** 检索选项。|

**返回值：**

|类型|说明|
|:----|:----|
|[FetchResult](#class-fetchresult)\<[Album](#class-album)>|返回获取相册的结果集。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:----|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types; 3. Parameter verification failed.|
  |13900012|Permission denied.|
  |13900020|Invalid argument.|
  |14000011|System inner fail.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 获取图片和视频资源。

**需要权限：** ohos.permission.READ_IMAGEVIDEO

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|options|[FetchOptions](#class-fetchoptions)|是|-|图片和视频检索选项。|

**返回值：**

|类型|说明|
|:----|:----|
|[FetchResult](#class-fetchresult)\<[PhotoAsset](#class-photoasset)>|返回图片和视频数据结果集。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:----|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types; 3. Parameter verification failed.|
  |13900012|Permission denied.|
  |13900020|Invalid argument.|
  |14000011|System inner fail.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let fetchResult: FetchResult<PhotoAsset> = phAccessHelper.getAssets(fetchOptions)
```

### func getBurstAssets(String, FetchOptions)

```cangjie
public func getBurstAssets(burstKey: String, options: FetchOptions): FetchResult<PhotoAsset>
```

**功能：** 获取连拍照片资源。

**需要权限：** ohos.permission.READ_IMAGEVIDEO

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|burstKey|String|是|-|一组连拍照片的唯一标识：uuid(可传入[PhotoKeys](#enum-photokeys)的BURST_KEY)。|
|options|[FetchOptions](#class-fetchoptions)|是|-|连拍照片检索选项。|

**返回值：**

|类型|说明|
|:----|:----|
|[FetchResult](#class-fetchresult)\<[PhotoAsset](#class-photoasset)>|返回连拍照片数据结果集。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:----|:---|
  |201|Permission denied|
  |401| Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types; 3. Parameter verification failed.|
  |14000011|Internal system error.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let phAccessHelper = getPhotoAccessHelper(ctx)
let predicates = DataSharePredicates()
let fetchOptions: FetchOptions = FetchOptions(fetchColumns: [], predicates: predicates)
let burstKey = "a042847b-2f1a-492a-897e-028b7d6dc475"
let fetchResult: FetchResult<PhotoAsset> = phAccessHelper.getBurstAssets(burstKey, fetchOptions)
```

### func registerChange(String, Bool, Callback1Argument\<ChangeData>)

```cangjie
public func registerChange(uri: String, forChildUris: Bool, callback: Callback1Argument<ChangeData>): Unit
```

**功能：** 注册对指定uri的监听，使用callback方式返回异步结果。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|uri|String|是|-|PhotoAsset的uri, Album的uri或[DefaultChangeUri](#enum-defaultchangeuri)的值。|
|forChildUris|Bool|是|-|是否模糊监听，uri为相册uri时，forChildUris为true能监听到相册中文件的变化，如果是false只能监听相册本身变化。uri为photoAsset时，forChildUris为true、false没有区别，uri为DefaultChangeUri时，forChildUris必须为true，如果为false将找不到该uri，收不到任何消息。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[ChangeData](#class-changedata)>|是|-|返回要监听的[ChangeData](#class-changedata)。注：uri可以注册多个不同的callback监听，[unRegisterChange](#func-unregisterchangestring-callback1argumentchangedata)可以关闭该uri所有监听，也可以关闭指定callback的监听。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:----|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types; 3. Parameter verification failed.|
  |13900012|Permission denied.|
  |13900020|Invalid argument.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*
import ohos.base.*

// 此处代码可添加在依赖项定义中
class MyCallback<T> <: Callback1Argument<T> {
    public let callabck_: (T) -> Unit
    public init(callabck: (T) -> Unit) {
        callabck_ = callabck
    }
    public open func invoke(arg: T): Unit {
        callabck_(arg)
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 释放PhotoAccessHelper实例。当后续不需要使用PhotoAccessHelper 实例中的方法时调用。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:----|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types.|
  |13900020|Invalid argument.|
  |14000011|System inner fail.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 调用接口拉起保存确认弹窗。用户同意保存后，在callback中返回已创建并授予保存权限的uri列表，该列表永久生效，应用可使用该uri写入图片/视频。如果用户拒绝保存，将返回空列表。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|srcFileUris|Array\<String>|是|-|需保存到媒体库中的图片/视频文件对应的媒体库uri。<br>**注意：**  仅支持处理图片、视频uri。|
|photoCreationConfigs|Array\<[PhotoCreationConfig](#struct-photocreationconfig)>|是|-|保存图片/视频到媒体库的配置，包括保存的文件名等，与srcFileUris保持一一对应。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<Array\<String>>|是|-|回调函数，获取返回给应用的媒体库文件uri列表。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:----|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types; 3. Parameter verification failed.|
  |14000011|Internal system error.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*
import ohos.base.*

// 此处代码可添加在依赖项定义中
class MyCallback<T> <: Callback1Argument<T> {
    public let callabck_: (T) -> Unit
    public init(callabck: (T) -> Unit) {
        callabck_ = callabck
    }
    public open func invoke(arg: T): Unit {
        callabck_(arg)
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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
// 获取需要保存到媒体库的位于应用沙箱的图片/视频uri
// 实际场景请使用真实的uri
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

**功能：** 取消指定uri的监听，一个uri可以注册多个监听，存在多个callback监听时，可以取消指定注册的callback的监听；不指定callback时取消该uri的所有监听。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|uri|String|是|-|PhotoAsset的uri, Album的uri或[DefaultChangeUri](#enum-defaultchangeuri)的值。|
|callback|?[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[ChangeData](#class-changedata)>|否|None| **命名参数。** 取消[registerChange](#func-registerchangestring-bool-callback1argumentchangedata)注册时的callback的监听，不填时，取消该uri的所有监听。注：off指定注册的callback后不会进入此回调。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:----|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types; 3. Parameter verification failed.|
  |13900012|Permission denied.|
  |13900020|Invalid argument.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaLibraryKit.*
import kit.ArkData.*
import ohos.base.*

// 此处代码可添加在依赖项定义中
class MyCallback<T> <: Callback1Argument<T> {
    public let callabck_: (T) -> Unit
    public init(callabck: (T) -> Unit) {
        callabck_ = callabck
    }
    public open func invoke(arg: T): Unit {
        callabck_(arg)
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

- BusinessException：对应错误码的详细介绍请参见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:----|:---|
  |401| Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types.|
  |13900012|Permission denied.|
  |13900020|Invalid argument.|
  |14000001|Invalid display name.|
  |14000011|System inner fail.|

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
|member|String|是|-|成员参数名称，在get时，除了'uri'、'media_type'、'subtype'和'display_name'四个属性之外，其他的属性都需要在fetchColumns中填入需要get的[PhotoKeys](#enum-photokeys)，例如：get title属性fetchColumns: ['title']。|

**返回值：**

|类型|说明|
|:----|:----|
|[MemberType](#enum-membertype)|获取PhotoAsset成员参数的值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:----|:---|
  |401| Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types; 3. Parameter verification failed.|
  |13900020|Invalid argument.|
  |14000014|Member is not a valid PhotoKey.|

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
public func getThumbnail(size!: ?Size = None): PixelMap
```

**功能：** 获取文件的缩略图，传入缩略图尺寸。

**需要权限：** ohos.permission.READ_IMAGEVIDEO

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|size|?[Size](../ImageKit/cj-apis-image.md#struct-size)|否|None| **命名参数。** 缩略图尺寸。|

**返回值：**

|类型|说明|
|:----|:----|
|[PixelMap](../ImageKit/cj-apis-image.md#class-pixelmap)|返回缩略图的PixelMap。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:----|:---|
  |401| Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types.|
  |13900012|Permission denied.|
  |13900020|Invalid argument.|
  |14000011|System inner fail.|

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
public func set(member: String, data: String): Unit
```

**功能：** 设置PhotoAsset成员参数。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|member|String|是|-|成员参数名称例如：[PhotoKeys](#enum-photokeys).TITLE。|
|data|String|是|-|设置成员参数名称，只能修改[PhotoKeys](#enum-photokeys).TITLE的值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[文件管理错误码](../../errorcodes/cj-errorcode-filemanagement.md)。

  |错误码ID|错误信息|
  |:----|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types; 3. Parameter verification failed.|
  |13900020|Invalid argument.|
  |14000014|Member is not a valid PhotoKey.|

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

**功能：** 图库选择选项子类，继承于BaseSelectOptions。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**父类型：**

- [BaseSelectOptions](#class-baseselectoptions)

### var isEditSupported

```cangjie
public var isEditSupported: Bool = true
```

**功能：** 是否支持编辑照片。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### var isOriginalSupported

```cangjie
public var isOriginalSupported: Bool = false
```

**功能：** 是否显示选择原图按钮。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### var subWindowName

```cangjie
public var subWindowName:?String = None
```

**功能：** 子窗窗口名称。

**类型：** ?String

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

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

**功能：** 构造PhotoSelectOptions对象。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|MIMEType|[PhotoViewMIMETypes](#enum-photoviewmimetypes)|否|IMAGE_VIDEO_TYPE| **命名参数。** 可选择的媒体文件类型，若无此参数，则默认为图片和视频类型。|
|maxSelectNumber|Int32|否|50| **命名参数。** 选择媒体文件数量的最大值(最大可设置的值为500，若不设置则默认为50)。|
|isPhotoTakingSupported|Bool|否|true| **命名参数。** 是否支持拍照，true表示支持，false表示不支持，默认为true。|
|isSearchSupported|Bool|否|true| **命名参数。** 是否支持搜索，true表示支持，false表示不支持，默认为true。|
|recommendationOptions|[RecommendationOptions](#struct-recommendationoptions)|否|RecommendationOptions()| **命名参数。** 图片推荐相关配置参数。|
|preselectedUris|Array\<String>|否|Array\<String>()| **命名参数。** 预选择图片的uri数据。|
|isPreviewForSingleSelectionSupported|Bool|否|true| **命名参数。** 单选模式下是否需要进大图预览，true表示需要，false表示不需要，默认为true。|
|isEditSupported|Bool|否|true| **命名参数。** 是否支持编辑照片，true表示支持，false表示不支持，默认为true。|
|isOriginalSupported|Bool|否|false| **命名参数。** 是否显示选择原图按钮，true表示显示，false表示不显示，默认为false。|
|subWindowName|?String|否|None| **命名参数。** 子窗窗口名称。|

## class RequestOptions

```cangjie
public class PhotoViewPicker {
    public init(gcontext: UIAbilityContext)
}
```

**功能：** 图库选择器对象，用来支撑选择图片/视频等用户场景。在使用前，需要先创建PhotoViewPicker实例。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### var deliveryMode

```cangjie
public var deliveryMode: DeliveryMode
```

**功能：** 请求资源分发模式。

**类型：** [DeliveryMode](#enum-deliverymode)

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### RequestOptions(DeliveryMode)

```cangjie
public RequestOptions(
    public var deliveryMode: DeliveryMode
)
```

**功能：** 构造RequestOptions对象。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|deliveryMode|[DeliveryMode](#enum-deliverymode)|是|-|请求资源分发模式，可以指定对于该资源的请求策略，可被配置为快速模式，高质量模式，均衡模式三种策略。|

## struct CreateOptions

```cangjie
public struct CreateOptions {
    public CreateOptions(
        public var title!: ?String = None,
        public var subtype!: ?PhotoSubtype = None
    )
}
```

**功能：** 图片或视频的创建选项。

title参数规格为：

- 不应包含扩展名。
- 文件名字符串长度为1~255。
- 文件名中不允许出现的非法英文字符，包括：. .. \ / : * ? " ' ` < > | { } [ ]

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### var subtype

```cangjie
public var subtype:?PhotoSubtype = None
```

**功能：** 图片或者视频的标题。

**类型：** ?[PhotoSubtype](#enum-photosubtype)

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### var title

```cangjie
public var title:?String = None
```

**功能：** 图片或者视频的标题。

**类型：** ?String

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### CreateOptions(?String, ?PhotoSubtype)

```cangjie
public CreateOptions(
    public var title!: ?String = None,
    public var subtype!: ?PhotoSubtype = None
)
```

**功能：** 构造CreateOptions对象。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|title|?String|否|None| **命名参数。** 图片或者视频的标题。|
|subtype|?[PhotoSubtype](#enum-photosubtype)|否|None| **命名参数。** 图片或者视频的文件子类型。|

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

**功能：** 保存图片/视频到媒体库的配置，包括保存的文件名等。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### let fileNameExtension

```cangjie
public let fileNameExtension: String
```

**功能：** 文件扩展名。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### let photoType

```cangjie
public let photoType: PhotoType
```

**功能：** 文件类型。

**类型：** [PhotoType](#enum-phototype)

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### let subtype

```cangjie
public let subtype: PhotoSubtype = DEFAULT
```

**功能：** 文件子类型。

**类型：** [PhotoSubtype](#enum-photosubtype)

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### let title

```cangjie
public let title: String = ""
```

**功能：** 图片或者视频的标题。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### PhotoCreationConfig(String, PhotoType, String, PhotoSubtype)

```cangjie
public PhotoCreationConfig(
    public let fileNameExtension: String,
    public let photoType: PhotoType,
    public let title!: String = "",
    public let subtype!: PhotoSubtype = DEFAULT
)
```

**功能：** 构造PhotoCreationConfig对象。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fileNameExtension|String|是|-|文件扩展名，例如'jpg'。|
|photoType|[PhotoType](#enum-phototype)|是|-|创建的文件类型，IMAGE或者VIDEO。|
|title|String|否|""| **命名参数。** 图片或者视频的标题。|
|subtype|[PhotoSubtype](#enum-photosubtype)|否|DEFAULT| **命名参数。** 图片或者视频的文件子类型，DEFAULT或者MOVING_PHOTO。|

## struct PhotoSelectResult

```cangjie
public struct PhotoSelectResult {
    public PhotoSelectResult(
        public var photoUris: Array<String>,
        public var isOriginalPhoto: Bool
    )
}
```

**功能：** 返回图库选择后的结果集。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### var isOriginalPhoto

```cangjie
public var isOriginalPhoto: Bool
```

**功能：** 是否为原图。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### var photoUris

```cangjie
public var photoUris: Array<String>
```

**功能：** 媒体文件的uri数组。

**类型：** Array\<String>

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### PhotoSelectResult(Array\<String>, Bool)

```cangjie
public PhotoSelectResult(
    public var photoUris: Array<String>,
    public var isOriginalPhoto: Bool
)
```

**功能：** 构造PhotoSelectResult对象。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|photoUris|Array\<String>|是|-|返回图库选择后的媒体文件的uri数组，此uri数组只能通过临时授权的方式调用[getAssets接口](#func-getassetsfetchoptions)去使用。|
|isOriginalPhoto|Bool|是|-|返回图库选择后的媒体文件是否为原图。|

## struct RecommendationOptions

```cangjie
public struct RecommendationOptions {
    public RecommendationOptions(
        public var recommendationType!: ?RecommendationType = None,
        public var textContextInfo!: ?TextContextInfo = None
    )
}
```

**功能：** 图片推荐选项(基于图片数据分析结果，依赖设备适配)。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### var recommendationType

```cangjie
public var recommendationType:?RecommendationType = None
```

**功能：** 文本。

**类型：** ?[RecommendationType](#enum-recommendationtype)

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### var textContextInfo

```cangjie
public var textContextInfo:?TextContextInfo = None
```

**功能：** 文本。

**类型：** ?[TextContextInfo](#struct-textcontextinfo)

**读写能力：** 可读写

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### RecommendationOptions(?RecommendationType, ?TextContextInfo)

```cangjie
public RecommendationOptions(
    public var recommendationType!: ?RecommendationType = None,
    public var textContextInfo!: ?TextContextInfo = None
)
```

**功能：** 构造RecommendationOptions对象。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|recommendationType|?[RecommendationType](#enum-recommendationtype)|否|None| **命名参数。** 如果需要根据枚举值推荐相应的图片，则配置此参数。|
|textContextInfo|?[TextContextInfo](#struct-textcontextinfo)|否|None| **命名参数。** 如果需要根据文本信息推荐相应的图片，则配置此参数(如果同时配置了recommendationType，则仅textContextInfo生效)。|

## struct TextContextInfo

```cangjie
public struct TextContextInfo {
    public TextContextInfo (
        public let text!: String = ""
    )
}
```

**功能：** 文本信息，用于推荐图片的文本信息。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### let text

```cangjie
public let text: String = ""
```

**功能：** 文本。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### TextContextInfo(String)

```cangjie
public TextContextInfo (public let text!: String = "")
```

**功能：** 构造TextContextInfo对象。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|text|String|否|""| **命名参数。** 如果需要根据文本(支持250字以内的简体中文)推荐相应的图片，则配置此参数。|

## enum AlbumKeys

```cangjie
public enum AlbumKeys <: ToString & Equatable<AlbumKeys> {
    | URI
    | ALBUM_NAME
    | ...
}
```

**功能：** 相册关键信息。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**父类型：**

- ToString
- Equatable\<AlbumKeys>

### ALBUM_NAME

```cangjie
ALBUM_NAME
```

**功能：** 相册名字。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### URI

```cangjie
URI
```

**功能：** 相册uri。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### func !=(AlbumKeys)

```cangjie
public operator func !=(other: AlbumKeys): Bool 
```

**功能：** 判断两个枚举值是否不相等。

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[AlbumKeys](#enum-albumkeys)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(AlbumKeys)

```cangjie
public operator func ==(other: AlbumKeys): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[AlbumKeys](#enum-albumkeys)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum AlbumSubtype

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

**功能：** 相册子类型，表示具体的相册类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**父类型：**

- Equatable\<AlbumSubtype>
- ToString

### ANY

```cangjie
ANY
```

**功能：** 任意相册。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### FAVORITE

```cangjie
FAVORITE
```

**功能：** 收藏夹。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### IMAGE

```cangjie
IMAGE
```

**功能：** 图片相册。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### USER_GENERIC

```cangjie
USER_GENERIC
```

**功能：** 用户相册。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### VIDEO

```cangjie
VIDEO
```

**功能：** 视频相册。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### func !=(AlbumSubtype)

```cangjie
public operator func !=(other: AlbumSubtype): Bool 
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[AlbumSubtype](#enum-albumsubtype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(AlbumSubtype)

```cangjie
public operator func ==(other: AlbumSubtype): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[AlbumSubtype](#enum-albumsubtype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum AlbumType

```cangjie
public enum AlbumType <: Equatable<AlbumType> & ToString {
    | USER
    | SYSTEM
    | ...
}
```

**功能：** 相册类型，表示是用户相册还是系统预置相册。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**父类型：**

- Equatable\<AlbumType>
- ToString

### SYSTEM

```cangjie
SYSTEM
```

**功能：** 系统预置相册。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### USER

```cangjie
USER
```

**功能：** 用户相册。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### func !=(AlbumType)

```cangjie
public operator func !=(other: AlbumType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[AlbumType](#enum-albumtype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(AlbumType)

```cangjie
public operator func ==(other: AlbumType): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[AlbumType](#enum-albumtype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum DefaultChangeUri

```cangjie
public enum DefaultChangeUri <: ToString & Equatable<DefaultChangeUri> {
    | DEFAULT_PHOTO_URI
    | DEFAULT_ALBUM_URI
    | ...
}
```

**功能：** DefaultChangeUri子类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**父类型：**

- ToString
- Equatable\<DefaultChangeUri>

### DEFAULT_ALBUM_URI

```cangjie
DEFAULT_ALBUM_URI
```

**功能：** 默认相册的Uri，与forSubUri{true}一起使用，将接收所有相册的更改通知。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### DEFAULT_PHOTO_URI

```cangjie
DEFAULT_PHOTO_URI
```

**功能：** 默认PhotoAsset的Uri，与forSubUri{true}一起使用，将接收所有PhotoAsset的更改通知。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### func !=(DefaultChangeUri)

```cangjie
public operator func !=(other: DefaultChangeUri): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[DefaultChangeUri](#enum-defaultchangeuri)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(DefaultChangeUri)

```cangjie
public operator func ==(other: DefaultChangeUri): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[DefaultChangeUri](#enum-defaultchangeuri)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum DeliveryMode

```cangjie
public enum DeliveryMode <: Equatable<DeliveryMode> & ToString {
    | FAST_MODE
    | HIGH_QUALITY_MODE
    | BALANCE_MODE
    | ...
}
```

**功能：** 资源分发模式。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**父类型：**

- Equatable\<DeliveryMode>
- ToString

### BALANCE_MODE

```cangjie
BALANCE_MODE
```

**功能：** 均衡模式。

**起始版本：** 21

### FAST_MODE

```cangjie
FAST_MODE
```

**功能：** 快速模式。

**起始版本：** 21

### HIGH_QUALITY_MODE

```cangjie
HIGH_QUALITY_MODE
```

**功能：** 高质量模式。

**起始版本：** 21

### func !=(DeliveryMode)

```cangjie
public operator func !=(other: DeliveryMode): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[DeliveryMode](#enum-deliverymode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(DeliveryMode)

```cangjie
public operator func ==(other: DeliveryMode): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[DeliveryMode](#enum-deliverymode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum DynamicRangeType

```cangjie
public enum DynamicRangeType <: Equatable<DynamicRangeType> & ToString {
    | SDR
    | HDR
    | ...
}
```

**功能：** 媒体文件的动态范围类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**父类型：**

- Equatable\<DynamicRangeType>
- ToString

### HDR

```cangjie
HDR
```

**功能：** 高动态范围类型。

**起始版本：** 21

### SDR

```cangjie
SDR
```

**功能：** 标准动态范围类型。

**起始版本：** 21

### func !=(DynamicRangeType)

```cangjie
public operator func !=(other: DynamicRangeType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[DynamicRangeType](#enum-dynamicrangetype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(DynamicRangeType)

```cangjie
public operator func ==(other: DynamicRangeType): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[DynamicRangeType](#enum-dynamicrangetype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum MemberType

```cangjie
public enum MemberType {
    | INT64(Int64)
    | STRING(String)
    | BOOL(Bool)
    | ...
}
```

**功能：** PhotoAsset的成员类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### BOOL(Bool)

```cangjie
BOOL(Bool)
```

**功能：** 表示值类型为布尔类型。

**起始版本：** 21

### INT64(Int64)

```cangjie
INT64(Int64)
```

**功能：** 表示值类型为数字，可取任意值。

**起始版本：** 21

### STRING(String)

```cangjie
STRING(String)
```

**功能：** 表示值类型为字符，可取任意值。

**起始版本：** 21

### func getBool()

```cangjie
public func getBool(): Bool
```

**功能：** 获取BOOL(Bool)中的值。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|返回BOOL(Bool)中的值。|

### func getNumber()

```cangjie
public func getNumber(): Int64
```

**功能：** 获取INT64(Int64)中的值。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int64|返回INT64(Int64)中的值。|

### func getString()

```cangjie
public func getString(): String
```

**功能：** 获取STRING(String)中的值。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|返回STRING(String)中的值。|

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

**功能：** 通知事件的类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**父类型：**

- Equatable\<NotifyType>
- ToString

### NOTIFY_ADD

```cangjie
NOTIFY_ADD
```

**功能：** 添加文件集或相册通知的类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### NOTIFY_ALBUM_ADD_ASSET

```cangjie
NOTIFY_ALBUM_ADD_ASSET
```

**功能：** 在相册中添加的文件集的通知类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### NOTIFY_ALBUM_REMOVE_ASSET

```cangjie
NOTIFY_ALBUM_REMOVE_ASSET
```

**功能：** 在相册中删除的文件集的通知类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### NOTIFY_REMOVE

```cangjie
NOTIFY_REMOVE
```

**功能：** 删除文件集或相册的通知类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### NOTIFY_UPDATE

```cangjie
NOTIFY_UPDATE
```

**功能：** 文件集或相册的更新通知类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### func !=(NotifyType)

```cangjie
public operator func !=(other: NotifyType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[NotifyType](#enum-notifytype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(NotifyType)

```cangjie
public operator func ==(other: NotifyType): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[NotifyType](#enum-notifytype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

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

**功能：** 图片和视频文件关键信息。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**父类型：**

- ToString
- [Equatable\<PhotoKeys>]

### BURST_KEY

```cangjie
BURST_KEY
```

**功能：** 一组连拍照片的唯一标识：uuid。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### COVER_POSITION

```cangjie
COVER_POSITION
```

**功能：** 动态照片的封面位置，具体表示封面帧所对应的视频时间戳（单位：微秒）。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### DATE_ADDED

```cangjie
DATE_ADDED
```

**功能：** 添加日期（添加文件时间距1970年1月1日的秒数值）。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### DATE_ADDED_MS

```cangjie
DATE_ADDED_MS
```

**功能：** 添加日期（添加文件时间距1970年1月1日的毫秒数值）。

注意：查询照片时，不支持基于该字段排序。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### DATE_MODIFIED

```cangjie
DATE_MODIFIED
```

**功能：** 修改日期（修改文件时间距1970年1月1日的秒数值，修改文件名不会改变此值，当文件内容发生修改时才会更新）。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### DATE_MODIFIED_MS

```cangjie
DATE_MODIFIED_MS
```

**功能：** 修改日期（修改文件时间距1970年1月1日的毫秒数值，修改文件名不会改变此值，当文件内容发生修改时才会更新）。

注意：查询照片时，不支持基于该字段排序。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### DATE_TAKEN

```cangjie
DATE_TAKEN
```

**功能：** 拍摄日期（文件拍照时间距1970年1月1日的秒数值）。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### DISPLAY_NAME

```cangjie
DISPLAY_NAME
```

**功能：** 显示名字。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### DURATION

```cangjie
DURATION
```

**功能：** 持续时间（单位：毫秒）。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### DYNAMIC_RANGE_TYPE

```cangjie
DYNAMIC_RANGE_TYPE
```

**功能：** 媒体文件的动态范围类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### FAVORITE

```cangjie
FAVORITE
```

**功能：** 收藏。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### HEIGHT

```cangjie
HEIGHT
```

**功能：** 图片高度（单位：像素）。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### LCD_SIZE

```cangjie
LCD_SIZE
```

**功能：** LCD图片的宽高，值为width:height拼接而成的字符串。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### ORIENTATION

```cangjie
ORIENTATION
```

**功能：** 文件的旋转角度，单位为度。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### PHOTO_SUBTYPE

```cangjie
PHOTO_SUBTYPE
```

**功能：** 媒体文件的动态范围类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### PHOTO_TYPE

```cangjie
PHOTO_TYPE
```

**功能：** 媒体文件类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### SIZE

```cangjie
SIZE
```

**功能：** 文件大小（单位：字节）。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### THM_SIZE

```cangjie
THM_SIZE
```

**功能：** THUMB图片的宽高，值为width:height拼接而成的字符串。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### TITLE

```cangjie
TITLE
```

**功能：** 文件标题。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### URI

```cangjie
URI
```

**功能：** 文件uri。

注意：查询照片时，该字段仅支持使用[DataSharePredicates.equalTo](../ArkData/cj-apis-data_share_predicates.md#func-equaltostring-valuetype)谓词。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### WIDTH

```cangjie
WIDTH
```

**功能：** 图片宽度（单位：像素）。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### func !=(PhotoKeys)

```cangjie
public operator func !=(other: PhotoKeys): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[PhotoKeys](#enum-photokeys)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(PhotoKeys)

```cangjie
public operator func ==(other: PhotoKeys): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[PhotoKeys](#enum-photokeys)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum PhotoSubtype

```cangjie
public enum PhotoSubtype <: Equatable<PhotoSubtype> & ToString {
    | DEFAULT
    | MOVING_PHOTO
    | BURST
    | ...
}
```

**功能：** 连拍照片文件类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**父类型：**

- Equatable\<PhotoSubtype>
- ToString

### BURST

```cangjie
BURST
```

**功能：** 连拍照片文件类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### DEFAULT

```cangjie
DEFAULT
```

**功能：** 默认照片类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### MOVING_PHOTO

```cangjie
MOVING_PHOTO
```

**功能：** 动态照片文件类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### func !=(PhotoSubtype)

```cangjie
public operator func !=(other: PhotoSubtype): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[PhotoSubtype](#enum-photosubtype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(PhotoSubtype)

```cangjie
public operator func ==(other: PhotoSubtype): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[PhotoSubtype](#enum-photosubtype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum PhotoType

```cangjie
public enum PhotoType <: Equatable<PhotoType> & ToString {
    | IMAGE
    | VIDEO
    | ...
}
```

**功能：**  媒体文件类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**父类型：**

- Equatable\<PhotoType>
- ToString

### IMAGE

```cangjie
IMAGE
```

**功能：** 图片。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### VIDEO

```cangjie
VIDEO
```

**功能：** 视频。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### func !=(PhotoType)

```cangjie
public operator func !=(other: PhotoType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

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

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

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

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

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

**功能：** 可选择的媒体文件类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**父类型：**

- Equatable\<PhotoViewMIMETypes>
- ToString

### IMAGE_TYPE

```cangjie
IMAGE_TYPE
```

**功能：** 图片类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### IMAGE_VIDEO_TYPE

```cangjie
IMAGE_VIDEO_TYPE
```

**功能：** 图片和视频类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### MOVING_PHOTO_IMAGE_TYPE

```cangjie
MOVING_PHOTO_IMAGE_TYPE
```

**功能：** 动态照片类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### VIDEO_TYPE

```cangjie
VIDEO_TYPE
```

**功能：** 视频类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### func !=(PhotoViewMIMETypes)

```cangjie
public operator func !=(other: PhotoViewMIMETypes): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[PhotoViewMIMETypes](#enum-photoviewmimetypes)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(PhotoViewMIMETypes)

```cangjie
public operator func ==(other: PhotoViewMIMETypes): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[PhotoViewMIMETypes](#enum-photoviewmimetypes)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

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

**功能：** 推荐的图片类型。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**父类型：**

- Equatable\<RecommendationType>
- ToString

### BANK_CARD

```cangjie
BANK_CARD
```

**功能：** 银行卡。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### BAR_CODE

```cangjie
BAR_CODE
```

**功能：** 条码。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### DRIVER_LICENSE

```cangjie
DRIVER_LICENSE
```

**功能：** 驾驶证。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### DRIVING_LICENSE

```cangjie
DRIVING_LICENSE
```

**功能：** 行驶证。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### FEATURED_SINGLE_PORTRAIT

```cangjie
FEATURED_SINGLE_PORTRAIT
```

**功能：** 推荐人像。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### ID_CARD

```cangjie
ID_CARD
```

**功能：** 身份证。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### PASSPORT

```cangjie
PASSPORT
```

**功能：** 护照。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### PROFILE_PICTURE

```cangjie
PROFILE_PICTURE
```

**功能：** 头像。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### QR_CODE

```cangjie
QR_CODE
```

**功能：** 二维码。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### QR_OR_BAR_CODE

```cangjie
QR_OR_BAR_CODE
```

**功能：** 二维码或条码。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### func !=(RecommendationType)

```cangjie
public operator func !=(other: RecommendationType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[RecommendationType](#enum-recommendationtype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(RecommendationType)

```cangjie
public operator func ==(other: RecommendationType): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[RecommendationType](#enum-recommendationtype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum ResourceType

```cangjie
public enum ResourceType <: Equatable<ResourceType> & ToString {
    | IMAGE_RESOURCE
    | VIDEO_RESOURCE
    | ...
}
```

**功能：** 表示图片资源。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**父类型：**

- Equatable\<ResourceType>
- ToString

### IMAGE_RESOURCE

```cangjie
IMAGE_RESOURCE
```

**功能：** 表示图片资源。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### VIDEO_RESOURCE

```cangjie
VIDEO_RESOURCE
```

**功能：** 表示视频资源。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

### func !=(ResourceType)

```cangjie
public operator func !=(other: ResourceType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ResourceType](#enum-resourcetype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(ResourceType)

```cangjie
public operator func ==(other: ResourceType): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ResourceType](#enum-resourcetype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.FileManagement.PhotoAccessHelper.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|
