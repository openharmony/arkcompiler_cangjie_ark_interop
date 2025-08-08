# User-Agent Development Guide

<!--RP1-->
User-Agent (UA) is a special string containing key information such as device type, operating system, and version. In web development, this string enables servers to identify the requesting device and its characteristics, thereby providing customized content and services based on this information. If a page fails to correctly identify the UA, it may lead to various anomalies. For example, a mobile-optimized page layout may display incorrectly on desktop devices, and vice versa. Additionally, certain browser-specific features or CSS styles may only be supported in specific browser versions. Failure to make correct judgments based on the UA string can result in rendering issues or logical errors.

## Default User-Agent Structure

- Default User-Agent Definition

  ```text
  Mozilla/5.0 ({DeviceType}; {OSName} {OSVersion}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/{ChromeCompatibleVersion}.0.0.0 Safari/537.36  ArkWeb/{ArkWeb VersionCode} {DeviceCompat} {Extension Field}
  ```

- Example

  ```text
  Mozilla/5.0 (Phone; OpenHarmony 5.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36  ArkWeb/4.1.6.1 Mobile
  ```

- Field Descriptions

  | Field                  | Description                                                                 |
  | :--------------------- | :-------------------------------------------------------------------------- |
  | DeviceType            | Current device type.<br>Valid values:<br>- Phone: Smartphone<br>- Tablet: Tablet device<br>- PC: 2-in-1 device |
  | OSName                | Base operating system name.<br>Default value: OpenHarmony                  |
  | OSVersion             | Base operating system version, two-digit format (M.S).<br>Parsed from the system parameter `const.ohos.fullname`, taking the first two digits of the version number (M.S).<br>Default value: e.g., 5.0  |
  | ChromeCompatibleVersion | Chrome-compatible major version number, starting from version 114.<br>Default value: 114            |
  | ArkWeb                | OpenHarmony version Web kernel name.<br>Default value: ArkWeb             |
  | ArkWeb VersionCode    | ArkWeb version number, format a.b.c.d.<br>Default value: e.g., 4.1.6.1         |
  | DeviceCompat          | Forward compatibility field.<br>Default value: Mobile                          |
  | Extension Field       | Field extendable by third-party applications.<br>When using the ArkWeb component, third-party applications can extend the UA, such as adding APP-specific identifiers. |

