# Meta Capability Subsystem Error Codes

> **Note:**
>
> The following describes only the error codes specific to this module. For general error codes, please refer to the [Universal Error Code Documentation](cj-errorcode-universal.md).

## 16000001 The Specified Ability Does Not Exist

**Error Message**

The specified ability does not exist.

**Error Description**

This error code is returned when the specified ability name does not exist.

**Possible Causes**

The queried ability does not exist.

**Solution Steps**

1. Verify that the bundleName, moduleName, and abilityName in the want are correct.
2. Check whether the application corresponding to the bundleName in the want is installed. Use the following command to query the list of installed applications. If the bundleName is not in the query results, the application is not installed successfully.

    ``` text
    hdc shell bm dump -a
    ```

3. For multi-HAP applications, confirm whether the HAP to which the ability belongs has been installed. Use the following command to query the package information of the application. If the corresponding HAP and ability are not found in the installed application, the HAP to which the ability belongs has not been installed.

    ``` text
    hdc shell bm dump -n package_name
    ```

## 16000002 Incorrect Ability Type

**Error Message**

Incorrect ability type.

**Error Description**

This error code is returned when the ability type called by the interface is incorrect.

**Possible Causes**

The ability type where the interface is called does not support this interface call.

**Solution Steps**

1. Verify that the bundleName, moduleName, and abilityName in the want are correct.
2. Call different interfaces based on the ability type.

## 16000003 The Specified ID Does Not Exist

**Error Message**

The specified ID does not exist.

**Error Description**

This error code is returned when the specified ID does not exist.

**Possible Causes**

The target ID for the operation does not exist.

**Solution Steps**

Confirm whether the ID for the operation exists.

## 16000004 Visibility Verification Failed

**Error Message**

Failed to start the invisible ability.

**Error Description**

This error code is returned when visibility verification fails.

**Possible Causes**

Application visibility verification failed.

**Solution Steps**

1. In the Stage model, if exception 16000004 is thrown when launching an application, it indicates that the called application failed to start. Check whether the exported configuration of the Ability field in the module.json5 of the called application is set to true. If this field is true, the ability can be called by other applications; if it is false, the ability cannot be called by other applications.
2. If an application needs to launch an ability with exported set to false, apply for the ohos.permission.START_INVISIBLE_ABILITY permission (this permission can only be requested by system applications).

## 16000005 Permission Verification Failed for the Specified Process

**Error Message**

The specified process does not have the permission.

**Error Description**

This error code is returned when permission verification fails for the specified process.

**Possible Causes**

Permission verification failed for the specified process.

**Solution Steps**

Confirm whether the permissions for the specified process are correct.

## 16000006 Cross-User Operations Are Not Allowed

**Error Message**

Cross-user operations are not allowed.

**Error Description**

This error code is returned when an application performs cross-user operations.

**Possible Causes**

The application performed cross-user operations.

**Solution Steps**

Confirm whether cross-user operations were performed.

## 16000007 Service Busy

**Error Message**

Service busy. There are concurrent tasks. Try again later.

**Error Description**

This error code is returned when the service is busy.

**Possible Causes**

The service is busy.

**Solution Steps**

The service is busy. Please try again later.

## 16000008 Crowdtesting Application Expired

**Error Message**

The crowdtesting application expires.

**Error Description**

This error code is returned when a crowdtesting application expires.

**Possible Causes**

The crowdtesting application has expired and cannot be opened.

**Solution Steps**

Check whether the crowdtesting application has expired. Expired crowdtesting applications cannot be launched.

## 16000009 Wukong Mode: Starting/Stopping Ability Not Allowed

**Error Message**

An ability cannot be started or stopped in Wukong mode.

**Error Description**

This error code is returned when attempting to start or stop an ability in Wukong mode.

**Possible Causes**

Starting or stopping abilities is not allowed in Wukong mode.

**Solution Steps**

