# Safe Area Calculation and Avoidance Adaptation in Web Pages

## Overview

The safe area is defined as the display area of a page that, by default, does not overlap with the system's non-safe areas (such as the status bar and navigation bar), ensuring that the interfaces designed by developers are laid out within the safe area. However, when the Web component enables immersive mode, webpage elements may overlap with the status bar or navigation bar. As shown in Figure 1, the area enclosed by the red dashed line represents the safe area, while the top status bar, screen cutout area, and bottom navigation bar are defined as non-safe areas. When the Web component enables the immersive effect, the bottom elements of the webpage overlap with the navigation bar.

**Figure 1** Bottom elements of the webpage overlapping with the navigation bar when the Web component enables immersive effect

![web-safe-area](figures/arkweb_safearea2.png)

The Web component provides the capability to calculate the safe area and perform avoidance adaptation using W3C CSS, supporting normal display of pages on devices with irregular screens under immersive effects. Web developers can use this capability to avoid overlapping elements. The ArkWeb kernel continuously monitors the position and size of the Web component and the system's safe area, calculating the current safe area of the Web component and the specific distances to be avoided in each direction based on their overlapping parts.

## Implementation Scenarios

### Enabling Immersive Effect for Web Components

Developers can enable the immersive effect via [expandSafeArea](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-expandsafearea.md#func-expandsafeareaarraysafeareatype-arraysafeareaedge).

<!-- compile -->

```cangjie
// index.cj
import ohos.state_macro_manage.*
import kit.ArkWeb.WebviewController
import kit.UIKit.{ Web, SafeAreaType, SafeAreaEdge }

@Entry
@Component
class EntryView {
    let webController = WebviewController()

    func build() {
        Column {
            Web(src: 'www.example.com', controller: this.webController)
                .width(100.percent)
                .height(100.percent)
                .expandSafeArea(types: [SafeAreaType.SYSTEM], edges: [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
        }
    }
}
```

### Setting the Layout of Web Pages in the Visual Viewport

`viewport-fit` is used to constrain the display mode of the webpage within the safe area. The default value is `auto`, which behaves the same as `contain`, indicating that the visual viewport completely contains the webpage content, i.e., all webpage content is displayed within the safe area. `cover` means the webpage content completely covers the visual viewport, i.e., the webpage content is displayed not only in the safe area but also in the non-safe area, potentially overlapping with the status bar and navigation bar. Only in this scenario does the webpage require avoidance adaptation. The setting method is as follows:

```html
<meta name='viewport' content='viewport-fit=cover'>
```

### Avoiding Overlapping for Webpage Elements

The avoidance adaptation of webpage elements primarily relies on the `env()` CSS function, which is used to insert user-defined variables into CSS. This allows developers to place content within the safe area of the visual viewport. The `safe-area-inset-*` values defined in the specification ensure that content is fully displayed even in non-rectangular viewports. The syntax is as follows:

```html
/* safe-area-inset-* can set avoidance values for top, right, bottom, and left directions */
env(safe-area-inset-top);
env(safe-area-inset-right);
env(safe-area-inset-bottom);
env(safe-area-inset-left);

/* Based on fallback, use safe-area-inset-* to set avoidance values in four directions */
/* For length units, refer to: https://developer.mozilla.org/zh-CN/docs/Web/CSS/length */
env(safe-area-inset-top, 20px);
env(safe-area-inset-right, 1em);
env(safe-area-inset-bottom, 0.5vh);
env(safe-area-inset-left, 1.4rem);
```

> **Note:**
>
> `safe-area-inset-*` consists of four environment variables that define the `top`, `right`, `bottom`, and `left` edges of the rectangle within the visual viewport, ensuring content can be safely placed without being cut off by non-rectangular display areas. In rectangular viewports (e.g., displays of ordinary 2-in-1 devices), these values are zero. For non-rectangular displays (e.g., circular watch faces, mobile device screens), all content will be visible within the rectangular area formed by the four values set by the user agent.

Unlike other CSS properties, user agent-defined property names are case-sensitive. Additionally, note that `env()` must be used with `viewport-fit=cover`.

For some e-commerce websites, the bottom of the homepage is an absolutely positioned element in the form of a Tab. In immersive mode, these absolutely positioned elements require bottom avoidance to prevent overlap with the system navigation bar. The avoidance effect is shown in Figure 2:

```html
.tab-bottom {
    padding-bottom: env(safe-area-inset-bottom);
}
```

Furthermore, the above `env()` usage can also be combined with mathematical calculation functions such as `calc()`, `min()`, and `max()`, for example:

```html
.tab-bottom {
    padding-bottom: max(env(safe-area-inset-bottom), 30px);
}
```

**Figure 2** Bottom elements of the webpage avoiding the navigation bar area when the Web component enables immersive effect

![web-safe-area](figures/arkweb_safearea1.png)