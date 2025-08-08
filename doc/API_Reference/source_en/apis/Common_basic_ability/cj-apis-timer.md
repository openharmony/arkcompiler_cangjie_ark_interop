# Timer

This module provides basic timer capabilities, supporting the execution of corresponding functions at specified times. Based on the Cangjie programming language standard library. For details, refer to [Cangjie Language Library API](https://developer.huawei.com/consumer/cn/doc/cangjie-guides-V5/sync_package_classes-V5#class-timer).

## Import

```cangjie
import std.sync.Timer
```

## static func once(Duration, ()->Unit)

```cangjie
public static func once(delay: Duration, task: ()->Unit): Timer
```

**Function:** Sets and starts a one-time timer task, returning a [Timer](https://developer.huawei.com/consumer/cn/doc/cangjie-guides-V5/sync_package_classes-V5#class-timer) object instance that controls this task.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| delay | [Duration](https://developer.huawei.com/consumer/cn/doc/cangjie-guides-V5/time_package_structs-V5#struct-duration) | Yes | - | The time interval from now until the Task is executed. Valid range: [[Duration.Min](https://developer.huawei.com/consumer/cn/doc/cangjie-guides-V5/time_package_structs-V5#static-prop-min), [Duration.Max](https://developer.huawei.com/consumer/cn/doc/cangjie-guides-V5/time_package_structs-V5#static-prop-max)]. If less than or equal to [Duration.Zero](https://developer.huawei.com/consumer/cn/doc/cangjie-guides-V5/time_package_structs-V5#static-prop-zero), the Task will be executed immediately. |
| task | ()->Unit | Yes | - | The task to be executed at the scheduled time. |

**Return Value:**

| Type | Description |
|:---|:---|
| Timer | [Timer](https://developer.huawei.com/consumer/cn/doc/cangjie-guides-V5/sync_package_classes-V5#class-timer) object instance. |

## static func repeat(Duration, Duration, ()->Unit, CatchupStyle)

```cangjie
public static func repeat(delay: Duration, interval: Duration, task: ()->Unit, style!: CatchupStyle = Burst): Timer
```

**Function:** Sets and starts a recurring timer task, returning a [Timer](https://developer.huawei.com/consumer/cn/doc/cangjie-guides-V5/sync_package_classes-V5#class-timer) object instance that controls this task.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| delay | [Duration](https://developer.huawei.com/consumer/cn/doc/cangjie-guides-V5/time_package_structs-V5#struct-duration) | Yes | - | The time interval from now until the Task is executed. Valid range: [[Duration.Min](https://developer.huawei.com/consumer/cn/doc/cangjie-guides-V5/time_package_structs-V5#static-prop-min), [Duration.Max](https://developer.huawei.com/consumer/cn/doc/cangjie-guides-V5/time_package_structs-V5#static-prop-max)]. If less than or equal to [Duration.Zero](https://developer.huawei.com/consumer/cn/doc/cangjie-guides-V5/time_package_structs-V5#static-prop-zero), the Task will be executed immediately. |
| interval | [Duration](https://developer.huawei.com/consumer/cn/doc/cangjie-guides-V5/time_package_structs-V5#struct-duration) | Yes | - | The time interval between two Task executions. Valid range: ([Duration.Zero](https://developer.huawei.com/consumer/cn/doc/cangjie-guides-V5/time_package_structs-V5#static-prop-zero), [Duration.Max](https://developer.huawei.com/consumer/cn/doc/cangjie-guides-V5/time_package_structs-V5#static-prop-zero)]. |
| task | ()->Unit | Yes | - | The task to be executed at the scheduled time. |
| style | CatchupStyle | No | Burst | Catch-up strategy. <br> When Task execution takes too long, subsequent task execution times may be delayed. Different catch-up strategies apply to different scenarios. For details, refer to [CatchupStyle](https://developer.huawei.com/consumer/cn/doc/cangjie-guides-V5/sync_package_enums-V5#enum-catchupstyle). |

**Return Value:**

| Type | Description |
|:---|:---|
| Timer | [Timer](https://developer.huawei.com/consumer/cn/doc/cangjie-guides-V5/sync_package_classes-V5#class-timer) object instance. |

## func cancel()

```cangjie
public func cancel(): Unit
```

**Function:** Cancels this [Timer](https://developer.huawei.com/consumer/cn/doc/cangjie-guides-V5/sync_package_classes-V5#class-timer). The associated Task will no longer be scheduled for execution.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

> **Note:**
>
> If the associated Task is executing when this function is called, the current execution will not be interrupted. This function does not block the current thread. Calling this function multiple times is equivalent to calling it once.

## Examples

### Setting a One-Time Timer Task

> **Note:**
>
> - Sets a timer that executes a function after the timer expires.
> - The timer is automatically canceled after the callback is executed or can be manually canceled using the [cancel()](#func-cancel) method.

```cangjie
Timer.once(1000*Duration.millisecond, {=>
                        Hilog.info(0, "timer_once", "timer_once")})
```

### Setting a Recurring Timer Task

> **Note:**
>
> - Repeatedly calls a function with a fixed time delay between each call.
> - To cancel this timer, manually call the [cancel()](#func-cancel) method.

```cangjie
Timer.repeat(Duration.Zero, 1000 * Duration.millisecond,{=>
                        Hilog.info(0, "timer_repeat", "timer_repeat")})
```

### Canceling a Timer Task

```cangjie
var timer_1 : Timer = Timer.once(1000 * Duration.millisecond, { => Hilog.info(0, "timer_once", "timer_once")})
var timer_2 : Timer = Timer.repeat(Duration.Zero, 1000 * Duration.millisecond, { => Hilog.info(0, "timer_repeat", "timer_repeat") })
timer_1.cancel()
timer_2.cancel()
```

### Modifying Components with a Timer Task

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*
import ohos.hilog.Hilog
import std.sync.Timer

@Entry
@Component
class EntryView {
    @State var time : Int64 = 0
    @State var timeSring : String = "Nothing happen"
    var timer_1 : Timer = Timer.once(Duration.Zero, {=> Hilog.info(0, "timer_1", "timer_1")})
    var timer_2 : Timer = Timer.once(Duration.Zero, {=> Hilog.info(0, "timer_2", "timer_2")})
    func build() {
        Column(){
            Text(this.timeSring)
            Button("Timer setTimeout")
                .onClick({etv =>
                    this.timer_1 = Timer.once(1000 * Duration.millisecond, {=>
                        this.timeSring = "do after 1s delay"
                    })
                })
            Text("Timer value：${this.time} s")
            Button("Timer setInterval")
                .onClick({etv =>
                    this.timer_2 = Timer.repeat(Duration.Zero, 1000 * Duration.millisecond, {
                        => this.time++
                })
            })
            Button("cancelTimer")
                .onClick({etv =>
                    this.timeSring = "Nothing happen"
                    this.time = 0;
                    this.timer_1.cancel()
                    this.timer_2.cancel()
            })
        }
    }
}
```

## Additional Notes

### Timeout Delay

If the page is busy with other tasks, the timeout may occur later than expected. The Timer's function or code snippet will execute in the next time cycle. For example:

```cangjie
func foo(){
    Hilog.info(0, "test", "OH test foo is called")
}
Timer.once(Duration.Zero, {=> foo()})
Hilog.info(0, "test", "After OH test setTimeout")

//output
After OH test setTimeout
OH test foo is called
```

This is because, although the Timer is set with a 0-nanosecond delay, the task is not executed immediately but is placed in a queue to wait for the next event loop. The function in the queue will be executed only after the current code execution is complete, so the final execution order may differ from expectations.

### Maximum Delay Value

The maximum delay value for a timer is [Duration.Max](https://developer.huawei.com/consumer/cn/doc/cangjie-guides-V5/time_package_structs-V5#struct-duration), and the minimum delay value is [Duration.Min](https://developer.huawei.com/consumer/cn/doc/cangjie-guides-V5/time_package_structs-V5#static-prop-min). If the delay exceeds [Duration.Max](https://developer.huawei.com/consumer/cn/doc/cangjie-guides-V5/time_package_structs-V5#struct-duration) or is less than [Duration.Min](https://developer.huawei.com/consumer/cn/doc/cangjie-guides-V5/time_package_structs-V5#static-prop-min), the program will report an error: Exception info: Out of range of representation of 'Duration'!