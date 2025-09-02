# Explicit Want and Implicit Want Matching Rules

When launching a target application component, matching is performed through either an explicit [Want](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-want) or an implicit [Want](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-want). The matching rules described in this chapter are: how the parameters set in the [Want](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-want) passed by the caller match the configuration file declared by the target application component.

## Explicit Want Matching Principle

The matching principle for an explicit [Want](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-want) is shown in the following table.

| Name | Type | Matching Item | Required | Rule |
| -------- | -------- | -------- | -------- | -------- |
| deviceId | String | Yes | No | If left empty, only matches application components within the current device. |
| bundleName | String | Yes | Yes | If abilityName is specified without bundleName, the match fails. |
| moduleName | String | Yes | No | If left empty and there are multiple modules within the same application with duplicate-named components, the first one will be matched by default. |
| abilityName | String | Yes | Yes | This field must be set to indicate explicit matching. |
| uri | String | No | No | The system ignores this parameter during matching, but it can still be passed to the target application component. |
| type | String | No | No | The system ignores this parameter during matching, but it can still be passed to the target application component. |
| action | String | No | No | The system ignores this parameter during matching, but it can still be passed to the target application component. |
| entities | Array&lt;String&gt; | No | No | The system ignores this parameter during matching, but it can still be passed to the target application component. |
| flags | UInt32 | No | No | Does not participate in matching; directly passed to the system for processing, typically used to set runtime information such as URI data authorization. |
| parameters | String | No | No | Does not participate in matching; custom application data will be directly passed to the target application component. |

## Implicit Want Matching Principle

