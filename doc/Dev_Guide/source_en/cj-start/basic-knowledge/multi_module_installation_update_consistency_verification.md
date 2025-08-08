# Application Installation and Update Consistency Verification  

As applications grow increasingly complex, they are often divided into multiple modules for development and maintenance, with different teams responsible for individual or multiple modules. During installation or updates, applications undergo consistency verification and validation for various fields to ensure security and legitimacy. This document outlines the consistency verification rules for signature certificates and configuration files during multi-module installation or updates.  

> **Note**  
> 
> If the `versionCode` field in the [app.json5 configuration file](./app-configuration-file.md) matches, it indicates the installation or update package is of the same version; otherwise, it is considered a different version.  
> 
> If a packaging tool is used, legitimacy verification occurs during the packaging process. For details, refer to the [Packaging Tool](../../tools/cj-packing-tool.md#packaging-tool).  

## Signature Certificate Consistency Verification  

| Field Name          | Description | Installation Consistency Verification Rule | Update Consistency Verification Rule |  
|---------------------|-------------|--------------------------------------------|--------------------------------------|  
| appId               | The application's `appId`, composed as `bundleName_base64_encoded_public_key`. | Yes | Either `appId` or `appIdentifier` must match. |  
| appIdentifier       | The unique identifier of the application, assigned as an [APP ID](https://developer.huawei.com/consumer/cn/doc/app/agc-help-createharmonyapp-0000001945392297) when creating the app in AppGallery Connect. It is a randomly generated string uniformly assigned by the cloud and remains unchanged throughout the application's lifecycle, including version upgrades, certificate changes, developer key changes, and application transfers. | Yes | Either `appId` or `appIdentifier` must match. |  
| appDistributionType | The `app-distribution-type` in the [signature certificate](../../../../API_Reference/source_en/apis/AbilityKit/cj-apis-bundle_manager.md#let-appdistributiontype), indicating the distribution type of the application. | Yes | No verification for different versions; verification required for the same version. |  
| appProvisionType    | The [certificate type](https://developer.huawei.com/consumer/cn/doc/app/agc-help-add-debugprofile-0000001914423102) of the application signature, categorized as `debug` or `release`. `debug` is for local debugging, while `release` is for app store distribution. | Yes | No verification for different versions; verification required for the same version. |  
| apl                 | Represents the [APL level](../../security/AccessToken/cj-app-permission-mgmt-overview.md#key-concepts-in-permission-mechanism) of the application. System-defined APLs include `normal`, `system_basic`, and `system_core`. | Yes | No verification for different versions; verification required for the same version. |  

## Configuration File Consistency Verification  

| Field Name          | Description | Installation Consistency Verification Rule | Update Consistency Verification Rule |  
|---------------------|-------------|--------------------------------------------|--------------------------------------|  
| bundleName          | Identifies the Bundle name of the application, ensuring uniqueness. This field is sourced from the `bundleName` field in the [app.json5 configuration file](./app-configuration-file.md). | Yes | Yes |  
| versionCode         | Indicates the version number of the application, a positive integer less than 2^31. This number determines whether one version is newer than another, with higher values indicating newer versions. Developers can set any positive integer but must ensure newer versions use larger values than older ones. This field is sourced from the `versionCode` field in the [app.json5 configuration file](./app-configuration-file.md). | Yes | Yes |  
| apiReleaseType      | Indicates the SDK release type used to compile the HAP. If the application is not installed on the device and contains multiple module packages installed sequentially, consistency verification is skipped. This field is sourced from the `apiReleaseType` field in the [app.json5 configuration file](./app-configuration-file.md). | No | Yes |  
| singleton           | Indicates whether the application is installed under user 0. | No | Yes |<!--RP2--> <!--RP2End-->  
| appType             | Indicates the type of the application: `SYSTEM_APP` (system app), `THIRD_SYSTEM_APP` (third-party system app), or `THIRD_PARTY_APP` (third-party app). | Yes | Yes |<!--RP3--> <!--RP3End-->  
| isStage             | Indicates whether the application uses the Stage model. | Yes (FA and Stage models cannot change within the same version) | Yes |<!--RP4--> <!--RP4End-->  
| targetBundleName    | Specifies the target application for the current package. Applications with this field configured have overlay characteristics. This field is sourced from the `targetBundleName` field in the [app.json5 configuration file](./app-configuration-file.md). | Yes | Yes |  
| targetPriority      | Indicates the priority of the current application. This field is sourced from the `targetPriority` field in the [app.json5 configuration file](./app-configuration-file.md). | Yes | Yes |  
| bundleType          | Indicates the type of the application. This field is sourced from the `bundleType` field in the [app.json5 configuration file](./app-configuration-file.md). | Yes | Yes |  
| installationFree    | Indicates whether installation-free is supported. This field is sourced from the `installationFree` field in the [module.json5 configuration file](./module-configuration-file.md). | Yes | Yes |  
| debug               | Indicates whether debugging (IDE breakpoint debugging) is enabled. This field is sourced from the `debug` field in the [app.json5 configuration file](./app-configuration-file.md). | Yes | No |  
| moduleType          | Indicates the type of the application package. Only one type is allowed per module in the application. This field is sourced from the `type` field in the [module.json5 configuration file](./module-configuration-file.md). | Yes (for the same version, the `moduleName` of the `entry` type cannot be modified) | Yes |