Exit Wukong mode before attempting to start or stop the ability. Do not start or stop abilities in Wukong mode.

## 16000010 Continuation Flag Not Allowed

**Error Message**

The call with the continuation flag is forbidden.

**Error Description**

This error code is returned when a call carries the continuation flag.

**Possible Causes**

The current call does not allow the continuation flag.

**Solution Steps**

Check whether the continuation flag is included.

## 16000011 Context Object Does Not Exist

**Error Message**

The context does not exist.

**Error Description**

This error code is returned when the context object does not exist.

**Possible Causes**

The current context object does not exist.

**Solution Steps**

Check whether the context object is available.

## 16000012 Application Controlled

**Error Message**

The application is controlled.

**Error Description**

This error code is returned when an application is controlled by the application market.

**Possible Causes**

The application is suspected of malicious behavior and is controlled by the application market, preventing it from being launched.

**Solution Steps**

It is recommended to uninstall the application.

## 16000013 Application Controlled by EDM

**Error Message**

The application is controlled by EDM.

**Error Description**

This error code is returned when an application is controlled by Enterprise Device Manager (EDM).

**Possible Causes**

The application is controlled by Enterprise Device Manager.

**Solution Steps**

Contact the relevant personnel of Enterprise Device Management.

## 16000015 Service Timeout

**Error Message**

Service timeout.

**Error Description**

This error code is returned when the service times out.

**Possible Causes**

The service timed out.

**Solution Steps**

The service timed out. Please try again later.

## 16000017 Previous Ability Not Started: Queued for Subsequent Launch

**Error Message**

Another ability is being started. Wait until it finishes starting.

**Error Description**

Too many abilities need to be started. Due to limited system processing capacity, requests are queued and processed in order.

**Possible Causes**

High system concurrency.

**Solution Steps**

No action is required. Wait for the launch to complete.

## 16000018 Third-Party Application Redirection Restricted for API Version 11 and Above

**Error Message**

Redirection to a third-party application is not allowed in API version 11 or later.

**Error Description**

When the application API version is greater than 11, explicit redirection to other third-party applications is not allowed.

**Solution Steps**Use implicit startup or jump to other applications via `openLink`.

## 16000019 No Matching Application Found for Implicit Startup

**Error Message**

No matching ability is found.

**Error Description**

No matching Ability was found during implicit startup.

**Resolution Steps**

Modify the matching criteria for implicit startup.

## 16000050 Internal Error

**Error Message**

Internal error.

**Error Description**

This error code is returned when internal processing errors occur, such as memory allocation or multithreading exceptions.

**Possible Causes**

General kernel errors related to memory allocation, multithreading, etc. Specific causes may include: null internal objects, processing timeout, failure to obtain application information from package management, failure to acquire system services, reaching the upper limit of launched ability instances, etc.

**Resolution Steps**

1. Verify whether the system has sufficient memory and whether the device's system version is abnormal.
2. Check if too many abilities have been launched.
3. Try restarting the device.

## 16000051 Network Error

**Error Message**

Network error.

**Error Description**

This error code is returned when a network exception occurs.

**Possible Causes**

Network is unavailable.

**Resolution Steps**

Retry later or reconnect to the network.

## 16000052 Installation-Free Not Supported

**Error Message**

Installation-free is not supported.

**Error Description**

This error code is returned when the current application does not support installation-free.

**Possible Causes**

The application package does not meet installation-free requirements, such as exceeding the size limit.

**Resolution Steps**

Check whether the application supports installation-free.

## 16000053 Not a Top-Level Application

**Error Message**

The ability is not on the top of the UI.

**Error Description**

This error code is returned when the current application is not displayed at the top of the UI.

**Possible Causes**

The application must be in the foreground for installation-free startup, but it is not displayed at the top of the UI.

**Resolution Steps**

Check whether the current application is displayed at the top of the UI.

## 16000054 Installation-Free Service Busy

**Error Message**

