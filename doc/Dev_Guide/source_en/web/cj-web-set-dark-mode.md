# Configuring Dark Mode

The Web component supports dark mode configuration for frontend pages.

- The `darkMode()` interface can be used to configure different dark mode settings, which is disabled by default. When dark mode is enabled, the Web component will apply the dark styles defined in the webpage's `prefers-color-scheme` media query. If no dark styles are defined, the original appearance will be maintained. To enable forced dark mode, it is recommended to use it in conjunction with `forceDarkAccess()`. The `[WebDarkMode.Off](../../../API_Reference/source_en/arkui-cj/cj-common-types.md#enum-webdarkmode)` mode indicates that dark mode is disabled. `[WebDarkMode.On](../../../API_Reference/source_en/arkui-cj/cj-common-types.md#enum-webdarkmode)` enables dark mode and follows the frontend page's settings. `[WebDarkMode.Auto](../../../API_Reference/source_en/arkui-cj/cj-common-types.md#enum-webdarkmode)` enables dark mode and follows the system settings.

    In the following example, the `darkMode()` interface is used to configure the page's dark mode to follow the system settings.

    <!-- compile -->

    ```cangjie
    // index.cj
    import kit.ArkWeb.WebviewController
    import kit.UIKit.{Web, WebDarkMode}
    import ohos.state_macro_manage.rawfile
    import kit.LocalizationKit.{__GenerateResource__}

    @Entry
    @Component
    class EntryView {
        let webController = WebviewController()

        func build() {
            Column {
                Web(src: @rawfile("index.html"), controller: webController)
                    .darkMode(WebDarkMode.Auto)
            }
        }
    }
    ```

- The `forceDarkAccess()` interface can be used to forcibly configure dark mode for the frontend page. Forced dark mode does not guarantee that all color conversions will meet expectations, and the dark mode will not follow the frontend page or system settings. When configuring this mode, dark mode must be set to `WebDarkMode.On`.

    In the following example, the `forceDarkAccess()` interface is used to forcibly configure the page to dark mode.

    <!-- compile -->

    ```cangjie
    // index.cj
    import kit.ArkWeb.WebviewController
    import kit.UIKit.{Web, WebDarkMode}
    import ohos.state_macro_manage.rawfile
    import kit.LocalizationKit.{__GenerateResource__}

    @Entry
    @Component
    class EntryView {
        let webController = WebviewController()

        func build() {
            Column {
                Web(src: @rawfile("index.html"), controller: webController)
                    .darkMode(WebDarkMode.On)
                    .forceDarkAccess(true)
            }
        }
    }
    ```

- index.html page code:

    ```html
    <!-- resources/rawfile/index.html -->
    <!DOCTYPE html>
    <html>
    <head>
        <meta name="viewport" content="width=device-width,
                                        initial-scale=1.0,
                                        maximum-scale=1.0,
                                        user-scalable=no">
        <style type="text/css">
            @media (prefers-color-scheme: dark) {
                .contentCss{ background:  #000000; color: white; }
                .hrefCss{ color: #317AF7; }
            }
        </style>
    </head>
    <body class="contentCss">
    <div style="text-align:center">
        <p>Dark mode debug page</p>
    </div>
    </body>
    </html>
    ```