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

**Resolution Steps**

1. Verify that the `bundleName`, `moduleName`, and `abilityName` in the `want` are correct.
2. Check whether the application corresponding to the `bundleName` in the `want` is installed. Use the following command to query the list of installed applications. If the `bundleName` is not in the query results, the application is not installed successfully.

    ```text
    hdc shell bm dump -a
    ```

3. For multi-HAP applications, confirm whether the HAP to which the ability belongs has been installed. Use the following command to query the package information of the application. If the corresponding HAP and ability are not found in the installed application, the HAP to which the ability belongs has not been installed.

    ```text
    hdc shell bm dump -n package_name
    ```

## 16000002 Incorrect Ability Type

**Error Message**

Incorrect ability type.

**Error Description**

This error code is returned when the interface is called with an incorrect ability type.

**Possible Causes**

The ability type where the interface is called does not support this interface call.

**Resolution Steps**

1. Verify that the `bundleName`, `moduleName`, and `abilityName` in the `want` are correct.
2. Call different interfaces based on the ability type.

## 16000003 The Specified ID Does Not Exist

**Error Message**

The specified ID does not exist.

**Error Description**

This error code is returned when the specified ID does not exist.

**Possible Causes**

The target ID for the operation does not exist.

**Resolution Steps**

Confirm whether the ID for the operation exists.

## 16000004 Visibility Verification Failed

**Error Message**

Failed to start the invisible ability.

**Error Description**

This error code is returned when visibility verification fails.

**Possible Causes**

Application visibility verification failed.

**Resolution Steps**

1. In the Stage model, if exception 16000004 is thrown when launching an application, it indicates that the called application failed. Check whether the `exported` configuration in the `Ability` field of the called application's `module.json5` is set to `true`. If `exported` is `true`, the ability can be called by other applications; if `false`, it cannot.
2. If an application needs to launch an ability with `exported` set to `false`, apply for the `ohos.permission.START_INVISIBLE_ABILITY` permission (this permission is only available to system applications).

## 16000005 Specified Process Permission Verification Failed

**Error Message**

The specified process does not have the permission.

**Error Description**

This error code is returned when the specified process permission verification fails.

**Possible Causes**

The specified process permission verification failed.

**Resolution Steps**

Confirm whether the permissions of the specified process are correct.

## 16000006 Cross-User Operations Are Not Allowed

**Error Message**

Cross-user operations are not allowed.

**Error Description**

This error code is returned when an application performs cross-user operations.

**Possible Causes**

The application performed cross-user operations.

**Resolution Steps**

Confirm whether cross-user operations were performed.

## 16000007 Service Busy

**Error Message**

Service busy. There are concurrent tasks. Try again later.

**Error Description**

This error code is returned when the service is busy.

**Possible Causes**

The service is busy.

**Resolution Steps**

The service is busy. Please try again later.

## 16000008 Crowdtesting Application Expired

**Error Message**

The crowdtesting application expires.

**Error Description**

This error code is returned when a crowdtesting application expires.

**Possible Causes**

The crowdtesting application has expired and cannot be opened.

**Resolution Steps**

Check whether the crowdtesting application has expired. Expired crowdtesting applications cannot be launched.

## 16000009 Wukong Mode: Starting/Stopping Ability Not Allowed

**Error Message**

An ability cannot be started or stopped in Wukong mode.

**Error Description**

This error code is returned when starting or stopping an ability in Wukong mode.

**Possible Causes**

Starting or stopping an ability is not allowed in Wukong mode.

**Resolution Steps**

Exit Wukong mode before attempting to start or stop the ability. Do not start or stop abilities in Wukong mode.

## 16000010 Continuation Flag Not Allowed

**Error Message**

The call with the continuation flag is forbidden.

**Error Description**

This error code is returned when a call carries a continuation flag.

**Possible Causes**

The current call does not allow the continuation flag.

**Resolution Steps**

Check whether the continuation flag is included.

## 16000011 Context Object Does Not Exist

