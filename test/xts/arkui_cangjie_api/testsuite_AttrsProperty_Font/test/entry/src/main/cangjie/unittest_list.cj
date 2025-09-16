/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package ohos_app_cangjie_entry

import kit.PerformanceAnalysisKit.Hilog
internal import ohos.application.test_runner.TestRunner
internal import ohos.ui_test.{Driver, On}
internal import ohos.web.webview.WebviewController
internal import std.collection.ArrayList
internal import stdx.encoding.json.JsonValue
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.{AppResource}
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.base.*
import kit.ArkUI.{ImageRepeat,Color,ImageSize,Alignment,Length,GradientDirection}

//  组件
let supportView = ObservedArrayList<String>(['AlphabetIndexer', 'Blank', 'Button', 'Checkbox', 'CheckboxGroup', 'DataPanel',
    'DatePicker', 'Divider', 'Gauge', 'Image', 'ImageSpan', 'LoadingProgress', 'Menu', 'MenuItem', 'MenuItemGroup',
    'Progress', 'QRCode', 'Radio', 'Rating', 'Refresh', 'RichEditor', 'RichText', 'RowSplit', 'ScrollBar', 'Search',
    'Slider','Stepper', 'StepperItem', 'Text', 'TextArea', 'TextClock', 'TextInput', 'TextPicker', 'TextTimer',
    'Toggle', 'Web', 'Select', 'Badge', 'Column', 'Grid', 'GridItem', 'GridRow', 'GridCol', 'Flex', 'List', 'ListItem',
    'ListItemGroup', 'RelativeContainer', 'Row', 'Scroll', 'Stack', 'Swiper', 'Tabs', 'TabContent', 'Circle',
    'Line', 'Rect', 'Shape', 'Path'])
//  属性
let Attrs_List = ObservedArrayList<String>(['FontColor', 'FontSize', 'FontStyle', 'FontWeight', 'FontFamily'])

//FontColor_Prop_List 格式为  (单位， setValue, expectValue)
let FontColor_Prop_List: Array<(String, Any, String)> = [
    ("Color", Color.Red, "\"#FFFF0000\""),
    ("AppResource", @r(app.color.color_red), "\"#FFFF0000\""),
    ("UInt32", 16711680u32, "\"#FFFF0000\"")
]

//FontSize_Prop_List 格式为  (单位， setValue, expectValue)
let FontSize_Prop_List: Array<(String, Any, String)> = [
    ("Percent", 30.percent, "\"30.00%\""),
    ("Px", 20.px, "\"20.00px\""),
    ("Vp", 20.vp, "\"20.00vp\""),
    ("Lpx", 20.lpx, "\"20.00lpx\""),
    ("Float64", 20.0, "\"20.00fp\""),
    ("Int64", 20, "\"20.00fp\""),
    ("AppResource", @r(app.float.float_size_20), "\"20.00vp\"")
]

//FontStyle_Prop_List 格式为  (单位， setValue, expectValue)
let FontStyle_Prop_List: Array<(String, FontStyle, String)> = [("Normal", FontStyle.Normal, "\"FontStyle.Normal\""),
    ("Italic", FontStyle.Italic, "\"FontStyle.Italic\"")]

//FontWeight_Prop_List 格式为  (单位， setValue, expectValue)
let FontWeight_Prop_List: Array<(String, FontWeight, String)> = [
    ("W100", FontWeight.W100, "\"100\""),
    ("W200", FontWeight.W200, "\"200\""),
    ("W300", FontWeight.W300, "\"300\""),
    ("W400", FontWeight.W400, "\"400\""),
    ("W500", FontWeight.W500, "\"500\""),
    ("W600", FontWeight.W600, "\"600\""),
    ("W700", FontWeight.W700, "\"700\""),
    ("W800", FontWeight.W800, "\"800\""),
    ("W900", FontWeight.W900, "\"900\""),
    ("Lighter", FontWeight.Lighter, "\"FontWeight.Lighter\""),
    ("Normal", FontWeight.Normal, "\"FontWeight.Normal\""),
    ("Regular", FontWeight.Regular, "\"FontWeight.Regular\""),
    ("Medium", FontWeight.Medium, "\"FontWeight.Medium\""),
    ("Bold", FontWeight.Bold, "\"FontWeight.Bold\""),
    ("Bolder", FontWeight.Bolder, "\"FontWeight.Bolder\"")
]

//FontFamily_Prop_List 格式为  (单位， setValue, expectValue)
let FontFamily_Prop_List: Array<(String, Any, String)> = [("String", "sans-serif", "\"sans-serif\""),
    ("AppResource", @r(app.string.fontFamily_Sansserif), "\"sans-serif\"")]