The installation-free service is busy. Try again later.

**Error Description**

This error code is returned when the installation-free service is busy.

**Possible Causes**

A download or installation task for the same atomic service is already in progress.

**Resolution Steps**

The installation-free service is busy. Retry later.

## 16000055 Installation-Free Timeout

**Error Message**

Installation-free timed out.

**Error Description**

This error code is returned when installation-free times out.

**Possible Causes**

Installation-free has timed out.

**Resolution Steps**

Installation-free timed out. Retry later.

## 16000056 Installation-Free Not Allowed for Other Applications

**Error Message**

Installation-free is not allowed for other applications.

**Error Description**

This error code is returned when attempting installation-free for other applications.

**Possible Causes**

Installation-free is not allowed for other applications.

**Resolution Steps**

Confirm that the correct application is being installed installation-free.

## 16000057 Cross-Device Installation-Free Not Supported

**Error Message**

Cross-device installation-free is not supported.

**Error Description**

This error code is returned when attempting cross-device installation-free.

**Possible Causes**

Cross-device installation-free is not supported.

**Resolution Steps**

Confirm that the application is not for cross-device installation-free.

## 16000058 Invalid URI Flag Specified

**Error Message**

Invalid URI flag.

**Error Description**

The specified URI flag is invalid.

**Possible Causes**

Incorrect parameters were passed.

**Resolution Steps**

Verify that the passed parameters belong to URI flags.

## 16000059 Invalid URI Type Specified

**Error Message**

Invalid URI type.

**Error Description**

The specified URI type is invalid.

**Possible Causes**

Incorrect parameters were passed. Currently, URI authorization management only supports file-type URIs.

**Resolution Steps**

Verify that the passed parameters belong to supported URI types.

## 16000060 Sandbox Application Cannot Grant URI Permission

**Error Message**

A sandbox application cannot grant URI permission.

**Error Description**

This error code is returned when a sandbox application attempts to grant URI permission.

**Possible Causes**

Sandbox applications are not allowed to grant URI permissions.

**Resolution Steps**

Confirm that the application is not a sandbox application.

## 16000061 Operation Not Supported

**Error Message**

Operation not supported.

**Error Description**

This error code is returned when the operation is not supported on the current system.

**Possible Causes**

The operation is not supported on the current system.

**Resolution Steps**

Verify whether the operation is supported on the current system.

## 16000062 Child Process Limit Exceeded

**Error Message**

The number of child processes exceeds the upper limit.

**Error Description**

This error code is returned when the number of child processes created has reached the upper limit during a child process creation request.

**Possible Causes**

The number of child processes created has reached the upper limit.

**Resolution Steps**

Verify whether the number of child processes has reached the upper limit. The upper limit for child processes is 512.

## 16000063 Invalid Component Specified for Application Restart

**Error Message**

The target to restart does not belong to the current application or is not a UIAbility.

**Error Description**

This error code is returned when the specified component name or type is invalid during application restart to launch a specific component.

**Possible Causes**

The specified component name or type is invalid.

**Resolution Steps**

Confirm that the specified component name belongs to the current application and is of type UIAbility.

## 16000064 Application Restart Too Frequent

**Error Message**

Restart too frequently. Try again at least 10s later.

**Error Description**

This error code is returned when attempting to restart the application to launch a specific component within 10 seconds of the previous call.

**Possible Causes**

The interface was called too frequently.

**Resolution Steps**

Retry after at least 10 seconds.

## 16000065 API Can Only Be Called When Ability Is in Foreground

**Error Message**

The API can be called only when the ability is running in the foreground.

**Error Description**

This error code is returned when the Ability is not in the foreground.

**Possible Causes**When calling the interface, the Ability is not in the foreground.

**Handling Steps**

Switch the Ability to the foreground before calling the interface.

## 16000066 Wukong Mode: Moving Ability to Foreground/Background Not Allowed

**Error Message**

