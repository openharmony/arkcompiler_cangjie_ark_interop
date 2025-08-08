# Database Backup and Recovery

## Scenario Description  

When an application is performing a critical operation that must not be interrupted, such as writing a transaction involving multiple related tables, each table write is performed individually, but the transactional consistency between tables cannot be split.  

If an issue arises during the operation, developers can use the recovery feature to restore the database to its previous state and retry the operation.  

In scenarios where the database is tampered with, deleted, or the device loses power, the database may become unusable due to data loss, corruption, or dirty data. The database's backup and recovery capabilities can restore it to a usable state.  

Both key-value databases and relational databases support backup and recovery. Additionally, key-value databases support deleting backups to free up local storage space.  

## Key-Value Database Backup, Recovery, and Deletion  

For key-value databases, backups are performed using the `backup` interface, recovery is performed using the `restore` interface, and backup deletion is performed using the `deletebackup` interface. For specific interfaces and functionalities, refer to [Distributed Key-Value Database](../../../API_Reference/source_en/apis/ArkData/cj-apis-distributed_kv_store.md).  

1. **Create a database**.  

    a. Obtain the context.  

    <!-- compile -->  

    ```cangjie  
    // main_ability.cj  
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

    b. Create a `kvStore`.  

    <!-- compile -->  

    ```cangjie  
    // index.cj  
    import kit.ArkData.*  
    import kit.UIKit.BusinessException  
    import kit.AbilityKit.getStageContext  

    var kvManager: Option<KVManager> = Option<KVManager>.None  
    var kvStore: Option<SingleKVStore> = Option<SingleKVStore>.None  

    try {  
        // 1. Create kvManager  
        let kvManagerConfig = KVManagerConfig(getStageContext(globalAbilityContext.getOrThrow()), "com.example.datamanagertest")  
        kvManager = DistributedKVStore.createKVManager(kvManagerConfig)  
        // 2. Configure database parameters  
        let options = KVOptions(  
            KVSecurityLevel.S3,  
            createIfMissing: true,  
            encrypt: true,  
            backup: false,  
            autoSync: false,  
        )  
        // 3. Create kvStore  
        kvStore = kvManager.getOrThrow().getSingleKVStore("storeId", options)  
    } catch (e: BusinessException) {  
        AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")  
    }  
   ```  

2. **Insert data using the `put()` method**.  

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

3. **Back up data using the `backup()` method**.  

    <!-- compile -->  

    ```cangjie  
    // index.cj  
    try {  
        kvStore.getOrThrow().backup("BK001")  
    } catch (e: BusinessException) {  
        AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")  
    }  
    ```  

4. **Delete data using the `delete()` method (simulating accidental deletion or tampering scenarios)**.  

    <!-- compile -->  

    ```cangjie  
    // index.cj  
    try {  
        kvStore.getOrThrow().delete(KEY_TEST_STRING_ELEMENT)  
    } catch (e: BusinessException) {  
        AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")  
    }  
    ```  

5. **Restore data using the `restore()` method**.  

    <!-- compile -->  

    ```cangjie  
    // index.cj  
    try {  
        kvStore.getOrThrow().restore("BK001")  
    } catch (e: BusinessException) {  
        AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")  
    }  
    ```  

6. **Delete backups using the `deleteBackup()` method to free up storage space when local storage is limited or re-backup is needed**.  

    <!-- compile -->  

    ```cangjie  
    // index.cj  
    import std.collection.ArrayList  
    try {  
        kvStore.getOrThrow().deleteBackup(ArrayList<String>(["BK001"]))  
    } catch (e: BusinessException) {  
        AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")  
    }  
    ```  

## Relational Database Backup  

During database operations or storage processes, unexpected database exceptions may occur due to various reasons. The relational database's backup capability can be used to reliably and efficiently restore data to ensure normal business operations in case of database anomalies.  

Relational databases support two backup methods: manual backup and automatic backup (available only to system applications).  

### Manual Backup  

Manual backup is performed by calling the [`backup`](../../../API_Reference/source_en/apis/ArkData/cj-apis-relational_store.md#func-backupstring) interface. Example:  

<!-- compile -->  

```cangjie  
// index.cj  
import kit.ArkData.*  
import kit.UIKit.BusinessException  
import kit.AbilityKit.getStageContext  

