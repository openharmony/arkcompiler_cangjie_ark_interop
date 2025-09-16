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


//  组件
let supportView = ObservedArrayList<String>(['AlphabetIndexer', 'Blank', 'Button', 'Checkbox', 'CheckboxGroup', 'DataPanel',
    'DatePicker', 'Divider', 'Gauge', 'Image', 'ImageSpan', 'LoadingProgress', 'Menu', 'MenuItem', 'MenuItemGroup',
    'Progress', 'QRCode', 'Radio', 'Rating', 'Refresh', 'RichEditor', 'RichText', 'RowSplit', 'ScrollBar', 'Search',
    'Slider','Stepper', 'StepperItem', 'Text', 'TextArea', 'TextClock', 'TextInput', 'TextPicker', 'TextTimer',
    'Toggle', 'Web', 'Select', 'Badge', 'Column', 'Grid', 'GridItem', 'GridRow', 'GridCol', 'Flex', 'List', 'ListItem',
    'ListItemGroup', 'RelativeContainer', 'Row', 'Scroll', 'Stack', 'Swiper', 'Tabs', 'TabContent', 'Circle',
    'Line', 'Rect', 'Shape', 'Path'])
//  属性
let Attrs_List = ObservedArrayList<String>(['FlexBasis', 'FlexGrow', 'FlexShrink', 'AlignSelf'])

//  FlexBasis_Prop_List 格式为  (单位， setValue, expectValue)
let FlexBasis_Prop_List: Array<(String, Any, String)> = [
    ("PxInt", 300.px, "\"300.00px\""),
    ("PxFloat", 100.5.px, "\"100.50px\""),
    ("VpInt", 100.vp, "\"100.00vp\""),
    ("VpFloat", 100.5.vp, "\"100.50vp\""),
    ("LpxInt", 100.lpx, "\"100.00lpx\""),
    ("LpxFloat", 100.5.lpx, "\"100.50lpx\""),
    ("Float64", 100.0, "\"100.00vp\""),
    ("Int64", 100, "\"100.00vp\""),
    ("AppResource", @r(app.float.float_size_100), "\"100.00vp\"")
]
//  FlexGrowShrink_Prop_List 格式为  (单位， setValue, expectValue)
let FlexGrowShrink_Prop_List: Array<(String, Any, String, String)> = [("Float64", (1.5, 2.5), "1.500000", "2.500000"),
    ("Int64", (1, 3), "1", "3")]

//  ItemAlign_Prop_List 格式为  (单位， setValue, expectValue)
let ItemAlign_Prop_List: Array<(String, ItemAlign, String)> = [
    ("Auto", ItemAlign.Auto, "\"ItemAlign.Auto\""),
    ("Start", ItemAlign.Start, "\"ItemAlign.Start\""),
    ("Center", ItemAlign.Center, "\"ItemAlign.Center\""),
    ("End", ItemAlign.End, "\"ItemAlign.End\""),
    ("Stretch", ItemAlign.Stretch, "\"ItemAlign.Stretch\""),
    ("Baseline", ItemAlign.Baseline, "\"ItemAlign.Baseline\"")
]
