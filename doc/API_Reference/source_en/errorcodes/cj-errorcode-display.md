# Screen Error Codes

> **Note:**
>
> The following describes only the error codes specific to this module. For general error codes, please refer to the [Universal Error Code Documentation](cj-errorcode-universal.md).

## 1400001 Invalid Display Device

**Error Message**  
Invalid display or screen.

**Error Description**  
This error code is reported when operating on an invalid display device (including virtual screens).

**Possible Causes**  

1. The virtual screen has not been created.
2. The virtual screen has been destroyed.

**Resolution Steps**  

1. Before operating on a virtual screen, check whether it exists and ensure it has been created.
2. Before operating on a virtual screen, verify that it has not been destroyed and proceed with the operation only if it is intact.

## 1400002 Unauthorized Operation

**Error Message**  
Unauthorized operation.

**Error Description**  
This error code is reported when attempting to operate on an object for which the user lacks permission.

**Possible Causes**  
Operating on a virtual screen object belonging to another process.

**Resolution Steps**  
Check for any unauthorized operations on objects from other processes and remove such illegal operations.

## 1400003 System Service Malfunction

**Error Message**  
This display manager service works abnormally.

**Error Description**  
This error code is reported when the system service is functioning abnormally.

**Possible Causes**  

1. The screen management service failed to start properly.
2. Underlying graphics and image composition rendering encountered an exception.

**Resolution Steps**  
The system service is experiencing internal malfunctions. Please retry after some time or attempt restarting the device.