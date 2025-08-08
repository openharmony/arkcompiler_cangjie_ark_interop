# ohos.values_bucket (Data Set)

A ValuesBucket is a collection of data that developers insert into a database, transmitted in key-value pairs.

## Import Module

```cangjie
import kit.ArkData.*
```

## enum VBValueType

```cangjie
public enum VBValueType {
    | Null
    | Integer(Int64)
    | Double(Float64)
    | Str(String)
    | Boolean(Bool)
    | ...
}
```

**Description:** This type represents the data field types allowed in the database.

**System Capability:** SystemCapability.DistributedDataManager.DataShare.Core

**Since:** 21

### Boolean(Bool)

```cangjie
Boolean(Bool)
```

**Description:** Indicates the field type is boolean.

**System Capability:** SystemCapability.DistributedDataManager.DataShare.Core

**Since:** 21

### Double(Float64)

```cangjie
Double(Float64)
```

**Description:** Indicates the field type is floating-point number.

**System Capability:** SystemCapability.DistributedDataManager.DataShare.Core

**Since:** 21

### Integer(Int64)

```cangjie
Integer(Int64)
```

**Description:** Indicates the field type is integer.

**System Capability:** SystemCapability.DistributedDataManager.DataShare.Core

**Since:** 21

### Null

```cangjie
Null
```

**Description:** Indicates the field type is null.

**System Capability:** SystemCapability.DistributedDataManager.DataShare.Core

**Since:** 21

### Str(String)

```cangjie
Str(String)
```

**Description:** Indicates the field type is string.

**System Capability:** SystemCapability.DistributedDataManager.DataShare.Core

**Since:** 21