# Telephone Subsystem Error Codes

> **Note:**
>
> The following only introduces error codes specific to this module. For general error codes, please refer to the [Universal Error Code Documentation](cj-errorcode-universal.md).

## 8300001 Input Parameter Out of Processing Range

**Error Message**

Invalid parameter value.

**Error Description**

The input parameter is out of the processing range, such as an invalid slotId, which prevents the corresponding operation.

**Possible Causes**

Invalid input parameter.

**Resolution Steps**

Please enter the correct valid parameter.

## 8300002 Service Connection Failed

**Error Message**

Operation failed. Cannot connect to service.

**Error Description**

Operation failed. Unable to connect to the service.

**Possible Causes**

Service startup failed, IPC connection failed, etc.

**Resolution Steps**

The current operation is abnormal. Please try again later.

## 8300003 System Internal Error

**Error Message**

System internal error.

**Error Description**

System internal error.

**Possible Causes**

Network exception, data read/write failure, etc.

**Resolution Steps**

The current operation is abnormal. Please try again later.

## 8300004 SIM Card Not Recognized

**Error Message**

Do not have sim card.

**Error Description**

No SIM card is detected.

**Possible Causes**

No SIM card is inserted or the SIM card is not inserted properly.

**Resolution Steps**

Please insert the SIM card or reinsert it.

## 8300005 Airplane Mode Enabled

**Error Message**

Airplane mode is on.

**Error Description**

Airplane mode is enabled.

**Possible Causes**

The phone has enabled airplane mode.

**Resolution Steps**

Try turning off airplane mode.

## 8300006 Network Unavailable

**Error Message**

Network not in service.

**Error Description**

No available network on the phone.

**Possible Causes**

Mobile data is not enabled or not connected to a wireless network.

**Resolution Steps**

Try enabling mobile data or connecting to a wireless network.

## 8300999 Unknown Error

**Error Message**

Unknown error code.

**Error Description**

Unknown error.

**Possible Causes**

An unexpected error occurred within the system, possibly due to an underlying error code that is out of the processing range.

**Resolution Steps**

The operation is abnormal. Please try again later.

## 8301001 SIM Card Not Activated

**Error Message**

SIM card is not activated.

**Error Description**

SIM card is not activated.

**Possible Causes**

The SIM card is not activated.

**Resolution Steps**

Please activate the SIM card.

## 8301002 SIM Card Data Read or Update Failed

**Error Message**

SIM card operation error.

**Error Description**

Failed to read or update SIM card data.

**Possible Causes**

The SIM card does not support the operation, or the SIM card is damaged.

**Resolution Steps**

Please contact the SIM card carrier or replace the SIM card.

## 8301003 Operator Configuration Error

**Error Message**

Operator config error.

**Error Description**

Operator configuration error.

**Possible Causes**

No preset configuration file for the corresponding SIM card.

**Resolution Steps**

Please check if the correct SIM card is inserted.

## 8401001 UT Connection Failed

**Error Message**

UT is not connected.

**Error Description**

UT is not connected.

**Possible Causes**

The current carrier does not support sending UT requests over Wi-Fi, but the device is currently connected to Wi-Fi.

**Resolution Steps**

Disconnect from Wi-Fi and resend the UT request.