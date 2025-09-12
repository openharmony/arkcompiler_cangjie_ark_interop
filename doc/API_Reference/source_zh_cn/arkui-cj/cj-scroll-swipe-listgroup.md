# ListItemGroup

该组件用来展示列表item分组，宽度默认充满[List](cj-scroll-swipe-list.md)组件，必须配合List组件来使用。

> **说明：**
>
> - 该组件的父组件只能是[List](cj-scroll-swipe-list.md)。
> - ListItemGroup组件不支持设置[通用属性aspectRatio](cj-universal-attribute-layoutconstraints.md)。
> - 当ListItemGroup的父组件List的listDirection属性为Axis.Vertical时，设置[通用属性height](cj-universal-attribute-size.md)属性不生效。ListItemGroup的高度为header高度、footer高度和所有ListItem布局后总高度之和。
> - 当父组件List的listDirection属性为Axis.Horizontal时，设置[通用属性width](cj-universal-attribute-size.md)属性不生效。ListItemGroup的宽度为header宽度、footer宽度和所有ListItem布局后总宽度之和。
> - 当前ListItemGroup内部的ListItem组件不支持编辑、拖拽功能，即ListItem组件的editable属性不生效。
> - ListItemGroup使用direction属性设置布局方向不生效，ListItemGroup组件布局方向跟随父容器List组件的布局方向。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## 子组件

包含[ListItem](./cj-scroll-swipe-listitem.md)子组件。

## 创建组件

### init(CustomBuilder, CustomBuilder, Length, ListItemGroupStyle, () -> Unit)

```cangjie
public init(
    header!: CustomBuilder = {=>},
    footer!: CustomBuilder = {=>},
    space!: Length = 0.vp,
    style!: ListItemGroupStyle = ListItemGroupStyle.None,
    child!: () -> Unit
)
```

**功能：**  创建ListItemGroup组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

