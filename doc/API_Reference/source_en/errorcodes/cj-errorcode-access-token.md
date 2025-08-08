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
3. The flag for requesting authorization/revocation is invalid.
4. Parameter check failed for registering a listener.

**Resolution**

Check the input parameters and correct them to valid values.

## 12100002 tokenId Does Not Exist

**Error Message**

TokenId does not exist.

**Possible Causes**

1. The specified tokenId does not exist.
2. The process corresponding to the specified tokenId is not an application process.

**Resolution**

Check the input parameters and correct them to valid values.

## 12100003 Permission Does Not Exist

**Error Message**

Permission does not exist.

**Possible Causes**

1. The specified permissionName does not exist.
2. In authorization/revocation scenarios, the specified application tokenId has not applied for the specified permissionName.
3. In permission usage record scenarios, the specified permissionName is not a sensitive permission authorized by the user.

**Resolution**

Check the input parameters and correct them to valid values. [Permission List](../../../Dev_Guide/source_en/security/AccessToken/cj-app-permissions.md#Application Permission List).

## 12100004 Interfaces Not Used Together

**Error Message**

The interface is not used together.

**Possible Causes**

This error code indicates listener interfaces are not used together. Possible causes include:

1. The current interface is called repeatedly without being used together.
2. The current interface is called alone without being used together.

**Resolution**

1. Check if the current interface needs to be used together. For example, after calling the start recording interface, the same parameters cannot be used to call it again before calling the stop recording interface.
2. Check if the current interface needs to be used together. For example, the stop recording interface must be called after the start recording interface, and the unregister listener interface must be called after the register listener interface.

## 12100005 Listener Limit Exceeded

**Error Message**

The number of listeners exceeds the limit.

**Possible Causes**

This error code indicates the current number of listeners exceeds the limit of 200.

**Resolution**

Release unused listeners promptly.

## 12100006 Specified Application Does Not Support Granting/Revoking Specified Permissions

**Error Message**

The specified application does not support the permissions granted or ungranted as specified.

**Possible Causes**

1. The input tokenId is the identity of a remote device, and distributed authorization/revocation is not yet supported.
2. The specified tokenId corresponds to a sandbox application that is prohibited from applying for the specified permission.

**Resolution**

1. Verify the method of obtaining the tokenId is correct.
2. Confirm if the sandbox application to be authorized is a special restricted sandbox process. Some sandbox applications in certain modes are prohibited from being granted most permissions.

## 12100007 System Service Exception

**Error Message**

Service is abnormal.

**Possible Causes**

This error code indicates abnormal system service operation:

1. The permission management service failed to start normally.
2. IPC data read/write failed.

**Resolution**

The system service encountered an internal exception. Please retry later or restart the device.

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

Internal system logic error. Further analysis with fault logs is required.

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

No action needed. This error code indicates the requested permissions are already granted, and no permission setting dialog will be displayed.

## 12100012 Permission List Contains Non-Revoked Permissions

**Error Message**

The permission list contains the permission that has not been revoked by the user.

**Possible Causes**

There are permissions not previously rejected by the user.

**Resolution**

First call requestPermissionsFromUser to request permissions from the user.

## 12100013 Global Switch Already Enabled

**Error Message**

The specific global switch is already open.

**Possible Causes**

The global switch is already enabled.

**Resolution**

No action needed. This error code indicates the global switch is already enabled, and no global switch setting dialog will be displayed.