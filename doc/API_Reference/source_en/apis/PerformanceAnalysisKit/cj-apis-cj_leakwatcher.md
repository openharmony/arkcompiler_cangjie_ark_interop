# ohos.cj_leakwatcher (Object Leak Detection)

This module provides the capability to monitor whether Cangjie objects have memory leaks.

## Importing the Module

```cangjie
import kit.PerformanceAnalysisKit.*
```

## Usage Instructions

API example code usage instructions:

- If the first line of example code contains a "// index.cj" comment, it indicates the example can be compiled and run in the "index.cj" file of a Cangjie template project.
- If the example requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the example projects and configuration templates mentioned above, refer to [Cangjie Example Code Description](../../cj-development-intro.md#Cangjie-Example-Code-Description).

## class CJLeakWatcher\<T>

```cangjie
public class CJLeakWatcher<T> where T <: Object {}
```

**Description:** The leak detector class used to check whether Cangjie objects are potentially leaked.

**System Capability:** SystemCapability.HiviewDFX.HiChecker

**Since:** 21

### func enable(Bool)

```cangjie
public func enable(flag: Bool) : Unit
```

**Description:** Enables Cangjie object leak detection.

**System Capability:** SystemCapability.HiviewDFX.HiChecker

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| flag | Bool | Yes | - | Whether to enable CJLeakWatcher. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

var leakobj = CJLeakWatcher()
leakobj.enable(true)
```

### func watch(T, String)

```cangjie
public func watch(obj: T, msg: String) : Unit
```

**Description:** Registers an object for leak detection.

**System Capability:** SystemCapability.HiviewDFX.HiChecker

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:-----|:-----|:---|:---|:---------------|
| obj | T | Yes | - | Type T must be a subclass of the Object class. obj is the object to be detected. |
| msg | String | Yes | - | Custom object information. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

class A {
    var x1: Bool = true
    init(inputA: Bool) {
        x1 = inputA
    }
    func toString() {
        AppLog.error("A")
    }
}

var leakobj = CJLeakWatcher()
leakobj.enable(true)

let obj1 = ArrayList<A>(5000, {i => A(false)})
leakobj.watch(obj1, "Object-1")
```

### func check()

```cangjie
public func check() : ArrayList<String>
```

**Description:** Retrieves a list of objects registered via CJLeakWatcher.watch that may have memory leaks. Objects not reclaimed after triggering GC will be marked as leaked.

**System Capability:** SystemCapability.HiviewDFX.HiChecker

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| ArrayList\<String> | List of msg values for potentially leaked objects. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

class A {
    var x1: Bool = true
    init(inputA: Bool) {
        x1 = inputA
    }
    func toString() {
        AppLog.error("A")
    }
}

var leakobj = CJLeakWatcher()
leakobj.enable(true)

let obj1 = ArrayList<A>(5000, {i => A(false)})
leakobj.watch(obj1, "Object-1")

let leakList = leakobj.check()
```

### func dump(String)

```cangjie
public func dump(path: String) : ArrayList<String>
```

**Description:** Retrieves a list of objects registered via CJLeakWatcher.watch that may have memory leaks. Objects not reclaimed after triggering GC will be marked as leaked. The object list is written to a file with the .leakList suffix. Additionally, a heap snapshot is generated, producing a snapshot file with the .dumpHeapData suffix.

**System Capability:** SystemCapability.HiviewDFX.HiChecker

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:-----|:-----|:---|:---|:---------------|
| path | String | Yes | - | The path where the exported information files will be stored. |

**Return Value:**

| Type | Description |
|:----|:----|
| ArrayList\<String> | Returns a list of filenames for the potential leak object list file and Cangjie heap snapshot files. |

**Exceptions:**

- FSException: The specified path does not exist.

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

class A {
    var x1: Bool = true
    init(inputA: Bool) {
        x1 = inputA
    }
    func toString() {
        AppLog.error("A")
    }
}

var leakobj = CJLeakWatcher()
leakobj.enable(true)

let obj1 = ArrayList<A>(5000, {i => A(false)})
leakobj.watch(obj1, "Object-1")

let fileList = leakobj.dump("<your file path>")
```