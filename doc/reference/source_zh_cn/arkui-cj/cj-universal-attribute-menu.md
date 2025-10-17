# 菜单控制

为组件绑定弹出式菜单，弹出式菜单以垂直列表形式显示菜单项，可通过长按、点击或鼠标右键触发。

> **说明：**
>
> - CustomBuilder里不支持再使用bindMenu、bindContextMenu弹出菜单。多级菜单可使用[Menu](./cj-menu-menu.md#menu)组件。
> - 弹出菜单的文本内容不支持长按选中。
> - 若组件是可拖动节点，绑定bindContextMenu未指定preview时，菜单弹出会浮起拖拽预览图且菜单选项和预览图不会发生避让。对此，开发者可根据使用场景设置preview或者将目标节点设置成不可拖动节点。
> - 菜单支持长按500ms弹出子菜单，支持按压态跟随手指移动。<br> a.仅支持使用[Menu](./cj-menu-menu.md#menu)组件且子组件包含[MenuItem](./cj-menu-menuitem.md#menuitem)或[MenuItemGroup](./cj-menu-menuitemgroup.md#menuitemgroup)的场景。<br> b.仅支持[MenuPreviewMode](./cj-common-types.md#enum-menupreviewmode)为NONE的菜单。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func bindContextMenu(?CustomBuilder, ?ResponseType, ?ContextMenuOptions)

```cangjie
public func bindContextMenu(builder!: ?CustomBuilder, responseType!: ?ResponseType,
    options!: ?ContextMenuOptions = None): T
```

**功能：** 绑定上下文菜单到组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
| :--- | :--- | :--- | :--- | :--- |
| builder | ?CustomBuilder | 是 | \- | **命名参数。** 自定义构建器。<br>初始值：{ => }。|
| responseType | ?[ResponseType](./cj-common-types.md#enum-responsetype) |是|-| **命名参数。** 响应类型。<br>初始值：ResponseType.LongPress。|
| options | ?[ContextMenuOptions](#class-contextmenuoptions) | 否 | None | **命名参数。** 上下文菜单选项。<br>初始值：ContextMenuOptions()。|

**返回值：**

|类型|说明|
|:---|:---|
|T|返回调用此接口的组件实例本身。|


## func bindMenu(?Array\<MenuElement>)

```cangjie
public func bindMenu(content: ?Array<MenuElement>): T
```

**功能：** 绑定菜单到组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
| :--- | :--- | :--- | :--- | :--- |
| content | ?Array\<[MenuElement](#class-menuelement)> | 是 | \- | **命名参数。** 菜单元素数组。|

**返回值：**

|类型|说明|
|:---|:---|
|T|返回调用此接口的组件实例本身。|


## func bindMenu(?CustomBuilder)

```cangjie
public func bindMenu(builder!: ?CustomBuilder): T
```

**功能：** 绑定自定义菜单到组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
| :--- | :--- | :--- | :--- | :--- |
| builder | ?CustomBuilder | 是 | \- | **命名参数。** 自定义构建器。<br>初始值：{ => }。|

**返回值：**

|类型|说明|
|:---|:---|
|T|返回通用方法接口类型|


## 示例代码

### 示例1（弹出自定义菜单）

该示例为通过bindMenu配置CustomBuilder弹出自定义菜单。

<!-- run -->

```cangjie

package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @Builder
    func builder() {
        Column {
            Button("Builder 内容")
                .width(300.px)
                .onClick({
                    evt => nativeLog("Builder 中的按钮被点击")
                })
        }
        .width(300.px)
    }

    func build() {
        Column(20) {
            Button("BindMenu").bindMenu(
                [
                    Action(
                        value: "菜单1",
                        action: {
                            => nativeLog("菜单1被点击")
                        }
                    ),
                    Action(
                        value: "菜单2",
                        action: {
                            => nativeLog("菜单2被点击")
                        }
                    )
                ]
            )

            Button("BindMenu-Custom")
                .bindMenu(builder: builder)
            Button("BindContextMenu-长按")
                .bindContextMenu(builder: builder)
        }
    }
}
```

![uni_bind_menu](figures/uni_bind_menu.png)

### 示例2（弹出普通菜单）

该示例为bindMenu通过配置MenuElement弹出普通菜单。

<!-- run -->

```cangjie

package ohos_app_cangjie_entry

import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Scroll() {
            Column(10) {
                Button("BindMenu").bindMenu(
                    [
                        MenuElement(
                            "菜单1",
                            {
                                => AppLog.error("MenuElement test: 菜单1被点击")
                            }
                        ),
                        MenuElement(
                            "菜单2",
                            {
                                => AppLog.error("MenuElement test: 菜单2被点击")
                            },
                            icon: "data:image/png;base64,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",
                            enabled: true
                        )
                    ]
                )

                Button("BindMenu").bindMenu(
                    [
                        MenuElement(
                            "菜单1",
                            {
                                => AppLog.error("MenuElement test: 菜单1被点击")
                            }
                        ),
                        MenuElement(
                            "菜单2",
                            {
                                => AppLog.error("MenuElement test: 菜单2被点击")
                            },
                            icon: "data:image/png;base64,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",
                            enabled: true
                        )
                    ],
                    options: MenuOptions(
                        enableArrow: true,
                        onAppear: {=> AppLog.error("MenuOptions test: onAppear")},
                        onDisappear: {=> AppLog.error("MenuOptions test: onDisappear")},
                        aboutToAppear: {=> AppLog.error("MenuOptions test: aboutToAppear")},
                        aboutToDisappear: {=> AppLog.error("MenuOptions test: aboutToDisappear")},
                        title: "MenuOptions",
                        showInSubWindow: true
                    )
                )
            }
        }
    }
}
```

![uni_bind_menu](figures/uni_bind_menu.gif)

### 示例3（不同菜单的显示、变化和过渡效果）

该示例为测试为enableArrow, placement, arrowOffset，offset, backgroundColor, backgroundBlurStyle的显示效果，为bindContextMenu通过配置transition，实现自定义菜单以及菜单预览时的显示和退出动效，为bindContextMenu通过配置preview中hoverScale，实现组件截图到自定义预览图的一镜到底过渡动效。

<!-- run -->

```cangjie

package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*
import ohos.resource_manager.{AppResource, __GenerateResource__}

@Entry
@Component
class EntryView {
    @Builder
    func myBuilder() {
        Row() {
            Image(@r(app.media.startIcon)).size(width: 30.vp, height: 30.vp)
            Text("Builder 内容")
                .width(300.px)
                .onClick({
                    evt => AppLog.error("Builder test: builder clicked!!!")
                })
        }
        .width(150)
    }

    @Builder
    func MyPreview() {
        Column() {
            Image(@r(app.media.background))
                .width(120)
                .height(120)
        }
    }

    func build() {
        Scroll() {
            Column(10) {
                Text("enableArrow, placement, arrowOffset")
                Button("BindContextMenu-1").bindContextMenu(
                    builder: myBuilder,
                    responseType: ResponseType.LongPress,
                    options: ContextMenuOptions(
                        enableArrow: true,
                        placement: Placement.Bottom,
                        arrowOffset: 20.vp
                    )
                )

                Text(
                    "offset, backgroundColor, backgroundBlurStyle, aboutToAppear -> onAppear -> aboutToDisappear -> onDisappear"
                )
                Button("BindContextMenu-2")
                .bindContextMenu(
                    builder: myBuilder,
                    responseType: ResponseType.LongPress,
                    options: ContextMenuOptions(
                        offset: Position(80.0, 80.0),
                        backgroundColor: Color.YELLOW,
                        backgroundBlurStyle: BlurStyle.BACKGROUND_ULTRA_THICK,
                        onAppear: {=> AppLog.error("ContextMenuOptions test: onAppear")},
                        onDisappear: {=> AppLog.error("ContextMenuOptions test: onDisappear")},
                        aboutToAppear: {=> AppLog.error("ContextMenuOptions test: aboutToAppear")},
                        aboutToDisappear: {=> AppLog.error("ContextMenuOptions test: aboutToDisappear")}
                    )
                )

                Text("preview, transition")
                Text("BindContextMenu-3")
                    .width(200)
                    .height(80)
                    .backgroundColor(Color.GRAY)
                    .textAlign(TextAlign.Center)
                    .margin(20)
                    .bindContextMenu(
                        builder: myBuilder,
                        responseType: ResponseType.LongPress,
                        options: ContextMenuOptions(
                            preview: bind(this.MyPreview, this),
                            transition: TransitionEffect.SLIDE_SWITCH
                        )
                    )

                Text("preview, previewAnimationOptions[scale, transition]")
                Text("BindContextMenu-4")
                    .width(200)
                    .height(80)
                    .backgroundColor(Color.GRAY)
                    .textAlign(TextAlign.Center)
                    .margin(20)
                    .bindContextMenu(
                        builder: myBuilder,
                        responseType: ResponseType.LongPress,
                        options: ContextMenuOptions(
                            preview: bind(this.MyPreview, this),
                            previewAnimationOptions: ContextMenuAnimationOptions(
                                scale: (0.4, 0.8),
                                transition: TransitionEffect
                                    .OPACITY
                                    .animation(AnimateParam(duration: 4000, curve: Curve.Ease))
                            )
                        )
                    )

                Text("previewAnimationOptions: [hoverScale]")
                Text("BindContextMenu-5")
                    .width(200)
                    .height(80)
                    .backgroundColor(Color.GRAY)
                    .textAlign(TextAlign.Center)
                    .margin(20)
                    .bindContextMenu(
                        builder: myBuilder,
                        responseType: ResponseType.LongPress,
                        options: ContextMenuOptions(
                            preview: bind(this.MyPreview, this),
                            previewAnimationOptions: ContextMenuAnimationOptions(hoverScale: (1.0, 0.4))
                        )
                    )
            }
        }
    }
}
```

![uni_bind_menu](figures/uni_bind_context_menu.gif)