**Error Message**

The context does not exist.

**Error Description**

This error code is returned when the context object does not exist.

**Possible Causes**

The current context object does not exist.

**Resolution Steps**

Check whether the context object is available.

## 16000012 Application Controlled

**Error Message**

The application is controlled.

**Error Description**

This error code is returned when an application is controlled by the app market.

**Possible Causes**

The application is suspected of malicious behavior and is controlled by the app market, preventing it from being launched.

**Resolution Steps**

It is recommended to uninstall the application.

## 16000013 Application Controlled by EDM

**Error Message**

The application is controlled by EDM.

**Error Description**

This error code is returned when an application is controlled by Enterprise Device Manager (EDM).

**Possible Causes**

The application is controlled by enterprise device management.

**Resolution Steps**

Contact the relevant personnel for enterprise device management.

## 16000015 Service Timeout

**Error Message**

Service timeout.

**Error Description**

This error code is returned when the service times out.

**Possible Causes**

The service timed out.

**Resolution Steps**

The service timed out. Please try again later.

## 16000017 Previous Ability Not Started: Queued for Subsequent Launch

**Error Message**

Another ability is being started. Wait until it finishes starting.

**Error Description**

Too many abilities need to be started. Due to limited system processing capacity, requests are queued and processed sequentially.

**Possible Causes**

High system concurrency.

**Resolution Steps**

No action is required. Wait for the launch to complete.

## 16000018 Third-Party Application Redirection Restricted for API Version 11+

**Error Message**

Redirection to a third-party application is not allowed in API version 11 or later.

**Error Description**

When the application API version is greater than 11, explicit redirection to other third-party applications is not allowed.

**Resolution Steps**

Use implicit startup or redirect to other applications via `openLink`.

## 16000019 No Matching Ability Found for Implicit Startup

**Error Message**

No matching ability is found.

**Error Description**

No matching ability is found for implicit startup.

**Resolution Steps**

Modify the matching criteria for implicit startup.

## 16000050 Internal Error

**Error Message**

Internal error.

**Error Description**

This error code is returned for internal processing errors such as memory allocation or multi-threading exceptions.

**Possible Causes**

General kernel errors related to memory allocation, multi-threading, etc. Specific causes may include: internal objects being null, processing timeouts, failure to obtain application information from package management, failure to obtain system services, reaching the upper limit of launched ability instances, etc.

**Resolution Steps**

1. Verify whether the system has sufficient memory and whether the device's system version is abnormal.
2. Check whether too many abilities have been launched.
3. Try restarting the device.

## 16000051 Network Error

**Error Message**

Network error.

**Error Description**

This error code is returned when a network error occurs.

**Possible Causes**

The network is unavailable.

**Resolution Steps**

A network error occurred. Please try again later or reconnect to the network.

## 16000052 Installation-Free Not Supported

**Error Message**

Installation-free is not supported.

**Error Description**

This error code is returned when the current application does not support installation-free.

**Possible Causes**

The application package does not meet the installation-free requirements, such as exceeding the package size limit.

**Resolution Steps**

Check whether the application supports installation-free.

## 16000053 Ability Not on Top of UI

**Error Message**

The ability is not on the top of the UI.

**Error Description**

This error code is returned when the current application is not displayed at the top of the UI.

**Possible Causes**

For installation-free startup, the application must be in the foreground, but it is not displayed at the top of the UI.

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

