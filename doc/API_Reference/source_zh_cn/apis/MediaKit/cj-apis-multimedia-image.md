# ohos.multimedia.image

本模块提供图片处理效果，包括通过属性创建PixelMap、读取图像像素数据、读取区域内的图片数据等。

## 导入模块

```cangjie
import kit.ImageKit.*
```

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](../AbilityKit/cj-apis-app-ability-ui_ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## class ImageReceiver

```cangjie
public class ImageReceiver {}
```

**功能：** 图像接收类，用于获取组件surface id，接收最新的图片和读取下一张图片，以及释放ImageReceiver实例。

在调用以下方法前需要先创建ImageReceiver实例。

**系统能力：** SystemCapability.Multimedia.Image.ImageReceiver

**起始版本：** 21

### func off(ReceiveType)

```cangjie
public func off(eventType: ReceiveType): Unit
```

**功能：** 释放buffer时移除注册回调。

**系统能力：** SystemCapability.Multimedia.Image.ImageReceiver

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|eventType|[ReceiveType](../ImageKit/cj-apis-image.md#enum-receivetype)|是|-|注册事件的类型，固定为'imageArrival'，释放buffer时触发。|

### func on(ReceiveType, Callback0Argument)

```cangjie
public func on(eventType: ReceiveType, callback: Callback0Argument): Unit
```

**功能：** 接收图片时注册回调。

**系统能力：** SystemCapability.Multimedia.Image.ImageReceiver

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|eventType|[ReceiveType](../ImageKit/cj-apis-image.md#enum-receivetype)|是|-|注册事件的类型，固定为'imageArrival'，接收图片时触发。|
|callback|[Callback0Argument](../../arkinterop/cj-api-callback_invoke.md#class-callback0argument)|是|-|回调函数，当注册事件触发成功，err为undefined，否则为错误对象。|

### func readLatestImage()

```cangjie
public func readLatestImage(): Image
```

**功能：** 从ImageReceiver读取最新的图片。

**系统能力：** SystemCapability.Multimedia.Image.ImageReceiver

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[Image](../ImageKit/cj-apis-image.md#class-image)|返回最新图片。|

**异常：**

- BusinessException：对应错误码如下表，详见[Image错误码](../../errorcodes/cj-errorcode-image.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 62980104 | Failed to initialize the internal object. |

### func readNextImage()

```cangjie
public func readNextImage(): Image
```

**功能：** 从ImageReceiver读取下一张图片。

**系统能力：** SystemCapability.Multimedia.Image.ImageReceiver

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[Image](../ImageKit/cj-apis-image.md#class-image)|下一张图片|

**异常：**

- BusinessException：对应错误码如下表，详见[Image错误码](../../errorcodes/cj-errorcode-image.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 62980104 | Failed to initialize the internal object. |
