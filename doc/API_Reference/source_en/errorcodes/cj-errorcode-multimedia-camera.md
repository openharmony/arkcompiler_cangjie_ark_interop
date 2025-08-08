# Camera Error Codes

> **Note:**
>
> The following only introduces error codes specific to this module. For general error codes, please refer to the [Universal Error Code Documentation](cj-errorcode-universal.md).

## 7400101 Invalid Parameter

**Error Message**

Parameter missing or parameter type incorrect.

**Error Description**

Invalid parameters were passed when calling the interface.

**Possible Causes**

Invalid parameters, such as values outside the boundary range or not using the specified enumeration range.

**Resolution Steps**

Refer to the interface documentation and provide the correct input parameters.

## 7400102 Illegal Operation

**Error Message**

Operation not allowed.

**Error Description**

Operation was not performed according to the established procedure.

**Possible Causes**

Incorrect interface execution sequence, such as performing `commitConfig` without first calling `beginConfig`.

**Resolution Steps**

Follow the correct steps as outlined in the interface documentation and guidelines.

## 7400103 Session Not Configured

**Error Message**

Session not config.

**Error Description**

An operation requiring session configuration was performed before the session was configured.

**Possible Causes**

Calling the `start` operation before configuring the session.

**Resolution Steps**

Configure the session first.

## 7400104 Session Not Running

**Error Message**

Session not running.

**Error Description**

An operation requiring the session to be running was performed before the session was started.

**Possible Causes**

Calling the `capture` operation before starting the session.

**Resolution Steps**

Start the session first.

## 7400105 Session Configuration Locked

**Error Message**

Session config locked.

**Error Description**

The session configuration is locked.

**Possible Causes**

Another thread has already locked the session configuration.

**Resolution Steps**

Wait for the session configuration lock to be released.

## 7400106 Device Configuration Locked

**Error Message**

Device setting locked.

**Error Description**

The device configuration is locked.

**Possible Causes**

Another thread has already locked the device configuration.

**Resolution Steps**

Wait for the device configuration lock to be released.

## 7400107 Camera Conflict

**Error Message**

Can not use camera cause of conflict.

**Error Description**

Unable to use the camera due to a conflict.

**Possible Causes**

A conflict exists between an already opened camera and the local camera to be used.

**Resolution Steps**

Wait for the conflicting camera to be released.

## 7400108 Camera Disabled Due to Security Policy

**Error Message**

Camera disabled cause of security reason.

**Error Description**

The camera cannot be used due to security policies.

**Possible Causes**

The application moved to the background while attempting to open the camera.

**Resolution Steps**

Open the camera after the application returns to the foreground.

## 7400109 Camera Device Preempted

**Error Message**

Can not use camera cause of preempted.

**Error Description**

Unable to use the camera because it has been preempted.

**Possible Causes**

Two applications simultaneously opened the same camera, and the latter application failed to open the corresponding camera.

**Resolution Steps**

N/A

## 7400110 Conflict with Current Configuration

**Error Message**

Unresolved conflicts with current configurations.

**Error Description**

The submitted configuration is incompatible with the device's supported configurations.

**Possible Causes**

Setting the preview stream frame rate beyond the device's supported range.

**Resolution Steps**

Verify that the submitted configuration aligns with the device's supported configurations.

## 7400201 Camera Service Error

**Error Message**

Camera service fatal error.

**Error Description**

The camera service encountered an error.

**Possible Causes**

Camera service exceptions, such as service restarts or cross-process call failures.

**Resolution Steps**

This is a general system error with unclear occurrence scenarios. It is recommended to recreate the business logic.