# Implementing Data Persistence with Relational Databases

## Scenario Description

Relational databases, based on the SQLite component, are suitable for scenarios involving complex relational data storage. Examples include student information for a class (containing names, student IDs, subject grades, etc.) or employee information for a company (including names, employee IDs, positions, etc.). When data exhibits strong correlations and higher complexity compared to key-value data, relational databases should be used for persistent storage.

For large-scale data queries that may cause prolonged delays or application unresponsiveness, the following recommendations apply:

- Limit single queries to no more than 5,000 records.
- Keep SQL statement concatenation as concise as possible.
- Implement reasonable batch querying.

## Basic Concepts

- **Predicate:** A term in databases representing properties, characteristics of data entities, or relationships between them, primarily used to define database operation conditions.
- **Result Set:** The collection of results returned after a user query, enabling data access. Result sets provide flexible data access methods for easier retrieval of desired information.

## Operation Mechanism

Relational databases offer universal operation interfaces to applications, with SQLite serving as the underlying persistent storage engine. They support all SQLite database features including but not limited to transactions, indexes, views, triggers, foreign keys, parameterized queries, and prepared SQL statements.

**Figure 1** Relational Database Operation Mechanism

![relationStore_local](figures/relationStore_local.png)

## Constraints

- The system defaults to WAL (Write Ahead Log) mode for logging and FULL mode for disk flushing.
- Databases maintain 4 read connections and 1 write connection. Threads can perform read operations when idle read connections are available. If no read connections are available but a write connection is idle, it will be used as a read connection.
- To ensure data accuracy, only one write operation is supported at any given time.
- When an application is uninstalled, all related database files and temporary files on the device are automatically removed.
- Supported basic data types in Cangjie: Int64, Float64, String, binary data, Bool.
- To ensure successful data insertion and retrieval, it is recommended that a single record does not exceed 2MB. Larger records may insert successfully but fail to read.

## API Description

Below are key interfaces for relational database persistence. For more interfaces and usage details, refer to [Relational Database](../../../API_Reference/source_en/apis/ArkData/cj-apis-relational_store.md).

| Interface Name | Description |
| -------- | -------- |
| getRdbStore(context: StageContext, config: StoreConfig): RdbStore | Obtains an RdbStore instance for relational database operations. Developers can configure RdbStore parameters according to their needs and perform data operations through RdbStore. |
| executeSql(sql: String, bindArgs: Array\<RelationalStoreValueType>): Unit | Executes an SQL statement with specified parameters that does not return values. |
| insert(table: String, values: Map\<String, RelationalStoreValueType>): Int64 | Inserts a row of data into the target table. |
| update(values: Map\<String, RelationalStoreValueType>, predicates: RdbPredicates): Int64 | Updates data in the database based on specified predicate conditions. |
| delete(predicates: RdbPredicates): Int64 | Deletes data from the database based on specified predicate conditions. |
| query(predicates: RdbPredicates, columns: Array\<String>): ResultSet| Queries database data based on specified conditions. |
| deleteRdbStore(context: StageContext, name: String): Unit | Deletes a database. |

## Development Procedure

