# Overview of Data Reliability and Security  

## Functional Scenarios  

During system operation, storage corruption, insufficient storage space, file system permissions, and power failures may cause database failures. For example, corruption of the contacts application database may result in the loss of user contacts, while corruption of the calendar application database may lead to missed calendar reminders. To address these issues, data management provides solutions and capabilities related to data reliability and security.  

- **Backup and Recovery**: Critical business applications (e.g., banking) may experience severe anomalies due to data loss. Database backup and recovery ensure that critical data is not lost.  
- **Database Encryption**: When storing highly sensitive information such as authentication credentials or financial data, databases can be encrypted to enhance security.  
- **Database Classification and Grading**: During cross-device data synchronization, data management enforces access control based on data security labels and device security levels to ensure data security.  
- **Class E Encrypted Database**: Applications storing sensitive user information should use Class E databases. Under certain conditions (e.g., when the screen is locked), the encryption key is destroyed, rendering the Class E database inaccessible. Upon unlocking the screen, the key is restored, and normal read/write operations resume, ensuring the security of sensitive information.  

Additionally, backup databases are stored within the application's sandbox. When storage space is insufficient, local database backups can be deleted to free up space.  

## Basic Concepts  

Before developing features related to data reliability and security, familiarize yourself with the following concepts.  

### Database Backup and Recovery  

- **Database Backup**: Refers to creating a complete backup of the current database files. OpenHarmony database backup performs a full backup of all database files.  
  - Database backup can be performed without closing the database. Simply call the corresponding backup interface to complete the process.  
- **Database Recovery**: Restores the current database files from a specified backup file. Upon completion, the current database data matches the state of the backup file.  

### Database Encryption  

Database encryption involves encrypting the entire database file to enhance security and effectively protect its contents.  

### Database Classification and Grading  

Distributed data management implements classification and grading protection for data, providing access control mechanisms based on data security labels and device security levels.  

Higher data security labels and device security levels correspond to stricter encryption and access control measures, ensuring greater data security.  

## Operational Mechanisms  

### Database Backup and Recovery Mechanism  

During backup, the current database is saved to a specified file. Subsequent operations on the database do not affect the backup file. Recovery occurs only when explicitly requested, overwriting the current database with the backup file to roll back data.  

- **Key-Value Database Backup Path**: `/data/service/el1(el2)/public/database/...{appId}/kvdb/backup/...{storeId}`  
- **Relational Database Backup Path**: `/data/app/el1(el2)/100/database/...{bundlename}/rdb`  

### Database Encryption Mechanism  

In OpenHarmony, database encryption does not require developers to provide an encryption key. Instead, developers only need to set the encryption state. The system automatically encrypts the database using the [Universal Keystore System (HUKS)](../../../API_Reference/source_en/apis/UniversalKeystoreKit/cj-apis-security_huks.md), handling key generation and encryption protection.  

## Constraints  

- The database encryption key is automatically rotated once per year.  
- A maximum of 5 backups are allowed for key-value databases.  
- Automatic backup for key-value databases requires the device to be charging and the screen to be off.