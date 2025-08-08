# SystemCapability Usage Guide

## Overview

### SystemCapability and APIs

SysCap, short for SystemCapability, refers to each relatively independent feature in the operating system, such as Bluetooth, WiFi, NFC, camera, etc., each being a system capability. Each system capability corresponds to multiple APIs, which coexist or disappear depending on whether the target device supports that system capability, and are provided to developers for association along with DevEco Studio.

![image-SysCap](figures/image-SysCap.png)

Developers can query OpenHarmony's capability set in the [SysCap List](cj-phone-syscap-list.md).

### Supported Capability Set, Associated Capability Set, and Required Capability Set

Supported capability set, associated capability set, and required capability set are all collections of system capabilities.

The supported capability set describes device capabilities, while the required capability set describes application capabilities. If the required capability set of application A is a subset of the supported capability set of device N, then application A can be distributed and installed on device N; otherwise, it cannot.

The associated capability set is the system capability collection where DevEco Studio can associate APIs during application development.

![image-SysCap-Set](figures/image-SysCap-Set.png)

### Devices and Supported Capability Set

Each device corresponds to a different supported capability set based on its hardware capabilities.

The SDK categorizes devices into two groups: typical devices and custom devices. The supported capability set of typical devices is defined by OpenHarmony, while custom devices are defined by the device manufacturers.

![image-Device-view](figures/image-Device-view.png)

### Device and SDK Capability Correspondence

The SDK provides a full set of APIs to DevEco Studio. DevEco Studio identifies the device type selected in the developer's project, locates the supported capability set of that device, filters the APIs included in the supported capability set, and provides API association.

![image-SDK-view](figures/image-SDK-view.png)

## SysCap Development Guide

### Obtaining PCID

PCID, short for Product Compatibility ID, contains the SysCap information supported by the current device. The certification center for obtaining PCIDs of all devices is under construction. Currently, you need to contact the manufacturer of the corresponding device to obtain its PCID.

### Importing PCID

DevEco Studio projects support the import of PCIDs. The SysCap decoded from the imported PCID file will be written into the syscap.json file.

Right-click on the project directory and select "Import Product Compatibility ID" to upload the PCID file and import it into syscap.json.

![20220329-103626](figures/20220329-103626.gif)

### Configuring Associated Capability Set and Required Capability Set

DevEco Studio automatically configures the associated capability set and required capability set based on the settings supported by the created project. Developers can also modify them manually.

For the associated capability set, developers can add more system capabilities to use more APIs in DevEco Studio. However, note that these APIs may not be supported on the device and need to be checked before use.

For the required capability set, developers should modify it with caution, as improper modifications may prevent the application from being distributed to the target device.

```json
// syscap.json
{
 "devices": {
  "general": [            // Each typical device corresponds to a syscap supported capability set; multiple typical devices can be configured
   "default",
   "car"
  ],
  "custom": [             // Manufacturer-defined custom devices
   {
    "Custom Device": [
     "SystemCapability.Communication.SoftBus.Core"
    ]
   }
  ]
 },
 "development": {             // The union of the sycap set in addedSysCaps and the syscap sets supported by the devices configured in "devices" forms the associated capability set
  "addedSysCaps": [
   "SystemCapability.Location.Location.Lite"
  ]
 },
 "production": {              // Used to generate RPCID; add with caution as it may prevent the application from being distributed to the target device
  "addedSysCaps": [],      // The intersection of the syscap sets supported by the devices configured in "devices," plus the addedSysCaps set minus the removedSysCaps set, forms the required capability set
  "removedSysCaps": []     // The application can only be distributed to a device if this required capability set is a subset of the device's supported capability set
 }
}
```

### Single-Device Application Development

By default, the associated capability set and required system capability set of an application are equal to the supported system capability set of the device. Developers should modify the required capability set with caution.

![image-Single-device-app-dev-view](figures/image-Single-device-app-dev-view.png)

### Cross-Device Application Development

By default, the associated capability set of an application is the union of the supported capability sets of multiple devices, while the required capability set is the intersection.

![image-Cross-device-app-dev-view](figures/image-Cross-device-app-dev-view.png)

### Checking Differences in the Same Capability Across Different Devices

Even for the same system capability, there may be differences across devices. For example, the camera capability of a tablet is superior to that of a smart wearable device.

```cangjie
import ohos.base.*
import kit.UserAuthenticationKit.*

try {
    let userAuthInstance = getUserAuthInstance(
        AuthParam([], [UserAuthType.PIN], AuthTrustLevel.ATL1),
        WidgetParam("TEST PIN_ATL1", "")
    )
    userAuthInstance.on("result", {u => userAuthInstance.off("result")})
    userAuthInstance.start()
} catch (e: Exception) {
    AppLog.info("auth catch error: ${e.toString()}")
}
```

### How SysCap Differences Between Devices Arise

The SysCap of devices varies due to the different combinations of components assembled by product solution manufacturers. The overall process is as follows:

![image-SysCap-diff](figures/image-SysCap-diff.png)

1. A set of operating system source code consists of optional and mandatory component sets. Different components correspond to different system capabilities, i.e., there is a mapping relationship between components and SysCap.

2. A normalized SDK is released, with a mapping relationship between APIs and SysCap.

3. Product solution manufacturers can assemble components as needed based on hardware capabilities and product requirements.

4. The components configured for a product can be system components or third-party private components. Since there is a mapping between components and SysCap, the SysCap set of the product can be obtained after assembly.

5. The SysCap set is encoded into PCID (Product Compatibility ID). Application developers can import the PCID into DevEco Studio, decode it into SysCap, and handle SysCap differences between devices for compatibility during development.

6. The system parameters deployed on the device include the SysCap set. The system provides native interfaces and application interfaces for components and applications within the system to query the existence of a specific SysCap.

7. During application development, the essential SysCap of the application will be encoded into RPCID (Required Product Compatibility ID) and written into the application installation package. During installation, the package manager decodes the RPCID to obtain the SysCap required by the application and compares it with the SysCap currently supported by the device. If the required SysCap are all satisfied, the installation succeeds.