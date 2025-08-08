# Launching File Handling Applications (startAbility)

## Usage Scenarios

Developers can invoke the [startAbility](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#func-startabilitywant) interface to allow the system to search for suitable applications from installed apps to open specific files.

For example, when a browser application downloads a PDF file, it can call this interface to select a file-handling application to open the PDF file. Developers need to set fields such as the URI path of the file to be opened ([uri](#Key Parameter Descriptions)) and the file format ([type](#Key Parameter Descriptions)) in the request, so that the system can identify and directly launch the file-opening application or display a selection dialog for the user to choose an appropriate application to open the file. The effect is illustrated in the figure below.

Figure 1 Illustration of the Effect

![file-open](figures/file-open.jpeg)

## Key Parameter Descriptions

Developers can achieve the opening of files by installed vertical-domain applications by calling the [startAbility](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#func-startabilitywant) interface.

**Table 1** Description of [Want](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#class-want) related parameters in the startAbility request

| Parameter Name | Type   | Required | Description                                                                                                                                                                                   |
|---------------|--------|----------|----------|
| uri           | String | Yes      | Represents the URI path of the file to be opened, typically used in conjunction with type.<br/>URI format: file:\/\/bundleName\/path<br/>- file: Identifier for the file URI.<br/>- bundleName: The owner of the file resource.<br/>- path: The path of the file resource within the application sandbox. |
| type          | String | No       | Represents the type of the file to be opened. Currently compatible with [MIME type](https://www.iana.org/assignments/media-types/media-types.xhtml?utm_source=ld246.com), such as 'text/xml', 'image/*', etc.<br/>**Note:** <br/>1. type is an optional field. If type is not provided, the system will attempt to determine the file type based on the URI suffix for matching. If type is provided, it must match the file type of the URI; otherwise, it may fail to find a suitable application.<br/>2. The use of \*/\* is not supported.|
| parameters    | String | No       | Represents custom parameters defined by the system and assigned by developers as needed. For file-opening scenarios, refer to Table 2.                                                                                                                       |
| flags         | UInt32 | No       | Represents the handling method. For file-opening scenarios, refer to Table 3.                                                                                                                       |

**Table 2** Description of [parameters](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#enum-params) related parameters

| Parameter Name                              | Type    | Description                                                                                                                                                                |
|---------------------------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ability.params.stream                       | String  | Indicates that the file URI carried should be authorized to the target party, used for scenarios where the file to be opened depends on other files. For example, opening a local HTML file that depends on other local resource files. The corresponding value must be a string array of file URIs. The file URI can be obtained by referring to the uri parameter in Table 1. |
| ohos.ability.params.showDefaultPicker       | Bool    | Indicates whether to forcibly display the selection dialog for file-opening methods. The default is false.<br/>- false: The system policy or default application settings determine whether to directly launch the file-opening application or display the dialog.<br/>- true: Always display the dialog.                                                                            |
| showCaller                                  | Bool    | Indicates whether the caller itself should participate in the matching as one of the target applications. The default is false.<br/>- false: Does not participate in matching.<br/>- true: Participates in matching.                                                                            |

**Table 3** Description of [flags](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#enum-flags) related parameters

| Parameter Name                       | Value         | Description                       |
|--------------------------------------|---------------|------------------------------------|
| FLAG_AUTH_READ_URI_PERMISSION        | 0x00000001    | Grants read permission for the URI. |
| FLAG_AUTH_WRITE_URI_PERMISSION       | 0x00000002    | Grants write permission for the URI. |

## Integration Steps

### Caller Integration Steps

1. Import relevant modules.

    <!-- compile -->

    ```cangjie
    // xxx.cj
    import kit.AbilityKit.{UIAbility, Want, LaunchParam, Flags}
    import kit.ArkUI.{WindowStage}
    import kit.CoreFileKit.{FileUri}
    import kit.UIKit.BusinessException
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
                action: "ohos.want.action.viewData", // Represents the action to view data, fixed to this value for file-opening scenarios
                uri: uri,
                `type`: 'general.plain-text', // Represents the type of the file to be opened
                // Configure read and write permissions for the shared file, e.g., granting read and write permissions to the file-opening application
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
                action: "ohos.want.action.viewData", // Represents the action to view data, fixed to this value for file-opening scenarios
                uri: uri,
                `type`: 'general.plain-text', // Represents the type of the file to be opened
                // Configure read and write permissions for the shared file, e.g., granting read and write permissions to the file-opening application
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

### Target Integration Steps

1. Declare file-opening capability.

    Applications that support opening files need to declare the file-opening capability in the [module.json5](../cj-start/basic-knowledge/module-configuration-file.md) configuration file. The uris field indicates the type of URI to be received, where the scheme is fixed as file. The type field indicates the supported file types (refer to [MIME type](https://www.iana.org/assignments/media-types/media-types.xhtml?utm_source=ld246.com)). In the example below, the type is a txt file.

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
                    // Allows opening local files identified by the file:// protocol in the URI
                    "scheme": "file", // Required, declares the protocol type as file
                    "type": "general.plain-text", // Required, indicates the supported file type
                    "linkFeature": "FileOpen" // Required and case-sensitive, indicates that the URI's functionality is file opening
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

    Applications that have declared file-opening capability will, upon being launched, retrieve the passed [Want](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md#class-want) parameter information, obtain the URI of the file to be opened, and after opening the file and obtaining the corresponding file object, perform read and write operations on the file.

    <!-- compile -->

    ```cangjie
    // xxx.cj
    import kit.AbilityKit.{UIAbility, Want, LaunchParam}
    import kit.ArkUI.{WindowStage}
    import kit.CoreFileKit.{FileFs, OpenMode}
    import kit.UIKit.BusinessException

    class MainAbility <: UIAbility {
        public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
            // Get the uri field from the want information
            let uri = want.uri
            if (uri == "") {
                AppLog.error('uri is invalid')
                return
            }
            try {
                // Perform corresponding operations based on the URI of the file to be opened. For example, open the URI synchronously to obtain the file object
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