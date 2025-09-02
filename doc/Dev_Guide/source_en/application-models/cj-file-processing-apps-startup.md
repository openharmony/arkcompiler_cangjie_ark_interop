# Launching File Handling Applications (startAbility)

## Usage Scenario

Developers can invoke the [startAbility](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#func-startabilitywant) interface to allow the system to search for and launch an appropriate application from installed apps to open a specific file.

For example, when a browser downloads a PDF file, this interface can be called to select a file-handling application to open the PDF. Developers need to set fields such as the URI path of the file to be opened ([uri](#Key Parameter Descriptions)) and the file format ([type](#Key Parameter Descriptions)) in the request, enabling the system to identify and either directly launch the file-opening application or display a selection dialog for the user to choose an appropriate application. The effect is illustrated in the figure below.

Figure 1: Illustration of the Effect

![file-open](figures/file-open.jpeg)

## Key Parameter Descriptions

Developers can use the [startAbility](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#func-startabilitywant) interface to open files with installed vertical-domain applications.

**Table 1** Description of [Want](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-want) Parameters in startAbility Requests

| Parameter Name | Type   | Required | Description                                                                                                                                                                                   |
|----------------|--------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| uri            | String | Yes      | The URI path of the file to be opened, typically used in conjunction with `type`.<br/>URI format: `file://bundleName/path`<br/>- `file`: Identifier for file URIs.<br/>- `bundleName`: Owner of the file resource.<br/>- `path`: Path of the file resource within the application sandbox. |
| type           | String | No       | The type of file to be opened. Currently compatible with [MIME type](https://www.iana.org/assignments/media-types/media-types.xhtml?utm_source=ld246.com), e.g., `text/xml`, `image/*`, etc.<br/>**Note:** <br/>1. `type` is optional. If not provided, the system attempts to infer the file type from the URI suffix. If provided, ensure it matches the file type in the URI; otherwise, the system may fail to find a suitable application.<br/>2. `*/*` is not supported. |
| parameters     | String | No       | Custom parameters defined by the system and assigned by developers as needed. For file-opening scenarios, see Table 2.                                                                       |
| flags          | UInt32 | No       | Processing method. For file-opening scenarios, see Table 3.                                                                                                                                  |

**Table 2** Description of [parameters](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#enum-params)  

| Parameter Name                              | Type    | Description                                                                                                                                                                |
|---------------------------------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ability.params.stream                       | String  | Indicates that the file URI should be authorized to the target party, used when the file to be opened has dependencies on other files (e.g., local HTML files relying on local resource files). The value must be a string array of file URIs. File URI format follows the `uri` parameter in Table 1. |
| ohos.ability.params.showDefaultPicker       | Bool    | Whether to force-display a selection dialog for file-opening methods. Default is `false`.<br/>- `false`: The system decides whether to directly launch the file-opening app or display a dialog based on policies or default app settings.<br/>- `true`: Always display the dialog.                      |
| showCaller                                  | Bool    | Whether the caller itself should participate in the matching process as a target application. Default is `false`.<br/>- `false`: Does not participate.<br/>- `true`: Participates.                                                      |

**Table 3** Description of [flags](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#enum-flags)  

| Parameter Name                       | Value       | Description                       |
|--------------------------------------|-------------|-----------------------------------|
| FLAG_AUTH_READ_URI_PERMISSION        | 0x00000001  | Grants read permission for the URI. |
| FLAG_AUTH_WRITE_URI_PERMISSION       | 0x00000002  | Grants write permission for the URI. |

## Integration Steps

### Caller Integration Steps

1. Import relevant modules.
    
    <!-- compile -->

    ```cangjie
    // xxx.cj
    import kit.AbilityKit.{UIAbility, Want, LaunchParam, Flags}
    import kit.ArkUI.WindowStage
    import kit.CoreFileKit.FileUri
    import ohos.business_exception.BusinessException
    ```

2. Obtain the application file path.
    
    <!-- compile -->

    ```cangjie
    // xxx.ets
    // Assume the application bundleName is com.example.demo
    class MainAbility <: UIAbility {
        public override func onWindowStageCreate(windowStage: WindowStage): Unit {
            // Get the file sandbox path
            let filePath = this
            .context
            .filesDirectory + '/test1.txt'
            // Convert the sandbox path to a URI
            let uri = FileUri.getUriFromPath(filePath)
            // The obtained URI is "file://com.example.demo/data/storage/el2/base/files/test.txt"
        }
        // ...
    }
    ```

3. Construct the request data.
    
    <!-- compile -->

    ```cangjie
    // xxx.ets
    // Assume the application bundleName is com.example.demo
    class MainAbility <: UIAbility {
        public override func onWindowStageCreate(windowStage: WindowStage): Unit {
            // Get the file sandbox path
            let filePath = this
            .context
            .filesDirectory + '/test1.txt'
            // Convert the sandbox path to a URI
            let uri = FileUri.getUriFromPath(filePath)
            // Construct the request data
            let want = Want(
                action: "ohos.want.action.viewData", // Fixed value for file-opening scenarios
                uri: uri,
                `type`: 'general.plain-text', // File type to be opened
                // Configure read/write permissions for the shared file
                flags: Flags.FLAG_AUTH_WRITE_URI_PERMISSION.getValue() | Flags.FLAG_AUTH_READ_URI_PERMISSION.getValue()
            )
        }
        // ...
    }
    ```

4. Invoke the interface to launch.
    
    <!-- compile -->

    ```cangjie
    // xxx.cj
    class MainAbility <: UIAbility {
        public override func onWindowStageCreate(windowStage: WindowStage): Unit {
            AppLog.info("MainAbility onWindowStageCreate.")
            // Get the file sandbox path
            let filePath = this
                .context
                .filesDirectory + '/test1.txt'
            // Convert the sandbox path to a URI
            let uri = FileUri.getUriFromPath(filePath)
            // The obtained URI is "file://com.example.demo/data/storage/el2/base/files/test1.txt"
            // Construct the request data
            let want = Want(
                action: "ohos.want.action.viewData", // Fixed value for file-opening scenarios
                uri: uri,
                `type`: 'general.plain-text', // File type to be opened
                // Configure read/write permissions for the shared file
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

### Target Application Integration Steps

1. Declare file-opening capability.

    Applications supporting file opening must declare this capability in the [module.json5](../cj-start/basic-knowledge/module-configuration-file.md) configuration file. The `uris` field specifies the supported URI types, where `scheme` must be `file`. The `type` field indicates the supported file types (see [MIME type](https://www.iana.org/assignments/media-types/media-types.xhtml?utm_source=ld246.com)). In the example below, the type is `txt` files.

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
                "ohos.want.action.viewData" // Required, declares data-handling capability
                ],
                "uris": [
                {
                    // Allows opening local files with URIs starting with file://
                    "scheme": "file", // Required, declares the protocol type as file
                    "type": "general.plain-text", // Required, declares the supported file type
                    "linkFeature": "FileOpen" // Required and case-sensitive, indicates the URI's function is file opening
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

2. Handle the file to be opened.

    After being launched, the application retrieves the [Want](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-want) parameter, extracts the file URI, and performs operations such as reading or writing the file.

    <!-- compile -->

    ```cangjie
    // xxx.cj
    import kit.AbilityKit.{UIAbility, Want, LaunchParam}
    import kit.ArkUI.{WindowStage}
    import kit.CoreFileKit.{FileFs, OpenMode}
    import kit.ArkUI.BusinessException

    class MainAbility <: UIAbility {
        public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
            // Extract the URI from the Want parameter
            let uri = want.uri
            if (uri == "") {
                AppLog.error('uri is invalid')
                return
            }
            try {
                // Perform operations based on the file URI. For example, open the file synchronously for reading/writing
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