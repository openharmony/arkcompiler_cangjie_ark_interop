# Implementing Data Persistence Through User Preferences

## Scenario Introduction

User Preferences provide applications with Key-Value pair data processing capabilities, supporting lightweight data persistence, modification, and querying. When users need a globally unique storage location, User Preferences can be utilized. Preferences cache this data in memory. When users read data, it can be quickly retrieved from memory. For persistence, the `flush` interface can be used to write memory data to a persistent file. As the volume of stored data increases, the memory usage of the application will also grow. Therefore, Preferences are not suitable for storing excessive amounts of data and do not support configuration-based encryption. Typical use cases include saving user personalization settings (e.g., font size, night mode activation).

## Operation Mechanism

As illustrated below, user programs read and write corresponding data files through the Cangjie interface. Developers can load the contents of User Preferences persistent files into a Preferences instance. Each file uniquely corresponds to one Preferences instance, which is stored in memory via a static container until actively removed from memory or the file is deleted.

**Figure 1** User Preferences Operation Mechanism

![preferences](figures/preferences.png) <!-- ToBeReviewd -->

## Constraints

- Preferences do not guarantee process concurrency safety, posing risks of file corruption and data loss. They are not suitable for multi-process scenarios.
- Keys must be of string type, non-empty, and no longer than 1024 bytes.
- If the value is of string type, UTF-8 encoding must be used. It can be empty but must not exceed 16MB in length when non-empty.
- When storing data containing non-UTF-8 strings, use the `Uint8Array` type to avoid persistent file format errors and corruption.
- After calling `removePreferencesFromCache` or `deletePreferences`, data change subscriptions will be automatically canceled. Re-subscription is required after reacquiring Preferences via `getPreferences`.
- Concurrent calls to `deletePreferences` with other interfaces across threads or processes are prohibited, as they may lead to undefined behavior.
- Memory usage increases with the volume of stored data. Thus, stored data should be lightweight, ideally not exceeding 10,000 entries to avoid significant memory overhead.

## Interface Description

Below are the key interfaces for User Preferences persistence. For more interfaces and usage details, refer to [User Preferences](../../../API_Reference/source_en/apis/ArkData/cj-apis-preferences.md).

| Interface Name                                             | Description                                         |
| --------------------------------------------------- | ----------------------------------------------|
| `getPreferences(context: StageContext, options: PreferencesOptions): Preferences` | Obtains a Preferences instance. |
| `put(key: String, value: PreferencesValueType): Unit`   | Writes data to a Preferences instance. Persistence can be achieved via `flush`. |
| `has(key: String): Bool`  | Checks if the Preferences instance contains a key-value pair with the given key. The key must not be empty. |
| `get(key: String, defValue: PreferencesValueType): PreferencesValueType`   | Retrieves the value associated with the key. Returns `defValue` if the value is null or of an incompatible type. |
| `delete(key: String): Unit`  | Deletes the key-value pair with the specified key from the Preferences instance. |
| `flush(): Unit`   | Asynchronously persists the current Preferences instance data to a User Preferences file. |
| `on(tp: String, callback: Callback1Argument\<String>): Unit` | Subscribes to data changes. The callback is triggered after `flush` when subscribed data changes. |
| `off(tp: String, callback: Callback1Argument\<String>): Unit` | Unsubscribes from data changes.  |
| `deletePreferences(context: StageContext, options: PreferencesOptions): Unit` | Removes the specified Preferences instance from memory. If a persistent file exists, it is also deleted. |

## Development Steps

1. Import modules.

    <!-- compile -->

    ```cangjie
    // xxx.cj
    import kit.ArkData.{ Preferences, PreferencesValueType }
    import kit.AbilityKit.getStageContext
    import kit.UIKit.Callback1Argument
    ```