An ability cannot switch to the foreground or background in Wukong mode.

**Error Description**

This error code is returned when attempting to move an Ability to the foreground or background in Wukong mode.

**Possible Causes**

Wukong mode does not allow moving an Ability to the foreground or background.

**Handling Steps**

Exit Wukong mode before attempting to move the Ability to the foreground or background. Do not move the Ability to the foreground or background while in Wukong mode.

## 16000067 Ability Startup Parameter Validation Failed

**Error Message**

The StartOptions check failed.

**Error Description**

This error code is returned when parameter validation related to StartOptions fails.

**Possible Causes**

1. When calling `startAbility`, if `processMode` is set to `NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM` or `ATTACH_TO_STATUS_BAR_ITEM` but the application does not have an icon in the status bar, this error code is returned.
2. When calling `showAbility`/`hideAbility`, if the caller was not started in `NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM` or `ATTACH_TO_STATUS_BAR_ITEM` mode, this error code is returned.

**Handling Steps**

Verify the StartOptions parameter configuration and ensure all constraints are met.

## 16000068 Ability Already Running

**Error Message**

The ability is already running.

**Error Description**

This error code is returned when the target Ability is already running.

**Possible Causes**

When calling `startAbility`, if `processMode` and `startupVisibility` are specified, the target Ability's `launchType` is `singleton` or `specified`, and the target Ability is already running, this error code is returned.

**Handling Steps**

If the target Ability's `launchType` is `singleton` or `specified`, avoid repeatedly calling `startAbility` with `processMode` and `startupVisibility` specified.

## 16000069 Extension Cannot Start Third-Party Applications in Strict Mode

**Error Message**

The extension cannot start the third-party application.

**Error Description**

In strict mode, this type of Extension is not allowed to start third-party applications.

**Possible Causes**

The current Extension is in strict mode, and the corresponding Extension type does not allow starting other third-party applications in strict mode.

**Handling Steps**

1. Check the conditions for enabling strict mode for the corresponding Extension type.
2. Start the current Extension in non-strict mode.

## 16000070 Extension Cannot Start Specified ServiceExtensionAbility in Strict Mode

**Error Message**

The extension cannot start the service.

**Error Description**

In strict mode, this type of Extension is not allowed to start the specified ServiceExtensionAbility.

**Possible Causes**

The current Extension is in strict mode, and the corresponding Extension type does not allow starting the specified ServiceExtensionAbility in strict mode.

**Handling Steps**

1. Check the conditions for enabling strict mode for the corresponding Extension type.
2. Start the current Extension in non-strict mode.

## 16000071 App Clone Mode Not Supported

**Error Message**

App clone is not supported.

**Error Description**

This error code is returned when the application does not support clone mode.

**Possible Causes**

This error code is returned when calling `getCurrentAppCloneIndex` in an application that does not support app cloning.

**Handling Steps**

Avoid calling `getCurrentAppCloneIndex` in applications that do not support app cloning.

<!--Del-->
## 16000072 App Multi-Instance Not Supported

**Error Message**

App clone or multi-instance is not supported.

**Error Description**

This error code is returned when the application does not support multi-instance mode.

**Possible Causes**

This error code is returned when calling `getRunningMultiAppInfo` to query multi-instance information for an application that does not support multi-instance.

**Handling Steps**

Ensure the application supports multi-instance before calling `getCurrentAppCloneIndex`.
<!--DelEnd-->

## 16000073 Invalid appCloneIndex Value

**Error Message**

The app clone index is invalid.

**Error Description**

This error code is returned when an invalid `appCloneIndex` is passed.

**Possible Causes**

1. When calling `startAbility`, if the `appCloneIndex` carried by `ohos.extra.param.key.appCloneIndex` is invalid, this error code is returned.
<!--Del-->
2. When calling `isAppRunning`, if the input parameter `appCloneIndex` is invalid, this error code is returned.
<!--DelEnd-->

