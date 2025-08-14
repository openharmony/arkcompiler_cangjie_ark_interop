# 仓颉应用中使用 ArkTS 模块

ArkTS 模块主要分为 NAPI（Node.js API）模块以及普通 ArkTS 模块，仓颉仅支持对 NAPI 模块的调用。

在介绍具体的加载前，首先介绍仓颉的导入名称及 ArkTS 模块名称的映射规范，如下：

| ArkTS 模块名                 | 仓颉导入名称                             | 说明                                                         |
| :--------------------------- | :--------------------------------------- | :----------------------------------------------------------- |
| @ohos.file.photoAccessHelper | ("file.photoAccessHelper")               | ArkTS 模块名以 @ohos 开头，则仓颉导入名称只需要去掉前缀 "@ohos."。 |
| @hms.core.push.pushService   | ("core.push.pushService", prefix: "hms") | ArkTS 模块名以 @xxx （xxx 不为 ohos） 开头，则有两个导入名称，第一个名称为模块名去掉 "@xxx." 的剩余部分，第二个参数为 `prefix: "xxx"`。该例的仓颉导入名称为 `"core.push.pushService", prefix: "hms"`。 |

仓颉应用使用 ArkTS 模块的工程配置与一般的仓颉工程没有区别，可参考[创建一个新的工程](https://docs.openharmony.cn/pages/v5.1/zh-cn/application-dev/quick-start/start-with-ets-stage.md)，仅额外需要在代码中加载 NAPI 模块。以加载 OpenHarmony [相册管理](https://docs.openharmony.cn/pages/v5.1/zh-cn/application-dev/reference/apis-media-library-kit/js-apis-photoAccessHelper.md)模块为例：查看 ArkTS 文档后，其模块名为"@ohos.file.photoAccessHelper"。使用该模块代码示例及解析如下：

```cangjie
// 导入互操作库
import ohos.ark_interop.*
func tryLoadArkTSSo() {
    // 创建新的 ArkTS 运行时
    let runtime = JSRuntime()
    // 获取互操作上下文
    let context = runtime.mainContext
    // 根据 ArkTS 模块名导入对应的模块，模块导入进来是一个 JSValue
    let module = context.requireSystemNativeModule("file.photoAccessHelper")
    // 按照操作 JSValue 的方法使用该 module
    let obj = module.asObject(context)
    // 通过 callMethod 来调用 photoAccessHelper 的方法
    // obj.callMethod(...)
}
```

操作 ArkTS 数据的方法请参考[仓颉使用 ArkTS 数据](./operating_ArkTS_data.md)。