> **Note:**
>
> - The ArkWeb field in the default User-Agent currently has two leading spaces.
> - It is recommended to identify OpenHarmony devices using the `OpenHarmony` keyword, while the `DeviceType` can be used to identify device types for page display optimization (the `ArkWeb` keyword indicates the device's web kernel, and the `OpenHarmony` keyword indicates the operating system, hence the recommendation to use `OpenHarmony` for device identification).

## Custom User-Agent Structure

In the following example, the `getUserAgent()` interface is called to retrieve the current default User-Agent string. This interface provides developers with a baseline User-Agent, enabling them to customize or extend it as needed.

<!-- compile -->

```cangjie
// index.cj
import kit.ArkWeb.*
import kit.UIKit.{Web, BusinessException, Button}

@Entry
@Component
class EntryView {
    let webController = WebviewController()

    func build() {
        Column {
            Button("getUserAgent").onClick { evt =>
                try {
                    let userAgent = webController.getUserAgent()
                    AppLog.info("userAgent: ${userAgent}")
                } catch (e: BusinessException) {
                    AppLog.error("getUserAgent ErrorCode: ${e.code},  Message: ${e.message}")
                }
            }
            Web(src: 'www.example.com', controller: webController)
        }
    }
}
```

The following example demonstrates setting a custom User-Agent using the `setCustomUserAgent()` interface. Note that this operation will override the system's User-Agent. Therefore, it is recommended to append extension fields to the end of the default User-Agent. For instance, in third-party application development scenarios, specific APP identifiers can be appended to the system's default User-Agent string, preserving the original information while adding custom application identifiers.

When the Web component's `src` is set to a URL, it is recommended to set the User-Agent in the `onControllerAttached` callback event, as shown in the example. Avoid setting the User-Agent in the `onLoadIntercept` callback event, as this may occasionally fail. If the User-Agent is not set in the `onControllerAttached` callback, calling `setCustomUserAgent` may result in discrepancies between the loaded page and the actual User-Agent settings.

When the Web component's `src` is set to an empty string, it is recommended to first call `setCustomUserAgent` to set the User-Agent, then load the specific page via `loadUrl`.

<!-- compile -->

```cangjie
// index.cj
import kit.ArkWeb.*
import kit.UIKit.{Web, BusinessException}

@Entry
@Component
class EntryView {
    let webController = WebviewController()

    func build() {
        Column {
            Web(src: 'www.example.com', controller: webController)
                .onControllerAttached({ =>
                    AppLog.info("controller attached")
                    try {
                        let customUserAgent: String = 'DemoApp'
                        let userAgent = webController.getUserAgent() + customUserAgent
                        AppLog.info("userAgent: ${userAgent}")
                        webController.setCustomUserAgent(userAgent)
                    } catch (e: BusinessException) {
                        AppLog.error("setCustomUserAgent ErrorCode: ${e.code},  Message: ${e.message}")
                    }
                })
        }
    }
}
```

In the following example, the `getCustomUserAgent()` interface is called to retrieve the custom User-Agent.

<!-- compile -->

```cangjie
// index.cj
import kit.ArkWeb.*
import kit.UIKit.{ Web, BusinessException, Button}

@Entry
@Component
class EntryView {
    let webController = WebviewController()

    func build() {
        Column {
            Button("getUserAgent").onClick { evt =>
                try {
                    let customUserAgent = webController.getCustomUserAgent()
                    AppLog.info("customUserAgent: ${customUserAgent}")
                } catch (e: BusinessException) {
                    AppLog.error("getCustomUserAgent ErrorCode: ${e.code},  Message: ${e.message}")
                }
            }
            Web(src: 'www.example.com', controller: webController)
        }
    }
}
```

## User-Agent Interface Priority

| Interface Name | Priority | Description |
| :-------- | :-------- | :-------- |
| setCustomUserAgent | Highest | Applies to the Web component being called. |
| ArkWeb Default UA | Lowest | Applies to all Web components in the application, read-only, retrievable via `getDefaultUserAgent`. |

## Frequently Asked Questions

### How to Identify Different Devices in OpenHarmony OS via User-Agent

OpenHarmony device identification primarily relies on three dimensions in the User-Agent: system, system version, and device type. It is recommended to check all three for more accurate identification.

1. System Identification

   Identify the OpenHarmony system via the `{OSName}` field in the User-Agent.

   ```html
   const isOpenHarmony = () => /OpenHarmony/i.test(navigator.userAgent);
   ```

2. System Version Identification

   Identify the OpenHarmony system and version via the `{OSName}` and `{OSVersion}` fields in the User-Agent. Format: OpenHarmony + version number.

   ```html
   const matches = navigator.userAgent.match(/OpenHarmony (\d+\.?\d*)/);
   matches?.length && Number(matches[1]) >= 5;
   ```

3. Device Type Identification

   Identify different device types via the `deviceType` field.

   ```html
   // Check if the device is a smartphone
   const isPhone = () => /Phone/i.test(navigator.userAgent);

   // Check if the device is a tablet
   const isTablet = () => /Tablet/i.test(navigator.userAgent);

   // Check if the device is a 2-in-1
   const is2in1 = () => /PC/i.test(navigator.userAgent);
   ```

### How to Simulate OpenHarmony OS User-Agent for Frontend Debugging

On Windows/Mac/Linux systems, you can simulate the OpenHarmony User-Agent using the User-Agent override capability provided by DevTools in browsers like Chrome/Edge/Firefox.
<!--RP1End-->