| 参数名    | 类型                                                                    | 必填  | 默认值                     | 说明                                                                                                                                                                                                                                                                                                                                                                                                                                   |
|:------ |:--------------------------------------------------------------------- |:--- |:----------------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| header | [CustomBuilder](./cj-common-types.md#type-custombuilder) | 否   | { => }                  | **命名参数。** 设置ListItemGroup头部组件。<br/>**说明：**<br/>可以放单个子组件或不放子组件。使用时结合[@Builder](../../../Dev_Guide/source_zh_cn/arkui-cj/paradigm/cj-macro-builder.md)和bind方法使用。                                                                                                                                                                                                                                                                                        |
| footer | [CustomBuilder](./cj-common-types.md#type-custombuilder) | 否   | { => }                  | **命名参数。** 设置ListItemGroup尾部组件。<br/>**说明：**<br/>可以放单个子组件或不放子组件。使用时结合[@Builder](../../../Dev_Guide/source_zh_cn/arkui-cj/paradigm/cj-macro-builder.md)和bind方法使用。                                                                                                                                                                                                                                                                                        |
| space  | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)        | 否   | 0.vp                    | **命名参数。** 列表项间距。只作用于ListItem与ListItem之间，不作用于header与ListItem、footer与ListItem之间。<br/>初始值：0。<br/>单位：vp。<br/>**说明：**<br/>设置为负数或者大于等于List内容区长度时，按初始值显示。                                                                                                                                                                                                                                                                                   |
| style  | [ListItemGroupStyle](#enum-listitemgroupstyle)                        | 否   | ListItemGroupStyle.None | **命名参数。** 设置List组件卡片样式。<br/>初始值：ListItemGroupStyle.NONE<br/>设置为ListItemGroupStyle.NONE时无样式。设置为ListItemGroupStyle.CARD时，建议配合ListItem的ListItemStyle.CARD同时使用，显示默认卡片样式。<br/>卡片样式下，ListItemGroup初始规格：左右外边距12.vp，上下左右内边距4.vp。<br/>卡片样式下，为卡片内的列表选项提供了默认的focus、hover、press、selected和disable样式。<br/>**说明：**<br/>当前卡片模式下，使用默认Axis.Vertical排列方向，如果listDirection属性设置为Axis.Horizontal，会导致显示混乱；List属性alignListItem默认为ListItemAlign.Center，居中对齐显示。 |
| child  | ()->Unit                                                              | 是   | -                       | 声明容器子组件。                                                                                                                                                                                                                                                                                                                                                                                                                             |

## 通用属性/通用事件

通用属性：全部支持。

> **说明：**
>
> 不支持[设置通用属性aspectRatio](./cj-universal-attribute-layoutconstraints.md#func-aspectratiofloat64)

通用事件：全部支持。

## 组件属性

### func divider(Option\<ListDividerOptions>)

```cangjie
public func divider(value: Option<ListDividerOptions>): This
```

**功能：** 用于设置ListItem分割线样式，默认无分割线。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

| 参数名   | 类型                                                                                                               | 必填  | 默认值 | 说明     |
|:----- |:---------------------------------------------------------------------------------------------------------------- |:--- |:--- |:------ |
| value |Option<ListDividerOptions> | 是   | -   | 分割线样式。 |

## 基础类型定义

### class ListDividerOptions

```cangjie
public class ListDividerOptions {
    public var strokeWidth: Length
    public var color: ResourceColor = Color(0X08000000)
    public var startMargin: Length = 0.vp
    public var endMargin: Length = 0.vp
    public init(
        strokeWidth!: Length,
        color!: ResourceColor = Color.Black,
        startMargin!: Length = 0.vp,
        endMargin!: Length = 0.vp
    )
}
```

**功能：** ListItem分割线样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var color

```cangjie
public var color: ResourceColor = Color(0X08000000)
```

**功能：** 设置分割线的颜色。

**类型：** [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var endMargin

```cangjie
public var endMargin: Length = 0.vp
```

**功能：** 设置分割线距离列表侧边结束端的距离。

**类型：** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var startMargin

```cangjie
public var startMargin: Length = 0.vp
```

**功能：** 设置分割线距离列表侧边起始端的距离。

**类型：** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var strokeWidth

```cangjie
public var strokeWidth: Length
```

**功能：** 设置分割线的线宽。

**类型：** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(Length, ResourceColor, Length, Length)

```cangjie
public init(
    strokeWidth!: Length,
    color!: ResourceColor = Color.Black,
    startMargin!: Length = 0.vp,
    endMargin!: Length = 0.vp
)
```

**功能：** 构造ListItem分割线样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

| 参数名         | 类型                                                                    | 必填  | 默认值         | 说明               |
|:----------- |:--------------------------------------------------------------------- |:--- |:----------- |:---------------- |
| strokeWidth | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)        | 是   | -           | 分割线的线宽。          |
| color       | [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor) | 否   | Color.Black | 分割线的颜色。          |
| startMargin | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)        | 否   | 0.vp        | 分割线距离列表侧边起始端的距离。 |
| endMargin   | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)        | 否   | 0.vp        | 分割线距离列表侧边结束端的距离。 |

### enum ListItemGroupStyle

```cangjie
public enum ListItemGroupStyle {
    | None
    | Card
    | ...
}
```

**功能：** 设置List组件卡片样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Card

```cangjie
Card
```

**功能：** 显示默认卡片样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### None

```cangjie
None
```

**功能：** 无样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## 示例代码

### 示例1（设置吸顶/吸底）

该示例通过stick实现了Header吸顶和Footer吸底的效果。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

class TimeTable {
  let title: String
  let projects: Array<String>

    public init(title:String,projects: Array<String>){
        this.title = title
        this.projects = projects
    }
}

@Entry
@Component

class EntryView {
     let timeTable = [
        TimeTable("Monday", ["Chinese", "Math", "English"]),
        TimeTable("Tuesday", ["Physics", "Chemistry", "Biology"]),
        TimeTable("Wednesday", ["History", "Geography", "Politics"]),
        TimeTable("Thursday", ["Art", "Music", "PE"])]

      @Builder func itemHead(text:String) {
        Text(text)
        .fontSize(20)
        .backgroundColor(0xAABBCC)
        .width(100.percent)
        .padding(10)
    }

    @Builder func itemFoot(num:Int64) {
        Text("Total ${num} classes")
        .fontSize(16)
        .backgroundColor(0xAABBCC)
        .width(100.percent)
        .padding(5)
  }

    func build() {
        Column() {
            List(space: 20) {
                ForEach(this.timeTable, itemGeneratorFunc: {item:TimeTable ,_:Int64 =>
                        ListItemGroup(header:{=>bind(this.itemHead,this)(item.title)},footer:{=>bind(this.itemFoot,this)(item.projects.size)}){
                            ForEach(item.projects,itemGeneratorFunc: {project:String,_:Int64=>
                                    ListItem(){
                                        Text(project)
                                        .width(100.percent)
                                        .height(100)
                                        .fontSize(20)
                                        .textAlign(TextAlign.Center)
                                        .backgroundColor(0xFFFFFF)
                                    }})
                        }
                        })
             }
        }
        .height(800.vp)
        .backgroundColor(Color(0XD3D3D3))
    }
}
```

![list_item_group](figures/listitem_group1.gif)
