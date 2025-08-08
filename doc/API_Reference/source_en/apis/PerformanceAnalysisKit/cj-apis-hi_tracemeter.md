# ohos.hi_tracemeter (Performance Tracing)

This module provides the capability to trace process trajectories and measure program execution performance. The traced data is intended for analysis by the hiTraceMeter tool.

## Importing the Module

```cangjie
import kit.PerformanceAnalysisKit.*
```

## Usage Instructions

API sample code usage instructions:

- If the first line of sample code contains a "// index.cj" comment, it indicates the example can be compiled and run in the "index.cj" file of a Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, configuration is needed in the "main_ability.cj" file of the Cangjie template project.

For details about the aforementioned sample projects and configuration templates, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#Cangjie-sample-code-instructions).

## class HiTraceMeter

```cangjie
public class HiTraceMeter {}
```

**Description:** This class provides the capability to trace process trajectories and measure program execution performance.

**System Capability:** SystemCapability.HiviewDFX.HiTrace

**Since:** 21

### static func finishTrace(String, Int32)

```cangjie
public static func finishTrace(name: String, taskId: Int32): Unit
```

**Description:** Marks the end of a pre-traced time-consuming task.

The name and taskId in [finishTrace](#static-func-finishtracestring-int32) must correspond with the parameter values in the initiating [startTrace](#static-func-starttracestring-int32).

**System Capability:** SystemCapability.HiviewDFX.HiTrace

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | Name of the task to trace. |
| taskId | Int32 | Yes | - | Task ID. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

func f1(){
    HiTraceMeter.finishTrace("myTestFunc", 1)
}

func f2(){
    // Tracing parallel execution of tasks with the same name
    HiTraceMeter.startTrace("myTestFunc", 1)
    // Business logic code
    HiTraceMeter.startTrace("myTestFunc", 2)  // Second traced task starts while the first traced task with the same name hasn't ended, indicating parallel execution. The taskId for corresponding interfaces must differ.
    // Business logic code
    HiTraceMeter.finishTrace("myTestFunc", 1)
    // Business logic code
    HiTraceMeter.finishTrace("myTestFunc", 2)
}

func f3(){
    // Tracing serial execution of tasks with the same name
    HiTraceMeter.startTrace("myTestFunc", 1)
    // Business logic code
    HiTraceMeter.finishTrace("myTestFunc", 1)  // First traced task ends
    // Business logic code
    HiTraceMeter.startTrace("myTestFunc", 1)   // Second traced task with the same name starts, indicating serial execution of tasks with the same name.
    // Business logic code
    HiTraceMeter.finishTrace("myTestFunc", 1)
}

f1()
f2()
f3()
```

### static func startTrace(String, Int32)

```cangjie
public static func startTrace(name: String, taskId: Int32): Unit
```

**Description:** Marks the start of a pre-traced time-consuming task.

If multiple tasks with the same name need to be traced or the same task needs to be traced multiple times while being executed concurrently, each call to [startTrace](#static-func-starttracestring-int32) must use a different taskId.

If tasks with the same name are executed serially, the taskId can remain the same. For specific examples, refer to the samples in [HiTraceMeter.finishTrace](#static-func-finishtracestring-int32).

**System Capability:** SystemCapability.HiviewDFX.HiTrace

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | Name of the task to trace. |
| taskId | Int32 | Yes | - | Task ID. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

HiTraceMeter.startTrace("myTestFunc", 1)
```