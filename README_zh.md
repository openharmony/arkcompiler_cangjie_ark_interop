# 仓颉-ArkTS互操作

## 简介

仓颉-ArkTS互操作，用于提供仓颉与ArkTS跨语言互操作能力，包含仓颉互操作库接口、互操作宏接口，期望给开发者提供兼顾开发效率和运行效率的跨语言互操作解决方案，提供简洁的互操作开发范式，降低跨语言互通开销。同时本仓还提供了公共能力接口，包含JSON序列化和反序列化接口、C语言互操作工具类接口、通用异常接口、跨语言回调接口，并且还提供了公共文档，包含仓颉API参考、应用开发指南和仓颉编程语言用户手册。当前本仓开放的接口仅支持standard设备。

本仓库提供的公共能力接口共分两类，第一类用于开发者调用仓颉API时提供的公共接口，包含通用异常接口、跨语言回调接口；第二类用于仓颉内部API开发时，使用的内部公共接口，包含JSON序列化和反序列化接口和C语言互操作工具类接口。

- 通用异常接口：提供了通用的异常类BusinessException。
- 跨语言回调接口：提供了用于跨语言函数回调参数的工具类。
- JSON序列化和反序列化接口：用于对JSON数据的处理，实现String,JsonValue,DataModel之间的相互转换。
- C语言互操作工具类接口：提供了管理C互操作对象的工具类。

## 系统架构

整体架构如下图所示：

![仓颉互操作API框架](./figures/cangjie-interop.png)

**架构图说明**

- 接口说明：

    - 互操作库(ohos.ark_interop)：开发者通过调用互操作提供的API，实现跨语言参数传递、函数调用等能力。
    - 互操作宏(ohos.ark_interop_macro)：开发者使用互操作宏来标注需要被ArkTS代码调用的仓颉接口，能够自动生成互操作“胶水”代码及ArkTS接口声明。

- 关键数据结构：

    - JSRuntime：用于表示ArkTS运行时实例，每个ArkTS运行时对应一个JSRuntime实例，其提供创建JSRuntime的方法，以及获取与该JSRuntime关联的执行上下文JSContext；
    - JSContext：用于表示与一个JSRuntime关联的执行上下文，该执行上下文保存了全局对象，并提供模块加载，JSValue访问等相关方法；
    - JSModule：用于表示一个ArkTS模块，通过其提供的方法，即可以把已加载的ArkTS模块转换为JSObject，使能对该模块中数据和方法的访问；也可以创建新模块，并向该模块注册方法，用于将仓颉逻辑导出给ArkTS侧调用；
    - JSCallInfo：用于表示ArkTS调用仓颉方法时的调用信息，主要用于获取参数数量和参数列表；
    - JSValue：用于表示一个ArkTS的对象，在仓颉与 ArkTS 互操作时，它用于封装和传递 ArkTS 数据对象，当在仓颉侧需要获取JSValue中的值时，需要使用JSValue中提供的方法将其转换为具体类型的实例，比如JSNumber、JSString、JSBoolean等；反之，当在仓颉侧需要把数据传递给ArkTS时，可以利用JSContext提供的方法将一个仓颉对象封装成JSValue实例；

- 互操作库主要提供以下主要类型:JSUndefined,JSNull,JSBoolean,JSNumber,JSString,JSObject,JSArray,JSFunction,JSBigInt等，其映射的仓颉类型请参考[类型映射](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/User_Manual/source_zh_cn/FFI/cangjie-arkts/interoperability_macro.md#%E7%B1%BB%E5%9E%8B%E6%98%A0%E5%B0%84)。

- 互操作库通过C语言互操作调用ArkTS虚拟机和napi提供的接口完成互操作功能。

## 目录

```text
arkcompiler/cangjie_ark_interop
├── ohos
|   ├── ark_interop        # 仓颉互操作库
|   ├── ark_interop_helper # 仓颉互操作库工具类
|   ├── ark_interop_macro  # 仓颉互操作库宏
|   ├── business_exception # 仓颉公共能力，提供异常类
|   ├── callback_invoke    # 仓颉公共能力， 提供回调工具类
|   ├── encoding           # 仓颉公共能，提供JSON库
|   ├── ffi                # 仓颉公共能力，提供C语言互操作库
|   ├── labels             # 仓颉公共能力，提供api level标签
|   ├── utf16string        # 仓颉互操作库提供的utf16字符串处理类
├── doc                    # 仓颉文档，包括API参考、应用开发指南、仓颉编程语言用户手册
|   ├── API_Reference      # 仓颉API参考
|   ├── Dev_Guide          # 仓颉开发指南
|   ├── release-notes      # 仓颉发布说明
|   ├── User_Manual        # 仓颉用户手册
├── figures                # 本README需要使用的图片
├── test                   # 仓颉互操作测试用例
```

## 使用场景

在OpenHarmony应用开发中，存在使用仓颉与ArkTS混合开发的诉求，例如以下场景：

- 场景一：在使用ArkTS开发时，通过跨语言互操作调用仓颉开发的代码模块，发挥仓颉高性能高并发优势，提升应用性能体验；

详细的例子请参考：[在ArkTS中加载仓颉模块](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/User_Manual/source_zh_cn/FFI/cangjie-arkts/arkts_import_cangjie.md)

- 场景二：在使用仓颉开发时，通过跨语言互操作调用ArkTS库，复用ArkTS丰富的库生态；

详细的例子请参考：[仓颉应用中使用ArkTS模块](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/User_Manual/source_zh_cn/FFI/cangjie-arkts/using_arkts_module.md)

同时针对互操作带来的开发复杂度，仓颉提供声明式互操作宏ark_interop_macro，使开发者可以使用宏“@Interop[ArkTS]”标注仓颉代码中需要导出给ArkTS使用的函数或类型，在编译阶段自动生成互操作“胶水层”代码及ArkTS接口声明，减少开发者手写互操作代码的复杂度。详细的例子请参考：[仓颉-ArkTS声明式互操作宏](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/User_Manual/source_zh_cn/FFI/cangjie-arkts/interoperability_macro.md)。

互操作相关API请参见[API文档](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_zh_cn/arkinterop/cj-apis-ark_interop.md)，相关指导请参见[开发指南](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/Dev_Guide/summary_cjnative_ohos.md)

## 约束

无

## 参与贡献

欢迎广大开发者贡献代码、文档等，具体的贡献流程和方式请参见[参与贡献](https://gitcode.com/openharmony/docs/blob/master/zh-cn/contribute/%E5%8F%82%E4%B8%8E%E8%B4%A1%E7%8C%AE.md)。

## 相关仓

[arkui_napi](https://gitcode.com/openharmony/arkui_napi)

[ability_runtime](https://gitcode.com/openharmony/ability_ability_runtime)

[ability_runtime](https://gitcode.com/openharmony/arkcompiler_ets_runtime)