# 页面路由（ohos.router）（不推荐）

页面路由指在应用程序中实现不同页面之间的跳转和数据传递。Router模块通过不同的url地址，可以方便地进行页面路由，轻松地访问不同的页面。本文将从[页面跳转](#页面跳转)、[页面返回](#页面返回)和[页面返回前增加一个询问框](#页面返回前增加一个询问框)这几个方面，介绍如何通过Router模块实现页面路由。

> **说明：**
>
> [组件导航 (Navigation)](../../../reference/source_zh_cn/arkui-cj/cj-navigation-switching-navigation.md)具有更强的功能和自定义能力，推荐使用该组件作为应用的路由框架。

## 页面跳转

页面跳转是开发过程中的一个重要组成部分。在使用应用程序时，通常需要在不同的页面之间跳转，有时还需要将数据从一个页面传递到另一个页面。

**图1** 页面跳转

![页面跳转](./figures/page-router.gif)

Router模块提供了两种跳转模式，分别是[Router.pushUrl](../../../reference/source_zh_cn/arkui-cj/cj-apis-router.md#func-pushurl)和[Router.replaceUrl](../../../reference/source_zh_cn/arkui-cj/cj-apis-router.md#func-replaceurl)。这两种模式决定了目标页面是否会替换当前页。

- Router.pushUrl：目标页面不会替换当前页，而是压入页面栈。这样可以保留当前页的状态，并且可以通过返回键或者调用[Router.back](../../../reference/source_zh_cn/arkui-cj/cj-apis-router.md#func-back)方法返回到当前页。

- Router.replaceUrl：目标页面会替换当前页，并销毁当前页。这样可以释放当前页的资源，并且无法返回到当前页。

> **说明：**
>
> 页面栈的最大容量为32个页面。如果超过这个限制，可以调用[Router.clear](../../../reference/source_zh_cn/arkui-cj/cj-apis-router.md#func-clear)方法清空历史页面栈，释放内存空间。

同时，Router模块提供了两种实例模式，分别是Standard和Single。这两种模式决定了目标url是否会对应多个实例。

- Standard：多实例模式，也是默认情况下的跳转模式。目标页面会被添加到页面栈顶，无论栈中是否存在相同url的页面。

- Single：单实例模式。如果目标页面的url已经存在于页面栈中，则会将离栈顶最近的同url页面移动到栈顶，该页面成为新建页。如果目标页面的url在页面栈中不存在同url页面，则按照默认的多实例模式进行跳转。

在使用Router相关功能之前，需要在代码中先导入Router模块。

```cangjie
import kit.ArkUI.Router
```

- 场景一：有一个主页（Home）和一个详情页（Detail），希望从主页点击一个商品，跳转到详情页。同时，需要保留主页在页面栈中，以便返回时恢复状态。这种场景下，可以使用pushUrl方法，并且使用Standard实例模式（或者省略）。

  ```cangjie
  import kit.ArkUI.Router

  func onJumpClick() {
    Router.pushUrl(url: 'pages/Detail', mode: RouterMode.Standard, callback: { code => })
  }
  ```

  > **说明：**
  >
  > 多实例模式下，RouterMode.Standard参数可以省略。

- 场景二：有一个登录页（Login）和一个个人中心页（Profile），希望从登录页成功登录后，跳转到个人中心页。同时，销毁登录页，在返回时直接退出应用。这种场景下，可以使用replaceUrl方法，并且使用Standard实例模式（或者省略）。

  ```cangjie
  import kit.ArkUI.Router

  func onJumpClick() {
    Router.replaceUrl(url: 'pages/Profile', mode: RouterMode.Standard, callback: { code => })
  }
  ```

  > **说明：**
  >
  > 多实例模式下，RouterMode.Standard参数可以省略。

- 场景三：有一个设置页（Setting）和一个主题切换页（Theme），希望从设置页点击主题选项，跳转到主题切换页。同时，需要保证每次只有一个主题切换页存在于页面栈中，在返回时直接回到设置页。这种场景下，可以使用pushUrl方法，并且使用Single实例模式。

  ```cangjie
  import kit.ArkUI.Router

  // 在Setting页面中
  func onJumpClick() {
    Router.replaceUrl(url: 'pages/Theme' // 目标url
    , mode: RouterMode.Single, callback: { code => })
  }
  ```

- 场景四：有一个搜索结果列表页（SearchResult）和一个搜索结果详情页（SearchDetail），希望从搜索结果列表页点击某一项结果，跳转到搜索结果详情页。同时，如果该结果已经被查看过，则不需要再新建一个详情页，而是直接跳转到已经存在的详情页。这种场景下，可以使用replaceUrl方法，并且使用Single实例模式。

  ```cangjie
  import kit.ArkUI.Router

  // 在SearchResult页面中
  func onJumpClick() {
    Router.replaceUrl(url: 'pages/SearchDetail' // 目标url
    , mode: RouterMode.Single, callback: { code => })
  }
  ```

以上是不带参数传递的场景。

如果需要在跳转时传递一些数据给目标页面，则可以在调用Router模块的方法时，添加一个params属性，并指定一个字符串作为参数。例如：

```cangjie
import kit.ArkUI.Router

func onJumpClick() {
    Router.pushUrl(url: 'pages/Detail', params: "pagesparams", mode: RouterMode.Standard, callback: { code => })
}
```

在目标页面中，可以通过调用Router模块的[getParams](../../../reference/source_zh_cn/arkui-cj/cj-apis-router.md#func-getParams)方法来获取传递过来的参数。例如:

```cangjie
import kit.ArkUI.Router

var params: String = "params"
var params_get: Option<String> = Router.getParams()
var id : Option<String> = params_get
```

## 页面返回

当用户在一个页面完成操作后，通常需要返回到上一个页面或者指定页面，这就需要用到页面返回功能。在返回的过程中，可能需要将数据传递给目标页面，这就需要用到数据传递功能。

**图2** 页面返回

![页面返回](./figures/page_back.gif)

在使用页面路由Router相关功能之前，需要在代码中先导入Router模块。

```cangjie
import kit.ArkUI.Router
```

可以使用以下几种方式返回页面：

- 方式一：返回到上一个页面。

  ```cangjie
  import kit.ArkUI.Router

  Router.back()
  ```

  这种方式会返回到上一个页面，即上一个页面在页面栈中的位置。但是，上一个页面必须存在于页面栈中才能够返回，否则该方法将无效。

- 方式二：返回到指定页面。

  返回普通页面。

  ```cangjie
  import kit.ArkUI.Router

  Router.back(
    url: 'pages/Home'
  )
  ```

  返回命名路由页面。

  ```cangjie
  import kit.ArkUI.Router

  Router.back(
    url: 'myPage' // myPage为返回的命名路由页面别名
  )
  ```

  这种方式可以返回到指定页面，需要指定目标页面的路径。目标页面必须存在于页面栈中才能够返回。

- 方式三：返回到指定页面，并传递自定义参数信息。

  返回到普通页面。

  ```cangjie
  import kit.ArkUI.Router

  Router.back(
    url: 'pages/Home',
    params: '来自Home页'
  )
  ```

  返回命名路由页面。

  ```cangjie
  import kit.ArkUI.Router

  Router.back(
    url: 'myPage',
    params: '来自Home页'
  )
  ```

  这种方式不仅可以返回到指定页面，还可以在返回的同时传递自定义参数信息。这些参数信息可以在目标页面中通过调用Router.getParams方法进行获取和解析。

在目标页面中，在需要获取参数的位置调用Router.getParams方法即可:

```cangjie
import kit.ArkUI.Router

@Entry
@Component
class EntryView {
  @State var message: String = 'Hello World'

  public override func onPageShow() {
    var params:Option<String> = Router.getParams() // 获取传递过来的参数对象
        var info: Option<String> = params // 获取info属性的值
  }
  // ...
}
```

> **说明：**
>
> 当使用Router.back方法返回到指定页面时，原栈顶页面（包括）到指定页面（不包括）之间的所有页面栈都将从栈中弹出并销毁。
>
> 另外，如果使用Router.back方法返回到原来的页面，原页面不会被重复创建，因此使用@State声明的变量不会重复声明，也不会触发页面的aboutToAppear生命周期回调。如果需要在原页面中使用返回页面传递的自定义参数，可以在需要的位置进行参数解析。例如，在onPageShow生命周期回调中进行参数解析。

## 页面返回前增加一个询问框

在开发应用时，为了避免用户误操作或者丢失数据，有时候需要在用户从一个页面返回到另一个页面之前，弹出一个询问框，让用户确认是否要执行这个操作。

本文将从[系统默认询问框](#系统默认询问框)和[自定义询问框](#自定义询问框)两个方面来介绍如何实现页面返回前增加一个询问框的功能。

**图3** 页面返回前增加一个询问框

![页面返回前增加一个询问框](./figures/page_ask.gif)

### 系统默认询问框

为了实现这个功能，可以使用页面路由Router模块提供的两个方法：[Router.showAlertBeforeBackPage](../../../reference/source_zh_cn/arkui-cj/cj-apis-router.md#func-showAlertBeforeBackPage)和[Router.back](../../../reference/source_zh_cn/arkui-cj/cj-apis-router.md#func-back)来实现这个功能。

在使用页面路由Router相关功能之前，需要在代码中先导入Router模块。

```cangjie
import kit.ArkUI.Router
```

如果想要在目标界面开启页面返回询问框，需要在调用[Router.back](../../../reference/source_zh_cn/arkui-cj/cj-apis-router.md#func-back)方法之前，通过调用[Router.showAlertBeforeBackPage](../../../reference/source_zh_cn/arkui-cj/cj-apis-router.md#func-showAlertBeforeBackPage)方法设置返回询问框的信息。例如，在支付页面中定义一个返回按钮的点击事件处理函数：

```cangjie
func onBackClick() {
  // 调用router.showAlertBeforeBackPage()方法，设置返回询问框的信息
  try {
    Router.showAlertBeforeBackPage(
      '您还没有完成支付，确定要返回吗？' // 设置询问框的内容
      ,{ code => })
    } catch (e: Exception) {
        AppLog.error(e.toString())
        }
    // 调用router.back()方法，返回上一个页面
    Router.back()
}
```

其中，Router.showAlertBeforeBackPage方法接收一个对象作为参数，该对象包含以下属性：

message：String类型，表示询问框的内容。

如果调用成功，则会在目标界面开启页面返回询问框。

当用户点击“返回”按钮时，会弹出确认对话框，询问用户是否确认返回。选择“取消”将停留在当前页目标页面；选择“确认”将触发Router.back方法，并根据参数决定如何执行跳转。

### 自定义询问框

自定义询问框的方式，这样可以让应用界面与系统默认询问框有所区别，提高应用的用户体验度。本文以弹窗为例，介绍如何实现自定义询问框。

在使用页面路由Router相关功能之前，需要在代码中先导入Router模块。

```cangjie
import kit.ArkUI.Router
```

在事件回调中，调用弹窗的方法:

```cangjie
import kit.ArkUI.Router

func onBackClick() {
  // 弹出自定义的询问框
  let buttons: Array<ButtonInfo> = [
                    ButtonInfo("返回", Color.Black),
                    ButtonInfo("确认", Color.Black)
                ]
  PromptAction.showDialog(
            message: '您还没有完成支付，确定要返回吗？',
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

当用户点击“返回”按钮时，会弹出自定义的询问框，询问用户是否确认返回。选择“取消”将停留在当前页目标页面；选择“确认”将触发Router.back方法，并根据参数决定如何执行跳转。
