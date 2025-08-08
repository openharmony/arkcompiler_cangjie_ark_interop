# ohos.ability_access_ctrl (Application Access Control Management)

Application access control provides capabilities for permission management, including authentication, authorization, and revocation of authorization.

## Import Module

```cangjie
import kit.AbilityKit.*
```

## Usage Instructions

API sample code usage instructions:

- If the first line of the sample code contains a "// index.cj" comment, it indicates that the sample can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the above sample project and configuration template, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#Cangjie-Sample-Code-Instructions).

## class AbilityAccessCtrl

```cangjie
public class AbilityAccessCtrl {}
```

**Description:** This class is used to create instances for managing the access control module.

**System Capability:** SystemCapability.Security.AccessToken

**Since:** 21

### static func createAtManager()

```cangjie
public static func createAtManager(): AtManager
```

**Description:** Obtains the access control module object.

**System Capability:** SystemCapability.Security.AccessToken

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
|[AtManager](#class-atmanager)|The instance of the access control module.|

**Example:**

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

**Description:** Manages instances of the access control module.

**System Capability:** SystemCapability.Security.AccessToken

**Since:** 21

### func checkAccessToken(UInt32, Permissions)

```cangjie
public func checkAccessToken(tokenID: UInt32, permissionName: Permissions): GrantStatus
```

**Description:** Verifies whether the application has been granted the specified permission.

**System Capability:** SystemCapability.Security.AccessToken

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
|tokenID|UInt32|Yes|-|The identity of the target application to be verified. It can be obtained through the [ApplicationInfo](./cj-apis-bundle_manager.md#struct-applicationinfo) of the application.|
|permissionName|[Permissions](#type-permissions)|Yes|-|The name of the permission to be verified. Valid permission names can be queried in the [Application Permission List](../../../../Dev_Guide/source_en/security/AccessToken/cj-app-permissions.md#Application-Permission-List).|

**Return Value:**

| Type | Description |
|:----|:----|
|[GrantStatus](#enum-grantstatus)|The authorization status result.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Access Control Error Codes](../../errorcodes/cj-errorcode-access-token.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

| Error Code ID | Error Message |
|:----|:---|
| 401 | The parameter check failed. |
| 12100001 | The parameter is invalid. The tokenID is 0, or the string size of permissionName is larger than 256.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

let atManager = AbilityAccessCtrl.createAtManager()
let tokenID : UInt32 = 0 // The tokenID can be obtained by system applications through bundleManager.getApplicationInfo and by common applications through bundleManager.getBundleInfoForSelf.
let status = atManager.checkAccessToken(tokenID, "ohos.permission.GRANT_SENSITIVE_PERMISSIONS")
```

### func requestPermissionsFromUser(StageContext, Array\<Permissions>, AsyncCallback\<PermissionRequestResult>)

```cangjie
public func requestPermissionsFromUser(context: StageContext, permissionList: Array<Permissions>,
    callback: AsyncCallback<PermissionRequestResult>): Unit
```

**Description:** Used to display a dialog box to request user authorization.

If the user rejects the authorization, the dialog box cannot be displayed again. The user needs to manually grant the permission in the "Settings" interface of the system application.

**System Capability:** SystemCapability.Security.AccessToken

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
|context|[StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext)|Yes|-|The Context of the <!--RP1-->UIAbility<!--RP1End--> requesting the permission.|
|permissionList|Array\<[Permissions](#type-permissions)>|Yes|-|The name of the permission to be verified. Valid permission names can be queried in the [Application Permission List](../../../../Dev_Guide/source_en/security/AccessToken/cj-app-permissions.md#Application-Permission-List).|
|callback|AsyncCallback\<[PermissionRequestResult](#class-permissionrequestresult)>|Yes|-|The callback function, which returns whether the API call is successful.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Access Control Error Codes](../../errorcodes/cj-errorcode-access-token.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

| Error Code ID | Error Message |
|:----|:---|
| 401 | The parameter check failed. |
| 12100001 | The parameter is invalid. The context is invalid when it does not belong to the application itself.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*
import ohos.base.AsyncCallback
import ohos.base.AsyncError

// The following code can be added to the dependency definition.
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

let ctx = Global.getAbilityContext() // The Context application context needs to be obtained. For details, see the usage instructions in this document.
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

**Description:** The permission request result object, which is returned when calling [requestPermissionsFromUser](#func-requestpermissionsfromuserstagecontext-arraypermissions-asynccallbackpermissionrequestresult) to apply for permissions, indicating the result of the permission application.

**System Capability:** SystemCapability.Security.AccessToken

**Since:** 21

### var authResults

```cangjie
public var authResults: Array<Int32>
```

**Description:** The result of the corresponding permission request.

**Type:** Array\<Int32>

**Read/Write Attribute:** Readable and Writable

**System Capability:** SystemCapability.Security.AccessToken

**Since:** 21

### var dialogShownResults

```cangjie
public var dialogShownResults:?Array<Bool>= None
```

**Description:** Whether a dialog box is displayed for this permission application.

**Type:** ?Array\<Bool>

**Read/Write Attribute:** Readable and Writable

**System Capability:** SystemCapability.Security.AccessToken

**Since:** 21

### var permissions

```cangjie
public var permissions: Array<String>
```

**Description:** The permissions passed in by the user.

**Type:** Array\<String>

**Read/Write Attribute:** Readable and Writable

**System Capability:** SystemCapability.Security.AccessToken

**Since:** 21

### init(Array\<String>, Array\<Int32>)

```cangjie
public init(
    permissions: Array<String>,
    authResults: Array<Int32>
)
```

**Description:** Constructs a permission request result object.

**System Capability:** SystemCapability.Security.AccessToken

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
|permissions|Array\<String>|Yes|-|The permissions passed in by the user.|
|authResults|Array\<Int32>|Yes|-|The result of the corresponding permission request:<br>- -1: Not authorized. ① If dialogShownResults returns true, it indicates the first application by the user. ② If dialogShownResults returns false, it indicates that the permission has been set and no dialog box is required. The user needs to modify it in "Settings".<br>- 0: Authorized.<br>- 2: Not authorized, indicating that the request is invalid. Possible reasons:<br>  - The target permission is not declared in the configuration file.<br>  - The permission name is invalid.<br>  - Some permissions have special application conditions that are not met when applying for the corresponding permissions. For details, see [ohos.permission.LOCATION](../../../../Dev_Guide/source_en/security/AccessToken/cj-permissions-for-all-user.md#ohospermissionlocation) and [ohos.permission.APPROXIMATELY_LOCATION](../../../../Dev_Guide/source_en/security/AccessToken/cj-permissions-for-all-user.md#ohospermissionapproximately_location).|

## enum GrantStatus

```cangjie
public enum GrantStatus <: Equatable<GrantStatus> & ToString {
    | PERMISSION_DENIED
    | PERMISSION_GRANTED
    | ...
}
```

**Description:** Indicates the authorization status.

**System Capability:** SystemCapability.Security.AccessToken

**Since:** 21

**Parent Types:**

- Equatable\<GrantStatus>
- ToString

### PERMISSION_DENIED

```cangjie
PERMISSION_DENIED
```

**Function:** Not authorized.

**System Capability:** SystemCapability.Security.AccessToken

**Since:** 21

### PERMISSION_GRANTED

```cangjie
PERMISSION_GRANTED
```

**Function:** Authorized.

**System Capability:** SystemCapability.Security.AccessToken

**Since:** 21

### func !=(GrantStatus)

```cangjie
public operator func !=(other: GrantStatus): Bool 
```

**Function:** Determines inequality of authorization status.

**System Capability:** SystemCapability.Security.AccessToken

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [GrantStatus](#enum-grantstatus) | Yes | - | Authorization status. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if authorization statuses differ, otherwise false. |

### func ==(GrantStatus)

```cangjie
public operator func ==(other: GrantStatus): Bool 
```

**Function:** Determines equality of authorization status.

**System Capability:** SystemCapability.Security.AccessToken

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [GrantStatus](#enum-grantstatus) | Yes | - | Authorization status. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if authorization statuses are identical, otherwise false. |

### func toString()

```cangjie
public func toString(): String 
```

**Function:** Returns string representation of authorization status.

**System Capability:** SystemCapability.Security.AccessToken

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | String representation of authorization status. |

## type Permissions

```cangjie
public type Permissions = String
```

**Function:** Permission name, where [Permissions](#type-permissions) is an alias for String type.