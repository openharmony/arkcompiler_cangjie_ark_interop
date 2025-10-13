# PanGesture

滑动手势事件，当滑动的最小距离达到设定的最小值时触发滑动手势事件

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func !=(PanDirection)

```cangjie
public operator func !=(other: PanDirection): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[PanDirection](#enum-pandirection)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

## func ==(PanDirection)

```cangjie
public operator func ==(other: PanDirection): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[PanDirection](#enum-pandirection)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## func &(PanDirection)

```cangjie
public operator func &(right: PanDirection): PanDirection
```

**功能：** 对PanDirection进行逻辑与(&)运算。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|right|[PanDirection](#enum-pandirection)|是|-|滑动方向|

**返回值：**

|类型|说明|
|:----|:----|
|[PanDirection](#enum-pandirection)|滑动方向|

## func |(PanDirection)

```cangjie
public operator func |(right: PanDirection): PanDirection
```

**功能：** 对PanDirection进行逻辑或(|)运算。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|right|[PanDirection](#enum-pandirection)|是|-|滑动方向|

**返回值：**

|类型|说明|
|:----|:----|
|[PanDirection](#enum-pandirection)|滑动方向|

## 基础类型定义

### enum PanDirection

```cangjie
public enum PanDirection <: Equatable<PanDirection> {
    | None
    | Left
    | Right
    | Horizontal
    | Up
    | Down
    | Vertical
    | All
    | Computed(UInt32)
    | ...
}
```

**功能：** 拖动手势方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<PanDirection>

#### All

```cangjie
All
```

**功能：** 所有方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Computed(UInt32)

```cangjie
Computed(UInt32)
```

**功能：** 支持逻辑与(&)和逻辑或(|)运算。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Down

```cangjie
Down
```

**功能：** 向下拖动。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Horizontal

```cangjie
Horizontal
```

**功能：** 水平方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Left

```cangjie
Left
```

**功能：** 向左拖动。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### None

```cangjie
None
```

**功能：** 所有方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Right

```cangjie
Right
```

**功能：** 向右拖动。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Up

```cangjie
Up
```

**功能：** 向上拖动。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Vertical

```cangjie
Vertical
```

**功能：** 竖直方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func &(PanDirection)

```cangjie
public operator func &(right: PanDirection): PanDirection
```

**功能：** 对PanDirection进行逻辑与(&)运算。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|right|[PanDirection](#enum-pandirection)|是|-|滑动方向|

**返回值：**

|类型|说明|
|:----|:----|
|[PanDirection](#enum-pandirection)|滑动方向|

#### func |(PanDirection)

```cangjie
public operator func |(right: PanDirection): PanDirection
```

**功能：** 对PanDirection进行逻辑或(|)运算。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|right|[PanDirection](#enum-pandirection)|是|-|滑动方向|

**返回值：**

|类型|说明|
|:----|:----|
|[PanDirection](#enum-pandirection)|滑动方向|

