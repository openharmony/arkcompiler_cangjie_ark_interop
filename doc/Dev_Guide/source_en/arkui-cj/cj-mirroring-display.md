# Using Mirroring Capability

## Overview

To accommodate different users' reading habits, ArkUI provides mirroring capability. Under specific circumstances, it mirrors the display content along the X-axis, transforming left-to-right display into right-to-left display.

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

ArkUI has default mirroring adaptation for the following capabilities:

|**Category**|**Name**|
|:---|:---|
| Basic Components | [Swiper](../../../reference/source_en/arkui-cj/cj-scroll-swipe-swiper.md), [Tabs](../../../reference/source_en/arkui-cj/cj-navigation-switching-tabs.md), [List](../../../reference/source_en/arkui-cj/cj-scroll-swipe-list.md), [Progress](../../../reference/source_en/arkui-cj/cj-information-display-progress.md), [CalendarPickerDialog](../../../Dev_Guide/source_en/arkui-cj/cj-fixes-style-dialog.md#日历选择器弹窗), [TextPicker](../../../reference/source_en/arkui-cj/cj-button-picker-textpicker.md), [DatePicker](../../../reference/source_en/arkui-cj/cj-button-picker-datepicker.md), [Grid](../../../reference/source_en/arkui-cj/cj-scroll-swipe-grid.md), [Scroll](../../../reference/source_en/arkui-cj/cj-scroll-swipe-scroll.md), [ScrollBar](../../../reference/source_en/arkui-cj/cj-scroll-swipe-scrollbar.md), [AlphabetIndexer](../../../reference/source_en/arkui-cj/cj-information-display-alphabetindexer.md), [Stepper](../../../reference/source_en/arkui-cj/cj-navigation-switching-stepper.md), [SideBarContainer](../../../reference/source_en/arkui-cj/cj-grid-layout-sidebar.md), [Navigation](../../../reference/source_en/arkui-cj/cj-navigation-switching-navigation.md), [Rating](../../../reference/source_en/arkui-cj/cj-button-picker-rating.md), [Slider](../../../reference/source_en/arkui-cj/cj-button-picker-slider.md), [Toggle](../../../reference/source_en/arkui-cj/cj-button-picker-toggle.md), [Badge](../../../reference/source_en/arkui-cj/cj-information-display-badge.md), [bindMenu](../../../reference/source_en/arkui-cj/cj-universal-attribute-menu.md#funcbindMenu), [bindContextMenu](../../../reference/source_en/arkui-cj/cj-universal-attribute-menu.md#funcbindContextMenu), [TextInput](../../../reference/source_en/arkui-cj/cj-text-input-textinput.md), [TextArea](../../../reference/source_en/arkui-cj/cj-text-input-textarea.md), [Search](../../../reference/source_en/arkui-cj/cj-text-input-search.md), [Stack](../../../reference/source_en/arkui-cj/cj-row-column-stack-stack.md), [GridRow](../../../reference/source_en/arkui-cj/cj-grid-layout-gridrow.md), [Text](../../../reference/source_en/arkui-cj/cj-text-input-text.md), [Select](../../../reference/source_en/arkui-cj/cj-button-picker-select.md), [Row](../../../reference/source_en/arkui-cj/cj-row-column-stack-row.md), [Column](../../../reference/source_en/arkui-cj/cj-row-column-stack-column.md), [Flex](../../../reference/source_en/arkui-cj/cj-row-column-stack-flex.md), [RelativeContainer](../../../reference/source_en/arkui-cj/cj-row-column-stack-relativecontainer.md), [ListItemGroup](../../../reference/source_en/arkui-cj/cj-scroll-swipe-listgroup.md) |
| Advanced Components | [Popup](./cj-popup-and-menu-components-popup.md), [Dialog](./cj-dialog-base-overview.md) |
| Universal Attributes | [position](../../../reference/source_en/arkui-cj/cj-common-types.md#Position), [markAnchor](../../../reference/source_en/arkui-cj/cj-universal-attribute-location.md#funcmarkAnchor), [offset](../../../Dev_Guide/source_en/arkui-cj/cj-layout-development-grid-layout.md#offset), [alignRules](../../../reference/source_en/arkui-cj/cj-universal-attribute-location.md#funcalignRules), [borderWidth](../../../reference/source_en/arkui-cj/cj-information-display-progress.md#varborderWidth), [borderColor](../../../reference/source_en/arkui-cj/cj-information-display-progress.md#varborderColor), [padding](../../../reference/source_en/arkui-cj/cj-universal-attribute-size.md#fun-cpadding), [margin](../../../reference/source_en/arkui-cj/cj-universal-attribute-size.md#func-marginlength) |
| Interfaces | [promptAction.showDialog](./cj-fixes-style-dialog.md#对话框-showdialog)|

However, the following three scenarios require additional adaptation:

1. **UI Layout and Border Settings**: For direction-related universal attributes, if mirroring capability support is needed, use generalized directional indicators (start/end parameter types) instead of absolute directional indicators (left/right, x/y) to represent adaptive mirroring capability.

2. **Canvas Component**: Only limited support for text drawing mirroring capability.

3. **XComponent Component**: Does not support component mirroring capability.