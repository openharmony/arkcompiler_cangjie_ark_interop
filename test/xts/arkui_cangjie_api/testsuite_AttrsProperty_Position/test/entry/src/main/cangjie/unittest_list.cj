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
internal import kit.LocalizationKit.{AppResource}
internal import ohos.application.test_runner.TestRunner
internal import ohos.ui_test.{Driver, On}
internal import ohos.web.webview.WebviewController
internal import std.unittest.*
internal import std.collection.ArrayList
internal import stdx.encoding.json.JsonValue
import ohos.arkui.state_macro_manage.*
import ohos.arkui.state_management.ObservedArrayList
import ohos.arkui.component.common.Alignment
import ohos.arkui.component.common.*
import ohos.base.*
import ohos.arkui.component.badge.BadgePosition

//  组件
let supportView = ObservedArrayList<String>(['AlphabetIndexer', 'Blank', 'Button', 'Checkbox', 'CheckboxGroup', 'DataPanel',
    'DatePicker', 'Divider', 'Gauge', 'Image', 'ImageSpan', 'LoadingProgress', 'Menu', 'MenuItem', 'MenuItemGroup',
    'Progress', 'QRCode', 'Radio', 'Rating', 'Refresh', 'RichEditor', 'RichText', 'RowSplit', 'ScrollBar', 'Search',
    'Slider','Stepper', 'StepperItem', 'Text', 'TextArea', 'TextClock', 'TextInput', 'TextPicker', 'TextTimer',
    'Toggle', 'Web', 'Select', 'Badge', 'Column', 'Grid', 'GridItem', 'GridRow', 'GridCol', 'Flex', 'List', 'ListItem',
    'ListItemGroup',  'RelativeContainer', 'Row', 'Scroll', 'Stack', 'Swiper', 'Tabs', 'TabContent', 'Circle',
    'Line', 'Rect', 'Shape', 'Path'])
//  属性
let Attrs_List = ObservedArrayList<String>(['Align', 'Position', 'MarkAnchor', 'Offset', 'Direction'])

//  Pixel_Prop_List 格式为  (单位， setValue, expectValue)
let Pixel_Prop_List: Array<(String, Any, String)> = [
    ("Percent", (5.percent,5.percent), "{\"x\":\"5.00%\",\"y\":\"5.00%\"}"),
    ("Px", (30.px,30.px), "{\"x\":\"30.00px\",\"y\":\"30.00px\"}"),
    ("Vp", (30.vp,30.vp), "{\"x\":\"30.00vp\",\"y\":\"30.00vp\"}"),
    ("Lpx", (30.lpx,30.lpx), "{\"x\":\"30.00lpx\",\"y\":\"30.00lpx\"}"),
    ("Float64", (30.0,30.0), "{\"x\":\"30.00vp\",\"y\":\"30.00vp\"}"),
    ("Int64", (30,30), "{\"x\":\"30.00vp\",\"y\":\"30.00vp\"}"),
    ("AppResource", (@r(app.float.float_size_30),@r(app.float.float_size_30)), "{\"x\":\"30.00vp\",\"y\":\"30.00vp\"}")
]
//  Alignment 格式为 (key，setValue,expectValue)
let Alignment_Prop_List: Array<(String, Alignment, String)> = [
    ("Start", Alignment.Start, "\"Alignment.Start\""),
    ("Center", Alignment.Center, "\"Alignment.Center\""),
    ("End", Alignment.End, "\"Alignment.End\""),
    ("Top", Alignment.Top, "\"Alignment.Top\""),
    ("Bottom", Alignment.Bottom, "\"Alignment.Bottom\""),
    ("TopStart", Alignment.TopStart, "\"Alignment.TopStart\""),
    ("TopEnd", Alignment.TopEnd, "\"Alignment.TopEnd\""),
    ("BottomStart", Alignment.BottomStart, "\"Alignment.BottomStart\""),
    ("BottomEnd", Alignment.BottomEnd, "\"Alignment.BottomEnd\"")
]

// Direction 格式为 (key，setValue,expectValue)
let Direction_Prop_List: Array<(String, Direction, String)> = [
    ("Ltr", Direction.Ltr, "\"Direction.Ltr\""),
    ("Rtl", Direction.Rtl, "\"Direction.Rtl\""),
    ("Auto", Direction.Auto, "\"Direction.Auto\"")
]

//  Position_Prop_List 格式为  (单位， setValue, expectValue)
let Position_Prop_List: Array<(String, Any, String)> = [
    ("PercentInt64", (5.percent, 5.percent), "{\"x\":\"5.00%\",\"y\":\"5.00%\"}"),
    ("PercentFloat64", (5.0.percent, 5.0.percent), "{\"x\":\"5.00%\",\"y\":\"5.00%\"}"),
    ("PxInt64", (30.px, 30.px), "{\"x\":\"30.00px\",\"y\":\"30.00px\"}"),
    ("PxFloat64", (30.0.px, 30.0.px), "{\"x\":\"30.00px\",\"y\":\"30.00px\"}"),
    ("VpInt64", (30.vp, 30.vp), "{\"x\":\"30.00vp\",\"y\":\"30.00vp\"}"),
    ("VpFloat64", (30.0.vp, 30.0.vp), "{\"x\":\"30.00vp\",\"y\":\"30.00vp\"}"),
    ("LpxInt64", (30.lpx, 30.lpx), "{\"x\":\"30.00lpx\",\"y\":\"30.00lpx\"}"),
    ("LpxFloat64", (30.0.lpx, 30.0.lpx), "{\"x\":\"30.00lpx\",\"y\":\"30.00lpx\"}"),
    ("Float64", (30.0, 30.0), "{\"x\":\"30.00vp\",\"y\":\"30.00vp\"}"),
    ("Int64", (30, 30), "{\"x\":\"30.00vp\",\"y\":\"30.00vp\"}"),
    ("AppResource", (@r(app.float.float_size_30), @r(app.float.float_size_30)), "{\"x\":\"30.00vp\",\"y\":\"30.00vp\"}"),
    ("BadgeRightTop", BadgePosition.RightTop, "\"BadgePosition.RightTop\""),
    ("BadgeRight", BadgePosition.Right, "\"BadgePosition.Right\""),
    ("BadgeLeft", BadgePosition.Left, "\"BadgePosition.Left\"")
]
