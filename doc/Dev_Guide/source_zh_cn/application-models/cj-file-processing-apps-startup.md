# 拉起文件处理类应用（startAbility）

## 使用场景

例如，浏览器下应用下载PDF文件，可以调用此接口选择文件处理应用打开此PDF文件。开发者需要在请求中设置待打开文件的URI路径（[uri](#接口关键参数说明)）、文件格式（[type](#接口关键参数说明)）等字段，以便系统能够识别，直接拉起文件打开应用或弹出一个选择框，让用户选择合适的应用来打开文件，效果示意如下图所示。

图1 效果示意图

![file-open](figures/file-open.jpeg)

## 接口关键参数说明

## 接入步骤

### 调用方接入步骤

1. 导入相关模块。

    <!-- compile -->

    ```cangjie

    import kit.AbilityKit.{UIAbility, Want, LaunchParam, Flags}
    import kit.ArkUI.WindowStage
    import kit.CoreFileKit.FileUri
    import ohos.business_exception.BusinessException
    ```

2. 获取应用文件路径。

    <!-- compile -->

    ```cangjie

    // 假设应用bundleName值为com.example.demo
    class MainAbility <: UIAbility {
        public override func onWindowStageCreate(windowStage: WindowStage): Unit {
            // 获取文件沙箱路径
            let filePath = this
            .context
            .filesDirectory + '/test1.txt'
            // 将沙箱路径转换为uri
            let uri = FileUri.getUriFromPath(filePath)
            // 获取的uri为"file://com.example.demo/data/storage/el2/base/files/test.txt"
        }
        // ...
    }
    ```

3. 构造请求数据。

    <!-- compile -->

    ```cangjie

    // 假设应用bundleName值为com.example.demo
    class MainAbility <: UIAbility {
        public override func onWindowStageCreate(windowStage: WindowStage): Unit {
            // 获取文件沙箱路径
            let filePath = this
            .context
            .filesDirectory + '/test1.txt'
            // 将沙箱路径转换为uri
            let uri = FileUri.getUriFromPath(filePath)
            // 构造请求数据
            let want = Want(
                action: "ohos.want.action.viewData", // 表示查看数据的操作，文件打开场景固定为此值
                uri: uri,
                `type`: 'general.plain-text', // 表示待打开文件的类型
                // 配置被分享文件的读写权限，例如对文件打开应用进行读写授权
                flags: Flags.FLAG_AUTH_WRITE_URI_PERMISSION.getValue() | Flags.FLAG_AUTH_READ_URI_PERMISSION.getValue()
            )
        }
        // ...
    }
    ```

4. 调用接口启动。

    <!-- compile -->

    ```cangjie

    class MainAbility <: UIAbility {
        public override func onWindowStageCreate(windowStage: WindowStage): Unit {
            AppLog.info("MainAbility onWindowStageCreate.")
            // 获取文件沙箱路径
            let filePath = this
                .context
                .filesDirectory + '/test1.txt'
            // 将沙箱路径转换为uri
            let uri = FileUri.getUriFromPath(filePath)
            // 获取的uri为"file://com.example.demo/data/storage/el2/base/files/test1.txt"
            // 构造请求数据
            let want = Want(
                action: "ohos.want.action.viewData", // 表示查看数据的操作，文件打开场景固定为此值
                uri: uri,
                `type`: 'general.plain-text', // 表示待打开文件的类型
                // 配置被分享文件的读写权限，例如对文件打开应用进行读写授权
                flags: Flags.FLAG_AUTH_WRITE_URI_PERMISSION.getValue() | Flags.FLAG_AUTH_READ_URI_PERMISSION.getValue()
            )
            try {
                this
                    .context
                    .startAbility(want)
            } catch (e: BusinessException) {
                AppLog.error("Failed to invoke startAbility, code: ${e.code}, message: ${e.message}")
            }
        }
    }
    ```

### 目标方接入步骤

1. 声明文件打开能力。

    支持打开文件的应用需要在[module.json5](../cj-start/basic-knowledge/module-configuration-file.md)配置文件中声明文件打开能力。其中uris字段表示接收URI的类型，其中scheme固定为file。type字段表示支持打开的文件类型（参见[MIME type类型](https://www.iana.org/assignments/media-types/media-types.xhtml?utm_source=ld246.com)），如下举例中类型为txt文件。

    ```json
    {
    "module": {
        // ...
        "abilities": [
        {
            // ...
            "skills": [
            {
                "actions": [
                "ohos.want.action.viewData" // 必填，声明数据处理能力
                ],
                "uris": [
                {
                    // 允许打开uri中以file://协议开头标识的本地文件
                    "scheme": "file", // 必填，声明协议类型为文件
                    "type": "general.plain-text", // 必填，表示支持打开的文件类型
                    "linkFeature": "FileOpen" // 必填且大小写敏感，表示此URI的功能为文件打开
                }
                // ...
                ]
                // ...
            }
            ]
        }
        ]
    }
    }
    ```

2. 应用处理待打开文件。

    <!-- compile -->

    ```cangjie

    import kit.AbilityKit.{UIAbility, Want, LaunchParam}
    import kit.ArkUI.{WindowStage}
    import kit.CoreFileKit.{FileFs, OpenMode}
    import kit.ArkUI.BusinessException

    class MainAbility <: UIAbility {
        public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
            // 从want信息中获取uri字段
            let uri = want.uri
            if (uri == "") {
                AppLog.error('uri is invalid')
                return
            }
            try {
                // 根据待打开文件的URI进行相应操作。例如同步读写的方式打开URI获取file对象
                let file = FileFs.open(uri, mode: OpenMode
                    .READ_WRITE
                    .mode)
                AppLog.info("Succeed to open file.")
            } catch (e: BusinessException) {
                AppLog.error("Failed to open file openSync, code: ${e.code}, message: ${e.message}")
            }
        }
    }
    ```
