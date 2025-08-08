# Network Connection Management Error Codes

> **Note:**
>
> The following only introduces error codes specific to this module. For general error codes, please refer to the [Universal Error Code Documentation](cj-errorcode-universal.md).

## 2100001 Invalid Parameter Value

**Error Message**

Invalid parameter value.

**Error Description**

Invalid parameter value.

**Possible Causes**

Input parameter value is out of range.

**Solution**

Check whether the input parameter value is within the correct range.

## 2100002 Connection Service Failed

**Error Message**

Operation failed. Cannot connect to service.

**Error Description**

Operation failed due to an exception when connecting to the system service.

**Possible Causes**

Service exception occurred.

**Solution**

Check whether the system service is running normally.

## 2100003 System Internal Error

**Error Message**

System internal error.

**Error Description**

System internal error.

**Possible Causes**

1. Memory exception.  
2. Null pointer.

**Solution**

1. Check whether memory space is sufficient. Free up memory and retry.  
2. System exception. Please retry later or restart the device.

## 2101007 Same Callback Already Exists

**Error Message**

The same callback exists.

**Error Description**

Callback already registered.

**Possible Causes**

When activating & monitoring a specified attribute network and registering a callback, the callback object was registered repeatedly.

**Solution**

1. Ensure the callback object to be registered has not been registered before.  
2. If the callback object has already been registered, execute the existing registration.

## 2101008 Callback Does Not Exist

**Error Message**

The callback is not exists.

**Error Description**

Non-existent callback object.

**Possible Causes**

The request to activate & monitor a specified attribute network and register a callback was not executed.

**Solution**

Check the callback object. Ensure the callback object has been registered before unregistering it.

## 2101022 Request Number Exceeds Maximum

**Error Message**

The number of requests exceeded the maximum.

**Error Description**

The number of network requests exceeded the maximum limit.

**Possible Causes**

The number of requests to activate & monitor a specified attribute network exceeded the maximum limit.

**Solution**

It is recommended to locate the issue through the log message "Over the max request number".