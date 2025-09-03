# UITest Error Codes

> **Note:**
>
> This document only covers module-specific error codes. For general error codes, please refer to the [Universal Error Code Documentation](cj-errorcode-universal.md).

## 17000001 Initialization Failed

**Error Message**

Initialize failed.

**Error Description**

Framework initialization failed.

**Possible Causes**

Unable to connect to the accessibility service.

**Resolution Steps**

Execute `param set persist.ace.testmode.enabled 1` and restart the device.

## 17000002 Concurrent Call Not Allowed

**Error Message**

API does not allow calling concurrently.

**Error Description**

The API cannot be called at this time.

**Possible Causes**

The API was called without `await`, causing blocking.

**Resolution Steps**

Review test cases to ensure asynchronous interfaces are called with `await`.

## 17000003 Assertion Failed

**Error Message**

Component existence assertion failed.

**Error Description**

User assertion failed.

**Possible Causes**

The component asserted to exist by the user does not actually exist.

**Resolution Steps**

Verify whether the component asserted to exist by the user is actually present.

## 17000004 Target Component/Window Lost

**Error Message**

Component lost/UiWindow lost.

**Error Description**

Target component/window lost, operation cannot be performed.

**Possible Causes**

The target was lost due to page changes after obtaining the target component/window.

**Resolution Steps**

Check whether page changes occurred after obtaining the target component/window, causing the target to be lost.

## 17000005 Operation Not Supported

**Error Message**

This operation is not supported.

**Error Description**

The UI object does not support this operation.

**Possible Causes**

The current interface component/window properties do not support this operation.

**Resolution Steps**

Verify whether the current interface component/window properties support this operation.