During relational database operations or storage processes, unexpected database exceptions (error code 14800011) may occur due to various reasons. In such cases, the database should be rebuilt and data restored to ensure normal application development. For details, refer to [Relational Database Exception Recovery](cj-data-backup-and-restore.md#关系型数据库异常重建).

1. To implement data persistence using relational databases, obtain an RdbStore instance, which includes operations like database creation, table creation, and version upgrades/downgrades. Example code:

    <!-- compile -->

    ```cangjie
    import kit.UIKit.BusinessException
    import kit.ArkData.*
    import kit.AbilityKit.getStageContext
    import std.collection.HashMap

    let storeConfig = StoreConfig(
        "RdbTest.db", // Database filename
        RelationalStoreSecurityLevel.S3, // Database security level
        encrypt: false, // Optional parameter, specifies whether the database is encrypted (default: false)
        customDir: "customDir/subCustomDir", // Optional parameter, custom database path. The database will be created in: context.databaseDir + '/rdb/' + customDir, where context.databaseDir is the application sandbox path, '/rdb/' indicates a relational database, and customDir is the custom path. If omitted, the RdbStore instance is created in the application sandbox directory.
    )

    // Check database version and perform upgrades/downgrades if needed
    // Assume current database version is 3 with table structure: EMPLOYEE (ID, NAME, AGE, SALARY, CODES)
    const SQL_CREATE_TABLE = "CREATE TABLE EMPLOYEE(ID int NOT NULL, NAME varchar(255) NOT NULL, AGE int, SALARY float NOT NULL, CODES Bit NOT NULL, PRIMARY KEY (Id))"
    var rdbStore: Option<RdbStore> = Option<RdbStore>.None

    // This example is implemented in an Ability, but can be used in other appropriate scenarios
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
            let store = getRdbStore(getStageContext(this.context), storeConfig)
            // When a database is created, its default version is 0
            if (store.version == 0) {
                store.executeSql(SQL_CREATE_TABLE) // Create table
                // Set database version (must be >0)
                store.version = 3
            } else if (store.version == 1) {
                // If database version is not 0 and doesn't match current version, perform upgrade/downgrade
                // When database exists at version 1, upgrade to version 2:
                // version 1: EMPLOYEE (ID, NAME, SALARY, CODES) => version 2: EMPLOYEE (ID, NAME, AGE, SALARY, CODES)
                store.executeSql('ALTER TABLE EMPLOYEE ADD COLUMN AGE INTEGER')
                store.version = 2
            } else if (store.version == 2) {
                // When database exists at version 2, upgrade to version 3:
                // version 2: EMPLOYEE (ID, NAME, AGE, SALARY, CODES, ADDRESS) => version 3: EMPLOYEE (ID, NAME, AGE, SALARY, CODES)
                store.executeSql('ALTER TABLE EMPLOYEE DROP COLUMN ADDRESS TEXT')
                store.version = 3
            }
            rdbStore = store
            // Perform CRUD operations...
        }
        // ...
    }
    ```

    > **Note:**
    >
    > - Databases created by applications are context-dependent. Even with the same database name, different application contexts will create separate databases (e.g., each Ability has its own context).
    > - When an application first accesses a database (via getRdbStore), corresponding database files are created in the application sandbox. Temporary files with -wal and -shm extensions may appear in the same directory during database operations. To move database files for inspection elsewhere, these temporary files must also be moved. Uninstalling the application removes all associated database and temporary files from the device.
    > - For detailed error codes, see [Universal Error Codes](../../../API_Reference/source_en/errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../../API_Reference/source_en/errorcodes/cj-errorcode-data-rdb.md).

2. After obtaining RdbStore, use insert() to add data. Example:

    <!-- compile -->

    ```cangjie
    var values = HashMap<String, RelationalStoreValueType>()
    values.add("ID", RelationalStoreValueType.integer(1))
    values.add("NAME", RelationalStoreValueType.string("Lisa"))
    values.add("AGE", RelationalStoreValueType.integer(18))
    values.add("SALARY", RelationalStoreValueType.double(100.5))
    values.add("CODES", RelationalStoreValueType.boolean(true))
    rdbStore.getOrThrow().insert("EMPLOYEE", values)
    ```

    > **Note:**
    >
    > Relational databases don't require explicit flush operations for persistence—data is saved to persistent files upon insertion.

3. Modify or delete data using predicate conditions.

    Use update() to modify data and delete() to remove data. Example:

    <!-- compile -->

    ```cangjie
    // Update data
    try {
        let predicates1 = RdbPredicates('EMPLOYEE')  // Create predicates for 'EMPLOYEE' table
        predicates1.equalTo("NAME", RelationalStoreValueType.string("Lisa")) // Match records where "NAME" equals "Lisa"

        var values = HashMap<String, RelationalStoreValueType>()
        values.add("NAME", RelationalStoreValueType.string("TOM"))
        values.add("AGE", RelationalStoreValueType.integer(88))
        values.add("SALARY", RelationalStoreValueType.double(9999.513))
        let rowsCnt = rdbStore.getOrThrow().update(values, predicates1)
        AppLog.info("Succeeded in updating data. row count: ${rowsCnt}")
    } catch (e: BusinessException) {
        AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")
    }

    // Delete data
    try {
        let predicates1 = RdbPredicates('EMPLOYEE')  // Create predicates for 'EMPLOYEE' table
        predicates1.equalTo("NAME", RelationalStoreValueType.string("Lisa")) // Match records where "NAME" equals "Lisa"

        let rowsCnt = rdbStore.getOrThrow().delete(predicates1)
        AppLog.info("Succeeded in delete data. row count: ${rowsCnt}")
    } catch (e: BusinessException) {
        AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")
    }
    ```

4. Query data based on predicate conditions.

    Use query() to retrieve data, returning a ResultSet. Example:

    <!-- compile -->

    ```cangjie
    try {
        let predicates2 = RdbPredicates('EMPLOYEE')  // Create predicates for 'EMPLOYEE' table
        predicates2.equalTo("NAME", RelationalStoreValueType.string("Rose")) // Match records where "NAME" equals "Rose"

        let columns = ["ID", "NAME", "AGE", "SALARY", "CODES"]
        let resultSet = rdbStore.getOrThrow().query(predicates2, columns)
        AppLog.info("ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}")
        // ResultSet is a cursor over the data collection, initially positioned before the first record (index -1). Valid data starts at index 0.

        while (resultSet.goToNextRow()) {
            let id = resultSet.getLong(resultSet.getColumnIndex('ID'))
            let name = resultSet.getString(resultSet.getColumnIndex('NAME'))
            let age = resultSet.getLong(resultSet.getColumnIndex('AGE'))
            let salary = resultSet.getDouble(resultSet.getColumnIndex('SALARY'))
            AppLog.info("id=${id}, name=${name}, age=${age}, salary=${salary}")
        }
        // Release memory allocated for the result set
        resultSet.close()
    } catch (e: BusinessException) {
        AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")
    }
    ```

    > **Note:**
    >
    > When a ResultSet is no longer needed after query operations, always call close() to release allocated memory.

5. Back up the database in the same directory. Relational databases support both manual backup and automatic backup (system apps only). For details, see [Relational Database Backup](cj-data-backup-and-restore.md#relational-database-backup).

    Manual backup example:

    <!-- compile -->

    ```cangjie
    try {
        // "Backup.db" is the backup filename, created in the same directory as RdbStore by default. Custom paths can be specified: customDir + "backup.db"
        rdbStore.getOrThrow().backup("Backup.db")
        AppLog.info("Succeeded in backup data.")
    } catch (e: BusinessException) {
        AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")
    }
    ```

6. Restore data from a backup. Relational databases support restoring both manual and automatic backups (system apps only). For details, see [Relational Database Data Recovery](cj-data-backup-and-restore.md#relational-database-data-recovery).

    Example using [restore](../../../API_Reference/source_en/apis/ArkData/cj-apis-relational_store.md#func-restorestring) for manual backups:

    <!-- compile -->

    ```cangjie
    try {
        rdbStore.getOrThrow().restore("Backup.db")
        AppLog.info("Succeeded in backup data.")
    } catch (e: BusinessException) {
        AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")
    }
    ```

7. Delete a database.

    Use deleteRdbStore() to remove a database and related files. Example:

    <!-- compile -->

    ```cangjie
    try {
        deleteRdbStore(Global.getStageContext(), StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S3)) // Requires application context (see usage notes)
        AppLog.info("Succeeded in delete RdbStore.")
    } catch (e: BusinessException) {
        AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")
    }
    ```

    > **Note:**
    >
    >  For Global definition, see [Usage Notes](../../../API_Reference/source_en/cj-development-intro.md)