var rdbStore_: Option<RdbStore> = Option<RdbStore>.None  
let storeConfig_ = StoreConfig(  
    "RdbTest.db", // Database filename  
    RelationalStoreSecurityLevel.S3, // Database security level  
    encrypt: false, // Optional parameter, specifies whether the database is encrypted (default: false)  
)  

try {  
    let store = getRdbStore(getStageContext(globalAbilityContext.getOrThrow()), storeConfig_)  
    store.executeSql("CREATE TABLE EMPLOYEE(ID int NOT NULL, NAME varchar(255) NOT NULL, AGE int, SALARY float NOT NULL, CODES Bit NOT NULL, PRIMARY KEY (Id))")  
    /**  
     * "Backup.db" is the backup database filename, which is backed up in the same directory as RdbStore by default.  
     * An absolute path can also be specified: "/data/storage/el2/database/Backup.db". The file path must exist; directories are not created automatically.  
     */  
    store.backup("Backup.db")  
    rdbStore_ = store  
} catch (e: BusinessException) {  
    AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")  
}  
```  

## Relational Database Data Recovery  

In case of database anomalies, after rebuilding the database, pre-backed-up data can be used for recovery.  

### Recovering Manually Backed-Up Data  

Relational databases support manual backup via the `backup` interface and manual recovery via the `restore` interface.  

The recovery process and key code snippets are as follows. For the complete example, combine it with the context of relational database backup and rebuilding.  

1. **Throw a database exception error code**.  

    <!-- compile -->  

    ```cangjie  
    // index.cj  
    try {  
        let predicates = RdbPredicates("EMPLOYEE")  
        let columns = ["ID", "NAME", "AGE", "SALARY", "CODES"]  
        let resultSet = rdbStore.getOrThrow().query(predicates, columns)  
        /*  
         * Business logic for insert/update/delete  
         * ...  
         */  
        // Throw an exception  
        if (resultSet.rowCount == -1) {  
            resultSet.isColumnNull(0)  
        }  
        // Other interfaces like resultSet.goToFirstRow(), resultSet.count may also throw exceptions  
        while (resultSet.goToNextRow()) {  
            AppLog.info("${resultSet.getRow().size}")  
        }  
        resultSet.close()  
    } catch (e: BusinessException) {  
        if (e.code == 14800011) {  
            // Proceed to the steps below (i.e., close the result set and perform recovery)  
        }  
        AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")  
    }  
    ```  

2. **Close all open result sets**.  

    <!-- compile -->  

    ```cangjie  
    // index.cj  
    try {  
        // All open result sets  
        var resultSets: Array<ResultSet> = Array<ResultSet>()  
        // Add result sets to resultSets  
        // ...  
        // Close all open result sets using resultSet.close()  
        for (i in (0..resultSets.size)) {  
            resultSets[i].close()  
        }  
    } catch (e: BusinessException) {  
        if (e.code != 14800014) {  
            AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")  
        }  
    }  
   ```  

3. **Call the `restore` interface to recover data**.  

    <!-- compile -->  

    ```cangjie  
    // index.cj  
    import kit.CoreFileKit.FileFs  
    try {  
        /**  
         * "Backup.db" is the backup database filename, which is searched for in the same directory as the current store by default.  
         * If an absolute path was specified during backup (e.g., "/data/storage/el2/database/Backup.db"), the absolute path must be provided here.  
         */  
        let backup = globalAbilityContext.getOrThrow().databaseDir + '/entry/rdb/Backup.db'  
        if (!FileFs.access(backup)) {  
            AppLog.info("no backup file")  
        }  
        // Call the restore interface to recover data  
        rdbStore.getOrThrow().restore("Backup.db")  
        AppLog.info("Succeeded in backup data.")  
    } catch (e: BusinessException) {  
        AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")  
    }  
    ```