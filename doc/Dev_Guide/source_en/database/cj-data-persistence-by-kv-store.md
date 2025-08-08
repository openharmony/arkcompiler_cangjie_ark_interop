# Implementing Data Persistence with Key-Value Databases

## Scenario Introduction

Key-value databases store data in key-value pairs. When the data to be stored does not involve complex relational models—such as storing product names with corresponding prices or employee IDs with attendance status—the low complexity makes it easier to maintain compatibility across different database versions and device types. Therefore, key-value databases are recommended for persisting such data.

## Constraints and Limitations

- For device-collaborative databases, each record must have:
  - Key length ≤ 896 bytes
  - Value length < 4 MB
- For single-version databases, each record must have:
  - Key length ≤ 1 KB
  - Value length < 4 MB
- Each application can open a maximum of 16 key-value distributed databases simultaneously.
- Blocking operations (e.g., modifying UI components) are not allowed in key-value database event callback methods.

## Interface Description

The following interfaces are related to key-value database persistence functionality. Most are asynchronous interfaces, which support both callback and Promise return types. The table below uses callback forms as examples. For more interfaces and usage details, refer to [Distributed Key-Value Database](../../../API_Reference/source_en/apis/ArkData/cj-apis-distributed_kv_store.md).

| Interface Name | Description |
| -------- | -------- |
| createKVManager(config: KVManagerConfig): KVManager | Creates a KVManager instance for managing database objects. |
| getSingleKVStore(storeId: String, options: KVOptions): SingleKVStore | Creates and retrieves a single-version distributed key-value database with specified options and storeId. |
| getDeviceKVStore(storeId: String, options: KVOptions): DeviceKVStore | Creates and retrieves a multi-device collaborative database with specified options and storeId. |
| put(key: String, value: KVValueType): Unit | Adds a key-value pair of the specified type to the database. |
| get(key: String): KVValueType | Retrieves the value associated with the specified key. |
| delete(key: String): Unit | Deletes the data associated with the specified key from the database. |
| closeKVStore(appId: String, storeId: String): Unit | Closes the specified distributed key-value database using the storeId. |
| deleteKVStore(appId: String, storeId: String): Unit | Deletes the specified distributed key-value database using the storeId. |

## Development Steps

1. To use a key-value database, first obtain a KVManager instance to manage database objects. Example code:

    <!-- compile -->

    ```cangjie
    // main_ability.cj
    import kit.ArkData.{ DistributedKVStore, KVManager, KVManagerConfig }
    import kit.AbilityKit.{ UIAbilityContext, getStageContext }
    import kit.UIKit.BusinessException

    var kvManager: Option<KVManager> = Option<KVManager>.None
    var globalAbilityContext: Option<UIAbilityContext> = Option<UIAbilityContext>.None

    class MainAbility <: UIAbility {
        public init() {
            super()
            registerSelf()
        }

        public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
            AppLog.info("MainAbility OnCreated.${want.abilityName}")
            // Get context
            globalAbilityContext = this.context

            let kvManagerConfig = KVManagerConfig(getStageContext(this.context), "com.example.datamanagertest")
            try {
                // Create KVManager instance
                kvManager = DistributedKVStore.createKVManager(kvManagerConfig)
                AppLog.info("Succeeded in creating KVManager.")
                // Proceed to create and retrieve the database
                // ...
            } catch (e: BusinessException) {
                AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")
            }
            match (launchParam.launchReason) {
                case LaunchReason.START_ABILITY => AppLog.info("START_ABILITY")
                case _ => ()
            }
        }
        // ...
    }
    ```

2. Create and retrieve the key-value database. Example code:

    <!-- compile -->

    ```cangjie
    // index.cj
    import kit.ArkData.*
    import kit.UIKit.BusinessException

    var kvStore: Option<SingleKVStore> = Option<SingleKVStore>.None

    try {
        let options = KVOptions(
            KVSecurityLevel.S1,
            createIfMissing: true,
            encrypt: false,
            backup: false,
            autoSync: false
        )
        kvStore = kvManager.getOrThrow().getSingleKVStore("storeId", options)
    } catch (e: BusinessException) {
        AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")
    }
    ```

3. Use the `put()` method to insert data into the key-value database. Example code:

    <!-- compile -->

    ```cangjie
    // index.cj
    const KEY_TEST_STRING_ELEMENT: String = "key_test_string"
    const VALUE_TEST_STRING_ELEMENT: String = "value_test_string"

    try {
        kvStore.getOrThrow().put(KEY_TEST_STRING_ELEMENT, KVValueType.STRING(VALUE_TEST_STRING_ELEMENT))
    } catch (e: BusinessException) {
        AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")
    }
    ```

    > **Note:**
    >
    > If the key exists, `put()` will update its value; otherwise, it will add a new entry.

4. Use the `get()` method to retrieve the value associated with a key. Example code:

    <!-- compile -->

    ```cangjie
    // index.cj
    try {
        let singleKVStore = kvStore.getOrThrow()
        singleKVStore.put(KEY_TEST_STRING_ELEMENT, KVValueType.STRING(VALUE_TEST_STRING_ELEMENT))
        AppLog.info("Succeeded in putting data.")
        let value = singleKVStore.get(KEY_TEST_STRING_ELEMENT)
        match (value) {
            case STRING(v) => AppLog.info("The obtained value is a String: ${v}")
            case _ => AppLog.info("The obtained value is not a string.")
        }
    } catch (e: BusinessException) {
        AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")
    }
   ```

5. Use the `delete()` method to remove data associated with a key. Example code:

    <!-- compile -->

    ```cangjie
    // index.cj
    try {
        let singleKVStore = kvStore.getOrThrow()
        singleKVStore.put(KEY_TEST_STRING_ELEMENT, KVValueType.STRING(VALUE_TEST_STRING_ELEMENT))
        singleKVStore.delete(KEY_TEST_STRING_ELEMENT)
        AppLog.info("delete data success.")
    } catch (e: BusinessException) {
        AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")
    }
    ```

6. Close the specified distributed key-value database using its `storeId`. Example code:

    <!-- compile -->

    ```cangjie
    // index.cj
    try {
        kvManager.getOrThrow().closeKVStore("com.example.datamanagertest", "storeId")
        AppLog.info("closeKVStore success.")
    } catch (e: BusinessException) {
        AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")
    }
    ```

7. Delete the specified distributed key-value database using its `storeId`. Example code:

    <!-- compile -->

    ```cangjie
    // index.cj
    try {
        kvManager.getOrThrow().deleteKVStore("com.example.datamanagertest", "storeId")
        AppLog.info("deleteKVStore success.")
    } catch (e: BusinessException) {
        AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")
    }
    ```