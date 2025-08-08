# 手势拦截

手势拦截主要用于确保手势按需执行，有效解决手势冲突问题。典型应用场景包括：嵌套滚动、通过过滤组件响应手势的范围来优化交互体验。手势拦截主要采用[手势触发控制](#手势触发控制)和[手势响应控制](#手势响应控制)两种方式实现。

## 手势触发控制

手势触发控制是指，在系统判定阈值已满足的条件下，应用可自行判断是否应拦截手势，使手势操作失败。

**图1** 手势触发控制流程图

![gesture_interception](./figures/gesture_interception1.png)

手势触发控制涉及以下接口。

|**接口**|**说明**|
|:---|:---|
| [onGestureJudgeBegin](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-gesture-judge.md#func-ongesturejudgebegingestureinfo-basegestureevent---gesturejudgeresult) | 用于手势拦截，是通用事件。在手势满足系统触发阈值场景下，回调给应用判断是否拦截手势。 |

## 手势响应控制

手势响应控制指的是手势已经成功识别，但是开发者仍然可以通过调用API接口控制手势回调是否能够响应。

**图3** 手势响应控制流程图

![gesture_interception](./figures/gesture_interception3.png)

手势响应控制的前提是手势识别成功，如果手势不成功也不会产生手势回调响应。

1. 业务手势作业流：指真正触发UI变化的业务手势，比如使页面滚动的PanGesture，触发点击的TapGesture等。

2. 监听手势作业流：指在监听手势运行的过程中，应根据上下文的业务状态变化动态控制手势识别器的启停，例如在组件于嵌套滚动过程中是否已滑至边缘。这一监听事件可借助一个使用[并行手势绑定方式](./cj-gesture-events-binding.md#parallelgesture并行手势绑定方法)的PanGesture实现，或者采用Touch事件来完成。

3. 设置手势并行：此步骤并非必需，典型场景是在嵌套滚动中，设置外部组件的滚动手势与内部的滚动手势并行。

4. 动态开闭手势：指通过手势识别器的setEnable方法，控制手势是否响应用户回调。

手势响应控制涉及以下接口。

|**接口**|**说明**|
|:---|:---|
| [parallelGesture](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-gesture-bind.md#func-parallelgesturegesturetype-gesturemask) | 可使开发者定义的手势，与比他优先级高的手势并行。 |
