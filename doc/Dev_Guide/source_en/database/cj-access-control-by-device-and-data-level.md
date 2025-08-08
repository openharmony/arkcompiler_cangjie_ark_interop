# Access Control Based on Device Classification and Data Classification

## Basic Concepts

Distributed data management implements classified and hierarchical protection for data, providing access control mechanisms based on data security labels and device security levels.

Higher data security labels and device security levels correspond to stricter encryption measures and access control measures, resulting in higher data security.

### Data Security Labels

According to data classification and hierarchical specifications, data can be divided into four security levels: S1, S2, S3, and S4.

| Risk Level | Risk Criteria | Definition | Examples |
| ---------- | ------------- | ---------- | -------- |
| Critical | S4 | Special data types defined by industry laws and regulations, involving the most private information of individuals. Data whose leakage, tampering, destruction, or loss may cause significant adverse effects on individuals or organizations. | Political views, religious and philosophical beliefs, trade union membership, genetic data, biometric data, health and sexual life status, sexual orientation, or device authentication credentials, personal credit card and other financial information, etc. |
| High | S3 | Data whose leakage, tampering, destruction, or loss may cause severe adverse effects on individuals or organizations. | Real-time precise location information of individuals, movement trajectories, etc. |
| Medium | S2 | Data whose leakage, tampering, destruction, or loss may cause serious adverse effects on individuals or organizations. | Detailed communication addresses of individuals, names or nicknames, etc. |
| Low | S1 | Data whose leakage, tampering, destruction, or loss may cause limited adverse effects on individuals or organizations. | Gender, nationality, user application records, etc. |

### Device Security Levels

<!--RP1-->
Based on device security capabilities (e.g., whether it has TEE, secure storage chips, etc.), device security levels are divided into five levels: SL1, SL2, SL3, SL4, and SL5. For example, development boards like rk3568 and hi3516 are low-security SL1 devices, while tablets are high-security SL4 devices.

During device networking, you can use the `hidumper -s 3511` command to check the security level of a device. If no result is returned, you can manually start the corresponding process using `service_control start dslm_service` and then use the hidumper command to query again. For example, the security level query for an rk3568 device is as follows:
<!--RP1End-->
<!--Del-->
![zh-cn_image_0000001542496993](./figures/zh-cn_image_0000001542496993.png)
<!--DelEnd-->

## Cross-Device Synchronization Access Control Mechanism

During cross-device data synchronization, data management performs access control based on data security labels and device security levels. The rule is that data can be synchronized from the local device to the peer device only if the local device's data security label is not higher than the peer device's security level; otherwise, synchronization is prohibited. The specific access control matrix is as follows:

| Device Security Level | Synchronizable Data Security Labels |
| --------------------- | ----------------------------------- |
| SL1                   | S1                                  |
| SL2                   | S1~S2                               |
| SL3                   | S1~S3                               |
| SL4                   | S1~S4                               |
| SL5                   | S1~S4                               |

<!--RP2-->
For example, for development board devices like rk3568 and hi3516, the device security level is SL1. If a database with a data security label of S1 is created, the data in this database can be synchronized among these devices. If the database label is S2-S4, synchronization among these devices is not allowed.
<!--RP2End-->

## Scenario Introduction

The access control mechanism of the distributed database ensures security capabilities during data storage and synchronization. When creating a database, the security label of the database should be set reasonably based on data classification and hierarchical specifications to ensure consistency between the database content and its data label.

## Implementing Data Classification Using Key-Value Databases

Key-value databases allow setting the security level of the database through the `securityLevel` parameter. Here is an example of creating a database with a security level of S1.

For specific interfaces and functionalities, refer to [Distributed Key-Value Database](../../../API_Reference/source_en/apis/ArkData/cj-apis-distributed_kv_store.md).

> **Note:**
>
> In single-device usage scenarios, KV databases support upgrading the security level by modifying the `securityLevel` parameter when opening the database. The following points should be noted for security level upgrades:
>
> * This operation is not supported for databases that require cross-device synchronization. Databases with different security levels cannot synchronize data. For databases requiring cross-device synchronization, it is recommended to create a new database with a higher security level.
> * This operation requires closing the current database first, then modifying the `securityLevel` parameter to set the new security level, and finally reopening the database.
> * This operation only supports upgrades, not downgrades. For example, S2->S3 upgrades are supported, but S3->S2 downgrades are not.

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

2. Create a key-value database with a security level of S1.

    <!-- compile -->

    ```cangjie
    // index.cj
    import kit.ArkData.{DistributedKVStore, KVManagerConfig, KVOptions, KVSecurityLevel}
    import kit.UIKit.BusinessException
    import kit.AbilityKit.getStageContext

    try {
        let context = globalAbilityContext.getOrThrow()
        let kvManagerConfig = KVManagerConfig(getStageContext(globalAbilityContext.getOrThrow()), "com.example.datamanagertest")
        // Create a KVManager instance
        let kvManager = DistributedKVStore.createKVManager(kvManagerConfig)
        AppLog.info("Succeeded in creating KVManager.")

        let options = KVOptions(
            KVSecurityLevel.S1, // Set the security level to S1
            createIfMissing: true,
            encrypt: true,
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

## Implementing Data Classification Using Relational Databases

Relational databases allow setting the security level of the database through the `securityLevel` parameter. Here is an example of creating a database with a security level of S1.

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

2. Create a relational database with a security level of S1.

    <!-- compile -->

    ```cangjie
    // index.cj
    import kit.ArkData.{StoreConfig, RelationalStoreSecurityLevel, getRdbStore}
    import kit.UIKit.BusinessException
    import kit.AbilityKit.getStageContext

    try {
        let context = globalAbilityContext.getOrThrow()
        let storeConfig = StoreConfig(
            "RdbTest.db", // Database file name
            RelationalStoreSecurityLevel.S1, // Set the security level to S1
        )
        let rdbStore = getRdbStore(getStageContext(context), storeConfig)
        AppLog.info("getRdbStore success")
    } catch (e: BusinessException) {
        AppLog.error("ErrorCode: ${e.code}, Message: ${e.message}")
    }
    // Perform other database-related operations
    // ...
    ```