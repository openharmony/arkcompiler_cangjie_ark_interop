# Error Management Development Guide

## Scenario Description

When an application's code contains specification issues or errors, exceptions and errors may occur during runtime, such as uncaught exceptions or application lifecycle timeouts. After an error occurs, the application may terminate abnormally. Error logs are typically stored in the user's local storage, making it inconvenient for developers to diagnose issues. Therefore, application developers can use error management interfaces to promptly report relevant errors and logs to their service platform before the application terminates, facilitating issue localization.

After using the `errormanager` interface to monitor exceptions and errors, the application will not terminate. If the sole purpose is to obtain error logs, it is recommended to use [hiappevent](./cj-hiappevent-watcher-crash-events.md).

## Interface Specifications

The application error management interface is provided by the [errorManager](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#class-errormanager) module. Developers can import it as needed. For details, refer to the [Development Example](#development-example).

**Error Management Interface Functionality:**

| Interface Name                                               | Description                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| on(onType: String, observer: ErrorObserver): Int32       | Registers an error observer. After registration, if the program crashes, the uncaught exception mechanism will be triggered. |
| off(offType: String, observerId: Int32): Unit | Unregisters an error observer.                               |

**Error Observer (ErrorObserver) Interface Functionality:**

| Interface Name                         | Description                                                  |
| ------------------------------ | ------------------------------------------------------------ |
| onUnhandledException(errMsg: String): Unit | This callback function is invoked when an exception is thrown during program execution and is not successfully caught by any `try-catch` statement. The content of `errMsg` contains "Uncaught exception was found." |
| onException?(errObject: ErrorObject): Unit | This callback function is invoked when an exception is thrown during program execution and is not successfully caught by any `try-catch` statement. `errObject` contains the name, message, and stack trace of the uncaught exception. |

## Development Example

<!--compile-->
```cangjie
import kit.PerformanceAnalysisKit.*
import kit.BasicServicesKit.*
import ohos.base.*
import ohos.window.WindowStage
import ohos.ability.*

let registerId: Int32 = -1
let callback: ErrorObserver = ErrorObserver(
    {
        errMsg: String => AppLog.info(errMsg)
    },
    onException: Some(
        {
            errorObj =>
            AppLog.info('onException, name: ${errorObj.name}')
            AppLog.info('onException, message: ${errorObj.message}')
            if (let Some(v) <- errorObj.stack) {
                AppLog.info('onException, stack: ${v}')
            }
        }
    )
)

var abilityWant: Want = Want()

public class EntryAbility <: UIExtensionAbility {
    func onCreate(want: Want, launchParam: LaunchParam) {
        AppLog.info("[Demo] EntryAbility onCreate")
        let registerId = ErrorManager.on("error", callback)
        abilityWant = want
    }

    public override func onDestroy() {
        AppLog.info("[Demo] EntryAbility onDestroy")
        ErrorManager.off("error", registerId)
    }

    func onWindowStageCreate(windowStage: WindowStage) {
        // Main window is created, set main page for this ability
        AppLog.info("[Demo] EntryAbility onWindowStageCreate")

        windowStage.loadContent("pages/index")
    }

    func onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        AppLog.info("[Demo] EntryAbility onWindowStageDestroy")
    }

    public override func onForeground() {
        // Ability has brought to foreground
        AppLog.info("[Demo] EntryAbility onForeground")
    }

    public override func onBackground() {
        // Ability has back to background
        AppLog.info("[Demo] EntryAbility onBackground")
    }
}
```