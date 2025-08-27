# Navigation

Navigation组件是路由导航的根视图容器，一般作为Page页面的根容器使用，其内部默认包含了标题栏、内容区和工具栏，其中内容区默认首页显示导航内容（Navigation的子组件）或非首页显示（NavDestination的子组件），首页和非首页通过路由进行切换。

> **说明：**
>
> - NavBar嵌套使用Navigation时，内层Navigation的生命周期不和外层Navigation以及[全模态](./cj-universal-attribute-bindcontentcover.md)的生命周期进行联动。
> - NavDestination未设置主副标题并且没有返回键时，不显示标题栏。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## enum BarStyle

```cangjie
public enum BarStyle <: Equatable<BarStyle> {
    | Standard
    | Stack
    | ...
}
```

**功能：** 标题栏与内容栏布局模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<BarStyle>

### Stack

```cangjie
Stack
```

**功能：** 标题栏与内容区采用层叠布局，标题栏布局在内容区上层。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Standard

```cangjie
Standard
```

**功能：** 标题栏与内容区采用上下布局。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(BarStyle)

```cangjie
public operator func !=(other: BarStyle): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[BarStyle](#enum-barstyle)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值不相等，则返回true，否则返回false。|

### func ==(BarStyle)

```cangjie
public operator func ==(other: BarStyle): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[BarStyle](#enum-barstyle)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值相等，则返回true，否则返回false。|

## enum NavigationTitleMode

```cangjie
public enum NavigationTitleMode <: Equatable<NavigationTitleMode> {
    | Free
    | Full
    | Mini
    | ...
}
```

**功能：** 路由栈操作模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<NavigationTitleMode>

### Free

```cangjie
Free
```

**功能：** 当内容为满一屏的可滚动组件时，标题随着内容向上滚动而缩小（子标题的大小不变、淡出）。向下滚动内容到顶时则恢复原样。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Full

```cangjie
Full
```

**功能：** 固定为大标题模式。初始值：只有主标题时，标题栏高度为112.vp；同时有主标题和副标题时，标题栏高度为138.vp。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Mini

```cangjie
Mini
```

**功能：** 固定为小标题模式。初始值：只有主标题时，标题栏高度为56.vp；同时有主标题和副标题时，标题栏高度为82.vp。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(NavigationTitleMode)

```cangjie
public operator func !=(other: NavigationTitleMode): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[NavigationTitleMode](#enum-navigationtitlemode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(NavigationTitleMode)

```cangjie
public operator func ==(other: NavigationTitleMode): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[NavigationTitleMode](#enum-navigationtitlemode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取当前枚举的字符串表示。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的字符串表示。|
