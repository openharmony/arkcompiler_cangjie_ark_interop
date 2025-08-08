# ATM Tool  

Access Token Manager (referred to as ATM tool) is a utility for querying <!--Del-->or configuring<!--DelEnd--> application process permissions, usage types, and other related information. It provides developers with the capability to manage access control based on token IDs, package names, process names, and other identifiers.

## Environment Setup  

Before using this tool, developers must first obtain the [hdc tool](./cj-hdc.md) and execute `hdc shell`.  

## ATM Tool Command List  

| Command    | Description |
| ------- | -----------|
| `help`    | Displays help information and lists all supported ATM commands. |
| <!--DelRow-->`perm`   | Permission command for granting or revoking permissions for application processes. |
| <!--DelRow-->`toggle` | Command for managing pop-up toggle/permission usage logging toggle status. Sets or retrieves the status of permission pop-ups/permission usage logging. This command is only available in root versions. |
| `dump` | Query command for retrieving access control-related data. |

## Help Command  

```bash  
# Display help information  
atm help  
```  

<!--Del-->  

## Permission Command  

```bash  
atm perm [-h] [-g -i <token-id> -p <permission-name>] [-c -i <token-id> -p <permission-name>]  
```  

**Permission Command Parameter List**  

| Parameter                                               | Description                  |
| :-------------------------------------------------- | :---------------------- |
| `-h`                                        | Help information. Displays the supported command set for `atm perm`. |
| `-g -i <token-id> -p <permission-name>` | Mandatory parameters (`-g`, `-i`, `-p`). Grants the specified permission to an application process via its token ID. Returns success status.    |
| `-c -i <token-id> -p <permission-name>` | Mandatory parameters (`-c`, `-i`, `-p`). Revokes the specified permission from an application process via its token ID. Returns success status.    |

Example:  

```bash  
# Display help information for `atm perm`  
atm perm -h  

# Grant camera permission to an application process  
atm perm -g -i ********* -p ohos.permission.CAMERA  

# Revoke camera permission from an application process  
atm perm -c -i ********* -p ohos.permission.CAMERA  
```  

## Pop-up Toggle Status Command  

```bash  
atm toggle [-h] [-r -s -i <user-id> -p <permission-name> -k <status>] [-r -o -i <user-id> -p <permission-name>]  
```  

**Pop-up Toggle Status Command Parameter List**  

| Parameter                                           | Description                                |
| :------------------------------------------------------- | :----------------------------------- |
| `-h`                                                     | Help information.              |
| `-r -s -i <user-id> -p <permission-name> -k <status>` | Mandatory parameters (`-r`, `-s`, `-i`, `-p`, `-k`). Sets the pop-up toggle status for a specified permission under a given user ID. Returns success status. |
| `-r -o -i <user-id> -p <permission-name>` | Mandatory parameters (`-r`, `-o`, `-i`, `-p`). Retrieves the pop-up toggle status for a specified permission under a given user ID. |

Example:  

```bash  
# Display help information for `atm toggle`  
atm toggle -h  

# Enable the pop-up toggle for camera permission under user 0  
atm toggle -r -s -i 0 -p ohos.permission.CAMERA -k 1  

# Retrieve the pop-up toggle status for camera permission under user 0  
atm toggle -r -o -i 0 -p ohos.permission.CAMERA  
```  

## Permission Usage Logging Toggle Status Command  

```bash  
atm toggle [-h] [-u -s -i <user-id> -k <status>] [-u -o -i <user-id>]  
```  

**Permission Usage Logging Toggle Status Command Parameter List**  

| Parameter                                                           | Description                                |
| :----------------------------------------------------------------- | :----------------------------------- |
| `-h`                                                     | Help information.              |
| `-u -s -i <user-id> -k <status>` | Mandatory parameters (`-u`, `-s`, `-i`, `-k`). Sets the permission usage logging toggle status under a given user ID. Returns success status. |
| `-u -o -i <user-id>` | Mandatory parameters (`-u`, `-o`, `-i`). Retrieves the permission usage logging toggle status under a given user ID. |

Example:  

```bash  
# Display help information for `atm toggle`  
atm toggle -h  

# Enable permission usage logging under user 0  
atm toggle -u -s -i 0 -k 1  

# Retrieve permission usage logging status under user 0  
atm toggle -u -o -i 0  
```  

<!--DelEnd-->  

## Query Command  

<!--RP1-->  

```bash  
atm dump [-h] [-t [-i <token-id>] [-b <bundle-name>] [-n <process-name>]] [-r [-i <token-id>] [-p <permission-name>]] [-v [-i <token-id>] [-p <permission-name>]]  
```  

<!--RP1End-->  

In the commands listed below, `-t`, <!--Del-->`-r`,<!--DelEnd--> `-v` are mandatory parameters, while `-i`, `-b`, `-n`, `-p` are optional. For `atm dump -v`, `-i` and `-p` can be combined; for <!--Del-->`atm dump -r` and<!--DelEnd--> `atm dump -v`, `-i` and `-p` can be combined; for `atm dump -t`, `-i`, `-b`, and `-n` can only be used individually.  

