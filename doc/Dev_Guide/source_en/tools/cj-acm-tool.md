# ACM Tool  

Account Manager (referred to as ACM) is a tool that enables account creation, deletion, querying, and other functionalities. It provides developers with basic capabilities to manage local accounts, such as creating and deleting accounts.  

> **Note:**  
>  
> Before using this tool, developers need to obtain the [hdc tool](../tools/cj-hdc.md) and execute `hdc shell`.  

**ACM Tool Command List**  

| Command | Description |  
| :-------- | :-------- |  
| help | Help command, displays information about commands supported by ACM. |  
| create | Create command, used to create an account. Note: Requires root privileges to use this command. |  
| delete | Delete command, used to delete an account. Note: Requires root privileges to use this command. |  
| dump | Query command, used to retrieve account-related information. Note: Requires root privileges to use this command. |  
| switch | Switch command, used to switch accounts. Note: Requires root privileges to use this command. |  
| deactivate | Deactivate command, used to deactivate an account. Note: Requires root privileges to use this command. |  
| set | Set constraints command, used to configure account constraints. Note: Requires root privileges to use this command. |  

## help  

**Usage:**  

```bash  
acm help  
```  

**Display Information**  

Displays help information related to ACM.  

## create  

**Usage:**  

```bash  
# Display help command  
acm create -h  
# Create an account with a specified name and type  
acm create -n <accountName> -t <accountType> [-s <shortName>] [-l <disallowed-install-hap-list>]  
```  

**Display Information**  

When the account is successfully created, it displays "create the local account successfully." If creation fails, the corresponding failure message is displayed.  

**Create Command Parameter List**  

| Parameter | Description |  
| :-------- | :-------------------------- |  
| -h | Optional parameter. Displays command information supported by `create`. |  
| -n | Required parameter. Specifies the name of the new account. |  
| -t | Required parameter. Specifies the account type. Account types include `admin` (administrator account), `normal` (standard account), `guest` (guest account), and `private` (private account). |  
| -s | Optional parameter. Specifies the short name of the new account. |  
| -l | Optional parameter. Specifies the preset application blacklist for the new account. |  

## delete  

**Usage:**  

```bash  
# Display help command  
acm delete -h  
# Delete an account with a specified ID  
acm delete -i <accountId>  
```  

**Display Information**  

When the account is successfully deleted, it displays "delete the local account successfully." If deletion fails, the corresponding failure message is displayed.  

**Delete Command Parameter List**  

| Parameter | Description |  
| :----- | :-------------------------- |  
| -h | Optional parameter. Displays command information supported by `delete`. |  
| -i | Required parameter. Specifies the ID of the account to be deleted. |  

## dump  

**Usage:**  

```bash  
# Display help command  
acm dump -h  
# Query information for all accounts  
acm dump -a  
# Query information for an account with a specified ID  
acm dump -i <accountId>  
```  

**Display Information**  

When the query is successful, it displays the corresponding account information. If the query fails, the corresponding failure message is displayed.  

**Query Command Parameter List**  

| Parameter | Description |  
| :------ | :-------------------------- |  
| -h | Optional parameter. Displays command information supported by `dump`. |  
| -a | Required parameter. Indicates querying information for all accounts. |  
| -i | Required parameter. Specifies the account ID to query the corresponding account information. |  

## switch  

**Usage:**  

```bash  
# Display help command  
acm switch -h  
# Switch to an account with a specified ID  
acm switch -i <accountId>  
```  

**Display Information**  

When the account switch is successful, it displays "switch the local account successfully." If the switch fails, the corresponding failure message is displayed.  

**Switch Command Parameter List**  

| Parameter | Description |  
| :---------- | :-------------------------- |  
| -h | Optional parameter. Displays command information supported by `switch`. |  
| -i | Required parameter. Specifies the ID of the account to switch to. |  

## deactivate  

**Usage:**  

```bash  
# Display help command  
acm deactivate -h  
# Deactivate all accounts  
acm deactivate -a  
# Deactivate an account with a specified ID  
acm deactivate -i <accountId>  
```  

**Display Information**  

When the account is successfully deactivated, it displays "deactivate the local account successfully." If deactivation fails, the corresponding failure message is displayed.  

**Deactivate Command Parameter List**  

| Parameter | Description |  
| :--------- | :-------------------------- |  
| -h | Optional parameter. Displays command information supported by `deactivate`. |  
| -a | Required parameter. Indicates deactivating all accounts. |  
| -i | Required parameter. Specifies the account ID to deactivate the corresponding account. |  

## set  

**Usage:**  

```bash  
# Display help command  
acm set -h  
# Set constraints for an account with a specified ID  
acm set -i <accountId> -c <constraints> [-e]  
```  

**Display Information**  

When constraints are successfully set, it displays "set constraints for the local account successfully." If setting fails, the corresponding failure message is displayed.  

**Set Constraints Command Parameter List**  

| Parameter | Description |  
| :---------- | :-------------------------- |  
| -h | Optional parameter. Displays command information supported by `set`. |  
| -i | Required parameter. Specifies the account ID. |  
| -c | Required parameter. Specifies the constraint set to be configured, with each constraint separated by ','. For detailed constraint information, refer to the account constraints list. |  
| -e | Optional parameter. Adding/omitting this option indicates adding/removing constraints. |