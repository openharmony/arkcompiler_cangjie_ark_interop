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
| Basic Components | [Swiper](../../../API_Reference/source_en/arkui-cj/cj-scroll-swipe-swiper.md), [Tabs](../../../API_Reference/source_en/arkui-cj/cj-navigation-switching-tabs.md), [List](../../../API_Reference/source_en/arkui-cj/cj-scroll-swipe-list.md), [Progress](../../../API_Reference/source_en/arkui-cj/cj-information-display-progress.md), [CalendarPickerDialog](../../../Dev_Guide/source_en/arkui-cj/cj-fixes-style-dialog.md#日历选择器弹窗), [TextPicker](../../../API_Reference/source_en/arkui-cj/cj-button-picker-textpicker.md), [DatePicker](../../../API_Reference/source_en/arkui-cj/cj-button-picker-datepicker.md), [Grid](../../../API_Reference/source_en/arkui-cj/cj-scroll-swipe-grid.md), [Scroll](../../../API_Reference/source_en/arkui-cj/cj-scroll-swipe-scroll.md), [ScrollBar](../../../API_Reference/source_en/arkui-cj/cj-scroll-swipe-scrollbar.md), [AlphabetIndexer](../../../API_Reference/source_en/arkui-cj/cj-information-display-alphabetindexer.md), [Stepper](../../../API_Reference/source_en/arkui-cj/cj-navigation-switching-stepper.md), [SideBarContainer](../../../API_Reference/source_en/arkui-cj/cj-grid-layout-sidebar.md), [Navigation](../../../API_Reference/source_en/arkui-cj/cj-navigation-switching-navigation.md), [Rating](../../../API_Reference/source_en/arkui-cj/cj-button-picker-rating.md), [Slider](../../../API_Reference/source_en/arkui-cj/cj-button-picker-slider.md), [Toggle](../../../API_Reference/source_en/arkui-cj/cj-button-picker-toggle.md), [Badge](../../../API_Reference/source_en/arkui-cj/cj-information-display-badge.md), [bindMenu](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-menu.md#funcbindMenu), [bindContextMenu](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-menu.md#funcbindContextMenu), [TextInput](../../../API_Reference/source_en/arkui-cj/cj-text-input-textinput.md), [TextArea](../../../API_Reference/source_en/arkui-cj/cj-text-input-textarea.md), [Search](../../../API_Reference/source_en/arkui-cj/cj-text-input-search.md), [Stack](../../../API_Reference/source_en/arkui-cj/cj-row-column-stack-stack.md), [GridRow](../../../API_Reference/source_en/arkui-cj/cj-grid-layout-gridrow.md), [Text](../../../API_Reference/source_en/arkui-cj/cj-text-input-text.md), [Select](../../../API_Reference/source_en/arkui-cj/cj-button-picker-select.md), [Row](../../../API_Reference/source_en/arkui-cj/cj-row-column-stack-row.md), [Column](../../../API_Reference/source_en/arkui-cj/cj-row-column-stack-column.md), [Flex](../../../API_Reference/source_en/arkui-cj/cj-row-column-stack-flex.md), [RelativeContainer](../../../API_Reference/source_en/arkui-cj/cj-row-column-stack-relativecontainer.md), [ListItemGroup](../../../API_Reference/source_en/arkui-cj/cj-scroll-swipe-listgroup.md) |
| Advanced Components | [Popup](./cj-popup-and-menu-components-popup.md), [Dialog](./cj-dialog-base-overview.md) |
| Universal Attributes | [position](../../../API_Reference/source_en/arkui-cj/cj-common-types.md#Position), [markAnchor](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-location.md#funcmarkAnchor), [offset](../../../Dev_Guide/source_en/arkui-cj/cj-layout-development-grid-layout.md#offset), [alignRules](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-location.md#funcalignRules), [borderWidth](../../../API_Reference/source_en/arkui-cj/cj-information-display-progress.md#varborderWidth), [borderColor](../../../API_Reference/source_en/arkui-cj/cj-information-display-progress.md#varborderColor), [padding](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-size.md#fun-cpadding), [margin](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-size.md#func-marginlength) |
| Interfaces | [promptAction.showDialog](./cj-fixes-style-dialog.md#对话框-showdialog)|

However, the following three scenarios require additional adaptation:

1. **UI Layout and Border Settings**: For direction-related universal attributes, if mirroring capability support is needed, use generalized directional indicators (start/end parameter types) instead of absolute directional indicators (left/right, x/y) to represent adaptive mirroring capability.

2. **Canvas Component**: Only limited support for text drawing mirroring capability.

3. **XComponent Component**: Does not support component mirroring capability.