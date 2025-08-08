# Package Management Subsystem Common Error Codes  

## 17700001 The specified bundleName does not exist  

**Error Message**  
The specified bundle name is not found.  

**Error Description**  
The bundleName passed when calling query or other interfaces does not exist.  

**Possible Causes**  
1. The entered bundleName is incorrect.  
2. The corresponding application is not installed on the system.  

**Resolution Steps**  
1. Verify the spelling of bundleName.  
2. Confirm whether the corresponding application is installed.  

## 17700002 The specified moduleName does not exist  

**Error Message**  
The specified module is not found.  

**Error Description**  
The moduleName passed when calling query or installation-free related interfaces does not exist.  

**Possible Causes**  
1. The entered moduleName is incorrect.  
2. The corresponding module is not installed for the application on the system.  

**Resolution Steps**  
1. Verify the spelling of moduleName.  
2. Confirm whether the corresponding module is installed for the application.  

## 17700003 The specified abilityName does not exist  

**Error Message**  
The specified ability is not found.  

**Error Description**  
The abilityName passed when calling query or other interfaces does not exist.  

**Possible Causes**  
1. The entered abilityName is incorrect.  
2. The corresponding ability for the abilityName does not exist in the application.  

**Resolution Steps**  
1. Verify the spelling of abilityName.  
2. Confirm whether the corresponding ability exists for the abilityName in the application.  

## 17700004 The specified user does not exist  

**Error Message**  
The specified user ID is not found.  

**Error Description**  
The user passed when calling user-related interfaces does not exist.  

**Possible Causes**  
1. The entered username is incorrect.  
2. The user does not exist on the system.  

**Resolution Steps**  
1. Verify the spelling of the username.  
2. Confirm whether the user exists on the system.  

## 17700005 The specified appId is an empty string  

**Error Message**  
The specified app ID is an empty string.  

**Error Description**  
The appId passed when calling interfaces in the appControl module is an empty string.  

**Possible Causes**  
The passed appId is an empty string.  

**Resolution Steps**  
Check whether the appId is an empty string.  

## 17700006 The queried permission does not exist  

**Error Message**  
The specified permission is not found.  

**Error Description**  
The permission passed when calling the getPermissionDef interface in the bundleManager module does not exist.  

**Possible Causes**  
1. The spelling of the permission name is incorrect.  
2. The corresponding permission does not exist on the system.  

**Resolution Steps**  
1. Verify the spelling of the permission.  
2. Confirm whether the permission exists on the system.  

## 17700007 The entered device ID is incorrect  

**Error Message**  
The specified device ID is not found.  

**Error Description**  
The device ID passed when calling interfaces in the distributedBundle module is incorrect.  

**Possible Causes**  
1. The spelling of the deviceId is incorrect.  
2. The deviceId does not exist.  

**Resolution Steps**  
1. Verify the spelling of the deviceId.  
2. Confirm whether the deviceId exists.  

## 17700010 Application installation failed due to file parsing failure  

**Error Message**  
Failed to install the HAP because the HAP fails to be parsed.  

**Error Description**  
The HAP passed when calling the install interface in the installer module failed to be parsed.  

**Possible Causes**  
1. The HAP format is not ZIP.  
2. The configuration file of the HAP does not comply with JSON format.  
3. The configuration file of the HAP lacks required fields.  

**Resolution Steps**  
1. Confirm that the HAP format is ZIP.  
2. Confirm that the HAP configuration file complies with JSON format.  
3. Check whether DevEco Studio displays any error messages during HAP compilation—missing fields will trigger corresponding errors.  

## 17700011 Application installation failed due to signature verification failure  

**Error Message**  
Failed to install the HAP because the HAP signature fails to be verified.  

**Error Description**  
Signature verification failed when calling the install interface in the installer module, resulting in installation failure.  

**Possible Causes**  
1. The HAP is not signed.  
2. The source of the HAP signature is unreliable.  
3. The signature of the HAP to be upgraded does not match the installed HAP.  
4. The signatures of multiple HAPs are inconsistent.  

