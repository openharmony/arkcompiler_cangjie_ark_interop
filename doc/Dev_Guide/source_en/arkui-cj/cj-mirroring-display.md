# Using Mirroring Capability

## Overview

To accommodate different users' reading habits, ArkUI provides a mirroring capability. Under specific circumstances, it mirrors the display content along the X-axis, transforming left-to-right display into right-to-left display.

|**Before Mirroring**|**After Mirroring**|
|:---|:---|
| ![mirroring-capability](./figures/mirroring_capability1.png) | ![mirroring-capability](./figures/mirroring_capability2.png) |

The mirroring capability takes effect when a component meets any of the following conditions:

1. The component's `direction` property is set to `Direction.Rtl`.

2. The component's `direction` property is set to `Direction.Auto`, and the current system language (e.g., Uyghur) follows a right-to-left reading habit.

## Basic Concepts

- **LTR**: Left-to-right sequence.
- **RTL**: Right-to-left sequence.

## Usage Constraints

The following ArkUI capabilities have default mirroring adaptation:

|**Category**|**Name**|
|:---|:---|
| Basic Components | [Swiper](../../../API_Reference/source_zh_cn/arkui-cj/cj-scroll-swipe-swiper.md), [Tabs](../../../API_Reference/source_zh_cn/arkui-cj/cj-navigation-switching-tabs.md), [List](../../../API_Reference/source_zh_cn/arkui-cj/cj-scroll-swipe-list.md), [Progress](../../../API_Reference/source_zh_cn/arkui-cj/cj-information-display-progress.md), [CalendarPickerDialog](../../../Dev_Guide/source_zh_cn/arkui-cj/cj-fixes-style-dialog.md#日历选择器弹窗), [TextPicker](../../../API_Reference/source_zh_cn/arkui-cj/cj-button-picker-textpicker.md), [DatePicker](../../../API_Reference/source_zh_cn/arkui-cj/cj-button-picker-datepicker.md), [Grid](../../../API_Reference/source_zh_cn/arkui-cj/cj-scroll-swipe-grid.md), [Scroll](../../../API_Reference/source_zh_cn/arkui-cj/cj-scroll-swipe-scroll.md), [ScrollBar](../../../API_Reference/source_zh_cn/arkui-cj/cj-scroll-swipe-scrollbar.md), [AlphabetIndexer](../../../API_Reference/source_zh_cn/arkui-cj/cj-information-display-alphabetindexer.md), [Stepper](../../../API_Reference/source_zh_cn/arkui-cj/cj-navigation-switching-stepper.md), [SideBarContainer](../../../API_Reference/source_zh_cn/arkui-cj/cj-grid-layout-sidebar.md), [Navigation](../../../API_Reference/source_zh_cn/arkui-cj/cj-navigation-switching-navigation.md), [Rating](../../../API_Reference/source_zh_cn/arkui-cj/cj-button-picker-rating.md), [Slider](../../../API_Reference/source_zh_cn/arkui-cj/cj-button-picker-slider.md), [Toggle](../../../API_Reference/source_zh_cn/arkui-cj/cj-button-picker-toggle.md), [Badge](../../../API_Reference/source_zh_cn/arkui-cj/cj-information-display-badge.md), [bindMenu](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-menu.md#funcbindMenu), [bindContextMenu](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-menu.md#funcbindContextMenu), [TextInput](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-textinput.md), [TextArea](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-textarea.md), [Search](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-search.md), [Stack](../../../API_Reference/source_zh_cn/arkui-cj/cj-row-column-stack-stack.md), [GridRow](../../../API_Reference/source_zh_cn/arkui-cj/cj-grid-layout-gridrow.md), [Text](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-text.md), [Select](../../../API_Reference/source_zh_cn/arkui-cj/cj-button-picker-select.md), [Row](../../../API_Reference/source_zh_cn/arkui-cj/cj-row-column-stack-row.md), [Column](../../../API_Reference/source_zh_cn/arkui-cj/cj-row-column-stack-column.md), [Flex](../../../API_Reference/source_zh_cn/arkui-cj/cj-row-column-stack-flex.md), [RelativeContainer](../../../API_Reference/source_zh_cn/arkui-cj/cj-row-column-stack-relativecontainer.md), [ListItemGroup](../../../API_Reference/source_zh_cn/arkui-cj/cj-scroll-swipe-listgroup.md) |
| Advanced Components | [Popup](./cj-popup-and-menu-components-popup.md), [Dialog](./cj-dialog-base-overview.md) |
| Universal Attributes | [position](../../../API_Reference/source_zh_cn/arkui-cj/cj-common-types.md#Position), [markAnchor](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-location.md#funcmarkAnchor), [offset](../../../Dev_Guide/source_zh_cn/arkui-cj/cj-layout-development-grid-layout.md#offset), [alignRules](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-location.md#funcalignRules), [borderWidth](../../../API_Reference/source_zh_cn/arkui-cj/cj-information-display-progress.md#varborderWidth), [borderColor](../../../API_Reference/source_zh_cn/arkui-cj/cj-information-display-progress.md#varborderColor), [padding](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-size.md#fun-cpadding), [margin](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-size.md#func-marginlength) |
| Interfaces | [promptAction.showDialog](./cj-fixes-style-dialog.md#对话框-showdialog)|

However, the following three scenarios still require adaptation:

1. **Interface Layout and Border Settings**: For direction-related universal attributes, if mirroring capability support is needed, use generalized direction indicators like `start/end` as parameter types instead of absolute direction indicators like `left/right` or `x/y` to represent adaptive mirroring capability.

2. **Canvas Component**: Only limited support for text drawing mirroring capability.

3. **XComponent Component**: Does not support component mirroring capability.

## Custom Drawing with Canvas Component

The Canvas component's drawing content and coordinates do not support mirroring capability. Content already drawn on the Canvas component will not automatically mirror when the system language switches.

The text drawing capability of [CanvasRenderingContext2D](../../../API_Reference/source_zh_cn/arkui-cj/cj-canvas-drawing-canvasrenderingcontext2d.md) supports mirroring. When using it, coordinate with the Canvas component's universal `direction` property (component display direction) and the `direction` property of CanvasRenderingContext2D (text drawing direction). Specific specifications are as follows:

1. **Priority**: CanvasRenderingContext2D's `direction` property > Canvas component's universal `direction` property > System language-determined horizontal display direction.
2. The Canvas component itself does not automatically mirror when the system language switches. Applications must listen for system language changes and redraw accordingly.
3. When CanvasRenderingContext2D draws text, only symbols and similar text respond to drawing direction changes. English letters and numbers do not.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.BasicServicesKit.*
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    private let settings: RenderingContextSettings = RenderingContextSettings(antialias: true)
    private let context: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)

    public func aboutToAppear() {
        let subscriber: CommonEventSubscriber
        let support = Support.COMMON_EVENT_LOCALE_CHANGED
        let subscribeInfo: CommonEventSubscribeInfo = CommonEventSubscribeInfo([support])
        func callback(c: CommonEventData): Unit {
            this.drawText()
        }
        try {
            subscriber = CommonEventManager.createSubscriber(subscribeInfo)
            try {
                // Subscribe
                CommonEventManager.subscribe(subscriber, callback)
                AppLog.info("Successfully subscribed to locale change common event")
                } catch (e: BusinessException) {
                AppLog.info("Failed to subscribe to locale change common event. errorCode = ${e.code}, errorMsg = ${e.message}")
            }
            } catch (e: BusinessException) {
            AppLog.info("Failed to create subscriber. errorCode = ${e.code}, errorMsg = ${e.message}")
        }
    }
    public func drawText() {
        this.context.reset()
        this.context.direction(CanvasDirection.inherit)
        this.context.font(size: 30.px, family: "sans-serif")
        this.context.fillText("ab%123&*@", 50, 50)
    }
    func build() {
        Row(){
            Canvas(this.context)
                .direction(Direction.Auto)
                .width(100.percent)
                .height(100.percent)
                .backgroundColor(Color.PINK)
                .onReady({
                =>
                    this.drawText()
                }
                )
            }.width(100.percent).height(100.percent)
    }
}
```

|**Before Mirroring**|**After Mirroring**|
|:---|:---|
| ![mirroring-capability](./figures/mirroring_capability3.jpg) | ![mirroring-capability](./figures/mirroring_capability4.jpg) |