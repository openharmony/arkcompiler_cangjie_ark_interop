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
import ohos.base.*
import ohos.arkui.state_management.ObservedArrayList

//  组件
let supportView = ObservedArrayList<String>(['AlphabetIndexer', 'Blank', 'Button', 'Checkbox', 'CheckboxGroup', 'DataPanel',
    'DatePicker', 'Divider', 'Gauge', 'Image', 'ImageSpan', 'LoadingProgress', 'Menu', 'MenuItem', 'MenuItemGroup',
    'Progress', 'QRCode', 'Radio', 'Rating', 'Refresh', 'RichEditor', 'RichText', 'RowSplit', 'ScrollBar', 'Search',
    'Slider','Stepper', 'StepperItem', 'Text', 'TextArea', 'TextClock', 'TextInput', 'TextPicker', 'TextTimer',
    'Toggle', 'Web', 'Select', 'Badge', 'Column', 'Grid', 'GridItem', 'GridRow', 'GridCol', 'Flex', 'List', 'ListItem',
    'ListItemGroup', 'RelativeContainer', 'Row', 'Scroll', 'Stack', 'Swiper', 'Tabs', 'TabContent', 'Circle',
    'Line', 'Rect', 'Shape',  'Path'])
//  属性
let Attrs_List = ObservedArrayList<String>(['Width', 'Height', 'Size', 'Padding', 'Margin', 'ConstraintSize', 'LayoutWeight'])