The matching principle for an implicit [Want](../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability.md#class-want) is shown in the following table.

| Name        | Type                           | Matching Item | Required | Rule                                                         |
| ----------- | ------------------------------ | ------ | ---- | ------------------------------------------------------------ |
| deviceId    | String                         | Yes     | No   | Cross-device implicit invocation is currently not supported. |
| abilityName | String                         | No     | No   | This field must be left empty to indicate implicit matching. |
| bundleName  | String                         | Yes     | No   | Matches the target application component within the corresponding application package. |
| moduleName  | String                         | Yes     | No   | Matches the target application component within the corresponding Module. |
| uri         | String                         | Yes     | No   | Refer to [uri and type matching rules for want parameters](#uri-and-type-matching-rules-for-want-parameters). |
| type        | String                         | Yes     | No   | Refer to [uri and type matching rules for want parameters](#uri-and-type-matching-rules-for-want-parameters). |
| action      | String                         | Yes     | No   | Refer to [action matching rules for want parameters](#action-matching-rules-for-want-parameters). |
| entities    | Array&lt;String&gt;            | Yes     | No   | Refer to [entities matching rules for want parameters](#entities-matching-rules-for-want-parameters). |
| flags       | UInt32                         | No     | No   | Does not participate in matching; directly passed to the system for processing, typically used to set runtime information such as URI data authorization. |
| parameters  | String | Yes     | No   | Custom application data will be directly passed to the target application component. Currently, matching using the key `linkFeature` in parameters is supported. When the `linkFeature` field is not empty, `linkFeature` matching takes precedence. |

From the definition of an implicit Want, it can be inferred:

- The want parameter passed by the caller indicates the operation the caller needs to perform, along with relevant data and other application type restrictions.
- The skills configuration of the target application component declares its capabilities (parameters under the [skills tag](../cj-start/basic-knowledge/module-configuration-file.md#skills-tag) in the [module.json5 configuration file](../cj-start/basic-knowledge/module-configuration-file.md)).

The system matches the want parameters passed by the caller (including action, entities, uri, type, and parameters attributes) with the skills configuration of the installed target application component (including actions, entities, uris, and type attributes). If none of the five attributes in the want parameters are configured, implicit matching fails.

- When the `linkFeature` field in parameters is not empty, the system will prioritize `linkFeature` matching.
    - If `linkFeature` matching succeeds and uri or type is configured in the want, the system will continue to match the uri and type attributes. If both match successfully, implicit matching succeeds; otherwise, matching fails. If uri and type are not configured in the want, implicit matching succeeds.
    - If `linkFeature` matching fails, no further attribute matching is performed, and matching fails.
- When the `linkFeature` in parameters is not configured or is empty, only when the action, entities, uri, and type attributes all match successfully will the application be displayed to the user for selection in the application selector.

### Action Matching Rules for Want Parameters

The action in the want parameters passed by the caller is matched with the actions in the skills configuration of the target application component.

- If the action in the want parameters is empty and the actions in the skills configuration of the target Ability are empty, action matching fails.
- If the action in the want parameters is not empty and the actions in the skills configuration of the target application component are empty, action matching fails.
- If the action in the want parameters is empty and the actions in the skills configuration of the target application component are not empty, action matching succeeds.
- If the action in the want parameters is not empty and the actions in the skills configuration of the target application component are not empty and include the action in the want parameters, action matching succeeds.
- If the action in the want parameters is not empty and the actions in the skills configuration of the target application component are not empty but do not include the action in the want parameters, action matching fails.

    **Figure 1** Action Matching Rules for Want Parameters

    ![want-action](figures/want-action.png)

### Entities Matching Rules for Want Parameters

The entities in the want parameters passed by the caller are matched with the entities in the skills configuration of the target application component.

- If the entities in the want parameters are empty and the entities in the skills configuration of the target application component are not empty, entities matching succeeds.
- If the entities in the want parameters are empty and the entities in the skills configuration of the target application component are empty, entities matching succeeds.
- If the entities in the want parameters are not empty and the entities in the skills configuration of the target application component are empty, entities matching fails.
- If the entities in the want parameters are not empty and the entities in the skills configuration of the target application component are not empty and include the entities in the want parameters, entities matching succeeds.
- If the entities in the want parameters are not empty and the entities in the skills configuration of the target application component are not empty but do not fully include the entities in the want parameters, entities matching fails.

  **Figure 2** Entities Matching Rules for Want Parameters

  ![want-entities](figures/want-entities.png)

### URI and Type Matching Rules for Want Parameters

When the caller sets the uri and type parameters in the want to initiate a request to launch an application component, the system traverses the list of installed components and matches each against the uris array in the skills configuration of the target application component. If any uri in the uris array of the target application component matches the uri and type set in the want parameters, the match is successful.

In practice, uri and type can coexist in four scenarios. The specific matching rules for these scenarios are as follows:

- Both uri and type in the want parameters are empty.
    - If the uris array in the skills configuration of the target application component is empty, matching succeeds.
    - If the uris array in the skills configuration contains an element where both scheme and type are empty, matching succeeds.
    - In all other cases, matching fails.
- The uri in the want parameters is not empty, but the type is empty.
    - If the uris array in the skills configuration is empty, matching fails.
    - If the uris array contains data where [uri matching](#uri-matching-rules) succeeds and type is empty, matching succeeds; otherwise, matching fails.
    - If the first two conditions fail and the uri is a file path uri, the file's MIME type is obtained based on the file extension. If this type matches the type configured in the skills file, matching succeeds.
- The uri in the want parameters is empty, but the type is not empty.
    - If the uris array in the skills configuration is empty, matching fails.
    - If the uris array contains data where the uri's scheme is empty and [type matching](#type-matching-rules) succeeds, matching succeeds; otherwise, matching fails.
- Both uri and type in the want parameters are not empty, as shown below.
    - If the uris array in the skills configuration is empty, matching fails.
    - If the uris array contains data where both [uri matching](#uri-matching-rules) and [type matching](#type-matching-rules) succeed, matching succeeds; otherwise, matching fails.

Leftmost URI matching: When the uris array in the skills configuration of the target application component only configures scheme; or only scheme and host; or only scheme, host, and port. The leftmost part of the uri in the want parameters must sequentially match the scheme, or scheme and host, or scheme, host, and port to satisfy leftmost URI matching.

**Figure 3** Matching Rules When Both uri and type Are Not Empty in Want Parameters

![want-uri-type1](figures/want-uri-type1.png)

For simplified description:

- The uri parameter in the want parameters passed by the caller is referred to as w_uri; the uris in the skills configuration of the target application component are referred to as s_uris, with each element being s_uri.
- The type parameter in the want parameters is referred to as w_type, and the type data in the uris array of the skills configuration is referred to as s_type.

**Figure 4** Specific Matching Rules for uri and type in Want Parameters

![want-uri-type2](figures/want-uri-type2.png)

### URI Matching Rules

The specific matching rules are as follows:

- If the scheme in s_uri is empty, matching succeeds when w_uri is empty; otherwise, matching fails.
- If the host in s_uri is empty, matching succeeds when w_uri and the scheme in s_uri are the same; otherwise, matching fails.
- If the port in s_uri is empty, matching succeeds when w_uri and the scheme and host in s_uri are the same; otherwise, matching fails.
- If path, pathStartWith, and pathRegex in s_uri are all empty, matching succeeds when w_uri and the scheme, host, and port in s_uri are the same; otherwise, matching fails.
- If path in s_uri is not empty, matching succeeds when w_uri and s_uri match the **full path expression**; otherwise, pathStartWith matching is performed.
- If pathStartWith in s_uri is not empty, matching succeeds when w_uri includes the **prefix expression** in s_uri; otherwise, pathRegex matching is performed.
- If pathRegex in s_uri is not empty, matching succeeds when w_uri satisfies the **regular expression** in s_uri; otherwise, matching fails.

> **Note:**
>
> The scheme, host, port, path, pathStartWith, and pathRegex attributes in the uris of the skills configuration of the target application component are concatenated. If path, pathStartWith, and pathRegex attributes are declared sequentially, uris will be concatenated into the following four expressions:
>
> - **Prefix URI expression**: When only scheme, or only scheme and host, or only scheme, host, and port are configured in the configuration file, the parameter passes a Uri prefixed with the configuration file.
>     - `scheme://`
>     - `scheme://host`
>     - `scheme://host:port`
> - **Full path expression**: `scheme://host:port/path`
> - **Prefix expression**: `scheme://host:port/pathStartWith`
> - **Regular expression**: `scheme://host:port/pathRegex`
>
> The scheme of system-reserved URIs starts with `ohos`, such as `ohosclock://`. Third-party application components cannot configure URIs that duplicate system applications, as this will prevent the third-party application component from being launched via that URI.

**Figure 5** URI Matching Rule Examples for Want Parameters

![want-uri-case](figures/want-uri-case.png)

### Type Matching Rules

> **Note:**
>
> The applicability of the type matching rules described in this section is based on the type in the want parameters not being empty. When the type in the want parameters is empty, refer to [uri and type matching rules for want parameters](#uri-and-type-matching-rules-for-want-parameters).

The specific matching rules are as follows:

- If s_type is empty, matching fails.
- If s_type or w_type is the wildcard `*/*`, matching succeeds.
- If the last character of s_type is the wildcard `*`, such as `prefixType/*`, matching succeeds when w_type includes `prefixType/`; otherwise, matching fails.
- If the last character of w_type is the wildcard `*`, such as `prefixType/*`, matching succeeds when s_type includes `prefixType/`; otherwise, matching fails.

### linkFeature Matching Rules

> **Note:**
>
> The linkFeature matching rules described in this section apply when the parameters in the want include the linkFeature key and its corresponding value is not empty.

The parameters in the want passed by the caller are matched with the uris in the skills configuration of the target application component. For simplified description, the linkFeature parameter in the want parameters is referred to as w_linkFeature. The specific matching rules are as follows:

- If both uri and type in the want parameters are empty, only linkFeature is matched. Matching succeeds when w_linkFeature and the linkFeature in s_uri are the same; otherwise, matching fails.
- If either uri or type in the want parameters is not empty, linkFeature, uri, and type are matched sequentially (refer to [uri and type matching rules for want parameters](#uri-and-type-matching-rules-for-want-parameters)). Matching succeeds when all three fields match successfully; otherwise, matching fails.

**Figure 6** Specific linkFeature Matching Rules for Want Parameters

![want-linkFeature](figures/linkFeature.png)
![want-linkFeature-case](figures/want-linkFeature-case.png)