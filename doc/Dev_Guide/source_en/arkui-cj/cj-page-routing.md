# Page Routing (ohos.router) (Not Recommended)

Page routing refers to the implementation of navigation and data transfer between different pages in an application. The Router module facilitates page routing through different URL addresses, enabling easy access to various pages. This document will introduce how to implement page routing using the Router module from the aspects of [Page Navigation](#page-navigation), [Page Return](#page-return), and [Adding a Confirmation Dialog Before Page Return](#adding-a-confirmation-dialog-before-page-return).

> **Note:**
>
> The [Navigation component](./cj-navigation-navigation.md) offers more powerful features and customization capabilities. It is recommended to use this component as the routing framework for applications. For differences between Navigation and Router, refer to the [Router to Navigation Migration Guide](./cj-router-to-navigation.md).

## Page Navigation

Page navigation is a crucial part of the development process. When using an application, users often need to navigate between different pages, sometimes transferring data from one page to another.

**Figure 1** Page Navigation

![Page Navigation](./figures/page-router.gif)

The Router module provides two navigation modes: [Router.pushUrl](../../../API_Reference/source_zh_cn/arkui-cj/cj-apis-router.md#func-pushUrl) and [Router.replaceUrl](../../../API_Reference/source_zh_cn/arkui-cj/cj-apis-router.md#func-replaceUrl). These modes determine whether the target page will replace the current page.

- Router.pushUrl: The target page does not replace the current page but is pushed onto the page stack. This preserves the current page's state, allowing users to return to it via the back button or by calling the [Router.back](../../../API_Reference/source_zh_cn/arkui-cj/cj-apis-router.md#func-back) method.

- Router.replaceUrl: The target page replaces the current page, and the current page is destroyed. This releases the current page's resources, making it impossible to return to it.

> **Note:**
>
> The maximum capacity of the page stack is 32 pages. If this limit is exceeded, you can call the [Router.clear](../../../API_Reference/source_zh_cn/arkui-cj/cj-apis-router.md#func-clear) method to clear the historical page stack and free up memory space.

Additionally, the Router module provides two instance modes: Standard and Single. These modes determine whether the target URL corresponds to multiple instances.

- Standard: Multi-instance mode, which is the default navigation mode. The target page is added to the top of the page stack, regardless of whether a page with the same URL exists in the stack.

- Single: Single-instance mode. If a page with the target URL already exists in the page stack, the closest page with the same URL to the top of the stack is moved to the top, becoming the new page. If no page with the target URL exists in the stack, the navigation proceeds in the default multi-instance mode.

Before using Router-related functionalities, you need to import the Router module in your code.

```cangjie
import kit.ArkUI.Router
```

- **Scenario 1**: There is a home page (Home) and a details page (Detail). You want to navigate from the home page to the details page by clicking on a product. The home page should remain in the page stack so that its state can be restored upon return. In this scenario, use the pushUrl method with the Standard instance mode (or omit it).

  ```cangjie
  import kit.ArkUI.Router

  func onJumpClick() {
    Router.pushUrl(url: 'pages/Detail', mode: RouterMode.Standard, callback: { code => })
  }
  ```

  > **Note:**
  >
  > In multi-instance mode, the RouterMode.Standard parameter can be omitted.

- **Scenario 2**: There is a login page (Login) and a profile page (Profile). After successful login, you want to navigate from the login page to the profile page. The login page should be destroyed, and the application should exit directly upon return. In this scenario, use the replaceUrl method with the Standard instance mode (or omit it).

  ```cangjie
  import kit.ArkUI.Router

  func onJumpClick() {
    Router.replaceUrl(url: 'pages/Profile', mode: RouterMode.Standard, callback: { code => })
  }
  ```

  > **Note:**
  >
  > In multi-instance mode, the RouterMode.Standard parameter can be omitted.

- **Scenario 3**: There is a settings page (Setting) and a theme-switching page (Theme). You want to navigate from the settings page to the theme-switching page by clicking on a theme option. Only one theme-switching page should exist in the page stack at any time, and returning should take you directly back to the settings page. In this scenario, use the pushUrl method with the Single instance mode.

  ```cangjie
  import kit.ArkUI.Router

  // In the Setting page
  func onJumpClick() {
    Router.replaceUrl(url: 'pages/Theme' // Target URL
    , mode: RouterMode.Single, callback: { code => })
  }
  ```

- **Scenario 4**: There is a search results list page (SearchResult) and a search details page (SearchDetail). You want to navigate from the search results list page to the search details page by clicking on a result. If the result has already been viewed, a new details page should not be created; instead, navigation should proceed to the existing details page. In this scenario, use the replaceUrl method with the Single instance mode.

  ```cangjie
  import kit.ArkUI.Router

  // In the SearchResult page
  func onJumpClick() {
    Router.replaceUrl(url: 'pages/SearchDetail' // Target URL
    , mode: RouterMode.Single, callback: { code => })
  }
  ```

The above scenarios do not involve parameter transfer.

If you need to pass data to the target page during navigation, you can add a params property when calling the Router module's methods and specify a string as the parameter. For example:

```cangjie
import kit.ArkUI.Router

func onJumpClick() {
    Router.pushUrl(url: 'pages/Detail', params: "pagesparams", mode: RouterMode.Standard, callback: { code => })
}
```

In the target page, you can retrieve the passed parameters by calling the Router module's [getParams](../../../API_Reference/source_zh_cn/arkui-cj/cj-apis-router.md#func-getParams) method. For example:

```cangjie
import kit.ArkUI.Router

var params: String = "params"
var params_get: Option<String> = Router.getParams()
var id : Option<String> = params_get
```

## Page Return

After completing operations on a page, users often need to return to the previous page or a specified page, which requires the page return functionality. During the return process, you may need to pass data to the target page, which requires the data transfer functionality.

**Figure 2** Page Return

![Page Return](./figures/page_back.gif)

Before using the page routing Router-related functionalities, you need to import the Router module in your code.

```cangjie
import kit.ArkUI.Router
```

You can use the following methods to return to a page:

- **Method 1**: Return to the previous page.

  ```cangjie
  import kit.ArkUI.Router

  Router.back()
  ```

  This method returns to the previous page, i.e., the page's position in the stack. However, the previous page must exist in the stack for this method to work; otherwise, it will be ineffective.

- **Method 2**: Return to a specified page.

  Return to a regular page.

  ```cangjie
  import kit.ArkUI.Router

  Router.back(
    url: 'pages/Home'
  )
  ```

  Return to a named route page.

  ```cangjie
  import kit.ArkUI.Router

  Router.back(
    url: 'myPage' // myPage is the alias of the named route page to return to
  )
  ```

  This method allows returning to a specified page by providing the target page's path. The target page must exist in the stack for this method to work.

- **Method 3**: Return to a specified page and pass custom parameters.

  Return to a regular page.

  ```cangjie
  import kit.ArkUI.Router

  Router.back(
    url: 'pages/Home',
    params: 'From Home Page'
  )
  ```

  Return to a named route page.

  ```cangjie
  import kit.ArkUI.Router

  Router.back(
    url: 'myPage',
    params: 'From Home Page'
  )
  ```

  This method not only returns to a specified page but also passes custom parameters during the return. These parameters can be retrieved and parsed in the target page by calling the Router.getParams method.

In the target page, call the Router.getParams method where needed to retrieve the parameters:

```cangjie
import kit.ArkUI.Router

@Entry
@Component
class EntryView {
  @State var message: String = 'Hello World'

  public override func onPageShow() {
    var params:Option<String> = Router.getParams() // Retrieve the passed parameter object
        var info: Option<String> = params // Retrieve the value of the info property
  }
  // ...
}
```

> **Note:**
>
> When using the Router.back method to return to a specified page, all pages from the top of the stack (inclusive) to the specified page (exclusive) will be popped from the stack and destroyed.
>
> Additionally, if the Router.back method is used to return to the original page, the original page will not be recreated. Therefore, variables declared with @State will not be redeclared, and the page's aboutToAppear lifecycle callback will not be triggered. If you need to use custom parameters passed during the return in the original page, parse the parameters where needed. For example, parse the parameters in the onPageShow lifecycle callback.

## Adding a Confirmation Dialog Before Page Return

During application development, to prevent user misoperations or data loss, it is sometimes necessary to display a confirmation dialog before the user returns from one page to another, asking for confirmation to proceed.

This document will introduce how to implement this functionality from the aspects of [System Default Confirmation Dialog](#system-default-confirmation-dialog) and [Custom Confirmation Dialog](#custom-confirmation-dialog).

**Figure 3** Adding a Confirmation Dialog Before Page Return

![Adding a Confirmation Dialog Before Page Return](./figures/page_ask.gif)

### System Default Confirmation Dialog

To implement this functionality, you can use two methods provided by the Router module: [Router.showAlertBeforeBackPage](../../../API_Reference/source_zh_cn/arkui-cj/cj-apis-router.md#func-showAlertBeforeBackPage) and [Router.back](../../../API_Reference/source_zh_cn/arkui-cj/cj-apis-router.md#func-back).

Before using the Router-related functionalities, you need to import the Router module in your code.

```cangjie
import kit.ArkUI.Router
```

To enable a confirmation dialog before returning from the target page, you need to call the [Router.showAlertBeforeBackPage](../../../API_Reference/source_zh_cn/arkui-cj/cj-apis-router.md#func-showAlertBeforeBackPage) method to set the dialog's message before calling the [Router.back](../../../API_Reference/source_zh_cn/arkui-cj/cj-apis-router.md#func-back) method. For example, define a click event handler for a back button in a payment page:

```cangjie
func onBackClick() {
  // Call router.showAlertBeforeBackPage() to set the confirmation dialog's message
  try {
    Router.showAlertBeforeBackPage(
      'You have not completed the payment. Are you sure you want to return?' // Set the dialog's content
      ,{ code => })
    } catch (e: Exception) {
        AppLog.error(e.toString())
        }
    // Call router.back() to return to the previous page
    Router.back()
}
```

The Router.showAlertBeforeBackPage method accepts an object as a parameter, which includes the following property:

message: A String representing the dialog's content.

If the call is successful, the confirmation dialog will be displayed before returning from the target page.

When the user clicks the "Back" button, a confirmation dialog will appear, asking if they are sure they want to return. Selecting "Cancel" will keep the user on the current page; selecting "Confirm" will trigger the Router.back method and execute the navigation based on the parameters.

### Custom Confirmation Dialog

A custom confirmation dialog can differentiate the application's interface from the system default dialog, improving the user experience. This document uses a popup as an example to demonstrate how to implement a custom confirmation dialog.

Before using the Router-related functionalities, you need to import the Router module in your code.

```cangjie
import kit.ArkUI.Router
```

In the event callback, call the popup method:

```cangjie
import kit.ArkUI.Router

func onBackClick() {
  // Display the custom confirmation dialog
  let buttons: Array<ButtonInfo> = [
                    ButtonInfo("Back", Color.BLACK),
                    ButtonInfo("Confirm", Color.BLACK)
                ]
  PromptAction.showDialog(
            message: 'You have not completed the payment. Are you sure you want to return?',
            buttons: buttons,
            callback: { err: Option<AsyncError>,
            i: Option<Int32> =>
                    if (i == 0){
                    AppLog.info ('User canceled the operation.')
                        }
                    else if (i == 1){
                    AppLog.info('User confirmed the operation.')
                    Router.back()
                        }
                      })
}
```

When the user clicks the "Back" button, a custom confirmation dialog will pop up, asking whether to confirm the return action. Selecting "Cancel" will keep the user on the current target page; selecting "Confirm" will trigger the `Router.back` method, and the navigation behavior will be determined based on the parameters.