//  WidthHeight_Prop_List 格式为  (单位， setValue, expectValue)
let WidthHeight_Prop_List: Array<(String, Any, String)> = [
    ("PercentInt", 80.percent, "\"80.00%\""),
    ("PercentFloat", 80.5.percent, "\"80.50%\""),
    ("PxInt", 200.px, "\"200.00px\""),
    ("PxFloat", 200.5.px, "\"200.50px\""),
    ("VpInt", 200.vp, "\"200.00vp\""),
    ("VpFloat", 200.5.vp, "\"200.50vp\""),
    ("LpxInt", 200.lpx, "\"200.00lpx\""),
    ("LpxFloat", 200.5.lpx, "\"200.50lpx\""),
    ("Float64", 200.0, "\"200.00vp\""),
    ("Int64", 200, "\"200.00vp\""),
    ("AppResource", @r(app.float.float_size_200), "\"200.00vp\"")
]
//  Size_Prop_List 格式为  (单位， setValue, expectValue)
let Size_Prop_List: Array<(String, Any, String)> = [
    ("PercentInt", (80.percent, 70.percent), "{\"width\":\"80.00%\",\"height\":\"70.00%\"}"),
    ("PercentFloat", (80.5.percent, 70.5.percent), "{\"width\":\"80.50%\",\"height\":\"70.50%\"}"),
    ("PxInt", (200.px, 50.px), "{\"width\":\"200.00px\",\"height\":\"50.00px\"}"),
    ("PxFloat", (200.5.px, 50.5.px), "{\"width\":\"200.50px\",\"height\":\"50.50px\"}"),
    ("VpInt", (200.vp, 50.vp), "{\"width\":\"200.00vp\",\"height\":\"50.00vp\"}"),
    ("VpFloat", (200.5.vp, 50.5.vp), "{\"width\":\"200.50vp\",\"height\":\"50.50vp\"}"),
    ("LpxInt", (200.lpx, 50.lpx), "{\"width\":\"200.00lpx\",\"height\":\"50.00lpx\"}"),
    ("LpxFloat", (200.5.lpx, 50.5.lpx), "{\"width\":\"200.50lpx\",\"height\":\"50.50lpx\"}"),
    ("Float64", (200.0, 50.0), "{\"width\":\"200.00vp\",\"height\":\"50.00vp\"}"),
    ("Int64", (200, 50), "{\"width\":\"200.00vp\",\"height\":\"50.00vp\"}"),
    ("AppResource", (@r(app.float.float_size_200), @r(app.float.float_size_50)),
        "{\"width\":\"200.00vp\",\"height\":\"50.00vp\"}")
]
//  PaddingMargin_Prop_List 格式为  (单位， setValue, expectValue)
let PaddingMargin_Prop_List: Array<(String, Any, String)> = [
    ("PercentIntSingle", 10.percent, "\"10.00%\""),
    ("PercentFloatSingle", 10.5.percent, "\"10.50%\""),
    ("PxIntSingle", 20.px, "\"20.00px\""),
    ("PxFloatSingle", 20.5.px, "\"20.50px\""),
    ("VpIntSingle", 20.vp, "\"20.00vp\""),
    ("VpFloatSingle", 20.5.vp, "\"20.50vp\""),
    ("LpxIntSingle", 20.vp, "\"20.00vp\""),
    ("LpxFloatSingle", 20.5.vp, "\"20.50vp\""),
    ("PercentIntMulti", (20.percent, 10.percent, 15.percent, 5.percent),
        "\"{\\\"top\\\":\\\"20.00%\\\",\\\"right\\\":\\\"10.00%\\\",\\\"bottom\\\":\\\"15.00%\\\",\\\"left\\\":\\\"5.00%\\\"}\""),
    ("PercentFloatMulti", (20.5.percent, 10.5.percent, 15.5.percent, 5.5.percent),
        "\"{\\\"top\\\":\\\"20.50%\\\",\\\"right\\\":\\\"10.50%\\\",\\\"bottom\\\":\\\"15.50%\\\",\\\"left\\\":\\\"5.50%\\\"}\""),
    ("PxIntMulti", (20.px, 10.px, 15.px, 5.px),
        "\"{\\\"top\\\":\\\"20.00px\\\",\\\"right\\\":\\\"10.00px\\\",\\\"bottom\\\":\\\"15.00px\\\",\\\"left\\\":\\\"5.00px\\\"}\""),
    ("PxFloatMulti", (20.5.px, 10.5.px, 15.5.px, 5.5.px),
        "\"{\\\"top\\\":\\\"20.50px\\\",\\\"right\\\":\\\"10.50px\\\",\\\"bottom\\\":\\\"15.50px\\\",\\\"left\\\":\\\"5.50px\\\"}\""),
    ("VpIntMulti", (20.vp, 10.vp, 15.vp, 5.vp),
        "\"{\\\"top\\\":\\\"20.00vp\\\",\\\"right\\\":\\\"10.00vp\\\",\\\"bottom\\\":\\\"15.00vp\\\",\\\"left\\\":\\\"5.00vp\\\"}\""),
    ("VpFloatMulti", (20.5.vp, 10.5.vp, 15.5.vp, 5.5.vp),
        "\"{\\\"top\\\":\\\"20.50vp\\\",\\\"right\\\":\\\"10.50vp\\\",\\\"bottom\\\":\\\"15.50vp\\\",\\\"left\\\":\\\"5.50vp\\\"}\""),
    ("LpxIntMulti", (20.lpx, 10.lpx, 15.lpx, 5.lpx),
        "\"{\\\"top\\\":\\\"20.00lpx\\\",\\\"right\\\":\\\"10.00lpx\\\",\\\"bottom\\\":\\\"15.00lpx\\\",\\\"left\\\":\\\"5.00lpx\\\"}\""),
    ("LpxFloatMulti", (20.5.lpx, 10.5.lpx, 15.5.lpx, 5.5.lpx),
        "\"{\\\"top\\\":\\\"20.50lpx\\\",\\\"right\\\":\\\"10.50lpx\\\",\\\"bottom\\\":\\\"15.50lpx\\\",\\\"left\\\":\\\"5.50lpx\\\"}\""),
    ("AppResourceMulti", (@r(app.float.float_size_20), @r(app.float.float_size_10), @r(app.float.float_size_15),
            @r(app.float.float_size_5)),
        "\"{\\\"top\\\":\\\"20.00vp\\\",\\\"right\\\":\\\"10.00vp\\\",\\\"bottom\\\":\\\"15.00vp\\\",\\\"left\\\":\\\"5.00vp\\\"}\"")
]
//  ConstraintSize_Prop_List 格式为  (单位， setValue, expectValue,expectWidth,expectHeight)
// setValue格式为(width,height,minWidth,maxWidth,minHeight,maxHeight)
// expectValue格式为(minWidth,minWidth,maxWidth,maxHeight)
let ConstraintSize_Prop_List: Array<(String, Any, String)> = [
    ("PercentInt", (60.percent, 60.percent, 20.percent, 50.percent, 20.percent, 50.percent),
        "\"{\\\"minWidth\\\":\\\"20.00%\\\",\\\"minHeight\\\":\\\"50.00%\\\",\\\"maxWidth\\\":\\\"20.00%\\\",\\\"maxHeight\\\":\\\"50.00%\\\"}\""),
    ("PercentFloat", (60.5.percent, 60.5.percent, 20.5.percent, 50.5.percent, 20.5.percent, 50.5.percent),
        "\"{\\\"minWidth\\\":\\\"20.50%\\\",\\\"minHeight\\\":\\\"50.50%\\\",\\\"maxWidth\\\":\\\"20.50%\\\",\\\"maxHeight\\\":\\\"50.50%\\\"}\""),
    ("PxInt", (80.px, 20.px, 150.px, 200.px, 30.px, 50.px),
        "\"{\\\"minWidth\\\":\\\"150.00px\\\",\\\"minHeight\\\":\\\"200.00px\\\",\\\"maxWidth\\\":\\\"30.00px\\\",\\\"maxHeight\\\":\\\"50.00px\\\"}\""),
    ("PxFloat", (80.5.px, 20.5.px, 150.5.px, 200.5.px, 30.5.px, 50.5.px),
        "\"{\\\"minWidth\\\":\\\"150.50px\\\",\\\"minHeight\\\":\\\"200.50px\\\",\\\"maxWidth\\\":\\\"30.50px\\\",\\\"maxHeight\\\":\\\"50.50px\\\"}\""),
    ("VpInt", (220.vp, 80.vp, 150.vp, 200.vp, 30.vp, 50.vp),
        "\"{\\\"minWidth\\\":\\\"150.00vp\\\",\\\"minHeight\\\":\\\"200.00vp\\\",\\\"maxWidth\\\":\\\"30.00vp\\\",\\\"maxHeight\\\":\\\"50.00vp\\\"}\""),
    ("VpFloat", (220.5.vp, 80.5.vp, 150.5.vp, 200.5.vp, 30.5.vp, 50.5.vp),
        "\"{\\\"minWidth\\\":\\\"150.50vp\\\",\\\"minHeight\\\":\\\"200.50vp\\\",\\\"maxWidth\\\":\\\"30.50vp\\\",\\\"maxHeight\\\":\\\"50.50vp\\\"}\""),
    ("LpxInt", (80.lpx, 20.lpx, 150.lpx, 200.lpx, 30.lpx, 50.lpx),
        "\"{\\\"minWidth\\\":\\\"150.00lpx\\\",\\\"minHeight\\\":\\\"200.00lpx\\\",\\\"maxWidth\\\":\\\"30.00lpx\\\",\\\"maxHeight\\\":\\\"50.00lpx\\\"}\""),
    ("LpxFloat", (80.5.lpx, 20.5.lpx, 150.5.lpx, 200.5.lpx, 30.5.lpx, 50.5.lpx),
        "\"{\\\"minWidth\\\":\\\"150.50lpx\\\",\\\"minHeight\\\":\\\"200.50lpx\\\",\\\"maxWidth\\\":\\\"30.50lpx\\\",\\\"maxHeight\\\":\\\"50.50lpx\\\"}\"")
]
