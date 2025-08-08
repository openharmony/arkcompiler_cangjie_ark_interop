# Cross-Device Data Synchronization for Relational Databases

## Scenario Description

When an application's locally stored relational data requires synchronization across devices, you can migrate the table data that needs synchronization to new tables that support cross-device functionality. Alternatively, you can configure tables to support cross-device synchronization immediately after their creation.

## Basic Concepts

Cross-device data synchronization for relational databases enables applications to synchronize stored relational data across multiple devices.

- After creating a new table in the database, an application can designate it as a distributed table. When querying a remote device's database, the distributed table name on the specified remote device can be obtained using the local table name.
- Data synchronization between devices can be achieved in two ways: pushing data from the local device to remote devices or pulling data from remote devices to the local device.

## Operation Mechanism

The underlying communication component handles device discovery and authentication, notifying the upper-layer application when devices come online. Upon receiving a device online notification, the data management service can establish an encrypted data transmission channel between the two devices, enabling data synchronization.

### Cross-Device Data Synchronization Mechanism

![relationalStore_sync](figures/relational-store-sync.png)   <!-- ToBeReviewd -->

After writing data to the relational database, the business logic initiates a synchronization request to the data management service.

The data management service reads the data to be synchronized from the application sandbox and sends it to the data management service of other devices based on their deviceId. The remote data management service then writes the data into the same application's database.

### Data Change Notification Mechanism

When data is inserted, deleted, or modified in the database, subscribers receive notifications of these changes. Notifications are primarily categorized into local data change notifications and distributed data change notifications.

- **Local Data Change Notification:** Applications on the local device subscribe to data change notifications and receive them when data is inserted, deleted, or modified in the database.
- **Distributed Data Change Notification:** Applications subscribe to notifications for data changes on other devices within the network. When data is inserted, deleted, or modified on other devices, the local device receives a notification.

## Constraints

- Each application can open a maximum of 16 relational distributed databases simultaneously.
- A single database supports registering up to 8 callbacks for data change subscriptions.
- Tables with composite keys cannot be designated as distributed tables.

## API Description

The following are the APIs related to cross-device data synchronization for relational distributed databases. For more APIs and usage details, refer to [Relational Database](../../../API_Reference/source_en/apis/ArkData/cj-apis-relational_store.md).

## Development Procedure

> **Note:**
>
> Data can only be synchronized to devices whose data security labels are not higher than the security level of the target device. For specific rules, refer to [Cross-Device Synchronization Access Control Mechanism](cj-access-control-by-device-and-data-level.md#cross-device-synchronization-access-control-mechanism).

1. Import the module.

    <!-- compile -->

    ```cangjie
    import kit.ArkData.RelationalStoreSecurityLevel
    import ohos.relational_store.*
    import kit.AbilityKit.getStageContext
    import kit.UIKit.{BusinessException, Callback1Argument}
    ```

2. Request permissions.

   (1) The `ohos.permission.DISTRIBUTED_DATASYNC` permission must be requested. For configuration details, refer to [Declaring Permissions](../security/AccessToken/cj-declare-permissions.md).

   (2) Additionally, user authorization must be requested via a pop-up during the application's first launch. For usage details, refer to [Requesting User Authorization](../security/AccessToken/cj-request-user-authorization.md).

3. Create a relational database and designate tables for distributed synchronization.

    <!-- compile -->

    ```cangjie
    // main_ability.cj
    var rdbStore: Option<RdbStore> = Option<RdbStore>.None

    class MainAbility <: UIAbility {
        public init() {
            super()
            registerSelf()
        }

        public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
            AppLog.info("MainAbility OnCreated.${want.abilityName}")
            match (launchParam.launchReason) {
                case LaunchReason.START_ABILITY => AppLog.info("START_ABILITY")
                case _ => ()
            }
        }

        public override func onWindowStageCreate(windowStage: WindowStage): Unit {
            AppLog.info("MainAbility onWindowStageCreate.")
            windowStage.loadContent("EntryView")

            let storeConfig = StoreConfig(
                "RdbTest.db", // Database filename
                RelationalStoreSecurityLevel.S3, // Database security level
            )

            try {
                let store = getRdbStore(getStageContext(this.context), storeConfig)
                store.executeSql("CREATE TABLE EMPLOYEE(ID int NOT NULL, NAME varchar(255) NOT NULL, AGE int, SALARY float NOT NULL, CODES Bit NOT NULL, PRIMARY KEY (Id))")
                store.setDistributedTables(['EMPLOYEE'])
                rdbStore = store
                // Subsequent data operations can be performed here
            } catch (e: BusinessException) {
                AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")
            }
            // ...
        }
    }
    ```

4. Distributed data synchronization. Using `SYNC_MODE_PUSH` triggers synchronization, which pushes data from the local device to all other devices in the network.

    <!-- compile -->

    ```cangjie
    // Construct a predicate object for synchronizing distributed tables
    let predicates = RdbPredicates('EMPLOYEE')
    try {
        // Call the data synchronization interface
        let result = rdbStore.getOrThrow().sync(SYNC_MODE_PUSH, predicates)
        for (i in (0..result.size)) {
            AppLog.info("device:${result[i][0]}, status:${result[i][1]}")
        }
    } catch (e: BusinessException) {
        AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")
    }
    ```

5. Distributed data subscription. Data synchronization changes trigger the subscription callback method, with the callback parameter being the device ID where the changes occurred.

    <!-- compile -->

    ```cangjie
    // Custom callback function
    class TestCallback <: Callback1Argument<Array<ChangeInfo>> {
        public init() {}
        public open func invoke(arr: Array<ChangeInfo>): Unit {
            AppLog.info("Call invoke.")
        }
    }
    // Call the distributed data subscription interface to register a database observer
    // The callback is invoked when data in the distributed database changes
    try {
        rdbStore.getOrThrow().onDataChange(SubscribeType.SUBSCRIBE_TYPE_REMOTE, TestCallback())
    } catch (e: BusinessException) {
        AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")
    }

    // Unsubscribe from data changes when no longer needed
    try {
        rdbStore.getOrThrow().offDataChange(SubscribeType.SUBSCRIBE_TYPE_REMOTE, TestCallback())
    } catch (e: BusinessException) {
        AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")
    }
    ```