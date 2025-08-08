# SysCap (System Capability)

System Capability (SystemCapability, abbreviated as SysCap) refers to each relatively independent feature in an operating system. Different devices correspond to different sets of system capabilities, where each system capability corresponds to one or more APIs. Developers can determine whether a particular interface is available based on system capabilities.

## func canIUse(String)

```cangjie
public func canIUse(syscap: String): Bool
```

**Function:** Queries whether the system possesses a specific system capability.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| syscap | String | Yes | - | The name of the system capability to be queried. |

**Return Value:**

| Type | Description |
|:---|:---|
| Bool | The query result of the system capability. `true` indicates the system possesses the capability, while `false` indicates it does not. |

**Example:**

<!-- compile -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*
import ohos.hilog.Hilog

@Entry
@Component
class EntryView {
    func build() {
        Column(){
            Button("SysCap")
                .onClick({etv =>
                    if(canIUse("SystemCapability.Location.Location.Core")){
                        Hilog.info(0, "SysCap", "Supports SystemCapability.Location.Location.Core")
                    }
                    else{
                        Hilog.info(0, "SysCap", "Does not support SystemCapability.Location.Location.Core")
                    }
                })
        }
    }
}
```