**Handling Steps**

Ensure the `appCloneIndex` meets all constraints.

## 16000074 Caller Not Found for Specified requestCode

**Error Message**

The caller does not exist.

**Error Description**

When returning results to the caller via the `backToCallerAbilityResult` interface, this error code is returned if the caller cannot be found based on the provided `requestCode`.

**Possible Causes**

1. The `requestCode` was not obtained from the `CALLER_REQUEST_CODE` field in the `want`.
2. The caller corresponding to the `requestCode` has already been destroyed or the result has already been returned.

**Handling Steps**

1. Confirm whether the `requestCode` was obtained from the `CALLER_REQUEST_CODE` in the `want`.
2. Confirm whether the caller has been destroyed or the result has already been returned.

## 16000075 Returning to Caller Not Supported

**Error Message**

Not support back to caller.

**Error Description**

This error code is returned when returning to the caller via the `backToCallerAbilityWithResult` interface is not supported.

**Possible Causes**

The current application has not configured `linkFeature` or has not passed system review.

**Handling Steps**

1. Ensure the current application has configured the `linkFeature` field in the `module.json5` file.
2. Ensure the declared `linkFeature` value is correct, matches the actual functionality of the application link, and the application has passed system review.

## 16000076 Specified APP_INSTANCE_KEY Does Not Exist

**Error Message**

The APP_INSTANCE_KEY is invalid.

**Error Description**

This error code is returned when the specified `APP_INSTANCE_KEY` does not exist.

**Possible Causes**

The application instance does not contain the instance specified by the `APP_INSTANCE_KEY`.

**Handling Steps**

Ensure the provided `APP_INSTANCE_KEY` is valid.

## 16000077 Maximum Number of Application Instances Reached

**Error Message**

The number of app instances reaches the limit.

**Error Description**

This error code is returned when attempting to create a new application instance after the maximum number of instances has been reached.

**Possible Causes**

The number of application instances was not checked against the self-configured upper limit before creating a new instance.

**Handling Steps**

Adjust the configured upper limit for application instances or delete existing instances before creating new ones.

## 16000078 Multi-Instance Not Supported

**Error Message**

The multi-instance is not supported.

**Error Description**

The application does not support multi-instance.

**Possible Causes**

1. The target application is not configured for multi-instance.
2. The current device type does not support multi-instance.

**Handling Steps**

1. Configure the target application for multi-instance.
2. Call this method on a 2-in-1 device.

## 16000079 Specifying APP_INSTANCE_KEY Not Supported

**Error Message**

The APP_INSTANCE_KEY cannot be specified.

**Error Description**

`APP_INSTANCE_KEY` and `CREATE_APP_INSTANCE_KEY` cannot be specified simultaneously. This error code is returned when `APP_INSTANCE_KEY` is specified along with `CREATE_APP_INSTANCE_KEY`.

**Possible Causes**

Too many parameters were provided.

**Handling Steps**

Only one of `APP_INSTANCE_KEY` or `CREATE_APP_INSTANCE_KEY` can be specified.

## 16000080 Creating New Instance Not Supported

**Error Message**

Creating an instance is not supported.

**Error Description**

Applications are only allowed to use `CREATE_APP_INSTANCE_KEY` to create their own instances. Starting another application with `CREATE_APP_INSTANCE_KEY` is not allowed. Otherwise, this error code is returned.

**Possible Causes**

Incorrect usage scenario for the parameter.

**Handling Steps**

Remove the `CREATE_APP_INSTANCE_KEY` parameter.

## 16000082 UIAbility in Singleton Mode Not Fully Started

**Error Message**

The UIAbility is being started.

**Error Description**If the UIAbility startup mode is "singleton", the startup interface cannot be called again before the UIAbility startup is completed; otherwise, this error code will be returned.

**Possible Causes**

The UIAbility is in singleton mode and is currently starting up.

**Resolution**

