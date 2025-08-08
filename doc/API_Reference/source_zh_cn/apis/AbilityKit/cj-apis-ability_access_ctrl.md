# ohos.ability_access_ctrl（程序访问控制管理）

程序访问控制提供程序的权限管理能力，包括鉴权、授权和取消授权等。

## 导入模块

```cangjie
import kit.AbilityKit.*
```

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## class AbilityAccessCtrl

```cangjie
public class AbilityAccessCtrl {}
```

**功能：** 此类用于创建管理访问控制模块的实例。

**系统能力：** SystemCapability.Security.AccessToken

**起始版本：** 21

### static func createAtManager()

```cangjie
public static func createAtManager(): AtManager
```

**功能：** 获取访问控制模块对象。

**系统能力：** SystemCapability.Security.AccessToken

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[AtManager](#class-atmanager)|获取访问控制模块的实例。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

let atManager: AtManager = AbilityAccessCtrl.createAtManager()
```

## class AtManager

```cangjie
public class AtManager {}
```

**功能：** 管理访问控制模块的实例。

**系统能力：** SystemCapability.Security.AccessToken

**起始版本：** 21

### func checkAccessToken(UInt32, Permissions)

```cangjie
public func checkAccessToken(tokenID: UInt32, permissionName: Permissions): GrantStatus
```

**功能：** 校验应用是否授予权限。

**系统能力：** SystemCapability.Security.AccessToken

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|tokenID|UInt32|是|-|要校验的目标应用的身份标识。可通过应用的[ApplicationInfo](./cj-apis-bundle_manager.md#struct-applicationinfo)获得。|
|permissionName|[Permissions](#type-permissions)|是|-|需要校验的权限名称，合法的权限名取值可在[应用权限列表](../../../../Dev_Guide/source_zh_cn/security/AccessToken/cj-app-permissions.md#应用权限列表)中查询。|

**返回值：**

|类型|说明|
|:----|:----|
|[GrantStatus](#enum-grantstatus)|返回授权状态结果。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[访问控制错误码](../../errorcodes/cj-errorcode-access-token.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 401 | The parameter check failed. |
| 12100001 | The parameter is invalid. The tokenID is 0,or the string size of permissionName is larger than 256.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

let atManager = AbilityAccessCtrl.createAtManager()
let tokenID : UInt32 = 0 // tokenID系统应用可以通过bundleManager.getApplicationInfo获取，普通应用可以通过bundleManager.getBundleInfoForSelf获取
let status = atManager.checkAccessToken(tokenID, "ohos.permission.GRANT_SENSITIVE_PERMISSIONS")
```

### func requestPermissionsFromUser(StageContext, Array\<Permissions>, AsyncCallback\<PermissionRequestResult>)

```cangjie
public func requestPermissionsFromUser(context: StageContext, permissionList: Array<Permissions>,
    callback: AsyncCallback<PermissionRequestResult>): Unit
```

**功能：** 用于拉起弹框请求用户授权。

如果用户拒绝授权，将无法再次拉起弹框，需要用户在系统应用“设置”的界面中，手动授予权限。

**系统能力：** SystemCapability.Security.AccessToken

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext)|是|-|请求权限的<!--RP1-->UIAbility<!--RP1End-->的Context。|
|permissionList|Array\<[Permissions](#type-permissions)>|是|-|需要校验的权限名称，合法的权限名取值可在[应用权限列表](../../../../Dev_Guide/source_zh_cn/security/AccessToken/cj-app-permissions.md#应用权限列表)中查询。|
|callback|AsyncCallback\<[PermissionRequestResult](#class-permissionrequestresult)>|是|-|回调函数，返回接口调用是否成功的结果。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[访问控制错误码](../../errorcodes/cj-errorcode-access-token.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 401 | The parameter check failed. |
| 12100001 | The parameter is invalid. The context is invalid when it does notbelong to the application itself.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*
import ohos.base.AsyncCallback
import ohos.base.AsyncError

// 此处代码可添加在依赖项定义中
var resultCallback = {
    errorCode: Option<AsyncError>, data: Option<AccessCtrlPermissionRequestResult> => match (errorCode) {
        case Some(e) => AppLog.info("permissionResultCallBack request error: errcode is ${e.code}")
        case _ =>
            match (data) {
                case Some(value) =>
                    for (i in (0..value.permissions.size)) {
                        AppLog.info("CallBack: ${value.permissions[i]} - ${value.authResults[i]}")
                    }
                case _ => AppLog.info("permissionResultCallBack request error: data is null")
            }
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let atManager = AbilityAccessCtrl.createAtManager()
let stageContext = getStageContext(ctx)
let permissionList = ["ohos.permission.READ_CONTACTS", "ohos.permission.CAMERA"]
atManager.requestPermissionsFromUser(stageContext, permissionList, resultCallback)
```

## class PermissionRequestResult

```cangjie
public class PermissionRequestResult {
    public var permissions: Array<String>
    public var authResults: Array<Int32>
    public var dialogShownResults:?Array<Bool>= None
    public init(
        permissions: Array<String>,
        authResults: Array<Int32>
    )
}
```

**功能：** 权限请求结果对象，在调用[requestPermissionsFromUser](#func-requestpermissionsfromuserstagecontext-arraypermissions-asynccallbackpermissionrequestresult)申请权限时返回此对象表明此次权限申请的结果。

**系统能力：** SystemCapability.Security.AccessToken

**起始版本：** 21

### var authResults

```cangjie
public var authResults: Array<Int32>
```

**功能：** 相应请求权限的结果。

**类型：** Array\<Int32>

**读写能力：** 可读写

**系统能力：** SystemCapability.Security.AccessToken

**起始版本：** 21

### var dialogShownResults

```cangjie
public var dialogShownResults:?Array<Bool>= None
```

**功能：** 此权限申请是否有弹窗。

**类型：** ?Array\<Bool>

**读写能力：** 可读写

**系统能力：** SystemCapability.Security.AccessToken

**起始版本：** 21

### var permissions

```cangjie
public var permissions: Array<String>
```

**功能：** 用户传入的权限。

**类型：** Array\<String>

**读写能力：** 可读写

**系统能力：** SystemCapability.Security.AccessToken

**起始版本：** 21

### init(Array\<String>, Array\<Int32>)

```cangjie
public init(
    permissions: Array<String>,
    authResults: Array<Int32>
)
```

**功能：** 构造权限请求结果对象。

**系统能力：** SystemCapability.Security.AccessToken

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|permissions|Array\<String>|是|-|用户传入的权限。|
|authResults|Array\<Int32>|是|-|相应请求权限的结果：<br>- -1：未授权。①dialogShownResults返回为true，表示用户首次申请；②dialogShownResults返回为false，表示权限已设置，无需弹窗，需要用户在"设置"中修改。<br>- 0：已授权。<br>- 2：未授权，表示请求无效，可能原因有：<br>  -未在设置文件中声明目标权限。<br>  -权限名非法。<br>  -部分权限存在特殊申请条件，在申请对应权限时未满足其指定的条件，见[ohos.permission.LOCATION](../../../../Dev_Guide/source_zh_cn/security/AccessToken/cj-permissions-for-all-user.md#ohospermissionlocation)与[ohos.permission.APPROXIMATELY_LOCATION](../../../../Dev_Guide/source_zh_cn/security/AccessToken/cj-permissions-for-all-user.md#ohospermissionapproximately_location)。|

## enum GrantStatus

```cangjie
public enum GrantStatus <: Equatable<GrantStatus> & ToString {
    | PERMISSION_DENIED
    | PERMISSION_GRANTED
    | ...
}
```

**功能：** 表示授权状态。

**系统能力：** SystemCapability.Security.AccessToken

**起始版本：** 21

**父类型：**

- Equatable\<GrantStatus>
- ToString

### PERMISSION_DENIED

```cangjie
PERMISSION_DENIED
```

**功能：** 未授权。

**系统能力：** SystemCapability.Security.AccessToken

**起始版本：** 21

### PERMISSION_GRANTED

```cangjie
PERMISSION_GRANTED
```

**功能：** 已授权。

**系统能力：** SystemCapability.Security.AccessToken

**起始版本：** 21

### func !=(GrantStatus)

```cangjie
public operator func !=(other: GrantStatus): Bool 
```

**功能：** 对授权状态进行判不等。

**系统能力：** SystemCapability.Security.AccessToken

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[GrantStatus](#enum-grantstatus)|是|-|授权状态。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果授权状态不同，返回true，否则返回false。|

### func ==(GrantStatus)

```cangjie
public operator func ==(other: GrantStatus): Bool 
```

**功能：** 对授权状态进行判等。

**系统能力：** SystemCapability.Security.AccessToken

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[GrantStatus](#enum-grantstatus)|是|-|授权状态。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果授权状态相同，返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String 
```

**功能：** 返回授权状态的字符串表示。

**系统能力：** SystemCapability.Security.AccessToken

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|授权状态的字符串表示。|

## type Permissions

```cangjie
public type Permissions = String
```

**功能：** 权限名，[Permissions](#type-permissions)是String类型的别名。
