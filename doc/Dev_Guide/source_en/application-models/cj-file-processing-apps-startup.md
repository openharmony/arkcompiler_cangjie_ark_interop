# Launching File Handler Applications (startAbility)

## Usage Scenario

For instance, when a browser application downloads a PDF file, this interface can be invoked to select a file handler application to open the PDF. Developers need to specify the URI path ([uri](#Key Parameter Specifications)) and file format ([type](#Key Parameter Specifications)) in the request, enabling the system to either directly launch a file-opening application or display a selection dialog for users to choose an appropriate application. The visual effect is illustrated below.

Figure 1 Visual Demonstration

![file-open](figures/file-open.jpeg)

## Key Parameter Specifications

## Implementation Steps

### Caller Implementation Steps

1. Import relevant modules.

    <!-- compile -->

    ```cangjie

    import kit.AbilityKit.{UIAbility, Want, LaunchParam, Flags}
    import kit.ArkUI.WindowStage
    import kit.CoreFileKit.FileUri
    import ohos.business_exception.BusinessException
    ```

2. Obtain the application file path.

    <!-- compile -->

    ```cangjie

    // Assuming the application bundleName is com.example.demo
    class MainAbility <: UIAbility {
        public override func onWindowStageCreate(windowStage: WindowStage): Unit {
            // Get the file sandbox path
            let filePath = this
            .context
            .filesDirectory + '/test1.txt'
            // Convert sandbox path to URI
            let uri = FileUri.getUriFromPath(filePath)
            // The obtained URI will be "file://com.example.demo/data/storage/el2/base/files/test.txt"
        }
        // ...
    }
    ```

3. Construct request data.

    <!-- compile -->

    ```cangjie

    // Assuming the application bundleName is com.example.demo
    class MainAbility <: UIAbility {
        public override func onWindowStageCreate(windowStage: WindowStage): Unit {
            // Get the file sandbox path
            let filePath = this
            .context
            .filesDirectory + '/test1.txt'
            // Convert sandbox path to URI
            let uri = FileUri.getUriFromPath(filePath)
            // Construct request data
            let want = Want(
                action: "ohos.want.action.viewData", // Fixed value for file opening scenarios, indicating data viewing operation
                uri: uri,
                `type`: 'general.plain-text', // Specifies the file type to be opened
                // Configure read/write permissions for shared files, e.g., granting permissions to the file handler application
                flags: Flags.FLAG_AUTH_WRITE_URI_PERMISSION.getValue() | Flags.FLAG_AUTH_READ_URI_PERMISSION.getValue()
            )
        }
        // ...
    }
    ```

4. Invoke the launch interface.

    <!-- compile -->

    ```cangjie

    class MainAbility <: UIAbility {
        public override func onWindowStageCreate(windowStage: WindowStage): Unit {
            AppLog.info("MainAbility onWindowStageCreate.")
            // Get the file sandbox path
            let filePath = this
                .context
                .filesDirectory + '/test1.txt'
            // Convert sandbox path to URI
            let uri = FileUri.getUriFromPath(filePath)
            // The obtained URI will be "file://com.example.demo/data/storage/el2/base/files/test1.txt"
            // Construct request data
            let want = Want(
                action: "ohos.want.action.viewData", // Fixed value for file opening scenarios, indicating data viewing operation
                uri: uri,
                `type`: 'general.plain-text', // Specifies the file type to be opened
                // Configure read/write permissions for shared files, e.g., granting permissions to the file handler application
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

### Target Application Implementation Steps

1. Declare file handling capability.

    Applications supporting file opening must declare this capability in the [module.json5](../cj-start/basic-knowledge/module-configuration-file.md) configuration file. The `uris` field specifies supported URI types (with `scheme` fixed as `file`), while `type` indicates supported file formats (refer to [MIME type list](https://www.iana.org/assignments/media-types/media-types.xhtml?utm_source=ld246.com)). The example below demonstrates support for TXT files.

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
                "ohos.want.action.viewData" // Required: Declares data handling capability
                ],
                "uris": [
                {
                    // Allows opening local files with URI starting with file:// protocol
                    "scheme": "file", // Required: Declares file protocol type
                    "type": "general.plain-text", // Required: Specifies supported file type
                    "linkFeature": "FileOpen" // Required (case-sensitive): Indicates URI functionality for file opening
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

2. Process target files.

    <!-- compile -->

    ```cangjie

    import kit.AbilityKit.{UIAbility, Want, LaunchParam}
    import kit.ArkUI.{WindowStage}
    import kit.CoreFileKit.{FileFs, OpenMode}
    import kit.ArkUI.BusinessException

    class MainAbility <: UIAbility {
        public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
            // Extract URI from want information
            let uri = want.uri
            if (uri == "") {
                AppLog.error('uri is invalid')
                return
            }
            try {
                // Perform operations based on the target file URI. Example: Open URI synchronously to obtain file object
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