The installation-free service is busy. Please try again later.```markdown
## 16000055 Installation-Free Timeout

**Error Message**

Installation-free timed out.

**Error Description**

This error code is returned when the installation-free operation times out.

**Possible Causes**

Installation-free operation timed out.

**Resolution**

Retry the installation-free operation later.

## 16000056 Installation-Free Not Allowed for Other Applications

**Error Message**

Installation-free is not allowed for other applications.

**Error Description**

This error code is returned when attempting to perform installation-free for other applications.

**Possible Causes**

Installation-free is not permitted for other applications.

**Resolution**

Verify that the target application is correct for installation-free.

## 16000057 Cross-Device Installation-Free Not Supported

**Error Message**

Cross-device installation-free is not supported.

**Error Description**

This error code is returned when attempting cross-device installation-free.

**Possible Causes**

Cross-device installation-free is not supported.

**Resolution**

Ensure the installation-free operation is performed on the same device.

## 16000058 Invalid URI Flag Specified

**Error Message**

Invalid URI flag.

**Error Description**

The specified URI flag is invalid.

**Possible Causes**

Incorrect parameters were passed.

**Resolution**

Verify that the passed parameters are valid URI flags.

## 16000059 Invalid URI Type Specified

**Error Message**

Invalid URI type.

**Error Description**

The specified URI type is invalid.

**Possible Causes**

Incorrect parameters were passed. Currently, URI authorization management only supports file-type URIs.

**Resolution**

Ensure the passed parameters are of supported URI types.

## 16000060 Sandbox Application Cannot Grant URI Permission

**Error Message**

A sandbox application cannot grant URI permission.

**Error Description**

This error code is returned when a sandbox application attempts to grant URI permission.

**Possible Causes**

Sandbox applications are not allowed to grant URI permissions.

**Resolution**

Ensure the operation is performed by a non-sandbox application.

## 16000061 Operation Not Supported

**Error Message**

Operation not supported.

**Error Description**

This error code is returned when the operation is not supported on the current system.

**Possible Causes**

The operation is not supported on the current system.

**Resolution**

Verify whether the operation is supported on the current system.

## 16000062 Child Process Limit Exceeded

**Error Message**

The number of child processes exceeds the upper limit.

**Error Description**

This error code is returned when the number of child processes created reaches the upper limit (512).

**Possible Causes**

The maximum number of child processes has been reached.

**Resolution**

Check if the number of child processes has reached the limit (512).

## 16000063 Invalid Target Component for Application Restart

**Error Message**

The target to restart does not belong to the current application or is not a UIAbility.

**Error Description**

This error code is returned when the specified component name or type is invalid during application restart.

**Possible Causes**

The specified component name or type is invalid.

**Resolution**

Ensure the target component belongs to the current application and is a UIAbility.

## 16000064 Application Restart Too Frequent

**Error Message**

Restart too frequently. Try again at least 10s later.

**Error Description**

This error code is returned when attempting to restart an application within 10 seconds of the previous call.

**Possible Causes**

The API was called too frequently.

**Resolution**

Wait at least 10 seconds before retrying.

## 16000065 API Callable Only in Foreground Ability

**Error Message**

The API can be called only when the ability is running in the foreground.

**Error Description**

This error code is returned when the ability is not in the foreground.

**Possible Causes**

The ability was not in the foreground during the API call.

**Resolution**

Switch the ability to the foreground before calling the API.

## 16000066 Ability Foreground/Background Switch Prohibited in Wukong Mode

**Error Message**

An ability cannot switch to the foreground or background in Wukong mode.

**Error Description**

This error code is returned when attempting to move an ability to the foreground/background in Wukong mode.

**Possible Causes**

Wukong mode prohibits foreground/background switching for abilities.

**Resolution**

Exit Wukong mode before attempting the operation. Do not switch abilities in Wukong mode.

## 16000067 StartOptions Validation Failed

**Error Message**

The StartOptions check failed.

**Error Description**

This error code is returned when StartOptions parameter validation fails.

**Possible Causes**

1. `processMode` is set to `NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM` or `ATTACH_TO_STATUS_BAR_ITEM`, but the application has no status bar icon.
2. The caller of `showAbility`/`hideAbility` was not started with `NEW_PROCESS_ATTACH_TO_STATUS_BAR_ITEM` or `ATTACH_TO_STATUS_BAR_ITEM` mode.

**Resolution**

Verify StartOptions parameters and ensure constraints are met.

## 16000068 Ability Already Running

**Error Message**

The ability is already running.

**Error Description**

This error code is returned when the target ability is already running.

**Possible Causes**

`startAbility` was called with `processMode` and `startupVisibility` specified, but the target ability (with `launchType` as `singleton` or `specified`) is already running.

**Resolution**

Avoid duplicate `startAbility` calls for singleton/specified abilities with `processMode` and `startupVisibility`.

## 16000069 Strict Mode Prohibits Third-Party App Launch by Extension

**Error Message**

The extension cannot start the third party application.

**Error Description**

In strict mode, certain extension types cannot launch third-party apps.

**Possible Causes**

The current extension is in strict mode, and its type prohibits third-party app launches.

**Resolution**

1. Check strict mode conditions for the extension type.
2. Launch the extension in non-strict mode.

## 16000070 Strict Mode Prohibits ServiceExtensionAbility Launch by Extension

**Error Message**

The extension cannot start the service.

**Error Description**

In strict mode, certain extension types cannot launch specified ServiceExtensionAbility.

**Possible Causes**

The current extension is in strict mode, and its type prohibits ServiceExtensionAbility launches.

**Resolution**

1. Check strict mode conditions for the extension type.
2. Launch the extension in non-strict mode.

## 16000071 App Clone Not Supported

**Error Message**

App clone is not supported.

**Error Description**

This error code is returned when the application does not support clone mode.

**Possible Causes**

`getCurrentAppCloneIndex` was called in a non-clone-supported app.

**Resolution**

Avoid calling `getCurrentAppCloneIndex` in unsupported apps.

<!--Del-->
## 16000072 App Clone or Multi-Instance Not Supported

**Error Message**

App clone or multi-instance is not supported.

**Error Description**

This error code is returned when the application does not support multi-instance.

**Possible Causes**

`getRunningMultiAppInfo` was called for a non-multi-instance-supported app.

**Resolution**

Ensure the target app supports multi-instance before calling `getCurrentAppCloneIndex`.
<!--DelEnd-->

## 16000073 Invalid appCloneIndex

**Error Message**

The app clone index is invalid.

**Error Description**

This error code is returned when an invalid `appCloneIndex` is passed.

**Possible Causes**

1. `startAbility` was called with an invalid `appCloneIndex` in `ohos.extra.param.key.appCloneIndex`.
<!--Del-->
2. `isAppRunning` was called with an invalid `appCloneIndex`.
<!--DelEnd-->

**Resolution**

Verify `appCloneIndex` constraints.

## 16000074 Caller Not Found for Result Return

**Error Message**

The caller does not exist.

**Error Description**

This error code is returned when the caller cannot be found via `requestCode` in `backTocallerAbilityResult`.

**Possible Causes**

1. `requestCode` was not obtained from the `CALLER_REQUEST_CODE` field in `want`.
2. The caller was destroyed or the result was already returned.

**Resolution**

1. Ensure `requestCode` is from `CALLER_REQUEST_CODE`.
2. Verify the caller's status.

## 16000075 Back-to-Caller Not Supported

**Error Message**

Not support back to caller.

**Error Description**

This error code is returned when `backToCallerAbilityWithResult` is unsupported.

**Possible Causes**

The app lacks `linkFeature` configuration or failed system review.

**Resolution**

1. Configure `linkFeature` in `module.json5`.
2. Ensure `linkFeature` values match actual functionality and pass system review.

## 16000076 Invalid APP_INSTANCE_KEY

**Error Message**

The APP_INSTANCE_KEY is invalid.

**Error Description**

This error code is returned when the specified `APP_INSTANCE_KEY` does not exist.

**Possible Causes**

No instance matches the provided `APP_INSTANCE_KEY`.

**Resolution**

Ensure `APP_INSTANCE_KEY` is valid.
``````markdown
## 16000077 Maximum Number of Application Instances Reached

**Error Message**

The number of app instances reaches the limit.

**Error Description**

This error code is returned when attempting to create additional application instances after reaching the configured maximum limit.

**Possible Causes**

Failure to check whether the current instance count has reached the application's self-defined upper limit before creating new instances.

**Resolution Steps**

1. Adjust the configured maximum instance limit.
2. Delete existing instances before creating new ones.

## 16000078 Multi-Instance Not Supported

**Error Message**

The multi-instance is not supported.

**Error Description**

The application does not support multiple instances.

**Possible Causes**

1. Target application is not configured for multi-instance operation.
2. Current device type does not support multi-instance.

**Resolution Steps**

1. Configure multi-instance capability for the target application.
2. Invoke this method on 2-in-1 devices.

## 16000079 Specifying APP_INSTANCE_KEY Not Supported

**Error Message**

The APP_INSTANCE_KEY cannot be specified.

**Error Description**

This error occurs when both APP_INSTANCE_KEY and CREATE_APP_INSTANCE_KEY parameters are specified simultaneously.

**Possible Causes**

Excessive parameter input.

**Resolution Steps**

Use either APP_INSTANCE_KEY or CREATE_APP_INSTANCE_KEY, but not both.

## 16000080 Instance Creation Not Supported

**Error Message**

Creating an instance is not supported.

**Error Description**

Applications can only use CREATE_APP_INSTANCE_KEY to create their own instances. Cross-application instance creation during launch is prohibited.

**Possible Causes**

Incorrect parameter usage scenario.

**Resolution Steps**

Remove the CREATE_APP_INSTANCE_KEY parameter.

## 16000082 UIAbility Startup Incomplete in Singleton Mode

**Error Message**

The UIAbility is being started.

**Error Description**

For UIAbilities in "singleton" mode, startup interfaces cannot be called again before the initial startup completes.

**Possible Causes**

The UIAbility is currently initializing in singleton mode.

**Resolution Steps**

Ensure UIAbility startup completes before initiating new startup tasks.

## 16000100 AbilityMonitor Lifecycle Monitoring Failure

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

Returned when AbilityMonitor methods fail to monitor specified Ability lifecycle changes.

**Possible Causes**

Failure to create AbilityDelegatorRegistry instance.

**Resolution Steps**

Verify successful creation of AbilityDelegatorRegistry instance.

## 16000101 Shell Command Execution Failure

**Error Message**

Failed to run the shell command.

**Error Description**

Returned when executing invalid shell commands.

**Possible Causes**

Invalid shell command syntax.

**Resolution Steps**

Validate shell command correctness.

## 16000151 Invalid wantAgent Object

**Error Message**

Invalid wantAgent object.

**Error Description**

Returned when passing invalid wantAgent objects to interfaces.

**Possible Causes**

Invalid wantAgent object parameter.

**Resolution Steps**

Verify wantAgent object validity.

## 16000152 wantAgent Object Not Found

**Error Message**

The wantAgent object does not exist.

**Error Description**

Returned when non-existent wantAgent objects are passed to interfaces.

**Possible Causes**

Nonexistent wantAgent object.

**Resolution Steps**

Validate wantAgent object existence.

## 16000153 wantAgent Object Canceled

**Error Message**

The wantAgent object has been canceled.

**Error Description**

Returned when canceled wantAgent objects are passed to interfaces.

**Possible Causes**

Triggered wantAgent was previously canceled.

**Resolution Steps**

Check wantAgent object cancellation status.

## 16100001 URI-Specified Ability Not Found

**Error Message**

The ability with the specified URI does not exist.

**Error Description**

Returned when querying non-existent Abilities via URI.

**Possible Causes**

Target Ability doesn't exist.

**Resolution Steps**

Confirm Ability existence.

## 16100002 Incorrect Ability Type

**Error Message**

Incorrect ability type.

**Error Description**

Returned when interfaces are called with incompatible Ability types.

**Possible Causes**

Interface unsupported by current Ability type.

**Resolution Steps**

1. Verify package name matches correct Ability.
2. Use type-specific interfaces.

## 16200001 Caller Released

**Error Message**

The caller has been released.

**Error Description**

Returned when accessing released component clients.

**Possible Causes**

Caller component was garbage collected.

**Resolution Steps**

1. Re-register valid component client interfaces.
2. Verify context's Ability is still running when calling startAbility.
3. For sequential startAbility/terminateSelf calls, wait for startAbility callback before terminating.

## 16200002 Invalid Callee

**Error Message**

The callee does not exist.

**Error Description**

Returned when accessing invalid component servers.

**Possible Causes**

Nonexistent callee component.

**Resolution Steps**

Verify callee component existence.

## 16200003 Release Failure

**Error Message**

Release error. The caller does not call any callee.

**Error Description**

Returned during failed component release.

**Possible Causes**

Caller never registered any callee.

**Resolution Steps**

Confirm callee registration status.

## 16200004 Method Already Registered

**Error Message**

The method has been registered.

**Error Description**

Returned for duplicate method registrations.

**Possible Causes**

Method previously registered on callee.

**Resolution Steps**

Check method registration history.

## 16200005 Method Not Registered

**Error Message**

The method has not been registered.

**Error Description**

Returned for unregistered method calls.

**Possible Causes**

Method never registered on callee.

**Resolution Steps**

Verify method registration status.

## 16200006 Resident Process Permission Denied

**Error Message**

The caller application can only set the resident status of the configured process.

**Error Description**

Returned for unauthorized resident process configuration attempts.

**Possible Causes**

Caller lacks resident process enablement permissions.

**Resolution Steps**

Query caller's resident process permissions from database.

## 16300001 Mission Not Found

**Error Message**

Mission not found.

**Error Description**

Returned when accessing non-existent tasks.

**Possible Causes**

Target task doesn't exist.

**Resolution Steps**

Confirm task existence.

## 16300002 Mission Listener Not Found

**Error Message**

The specified mission listener does not exist.

**Error Description**

Returned when accessing non-existent task listeners.

**Possible Causes**

Target listener doesn't exist.

**Resolution Steps**

Verify listener existence.

## 16300003 Target Application Mismatch

**Error Message**

The target application is not the current application.

**Error Description**

Returned when launching external applications.

**Possible Causes**

Launched app differs from caller app.

**Resolution Steps**

Ensure target matches current application.
``````markdown
## 18500001 Invalid Specified Bundle Name

**Error Message**

The bundle does not exist or no patch has been applied.

**Error Description**

This error code is returned when the specified bundle name is invalid.

**Possible Causes**

The target bundle does not exist or is not installed.

**Resolution Steps**

Verify whether the target application is installed.

## 18500002 Invalid Specified Patch Package

**Error Message**

Invalid patch package.

**Error Description**

This error code is returned when the specified patch package is invalid, non-existent, or inaccessible.

**Possible Causes**

The target patch package file does not exist or is inaccessible.

**Resolution Steps**

1. Verify the validity of the provided patch package file path.
2. Check whether you have permission to access the patch package file.

## 18500003 Patch Package Deployment Failed

**Error Message**

Failed to deploy the patch.

**Error Description**

This error code is returned when patch package deployment fails.

**Possible Causes**

1. The `type` in `patch.json` must be either `patch` or `hotreload`; otherwise, deployment fails.
2. Deployment fails if the HAP package corresponding to `bundleName` is not installed.
3. `bundleName` and `versionCode` must match those of the installed HAP application. For `patch` type, `versionName` must also match; otherwise, deployment fails.
4. If a patch package has already been deployed, the `versionCode` of the new patch package must be greater than that of the previous one; otherwise, deployment fails.
5. For `patch`-type packages, signature verification is performed. The signing certificate must match that of the application; otherwise, deployment fails.
6. For debug versions deploying `patch`-type packages: if an active patch package is of `hotreload` type, deployment fails.
7. For debug versions deploying `hotreload`-type packages: if an active patch package is of `patch` type, deployment fails. For release versions, deployment always fails.

**Resolution Steps**

Verify whether the patch package complies with the rules.

## 18500004 Patch Package Enablement Failed

**Error Message**

Failed to enable the patch package.

**Error Description**

This error code is returned when patch package enablement fails.

**Possible Causes**

The patch package is in an incorrect state during enablement.

**Resolution Steps**

Check the patch package status.

## 18500005 Patch Package Deletion Failed

**Error Message**

Failed to remove the patch package.

**Error Description**

This error code is returned when patch package deletion fails.

**Possible Causes**

The patch package is in an incorrect state during deletion.

**Resolution Steps**

Check the patch package status.

## 18500006 Patch Loading Failed

**Error Message**

Failed to load the patch.

**Error Description**

This error code is returned when patch loading fails.

**Possible Causes**

The Ark engine failed to load the patch.

**Resolution Steps**

Verify the correctness of the patch package.

## 18500007 Old Patch Unloading Failed

**Error Message**

Failed to unload the patch.

**Error Description**

This error code is returned when the Ark engine fails to unload an old patch.

**Possible Causes**

The Ark engine failed to unload the patch.

**Resolution Steps**

Verify the correctness of the patch package.

## 18500008 Quick Fix Internal Error

**Error Message**

Internal error.

**Error Description**

This error code is returned for internal processing errors such as memory allocation or multithreading exceptions.

**Possible Causes**

Generic kernel errors related to memory allocation or multithreading.

**Resolution Steps**

Ensure sufficient system memory is available.

## 18500009 Ongoing Quick Fix Task for the Application

**Error Message**

The application has an ongoing quick fix task.

**Error Description**

This error code is returned when the application has an ongoing quick fix task.

**Possible Causes**

The target application for quick fix rollback has an ongoing quick fix task.

**Resolution Steps**

Wait for the quick fix task to complete.

## 16300004 Specified Observer Not Found

**Error Message**

observer not found.

**Error Description**

This error code is returned when the specified observer does not exist.

**Possible Causes**

The observer does not exist or has been unregistered.

**Resolution Steps**

Check for duplicate observer unregistration.

## 16300005 Specified Bundle Information Not Found

**Error Message**

The target bundle does not exist.

**Error Description**

This error code is returned when preloaded application bundle information does not exist.

**Possible Causes**

Incorrect `bundleName`, `userId`, or `appIndex` for preloading, resulting in missing bundle information.

**Resolution Steps**

Verify the correctness of the `bundleName`, `userId`, and `appIndex` parameters.

## 29600001 Image Editing Internal Error

**Error Message**

Internal error.

**Error Description**

This error code is returned for internal errors during image saving, such as memory allocation or multithreading exceptions.

**Possible Causes**

Generic kernel errors related to memory allocation or multithreading. Specific causes may include null internal objects or timeouts.

**Resolution Steps**

1. Ensure sufficient system memory and check for system version anomalies.
2. Try restarting the device.

## 29600002 Image Input Error

**Error Message**

Image input error.

**Error Description**

This error code is returned when the image URI does not exist or the image cannot be parsed.

**Possible Causes**

The URI does not exist or points to a non-image file.

**Resolution Steps**

Verify the file's existence and ensure it is an image file.

## 29600002 Image Size Exceeds Limit

**Error Message**

Image too big.

**Error Description**

The input image size exceeds the limit.

**Possible Causes**

This error code is returned when the input image size exceeds 50MB.

**Resolution Steps**

1. Try to keep the edited image size below 50MB.
2. Validate the image size.

## 16300007 Specified Atomic Service Download/Install Task Not Found

**Error Message**

The target free install task does not exist.

**Error Description**

This error code is returned when the specified atomic service download/install task does not exist during window opening.

**Possible Causes**

Incorrect `bundleName`, `moduleName`, `abilityName`, or `startTime`, resulting in missing atomic service download/install task information.

**Resolution Steps**

Verify the correctness of the `bundleName`, `moduleName`, `abilityName`, or `startTime` parameters.
```