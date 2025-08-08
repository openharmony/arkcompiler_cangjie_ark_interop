# Web Page Content Scrolling

The `Webview.WebviewController` in ArkWeb provides `scrollTo` and `scrollBy` interfaces.

When the displayed content size in Web is significantly larger than the component size, users can use `scrollTo` and `scrollBy` to scroll through the displayed content on the Web page to reveal hidden portions, with the ability to generate animated scrolling effects. Currently, the animation effect does not support gesture interruption, but can be forcibly interrupted by executing another animation with a duration of approximately 0.

> **Note:**
>
> Scrolling is supported when: The length or width of the Web page exceeds that of the display area.

<!-- compile -->

```cangjie
// index.cj
import ohos.state_macro_manage.*
import kit.ArkWeb.WebviewController
import kit.UIKit.{Web, BusinessException, Button}
import kit.LocalizationKit.{__GenerateResource__}

@Entry
@Component
class EntryView {
    let webController = WebviewController()

    func build() {
        Column {
            Button("scrollTo").onClick { evt =>
                try {
                    webController.scrollTo(50.0, 50.0, duration: 500)
                    AppLog.info("scrollTo success")
                } catch (e: BusinessException) {
                    AppLog.error("scrollTo ErrorCode: ${e.code},  Message: ${e.message}")
                }
            }
            Button("scrollBy").onClick { evt =>
                try {
                    webController.scrollBy(50.0, 50.0, duration: 500)
                    AppLog.info("scrollBy success")
                } catch (e: BusinessException) {
                    AppLog.error("scrollBy ErrorCode: ${e.code},  Message: ${e.message}")
                }
            }
            Button("scrollStop").onClick { evt =>
                try {
                    webController.scrollBy(0.0, 0.0, duration: 1)
                    AppLog.info("scrollStop success")
                } catch (e: BusinessException) {
                    AppLog.error("scrollStop ErrorCode: ${e.code},  Message: ${e.message}")
                }
            }
            Web(src: @rawfile("index.html"), controller: webController)
        }
    }
}
```

```html
<!-- resources/rawfile/index.html -->
<html>
<head>
    <title>Demo</title>
    <style>
        body {
            width:2000px;
            height:2000px;
            padding-right:170px;
            padding-left:170px;
            border:25px solid blueviolet
            back
        }
        .scroll-text {
        font-size: 75px;
        }
    </style>
</head>
<body>
<div class="scroll-text">Scroll Text</div>
</body>
</html>
```

![web-content-scrolling](figures/web-content-scrolling.gif)