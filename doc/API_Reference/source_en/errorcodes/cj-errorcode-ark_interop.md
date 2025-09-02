# ArkTS Interop Subsystem Error Codes

> **Note:**
>
> The following describes only the error codes specific to this module. For general error codes, please refer to the [Universal Error Code Documentation](cj-errorcode-universal.md).

## 34300001 The Specified Index Is Out Of Range

**Error Message**

The accessing index is out of range.

**Error Description**

This error code is returned when the access index is out of range.

**Possible Causes**

The access index is less than 0 or greater than up limit.

**Solution Steps**

1. Verify that index is greater or equal than 0.
2. Verify that index is less than up limit.

## 34300002 Exception Occurred When Call ArkTS Function.

**Error Message**

An exception occurred during ArkTS code execution.

**Error Description**

This error code is returned when an exception occurred during ArkTS code execution.

**Possible Causes**

Pass wrong arguments to ArkTS function.

**Solution Steps**

1. Verify that the call arguments is incorrect.

## 34300003 Access reference that beyond reach

**Error Message**

Accessing reference is beyond reach.

**Error Description**

The accessed reference is released.

**Possible Causes**

The accessed JSValue is out of scope.

The accessed JSPromiseCapability is fulfilled or rejected.

**Solution Steps**

1. Verify the JSContext is still alive.

2. Use secure reference instead of JSValue.

## 34300004 Thread Check Failed

**Error Message**

Create or accessing ArkTS data on wrong thread.

**Error Description**

This error code is returned when creating or accessing an ArkTS object on wrong thread.

**Possible Causes**

Creating or accessing an ArkTS object on wrong thread.

**Solution Steps**

1. Check current thread is JSContext bound thread by JSContext.isBindThread()

## 34300005 The Data Type Check Failed.

**Error Message**

The ArkTS data types do not match.

**Error Description**

This error code is returned when manipulate data with incompatible action.

**Possible Causes**

Read a number as string.

**Solution Steps**

Check data types by 'typeof' before manipulate.