Ensure the UIAbility startup is completed before initiating a new startup task.

## 16000100 AbilityMonitor Methods for Monitoring Ability Lifecycle Changes Failed

**Error Messages**

- Calling AddAbilityMonitor failed.
- Calling AddAbilityMonitorSync failed.
- Calling RemoveAbilityMonitor failed.
- Calling RemoveAbilityMonitorSync failed.
- Calling WaitAbilityMonitor failed.
- Calling GetCurrentTopAbility failed.
- Calling DoAbilityForeground failed.
- Calling DoAbilityBackground failed.
- Calling FinishTest failed.
- Calling AddAbilityStageMonitor failed.
- Calling AddAbilityStageMonitorSync failed.
- Calling RemoveAbilityStageMonitor failed.
- Calling RemoveAbilityStageMonitorSync failed.
- Calling WaitAbilityStageMonitor failed.

**Error Description**

This error code is returned when methods for monitoring specified Ability lifecycle changes via AbilityMonitor fail.

**Possible Causes**

Failed to create an AbilityDelegatorRegistry instance.

**Resolution**

Verify whether the AbilityDelegatorRegistry instance was successfully created.

## 16000101 Failed to Execute Shell Command

**Error Message**

Failed to run the shell command.

**Error Description**

This error code is returned when the command is not a valid shell command.

**Possible Causes**

The command is not a valid shell command.

**Resolution**

Check whether the command is a valid shell command.

## 16000151 Invalid wantAgent Object

**Error Message**

Invalid wantAgent object.

**Error Description**

This error code is returned when the wantAgent object passed to the interface is invalid.

**Possible Causes**

The wantAgent object passed to the interface is invalid.

**Resolution**

Verify the wantAgent object passed to the interface.

## 16000152 wantAgent Object Not Found

**Error Message**

The wantAgent object does not exist.

**Error Description**

This error code is returned when the wantAgent object passed to the interface does not exist.

**Possible Causes**

The wantAgent object passed to the interface does not exist.

**Resolution**

Check whether the wantAgent object passed to the interface is valid.

## 16000153 wantAgent Object Canceled

**Error Message**

The wantAgent object has been canceled.

**Error Description**

This error code is returned when the wantAgent object passed to the interface has been canceled.

**Possible Causes**

The triggered wantAgent passed to the interface has been canceled.

**Resolution**

Check whether the triggered wantAgent object has been canceled.

## 16100001 Ability with Specified URI Does Not Exist

**Error Message**

The ability with the specified URI does not exist.

**Error Description**

This error code is returned when the Ability with the specified URI does not exist.

**Possible Causes**

The queried Ability does not exist.

**Resolution**

Confirm whether the queried Ability exists.

## 16100002 Incorrect Ability Type in Interface Call

**Error Message**

Incorrect ability type.

**Error Description**

This error code is returned when the Ability type in the interface call is incorrect.

**Possible Causes**

The Ability type where the interface is called does not support this interface call.

**Resolution**

1. Verify whether the package name corresponds to the correct Ability.
2. Call different interfaces based on the Ability type.

## 16200001 Common Component Client (Caller) Released

**Error Message**

The caller has been released.

**Error Description**

This error code is returned when the common component client (Caller) has been released.

**Possible Causes**

The common component client (Caller) has been released.

**Resolution**

1. Re-register a valid common component client calling interface.
2. Check whether the Ability corresponding to the context is still running when calling `context.startAbility`. If the Ability has been destroyed, this error code will be thrown.
3. If there are consecutive calls to `startAbility` and `terminateSelf`, ensure that `terminateSelf` is called only after receiving the success or failure callback of `startAbility`.

## 16200002 Common Component Server (Callee) Invalid

**Error Message**

The callee does not exist.

**Error Description**

This error code is returned when the common component server (Callee) is invalid.

**Possible Causes**

The common component server (Callee) does not exist.

**Resolution**

Verify whether the common component server exists.

