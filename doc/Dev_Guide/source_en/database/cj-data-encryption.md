# Database Encryption

## Scenario Description

To enhance database security, the database provides a secure and applicable encryption capability that effectively protects stored content. Through security methods like database encryption, the confidentiality and integrity requirements of database storage are achieved, enabling the database to store data in ciphertext and operate in an encrypted state, ensuring data security.

An encrypted database can only be accessed through interfaces; the database files cannot be opened by other means. The encryption attribute of the database is determined during creation and cannot be modified.

Both key-value databases and relational databases support encryption operations.

## Key-Value Database Encryption

For key-value databases, encryption is configured via the `encrypt` parameter in `options`, which defaults to `false` (no encryption). Setting `encrypt` to `true` enables encryption.

For specific interfaces and functionalities, refer to [Distributed Key-Value Database](../../../API_Reference/source_en/apis/ArkData/cj-apis-distributed_kv_store.md).

1. Obtain the context.

    <!-- compile -->

    ```cangjie
    // main_ability.cj
    internal import ohos.base.AppLog
    internal import ohos.ability.AbilityStage
    internal import ohos.ability.LaunchReason
    import kit.AbilityKit.{UIAbility,UIAbilityContext,LaunchParam,Want}

    var globalAbilityContext: Option<UIAbilityContext> = Option<UIAbilityContext>.None

    class MainAbility <: UIAbility {
        public init() {
            super()
            registerSelf()
        }

        public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
            AppLog.info("MainAbility OnCreated.${want.abilityName}")
            // Obtain the context
            globalAbilityContext = this.context

            match (launchParam.launchReason) {
                case LaunchReason.START_ABILITY => AppLog.info("START_ABILITY")
                case _ => ()
            }
        }
        // ...
    }
    ```

2. Configure key-value database encryption.

    <!-- compile -->

    ```cangjie
    // index.cj
    import kit.ArkData.*
    import kit.UIKit.BusinessException
    import kit.AbilityKit.getStageContext

    try {
        // globalAbilityContext is obtained during Ability onCreate
        let context = globalAbilityContext.getOrThrow()
        let kvManagerConfig = KVManagerConfig(getStageContext(context), "com.example.datamanagertest")
        // Create a KVManager instance
        let kvManager = DistributedKVStore.createKVManager(kvManagerConfig)
        AppLog.info("Succeeded in creating KVManager.")

        let options = KVOptions(
            KVSecurityLevel.S3,
            createIfMissing: true,
            encrypt: true, // Enable database encryption
            backup: false,
            autoSync: false,
        )
        let kvStore = kvManager.getSingleKVStore("storeId", options)
        AppLog.info("getSingleKVStore success")
    } catch (e: BusinessException) {
        AppLog.error("ErrorCode: ${e.code}, Message: ${e.message}")
    }
    // Perform other database-related operations
    // ...
    ```

## Relational Database Encryption

For relational databases, encryption is configured via the `encrypt` property in `StoreConfig`, which defaults to `false` (no encryption). Setting `encrypt` to `true` enables encryption.

For specific interfaces and functionalities, refer to [Relational Database](../../../API_Reference/source_en/apis/ArkData/cj-apis-relational_store.md).

1. Obtain the context.

    <!-- compile -->

    ```cangjie
    // main_ability.cj
    internal import ohos.base.AppLog
    internal import ohos.ability.AbilityStage
    internal import ohos.ability.LaunchReason
    import kit.AbilityKit.UIAbilityContext

    var globalAbilityContext: Option<UIAbilityContext> = Option<UIAbilityContext>.None

    class MainAbility <: UIAbility {
        public init() {
            super()
            registerSelf()
        }

        public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
            AppLog.info("MainAbility OnCreated.${want.abilityName}")
            // Obtain the context
            globalAbilityContext = this.context

            match (launchParam.launchReason) {
                case LaunchReason.START_ABILITY => AppLog.info("START_ABILITY")
                case _ => ()
            }
        }
        // ...
    }
    ```

2. Configure relational database encryption.

    <!-- compile -->

    ```cangjie
    // index.cj
    import kit.ArkData.{ getRdbStore, StoreConfig, RelationalStoreSecurityLevel }
    import kit.UIKit.BusinessException
    import kit.AbilityKit.getStageContext

    try {
        // globalAbilityContext is obtained during Ability onCreate
        let context = globalAbilityContext.getOrThrow()
        let storeConfig = StoreConfig(
            "RdbTest.db", // Database filename
            RelationalStoreSecurityLevel.S3, // Database security level
            encrypt: true, // Enable database encryption
        )
        let rdbStore = getRdbStore(getStageContext(context), storeConfig)
        AppLog.info("getRdbStore success")
    } catch (e: BusinessException) {
        AppLog.error("ErrorCode: ${e.code}, Message: ${e.message}")
    }
    // Perform other database-related operations
    // ...
    ```