**Resolution Steps**  
1. Confirm whether the HAP is successfully signed.  
2. Confirm whether the HAP signature certificate is obtained from the application market.  
3. Confirm whether the same certificate is used for signing multiple HAPs.  
4. Confirm whether the signature certificate of the HAP to be upgraded matches the installed HAP.  

## 17700012 Application installation failed due to invalid path or oversized file  

**Error Message**  
Failed to install the HAP because the HAP path is invalid or the HAP is too large.  

**Error Description**  
The HAP path is invalid or the file is too large when calling the install interface in the installer module, resulting in installation failure.  

**Possible Causes**  
1. Incorrect input—the HAP file path does not exist.  
2. The HAP path is inaccessible.  
3. The HAP size exceeds the maximum limit of 4 GB.  

**Resolution Steps**  
1. Confirm whether the HAP exists.  
2. Check the executable permissions of the HAP—ensure it is readable.  
3. Check whether the HAP size exceeds 4 GB.  

## 17700015 Application installation failed due to inconsistent configuration among multiple HAPs  

**Error Message**  
Failed to install the HAPs because they have different configuration information.  

**Error Description**  
Inconsistent configuration among multiple HAPs when calling the install interface in the installer module, resulting in installation failure.  

**Possible Causes**  
The fields under the app tag in the configuration files of multiple HAPs are inconsistent.  

**Resolution Steps**  
Confirm whether the fields under the app tag in multiple HAP configuration files are consistent.  

## 17700016 Application installation failed due to insufficient system disk space  

**Error Message**  
Failed to install the HAP because of insufficient system disk space.  

**Error Description**  
Insufficient system disk space when calling the install interface in the installer module, resulting in installation failure.  

**Possible Causes**  
Insufficient system space.  

**Resolution Steps**  
Confirm whether the system has sufficient space.  

## 17700017 Application installation failed due to lower version number than the installed version  

**Error Message**  
Failed to install the HAP since the version of the HAP to install is too early.  

**Error Description**  
The version number of the HAP to be installed is lower than the installed version when calling the install interface in the installer module, resulting in installation failure.  

**Possible Causes**  
The version number of the HAP to be installed is lower than the installed version.  

**Resolution Steps**  
Confirm whether the version number of the HAP to be installed is not lower than the installed version of the same application.  

## 17700018 Installation failed due to missing dependent module  

**Error Message**  
Failed to install because the dependent module does not exist.  

**Error Description**  
The dependent module does not exist when installing the HAP.  

**Possible Causes**  
The dependent module is not installed.  

**Resolution Steps**  
Install the dependent module first.  

## 17700020 Preinstalled application cannot be uninstalled  

**Error Message**  
The preinstalled app cannot be uninstalled.  

**Error Description**  
The preinstalled application cannot be uninstalled when calling the uninstall interface in the installer module.  

**Possible Causes**  
1. The spelling of the passed bundleName is incorrect.  
2. The corresponding preinstalled application cannot be uninstalled.  

**Resolution Steps**  
1. Confirm whether the bundleName is spelled correctly.  
2. Confirm whether the corresponding preinstalled application can be uninstalled.## 17700021 Specified UID is Invalid

**Error Message**

The specified uid is invalid.

**Error Description**

When calling the getBundleNameByUid interface in the bundleManager module, the specified UID is invalid.

**Possible Causes**

1. The passed UID is misspelled.
2. The passed UID does not exist in the system.

**Resolution Steps**

1. Check the spelling of the UID.
2. Verify whether the UID exists in the system.

## 17700022 Input Source File is Invalid

**Error Message**

The input source file is invalid.

**Error Description**

When calling the getBundleArchiveInfo interface in the bundleManager module, the passed HAP path is invalid.

**Possible Causes**

1. The source file to be parsed does not exist.
2. The source file to be parsed does not conform to the ZIP format.

**Resolution Steps**

1. Confirm whether the source file to be parsed exists.
2. Confirm whether the source file to be parsed complies with the ZIP format.

## 17700023 Specified Default App Does Not Exist

**Error Message**

The specified default app does not exist.

**Error Description**

When calling the getDefaultApplication interface in the defaultAppManager module, the specified default app does not exist.

**Possible Cause**

The device has not set the corresponding default app.

**Resolution Step**

Confirm whether the device has set the corresponding default app.