## 16200003 Release Failed

**Error Message**

Release error. The caller does not call any callee.

**Error Description**

This error code is returned when the release operation fails.

**Possible Causes**

The common component client (Caller) object has not registered any common component server (Callee).

**Resolution**

Check whether the common component server has been registered.

## 16200004 Method Already Registered

**Error Message**

The method has been registered.

**Error Description**

This error code is returned when the method has already been registered.

**Possible Causes**

The method has already been registered in the common component server.

**Resolution**

Check whether the method has already been registered.

## 16200005 Method Not Registered

**Error Message**

The method has not been registered.

**Error Description**

This error code is returned when the method has not been registered.

**Possible Causes**

The method has not been registered in the common component server.

**Resolution**

Check whether the method has not been registered.

## 16200006 No Permission to Set Resident Process Enable Status

**Error Message**

The caller application can only set the resident status of the configured process.

**Error Description**

This error code is returned when the caller lacks permission to set the resident process enable status.

**Possible Causes**

The caller lacks permission to configure the resident process enable status.

**Resolution**

Query the caller's resident process enable configuration permission from the database during interface calls.

## 16300001 Specified Task Not Found

**Error Message**

Mission not found.

**Error Description**

This error code is returned when the specified task does not exist.

**Possible Causes**

The target task for the operation does not exist.

**Resolution**

Confirm whether the task exists.

## 16300002 Specified Task Listener Not Found

**Error Message**

The specified mission listener does not exist.

**Error Description**

This error code is returned when the specified task listener does not exist.**Possible Causes**

The target task listener for the operation does not exist.

**Resolution Steps**

Verify whether the target task listener exists.

## 16300003 Target Application Is Not the Current Application

**Error Message**

The target application is not the current application.

**Error Description**

This error code is returned when the launched application is not the current application.

**Possible Causes**

The launched application and the calling application are not the same.

**Resolution Steps**

Confirm whether the launched application is the current application.

## 18500001 Invalid Specified Bundle Name

**Error Message**

The bundle does not exist or no patch has been applied.

**Error Description**

This error code is returned when the specified bundle name is invalid.

**Possible Causes**

The target bundle to be queried does not exist or is not installed.

**Resolution Steps**

Verify whether the queried application is installed.

## 18500002 Invalid Specified Patch Package

**Error Message**

Invalid patch package.

**Error Description**

This error code is returned when the specified patch package is invalid, does not exist, or is inaccessible.

**Possible Causes**

The patch package file to be installed does not exist or cannot be accessed.

**Resolution Steps**

1. Check whether the provided patch package file path is valid.
2. Verify whether you have permission to access the patch package file.

## 18500003 Patch Package Deployment Failed

**Error Message**

Failed to deploy the patch.

**Error Description**

This error code is returned when the patch package deployment fails.

**Possible Causes**

1. The `type` in `patch.json` must be either `patch` or `hotreload`; otherwise, deployment fails.
2. If the HAP package corresponding to `bundleName` is not installed, deployment fails.
3. `bundleName` and `versionCode` must match those of the installed HAP application. For `patch` type, `versionName` must also match; otherwise, deployment fails.
4. If a patch package has already been deployed, the `versionCode` of the new patch package must be greater than that of the previous one; otherwise, deployment fails.
5. For `patch`-type patches, signature verification is performed. The signing certificate must match that of the application; otherwise, deployment fails.
6. When deploying a `patch`-type patch package in debug mode, if the currently used patch package is of `hotreload` type, deployment fails.
7. When deploying a `hotreload`-type patch package in debug mode, if the currently used patch package is of `patch` type, deployment fails. In release mode, deployment fails.

**Resolution Steps**

Ensure the patch package complies with the rules.

## 18500004 Patch Package Enablement Failed

**Error Message**

Failed to enable the patch package.

**Error Description**

This error code is returned when enabling the patch package fails.

**Possible Causes**

