# Window Error Codes

> **Note:**
>
> The following only introduces error codes specific to this module. For general error codes, please refer to the [Universal Error Code Documentation](cj-errorcode-universal.md).

## 1300001 Repeated Operation

**Error Message**<br>
Repeated operation.

**Error Description**<br>
This error code is reported when performing certain repeated operations.

**Possible Causes**<br>
The error occurs when attempting to create a window that already exists.

**Resolution Steps**<br>
Before creating a window, check whether it already exists to ensure it is being created for the first time.

## 1300002 Abnormal Window State

**Error Message**<br>
This window state is abnormal.

**Error Description**<br>
This error code is reported when operating on a window with an abnormal state.

**Possible Causes**<br>
The window has not been created or has already been destroyed when attempting to operate on it.

**Resolution Steps**<br>
Before operating on a window, check whether it exists to ensure it has been created and not destroyed, then proceed with the operation.

## 1300003 Abnormal Window Manager Service

**Error Message**<br>
This window manager service works abnormally.

**Error Description**<br>
This error code is reported when the window manager service is functioning abnormally.

**Possible Causes**<br>
The internal window service has not started properly.

**Resolution Steps**<br>
The system service is functioning abnormally. Please retry later or restart the device.

## 1300004 Unauthorized Operation

**Error Message**<br>
Unauthorized operation.

**Error Description**<br>
This error code is reported when attempting to operate on an object without the required permissions.

**Possible Causes**<br>
Operating on a window object belonging to another process.

**Resolution Steps**<br>
Check whether you are illegally operating on objects from another process and remove such operations.

## 1300005 Abnormal WindowStage

**Error Message**<br>
This window stage is abnormal.

**Error Description**<br>
This error code is reported when operating on an abnormal WindowStage, such as one that has been destroyed.

**Possible Causes**<br>
The WindowStage has been destroyed when attempting to operate on it.

**Resolution Steps**<br>
Before operating on a WindowStage, check whether it exists. If it has been destroyed, release the windows under this WindowStage.

## 1300006 Abnormal Window Context

**Error Message**<br>
This window context is abnormal.

**Error Description**<br>
This error code is reported when operating on an abnormal window context, such as one that has been destroyed.

**Possible Causes**<br>
The window context has been destroyed when attempting to operate on it.

**Resolution Steps**<br>
Before operating on a window context, check whether it exists to ensure it has not been destroyed, then proceed with the operation.

## 1300007 WindowExtension Failed to Start Ability

**Error Message**<br>
Start ability failed.

**Error Description**<br>
WindowExtension failed to start the application.

**Possible Causes**<br>
Abnormal parameters when WindowExtension starts the application.

**Resolution Steps**<br>
Check whether the WindowExtension parameters have been abnormally modified, ensure they are valid, then proceed with the operation.

## 1300008 Abnormal Display Device

**Error Message**<br>The operation is on invalid display.

**Error Description**<br>Abnormal display device.

**Possible Causes**<br>

1. The display device is not ready.<br>
2. The display device has been removed.<br>
3. The display device is damaged.

**Resolution Steps**<br>Ensure the display device is functioning normally before proceeding with development.

## 1300009 Invalid Parent Window

**Error Message**<br>The parent window is invalid.

**Error Description**<br>Invalid parent window.

**Possible Causes**<br>

1. The child window is not bound to a parent window.<br>
2. The parent window bound to the child window is abnormal, such as being destroyed.

**Resolution Steps**<br>

1. Check and ensure the child window is successfully bound to a parent window.<br>
2. Check the state of the parent window bound to the child window to ensure it is normal.

## 1300010 Invalid Operation on Fullscreen Window

**Error Message**<br>This operation is not support in fullscreen.

**Error Description**<br>Invalid operation on a fullscreen window.

**Possible Causes**<br>

1. Performing a move operation on a fullscreen window.<br>
2. Performing a resize operation on a fullscreen window.

**Resolution Steps**<br>

1. Do not perform move operations on fullscreen windows.<br>
2. Do not perform resize operations on fullscreen windows.