## 17700024 No Corresponding Configuration File Found

**Error Message**

The specified profile is not found in the HAP.

**Error Description**

When calling interfaces related to querying profile files, no corresponding configuration file is found.

**Possible Causes**

1. The input metadata name does not exist in the configuration file.
2. The content of the configuration file is not in JSON format.
3. The queried profile type does not exist.

**Resolution Steps**

1. Confirm whether the metadata name in the queried ability or extensionAbility exists.
2. Confirm whether the content of the specified profile file is in JSON format.
3. Confirm whether the application contains a configuration file matching the queried profileType.

## 17700025 Specified Type is Invalid

**Error Message**

The specified type is invalid.

**Error Description**

When calling interfaces in the defaultAppManager module, the input type is invalid.

**Possible Causes**

1. The input type is misspelled.
2. The input type does not exist.

**Resolution Steps**

1. Confirm whether the input type is spelled correctly.
2. Confirm whether the input type exists.

## 17700026 Specified App is Disabled

**Error Message**

The specified bundle is disabled.

**Error Description**

When calling interfaces to query app-related information, the specified app is disabled.

**Possible Cause**

The corresponding app on the device has been disabled and cannot be queried.

**Resolution Step**

Confirm whether the corresponding app on the device is disabled.

## 17700027 Distributed Service is Not Running

**Error Message**

The distributed service is not running.

**Error Description**

When calling interfaces in the distributedBundle module, the distributed service is not running.

**Possible Cause**

The device is not networked.

**Resolution Step**

Confirm whether the device has successfully joined the network.

## 17700028 Input Ability Does Not Match the Type

**Error Message**

The ability does not match the type.

**Error Description**

When calling the setDefaultApplication interface in the defaultAppManager module, the input ability does not match the type.

**Possible Cause**

The input ability and type are misspelled.

**Resolution Step**

Confirm whether the input ability and type are spelled correctly.

## 17700029 Specified Ability is Disabled

**Error Message**

The specified ability is disabled.

**Error Description**

When calling interfaces to query ability-related information, the specified ability is disabled.

**Possible Cause**

The specified ability is disabled.

**Resolution Step**

Confirm whether the specified ability is disabled. You can use the bm tool command to query the corresponding app information.

## 17700030 Specified App Does Not Support Clearing Cache Files

**Error Message**

The specified bundle does not support clearing of cache files.

**Error Description**

When calling the cleanBundleCacheFiles interface in the bundleManager module, the specified app does not support clearing cache files.

**Possible Cause**

The specified app is a system app and has the "AllowAppDataNotCleared" field configured in its signing certificate.

**Resolution Steps**

1. Confirm whether the specified app is a system app. You can use the bm tool command to query the corresponding app information and check whether isSystemApp is true.
2. Confirm whether the specified app has the "AllowAppDataNotCleared" field configured. You can use the bm tool command to query the corresponding app information and check whether userDataClearable is true.

## 17700031 HAP Installation Failed Due to Overlay Feature Verification Failure

**Error Message**

Failed to install the HAP because the overlay check of the HAP is failed.

**Error Description**

When installing an app with overlay features, the specified app and the overlay feature app to be installed are not preset apps, or the target app/module is an overlay feature app/module.

**Possible Causes**

1. When using inter-app overlay features, the overlay feature app must be a preset app.
2. When using inter-app overlay features, the target app must be a preset app.
3. When using inter-app overlay features, the target app cannot be an overlay feature app.
4. The target module cannot be an overlay feature module.

**Resolution Steps**

1. Check whether the overlay feature app is a preset app.
2. Check whether the target app is a preset app.
3. Check whether the target app is not an overlay feature app.
4. Check whether the target module is not an overlay feature module.

## 17700032 Specified App Does Not Contain Overlay Feature Module

**Error Message**

The specified bundle does not contain any overlay module.

**Error Description**

When querying the overlayModuleInfo of the overlay feature module in the specified app, the app does not contain any overlay feature module.

**Possible Cause**

The specified app does not contain an overlay feature module.

**Resolution Step**

Check whether the specified app does not contain an overlay feature module.

## 17700033 Specified Module is Not an Overlay Feature Module

