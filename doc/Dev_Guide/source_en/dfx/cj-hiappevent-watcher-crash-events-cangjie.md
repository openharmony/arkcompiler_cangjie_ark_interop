# Subscribing to Crash Events (Cangjie)

## Interface Description

For detailed API usage instructions (parameter constraints, value ranges, etc.), please refer to the [Application Event Tracking API Documentation](../../../API_Reference/source_en/apis/PerformanceAnalysisKit/cj-apis-hiappevent.md).

> **Note:**
>
> Using the Cangjie interface to subscribe to crash events includes two crash types: CjError and NativeCrash.

**Subscription Interface Functionality:**

| Interface Name                                       | Description                                  |
| ---------------------------------------------------- | ------------------------------------------- |
| addWatcher(watcher: Watcher): Option\<AppEventPackageHolder> | Adds an application event observer method for subscribing to application events. |
| removeWatcher(watcher: Watcher): Unit                | Removes an application event observer method for unsubscribing from application events. |

## Development Steps

Using the example of subscribing to crash events triggered by user button clicks, the development steps are as follows:

1. Create a new Cangjie application project and edit the "entry > src > main > cangjie > main_bility.cj" file to import dependency modules:

   <!--compile-->
   ```cangjie
   import kit.BasicServicesKit.*
   import kit.PerformanceAnalysisKit.{HiAppEvent, Hilog, AppEventGroup, AppEventFilter, Watcher}
   ```

2. Edit the "entry > src > main > cangjie > main_bility.cj" file and add a subscription to system events in the onCreate function. Example code:

   <!--compile-->
   ```cangjie
    let eventfilter = AppEventFilter("OS", names: ["APP_CRASH"])
    let watcher = Watcher(
        // Developers can customize the observer name, which the system uses to identify different observers
        "watcher2",
        // Developers can subscribe to system events of interest; here, crash events are subscribed to
          appEventFilters: [eventfilter],
        // Developers can implement a real-time callback function for custom processing of subscribed event data
        onReceive: {
            domain: String, appEventGroups: Array<AppEventGroup> =>
            Hilog.info(0x0000, 'testTag', "HiAppEvent onReceive: domain=${domain}")
            for (eventGroup in appEventGroups) {
                // Developers can distinguish different system events based on the event names in the event collection
                Hilog.info(0x0000, 'testTag', "HiAppEvent eventName=${eventGroup.name}")
                for (eventInfo in eventGroup.appEventInfos) {
                    // Developers can perform custom processing on event data in the event collection; here, the event data is logged
                    Hilog.info(0x0000, 'testTag', "HiAppEvent eventInfo.domain=${eventInfo.domain}")
                    Hilog.info(0x0000, 'testTag', "HiAppEvent eventInfo.name=${eventInfo.name}")
                    Hilog.info(0x0000, 'testTag', "HiAppEvent eventInfo.eventType.value=${eventInfo.event.value}")
                    for (para in eventInfo.params) {
                        // Developers can access crash event-related information
                        if (para.key == "hilog") {
                          Hilog.info(0x0000, 'testTag', "HiAppEvent eventInfo.params.${para.key}=${para.value.value.size}")
                        } else {
                            Hilog.info(0x0000, 'testTag', "HiAppEvent eventInfo.params.${para.key}=${para.value.value}")
                        }
                    }
                }
            }
        }
    )
    HiAppEvent.addWatcher(watcher)
   ```

3. Edit the "entry > src > main > cangjie > Index.cj" file, add a button, and construct a crash scenario in its onClick function to trigger a crash event. Example code:

   <!--compile-->
   ```cangjie
    // Construct a crash scenario in the button click function to trigger an application crash event
    Button("appCrash").onClick { evt =>
        FileUri("")
    }
   ```

4. Click the Run button in DevEco Studio to launch the application project. Then, click the "appCrash" button in the application interface to trigger a crash event. After the crash event occurs, the system generates crash logs based on the crash type (CjError or NativeCrash) using different stack trace methods before invoking the callback. NativeCrash stack tracing takes approximately 2 seconds, with actual time depending on the number of business threads and inter-process communication delays. CjError triggers in-process stack tracing, while NativeCrash triggers out-of-process stack tracing, making NativeCrash stack tracing more time-consuming than CjError. Users can subscribe to crash events, which are reported asynchronously after stack tracing completes without blocking current business operations.

5. If the application does not catch the crash exception, the system handles the crash and exits the application. Upon the next launch, HiAppEvent reports the crash event to registered listeners, completing the callback.

If the application actively catches the crash exception, HiAppEvent will callback before the application exits in the following two scenarios:

Scenario 1: The exception handler does not actively exit, and the application will not exit after a crash. For example, using the [errorManger.on](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#static-func-onstring-errorobserver) method to catch CjError crashes, or the application actively registers a NativeCrash signal handler without exiting.

Scenario 2: The exception handling takes too long, delaying the application exit.

After HiAppEvent completes the event reporting callback, you can view the system event data processing logs in the Log window:

   ```text
   HiAppEvent onReceive: domain=OS
   HiAppEvent eventName=APP_CRASH
   HiAppEvent eventInfo.domain=OS
   HiAppEvent eventInfo.name=APP_CRASH
   HiAppEvent eventInfo.eventType.value=1
   HiAppEvent eventInfo.params.bundle_name=com.example.myapplication
   HiAppEvent eventInfo.params.bundle_version=1.0.0
   HiAppEvent eventInfo.params.crash_type=CjError
   HiAppEvent eventInfo.params.exception={"message":"none","name":"none","stack":"one"}
   HiAppEvent eventInfo.params.external_log=[/data/storage/el2/log/hiappevent/APP_CRASH_1744613860845_42711.log]
   HiAppEvent eventInfo.params.foreground=true
   HiAppEvent eventInfo.params.hilog= 10054
   HiAppEvent eventInfo.params.log_over_limit=false
   HiAppEvent eventInfo.params.pid=42711
   HiAppEvent eventInfo.params.time=1744613860665.000000
   HiAppEvent eventInfo.params.uid=20020192
   HiAppEvent eventInfo.params.uuid=4e85d04543811813ab4a2a3ed2443ebeebcca84298b89cb2460ecf99469b52de
   ```