## 1300011 Failed to Destroy Picture-in-Picture Window

**Error Message**<br>Destroy pip window failed.

**Error Description**<br>Failed to destroy the picture-in-picture window.

**Possible Causes**<br>
Null pointer for the picture-in-picture window.<br>

**Resolution Steps**<br>
No action required.

## 1300012 Abnormal Picture-in-Picture Window State

**Error Message**<br>Abnormal state of pip window.

**Error Description**<br>Abnormal state of the picture-in-picture window.

**Possible Causes**<br>
Abnormal state of the picture-in-picture window.

**Resolution Steps**<br>
No action required.

## 1300013 Failed to Create Picture-in-Picture Window

**Error Message**<br>Create pip window failed.

**Error Description**<br>Failed to create the picture-in-picture window.

**Possible Causes**<br>

1. Incorrect parameters passed when starting picture-in-picture.<br>
2. Starting picture-in-picture on a non-fullscreen window.

**Resolution Steps**<br>

1. Check the parameters for starting picture-in-picture.<br>
2. Do not start picture-in-picture on non-fullscreen windows.

## 1300014 Picture-in-Picture Internal Error

**Error Message**<br>Pip internal error.

**Error Description**<br>Picture-in-picture internal error.

**Possible Causes**<br>
Internal error.

**Resolution Steps**<br>
No action required.

## 1300015 Repeated Picture-in-Picture Operation

**Error Message**<br>Repeat operation of pip.

**Error Description**<br>Repeated picture-in-picture operation.

**Possible Causes**<br>
Repeatedly starting/stopping picture-in-picture.<br>

**Resolution Steps**<br>
Do not repeatedly start/stop picture-in-picture.<br>

## 1001 Window Null Pointer Exception<sup>(deprecated)</sup>

**Error Message**<br>
This window nullptr occurs.

**Error Description**<br>
Window null pointer exception. This error code is reported when operating on a window with a null pointer.

**Possible Causes**<br>
A null pointer occurs when operating on a window.

**Resolution Steps**<br>
Before operating on a window, check for null pointers to ensure none exist, then proceed with the operation.

## 1002 Invalid Window Type<sup>(deprecated)</sup>

**Error Message**<br>
This window type is invalid.

**Error Description**<br>
Invalid window type.

**Possible Causes**<br>
An invalid window type is used. Valid window types can be found in [WindowType](../arkui-cj/cj-apis-window.md#enum-windowtype).

**Resolution Steps**<br>
Use a window type supported by WindowType before proceeding with the operation.

## 1003 Invalid Window Parameter<sup>(deprecated)</sup>

**Error Message**<br>
This window parameter is invalid.

**Error Description**<br>
This error code is reported when operating on a window with invalid parameters.

**Possible Causes**<br>
The window parameters are invalid when attempting to operate on the window.

**Resolution Steps**<br>
Before operating on a window, check whether its parameters are valid, then proceed with the operation.

## 1004 Abnormal System Ability Service<sup>(deprecated)</sup>

**Error Message**<br>
This system ability service works abnormally.

**Error Description**<br>
This error code is reported when the system ability service is functioning abnormally.

**Possible Causes**<br>
Failed to initialize the proxy when destroying the window.

**Resolution Steps**<br>
The system ability service is abnormal. Restart the device and try again.

## 1005 IPC Communication Failure<sup>(deprecated)</sup>

**Error Message**<br>
This window IPC failed.

**Error Description**<br>
This error code is reported when IPC communication fails.

**Possible Causes**<br>
Failed to transmit window parameters via IPC when operating on the window.

**Resolution Steps**<br>
Before operating on a window, ensure the client and server services are functioning normally, then proceed with the operation.

## 1007 WindowExtension Failed to Start Ability<sup>(deprecated)</sup>

**Error Message**<br>
Start ability failed.

**Error Description**<br>
WindowExtension failed to start the application.

**Possible Causes**<br>
Abnormal parameters when WindowExtension starts the application.

**Resolution Steps**<br>
Check whether the WindowExtension parameters have been abnormally modified, ensure they are valid, then proceed with the operation.