**Error Message**

The specified module is not an overlay module.

**Error Description**

When querying the overlayModuleInfo of the specified overlay feature module, the specified module is not an overlay feature module.

**Possible Cause**

The specified module is not an overlay feature module.

**Resolution Step**

Check whether the specified module is not an overlay feature module.

## 17700034 Specified Module is an Overlay Feature Module

**Error Message**

The specified module is an overlay module.

**Error Description**

When querying the overlayModuleInfo associated with the specified target module, the specified module is an overlay feature module.

**Possible Cause**

The specified module is an overlay feature module.

**Resolution Step**

Check whether the specified module is an overlay feature module.

## 17700035 Specified App Only Contains Overlay Feature Modules

**Error Message**

The specified bundle is an overlay bundle.

**Error Description**

When querying the overlayModuleInfo associated with the target module of the specified app, the app only contains overlay feature modules.

**Possible Cause**

The specified app only contains overlay feature modules.

**Resolution Step**

Check whether the specified app only contains overlay feature modules.

## 17700036 HSP Installation Failed Due to Missing AllowAppShareLibrary Privilege

**Error Message**

Failed to install the HSP because lacks appropriate permissions.

**Error Description**

The shared library did not apply for the AllowAppShareLibrary privilege, which may pose security and privacy risks, and thus installation is not allowed.

**Possible Cause**

Before releasing the shared library, the AllowAppShareLibrary privilege was not applied for and configured.**Processing Steps**

Apply for the `AllowAppShareLibrary` privilege configuration for the shared library, then re-sign and release it.

## 17700037 Uninstalled Shared Library Version is Dependent on Other Applications

**Error Message**  
The version of shared bundle is dependent on other applications.

**Error Description**  
When uninstalling a specific version of a shared library, the specified version is still being depended upon by other applications, resulting in a failed uninstallation.

**Possible Causes**  
1. The version being uninstalled is the highest version of the shared library, and this shared library is still being depended upon by other applications.  
2. No specific version of the shared library was specified during uninstallation, leading to an attempt to uninstall all versions of the shared library, which is still being depended upon by other applications.  

**Processing Steps**  
1. Check whether the shared library being uninstalled is depended upon by other applications.  
2. Verify whether the version being uninstalled is the highest version of the shared library.  

## 17700038 The Shared Library to Be Uninstalled Does Not Exist  

**Error Message**  
The specified shared bundle does not exist.  

**Error Description**  
When attempting to uninstall a shared library, the specified shared library does not exist.  

**Possible Causes**  
1. The specified version to be uninstalled does not exist in the shared library.  
2. The specified shared library does not exist on the device.  

**Processing Steps**  
1. Check whether the shared library to be uninstalled exists on the current device.  
2. Verify whether the version to be uninstalled exists in the shared library.  

## 17700039 Installation of Inter-Application Shared Libraries is Not Allowed  

**Error Message**  
Failed to install because disallow install a shared bundle by hapFilePaths.  

**Error Description**  
When installing an application, the installation package provided is of an inter-application shared library type.  

**Possible Causes**  
1. When using the `bm` tool to install an application, the `-p` parameter was used to specify the path of an inter-application shared library installation package.  
2. When using the `install` interface to install an application, the `hapFilePaths` parameter was used to specify the path of an inter-application shared library installation package.  

**Processing Steps**  
1. Use the `-s` parameter to specify the path of the inter-application shared library installation package.  
2. Use the `sharedBundleDirPaths` field in the `installParam` parameter to specify the path of the inter-application shared library installation package.  

## 17700040 Uninstallation of Inter-Application Shared Libraries is Not Allowed  

**Error Message**  
The specified bundle is a shared bundle which cannot be uninstalled.  

**Error Description**  
When uninstalling an application, the provided bundle name is that of an inter-application shared library.  

**Possible Causes**  
1. When using the `bm` tool to uninstall an application, the `-n` parameter was used to specify the bundle name of an inter-application shared library.  
2. When using the `uninstall` interface to uninstall an application, the `bundleName` parameter was used to specify the bundle name of an inter-application shared library.  

