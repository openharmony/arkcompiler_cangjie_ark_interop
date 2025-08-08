# bm Tool

Bundle Manager (abbreviated as bm) is a tool that implements functionalities such as application installation, uninstallation, updates, and queries. It provides developers with basic debugging capabilities for application installation packages.

> **Note:**
>
> Currently, Cangjie only supports developing HAR and HAP packages but not HSP packages. Therefore, HSP-related functionalities in this tool are unavailable in the Cangjie program.

## Environment Requirements (hdc Tool)

Before using this tool, developers need to obtain the [hdc tool](./cj-hdc.md) and execute `hdc shell`.

## bm Tool Command List

| Command | Description |
| :-------- | :-------- |
| help | Help command, used to query the command information supported by bm. |
| install | Installation command, used to install applications. |
| uninstall | Uninstallation command, used to uninstall applications. |
| dump | Query command, used to query application-related information. |
| clean | Cleanup command, used to clear application cache and data. This command is available in root versions and in user versions with developer mode enabled. Otherwise, it is unavailable. |
| <!--DelRow-->enable | Enable command, used to enable an application so it can continue to be used. This command is available in root versions but not in user versions. |
| <!--DelRow-->disable | Disable command, used to disable an application so it cannot be used. This command is available in root versions but not in user versions. |
| get | Get UDID command, used to retrieve the device's UDID. |
| quickfix | Quick fix-related commands, used to perform patch-related operations such as patch installation and querying. |
| compile | Command to compile AOT for applications. |
| copy-ap | Copies the application's AP file to the `/data/local/pgo` directory for shell users to read. |
| dump-dependencies | Queries module dependency information for applications. |
| dump-shared | Queries HSP application information between applications. |
| dump-overlay | Prints overlayModuleInfo for overlay applications. |
| dump-target-overlay | Prints overlayModuleInfo for all associated overlay applications of the target application. |

## Help Command (help)

```bash
# Display help information
bm help
```

## Installation Command (install)

```bash
bm install [-h] [-p filePath] [-r] [-w waitingTime] [-s hspDirPath]
```

**Installation Command Parameter List:**

| Parameter | Description |
| :-------- | :-------- |
| -h | Help information. |
| -p | Required parameter, specifies the path and allows simultaneous installation of multiple HAPs. |
| -r | Optional parameter, overwrites the installation of a HAP. The default is to overwrite. |
| -s | Required parameter when installing inter-application HSPs; otherwise optional. Installs inter-application shared libraries. Only one HSP with the same package name can exist in each directory path. |
| -w | Optional parameter, specifies the waiting time for the bm tool during HAP installation. The minimum wait time is 5s, and the maximum is 600s. The default is 5s. |

Examples:

```bash
# Install a HAP
bm install -p /data/app/ohos.app.hap
# Overwrite-install a HAP
bm install -p /data/app/ohos.app.hap -r
# Install an inter-application shared library
bm install -s xxx.hsp
# Simultaneously install the consumer application and its dependent inter-application shared libraries
bm install -p aaa.hap -s xxx.hsp yyy.hsp
# Install a HAP with a 10s wait time
bm install -p /data/app/ohos.app.hap -w 10
```

## Uninstallation Command (uninstall)

```bash
bm uninstall [-h] [-n bundleName] [-m moduleName] [-k] [-s] [-v versionCode]
```

**Uninstallation Command Parameter List:**

| Parameter | Description |
| :-------- | :-------- |
| -h | Help information. |
| -n | Required parameter, specifies the Bundle name to uninstall the application. |
| -m | Optional parameter, specifies a module to uninstall. By default, all modules are uninstalled. |
| -k | Optional parameter, preserves application data during uninstallation. By default, data is not preserved. |
| -s | Required parameter when uninstalling inter-application HSPs; otherwise optional. Uninstalls the specified shared library. |
| -v | Optional parameter, specifies the version code of the shared package. By default, all shared packages with the same name are uninstalled. |

Examples:

```bash
# Uninstall an application
bm uninstall -n com.ohos.app
# Uninstall a module of an application
bm uninstall -n com.ohos.app -m com.ohos.app.EntryAbility
# Uninstall a shared bundle
bm uninstall -n com.ohos.example -s
# Uninstall a specific version of a shared bundle
bm uninstall -n com.ohos.example -s -v 100001
# Uninstall an application while preserving user data
bm uninstall -n com.ohos.app -k
```

## Application Information Query Command (dump)

```bash
bm dump [-h] [-a] [-n bundleName] [-s shortcutInfo] [-d deviceId]
```

**Query Command Parameter List:**

| Parameter | Description |
| :-------- | :-------- |
| -h | Help information. |
| -a | Optional parameter, queries all installed applications in the system. |
| -n | Optional parameter, queries detailed information for the specified Bundle name. |
| -s | Optional parameter, queries shortcut information for the specified Bundle name. |
| -d | Optional parameter, queries package information for the specified device. By default, the current device is queried. |

Examples:

```bash
# Display all installed Bundle names
bm dump -a
# Query detailed information for the application
bm dump -n com.ohos.app
# Query shortcut information for the application
bm dump -s -n com.ohos.app
# Query cross-device application information
bm dump -n com.ohos.app -d xxxxx
```

## Cleanup Command (clean)

```bash
bm clean [-h] [-c] [-n bundleName] [-d] [-i appIndex]
```

**Cleanup Command Parameter List:**

| Parameter | Description |
| :-------- | :--------- |
| -h | Help information. |
| -c&nbsp;-n | -n is required, -c is optional. Clears cache data for the specified Bundle name. |
| -d&nbsp;-n | -n is required, -d is optional. Clears the data directory for the specified Bundle name. |
| -i | Optional parameter, clears the data directory for a cloned application. Default is 0. |

Examples:

```bash
# Clear cache data for the application
bm clean -c -n com.ohos.app
# Clear user data for the application
bm clean -d -n com.ohos.app
// Execution result
clean bundle data files successfully.
```

<!--Del-->
## Enable Command (enable)

```bash
bm enable [-h] [-n bundleName] [-a abilityName]
```

**Enable Command Parameter List**

| Parameter | Description |
| :-------- | :-------- |
| -h | Help information. |
| -n | Required parameter, enables the application with the specified Bundle name. |
| -a | Optional parameter, enables the ability module under the specified Bundle name. |

Example:

```bash
# Enable the application
bm enable -n com.ohos.app -a com.ohos.app.EntryAbility
# Execution result
enable bundle successfully.
```

## Disable Command (disable)

```bash
bm disable [-h] [-n bundleName] [-a abilityName]
```

**Disable Command Parameter List**

| Parameter | Description |
| :-------- | :-------- |
| -h | Help information. |
| -n | Required parameter, disables the application with the specified Bundle name. |
| -a | Optional parameter, disables the ability module under the specified Bundle name. |

Example:

```bash
# Disable the application
bm disable -n com.ohos.app -a com.ohos.app.EntryAbility
# Execution result
disable bundle successfully.
```

<!--DelEnd-->

## Get UDID Command (get)

```bash
bm get [-h] [-u]
```

**Get UDID Command Parameter List:**

| Parameter | Description |
| :-------- | :-------- |
| -h | Help information. |
| -u | Required parameter, retrieves the device's UDID. |

Example:

```bash
# Get the device's UDID
bm get -u
// Execution result
udid of current device is:
23CADE0C
```

## Quick Fix Command (quickfix)

```bash
bm quickfix [-h] [-a -f filePath [-t targetPath] [-d]] [-q -b bundleName] [-r -b bundleName]
```

