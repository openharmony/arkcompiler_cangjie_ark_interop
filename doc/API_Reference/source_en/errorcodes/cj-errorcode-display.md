# Screen Error Codes

> **Note:**
>
> This document only introduces error codes specific to this module. For general error codes, please refer to the [Universal Error Code Documentation](cj-errorcode-universal.md).

## 1400001 Invalid Display Device

**Error Message**<br>
Invalid display or screen.

**Error Description**<br>
This error code is reported when attempting to operate on an invalid display device (including virtual screens).

**Possible Causes**<br>

1. The virtual screen has not been created.
2. The virtual screen has been destroyed.

**Resolution Steps**<br>

1. Before operating on a virtual screen, verify its existence and ensure it has been created.
2. Before operating on a virtual screen, check whether it has been destroyed, and ensure it remains active before performing any operations.

## 1400002 Unauthorized Operation

**Error Message**<br>
Unauthorized operation.

**Error Description**<br>
This error code is reported when attempting to perform operations on objects without proper permissions.

**Possible Causes**<br>
Attempting to operate on virtual screen objects belonging to other processes.

**Resolution Steps**<br>
Verify whether unauthorized operations are being performed on objects from other processes, and remove any such illegal operations.

## 1400003 System Service Malfunction

**Error Message**<br>
This display manager service works abnormally.

**Error Description**<br>
This error code is reported when the system service is functioning abnormally.

**Possible Causes**<br>

1. The screen management service failed to start properly.
2. Underlying graphics/image composition and rendering encountered an exception.

**Resolution Steps**<br>
The system service is experiencing internal malfunctions. Please retry after some time or attempt to restart the device.