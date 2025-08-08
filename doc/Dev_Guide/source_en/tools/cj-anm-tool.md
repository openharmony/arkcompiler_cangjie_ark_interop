# anm Tool  

Advanced Notification Manager (referred to as anm) is a tool designed to implement notification printing, configure notification parameters, and provide developers with basic notification debugging and testing capabilities. These include printing detailed information of published notifications, setting the number of cached notifications, enabling notifications, and more.  

## Environment Requirements  

Before using this tool, developers need to obtain the <!--Del-->[<!--DelEnd-->hdc tool<!--Del-->](https://docs.openharmony.cn/pages/v5.1/zh-cn/device-dev/subsystems/subsys-toolchain-hdc-guide.md)<!--DelEnd--> and execute `hdc shell`.  

Currently, this tool is only supported in the eng version. Using it in the user version will result in the error: `error: user version cannot use setting`.  

## anm Tool Command List  

| Command | Description |  
| ------- | ---------- |  
| `help`  | Help command, used to display anm-related help information. |  
| `dump`  | Print command, used to print notification-related information. |  
| `setting` | Configuration command, used to set notification parameters. |  

## Help Command (`help`)  

```bash  
# Display anm-related help information  
anm help  
```  

## Print Command (`dump`)  

```bash  
# Print notification-related information  
anm dump [<options>]  
```  

**Print Command Parameter List:**  

| Parameter | Description |  
| ----------------- | ----------- |  
| `-A/--active`     | Print all active notification information. |  
| `-R/--recent`     | Print recent notification information. |  
| `-D/--distributed` | Print distributed notification information from other devices. |  
| `-b/--bundle`     | Optional parameter: specify a bundle name for printing. |  
| `-u/--user-id`    | Optional parameter: specify a user ID for printing. |  
| `-h/--help`       | Help information. |  

**Example:**  

```bash  
# Print active notification information  
anm dump -A  
```  

## Configuration Command (`setting`)  

```bash  
# Set notification parameters  
anm setting [<options>]  
```  

**Configuration Command Parameter List:**  

| Parameter | Description |  
| --------------------- | ----------- |  
| `-c/--recent-count`   | Set the maximum number of recent notifications stored in memory. |  
| `-e/--enable-notification` | Set the notification enable/disable switch. |  
| `-h/--help`           | Help information. |  

**Example:**  

```bash  
# Set the maximum number of recent notifications stored in memory to 100  
anm setting -c 100  
```