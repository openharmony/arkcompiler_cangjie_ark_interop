# ohos.device_info (Device Information)

This module provides terminal device information query capabilities, which developers cannot configure.

## Importing the Module

```cangjie
import kit.BasicServicesKit.*
```

## Permission List

ohos.permission.sec.ACCESS_UDID

## Usage Instructions

API sample code usage instructions:

- If the sample code has a "// index.cj" comment in the first line, it indicates that the sample can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For the above sample projects and configuration templates, please refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#仓颉示例代码说明).

## class DeviceInfo

```cangjie
public class DeviceInfo {}
```

**Function:** Provides methods for querying terminal device information.

**System Capability:** SystemCapability.Startup.SystemInfo

**Since Version:** 21

### static prop ODID

```cangjie
public static prop ODID: String
```

**Function:** Developer Anonymous Device Identifier.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Since Version:** 21

### static prop abiList

```cangjie
public static prop abiList: String
```

**Function:** Application Binary Interface (ABI) list.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Since Version:** 21

### static prop bootloaderVersion

```cangjie
public static prop bootloaderVersion: String
```

**Function:** Bootloader version number.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Since Version:** 21

### static prop brand

```cangjie
public static prop brand: String
```

**Function:** Device brand name.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Since Version:** 21

### static prop buildHost

```cangjie
public static prop buildHost: String
```

**Function:** Build host.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Since Version:** 21

### static prop buildRootHash

```cangjie
public static prop buildRootHash: String
```

**Function:** Build version hash.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Since Version:** 21

### static prop buildTime

```cangjie
public static prop buildTime: String
```

**Function:** Build time.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Since Version:** 21

### static prop buildType

```cangjie
public static prop buildType: String
```

**Function:** Build type.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Since Version:** 21

### static prop buildUser

```cangjie
public static prop buildUser: String
```

**Function:** Build user.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Since Version:** 21

### static prop buildVersion

```cangjie
public static prop buildVersion: Int64
```

**Function:** Build version number, identifying the compiled build version.

**Type:** Int64

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Since Version:** 21

### static prop deviceType

```cangjie
public static prop deviceType: String
```

**Function:** Device type.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Since Version:** 21

### static prop displayVersion

```cangjie
public static prop displayVersion: String
```

**Function:** Product version.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Since Version:** 21

### static prop distributionOSApiName

```cangjie
public static prop distributionOSApiName: String
```

**Function:** Distribution OS API version name.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Since Version:** 21

### static prop distributionOSApiVersion

```cangjie
public static prop distributionOSApiVersion: Int64
```

**Function:** Distribution OS API version.

**Type:** Int64

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Since Version:** 21

### static prop distributionOSName

```cangjie
public static prop distributionOSName: String
```

**Function:** Distribution OS name.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Since Version:** 21

### static prop distributionOSReleaseType

```cangjie
public static prop distributionOSReleaseType: String
```

**Function:** Distribution OS release type.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Since Version:** 21

### static prop distributionOSVersion

```cangjie
public static prop distributionOSVersion: String
```

**Function:** Distribution OS version number.

**Type:** String**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Initial Version:** 21

### static prop featureVersion

```cangjie
public static prop featureVersion: Int64
```

**Functionality:** Feature version number, identifying planned new feature versions.

**Type:** Int64

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Initial Version:** 21

### static prop firstApiVersion

```cangjie
public static prop firstApiVersion: Int64
```

**Functionality:** First version system software API version.

**Type:** Int64

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Initial Version:** 21

### static prop hardwareModel

```cangjie
public static prop hardwareModel: String
```

**Functionality:** Hardware version number.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Initial Version:** 21

### static prop hardwareProfile

```cangjie
public static prop hardwareProfile: String
```

**Functionality:** Hardware profile.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Initial Version:** 21

### static prop incrementalVersion

```cangjie
public static prop incrementalVersion: String
```

**Functionality:** Incremental version number.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Initial Version:** 21

### static prop majorVersion

```cangjie
public static prop majorVersion: Int64
```

**Functionality:** Major version number, incremented with major version updates.

**Type:** Int64

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Initial Version:** 21

### static prop manufacture

```cangjie
public static prop manufacture: String
```

**Functionality:** Device manufacturer name.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Initial Version:** 21

### static prop marketName

```cangjie
public static prop marketName: String
```

**Functionality:** External product series.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Initial Version:** 21

### static prop osFullName

```cangjie
public static prop osFullName: String
```

**Functionality:** System version.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Initial Version:** 21

### static prop osReleaseType

```cangjie
public static prop osReleaseType: String
```

**Functionality:** System release type, with possible values:<br/>-&nbsp;Canary: Early preview version released to specific developers, with no API stability guarantee.<br/>-&nbsp;Beta: Publicly released Beta version for developers, with no API stability guarantee.<br/>-&nbsp;Release: Publicly released official version for developers, with API stability guaranteed.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Initial Version:** 21

### static prop productModel

```cangjie
public static prop productModel: String
```

**Functionality:** Certified model.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Initial Version:** 21

### static prop productSeries

```cangjie
public static prop productSeries: String
```

**Functionality:** Product series.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Initial Version:** 21

### static prop sdkApiVersion

```cangjie
public static prop sdkApiVersion: Int64
```

**Functionality:** System software API version.

**Type:** Int64

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Initial Version:** 21

### static prop securityPatchTag

```cangjie
public static prop securityPatchTag: String
```

**Functionality:** Security patch level.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Initial Version:** 21

### static prop seniorVersion

```cangjie
public static prop seniorVersion: Int64
```

**Functionality:** Senior version number, incremented with partial architecture or major feature additions.

