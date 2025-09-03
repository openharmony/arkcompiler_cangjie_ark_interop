# Common Actions and Entities (Not Recommended)

## action

Represents common operations that the caller intends to perform (e.g., view, share, application details). In an implicit [Want](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-want), this field can be defined in conjunction with a URI or parameters to specify the operation to be performed on the data, such as opening or viewing the data at the URI. For example, when the URI is a web address and the action is `ACTION_VIEW_DATA`, it indicates matching application components capable of accessing that web address. Declaring the action field in a Want signifies that the caller expects the target application to support the declared operation. In the [skills field](../cj-start/basic-knowledge/module-configuration-file.md#skills标签) of the target application's configuration file, declaring actions indicates that the application supports the specified operations. Common actions are listed below.

**Common actions:**

- ACTION_HOME: The action to launch the entry component of an application, which must be used in conjunction with ENTITY_HOME. The system launcher's application icon is an explicit entry component, and clicking it triggers the action to launch the entry component. Multiple entry components can be configured.
- ACTION_CHOOSE: Selects local resource data, such as contacts or photo albums. The system typically provides corresponding Picker applications for different types of data, such as Contacts and Gallery.
- ACTION_VIEW_DATA: Views data. When used with a web address URI, it displays the content corresponding to that address. For specific operation procedures, refer to [Launching File Processing Applications via startAbility](./cj-file-processing-apps-startup.md).
- ACTION_VIEW_MULTIPLE_DATA: Performs an operation to send multiple data records.

## entities

Represents category information of the target application component (e.g., browser, video player). In an implicit [Want](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-want), it serves as a supplement to the action. In an implicit Want, developers can define this field to filter and match application categories, such as requiring the target to be a browser. Declaring the entities field in a Want indicates that the caller expects the target application to belong to the declared category. In the [skills field](../cj-start/basic-knowledge/module-configuration-file.md#skills标签) of the target application's configuration file, declaring entities indicates the categories supported by the application. Common entities are listed below.

**Common entities:**

- ENTITY_DEFAULT: A default category with no practical significance.
- ENTITY_HOME: The category for applications with an icon-click entry on the home screen.
- ENTITY_BROWSABLE: Indicates the browser category.