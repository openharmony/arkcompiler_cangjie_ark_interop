# Web

Provides Web components with web display capabilities. [@ohos.web.webview](../apis/ArkWeb/cj-apis-webview.md) offers web control functionalities.

## Import Module

```cangjie
import kit.ArkUI.*
```

## Subcomponents

None

## Creating Components

### init(ResourceStr, WebviewController)

```cangjie
public init(
    src!: ResourceStr,
    controller!: WebviewController
)
```

**Functionality:** Creates a Web component.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| src | [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr) | Yes | - | **Named parameter.** The src cannot be dynamically changed via state variables (e.g., @State). |
| controller | [WebviewController](../apis/ArkWeb/cj-apis-webview.md#class-webviewcontroller) | Yes | - | **Named parameter.** Sets the Web controller. |

## Universal Attributes/Events

**Universal Attributes:** Only supports [aspectRatio](./cj-universal-attribute-layoutconstraints.md#func-aspectratioint64), [backdropBlur](./cj-universal-attribute-background.md#func-backdropblurfloat64), [backgroundColor](./cj-universal-attribute-background.md#func-backgroundcolorresourcecolor), [bindContentCover](./cj-universal-attribute-menu.md), [bindContextMenu](./cj-universal-attribute-menu.md#func-bindcontextmenu---unit-responsetype), [bindMenu](./cj-universal-attribute-menu.md#func-bindmenu---unit), [bindSheet](./cj-universal-attribute-sheettransition.md#func-bindsheetbool----unit-sheetoptions), [borderColor](./cj-information-display-progress.md#var-bordercolor), [borderRadius](./cj-common-types.md#class-borderradiuses), [borderStyle](./cj-common-types.md#enum-borderstyle), [borderWidth](./cj-information-display-badge.md#var-borderwidth), [clip](./cj-common-types.md#clip), [constraintSize](./cj-universal-attribute-size.md#func-constraintsizelength-length-length-length), [defaultFocus](./cj-universal-attribute-focus.md#func-defaultfocusbool), [focusable](./cj-universal-attribute-popup.md#var-focusable), [tabIndex](./cj-universal-attribute-focus.md#func-tabindexint32), [groupDefaultFocus](./cj-universal-attribute-focus.md#func-groupdefaultfocusbool), [displayPriority](./cj-universal-attribute-layoutconstraints.md#func-displaypriorityint32), [draggable](./cj-image-video-image.md#func-draggablebool), [enabled](./cj-universal-attribute-enable.md#func-enabledbool), [flexBasis](./cj-universal-attribute-flexlayout.md#func-flexbasislength), [flexShrink](./cj-universal-attribute-flexlayout.md#func-flexshrinkfloat64), [layoutWeight](./cj-universal-attribute-size.md#func-layoutweightint32), [id](./cj-universal-attribute-componentid.md), [height](./cj-universal-attribute-size.md#func-heightlength), [touchable](./cj-apis-window.md#let-touchable), [margin](./cj-universal-attribute-size.md#func-marginlength), [markAnchor](./cj-universal-attribute-location.md#func-markanchorlength-length), [mask](./cj-scroll-swipe-swiper.md#func-maskbool), [offset](./cj-apis-componentutils.md#class-offset), [width](./cj-apis-display.md#var-width), [zIndex](./cj-animation-sharedtransition.md#var-zindex), [visibility](./cj-common-types.md#enum-visibility), [scale](./cj-animation-pagetransition.md#func-scalefloat32-float32-float32-length-length), [transform](./cj-apis-componentutils.md#let-transform), [responseRegion](./cj-universal-attribute-touchtarget.md#func-responseregionarrayarrayrectangle), [size](./cj-apis-componentutils.md#let-size), [opacity](./cj-animation-pagetransition.md#func-opacityfloat64), [shadow](./cj-information-display-progress.md#var-shadow), [gesture](./cj-universal-gesture-bind.md#func-gesturegesturetype), [sharedTransition](./cj-animation-sharedtransition.md#func-sharedtransitionstring-sharedtransitionoptions), [transition](./cj-animation-transition.md#func-transition).

<!-- note -->
**Universal Events:** Only supports [onAppear](./cj-universal-attribute-menu.md#var-onappear), [onDisAppear](./cj-universal-attribute-menu.md#var-ondisappear), [onBlur](cj-ui-framework.md#func-onblur---unit), [onFocus](cj-ui-framework.md#func-onblur---unit), [onDragEnd](./cj-universal-event-drag.md#func-ondragenddrageventstring---unit), [onDragEnter](./cj-universal-event-drag.md#func-ondragenterdrageventstring---unit), [onDragStart](./cj-universal-event-drag.md#func-ondragstartdrageventstring------unit), [onDragMove](./cj-universal-event-drag.md#func-ondragmovedrageventstring---unit), [onDragLeave](./cj-universal-event-drag.md#func-ondragleavedrageventstring---unit), [onDrop](./cj-universal-event-drag.md#func-ondropdrageventstring---unit), [onHover](./cj-universal-event-mouse.md), [onMouse](./cj-universal-event-mouse.md#func-onmousemouseevent), [onKeyEvent](./cj-universal-event-key.md#func-onkeyeventkeyevent-unit), [onTouch](./cj-universal-event-touch.md#func-ontouchtouchevent-unit), [onVisibleAreaChange](./cj-ui-framework.md#func-onvisibleareachangearrayfloat64-bool-float64-unit---unit).

## Component Attributes

### func darkMode(WebDarkMode)

```cangjie
public func darkMode(mode: WebDarkMode): This
```

**Functionality:** Sets the Web dark mode, which is disabled by default. When dark mode is enabled, the Web will apply the dark styles defined in the webpage's media query `prefers-color-scheme`. If no dark styles are defined, the original styles remain. To enable forced dark mode, it is recommended to use it in conjunction with [forceDarkAccess](#func-forcedarkaccessbool).

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| mode | [WebDarkMode](./cj-common-types.md#enum-webdarkmode) | Yes | - | The dark mode of the Web can be off, on, or follow the system. <br> Initial value: WebDarkMode.Off. |

### func domStorageAccess(Bool)

```cangjie
public func domStorageAccess(domStorageAccess: Bool): This
```

**Functionality:** Sets whether to enable the Document Object Model Storage API (DOM Storage API) permissions.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| domStorageAccess | Bool | Yes | - | Whether to enable the Document Object Model Storage API (DOM Storage API) permissions. `true` means enabled, `false` means disabled. <br> Initial value: false. |

### func fileAccess(Bool)

```cangjie
public func fileAccess(fileAccess: Bool): This
```

**Functionality:** Sets whether to enable access to the application's file system, which is enabled by default. Files in the `rawfile` path are not affected by this attribute and remain accessible.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| fileAccess | Bool | Yes | - | Whether to enable access to the application's file system, which is enabled by default. |

### func forceDarkAccess(Bool)

```cangjie
public func forceDarkAccess(access: Bool): This
```

**Functionality:** Sets whether to enable forced dark mode for webpages. Disabled by default. This attribute only takes effect when dark mode is enabled via `darkMode`.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| access | Bool | Yes | - | Whether to enable forced dark mode for webpages. `true`: enabled, `false`: disabled. |

### func geolocationAccess(Bool)

```cangjie
public func geolocationAccess(geolocationAccess: Bool): This
```

**Functionality:** Sets whether to enable geolocation permissions, which are enabled by default.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| geolocationAccess | Bool | Yes | - | Whether to enable geolocation permissions. |

### func imageAccess(Bool)

```cangjie
public func imageAccess(imageAccess: Bool): This
```

**Functionality:** Sets whether to allow automatic loading of image resources, which is allowed by default.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| imageAccess | Bool | Yes | - | Whether to allow automatic loading of image resources. |

### func javaScriptProxy(Array\<(String) -> String>, String, Array\<String>, WebviewController)

```cangjie
public func javaScriptProxy(funcList!: Array<(String) -> String>, name!: String, methodList!: Array<String>,
    controller!: WebviewController): This
```

**Functionality:** Injects a JavaScript object into the `window` object, allowing methods of this object to be called within the `window` object.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| funcList | Array\<(String)->String> | Yes | - | **Named parameter.** The synchronous methods of the JavaScript object to be registered on the application side. |
| name | String | Yes | - | **Named parameter.** The name of the registered object, which matches the object name used in `window`. |
| methodList | Array\<String> | Yes | - | **Named parameter.** The asynchronous methods of the JavaScript object to be registered on the application side. |
| controller | [WebviewController](../apis/ArkWeb/cj-apis-webview.md#class-webviewcontroller) | Yes | - | **Named parameter.** Sets the Web controller. |

### func mixedMode(MixedMode)

```cangjie
public func mixedMode(mixedMode: MixedMode): This
```

**Functionality:** Sets whether to allow loading mixed content (HTTP and HTTPS), which is disallowed by default.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| mixedMode | [MixedMode](#enum-mixmode) | Yes | - | Mixed content. <br> Initial value: MixedMode.None, meaning secure origins are not allowed to load insecure content. |

### func nestedScroll(NestedScrollMode, NestedScrollMode)

```cangjie
public func nestedScroll(
    scrollForward!: NestedScrollMode,
    scrollBackward!: NestedScrollMode
): This
```

**Functionality:** Sets the nested scroll mode for forward and backward directions, enabling scroll linkage with parent components.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| scrollForward | [NestedScrollMode](./cj-common-types.md#enum-nestedscrollmode) | Yes | - | **Named parameter.** Forward scroll direction. |
| scrollBackward | [NestedScrollMode](./cj-common-types.md#enum-nestedscrollmode) | Yes | - | **Named parameter.** Backward scroll direction. |

### func verticalScrollBarAccess(Bool)

```cangjie
public func verticalScrollBarAccess(verticalScrollBar: Bool): This
```

**Functionality:** Sets whether to display the vertical scrollbar, including both system-default and custom scrollbars. Displayed by default.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| verticalScrollBar | Bool | Yes | - | Whether to display the vertical scrollbar. `true` means display, `false` means hide. <br> Initial value: true. |

### func zoomAccess(Bool)

```cangjie
public func zoomAccess(zoomAccess: Bool): This
```

**Functionality:** Sets whether to support gesture-based zooming, which is allowed by default.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| zoomAccess | Bool | Yes | - | Whether to support gesture-based zooming. `true` means support, `false` means no support. <br> Initial value: true. |

## Component Events

### func onLoadIntercept(Callback\<OnLoadInterceptEvent,Bool>)

```cangjie
public func onLoadIntercept(callback: Callback<OnLoadInterceptEvent, Bool>): This
```

**Functionality:** Triggers this callback before the Web component loads a URL, allowing the decision to block the access. Allowed by default.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | [Callback](../apis/BasicServicesKit/cj-apis-base.md#type-callback)\<[OnLoadInterceptEvent](#class-onloadinterceptevent),Bool> | Yes | - | Callback function triggered when resource loading is intercepted. <br> Returns a boolean. `true` means block the loading, otherwise allow it. |

### func onPageBegin(Callback\<OnPageBeginEvent,Unit>)

```cangjie
public func onPageBegin(callback: Callback<OnPageBeginEvent, Unit>): This
```

**Functionality:** Triggers this callback when webpage loading starts, only for the main frame. Loading of iframe or frameset content does not trigger this callback.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | [Callback](../apis/BasicServicesKit/cj-apis-base.md#type-callback)\<[OnPageBeginEvent](#class-onpagebeginevent),Unit> | Yes | - | Callback function triggered when webpage loading starts. |

### func onPageEnd(Callback\<OnPageEndEvent,Unit>)

```cangjie
public func onPageEnd(callback: Callback<OnPageEndEvent, Unit>): This
```

**Functionality:** Triggers this callback when webpage loading completes, only for the main frame.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | [Callback](../apis/BasicServicesKit/cj-apis-base.md#type-callback)\<[OnPageEndEvent](#class-onpageendevent),Unit> | Yes | - | Callback function triggered when webpage loading ends. |

### func onlineImageAccess(Bool)

```cangjie
public func onlineImageAccess(onlineImageAccess: Bool): This
```

**Functionality:** Sets whether to allow loading image resources from the network (resources accessed via HTTP and HTTPS), which is allowed by default.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| onlineImageAccess | Bool | Yes | - | Whether to allow loading image resources from the network. `true` means allow, `false` means disallow. <br> Initial value: true. |

## Basic Type Definitions

### class Header

```cangjie
public class Header {
    public var headerKey: String
    public var headerValue: String
}
```

**Functionality:** Describes the request/response header object returned by the Web component.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

#### var headerKey

```cangjie
public var headerKey: String
```

**Functionality:** The key of the request/response header.

**Type:** String

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

#### var headerValue

```cangjie
public var headerValue: String
```

**Functionality:** The value of the request/response header.

**Type:** String

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:**### class OnPageBeginEvent

```cangjie
public class OnPageBeginEvent {
    public var url: String


    public init(url: String)
}
```

**Description:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

#### var url

```cangjie
public var url: String
```

**Description:** The URL of the currently loading page.

**Type:** String

**Access:** Read-Write

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

#### init(String)

```cangjie

public init(url: String)
```

**Description:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| url | String | Yes | - | The URL of the currently loading page. |

### class OnPageEndEvent

```cangjie
public class OnPageEndEvent {
    public var url: String


    public init(url: String)
}
```

**Description:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

#### var url

```cangjie
public var url: String
```

**Description:** The URL of the currently loading page.

**Type:** String

**Access:** Read-Write

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

#### init(String)

```cangjie

public init(url: String)
```

**Description:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| url | String | Yes | - | The URL of the currently loading page. |

### class OnPermissionRequestEvent

```cangjie
public class OnPermissionRequestEvent {
    public var request: PermissionRequest


    public init(request: PermissionRequest)
}
```

**Description:** Describes the parameter structure for notifying when a permission request is received.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

#### var request

```cangjie
public var request: PermissionRequest
```

**Description:** The object returned by the Web component for granting or denying permissions. Example code can be found in the [onPermissionRequest](#class-onpermissionrequestevent) event.

**Type:** [PermissionRequest](#class-permissionrequest)

**Access:** Read-Write

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

#### init(PermissionRequest)

```cangjie

public init(request: PermissionRequest)
```

**Description:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| request | [PermissionRequest](#class-permissionrequest) | Yes | - | <font color="red" face="bold">please add description</font> |

### class PermissionRequest

```cangjie
public class PermissionRequest {}
```

**Description:** The object returned by the Web component for granting or denying permissions. Example code can be found in the [onPermissionRequest](#class-onpermissionrequestevent) event.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

#### func deny()

```cangjie

public func deny(): Unit
```

**Description:** Denies the permission requested by the webpage.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

#### func getAccessibleResource()

```cangjie

public func getAccessibleResource(): Array<String>
```

**Description:** Retrieves the list of permission resources requested by the webpage.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<String> | The list of permission resources requested by the webpage. |

#### func getOrigin()

```cangjie

public func getOrigin(): String
```

**Description:** Retrieves the origin of the webpage.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The origin of the webpage requesting the permission. |

#### func grant(Array\<String>)

```cangjie

public func grant(resources: Array<String>): Unit
```

**Description:** Grants permission for screen capture operations requested by the webpage.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| resources | Array\<String> | Yes | - | Screen capture configuration. |

### class WebResourceRequest

```cangjie
public class WebResourceRequest {}
```

**Description:** The Web component resource response object. Example code can be found in the [onHttpErrorReceive](#class-onhttperrorreceiveevent) event.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

#### func getRequestHeader()

```cangjie

public func getRequestHeader(): Array<Header>
```

**Description:** Retrieves the request header information of the resource.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<[Header](#class-header)> | The request header information of the resource. |

#### func getRequestMethod()

```cangjie

public func getRequestMethod(): String
```

**Description:** Retrieves the request method.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The request method. |

#### func getRequestUrl()

```cangjie

public func getRequestUrl(): String
```

**Description:** Retrieves the URL information of the resource request.
**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The URL information of the resource request. |

#### func isMainFrame()

```cangjie

public func isMainFrame(): Bool
```

**Description:** Determines whether the resource request is for the main frame.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the resource request is for the main frame, false otherwise. |

#### func isRedirect()

```cangjie

public func isRedirect(): Bool
```

**Description:** Determines whether the resource request has been redirected by the server.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the resource request has been redirected by the server, false otherwise. |

#### func isRequestGesture()

```cangjie

public func isRequestGesture(): Bool
```

**Description:** Determines whether the resource request is associated with a gesture (e.g., a click).

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the resource request is associated with a gesture (e.g., a click), false otherwise. |

### enum MixedMode

```cangjie
public enum MixedMode <: Equatable<MixedMode> {
    | All
    | Compatible
    | None
    | ...
}
```

**Description:** Sets the security loading mode for mixed content.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<MixedMode>

#### All

```cangjie
All
```

**Description:** Loose mode: Allows loading both HTTP and HTTPS mixed content. All insecure content can be loaded.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### Compatible

```cangjie
Compatible
```

**Description:** Compatibility mode: Mixed content compatibility mode, where some insecure content may be loaded.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### None

```cangjie
None
```

**Description:** Strict mode: Disallows loading HTTP and HTTPS mixed content. Prevents secure origins from loading insecure content.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### func !=(MixedMode)

```cangjie
public operator func !=(other: MixedMode): Bool
```

**Description:** Compares whether two enum values are not equal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [MixedMode](#enum-mixedmode) | Yes | - | The other enum value to compare. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are not equal, false otherwise. |

#### func ==(MixedMode)

```cangjie
public operator func ==(other: MixedMode): Bool
```

**Description:** Compares whether two enum values are equal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [MixedMode](#enum-mixedmode) | Yes | - | The other enum value to compare. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, false otherwise. |## Sample Code

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.ArkWeb.*

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    @State var url: String = "www.example.com"
    func build() {
        Column(10) {
            Button("refresh")
            .onClick {
                evt =>
                Hilog.info(0, "AppLogCj", "refresh")
                webController.refresh()
            }.width(400.px).height(150.px)
            Button("loadUrl")
            .onClick {
                evt =>
                Hilog.info(0, "AppLogCj", "loadUrl")
                webController.loadUrl(this.url)

            }.width(400.px).height(150.px)
            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                Hilog.info(0, "AppLogCj", "page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                Hilog.info(0, "AppLogCj", "page end url: ${evt.url}")
            })
        }
    }
}
```