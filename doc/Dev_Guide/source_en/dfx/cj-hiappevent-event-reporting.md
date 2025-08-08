# Event Reporting  

HiAppEvent provides interfaces for handling and reporting events.

## Interface Description  

For detailed usage instructions of the API interfaces (parameter constraints, value ranges, etc.), please refer to the [Application Event Tracking API Documentation](../../../API_Reference/source_en/apis/PerformanceAnalysisKit/cj-apis-hiappevent.md).  

**Data Processor Interface Functions:**  

| Interface Name                              | Description                                                  |
| ------------------------------------------- | ------------------------------------------------------------ |
| addProcessor(processor: Processor): Int64  | Adds a data processor to enable event reporting via predefined processors. |
| removeProcessor(id: Int64): Unit           | Removes a data processor to disable predefined processors.   |

**User ID Interface Functions:**  

| Interface Name                             | Description                                                  |
| ------------------------------------------ | ------------------------------------------------------------ |
| setUserId(name: String, value: String): Unit | Sets a user ID, which can be carried by data processors when reporting events. |
| getUserId(name: String): String            | Retrieves the set user ID.                                   |

**User Property Interface Functions:**  

| Interface Name                                   | Description                                                  |
| ------------------------------------------------ | ------------------------------------------------------------ |
| setUserProperty(name: String, value: String): Unit | Sets a user property, which can be carried by data processors when reporting events. |
| getUserProperty(name: String): String            | Retrieves the set user property.                             |

## Development Steps  

The following example demonstrates how to implement event tracking for user button clicks and report events via processors.  

1. Edit the `entry > src > main > cangjie > index.cj` file in the project, add a button, and include a data processor in its `onClick` function. The `analytics_demo` is a predefined processor library on the device. The complete sample code is as follows:  

   <!--compile-->
   ```cangjie
   import kit.BasicServicesKit.*
   import kit.PerformanceAnalysisKit.*

    @Entry
    @Component
    class EntryView {
        @State
        var message: String = "Hello World"

        var processorId = -1

        func build() {
            Row {
                Column {
                    Button(this.message)
                        .fontSize(50)
                        .fontWeight(FontWeight.Bold)
                        .onClick {
                            evt => this.message = "Hello Cangjie"
                            // Add a data processor in the button click function
                            let eventConfig = AppEventReportConfig(
                                // Event domain definition
                                domain: "button",
                                // Event name definition
                                name: "click",
                                // Whether to report events in real time
                                isRealTime: true
                            )
                            let processor = Processor(
                                'analytics_demo',
                                debugMode: true,
                                routeInfo: 'CN',
                                onStartReport: true,
                                onBackgroundReport: true,
                                periodReport: 10,
                                batchReport: 5,
                                userIds: ['testUserIdName'],
                                userProperties: ['testUserPropertyName'],
                                eventConfigs: [eventConfig]
                            )
                            this.processorId = HiAppEvent.addProcessor(processor)
                        }
                }.width(100.percent)
            }.height(100.percent)
        }
    }
   ```

2. Edit the `entry > src > main > cangjie > index.cj` file, add a button, and include functions to set and retrieve a user ID in its `onClick` function. The complete sample code is as follows:  

   ```cangjie
    Button("userIdTest").onClick {
        evt =>
        // Set a user ID in the button click function
        HiAppEvent.setUserId('testUserIdName', '123456')

        // Retrieve the set user ID in the button click function
        let userId = HiAppEvent.getUserId('testUserIdName')
    }
   ```

3. Edit the `entry > src > main > cangjie > index.cj` file, add a button, and include functions to set and retrieve a user property in its `onClick` function. The complete sample code is as follows:  

   ```cangjie
    Button("userPropertyTest").onClick {
        evt =>
        // Set a user property in the button click function
        HiAppEvent.setUserProperty('testUserPropertyName', '123456')

        // Retrieve the set user property in the button click function
        let userProperty = HiAppEvent.getUserProperty('testUserPropertyName')
    }
   ```

4. Edit the `entry > src > main > cangjie > index.cj` file, add a button, and include event tracking in its `onClick` function to record button click events. The complete sample code is as follows:  

   ```cangjie
    Button("writeTest").onClick {
        evt =>
        let eventParams: Array<Parameters> = [Parameters("click_time", INT(100))]
        let eventInfo: AppEventInfo = AppEventInfo(
            // Event domain definition
            "button",
            // Event name definition
            "click",
            // Event type definition
            EventType.BEHAVIOR,
            // Event parameter definition
            eventParams)

        HiAppEvent.write(eventInfo)
    }
   ```

5. Edit the `entry > src > main > cangjie > index.cj` file, add a button, and include a function to remove the data processor (added in Step 2) in its `onClick` function. The complete sample code is as follows:  

   ```cangjie
    Button("removeProcessorTest").onClick {
        evt =>
            // Remove the data processor in the button click function
            HiAppEvent.removeProcessor(this.processorId)
    }
   ```

6. Click the **Run** button in the IDE to launch the application. Then, sequentially click the buttons **addProcessorTest**, **userIdTest**, **userPropertyTest**, **writeTest**, and **removeProcessorTest** in the app interface. This will successfully report an event via the data processor.  

   Finally, the event processor will receive the event data, and the following log will appear in the Log window, indicating successful event tracking for the button click:  

   ```text
   HiAppEvent success to write event
   ```