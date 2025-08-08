# Setting Calendars and Calendar Systems

## Usage Scenarios

Users in different regions use different calendar systems. Most regions use the Gregorian calendar, while some users follow other calendars such as the Lunar calendar, Islamic calendar, or Hebrew calendar. Additionally, time and date representations vary across time zones and daylight saving time adjustments. Therefore, users should configure calendars that align with local conventions. The internationalization module provides the [Calendar](../../../API_Reference/source_en/apis/LocalizationKit/cj-apis-i18n.md#class-calendar) class, which enables setting calendar types, dates, year-month-day values, time zones, first day of the week, minimal days in the first week of the year, determining whether a specific date falls on a weekend, calculating day differences, and more. During application development, developers can select appropriate functions based on business requirements.

## Development Steps

This example demonstrates how to use the [Calendar](../../../API_Reference/source_en/apis/LocalizationKit/cj-apis-i18n.md#class-calendar) class APIs by converting Gregorian dates to their corresponding Lunar calendar dates.

1. Import the module.

   <!-- compile -->

   ```cangjie
   // index.cj
   import kit.LocalizationKit.*
   ```

2. Gregorian calendar operations.

   <!-- compile -->

   ```cangjie
    // index.cj
    import std.time.DateTime as d

    let calendar: Calendar = getCalendar('zh-Hans', calendarType: 'gregory')
    // Set calendar object's datetime to 2022.05.13 08:00:00
    calendar.setTime(d.of(year: 2022,month: 5, dayOfMonth: 13, hour:5, minute:0))
    calendar.setTime(10540800000.0)

    // Set calendar object's datetime to 2022.05.13 08:00:00
    calendar.set(2022, 5, 13, hour: 8, minute: 0, second: 0)

    // Set calendar object's timezone
    calendar.setTimeZone('Asia/Shanghai')

    // Get calendar object's timezone
    let timezone: String = calendar.getTimeZone() // timezone = 'Asia/Shanghai'

    // Get first day of week for calendar object
    let firstDayOfWeek: Int32 = calendar.getFirstDayOfWeek() // firstDayOfWeek = 1

    // Set first day of week
    calendar.setFirstDayOfWeek(1)

    // Get minimal days in first week of year
    let minimalDaysInFirstWeek: Int32 = calendar.getMinimalDaysInFirstWeek() // minimalDaysInFirstWeek = 1

    // Set minimal days in first week of year
    calendar.setMinimalDaysInFirstWeek(3)

    // Get field-associated value from calendar object
    let year: Int32 = calendar.get('year') // year = 2022

    // Get localized name of calendar object
    let calendarName: String = calendar.getDisplayName('zh-Hans') // calendarName = 'Gregorian Calendar'

    // Determine if specified date falls on weekend
    let isWeekend: Bool = calendar.isWeekend(date: d.of(year: 2023,month: 9, dayOfMonth: 15)) // isWeekend = false

    // Perform arithmetic operations on calendar fields
    calendar.set(2023, 10, 15)
    calendar.add('date', 2)
    let day: Int32 = calendar.get('date') // day = 17

    // Calculate day difference between calendar and specified date
    let daysDifference: Int32 = calendar.compareDays(d.of(year: 2023,month: 10, dayOfMonth: 15)) // daysDifference = -34
   ```

3. Convert Gregorian dates to Lunar calendar dates.

   <!-- compile -->

   ```cangjie
    // index.cj
    import std.time.DateTime as d

    let calendar: Calendar = getCalendar('zh-Hans', calendarType: 'chinese')
    // Set Gregorian date to calendar object: 2023.07.25 08:00:00
    calendar.setTime(d.of(year: 2023,month: 7, dayOfMonth: 25, hour:8, minute:0))
    // Get Lunar year-month-day values
    let year: Int32 = calendar.get('year') // year = 40, representing the 40th year in the sexagenary cycle (range 1-60)
    let month: Int32 = calendar.get('month') // month = 5, representing June
    let day: Int32 = calendar.get('date') // day = 8, representing the 8th day
   ```

Supported calendar types:

| Type | Chinese Name |
| -------- | -------- |
| buddhist | Buddhist Calendar |
| chinese | Lunar Calendar |
| coptic | Coptic Calendar |
| ethiopic | Ethiopian Calendar |
| hebrew | Hebrew Calendar |
| gregory | Gregorian Calendar |
| indian | Indian Calendar |
| islamic_civil | Islamic Civil Calendar |
| islamic_tbla | Islamic Tabular Calendar |
| islamic_umalqura | Islamic Umm al-Qura Calendar |
| japanese | Japanese Calendar |
| persian | Persian Calendar |