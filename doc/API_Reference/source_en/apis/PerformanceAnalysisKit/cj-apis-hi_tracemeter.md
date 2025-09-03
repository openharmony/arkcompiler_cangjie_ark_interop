# ohos.hi_trace.meter (Performance Tracing)

This module provides the capability to trace process trajectories and measure program execution performance. The traced data is intended for analysis by the hiTraceMeter tool.

> **Note**
>
> The performance tracing interfaces `startTrace`, `finishTrace`, and `traceByValue` cannot specify the trace output level, which defaults to COMMERCIAL level performance tracing.
>
> User-space trace format uses the vertical bar `|` as a delimiter. Therefore, string parameters passed through performance tracing interfaces should avoid containing this character to prevent trace parsing exceptions.
>
> The total length of user-space traces is limited to 512 characters. Any excess will be truncated.

## Importing the Module

```cangjie
import kit.PerformanceAnalysisKit.*
```

## Usage Instructions

API sample code usage instructions:

- If the sample code's first line contains a `// index.cj` comment, it indicates the example can be compiled and run in the "index.cj" file of a Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the sample project and configuration template, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#cangjie-sample-code-instructions).

## class HiTraceMeter

```cangjie
public class HiTraceMeter {}
```

**Function:** This class provides the capability to trace process trajectories and measure program execution performance.

**System Capability:** SystemCapability.HiviewDFX.HiTrace

**Since:** 21

### static func finishTrace(String, Int32)

```cangjie
public static func finishTrace(name: String, taskId: Int32): Unit
```

**Function:** Marks the end of a pre-traced time-consuming task.

The `name` and `taskId` in [finishTrace](#static-func-finishtracestring-int32) must match the corresponding parameter values in the process-starting [startTrace](#static-func-starttracestring-int32).

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
    // Trace parallel execution of tasks with the same name
    HiTraceMeter.startTrace("myTestFunc", 1)
    // Business process code
    HiTraceMeter.startTrace("myTestFunc", 2)  // The second traced task starts while the first traced task with the same name hasn't ended, indicating parallel execution. The taskId for corresponding interfaces must differ.
    // Business process code
    HiTraceMeter.finishTrace("myTestFunc", 1)
    // Business process code
    HiTraceMeter.finishTrace("myTestFunc", 2)
}

func f3(){
    // Trace serial execution of tasks with the same name
    HiTraceMeter.startTrace("myTestFunc", 1)
    // Business process code
    HiTraceMeter.finishTrace("myTestFunc", 1)  // The first traced task ends
    // Business process code
    HiTraceMeter.startTrace("myTestFunc", 1)   // The second traced task with the same name starts, indicating serial execution of tasks with the same name.
    // Business process code
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

**Function:** Marks the start of a pre-traced time-consuming task.

If multiple tasks with the same `name` need to be traced or the same task needs to be traced multiple times, and these tasks are executed concurrently, the `taskId` for each call to [startTrace](#static-func-starttracestring-int32) must differ.

If tasks with the same `name` are executed serially, the `taskId` can be the same. For specific examples, refer to the samples in [HiTraceMeter.finishTrace](#static-func-finishtracestring-int32).

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