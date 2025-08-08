# module.json5 Configuration File

## metadata Tag

This tag identifies the custom metadata of a HAP (Harmony Ability Package). The tag value is of array type and contains three sub-tags: name, value, and resource.

**Table 1** metadata Tag Description

| Attribute Name | Description | Data Type | Optional |
| :-------- | :-------- | :-------- | :-------- |
| name | Identifies the name of the data item. The value is a string with a maximum length of 255 bytes. | String | This tag is optional. The default value is empty. |
| value | Identifies the value of the data item. The value is a string with a maximum length of 255 bytes. | String | This tag is optional. The default value is empty. |
| resource | Identifies the user-defined data format. The value is a string with a maximum length of 255 bytes, representing the resource index for this data. | String | This tag is optional. The default value is empty. |

The resource attribute value specifies the file location using the format "$profile:filename", where "$profile" indicates the resource path is under the /resources/base/profile directory in the project. For example, "$profile:shortcuts_config" specifies the /resources/base/profile/shortcuts_config.json file.

```json
{
  "module": {
    "metadata": [{
      "name": "module_metadata",
      "value": "a test demo for module metadata",
      "resource": "$profile:shortcuts_config"
    }],

    "abilities": [{
      "metadata": [{
        "name": "ability_metadata",
        "value": "a test demo for ability",
        "resource": "$profile:config_file"
      },
      {
        "name": "ability_metadata_2",
        "value": "a string test",
        "resource": "$profile:config_file"
      }],
    }],

    "extensionAbilities": [{
      "metadata": [{
        "name": "extensionAbility_metadata",
        "value": "a test for extensionAbility",
        "resource": "$profile:config_file"
      },
      {
        "name": "extensionAbility_metadata_2",
        "value": "a string test",
        "resource": "$profile:config_file"
      }],
    }]
  }
}
```