The patch package status is incorrect during enablement.

**Resolution Steps**

Check the patch package status.

## 18500005 Patch Package Removal Failed

**Error Message**

Failed to remove the patch package.

**Error Description**

This error code is returned when removing the patch package fails.

**Possible Causes**

The patch package status is incorrect during removal of the old patch.

**Resolution Steps**

Check the patch package status.

## 18500006 Patch Loading Failed

**Error Message**

Failed to load the patch.

**Error Description**

This error code is returned when loading the patch fails.

**Possible Causes**

The Ark engine failed to load the patch.

**Resolution Steps**

Verify whether the patch package is correct.

## 18500007 Old Patch Unloading Failed

**Error Message**

Failed to unload the patch.

**Error Description**

This error code is returned when the Ark engine fails to unload the old patch.

**Possible Causes**

The Ark engine failed to unload the patch.

**Resolution Steps**

Verify whether the patch package is correct.

## 18500008 Quick Fix Internal Error

**Error Message**

Internal error.

**Error Description**

This error code is returned when internal processing errors occur, such as memory allocation or multithreading exceptions.

**Possible Causes**

Generic kernel errors, such as memory allocation or multithreading issues.

**Resolution Steps**

Ensure sufficient system memory is available.

## 18500009 Ongoing Quick Fix Task for the Application

**Error Message**

The application has an ongoing quick fix task.

**Error Description**

This error code is returned when the application has an ongoing quick fix task.

**Possible Causes**

The specified application for quick fix rollback has an ongoing quick fix task.

**Resolution Steps**

Wait for the quick fix task to complete.

## 16300004 Specified Observer Does Not Exist

**Error Message**

Observer not found.

**Error Description**

This error code is returned when the listener does not exist.

**Possible Causes**

The current listener does not exist or has been unregistered.

**Resolution Steps**

Check for duplicate listener unregistration.

## 16300005 Specified Bundle Information Does Not Exist

**Error Message**

The target bundle does not exist.

**Error Description**

This error code is returned when the bundle information for the preloaded application does not exist.

**Possible Causes**

Incorrect `bundleName`, `userId`, or `appIndex` for the preloaded application, resulting in failure to query the relevant bundle information.

**Resolution Steps**

Verify the correctness of the `bundleName`, `userId`, and `appIndex` parameters.

## 29600001 Image Editing Internal Error

**Error Message**

Internal error.

**Error Description**

This error code is returned when internal errors occur during image saving, such as memory allocation or multithreading exceptions.

**Possible Causes**

Generic kernel errors, such as memory allocation or multithreading issues. Specific causes may include null internal objects, processing timeouts, etc.

**Resolution Steps**

1. Ensure sufficient system memory is available and check for anomalies in the device's system version.
2. Try restarting the device.

## 29600002 Image Input Error

**Error Message**

Image input error.

**Error Description**

This error code is returned when the image URI does not exist or the image cannot be parsed.

**Possible Causes**

The URI does not exist or the URI points to a non-image file.

**Resolution Steps**

Verify the file's existence and ensure it is an image file.

## 29600002 Image Size Exceeds Limit

**Error Message**

Image too big.

**Error Description**

The input image size exceeds the limit.

**Possible Causes**

This error code is returned when the input image size exceeds 50 MB.

**Resolution Steps**

1. Try to reduce the edited image size to under 50 MB.
2. Validate the image size.

## 16300007 Specified Atomic Service Download/Install Task Does Not Exist

**Error Message**

The target free install task does not exist.

**Error Description**

This error code is returned when the specified atomic service download/install task does not exist while opening a window for the atomic service.

**Possible Causes**The passed `bundleName`, `moduleName`, `abilityName`, or `startTime` is incorrect, resulting in failure to query the download and installation task information of the related atomic service.

**Resolution Steps**

Verify whether the parameters `bundleName`, `moduleName`, `abilityName`, or `startTime` are correctly passed.