**Type:** Int64

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Initial Version:** 21

### static prop serial

```cangjie
public static prop serial: String
```

**Functionality:** Device serial number.

**Required Permission:** ohos.permission.sec.ACCESS_UDID

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Initial Version:** 21

### static prop softwareModel

```cangjie
public static prop softwareModel: String
```

**Functionality:** Internal software sub-model.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Initial Version:** 21

### static prop udid

```cangjie
public static prop udid: String
```

**Functionality:** Internal software sub-model.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Initial Version:** 21

### static prop versionId

```cangjie
public static prop versionId: String
```

**Function:** Version ID.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Startup.SystemInfo

**Since:** 21

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import kit.PerformanceAnalysisKit.*

let hardwareProfile = DeviceInfo.hardwareProfile
Hilog.info(0, "deviceinfo", "the value of the hardwareProfile is : :${hardwareProfile}")
let osFullName = DeviceInfo.osFullName
Hilog.info(0, "deviceinfo", "the value of the osFullName is: :${osFullName}")
let productModel = DeviceInfo.productModel
Hilog.info(0, "deviceinfo", "the value of the productModel is : :${productModel}")
let brand = DeviceInfo.brand
Hilog.info(0, "deviceinfo", "the value of the brand is : :{brand}")
let deviceType = DeviceInfo.deviceType
Hilog.info(0, "deviceinfo", "the value of the deviceType is: :${deviceType}")
let udid = DeviceInfo.udid
Hilog.info(0, "deviceinfo", "the value of the udid is : :{udid}")
let buildRootHash = DeviceInfo.buildRootHash
Hilog.info(0, "deviceinfo", "the value of the buildRootHash is : :${buildRootHash}")
let buildTime = DeviceInfo.buildTime
Hilog.info(0, "deviceinfo", "the value of the buildTime is: :${buildTime}")
let buildHost = DeviceInfo.buildHost
Hilog.info(0, "deviceinfo", "the value of the buildHost is: :${buildHost}")
let buildUser = DeviceInfo.buildUser
Hilog.info(0, "deviceinfo", "the value of the buildUser is: :${buildUser}")
let buildType = DeviceInfo.buildType
Hilog.info(0, "deviceinfo", "the value of the buildType is: :${buildType}")
let versionId = DeviceInfo.versionId
Hilog.info(0, "deviceinfo", "the value of the versionId is: :${versionId}")
let firstApiVersion = DeviceInfo.firstApiVersion
Hilog.info(0, "deviceinfo", "the value of the firstApiVersion is : :${firstApiVersion}")
let sdkApiVersion = DeviceInfo.sdkApiVersion
Hilog.info(0, "deviceinfo", "the value of the sdkApiVersion is : :${sdkApiVersion}")
let buildVersion = DeviceInfo.buildVersion
Hilog.info(0, "deviceinfo", "the value of the buildVersion is : :${buildVersion}")
let majorVersion = DeviceInfo.majorVersion
Hilog.info(0, "deviceinfo", "the value of the majorVersion is : :${majorVersion}")
let displayVersion = DeviceInfo.displayVersion
Hilog.info(0, "deviceinfo", "the value of the displayVersion is : :${displayVersion}")
let serial = DeviceInfo.serial
Hilog.info(0, "deviceinfo", "the value of the serial is : :{serial}")
let osReleaseType = DeviceInfo.osReleaseType
Hilog.info(0, "deviceinfo", "the value of the osReleaseType is : :${osReleaseType}")
let incrementalVersion = DeviceInfo.incrementalVersion
Hilog.info(0, "deviceinfo", "the value of the incrementalVersion is : :${incrementalVersion}")
let securityPatchTag = DeviceInfo.securityPatchTag
Hilog.info(0, "deviceinfo", "the value of the securityPatchTag is : :${securityPatchTag}")
let abiList = DeviceInfo.abiList
Hilog.info(0, "deviceinfo", "the value of the abiList is : :${abiList}")
let bootloaderVersion = DeviceInfo.bootloaderVersion
Hilog.info(0, "deviceinfo", "the value of the bootloaderVersion is : :${bootloaderVersion}")
let hardwareModel = DeviceInfo.hardwareModel
Hilog.info(0, "deviceinfo", "the value of the hardwareModel is : :${hardwareModel}")
let softwareModel = DeviceInfo.softwareModel
Hilog.info(0, "deviceinfo", "the value of the softwareModel is : :${softwareModel}")
let productSeries = DeviceInfo.productSeries
Hilog.info(0, "deviceinfo", "the value of the productSeries is : :${productSeries}")
let marketName = DeviceInfo.marketName
Hilog.info(0, "deviceinfo", "the value of the marketName is: :${marketName}")
let manufacture = DeviceInfo.manufacture
Hilog.info(0, "deviceinfo", "the value of the manufacture is : :${manufacture}")
let distributionOSName = DeviceInfo.distributionOSName
Hilog.info(0, "deviceinfo", "the value of the distributionOSName is : :${distributionOSName}")
let distributionOSVersion = DeviceInfo.distributionOSVersion
Hilog.info(0, "deviceinfo", "the value of the distributionOSVersion is : :${distributionOSVersion}")
let distributionOSApiVersion = DeviceInfo.distributionOSApiVersion
Hilog.info(0, "deviceinfo", "the value of the distributionOSApiVersion is : :${distributionOSApiVersion}")
let distributionOSReleaseType = DeviceInfo.distributionOSReleaseType
Hilog.info(0, "deviceinfo", "the value of the distributionOSReleaseType is : :${distributionOSReleaseType}")
```