**Processing Steps**  
1. Use the `-s` parameter to specify that the application to be uninstalled is a shared library.  
2. Use the `bundleName` and `versionCode` fields in the `UninstallParam` parameter to specify the bundle name and version of the shared library to be uninstalled.  

## 17700041 Enterprise Device Management Does Not Allow Installation of the Application  

**Error Message**  
Failed to install because enterprise device management disallow install.  

**Error Description**  
During application installation, enterprise device management prohibits the installation.  

**Possible Cause**  
Enterprise device management does not allow the installation of this application.  

**Processing Step**  
Check on the device whether the application is blocked from installation by enterprise device management.  

## 17700042 Incorrect URI Configuration in Data Proxy  

**Error Message**  
Failed to install the HAP because of incorrect URI in the data proxy.  

**Error Description**  
During application installation, the URI configuration in the data proxy is incorrect.  

**Possible Causes**  
1. The bundle name in the URI does not match the bundle name of the current application.  
2. The URI is duplicated.  

**Processing Steps**  
1. Modify the bundle name in the URI to match the current application's bundle name.  
2. Ensure each data proxy URI is unique by modifying any duplicates.  

## 17700043 Incorrect Permission Configuration in Data Proxy  

**Error Message**  
Failed to install the HAP because of low APL in the non-system data proxy (required APL: system_basic or system_core).  

**Error Description**  
During application installation, the permission level of a non-system application's data proxy is too low (must be `system_basic` or `system_core`).  

**Possible Causes**  
1. The non-system application's data proxy does not have permissions configured.  
2. The permission level of the non-system application's data proxy is too low.  

**Processing Steps**  
1. Configure read and write permissions in the data proxy.  
2. Modify the read and write permissions to ensure they are at the `system_basic` or `system_core` level.  

## 17700044 Conflict Between Multi-Process Configuration in Installation Package and System Configuration  

**Error Message**  
Failed to install the HAP because the isolationMode configured is not supported.  

**Error Description**  
During application installation, the configured `isolationMode` conflicts with the system configuration.  

**Possible Causes**  
1. When the device supports isolation mode (i.e., `persist.bms.supportIsolationMode` is `true`), the HAP's `isolationMode` is set to `nonisolationOnly`.  
2. When the device does not support isolation mode (i.e., `persist.bms.supportIsolationMode` is `false`), the HAP's `isolationMode` is set to `isolationOnly`.  

**Processing Step**  
Configure the HAP's `isolationMode` correctly based on the device's isolation mode support.  

## 17700045 Enterprise Device Management Does Not Allow Uninstallation of the Application  

**Error Message**  
Failed to uninstall because enterprise device management disallow uninstall.  

**Error Description**  
During application uninstallation, enterprise device management prohibits the uninstallation.  

**Possible Cause**  
Enterprise device management does not allow the uninstallation of this application.  

**Processing Step**  
Check on the device whether the application is blocked from uninstallation by enterprise device management.  

## 17700047 The Version to Be Updated Is Not Greater Than the Current Version  

**Error Message**  
Failed to install the HAP because the VersionCode to be updated is not greater than the current VersionCode.  

**Error Description**  
During application installation, the version to be updated is not greater than the current version.  

**Possible Causes**  
1. The version code of the installation package is less than or equal to the version code of the installed application.  
2. The `installFlag` is set to `NORMAL`, which requires the version code of the application to be updated to be greater than the currently installed version.  

**Processing Steps**  
1. Set the application's version code to be greater than the current version.  
2. If the application needs to be updated without a version code upgrade, set `installFlag` to `REPLACE_EXISTING`.  

## 17700048 Code Signature Verification Failed  

**Error Message**  
Failed to install the HAP because the code signature verification is failed.  

**Error Description**  
During application installation, the code signature file verification failed.  

**Possible Causes**  
1. The module corresponding to the code signature file does not exist in the installation package.  
2. The code signature file path is invalid.  
3. The code signature file does not match the installation package.  

**Processing Steps**  
1. Check whether the module corresponding to the code signature file is included in the installation package path.  
2. Verify that the provided code signature file path is valid.  
3. Use a code signature file that matches the installation package.  

## 17700049 Bundle Name Mismatch During Self-Upgrade  

