# ohos.font（自定义字体）

本模块提供注册自定义字体。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## class Font

```cangjie
public class Font {}
```

**功能：** 该类提供了一些注册和获取自定义字体的全局方法。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func getFontByName(String)

```cangjie
public func getFontByName(fontName: String): ?FontInfo
```

**功能：** 根据传入的系统字体名称获取系统字体的相关信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fontName|String|是|-|系统的字体名。|

**返回值：**

|类型|说明|
|:----|:----|
|?[FontInfo](#class-fontinfo)|字体的详细信息。|

### func getSystemFontList()

```cangjie
public func getSystemFontList(): Array<String>
```

**功能：** 获取系统字体列表。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<String>|系统字体列表。|

### func registerFont(ResourceStr, ResourceStr)

```cangjie
public func registerFont(familyName!: ResourceStr, familySrc!: ResourceStr): Unit
```

**功能：** 在字体管理中注册自定义字体。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|familyName|[ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-|**命名参数。** 设置注册字体的名称。|
|familySrc|[ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-|**命名参数。** 设置注册字体文件的路径。|

## class FontInfo

```cangjie
public class FontInfo {
    public var path: String
    public var postScriptName: String
    public var fullName: String
    public var family: String
    public var subfamily: String
    public var weight: UInt32
    public var width: UInt32
    public var italic: Bool
    public var monoSpace: Bool
    public var symbolic: Bool
}
```

**功能：** 字体信息类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var family

```cangjie
public var family: String
```

**功能：** 描述系统字体的字体家族。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var fullName

```cangjie
public var fullName: String
```

**功能：** 表示系统字体的名称。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var italic

```cangjie
public var italic: Bool
```

**功能：** 表示系统字体是否倾斜。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var monoSpace

```cangjie
public var monoSpace: Bool
```

**功能：** 表示系统字体是否紧凑。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var path

```cangjie
public var path: String
```

**功能：** 描述系统字体的文件路径。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var postScriptName

```cangjie
public var postScriptName: String
```

**功能：** 表示系统字体的postScript名称。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var subfamily

```cangjie
public var subfamily: String
```

**功能：** 表示系统字体的子字体家族。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var symbolic

```cangjie
public var symbolic: Bool
```

**功能：** 表示系统字体是否支持符号字体。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var weight

```cangjie
public var weight: UInt32
```

**功能：** 当weight>0时表示此字体集只包含所指定weight的字体，当weight=0时，表示此字体集包含所有字体。

**类型：** UInt32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var width

```cangjie
public var width: UInt32
```

**功能：** 表示系统字体的宽度，单位px。

**类型：** UInt32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## 示例代码

### 示例1（注册自定义字体）

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.*

@Entry
@Component
class EntryView {
    protected func onAppear() {
        getUIContext().getFont().registerFont(
            familyName: "Deyihei",
            familySrc: "/resources/rawfile/SmileySans-Oblique.ttf"
        )
    }

    func build() {
        Row {
            Column {
                Text("HelloWorld").fontFamily("Deyihei")
                Text("HelloWorld")
            }.width(100.percent)
        }.height(100.percent)
    }
}
```

![font1](figures/registerFont.png)

### 示例2（获取系统字体列表）

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.PerformanceAnalysisKit.Hilog

@Entry
@Component
class EntryView {
    func build() {
        Row {
            Column {
                Button("HelloWorld")
                .onClick {evt =>
                    let list = getUIContext().getFont().getSystemFontList()
                    Hilog.info(0, "AppLogCj", "${list.size}")
                }
            }.width(100.percent)
        }.height(100.percent)
    }
}
```

### 示例3（获取字体详细信息）

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.PerformanceAnalysisKit.Hilog

@Entry
@Component
class EntryView {
    func build() {
        Row {
            Column {
                Button("HelloWorld")
                .onClick {evt =>
                    let info = getUIContext().getFont().getFontByName("HarmonyOS Sans Italic")
                    match (info) {
                        case Some(v) =>
                            Hilog.info(0, "AppLogCj", "${v.path}")
                            Hilog.info(0, "AppLogCj", "${v.postScriptName}")
                            Hilog.info(0, "AppLogCj", "${v.fullName}")
                            Hilog.info(0, "AppLogCj", "${v.family}")
                            Hilog.info(0, "AppLogCj", "${v.subfamily}")
                            Hilog.info(0, "AppLogCj", "${v.weight}")
                            Hilog.info(0, "AppLogCj", "${v.width}")
                            Hilog.info(0, "AppLogCj", "${v.italic}")
                            Hilog.info(0, "AppLogCj", "${v.monoSpace}")
                            Hilog.info(0, "AppLogCj", "${v.symbolic}")
                        case None => Hilog.error(0, "AppLogCj", "None")
                    }
                }
            }.width(100.percent)
        }.height(100.percent)
    }
}
```

