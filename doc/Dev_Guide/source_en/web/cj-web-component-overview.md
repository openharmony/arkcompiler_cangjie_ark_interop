# Introduction to ArkWeb

## Usage Scenarios

ArkWeb (Ark Web) provides Web components for displaying web page content within applications. Common usage scenarios include:

- **Application-integrated Web pages**: Applications can use Web components to embed web page content, reducing development costs and improving development and operational efficiency.
- **Web browsing in browsers**: Browser applications can use Web components to open third-party web pages, browse in incognito mode, block ads, etc.
- **Mini-programs**: Mini-program host applications can use Web components to render mini-program pages.

## Capabilities

The Web component offers developers extensive control over web pages, including:

- **Web page loading**: Declarative loading of web pages and off-screen loading.
- **Lifecycle management**: Notifying changes in the component lifecycle state and web page loading status.
- **Common properties and events**: User-Agent management, Cookie and storage management, font and dark mode management, permission management, etc.
- **Interaction with application interfaces**: Custom text selection menus, context menus, file upload interfaces, and other interactive capabilities with the application interface.
- **JavaScript interaction**: Apps can interact with web pages via JavaScriptProxy.
- **Security and privacy**: Incognito browsing mode, ad blocking, Shield Protection mode, etc.
- **Debugging capabilities**: Debugging with [DevTools](cj-web-debugging-with-devtools.md) and collecting Web component crash information using crashpad.
- **Other advanced capabilities**: Same-layer rendering with native components, network hosting for Web components, media playback hosting for Web components, and custom input method invocation for Web component input fields<!--RP1--><!--RP1End-->.

## Constraints and Limitations

**Web kernel version**: ArkWeb is developed based on the Google Chromium kernel, using Chromium version M114.