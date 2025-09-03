# Access Control Error Codes

> **Note:**
>
> The following describes only the error codes specific to this module. For general error codes, please refer to the [Universal Error Code Documentation](cj-errorcode-universal.md).

## 12100001 Invalid Parameter

**Error Message**

Parameter invalid, message is ${messageInfo}.

**Possible Causes**

This error code indicates parameter validation failure. Possible causes include:

1. The tokenId value is 0.
2. The specified permission name is empty or exceeds 256 characters in length.
3. The flag value for requesting authorization/revocation is invalid.
4. Parameter check failed for listener registration.

**Resolution**

Check input parameters and correct them to valid values.

## 12100002 TokenId Does Not Exist

**Error Message**

TokenId does not exist.

**Possible Causes**

1. The specified tokenId does not exist.
2. The process corresponding to the specified tokenId is not an application process.

**Resolution**

Check input parameters and correct them to valid values.

## 12100003 Permission Does Not Exist

**Error Message**

Permission does not exist.

**Possible Causes**

1. The specified permissionName does not exist.
2. In authorization/revocation scenarios, the specified application tokenId has not requested the specified permissionName.
3. In permission usage record scenarios, the specified permissionName is not a user-authorized sensitive permission.

**Resolution**

Check input parameters and correct them to valid values. [Permission List](../../../Dev_Guide/source_zh_cn/security/AccessToken/cj-app-permissions.md#application-permission-list).

## 12100004 Interface Not Used in Combination

**Error Message**

The interface is not used together.

**Possible Causes**

This error code indicates listener interfaces are not used in combination. Possible causes include:

1. The current interface is called repeatedly without being used in combination.
2. The current interface is called alone without being used in combination.

**Resolution**

1. Check whether the current interface is used in combination. For example, after calling the start recording interface, do not call it again with the same parameters before calling the stop recording interface.
2. Check whether the current interface is used in combination. For example, the stop recording interface must be called after the start recording interface, and the unregister listener interface must be called after the register listener interface.

## 12100005 Listener Limit Exceeded

**Error Message**

The number of listeners exceeds the limit.

**Possible Causes**

This error code indicates the current number of listeners exceeds the limit of 200.

**Resolution**

Promptly release unused registered listeners.

## 12100006 Specified Application Does Not Support Granting/Revoking Specified Permissions

**Error Message**

The specified application does not support the permissions granted or ungranted as specified.

**Possible Causes**

1. The input tokenId is the identity of a remote device, and distributed authorization/revocation is not yet supported.
2. The specified tokenId is for a sandbox application that is prohibited from requesting the specified permission.

**Resolution**

1. Verify whether the tokenId was obtained correctly.
2. Confirm whether the sandbox application to be authorized is a special restricted sandbox process, as some sandbox applications in certain modes are prohibited from being granted most permissions.

## 12100007 System Service Abnormal

**Error Message**

Service is abnormal.

**Possible Causes**

This error code indicates abnormal system service operation:

1. The permission management service failed to start normally.
2. IPC data read/write failed.

**Resolution**

The system service encountered an internal error. Please retry later or restart the device.

## 12100008 Memory Allocation Failed

**Error Message**

Out of memory.

**Possible Causes**

Insufficient system memory.

**Resolution**

System memory is insufficient. Please retry later or restart the device.

## 12100009 Internal Service Error

**Error Message**

Common inner error.

**Possible Causes**

Internal system service error.

**Resolution**

An internal logic error occurred in the system. Further analysis with fault logs is required.

## 12100010 Pending Request Exists

**Error Message**

The request already exists.

**Possible Causes**

The previous request has not been processed.

**Resolution**

Please complete processing the previous request.

## 12100011 All Permissions Already Granted

**Error Message**

All permissions in the permission list have been granted.

**Possible Causes**

All permissions have already been granted.

**Resolution**

No action required. This error code indicates the requested permissions are already granted, and no permission setting dialog will be displayed.

## 12100012 Permission List Contains Non-Revoked Permissions

**Error Message**

The permission list contains the permission that has not been revoked by the user.

**Possible Causes**

There are permissions that have not been rejected by the user.

**Resolution**

First call requestPermissionsFromUser to request permissions from the user.

## 12100013 Global Switch Already Enabled

**Error Message**

The specific global switch is already open.

**Possible Causes**

The global switch is already enabled.

**Resolution**

No action required. This error code indicates the global switch is already enabled, and no global switch setting dialog will be displayed.