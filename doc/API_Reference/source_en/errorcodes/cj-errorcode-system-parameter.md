# System Parameter Error Codes

> **Note:**
>
> The following describes only the error codes specific to this module. For general error codes, please refer to the [Universal Error Code Documentation](./cj-errorcode-universal.md).

## 14700101 System Parameter Not Found

**Error Message**

System parameter can not be found.

**Error Description**

This error code is reported when there is no corresponding node in the workspace or when the key value is not set.

**Possible Causes**

The parameter is not set or failed to be set.

**Resolution Steps**

Set a valid parameter.

## 14700102 Invalid System Parameter Value

**Error Message**

System parameter value is invalid.

**Error Description**

This error code is reported when the system parameter value is an empty string, contains illegal characters, or exceeds the length limit.

**Possible Causes**

The parameter value exceeds the allowed range or contains special characters, such as "const.param.xxx".

**Resolution Steps**

Modify the value to a valid string.

## 14700103 System Permission Operation Denied

**Error Message**

System permission operation permission denied.

**Error Description**

This error code is reported when the system parameter lacks DAC or MAC permissions.

**Possible Causes**

DAC or MAC permissions are not configured.

**Resolution Steps**

Add the corresponding DAC or MAC permissions.

## 14700104 System Internal Error (Including Out of Memory, Deadlock, etc.)

**Error Message**

System internal error including out of memory, deadlock etc.

**Error Description**

This error code is reported when attempting to modify const attribute parameters, socket connection failures, memory copy failures, and other errors.

**Possible Causes**

Socket connection exceptions, node addition failures, or node retrieval failures.

**Resolution Steps**

1. **Out of Memory**: Analyze the memory usage of the entire process to check for memory leaks.
2. **Deadlock**: Typically occurs in multi-threaded scenarios. Examine the error stack trace to identify potential deadlock situations.