**Error Message**  
Failed to install the HAP because the bundleName is different from the bundleName of the caller application.  

**Error Description**  
During self-upgrade of an enterprise MDM application, the bundle name of the application to be installed does not match the caller application's bundle name.  

**Possible Cause**  
The HAP to be installed does not belong to the current application.  

**Processing Step**  
Verify whether the HAP to be installed belongs to the current application.  

## 17700050 Enterprise Device Verification Failed  

**Error Message**  
Failed to install the HAP because enterprise normal/MDM bundle cannot be installed on non-enterprise device.  

**Error Description**  
During application installation, an enterprise normal or MDM application cannot be installed on a non-enterprise device.  

**Possible Cause**  
The installation device is not an enterprise device.  

**Processing Steps**  
1. Check whether the installation device is an enterprise device.  
2. Verify whether the device parameter `const.bms.allowenterprisebundle` is set to `true`.  

## 17700051 Bundle Name Mismatch During Self-Upgrade  

**Error Message**  
Failed to install the HAP because the distribution type of caller application is not enterprise_mdm.  

**Error Description**  
During self-upgrade of an enterprise MDM application, the caller application's distribution type is not `enterprise_mdm`.  

**Possible Cause**  
The caller application's distribution type is not `enterprise_mdm`.  

**Processing Step**  
Check whether the application's signature file is correctly configured.  

## 17700052 Debug Applications Cannot Be Installed in Non-Developer Mode  

**Error Message**  
Failed to install the HAP because debug bundle cannot be installed under non-developer mode.  

**Error Description**  
During installation of a debug application, the device is in non-developer mode, which prohibits the installation.  

**Possible Cause**  
The application is a debug application, but the device is not in developer mode.  

**Processing Step**  
Run `hdc shell param get const.security.developermode.state`. If the result is `false`, the device cannot install debug applications.  

## 17700053 Non-AppGallery Call  

**Error Message**  
Not app gallery call.**Error Description**

Non-AppGallery applications are calling an interface exclusively reserved for AppGallery.

**Possible Cause**

The caller is not AppGallery.

**Resolution Steps**

Verify whether the caller is AppGallery.

## 17700054 Permission Verification Failure Leading to Installation Failure

**Error Message**

Failed to install the HAP because the HAP requests wrong permissions.

**Error Description**

The application to be installed requested incorrect permissions, resulting in installation failure.

**Possible Causes**

1. A non-MDM application requested MDM-type permissions.
2. The application's permission level is lower than that of the requested permissions.

**Resolution Steps**

1. Check whether MDM-type permissions were requested. MDM-type permissions are only available for applications of the MDM type.
2. Verify whether the requested permission level exceeds the application's permission level. By default, applications are at the `normal` level and can only use `normal`-level permissions. If `system_basic` or `system_core`-level permissions are used, an error will occur. Modify the `apl` level in the `UnsgnedDebugProfileTemplate.json` file to `system_basic` or `system_core`, then re-sign and repackage the application.

## 17700055 Invalid Specified Link

**Error Message**

The specified link is invalid.

**Error Description**

The specified link is invalid when calling the `canOpenLink` interface in the `bundleManager` module.

**Possible Cause**

The input link format is incorrect.

**Resolution Steps**

Check whether the link format is correct.

## 17700056 Scheme of Specified Link Not Configured in querySchemes Field

**Error Message**

The scheme of the specified link is not in the querySchemes.

**Error Description**

When calling the `canOpenLink` interface in the `bundleManager` module, the scheme of the specified link was not configured in the `querySchemes` field.

**Possible Cause**

The scheme of the specified link was not configured in the `querySchemes` field.

**Resolution Steps**

Check whether the corresponding URL scheme is configured in the `querySchemes` field.

## 17700201 ABC File Verification Failure

**Error Message**

Failed to verify abc.

**Error Description**

The .abc file path verification failed.

**Possible Cause**

The .abc file is untrusted.

**Resolution Steps**

Provide a trusted .abc file path.

## 17700202 ABC File Deletion Failure

**Error Message**

Failed to delete abc.

**Error Description**

The .abc file deletion failed.

**Possible Cause**

The .abc file does not exist.

**Resolution Steps**

Provide a valid .abc file path.