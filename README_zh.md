# 仓颉互操作 API 公共仓

## 简介

仓颉 ArkTS 互操作库 API，用于提供仓颉与 ArkTS 跨语言互操作能力，包含仓颉互操作库提供的公共接口、互操作宏接口和依赖的 json 和 cffi 接口，期望给开发者提供兼顾开发效率和运行效率的跨语言互操作解决方案，提供简洁的互操作开发范式，降低跨语言互通开销。

其主要结构如下图所示：

![仓颉互操作 API 框架](./figures/cangjie-interop.png)

针对互操作场景诉求，仓颉提供 ark_interop 互操作库来实现与 ArkTS 的互操作。该库主要提供以下关键数据结构：

- JSValue: 用于表示来自 ArkTS 中的对象（如数字、字符串、对象、函数），是仓颉与 ArkTS 类型转换的桥梁；
- JSContext: 用于表示与 ArkTS 互操作的上下文，提供模块加载、JSValue 创建等能力；
- JSCallInfo: 用于表示当发生来自于 ArkTS 互操作调用时 调用的参数集合

## 目录

```text
.
├── api                  # 仓颉互操作 API 的公共仓代码
├── doc                   # 仓颉文档，包括api参考、应用开发指南、仓颉编程语言用户手册
├── mocks                 # sdk 构建时 ffi mock 桩
├── generate_mock.py      # 生成 mock 的构建脚本
├── bundle.json
└── LICENSE
```

## 约束

- 当前开放的安全基础能力仓颉接口仅支持standard设备。

## 构建指导

1. 初始化代码仓

    ```text
    repo init -u https://gitcode.com/openharmony-sig/manifest.git -b master -m cangjie_oh.xml --no-repo-verify
    repo sync -c
    ```

2. 预下载

    ```text
    bash build/prebuilts_download.sh
    ```

3. 构建产物

    ```text
    // rom构建
    ./build.sh --product-name rk3568 -ccache --target-cpu=arm64

    //oh-sdk构建：
    ./build.sh --product-name ohos-sdk --ccache --build-target out/sdk/gen/build/ohos/sdk:cangjie
    ```

构建产物一般在： out/generic_generic_arm_64only/hisi_newbaltimore_hmscore_standard/packages/hmos-sdk目录

## 使用场景

包含仓颉- ArkTS 互操作库，用于仓颉- ArkTS 互操作。json 库/ APILevel / cffi 库为基础功能库，提供给仓颉 api /仓颉 ui 等子系统等公共能力.

在 OpenHarmony 应用开发中，存在使用仓颉与 ArkTS 混合开发的诉求，例如以下场景：

- 场景一：在使用 ArkTS 开发时，通过跨语言互操作调用仓颉开发的代码模块，发挥仓颉高性能高并发优势，提升应用性能体验；

- 场景二：在使用仓颉开发时，通过跨语言互操作调用 ArkTS 库，复用 ArkTS 丰富的库生态；

同时针对互操作带来的开发复杂度，仓颉提供声明式互操作宏 ark_interop_macro，使开发者可以使用宏“@Interop[ArkTS]”标注仓颉代码中需要导出给 ArkTS 使用的函数或类型，在编译阶段自动生成互操作“胶水层”代码及 ArkTS 接口声明，减少开发者手写互操作代码的复杂度。

![仓颉互操作流程图](./figures/api.png)

模块说明：
- 互操作库：开发者通过调用互操作提供的API，实现跨语言参数传递、函数调用等能力。
- 互操作宏：开发者使用互操作宏来标注需要被ArkTS代码调用的仓颉接口，能够自动生成互操作“胶水”代码及 ArkTS 接口声明。

互操作开发指南请参见[互操作开发指南](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/User_Manual/source_zh_cn/FFI/cangjie-arkts/cangjie_arkts_overview.md)。

互操作 API 指导请参见[互操作 API 指导](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_zh_cn/arkinterop/cj-apis-ark_interop.md)

## 参与贡献

欢迎广大开发者贡献代码、文档等，具体的贡献流程和方式请参见[参与贡献](https://gitcode.com/openharmony/docs/blob/master/zh-cn/contribute/%E5%8F%82%E4%B8%8E%E8%B4%A1%E7%8C%AE.md)。

## 相关仓

[arkui_napi](https://gitee.com/openharmony/arkui_napi)
