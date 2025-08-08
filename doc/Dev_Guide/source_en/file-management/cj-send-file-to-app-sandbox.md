# Pushing Files to Application Sandbox  

During application development and debugging, developers may need to push certain files into the application sandbox for access or testing within the app. There are two approaches to achieve this:  

1. **Using DevEco Studio**: Files can be placed into the application installation path via DevEco Studio. For details, refer to [Accessing Application Installation Resources](../cj-start/start/ide-resource-categories-and-access.md#resource-access).  

2. **Using the hdc Tool**: When a device environment is available, a more flexible method is to use the `hdc` tool to push files to the application sandbox path on the device. This document focuses on this approach.  

However, the file paths observed under the debugging process via `hdc shell` differ from the application sandbox paths from the app's perspective. Developers must first understand the mapping between application sandbox paths and actual physical paths.  

## Development Example  

Take the application package `com.ohos.example` as an example. If reading or writing files in the application sandbox path `/data/storage/el1/bundle`, the corresponding physical path is `/data/app/el1/bundle/public/<PACKAGENAME>`, i.e., `/data/app/el1/bundle/public/com.ohos.example`.  

Example command for pushing files:  

```shell  
hdc file send ${local_path_to_file} /data/app/el1/bundle/public/com.ohos.example/  
```  

After pushing the file, set the file's `user_id` and `group_id` to the application's `user_id`. To query the application's `user_id`, use the following command (the first column in the process line represents the application process's `user_id`):  

```shell  
hdc shell ps -ef | grep com.ohos.example  
```  

Use the application process's `user_id` to set the file's `user_id` and `group_id` with the following command:  

```shell  
hdc shell chown ${user_id}:${user_id} ${file_path}  
```  

## Switching to Application Sandbox Perspective  

During debugging, if permission issues or missing files occur, developers need to switch from the debugging process perspective to the application perspective to intuitively analyze permission and directory issues. Use the following commands to switch perspectives:  

```shell  
hdc shell                         // Enter shell  
ps -ef | grep [hapName]           // Find the corresponding application's pid using the ps command  
nsenter -t [hapPid] -m /bin/sh    // Enter the application's sandbox environment using the pid found in the previous step  
```  

After execution, the perspective switches to the application sandbox view, where directory paths reflect the sandbox paths. This allows troubleshooting of sandbox path-related issues.