2. Obtain a Preferences instance.

    <!-- compile -->

    ```cangjie
    // main_ability.cj
    import kit.AbilityKit.{ getStageContext, UIAbilityContext }
    import kit.ArkData.{ Preferences, PreferencesOptions }

    var globalAbilityContext: Option<UIAbilityContext> = Option<UIAbilityContext>.None
    var dataPreferences: Option<Preferences> = Option<Preferences>.None

    class MainAbility <: UIAbility {
        public init() {
            super()
            registerSelf()
        }

        public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
            AppLog.info("MainAbility OnCreated.${want.abilityName}")
            // Obtain context
            globalAbilityContext = this.context

            match (launchParam.launchReason) {
                case LaunchReason.START_ABILITY => AppLog.info("START_ABILITY")
                case _ => ()
            }
        }

        public override func onWindowStageCreate(windowStage: WindowStage): Unit {
            AppLog.info("MainAbility onWindowStageCreate.")
            windowStage.loadContent("EntryView")

            let options = PreferencesOptions("myStore")
            // Obtain Preferences instance
            dataPreferences = Preferences.getPreferences(getStageContext(this.context), options)
        }
        // ...
    }
    ```

3. Write data.

    Use `put()` to save data to the cached Preferences instance. After writing, call `flush()` to persist the data to a file if needed.

    > **Note:**
    >
    > If the key already exists, `put()` will overwrite its value. Use `has()` to check for existing key-value pairs.

    Example code:

    <!-- compile -->

    ```cangjie
    // xxx.cj
    if (dataPreferences.getOrThrow().has("startup")) {
        AppLog.info("The key 'startup' is contained.")
    } else {
        AppLog.info("The key 'startup' does not contain.")
        // Example: Write data when the key-value pair does not exist
        dataPreferences.getOrThrow().put("startup", PreferencesValueType.string("auto"))
    }
    ```

4. Read data.

    Use `get()` to retrieve the value associated with a key. Returns the default value if the value is null or of an incompatible type.

    Example code:

    <!-- compile -->

    ```cangjie
    // xxx.cj
    let val = dataPreferences.getOrThrow().get("startup", PreferencesValueType.string("default"))
    match(val) {
        case PreferencesValueType.string(n) => AppLog.info("The startup's value: ${n}")
        case _ => AppLog.info("error, value not string")
    }
    ```

5. Delete data.

    Use `delete()` to remove a key-value pair. Example code:

    <!-- compile -->

    ```cangjie
    // xxx.cj
    dataPreferences.getOrThrow().delete("startup")
    ```

6. Data persistence.

    After storing data in a Preferences instance, use `flush()` for persistence. Example code:

    <!-- compile -->

    ```cangjie
    // xxx.cj
    dataPreferences.getOrThrow().flush()
    ```

7. Subscribe to data changes.

    Define a custom `Callback` to handle data change events. The callback is triggered after `flush()` when subscribed keys change. Example code:

    <!-- compile -->

    ```cangjie
    // xxx.cj
    // Custom callback
    class Callback <: Callback1Argument<String> {
        public func invoke(arg: String): Unit {
            AppLog.info("callback： ${arg.toString()}")
        }
    }

    let preferenceCallback = Callback()
    dataPreferences.getOrThrow().on("change", preferenceCallback)
    // Data change: "auto" → "manual"
    dataPreferences.getOrThrow().put("startup", PreferencesValueType.string("manual"))
    AppLog.info("Succeeded in putting the value of 'startup'.")
    dataPreferences.getOrThrow().flush()
    ```

8. Delete a specified file.

    Use `deletePreferences()` to remove a Preferences instance from memory, including its data. If a persistent file exists, it and its backups/corrupted files will also be deleted.

    > **Note:**
    >
    > - After calling this interface, the application must not perform further operations on the deleted Preferences instance to avoid data consistency issues.
    > - Deleted data and files cannot be recovered.

    Example code:

    <!-- compile -->

    ```cangjie
    // xxx.cj
    try {
        // Delete Preferences instance
        Preferences.deletePreferences(getStageContext(globalAbilityContext.getOrThrow()), "myStore")
    } catch (e: Exception) {
        AppLog.info("delete Preferences failed")
    }
    ```