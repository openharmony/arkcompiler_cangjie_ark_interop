# SystemCapability List

SysCap, short for SystemCapability, refers to each relatively independent feature in the operating system.

Before using any interface for development, developers are advised to read the [SysCap Usage Guide](cj-syscap.md) to understand the definition and usage guidelines of SysCap. Then, refer to the table below to determine whether a specific capability set is supported by a device, thereby improving development efficiency.

> **Note:**
>
> This list enumerates the minimum system capability sets supported by the LiteWearable device type in the current version. Developers can query this information in the SDK through the liteWearable.json file.
> When developing applications for the current version of LiteWearable using APIs corresponding to the system capability sets listed here, developers can directly call these APIs without performing a canIUse() isolation check beforehand.

- SystemCapability.ArkUI.ArkUI.Lite
- SystemCapability.Base
- SystemCapability.Location.Location.Lite
- SystemCapability.PowerManager.BatteryManager.Lite
- SystemCapability.FileManagement.File.FileIO.Lite
- SystemCapability.Startup.SystemInfo.Lite
- SystemCapability.PowerManager.DisplayPowerManager.Lite
- SystemCapability.Communication.NFC.CardEmulation
- SystemCapability.Security.Huks.Core
- SystemCapability.DistributedDataManager.Preferences.Core.Lite
- SystemCapability.Sensors.Sensor.Lite
- SystemCapability.Sensors.MiscDevice.Lite
- SystemCapability.Communication.NetStack
- SystemCapability.MiscServices.ScreenLock
- SystemCapability.Security.CryptoFramework
- SystemCapability.Security.CryptoFramework.MessageDigest
- SystemCapability.Security.CryptoFramework.Rand