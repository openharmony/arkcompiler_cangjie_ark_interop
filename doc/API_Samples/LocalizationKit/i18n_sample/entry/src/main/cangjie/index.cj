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

internal import ohos.base.LengthProp
internal import ohos.arkui.component.Column
internal import ohos.arkui.component.Row
internal import ohos.arkui.component.Text
internal import ohos.arkui.component.CustomView
internal import ohos.arkui.component.CJEntry
internal import ohos.arkui.component.loadNativeView
internal import ohos.arkui.component.FontWeight
internal import ohos.arkui.state_manage.SubscriberManager
internal import ohos.arkui.state_manage.ObservedProperty
internal import ohos.arkui.state_manage.LocalStorage
import ohos.arkui.state_macro_manage.Entry
import ohos.arkui.state_macro_manage.Component
import ohos.arkui.state_macro_manage.State
import kit.LocalizationKit.*
import std.time.DateTime as d

@Entry
@Component
class EntryView {
    @State
    var message: String = "Hello World"

    func build() {
        Row {
            Column {
                Text(this.message)
                    .fontSize(50)
                    .fontWeight(FontWeight.Bold)
                    .onClick {
                        evt =>
                            let calendar: Calendar = getCalendar('zh-Hans', calendarType: CalendarType.Gregory)
                            // 设置日历对象的时间日期为2022.05.13 08:00:00
                            calendar.setTime(10540800000.0)

                            // 设置日历对象的时间日期为2022.05.13 08:00:00
                            calendar.set(2022, 5, 13, hour: 8, minute: 0, second: 0)

                            // 设置日历对象的时区
                            calendar.setTimeZone('Asia/Shanghai')

                            // 获取日历对象的时区
                            let timezone: String = calendar.getTimeZone() // timezone = 'Asia/Shanghai'

                            // 获取日历对象的一周起始日
                            let firstDayOfWeek: Int32 = calendar.getFirstDayOfWeek() // firstDayOfWeek = 1

                            // 设置每一周的起始日
                            calendar.setFirstDayOfWeek(1)

                            // 获取一年中第一周的最小天数
                            let minimalDaysInFirstWeek: Int32 = calendar.getMinimalDaysInFirstWeek() // minimalDaysInFirstWeek = 1

                            // 设置一年中第一周的最小天数
                            calendar.setMinimalDaysInFirstWeek(3)

                            // 获取日历对象中与field相关联的值
                            let year: Int32 = calendar.get('year') // year = 2022

                            // 获取日历对象本地化名称
                            let calendarName: String = calendar.getDisplayName('zh-Hans') // calendarName = '公历'

                            // 在日历的给定字段进行加减操作
                            calendar.set(2023, 10, 15)
                            calendar.add('date', 2)
                            let day: Int32 = calendar.get('date') // day = 17
                            this.message = "Hello Cangjie"
                    }
            }.width(100.percent)
        }.height(100.percent)
    }
}