> **Note:**
>
> For HQF file creation methods, refer to [HQF Packaging Instructions](./cj-packing-tool.md#hqf-packaging-instructions).

**Quick Fix Command Parameter List:**

| Parameter | Description |
| :-------- | :-------- |
| -h | Help information. |
| -a&nbsp;-f | -a is optional; if specified, -f is required. Executes the quick fix patch installation command. `file-path` corresponds to the HQF file, supporting one or multiple HQF files or the directory containing HQF files. |
| -q&nbsp;-b | -q is optional; if specified, -b is required. Queries patch information by package name. |
| -r&nbsp;-b | -r is optional; if specified, -b is required. Uninstalls inactive patches by package name. |
| -t | Optional parameter, applies quick fixes to the specified target path. |
| -d | Optional parameter, applies quick fixes in debug mode. |

**Example 1:**

```bash
# Query patch package information by package name
bm quickfix -q -b com.ohos.app
```

**Execution Result:**

```text
Information as follows:
ApplicationQuickFixInfo:
bundle name: com.ohos.app
bundle version code: xxx
bundle version name: xxx
patch version code: x
patch version name:
cpu abi:
native library path:
type:
```

**Example 2:**

```bash
# Install quick fix patches
bm quickfix -a -f /data/app/
```

**Execution Result:**

```text
apply quickfix succeed.
```

**Example 3:**

```bash
# Uninstall quick fix patches
bm quickfix -r -b com.ohos.app
```

**Execution Result:**

```text
delete quick fix successfully
```

## Shared Library Query Command (dump-shared)```bash
bm dump-shared [-h] [-a] [-n bundleName] [-m moduleName]
```

**Shared Library Query Command Parameter List:**

| Parameter | Description |
| :-------- | :-------- |
| -h | Help information. |
| -a | Optional parameter, queries all installed shared libraries in the system. |
| -n | Optional parameter, queries detailed information of the specified shared library package name. |
| -m | Optional parameter, queries detailed information of the specified shared library package name and module name. |

Example:

```bash
# Display all installed shared library package names
bm dump-shared -a
# Display detailed information of the specified shared library
bm dump-shared -n com.ohos.lib
# Display shared library dependency information for the specified application and module
bm dump-dependencies -n com.ohos.app -m entry
```

## Shared Library Dependency Query Command (dump-dependencies)

Displays shared library dependency information for the specified application and module.

```bash
bm dump-dependencies [-h] [-n bundleName] [-m moduleName]
```

**Shared Library Dependency Query Command Parameter List:**

| Parameter | Description |
| :-------- | :-------- |
| -h | Help information. |
| -n | Required parameter, queries detailed information of the specified shared library package name. |
| -m | Optional parameter, queries shared library dependency information for the specified application and module. |

Example:

```bash
# Display shared library dependency information for the specified application and module
bm dump-dependencies -n com.ohos.app -m entry
```

## Application AOT Compilation Command (compile)

Executes AOT compilation for applications.

```bash
bm compile [-h] [-m mode] [-r bundleName] [-a]
```

**compile Command Parameter List:**

| Parameter | Description |
| :-------- | :-------- |
| -h | Help information. |
| -a | Optional parameter, compiles all applications. |
| -m | Optional parameter, valid values are partial or full. Compiles applications based on package name. |
| -r | Optional parameter, removes application results. |

Example:

```bash
# Compile applications based on package name
bm compile -m partial com.example.myapplication
```

## Copy AP File Command (copy-ap)

Copies AP files to the specified application's `/data/local/pgo` path.

```bash
bm copy-ap [-h] [-a] [-n bundleName]
```

**copy-ap Command Parameter List:**

| Parameter | Description |
| :-------- | :-------- |
| -h | Help information. |
| -a | Optional parameter, copies all AP files related to the package by default. |
| -n | Optional parameter, uses the current application package name by default. Copies AP files related to the specified package name. |

Example:

```bash
# Copy AP files related to the specified package name
bm copy-ap -n com.example.myapplication
```

## Query Overlay Application Information Command (dump-overlay)

Prints overlayModuleInfo for overlay applications.

```bash
bm dump-overlay [-h] [-b bundleName] [-m moduleName] [-t targetModuleName]
```

**dump-overlay Command Parameter List:**

| Parameter | Description |
| :-------- | :-------- |
| -h | Help information. |
| -b | Required parameter, retrieves all OverlayModuleInfo for the specified application. |
| -m | Optional parameter, uses the current application's main module name by default. Queries OverlayModuleInfo based on the specified package name and module name. |
| -t | Optional parameter, queries OverlayModuleInfo based on the specified package name and target module name. |

Example:

```bash
# Retrieve all OverlayModuleInfo for the overlay application com.ohos.app based on the package name
bm dump-overlay -b com.ohos.app

# Retrieve all OverlayModuleInfo for the overlay application com.ohos.app with overlay module 'entry' based on the package name and module
bm dump-overlay -b com.ohos.app -m entry

# Retrieve all OverlayModuleInfo for the overlay application com.ohos.app with target module 'feature' based on the package name and module
bm dump-overlay -b com.ohos.app -m feature
```

## Query Application Overlay Information Command (dump-target-overlay)

Queries all associated overlay application overlayModuleInfo information for the target application.

```bash
bm dump-target-overlay [-h] [-b bundleName] [-m moduleName]
```

**dump-target-overlay Command Parameter List:**

| Parameter | Description |
| :-------- | :-------- |
| -h | Help information. |
| -b | Required parameter, retrieves all OverlayBundleInfo for the specified application. |
| -m | Optional parameter, uses the current application's main module name by default. Queries OverlayBundleInfo based on the specified package name and module name. |

Example:

```bash
# Retrieve all associated OverlayBundleInfo for the target application com.ohos.app based on the package name
bm dump-target-overlay -b com.ohos.app

# Retrieve all associated OverlayModuleInfo for the target application com.ohos.app with target module 'entry' based on the package name and module
bm dump-target-overlay -b com.ohos.app -m entry
```

## BM Tool Error Codes

### 301 System Account Does Not Exist

**Error Message:**

error: user not exist.

**Error Description:**

The system account does not exist.

**Possible Causes:**

The system account ID does not exist during application installation.

**Resolution Steps:**

1. Restart the phone and attempt to install the application again.
2. If installation still fails after repeating the above steps 3-5 times, export the log file and submit an [online ticket](https://developer.huawei.com/consumer/cn/support/feedback/#/) for assistance.

```bash
hdc file recv /data/log/hilog/
```

### 304 Current System Account Has No HAP Package Installed

**Error Message:**

error: user does not install the hap.

**Error Description:**

During uninstallation, the current system account has no HAP package installed.

**Possible Causes:**

No HAP package is installed under the current system account.

**Resolution Steps:**

No HAP package is installed under the current system account. Do not perform the uninstallation operation.

### 9568319 Signature File Exception

**Error Message:**

error: cannot open signature file.

**Error Description:**

During application installation, the signature file could not be opened, causing installation to fail.

**Possible Causes:**

The HAP package signature file is abnormal.

**Resolution Steps:**

1. Use [automatic signing](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section18815157237). After connecting the device, re-sign the application.
2. For manual signing, refer to [manual signing](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section297715173233).

### 9568320 Signature File Does Not Exist

**Error Message:**

error: no signature file.

**Error Description:**

The user attempted to install an unsigned HAP package.

**Possible Causes:**

The HAP package is not signed.

**Resolution Steps:**

1. Use [automatic signing](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section18815157237). After connecting the device, re-sign the application.
2. For manual signing, refer to [manual signing](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section297715173233).

### 9568321 Signature File Parsing Failed

**Error Message:**

error: fail to parse signature file.

**Error Description:**

The signature file could not be parsed during user installation.

**Possible Causes:**

The HAP package signature file is abnormal.

**Resolution Steps:**

1. Use [automatic signing](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section18815157237). After connecting the device, re-sign the application.
2. For manual signing, refer to [manual signing](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section297715173233).

### 9568323 Signature Digest Verification Failed

**Error Message:**

error: signature verification failed due to not bad digest.

**Error Description:**

Signature verification failed during user installation.

**Possible Causes:**

The HAP package signature is incorrect.

**Resolution Steps:**

1. Use [automatic signing](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section18815157237). After connecting the device, re-sign the application.
2. For manual signing, refer to [manual signing](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section297715173233).

### 9568324 Signature Integrity Check Failed

**Error Message:**

error: signature verification failed due to out of integrity.

**Error Description:**

Signature verification failed during user installation.

**Possible Causes:**

The HAP package signature is incorrect.

**Resolution Steps:**

1. Use [automatic signing](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section18815157237). After connecting the device, re-sign the application.
2. For manual signing, refer to [manual signing](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section297715173233).

### 9568326 Signature Public Key Exception

**Error Message:**

error: signature verification failed due to bad public key.

**Error Description:**

Signature verification failed during user installation due to an abnormal signature public key.

**Possible Causes:**HAP Package Signature is Incorrect.

**Resolution Steps:**

1. Use [Automatic Signing](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section18815157237). After connecting the device, re-sign the application.
2. For manual signing, refer to [Manual Signing](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section297715173233).

### 9568327 Signature Acquisition Exception

**Error Message:**

error: signature verification failed due to bad bundle signature.

**Error Description:**

Signature verification failed during user installation due to signature acquisition exception.

**Possible Cause:**

HAP package signature is incorrect.

**Resolution Steps:**

1. Use [Automatic Signing](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section18815157237). After connecting the device, re-sign the application.
2. For manual signing, refer to [Manual Signing](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section297715173233).

### 9568328 Profile Block Not Found

**Error Message:**

error: signature verification failed due to no profile block.

**Error Description:**

Signature verification failed during user installation due to missing profile block.

**Possible Cause:**

HAP package signature is incorrect.

**Resolution Steps:**

1. Use [Automatic Signing](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section18815157237). After connecting the device, re-sign the application.
2. For manual signing, refer to [Manual Signing](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section297715173233).

### 9568330 Signature Source Initialization Failed

**Error Message:**

error: signature verification failed due to init source failed.

**Error Description:**

Signature verification failed during user installation due to signature source initialization failure.

**Possible Cause:**

HAP package signature is incorrect.

**Resolution Steps:**

1. Use [Automatic Signing](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section18815157237). After connecting the device, re-sign the application.
2. For manual signing, refer to [Manual Signing](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section297715173233).

### 9568257 Pkcs7 File Verification Failed

**Error Message:**

error: fail to verify pkcs7 file.

**Error Description:**

Pkcs7 signature verification failed during application installation.

**Possible Causes:**

1. Incomplete or untrusted certificate chain.
2. Signature algorithm mismatch.
3. Data tampering or corrupted signature file.
4. Signature format mismatch.
5. Private key mismatch.

**Resolution Steps:**

1. Use [Automatic Signing](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section18815157237). After connecting the device, re-sign the application.
2. For manual signing, refer to [Manual Signing](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section297715173233).

### 9568344 Profile Parsing Failed

**Error Message:**

error: install parse profile prop check error.

![Example Image](./figures/zh-cn_image_0000001585361412.png)

**Error Description:**

During application/service debugging or runtime, HAP installation failed with the error message "error: install parse profile prop check error."

**Possible Causes:**

1. The `bundleName` in [app.json5 configuration file](../cj-start/basic-knowledge/app-configuration-file.md) or the `name` in [module.json5 configuration file](../cj-start/basic-knowledge/module-configuration-file.md) does not comply with naming rules. <!--Del-->

2. The `type` field in [extensionAbilities](../cj-start/basic-knowledge/module-configuration-file.md#distributionfilter-tag) is configured as `service` or `dataShare`.

<!--DelEnd-->

**Resolution Steps:**

1. Adjust the `bundleName` in app.json5 and the `name` field in module.json5 according to naming rules. <!--Del-->

2. If the `type` field in `extensionAbilities` is configured as `service` or `dataShare`, the application must configure the [allowAppUsePrivilegeExtension privilege](https://docs.openharmony.cn/pages/v5.1/zh-cn/device-dev/subsystems/subsys-app-privilege-config-guide.md) as follows:

    a. Obtain a new signature fingerprint.

    b. Locate the signing file path in the `signingConfigs` field of the project-level `build-profile.json5` file (under the project root directory).

    c. Open the signing file (with .p7b extension), search for "development-certificate," and copy the content between "-----BEGIN CERTIFICATE-----" and "-----END CERTIFICATE-----" into a new .cer file (e.g., `xxx.cer`).

    Example .cer file format (for illustration only):

    ![Example Image](figures/zh-cn_image_0000001585521364.png)

    d. Use the `keytool` utility (located in the `jbr/bin` folder of the DevEco Studio installation directory) to execute the following command and obtain the SHA256 fingerprint from the .cer file:

    ```bash
    keytool -printcert -file xxx.cer
    ```

    e. Remove colons from the SHA256 fingerprint to obtain the final signature fingerprint.

    Example (for illustration only):

    ![Example Image](figures/zh-cn_image_0000001635921233.png)

    The final signature fingerprint (without colons): `5753DDBC1A8EF88A62058A9FC4B6AFAFC1C5D8D1A1B86FB3532739B625F8F3DB`.

    f. Retrieve the device's privilege control whitelist file `install_list_capability.json`:

    ```bash
    hdc shell
    find /system -name install_list_capability.json
    hdc target mount
    hdc file recv /system/etc/app/install_list_capability.json
    ```

    g. Add the signature fingerprint to the `app_signature` field in `install_list_capability.json` under the corresponding `bundleName`.

    ![Example Image](figures/zh-cn_image_0000001635641893.png)

    h. Push the modified file back to the device and reboot:

    ```bash
    hdc target mount
    hdc file send install_list_capability.json /system/etc/app/install_list_capability.json
    hdc shell chmod 644 /system/etc/app/install_list_capability.json
    hdc shell reboot
    ```

    i. After reboot, reinstall the application. <!--DelEnd-->

### 9568305 Dependent Module Does Not Exist

**Error Message:**

error: dependent module does not exist.

![Example Image](./figures/zh-cn_image_0000001560338986.png)

**Error Description:**

During application/service debugging or runtime, HAP installation failed with the error message "error: dependent module does not exist."

**Possible Cause:**

The dynamic shared library (SharedLibrary) module required by the application is not installed.

**Resolution Steps:**

1. Install the dependent SharedLibrary module first, then enable "Keep Application Data" in the run configuration before debugging.

    ![Example Image](./figures/zh-cn_image_0000001560201786.png)

2. In the run configuration, select the "Deploy Multi Hap" tab, enable "Deploy Multi Hap Packages," select the dependent modules, and save the configuration before debugging.

    ![Example Image](./figures/zh-cn_image_0000001610761941.png)

3. Go to Run > Edit Configurations, enable "Auto Dependencies" under General, save the configuration, and proceed with debugging.

    ![Example Image](./figures/zh-cn_image_9568305.png)

### 9568259 Required Field Missing in Profile

**Error Message:**

error: install parse profile missing prop.

![Example Image](./figures/zh-cn_image_0000001559130596.png)

**Error Description:**

During application/service debugging or runtime, HAP installation failed with the error message "error: install parse profile missing prop."

**Possible Cause:**

Mandatory fields are missing in app.json5 or module.json5 configuration files.

**Resolution Steps:**

- Method 1: Refer to [app.json5 configuration file](../cj-start/basic-knowledge/app-configuration-file.md) and [module.json5 configuration file](../cj-start/basic-knowledge/module-configuration-file.md) to identify and fill in mandatory fields.
- Method 2: Check missing fields via hilog logs:

    Enable logging:

    ```bash
    hilog -w start
    ```

    Log location: `/data/log/hilog`.

    Search for "profile prop %{public}s is mission" (e.g., "profile prop icon is mission" indicates the "icon" field is missing).

### 9568258 releaseType Mismatch

**Error Message:**

error: install releaseType target not same.

![Example Image](./figures/zh-cn_image_0000001609976041.png)

**Error Description:**

During application/service debugging or runtime, HAP installation failed with the error message "error: install releaseType target not same."

**Possible Causes:**

- Scenario 1: The `releaseType` value in the SDK used by the installed HAP differs from the new HAP.
- Scenario 2: Multiple HAPs in the application have inconsistent `releaseType` values.

**Resolution Steps:**

- Scenario 1: Uninstall the existing HAP before installing the new one.
- Scenario 2: Rebuild all HAPs using the same SDK version to ensure consistent `releaseType` values.

### 9568260 Internal Installation Error

**Error Message:**

error: install internal error.

**Error Description:**

Internal installation error.

**Possible Cause:**

Internal service exception during installation.

**Resolution Steps:**

Reboot the device and retry installation.

### 9568267 Entry Module Already Exists

**Error Message:**

error: install entry already exist.

**Error Description:**

The entry module of the application to be installed already exists.

**Possible Cause:**

Multi-module applications require unique entry modules. Installation fails if the new module's name differs from the installed entry module but both are of entry type.

**Resolution Steps:**

1. Uninstall the existing HAP before installing the new one.
2. Ensure the new module's name matches the installed entry module, or change the new module's type to "feature."

### 9568268 Installation State Error

**Error Message:**

error: install state error.**Error Description:**  

Application installation status update failed.  

**Possible Causes:**  

Due to the previous application installation package being too large and time-consuming, the installation status update failed because the previous installation task was not completed when the current application was being installed.  

**Resolution Steps:**  

Please wait for the previous application installation to complete before retrying.  

### 9568269 Invalid File Path  

**Error Message:**  

`error: install file path invalid.`  

**Error Description:**  

The installation package path provided during installation is invalid.  

**Possible Causes:**  

1. The installation package path does not exist (e.g., due to a typo).  
2. The installation package path exceeds 256 bytes in length.  

**Resolution Steps:**  

1. Verify that the installation package path exists and has the necessary access permissions.  
2. Ensure the installation package path does not exceed 256 bytes in length.  

### 9568322 Signature Verification Failed Due to Untrusted App Source  

**Error Message:**  

`error: signature verification failed due to not trusted app source.`  

![Example Image](./figures/zh-cn_image_0000001585042216.png)  

**Error Description:**  

When launching debugging or running an application/service, an error occurs during HAP installation, displaying the message: "error: signature verification failed due to not trusted app source."  

**Possible Causes:**  

- **Scenario 1:** The signature does not include the UDID of the debugging device.  
- **Scenario 2:** The application was signed using a [release certificate and release profile](https://developer.huawei.com/consumer/cn/doc/app/agc-help-releaseharmony-0000001933963166). Applications signed with a release certificate cannot be debugged or run.  

**Resolution Steps:**  

- **Scenario 1:**  
  1. Use [automatic signing](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section18815157237). After connecting the device, re-sign the application.  
  2. If manual signing is used, for OpenHarmony applications, refer to <!--RP2-->[OpenHarmony Application Manual Signing](https://docs.openharmony.cn/pages/v4.1/zh-cn/application-dev/security/hapsigntool-guidelines.md)<!--RP2End--> and add the debugging device's **UDID** to the `UnsgnedDebugProfileTemplate.json` file.  

      a. Obtain the UDID of the current device:  

      ```bash  
      // Command to retrieve UDID  
      hdc shell bm get -u  
      ```  

      b. Locate the `UnsgnedDebugProfileTemplate.json` configuration file in the IDE installation path under the SDK directory:  

      ```bash  
      IDE installation path\sdk\version or default\openharmony\toolchains\lib\  

      Example: xxxx\Huawei\DevEco Studio\sdk\HarmonyOS-NEXT-DB1\openharmony\toolchains\lib\  
      Example: xxxx\Huawei\DevEco Studio\sdk\default\openharmony\toolchains\lib\  
      ```  

      c. Add the current device's UDID to the `device-ids` field in `UnsgnedDebugProfileTemplate.json`.  

- **Scenario 2:** Re-sign the application using a [debug certificate and debug profile](https://developer.huawei.com/consumer/cn/doc/app/agc-help-debug-app-0000001914423098).  

### 9568286 Provision Type Mismatch Between Installed and New Application  

**Error Message:**  

`error: install provision type not same.`  

**Error Description:**  

When launching debugging or running an application/service, an error occurs during HAP installation because the [signature certificate profile](https://developer.huawei.com/consumer/cn/doc/app/agc-help-add-releaseprofile-0000001914714796) type of the new application does not match that of the installed application.  

**Possible Causes:**  

The provision type in the signature certificate profile of the installed application differs from that of the new application.  

**Resolution Steps:**  

1. Ensure the provision type in the signature certificate profile of the installed application matches that of the new application. Use the same type of profile for signing before installing the new HAP.  
2. Uninstall the existing application from the device before installing the new HAP.  

### 9568288 Insufficient Disk Space Causing Installation Failure  

**Error Message:**  

`error: install failed due to insufficient disk memory.`  

**Error Description:**  

During application installation, file or directory creation fails due to insufficient device storage space, resulting in installation failure.  

**Possible Causes:**  

Insufficient device storage space prevents file or directory creation, leading to installation failure.  

**Resolution Steps:**  

Check and free up device storage space to meet installation requirements, then retry the installation.  

```bash  
# Check disk space usage  
hdc shell df -h /system  
hdc shell df -h /data  
```  

### 9568289 Installation Failed Due to Permission Request Denial  

**Error Message:**  

`error: install failed due to grant request permissions failed.`  

![Example Image](./figures/zh-cn_image_0000001585201996.png)  

**Error Description:**  

When launching debugging or running an application/service, an error occurs during HAP installation, displaying the message: "error: install failed due to grant request permissions failed."  

**Possible Causes:**  

The default application level is `normal`, which only allows `normal`-level permissions. Using `system_basic` or `system_core`-level permissions will trigger this error.  

**Resolution Steps:**  

Apply for restricted ACL permissions for the application as per the [ACL Signing Guide](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section157591551175916).  

### 9568290 Installation Failed Due to HAP Token Update Failure  

**Error Message:**  

`error: install failed due to update hap token failed.`  

**Error Description:**  

During application installation or update, the HAP token authorization fails.  

**Possible Causes:**  

The token update interface for meta-abilities returns a failure during installation or update.  

**Resolution Steps:**  

1. Restart the device and retry the installation.  
2. If the issue persists after 3–5 attempts, export the log file and submit an [online ticket](https://developer.huawei.com/consumer/cn/support/feedback/#/) for assistance.  

```bash  
hdc file recv /data/log/hilog/  
```  

<!--Del-->  
### 9568291 Installation Failed Due to Singleton Mismatch  

**Error Message**  

`error: install failed due to singleton not same.`  

**Error Description**  

During application update, the `singleton` configuration in the `app.json5` file of the installed HAP package differs from that of the update package.  

**Possible Causes**  

The `singleton` configuration in the `app.json5` file of the installed HAP package does not match that of the update package.  

**Resolution Steps**  

**Option 1:** Uninstall the existing application package and install the new one.  

**Option 2:** Adjust the `singleton` configuration in the update package to match the installed package, repackage, and then update the application. <!--DelEnd-->  

<!--Del-->  
### 9568294 Installation Failed Due to App Type Mismatch  

**Error Message**  

`error: install failed due to apptype not same.`  

**Error Description**  

During installation, the [app-feature](https://docs.openharmony.cn/pages/v4.1/zh-cn/application-dev/security/app-provision-structure.md) configuration in the signature file of the installed HAP package differs from that of the new HAP package, causing installation failure.  

**Possible Causes**  

The installed and new HAP packages share the same bundle name but have different `app-feature` configurations in their signature files.  

**Resolution Steps**  

- **Option 1:** Uninstall the existing HAP package and install the new one.  
- **Option 2:** Modify the `app-feature` field in the new HAP package's signature file to match the installed package, repackage, [re-sign](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing), and retry installation. <!--DelEnd-->  

### 9568297 Installation Failed Due to Low Device SDK Version  

**Error Message:**  

`error: install failed due to older sdk version in the device.`  

![Example Image](./figures/zh-cn_image_0000001635521909.png)  

**Error Description:**  

When launching debugging or running an application/service, an error occurs during HAP installation, displaying the message: "error: install failed due to older sdk version in the device."  

**Possible Causes:**  

The SDK version used for compilation does not match the device's firmware version.  

**Resolution Steps:**  

- **Scenario 1:** If the device's firmware version is lower than the SDK version used for compilation, update the device firmware. Check the firmware version using:  

  ```bash  
  hdc shell param get const.ohos.apiversion  
  ```  

  If the firmware provides API version 10 and the application was compiled with SDK version 10, but the error persists, the firmware may be outdated. Update to the latest firmware version.  

- **Scenario 2:** For applications targeting OpenHarmony devices, ensure `runtimeOS` is set to `OpenHarmony`.  

### 9568300 Installation Failed Due to Non-Unique Module Names  

**Error Message:**  

`error: moduleName is not unique.`  

**Error Description:**  

During multi-module application installation, module uniqueness validation fails due to naming conflicts, resulting in installation failure.  

**Possible Causes:**  

Module names conflict during multi-module application installation.  

**Resolution Steps:**  

Review all module names in the current application and compare them with the `name` field in each module's `module.json5`. Ensure uniqueness, repackage, and retry installation.  

### 9568332 Installation Failed Due to Signature Inconsistency  

**Error Message:**  

`error: install sign info inconsistent.`  

![Example Image](./figures/zh-cn_image_0000001635761329.png)  

**Error Description:**  

When launching debugging or running an application/service, an error occurs during HAP installation, displaying the message: "error: install sign info inconsistent."  

**Possible Causes:**  

1. The signature of the installed application on the device differs from that of the new application, or signatures vary across packages (HAP and HSP). This occurs if "Keep Application Data" is enabled in "Edit Configurations" (i.e., overwriting the installation without uninstalling) and the application is re-signed.  
2. If an application is uninstalled but its data is retained, installing another application with the same bundle name but different signature information will trigger this error.  

**Resolution Steps:**  

1. Uninstall the existing application from the device or disable "Keep Application Data" before reinstalling.  
2. For HSP-related signature inconsistencies, use [Integrated HSP](https://docs.openharmony.cn/pages/v5.1/zh-cn/application-dev/quick-start/integrated-hsp.md) to unify HSP signatures. For multi-HAP packages, ensure all HAPs share the same signature.  
3. If an uninstalled application's data conflicts with a new installation of the same bundle name but different signature, reinstall the original application, perform a complete uninstallation (without retaining data), and then install the new application.  

### 9568329 Signature Verification Failed  

**Error Message:**  

`error: verify signature failed.`  

![Example Image](./figures/zh-cn_image_155401.png)  

**Error Description:**  

The package name in the signature information does not match the application's bundle name.  

**Possible Causes:**  

- **Scenario 1:** A third-party HSP module was imported, which is neither an [Integrated HSP](https://docs.openharmony.cn/pages/v5.1/zh-cn/application-dev/quick-start/integrated-hsp.md) nor an HSP with the same bundle name, causing a mismatch.  
- **Scenario 2:** An incorrect signature file (with a `.p7b` extension) was used for signing, resulting in a bundle name mismatch.  

**Resolution Steps:**  

- **Scenario 1:** HSPs can only be used by applications with the same bundle name, except for Integrated HSPs. Confirm with the third-party provider to obtain an Integrated HSP or an HSP with the same bundle name.  
- **Scenario 2:** Review the signing process and certificates, referring to [Configuring Debug Signatures](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing).  

### 9568266 Installation Permission Denied  

**Error Message:**  

`error: install permission denied.`![Example Image](./figures/zh-cn_image_9568266.png)

**Error Description:**

When using `hdc install` to install a HAP, an error occurs with the message "code:9568266 error: install permission denied."

**Possible Cause:**

`hdc install` cannot install enterprise applications signed with a release signature.

**Resolution Steps:**

Please use the `hdc install` command to install enterprise applications signed with a debug signature.

### 9568337 Installation Parsing Failed

**Error Message:**

error: install parse unexpected.

**Error Description:**

When pushing the application to the device for installation, an error occurs indicating that the package manager failed to open the HAP file.

**Possible Causes:**

- Scenario 1: The device's system partition storage is full, causing file corruption after `hdc file send` due to insufficient storage space.
- Scenario 2: The HAP package was corrupted during the push to the device.

**Resolution Steps:**

- Scenario 1: Check the storage space of the device's system partition. If it is full, clean up the storage to meet the installation requirements.

  ```bash
  hdc shell df -h /system
  ```

- Scenario 2: Compare the MD5 values of the local HAP and the HAP pushed to the device. If they do not match, it indicates corruption during the push. Try resending the file.

### 9568316 APL Permission Field in Data Proxy Indicates Low Permission Level

**Error Message:**

error: apl of required permission in proxy data is too low.

**Error Description:**

Validation failed for the `requiredReadPermission` and `requiredWritePermission` attributes in the `proxyData` tag.

**Possible Cause:**

In the user project's `module.json`, the validation for the `requiredReadPermission` and `requiredWritePermission` attributes in the `proxyData` tag failed. These attributes require permission levels of `system_basic` or `system_core`.

**Resolution Steps:**

Check if the `proxyData` content in the application meets the requirements. Refer to the [proxyData Tag](../cj-start/basic-knowledge/module-configuration-file.md#filecontextmenu-tag).

### 9568315 Data Proxy URI Error

**Error Message:**

error: uri in proxy data is wrong.

**Error Description:**

Validation failed for the `uri` attribute in the `proxyData` tag.

**Possible Cause:**

In the user project's `module.json`, the validation for the `uri` attribute in the `proxyData` tag failed, as it does not meet the URI format requirements.

**Resolution Steps:**

Check if the `proxyData` content in the application meets the requirements. Refer to the [proxyData Tag](../cj-start/basic-knowledge/module-configuration-file.md#filecontextmenu-tag).

### 9568336 Application Debug Type Mismatch with Installed Application

**Error Message:**

error: install debug type not same.

**Error Description:**

The application debug type (the `debug` field in `app.json`) does not match the installed application.

**Possible Cause:**

The developer used the debug button in DevEco Studio to install the application and later installed it via `hdc install` after packaging.

**Resolution Steps:**

Uninstall the installed application and reinstall the new one.

### 9568296 Bundle Type Error

**Error Message:**

error: install failed due to error bundle type.

**Error Description:**

Application installation failed due to an incorrect `bundleType`.

**Possible Cause:**

The `bundleType` of the new application does not match that of the already installed application with the same `bundleName`.

**Resolution Steps:**

- Method 1: Uninstall the installed application and reinstall the new one.
- Method 2: Modify the `bundleType` of the application to match the installed one.

### 9568292 UserID 0 Can Only Install Singleton Applications

**Error Message:**

error: install failed due to zero user can only install singleton app.

**Error Description:**

UserID 0 can only install applications with the `singleton` permission, and `singleton` applications can only be installed by UserID 0.

**Possible Cause:**

The `singleton` permission application was installed without specifying UserID 0.

**Resolution Steps:**

For `singleton` permission applications, specify UserID 0 during installation.

```bash
// Command to install with specified userId
hdc install -p hap_name.hap -u 0
```

### 9568263 Cannot Downgrade Installation

**Error Message:**

error: install version downgrade.

**Error Description:**

The `VersionCode` of the application being installed is lower than that of the already installed application, causing the installation to fail.

**Possible Cause:**

The `VersionCode` of the application being installed is lower than that of the already installed application.

**Resolution Steps:**

Uninstall the installed application and reinstall the new one.

### 9568301 Module Type Mismatch

**Error Message:**

error: moduleName is inconsistent.

**Error Description:**

The module name being installed already exists in the system, but the module type is inconsistent, causing the installation to fail.

**Possible Cause:**

The module name of the application to be installed already exists in the system, but the module type is inconsistent, causing the installation to fail.

**Resolution Steps:**

Check if the module name of the installed application conflicts with the module name to be installed. If the module names are the same but the types are inconsistent, modify the `type` attribute in the corresponding module's `module.json5`.

### 9568302 Installation Failed Due to Inconsistent Singleton Configuration Across Modules

**Error Message:**

error: install failed due to singleton not same.

**Error Description:**

The `singleton` configuration is inconsistent across multiple modules of the application, causing the installation to fail.

**Possible Cause:**

During multi-module installation, the `singleton` configurations are inconsistent, failing the consistency check and causing the installation to fail.

**Resolution Steps:**

Adjust the `singleton` configurations of all modules to be consistent before reinstalling.

### 9568303 Enterprise Device Management Prohibits Installation

**Error Message:**

error: Failed to install the HAP because the installation is forbidden by enterprise device management.

**Error Description:**

Installation failed due to application control policies.

**Possible Cause:**

Application control policies are in place.

**Resolution Steps:**

Due to enterprise control, there is currently no solution. Please submit an [online ticket](https://developer.huawei.com/consumer/cn/support/feedback/#/) for assistance.

### 9568304 Application Does Not Support Current Device Type

**Error Message:**

error: device type is not supported.

**Error Description:**

The application being installed does not support the current device type, causing the installation to fail.

**Possible Cause:**

The application being installed does not support the current device type.

**Resolution Steps:**

If adaptation to the current device is needed, add the current device type to the application's device type configuration. The `deviceTypes` configuration includes `phone`, `tablet`, `2in1`, `tv`, `wearable`, and `car`.

### 9568308 Bundle Type Inconsistency

**Error Message:**

error: install bundleType not same.

**Error Description:**

The `bundleType` is inconsistent across the application, causing the installation to fail.

**Possible Cause:**

During multi-HAP installation, the `bundleType` attributes of two modules are inconsistent.

**Resolution Steps:**

Ensure the `bundleType` attributes in the `app.json5` of all modules in the multi-HAP application are consistent.

### 9568309 Installation of Inter-Application HSP Not Allowed

**Error Message:**

error: Failed to install the HSP due to the lack of required permission.

**Error Description:**

Installation of an inter-application HSP failed due to insufficient privileges.

**Possible Cause:**

Insufficient privileges during the installation of an inter-application HSP.

**Resolution Steps:**

Check if the application has the `AllowAppShareLibrary` permission in the device's `install_list_capability.json`. For configuration details, refer to the [Application Privilege Configuration Guide](https://docs.openharmony.cn/pages/v5.1/zh-cn/device-dev/subsystems/subsys-app-privilege-config-guide.md).

### 9568311 Inter-Application HSP to Be Uninstalled Does Not Exist

**Error Message:**

error: shared bundle is not exist.

**Error Description:**

Uninstallation of an inter-application HSP failed because the specified package does not exist.

**Possible Cause:**

The specified inter-application HSP package does not exist during uninstallation.

**Resolution Steps:**

Check if the inter-application HSP to be uninstalled exists.

```bash
hdc shell bm dump-shared -n com.xxx.xxx.demo
```

### 9568312 Inter-Application HSP to Be Uninstalled Is Being Used

**Error Message:**

error: The version of the shared bundle is dependent on other applications.

**Error Description:**

Uninstallation of an inter-application HSP failed because the specified package is being used by other applications.

**Possible Cause:**

The specified inter-application HSP package is being used by other applications during uninstallation.

**Resolution Steps:**Check if the HSP to be uninstalled is depended upon by other applications. If dependencies exist, first uninstall the applications that depend on this HSP. <!--DelEnd-->

### 9568317 Mismatch Between Application's Multi-Process Configuration and System Configuration

**Error Message:**

error: isolationMode does not match the system.

**Error Description:**

The configured isolationMode during application installation does not match the system configuration allowed by the system settings.

**Possible Causes:**

- Scenario 1: The device supports isolation mode (i.e., persist.bms.supportIsolationMode is true), but the HAP configuration sets isolationMode to nonisolationOnly.
- Scenario 2: The device does not support isolation mode (i.e., persist.bms.supportIsolationMode is false), but the HAP configuration sets isolationMode to isolationOnly.

**Resolution Steps:**

Configure the isolationMode attribute in the HAP configuration file according to the device's isolation mode settings.

```bash
// Query the device's persist.bms.supportIsolationMode value. If errNum is 106, it means the setting is not configured.
hdc shell
param get persist.bms.supportIsolationMode
// Configure the device's persist.bms.supportIsolationMode value
hdc shell
param set persist.bms.supportIsolationMode [true|false]
```

### 9568315 Incorrect URI Attribute in Data Proxy

**Error Message:**

error: uri in proxy data is wrong.

**Error Description:**

Validation of the uri attribute in the proxyData tag of the application's module.json file failed.

**Possible Causes:**

The uri does not comply with the format specifications.

**Resolution Steps:**

Ensure the uri complies with the format specifications.

```text
// URI format specifications:
- URIs for different data proxies must not be duplicated.
- The format must follow: datashareproxy://current application package name/xxx
```

### 9568310 Incompatible Policies

**Error Message:**

error: compatible policy not same.

**Error Description:**

The compatibility policy of the new package differs from that of the already installed package.

**Possible Causes:**

1. An application is already installed, and another inter-application shared library with the same package name is being installed.
2. An inter-application shared library is already installed, and another application with the same package name is being installed.

**Resolution Steps:**

Uninstall the already installed application or inter-application shared library before installing the new package.

### 9568391 Bundle Manager Service Has Stopped

**Error Message:**

error: bundle manager service is died.

**Error Description:**

The bundle manager service has stopped.

**Possible Causes:**

An unknown system exception caused the bundle manager service to stop or exit abnormally.

**Resolution Steps:**

1. Restart the device and attempt to install the application again.
2. If the installation still fails after repeating the above steps 3-5 times, check if there are any crash files containing the word "foundation" in the device's /data/log/faultlog/faultlogger/ directory.

    ```bash
    hdc shell
    cd /data/log/faultlog/faultlogger/
    ls -ls
    ```

3. Export the crash files and log files and submit an [online ticket](https://developer.huawei.com/consumer/cn/support/feedback/#/) for assistance.

    ```bash
    hdc file recv /data/log/faultlog/faultlogger/
    hdc file recv /data/log/hilog/
    ```

### 9568393 Failed to Verify Code Signature

**Error Message:**

error: verify code signature failed.

**Error Description:**

Failed to verify the code signature.

**Possible Causes:**

The package lacks code signature information.

**Resolution Steps:**

Install the latest version of DevEco Studio and re-sign the package.

<!--RP3--><!--RP3End-->

### 9568399 Failed to Copy Files

**Error Message:**

error: copy file failed.

**Error Description:**

Failed to copy files during the application installation process.

**Possible Causes:**

1. The source or destination file path is invalid.
2. Failed to open the source file.
3. Failed to retrieve the source file's status.
4. The source file size is invalid.
5. Failed to copy the source file.
6. The source file lacks access permissions.
7. Failed to change file permissions.

**Resolution Steps:**

1. Restart the device and attempt to install the application again.
2. If the installation still fails after repeating the above steps 3-5 times, export the log files and submit an [online ticket](https://developer.huawei.com/consumer/cn/support/feedback/#/) for assistance.

```bash
hdc file recv /data/log/hilog/
```

### 9568401 Debug Bundle Can Only Run on Developer Mode Devices

**Error Message:**

error: debug bundle can only be installed in developer mode.

**Error Description:**

Debug bundles can only run on devices in developer mode.

**Possible Causes:**

The device's "Developer Mode" is not enabled.

**Resolution Steps:**

1. In the device's system settings, check if "Developer Options" exists under "Settings > System." If not, go to "Settings > About" and tap the "Version Number" seven times consecutively until prompted to "Enable Developer Mode." Confirm and enter the PIN (if set). The device will restart automatically.
2. Connect the device to a PC via USB cable. Under "Settings > System > Developer Options," enable "USB Debugging." Click "Allow" when prompted with the "Allow USB Debugging" dialog.
3. Start debugging or run the application.

### 9568404 Failed to Deliver Signature Profile

**Error Message:**

error: delivery sign profile failed.

**Error Description:**

An exception occurred while delivering the code signature profile during installation, causing the installation to fail.

**Possible Causes:**

1. The file path does not exist.
2. Failed to create the file path.
3. Failed to change the directory mode.
4. Failed to write profile data.
5. Failed to change the profile mode.
6. Failed to add profile data.

**Resolution Steps:**

1. Restart the device and attempt to install the application again.
2. If the installation still fails after repeating the above steps 3-5 times, export the log files and submit an [online ticket](https://developer.huawei.com/consumer/cn/support/feedback/#/) for assistance.

```bash
hdc file recv /data/log/hilog/
```

### 9568405 Failed to Remove Signature Profile

**Error Message:**

error: remove sign profile failed.

**Error Description:**

An exception occurred while removing the signature profile during application uninstallation, causing the uninstallation to fail.

**Possible Causes:**

1. The file path does not exist.
2. Failed to load profile data.
3. The file lacks write permissions.

**Resolution Steps:**

1. Restart the device and attempt to uninstall the application again.
2. If the uninstallation still fails after repeating the above steps 3-5 times, export the log files and submit an [online ticket](https://developer.huawei.com/consumer/cn/support/feedback/#/) for assistance.

    ```bash
    hdc file recv /data/log/hilog/
    ```

### 9568386 Application to Uninstall Does Not Exist

**Error Message:**

error: uninstall missing installed bundle.

**Error Description:**

The application to uninstall does not exist.

**Possible Causes:**

The application to uninstall is not installed.

**Resolution Steps:**

Confirm whether the application to uninstall is already installed.

### 9568388 Enterprise Device Management Prohibits Uninstallation

**Error Message:**

error: Failed to uninstall the HAP because the uninstall is forbidden by enterprise device management.

**Error Description:**

Enterprise device management prohibits uninstalling this application.

**Possible Causes:**

The application is configured to prohibit uninstallation.

**Resolution Steps:**

Have the administrator lift the uninstallation restriction for this application.

### 9568284 Version Mismatch During Installation

**Error Message:**

error: install version not compatible.

**Error Description:**

Version mismatch during installation.

**Possible Causes:**

The version information of the HSP being installed does not match the version information of the already installed HAP. The following checks are performed during HSP installation:

1. The bundleName must match the HAP.
2. The version must match the HAP.
3. The signature must match the HAP.

**Resolution Steps:**

1. Uninstall the HAP with mismatched version information before installing the HSP.
2. Modify the HSP version information to match the HAP before installing the HSP.

### 9568287 Invalid Number of Entry Modules in Installation Package

**Error Message:**

error: install invalid number of entry hap.

**Error Description:**

The number of entry modules in the installation package is invalid.

**Possible Causes:**

The installation package contains multiple entry modules. An application can have only one entry module but multiple feature modules.

**Resolution Steps:**# Retain one entry module and modify the remaining entry modules to feature (update the type field in module.json5).

### 9568281 Inconsistent Vendor in Installation Package

**Error Message:**  
`error: install vendor not same.`

**Error Description:**  
Inconsistent vendor in the installation package.

**Possible Cause:**  
The vendor field configuration in app.json5 does not match.

**Resolution Steps:**  
1. If there is only one HAP, ensure its vendor field matches that of the already installed application. Uninstall and reinstall if necessary.  
2. If integrated HSPs are included, ensure the vendor fields of the integrated HSPs match those of the consuming HAPs.  

### 9568272 Invalid Installation Package Size

**Error Message:**  
`error: install invalid hap size.`

**Error Description:**  
The installation package size exceeds the limit.

**Possible Cause:**  
The installation package size exceeds 4GB.

**Resolution Steps:**  
Split the package to ensure each installation package does not exceed 4GB.  

### 9568273 UID Generation Failure Leading to Installation Failure

**Error Message:**  
`error: install generate uid error.`

**Error Description:**  
Failed to generate a UID for the application, resulting in installation failure.

**Possible Cause:**  
The number of installed applications on the device has exceeded 65535, causing UID allocation failure during installation.

**Resolution Steps:**  
Uninstall unnecessary applications and retry.  

### 9568274 Installation Service Error

**Error Message:**  
`error: install installd service error.`

**Error Description:**  
Installation service error.

**Possible Cause:**  
Abnormal installation service.

**Resolution Steps:**  
Clear the cache and restart the device.  

### 9568275 Package Management Service Error

**Error Message:**  
`error: install bundle mgr service error.`

**Error Description:**  
Package management service error.

**Possible Cause:**  
Abnormal package management service, such as null pointer exceptions.

**Resolution Steps:**  
Restart the device or retry later.  

### 9568277 Inconsistent Bundle Name Leading to Installation Failure

**Error Message:**  
`error: install bundle name not same.`

**Error Description:**  
Inconsistent bundle name, leading to installation failure.

**Possible Cause:**  
The bundle names of multiple installation packages in the target path do not match.

**Resolution Steps:**  
Check the bundle names of the installation packages in the target path and ensure the bundleName field in all app.json5 configuration files is consistent.  

### 9568279 Inconsistent Version Leading to Installation Failure

**Error Message:**  
`error: install version name not same.`

**Error Description:**  
Inconsistent version (versionName field), leading to installation failure.

**Possible Cause:**  
The versionName fields of multiple installation packages in the target path do not match.

**Resolution Steps:**  
Check the versions of the installation packages in the target path and ensure the versionName field in all app.json5 configuration files is consistent.  

### 9568280 Inconsistent minCompatibleVersionCode Leading to Installation Failure

**Error Message:**  
`error: install min compatible version code not same.`

**Error Description:**  
Inconsistent minCompatibleVersionCode field, leading to installation failure.

**Possible Cause:**  
The minCompatibleVersionCode fields of multiple installation packages in the target path do not match.

**Resolution Steps:**  
Check the installation packages in the target path and ensure the minCompatibleVersionCode field in all app.json5 configuration files is consistent.  

### 9568282 Inconsistent targetAPIVersion Leading to Installation Failure

**Error Message:**  
`error: install releaseType target not same.`

**Error Description:**  
Inconsistent targetAPIVersion field, leading to installation failure.

**Possible Cause:**  
The targetAPIVersion fields of multiple installation packages in the target path do not match.

**Resolution Steps:**  
Check the installation packages in the target path and ensure the targetAPIVersion field in all app.json5 configuration files is consistent.  

### 9568314 Failed to Install Inter-Application Shared Library

**Error Message:**  
`error: Failed to install the HSP because installing a shared bundle specified by hapFilePaths is not allowed.`

**Error Description:**  
Failed to install the inter-application shared library.

**Possible Cause:**  
Using the `hdc app install ***` command to install an inter-application shared HSP.

**Resolution Steps:**  
Use the `hdc install -s ***` command to install inter-application HSPs.  

### 9568349 Abnormal Parameters During File Operations

**Error Message:**  
`error: installd param error.`

**Error Description:**  
Abnormal parameters during file operations, leading to installation failure.

**Possible Cause:**  
Invalid parameters or empty directory paths were passed during installation.

**Resolution Steps:**  
1. Restart the device and retry the installation.  
2. If the installation still fails after 3-5 attempts, export the log file and submit an [online ticket](https://developer.huawei.com/consumer/cn/support/feedback/#/) for assistance.  

```bash
# Export log files
hdc file recv /data/log/hilog/
```

### 9568351 Directory Creation Failure Leading to Installation Failure

**Error Message:**  
`error: installd create dir failed.`

**Error Description:**  
Directory creation failure, leading to installation failure.

**Possible Cause:**  
No write permission when creating the directory.

**Resolution Steps:**  
1. Restart the device and retry the installation.  
2. If the installation still fails after 3-5 attempts, export the log file and submit an [online ticket](https://developer.huawei.com/consumer/cn/support/feedback/#/) for assistance.  

```bash
# Export log files
hdc file recv /data/log/hilog/
```

### 9568354 Directory Deletion Failure Leading to Installation Failure

**Error Message:**  
`error: installd remove dir failed.`

**Error Description:**  
Directory deletion failure, leading to installation failure.

**Possible Cause:**  
The directory does not exist or lacks write permissions.

**Resolution Steps:**  
1. Restart the device and retry the installation.  
2. If the installation still fails after 3-5 attempts, export the log file and submit an [online ticket](https://developer.huawei.com/consumer/cn/support/feedback/#/) for assistance.  

```bash
# Export log files
hdc file recv /data/log/hilog/
```

### 9568355 File Extraction Failure from Installation Package

**Error Message:**  
`error: installd extract files failed.`

**Error Description:**  
Failed to extract files from the installation package, leading to installation failure.

**Possible Cause:**  
Failed to create the directory for extracting SO files, resulting in SO extraction failure from the HAP package.

**Resolution Steps:**  
1. Restart the device and retry the installation.  
2. If the installation still fails after 3-5 attempts, export the log file and submit an [online ticket](https://developer.huawei.com/consumer/cn/support/feedback/#/) for assistance.  

```bash
# Export log files
hdc file recv /data/log/hilog/
```

### 9568356 Directory Renaming Failure During Installation

**Error Message:**  
`error: installd rename dir failed.`

**Error Description:**  
Directory renaming failure, leading to installation failure.

**Possible Cause:**  
The directory name exceeds 260 characters during installation, or the current directory lacks write permissions.

**Resolution Steps:**  
1. Restart the device and retry the installation.  
2. If the installation still fails after 3-5 attempts, export the log file and submit an [online ticket](https://developer.huawei.com/consumer/cn/support/feedback/#/) for assistance.  

```bash
# Export log files
hdc file recv /data/log/hilog/
```# Exporting Log Files
hdc file recv /data/log/hilog/
```

### 9568357 Failed to Clean Files

**Error Message:**

error: installd clean dir failed.

**Error Description:**

Failed to clean files, resulting in installation failure.

**Possible Causes:**

The files to be cleaned during installation lack write permissions, causing the cleaning process to fail.

**Resolution Steps:**

1. Restart the device and attempt to install the application again.
2. If installation still fails after repeating the above steps 3 to 5 times, export the log files and submit an [online ticket](https://developer.huawei.com/consumer/cn/support/feedback/#/) for assistance.

```bash
# Exporting log files
hdc file recv /data/log/hilog/
```

### 9568359 Failed to Set SELinux During Installation

**Error Message:**

error: installd set selinux label failed.

**Error Description:**

Failed to set SELinux during installation.

**Possible Causes:**

Incorrect APL field in the signature configuration file. APL has three levels: "normal", "system_basic", and "system_core".

**Resolution Steps:**

1. Verify whether the apl field in the p7b signature file is incorrect.

    ![Example Image](./figures/zh-cn_image_9568359.png)

2. If the apl field is incorrect, modify the apl field in the UnsgnedReleasedProfileTemplate.json file and re-sign.

    ![Example Image](./figures/zh-cn_image_9568359_2.png)

### 9568403 Encryption Check Failed During Installation

**Error Message:**

error: check encryption failed.

**Error Description:**

Encryption check failed during installation.

**Possible Causes:**

The image version may be outdated, or non-so files in the lib directory of the HAP package may be causing the issue.

**Resolution Steps:**

1. Install a newer version of the image.
2. Delete non-so files in the lib directory of the HAP project, then re-sign and repackage.

### 9568413 Application Device Type Not Supported on Current Device

**Error Message:**

error: check syscap filed and device type is not supported.

**Error Description:**

The configured device type for the application is not supported for installation.

**Possible Causes:**

The configured device type for the application does not match the installation device.

**Resolution Steps:**

Adjust to the correct device type.

### 9568417 Signature Verification Failed

**Error Message:**

error: bundle cannot be installed because the appId is not same with preinstalled bundle.

**Error Description:**

Signature verification failed.

**Possible Causes:**

The signature of the application being installed does not match that of the preinstalled application with the same package name.

**Resolution Steps:**

If the application being installed is a preinstalled application, ensure its signature matches that of the preinstalled application.

### 9568278 Inconsistent Version Numbers of Installation Packages

**Error Message:**

error: install version code not same.

**Possible Causes:**

1. The version code (versionCode) of the application installed on the device does not match that of the application causing the installation error.
2. Inconsistent version codes (versionCode) exist among multiple packages being installed.

**Resolution Steps:**

1. Adjust the version code of the installation package to match that of the application already installed on the device, or uninstall the existing application before installing the new one.
2. Ensure all packages being installed have consistent version codes (versionCode).

### 9568380 Failed to Uninstall System Application

**Error Message:**

error: uninstall system app error.

**Error Description:**

Failed to uninstall a system application.

**Possible Causes:**

Some system applications are set as non-removable and cannot be uninstalled.

**Resolution Steps:**

Non-removable applications cannot be uninstalled.

### 9568387 Failed to Uninstall Due to Missing Module

**Error Message:**

error: uninstall missing installed module.

**Error Description:**

Attempted to uninstall a module that is not installed.

**Possible Causes:**

Attempted to uninstall a module that is not installed.

**Resolution Steps:**

Use the [bm dump -n](#query-application-information-command-dump) command to check the application configuration and confirm the module to be uninstalled is installed.

### 9568432 Plugin and Application pluginDistributionIDs Verification Failed, Causing Installation Failure

**Error Message**

error: Check pluginDistributionID between plugin and host application failed.

**Error Description**

Verification failed between the pluginDistributionIDs of the application and the plugin.

**Possible Causes**

The pluginDistributionIDs of the application and the plugin have no common values, causing the verification to fail.

**Resolution Steps**

Reconfigure the pluginDistributionIDs in the [signature certificate profile file](https://developer.huawei.com/consumer/cn/doc/app/agc-help-add-releaseprofile-0000001914714796) for the application or plugin.

### 9568433 Application Lacks ohos.permission.SUPPORT_PLUGIN Permission

**Error Message**

error: Failed to install the plugin because host application check permission failed.

**Error Description**

Permission verification failed when the application attempted to install a plugin.

**Possible Causes**

The application lacks the ohos.permission.SUPPORT_PLUGIN permission.

**Resolution Steps**

1. Refer to the [Permission Application Guide](../security/AccessToken/cj-declare-permissions.md) to apply for the [ohos.permission.kernel.SUPPORT_PLUGIN permission](../security/AccessToken/cj-restricted-permissions.md#ohospermissionkernelsupport_plugin).<!--Del-->
2. This permission is classified as system_basic. If the [application APL level](../security/AccessToken/cj-app-permission-mgmt-overview.md#permission-mechanism) is lower than system_basic, [apply for restricted permissions](../security/AccessToken/cj-declare-permissions-in-acl.md).

<!--DelEnd-->

### 9568333 Module Name is Empty

**Error Message:**

error: Install failed due to hap moduleName is empty.

**Error Description:**

Installation failed because the module name is empty.

**Possible Causes:**

The module name is empty.

**Resolution Steps:**

Check whether the name field in [module.json5](../cj-start/basic-knowledge/module-configuration-file.md) is empty.

### 9568331 Inconsistent Signature Information

**Error Message:**

error: Install incompatible signature info.

**Error Description:**

Installation failed due to inconsistent signature information.

**Possible Causes:**

When installing an application with multiple HAP packages, the signature information of the HAP packages is inconsistent.

**Resolution Steps:**

Re-[sign](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing) to ensure consistent signature information across all HAP packages.

### 9568334 Duplicate Module Names

**Error Message:**

error: Install failed due to hap moduleName duplicate.

**Error Description:**

Installation failed due to duplicate module names.

**Possible Causes:**

When installing multiple modules for the same application, module names are duplicated.

**Resolution Steps:**

Ensure module names are unique for all modules of the same application.

### 9568340 Missing Configuration File

**Error Message:**

error: Install parse no profile.

**Error Description:**

Installation failed because the HAP package lacks a configuration file.

**Possible Causes:**

Missing configuration files such as [module.json, pack.info](../cj-start/basic-knowledge/application-package-structure-stage.md).

**Resolution Steps:**

Rebuild, repackage, and reinstall using DevEco Studio.

### 9568341 Failed to Parse Configuration File During Installation

**Error Message:**

error: Install parse bad profile.

**Error Description:**

Failed to parse the configuration file during installation.

**Possible Causes:**

Abnormal format in configuration files such as [module.json, pack.info](../cj-start/basic-knowledge/application-package-structure-stage.md).

**Resolution Steps:**

Rebuild, repackage, and reinstall using DevEco Studio.

### 9568342 Incorrect Data Type in Configuration File

**Error Message:**

error: Install parse profile prop type error.

**Error Description:**

Installation failed due to incorrect data type when parsing the configuration file.

**Possible Causes:**Fields with incorrect data types exist in configuration files such as [module.json, pack.info](../cj-start/basic-knowledge/application-package-structure-stage.md).

**Resolution Steps:**

Rebuild, package, and install using DevEco Studio.

### 9568345 String Length or Array Size Exceeds Limit in Configuration File

**Error Message:**

error: Too large size of string or array type element in the profile.

**Error Description:**

During installation and parsing of the configuration file, the string length or array size exceeds the limit, causing installation failure.

**Possible Causes:**

Fields with excessive string length or array size exist in configuration files such as [module.json, pack.info](../cj-start/basic-knowledge/application-package-structure-stage.md).

**Resolution Steps:**

Rebuild, package, and install using DevEco Studio.

### 9568347 Failed to Parse Native SO File

**Error Message:**

error: install parse native so failed.

**Error Description:**

When launching or running a C++ application/service in debug mode, an error occurs during HAP package installation, displaying the message "error: install parse native so failed."

**Possible Causes:**

The Abi type supported by the device does not match the Abi type configured in the C++ project.

> **Note:**
>
> If the project depends on HSP or HAR modules, ensure that all modules containing C++ code are configured with Abi types that include those supported by the device.
> If the project relies on third-party libraries containing SO files, ensure that the oh_modules/third-party/libs directory includes Abi directories supported by the device, such as libs/arm64-v8a or /libs/x86_64.
<!--RP1--><!--RP1End-->

**Resolution Steps:**

1. Connect the device to DevEco Studio.
2. Execute the following command to query the list of Abi types supported by the device. The result will return one or more Abi types from default/armeabi-v7a/armeabi/arm64-v8a/x86/x86_64.

    ```bash
    hdc shell
    param get const.product.cpu.abilist
    ```

3. Based on the query result, check the ["abiFilters" parameter](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ohos-abi#%E5%9C%A8%E7%BC%96%E8%AF%91%E6%9E%B6%E6%9E%84%E4%B8%AD%E6%8C%87%E5%AE%9Aabi) in the [module-level build-profile.json5](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-hvigor-build-profile) file, following these rules:

    - If the result is "default," execute the following command to check for the existence of a lib64 folder.

        ```bash
        cd /system/
        ls
        ```

        ![Example Image](./figures/zh-cn_image_0000001609001262.png)

        If the lib64 folder exists: The "abiFilters" parameter must include the arm64-v8a type. If it does not exist: The "abiFilters" parameter must include at least one of armeabi or armeabi-v7a.

    - If the result is one or more of armeabi-v7a/armeabi/arm64-v8a/x86/x86_64, the "abiFilters" parameter must include at least one of the returned Abi types.

### 9568348 Failed to Parse Ark Native SO File

**Error Message:**

error: Install parse ark native file failed.

**Error Description:**

Failed to parse the ark native SO file during installation.

**Possible Causes:**

During multi-HAP installation, Abi types are inconsistent and do not match the Abi types supported by the current device.

**Resolution Steps:**

Check for Abi consistency across multiple HAPs. Refer to the resolution steps for [Error Code 9568347](#9568347-解析本地so文件失败).

### 9568350 Failed to Obtain Proxy Object During Installation

**Error Message:**

error: Installd get proxy error.

**Error Description:**

Failed to obtain the proxy object during installation.

**Possible Causes:**

Package management or other service exceptions caused the proxy acquisition to fail.

**Resolution Steps:**

1. Restart the device and attempt to install the application again.
2. If installation still fails after repeating the above steps 3-5 times, export the log file and submit an [online ticket](https://developer.huawei.com/consumer/cn/support/feedback/#/) for assistance.

```bash
# Export log file
hdc file recv /data/log/hilog/
```

### 9568434 Device Does Not Support Plugin Capability

**Error Message:**

error: Failed to install the plugin because current device does not support plugin.

**Error Description:**

The current device does not support plugin capability, causing plugin installation to fail.

**Possible Causes:**

The device lacks plugin capability.

**Resolution Steps:**

Use the [param tool](./cj-param-tool.md) to set the value of const.bms.support_plugin to true by executing `hdc shell param set const.bms.support_plugin true`.

### 9568435 Application Package Name Does Not Exist

**Error Message:**

error: Host application is not found.

**Error Description:**

The provided application package name does not exist.

**Possible Causes:**

The application is not installed.

**Resolution Steps:**

Verify whether the provided application exists.

### 9568436 Inconsistent Configuration Information Among Multiple HSPs

**Error Message:**

error: Failed to install the plugin because they have different configuration information.

**Error Description:**

Inconsistent package information among multiple HSPs causes installation failure.

**Possible Causes:**

When installing plugins as multiple HSPs, their package information is inconsistent.

**Resolution Steps:**

Ensure consistency in package information across multiple HSPs, including fields such as bundleName, bundleType, versionCode, and apiReleaseType in the [app.json5 configuration file](../cj-start/basic-knowledge/app-configuration-file.md).

### 9568437 Failed to Parse pluginDistributionIDs of Plugin

**Error Message:**

error: Failed to install the plugin because the plugin id failed to be parsed.

**Error Description:**

Failed to parse the pluginDistributionIDs of the plugin, causing installation failure.

**Possible Causes:**

The pluginDistributionIDs configuration in the plugin's signature information does not comply with specifications, leading to parsing failure.

**Resolution Steps:**

Reconfigure the "app-services-capabilities" field in the plugin's profile signature file according to the following format:

```json
"app-services-capabilities":{
    "ohos.permission.kernel.SUPPORT_PLUGIN":{
        "pluginDistributionIDs":"value-1|value-2|···"
    }
}
```

### 9568438 Plugin Package Name Does Not Exist

**Error Message:**

error: The plugin is not found.

**Error Description:**

The plugin does not exist.

**Possible Causes:**

The current application does not have the plugin installed.

**Resolution Steps:**

Use the [bm dump -n command](#查询应用信息命令dump) to query application information and verify whether the provided plugin is installed.

### 9568439 Plugin and Application Package Names Are Identical

**Error Message:**

error: The plugin name is same as host bundle name.

**Error Description:**

The plugin's package name is identical to the application's package name.

**Possible Causes:**

The plugin's package name matches the application's package name, causing plugin installation to fail.

**Resolution Steps:**

Reconfigure the plugin's package name.

### 9568441 Application Cannot Modify U1Enabled

**Error Message:**

error: install failed due to U1Enabled can not change.

**Error Description:**

Installation failed due to changes in the U1Enabled field in the signature information.

**Possible Causes:**

Changes occurred in the U1Enabled configuration of the allowed-acls field in the application's [Profile signature file](https://developer.huawei.com/consumer/cn/doc/app/agc-help-add-debugprofile-0000001914423102), for example:

1. The installed application has U1Enabled configured in allowed-acls, while the application to be installed does not.
2. The installed application does not have U1Enabled configured in allowed-acls, while the application to be installed does.

**Resolution Steps:**

Option 1: Re-sign the application. During signing, refer to the configuration guidelines for [automatic signing](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section9786111152213) (supporting ACL permissions) or [manual signing](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section157591551175916) (using ACL configurations) to ensure consistency between the application to be installed and the installed application.

Option 2: Uninstall the currently installed application from the device before attempting to install the new application.

### 9568442 Inconsistent U1Enabled Configuration

**Error Message:**

error: Install failed due to the U1Enabled is not same in all haps.

**Error Description:**

Installation failed due to inconsistent U1Enabled configurations in the signature information.

**Possible Causes:**

Inconsistent [Profile signature files](https://developer.huawei.com/consumer/cn/doc/app/agc-help-add-debugprofile-0000001914423102) were used during multi-HAP signing, resulting in inconsistent U1Enabled configurations in the allowed-acls field.

**Resolution Steps:**

Re-sign the application. During signing, refer to the configuration guidelines for [automatic signing](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section9786111152213) (supporting ACL permissions) or [manual signing](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-signing#section157591551175916) (using ACL configurations) to ensure consistency in the U1Enabled configurations across multiple HAPs.

<!--Del-->
## Frequently Asked Questions

### 1. Pre-installed System Application Uninstalled, Reinstallation Fails with Errors: Downgrade Installation or Signature Mismatch in Specific Scenarios

**Issue Description:**

After uninstalling a pre-installed system application, reinstallation fails with errors indicating downgrade installation or signature mismatch. However, the application icon appears on the desktop and can be launched normally.

**Possible Causes:**

Enhanced security controls for uninstalled pre-installed system applications. When installing an application with the same bundleName, the system first restores the pre-installed mirrored version before proceeding with the installation of the new application.

**Resolution Steps:**

Address the issue based on the error message and error code.
<!--DelEnd-->