| Parameter  | Description    |
| ----- | ----- |
| `-h`   | Help information.        |
| `-t`  | Mandatory parameter. Queries all application process information in the system.  |
| `-t -i <token-id>`  | Optional parameter. Queries basic information and corresponding [permission details](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability_access_ctrl.md#enum-grantstatus) for an application process via its token ID. |
| `-t -b <bundle-name>`   | Optional parameter. Queries basic information and corresponding [permission details](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability_access_ctrl.md#enum-grantstatus) for an application process via its package name.    |
| `-t -n <process-name>`    | Optional parameter. Queries basic information and corresponding [permission details](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability_access_ctrl.md#enum-grantstatus) for an application process via its process name.  |
| <!--DelRow-->`-r`                        | Mandatory parameter. Queries all permission usage records in the system. |
| <!--DelRow-->`-r -i <token-id>`        | Optional parameter. Queries permission usage records for an application process via its token ID. |
| <!--DelRow-->`-r -p <permission-name>` | Optional parameter. Queries usage records for a specified permission.  |
| `-v`     | Mandatory parameter. Queries permission usage types for all application processes in the system.   |
| `-v -i <token-id>` | Optional parameter. Queries permission usage types for an application process via its token ID.  |
| `-v -p <permission-name>`   | Optional parameter. Queries usage types for a specified permission.   |

Example:  

```bash  
# Query all permission definitions in the system  
atm dump -d  

# Query permission definitions by permission name  
atm dump -d -p *********  
# Execution result:  
# {  
#     "permissionName": "ohos.permission.KERNEL_ATM_SELF_USE",  
#     "grantMode": SYSTEM_GRANT,  
#     "availableLevel": SYSTEM_CORE,  
#     "availableType": SYSTEM,  
#     "provisionEnable": true,  
#     "distributedSceneEnable": true,  
#     "isKernelEffect": true,  
#     "hasValue": true,  
# }  

# Display help information for `atm dump`  
atm dump -h  

# Query token IDs and package names for all application processes in the system  
atm dump -t  

# Query permission information by token ID  
atm dump -t -i *********  
# Execution result:  
# {  
#   "tokenID": 672078897,  
#   "processName": "samgr",  
#   "apl": 2,  
#   "permStateList": [  
#     {  
#       "permissionName": "ohos.permission.DISTRIBUTED_DATASYNC",  
#       "grantStatus": 0,  
#       "grantFlag": 4,  
#     }  
#   ]  
# }  

# Query permission information by package name  
atm dump -t -b ohos.telephony.resources  
# Execution result:  
# {  
#   "tokenID": 537280686,  
#   "tokenAttr": 1,  
#   "ver": 1,  
#   "userId": 100,  
#   "bundleName": "ohos.telephony.resources",  
#   "instIndex": 0,  
#   "dlpType": 0,  
#   "isRemote": 0,  
#   "isPermDialogForbidden": 0,  
#   "permStateList": [  
#     {  
#       "permissionName": "ohos.permission.DISTRIBUTED_DATASYNC",  
#       "grantStatus": 0,  
#       "grantFlag": 4,  
#     }  
#   ]  
# }  

# Query permission information by process name  
atm dump -t -n *********  

# Query permission usage types for all applications  
atm dump -v  
# Execution result:  
# {  
#   "tokenId": 537088946,  
#   "permissionName": ohos.permission.GET_INSTALLED_BUNDLE_LIST,  
#   "usedType": 0,  
# }  

# Query permission usage types by token ID  
atm dump -v -i *********  

# Query permission usage types by permission name  
atm dump -v -p ohos.permission.CAMERA  

# Query permission usage types by token ID and permission name  
atm dump -v -i ********* -p ohos.permission.CAMERA  
```  

<!--Del-->  

```bash  
# Query all permission usage records in the system  
atm dump -r  
# Execution result:  
# {  
#   "beginTime": 1501837281916,  
#   "endTime": 1501837281916,  
#   "bundleRecords": [  
#     {  
#       "tokenId": 537088946,  
#       "isRemote": 0,  
#       "bundleName": com.ohos.permissionmanager,  
#       "permissionRecords": [  
#         {  
#           "permissionName": "ohos.permission.GET_INSTALLED_BUNDLE_LIST",  
#           "accessCount": "1",  
#           "secAccessCount": "0",  
#           "rejectCount": 0,  
#           "lastAccessTime": 1501837281916,  
#           "lastRejectTime": 0,  
#           "lastAccessDuration": 0,  
#           "accessRecords": [  
#             {  
#               "status": "1",  
#               "lockScreenStatus": "1",  
#               "timestamp": "1501837281916",  
#               "duration": 0,  
#               "count": 1,  
#               "usedType": 0,  
#             },  
#           ]  
#           "rejectRecords": [  
#           ]  
#         },  
#       ]  
#     }  
#   ]  
# }  

# Query permission usage records by token ID  
atm dump -r -i *********  

# Query permission usage records by permission name  
atm dump -r -p ohos.permission.CAMERA  

# Query permission usage records by token ID and permission name  
atm dump -r -i ********* -p ohos.permission.CAMERA  
```  

<!--DelEnd-->