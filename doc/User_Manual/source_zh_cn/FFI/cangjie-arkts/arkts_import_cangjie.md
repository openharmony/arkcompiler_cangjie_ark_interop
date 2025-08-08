# 在 ArkTS 中加载仓颉模块

此章节介绍如何在 ArkTS 中加载仓颉模块。在 ArkTS 中加载仓颉模块有三种方式：

- 使用 import 语法加载仓颉模块：从 API version 18 开始支持。
- 使用 loadNativeModule 接口加载仓颉模块：从 API version 18 开始支持。
- 使用 requireCJLib 接口加载仓颉模块：从 API version 12 开始支持。

## 方式一：使用 import 语法加载仓颉模块

> **说明：**
>
> - 此加载方式从 API version 18 开始支持。最低兼容版本：OpenHarmony 5.1.0(18)。如果加载仓颉模块的代码需要运行在 OpenHarmony 12 Release以上版本，请使用[requireCJLib 接口加载仓颉模块](#方式三使用-requirecjlib-接口加载仓颉模块)。
> - 使用 import 语法加载仓颉模块的方式和使用 import 语法加载 native 模块方式一致，详细介绍请参见：[静态方式加载 native 模块](https://docs.openharmony.cn/pages/v5.1/zh-cn/application-dev/arkts-utils/arkts-import-native-module.md)。

下面为使用 import 语法加载仓颉 ohos_app_cangjie_entry 模块并调用 addNumber 接口的示例：

1. 在 ArkTS 工程中创建仓颉模块，详情请参见[在 ArkTS 工程中添加仓颉模块](./add_cangjie_module.md)。

2. 仓颉侧互操作接口的实现：

    - 实现互操作接口 addNumber：

        ```cangjie
        // entry/src/main/cangjie/index.cj

        // 定义包名，该包名需要和 cjpm.toml 的 package name 保持一致
        package ohos_app_cangjie_entry

        // 导入互操作库
        import ohos.ark_interop.*

        // 定义互操作函数，该函数参数类型必须为(JSContext,JSCallInfo)，返回值类型必须为JSValue
        func addNumber(context: JSContext, callInfo: JSCallInfo): JSValue {
            // 从JSCallInfo获取参数列表
            let arg0: JSValue = callInfo[0]
            let arg1: JSValue = callInfo[1]

            // 把JSValue转换为仓颉类型
            let a: Float64 = arg0.toNumber()
            let b: Float64 = arg1.toNumber()

            // 实际仓颉函数行为
            let value = a + b

            // 把结果转换为JSValue
            let result: JSValue = context.number(value).toJSValue()

            // 返回 JSValue
            return result
        }
        // 必须注册该函数到JSModule中
        let EXPORT_MODULE = JSModule.registerModule {
            runtime, exports =>
                exports["addNumber"] = runtime.function(addNumber).toJSValue()
        }
        ```

    - 在 types->libohos_app_cangjie_entry 文件夹下的 Index.d.ts 文件中，提供 ArkTS 侧接口声明：

        ```typescript
        // entry/src/main/cangjie/types/libohos_app_cangjie_entry/Index.d.ts
        export declare function addNumber(a: number, b: number): number;
        ```

    - 在 types->libohos_app_cangjie_entry 文件夹下的 oh-package.json5 文件中将 Index.d.ts 与仓颉模块对应的 so 库关联起来：

        > **说明：**
        >
        > 以下代码无须复制，创建仓颉模块以后在工程中已配置好。

        ```json
        // entry/src/main/cangjie/types/libohos_app_cangjie_entry/oh-package.json5
        {
            "name": "libohos_app_cangjie_entry.so",
            "types": "./Index.d.ts",
            "version": "1.0.0",
            "description": ""
        }
        ```

3. 在 ArkTS 模块内的 oh-pacakge.json5 文件中的 dependencies 字段配置对仓颉模块对应的 so 库的依赖：

    > **说明：**
    >
    > 以下代码无须复制，创建仓颉模块以后在工程中已配置好。

    ```json
    // entry/oh-package.json5
    {
        "dependencies": {
            // ...
            "libohos_app_cangjie_entry.so": "file:./src/main/cangjie/types/libohos_app_cangjie_entry"
            // ...
        }
    }
    ```

4. ArkTS 侧使用 import 语法直接导入仓颉模块，并调用仓颉 addNumber 接口：

    ```typescript
    // 导入仓颉动态库，该动态库名称为仓颉包名的名称，该名称需要和互操作接口所在的包名一致
    import { addNumber } from "libohos_app_cangjie_entry.so";

    // 调用仓颉接口
    let result = addNumber(1, 2);
    console.log(`1 + 2 = ${result}`);
    ```

## 方式二：使用 loadNativeModule 接口加载仓颉模块

> **说明：**
>
> - 此加载方式从 API version 18 开始支持。最低兼容版本：OpenHarmony 5.1.0(18)。如果加载仓颉模块的代码需要运行在 OpenHarmony 12 Release以上版本，请使用[requireCJLib 接口加载仓颉模块](#方式三使用-requirecjlib-接口加载仓颉模块)。
> - loadNativeModule 接口详细介绍请参考：[同步方式动态加载 native 模块](https://docs.openharmony.cn/pages/v5.1/zh-cn/application-dev/arkts-utils/js-apis-load-native-module.md)

下面为使用 loadNativeModule 接口加载仓颉 ohos_app_cangjie_entry 模块并调用 addNumber 函数的示例：

1. 在 ArkTS 工程中创建仓颉模块，详情请参见[在 ArkTS 工程中添加仓颉模块](./add_cangjie_module.md)。

2. 仓颉侧互操作接口的实现：

    - 实现互操作接口 addNumber：

        ```cangjie
        // entry/src/main/cangjie/index.cj

        // 定义包名，该包名需要和 cjpm.toml 的 package name 保持一致
        package ohos_app_cangjie_entry

        // 导入互操作库
        import ohos.ark_interop.*

        // 定义互操作函数，该函数参数类型必须为(JSContext,JSCallInfo)，返回值类型必须为JSValue
        func addNumber(context: JSContext, callInfo: JSCallInfo): JSValue {
            // 从JSCallInfo获取参数列表
            let arg0: JSValue = callInfo[0]
            let arg1: JSValue = callInfo[1]

            // 把JSValue转换为仓颉类型
            let a: Float64 = arg0.toNumber()
            let b: Float64 = arg1.toNumber()

            // 实际仓颉函数行为
            let value = a + b

            // 把结果转换为JSValue
            let result: JSValue = context.number(value).toJSValue()

            // 返回 JSValue
            return result
        }
        // 必须注册该函数到JSModule中
        let EXPORT_MODULE = JSModule.registerModule {
            runtime, exports =>
                exports["addNumber"] = runtime.function(addNumber).toJSValue()
        }
        ```

    - 在 types->libohos_app_cangjie_entry 文件夹下的 Index.d.ts 文件中，提供 ArkTS 侧接口声明：

        ```typescript
        // entry/src/main/cangjie/types/libohos_app_cangjie_entry/Index.d.ts
        export declare function addNumber(a: number, b: number): number;
        ```

    - 在 types->libohos_app_cangjie_entry 文件夹下的 oh-package.json5 文件中将 Index.d.ts 与仓颉模块对应的 so 库关联起来：

        > **说明：**
        >
        > 以下代码无须复制，创建仓颉模块以后在工程中已配置好。

        ```json
        // entry/src/main/cangjie/types/libohos_app_cangjie_entry/oh-package.json5
        {
            "name": "libohos_app_cangjie_entry.so",
            "types": "./Index.d.ts",
            "version": "1.0.0",
            "description": ""
        }
        ```

3. 在 ArkTS 模块内的 oh-pacakge.json5 文件中的 dependencies 字段配置对仓颉模块对应的 so 库的依赖：

    > **说明：**
    >
    > 以下代码无须复制，创建仓颉模块以后在工程中已配置好。

    ```json
    // entry/oh-package.json5
    {
        "dependencies": {
            // ...
            "libohos_app_cangjie_entry.so": "file:./src/main/cangjie/types/libohos_app_cangjie_entry"
            // ...
        }
    }
    ```

4. ArkTS 侧使用 loadNativeModule 加载 libohos_app_cangjie_entry.so，调用仓颉 addNumber 接口：

    ```typescript
    // 使用 loadNativeModule 接口加载仓颉动态库
    let module: ESObject = loadNativeModule("libohos_app_cangjie_entry.so");

    // 调用仓颉接口
    let result = module.addNumber(1, 2);
    console.log(`1 + 2 = ${result}`);
    ```

## 方式三：使用 requireCJLib 接口加载仓颉模块

> **说明：**
>
> 此加载方式从 API version 12 开始支持。最低兼容版本：OpenHarmony 12 Release。

requireCJLib 接口的功能和 loadNativeModule 类似，是同步方式动态加载仓颉模块。requireCJLib 接口由仓颉模块加载器 ark_interop_loader 提供。

**接口说明**

```typescript
export declare function requireCJLib(moduleName: string): Object
```

**参数：**

| 参数名   | 类型   | 必填 | 说明     |
| :-------| :------| :----| :--------|
| moduleName | string | 是  | 加载的仓颉动态库名称 |

下面为使用 requireCJLib 接口加载仓颉 ohos_app_cangjie_entry 模块并调用 addNumber 函数的示例：

1. 在 ArkTS 工程中创建仓颉模块，详情请参见[在 ArkTS 工程中添加仓颉模块](./add_cangjie_module.md)。

2. 仓颉侧互操作接口的实现：

    - 实现互操作接口 addNumber：

        ```cangjie
        // entry/src/main/cangjie/index.cj

        // 定义包名，该包名需要和 cjpm.toml 的 package name 保持一致
        package ohos_app_cangjie_entry

        // 导入互操作库
        import ohos.ark_interop.*

        // 定义互操作函数，该函数参数类型必须为(JSContext,JSCallInfo)，返回值类型必须为JSValue
        func addNumber(context: JSContext, callInfo: JSCallInfo): JSValue {
            // 从JSCallInfo获取参数列表
            let arg0: JSValue = callInfo[0]
            let arg1: JSValue = callInfo[1]

            // 把JSValue转换为仓颉类型
            let a: Float64 = arg0.toNumber()
            let b: Float64 = arg1.toNumber()

            // 实际仓颉函数行为
            let value = a + b

            // 把结果转换为JSValue
            let result: JSValue = context.number(value).toJSValue()

            // 返回 JSValue
            return result
        }
        // 必须注册该函数到JSModule中
        let EXPORT_MODULE = JSModule.registerModule {
            runtime, exports =>
                exports["addNumber"] = runtime.function(addNumber).toJSValue()
        }
        ```

    - 在 cangjie 文件夹下创建 loader 文件夹

    - 在 loader 文件夹下创建 libark_interop_loader.d.ts 文件，并在文件中提供 requireCJLib 接口声明：

        ```typescript
        // entry/src/main/cangjie/loader/libark_interop_loader.d.ts
        export declare function requireCJLib(s: string): Object
        ```

    - 在 loader 文件夹下创建 oh-package.json5 文件，并在文件中将 libark_interop_loader.d.ts 与模块加载器的 so 库关联起来：

        ```json
        // entry/src/main/cangjie/loader/oh-package.json5
        {
            "name": "libark_interop_loader.so",
            "types": "./libark_interop_loader.d.ts",
            "version": "",
            "description": "Please describe the basic information."
        }
        ```

3. 在 ArkTS 模块内的 oh-pacakge.json5 文件中的 dependencies 字段配置对模块加载器的 so 库的依赖：

    ```json
    // entry/oh-package.json5
    {
        "dependencies": {
            // ...
            "libark_interop_loader.so": "file:src/main/cangjie/loader"
            // ...
        }
    }
    ```

4. ArkTS 侧使用 requireCJLib 加载 libohos_app_cangjie_entry.so，调用仓颉 addNumber 接口：

    ```typescript
    // 导入仓颉加载器模块，该动态库名称是确定的，为加载器默认库
    import {requireCJLib} from "libark_interop_loader.so";

    // 定义仓颉互操作函数接口，addNumber函数名称必须与仓颉侧映射到ArkTS侧的函数声明一致
    interface CustomLib {
        addNumber(a: number, b: number): number;
    }

    // 导入仓颉动态库，该动态库名称为仓颉包名的名称，该名称需要和互操作接口所在的包名一致
    const cjLib = requireCJLib("libohos_app_cangjie_entry.so") as CustomLib;

    // 调用仓颉接口
    let result = cjLib.addNumber(1, 2);
    console.log(`1 + 2 = ${result}`);
    ```

## 常见问题

### ArkTS 中加载仓颉模块的代码如何兼容 OpenHarmony 12 Release以上版本

**问题描述**

假设使用 DevEco Studio 5.1.x 版本的 IDE 编写应用代码，且在 ArkTS 侧使用 import 语法或使用 loadNativeModule 接口加载仓颉模块，如果希望应用可以运行在 OpenHarmony 12 Release以上版本，应该如何修改代码？

**解决方法**

1. 在 ArkTS 模块下的 cangjie 文件夹下创建 loader 文件夹，并在 loader 文件夹下创建两个文件：仓颉模块加载器的声明文件 libark_interop_loader.d.ts 和配置文件 oh-package.json5。下面以 ArkTS 模块是 entry 为例展示文件内容：

    - 在 loader 文件夹下的 libark_interop_loader.d.ts 文件中，提供 requireCJLib 接口声明：

        ```typescript
        // entry/src/main/cangjie/loader/libark_interop_loader.d.ts
        export declare function requireCJLib(s: string): Object
        ```

    - 在 loader 文件夹下的 oh-package.json5 文件中将 libark_interop_loader.d.ts 与模块加载器关联起来：

        ```json
        // entry/src/main/cangjie/loader/oh-package.json5
        {
            "name": "libark_interop_loader.so",
            "types": "./libark_interop_loader.d.ts",
            "version": "",
            "description": "Please describe the basic information."
        }
        ```

2. 在 ArkTS 模块内的 oh-pacakge.json5 文件中的 dependencies 字段配置对模块加载器的 so 库的依赖：

    ```json
    // entry/oh-package.json5
    {
        "dependencies": {
            // ...
            "libark_interop_loader.so": "file:src/main/cangjie/loader"
            // ...
        }
    }
    ```

3. 修改 ArkTS 侧加载仓颉模块代码，使用[requireCJLib 接口加载仓颉模块](#方式三使用-requirecjlib-接口加载仓颉模块)。此处以使用 import 语法加载仓颉模块为例：

    修改前：

    ```typescript
    // 导入仓颉动态库，该动态库名称为仓颉包名的名称，该名称需要和互操作接口所在的包名一致
    import { addNumber } from "libohos_app_cangjie_entry.so";

    // 调用仓颉接口
    let result = addNumber(1, 2);
    console.log(`1 + 2 = ${result}`);
    ```

    修改后：

    ```typescript
    // 导入仓颉加载器模块，该动态库名称是确定的，为加载器默认库
    import {requireCJLib} from "libark_interop_loader.so";

    // 定义仓颉互操作函数接口，addNumber函数名称必须与仓颉侧映射到ArkTS侧的函数声明一致
    interface CustomLib {
        addNumber(a: number, b: number): number;
    }

    // 导入仓颉动态库，该动态库名称为仓颉包名的名称，该名称需要和互操作接口所在的包名一致
    const cjLib = requireCJLib("libohos_app_cangjie_entry.so") as CustomLib;

    // 调用仓颉接口
    let result = cjLib.addNumber(1, 2);
    console.log(`1 + 2 = ${result}`);
    ```
