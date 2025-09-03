# Upload/Download Error Codes

> **Note:**
>
> The following describes only the module-specific error codes. For general error codes, please refer to the [Universal Error Code Documentation](cj-errorcode-universal.md).

## 13400001 File Operation Error

**Error Message**

File operation error.

**Error Description**

Insufficient file permissions or operation failure when calling the uploadFile or downloadFile interface.

**Possible Causes**

This error code indicates a file operation exception, possibly due to insufficient file permissions.

**Resolution Steps**

Please check whether the file permissions are properly configured.

## 13400002 Invalid File Path

**Error Message**

Bad file path.

**Error Description**

The file path is invalid or the file already exists at the specified path when calling the uploadFile or downloadFile interface.

**Possible Causes**

This error code indicates an invalid file path, possibly due to an incorrect path or an existing file at the specified location.

**Resolution Steps**

Please verify the file path for upload/download operations.

## 13400003 Service Error

**Error Message**

Task service ability error.

**Error Description**

Failure of the background service for download tasks when calling the downloadFile interface.

**Possible Causes**

This error code indicates a service exception, possibly due to task creation failure.

**Resolution Steps**

Please check whether the task configuration is correct.

## 13499999 Other Errors

**Error Message**

other error.

**Error Description**

A special error occurred when calling the uploadFile or downloadFile interface.

**Possible Causes**

This error code indicates a service exception, possibly due to task creation failure.

**Resolution Steps**

Please check whether the task configuration is correct.

## 21900004 Application Task Queue Full

**Error Message**

application task queue full error.

**Error Description**

The application task queue is full.

**Possible Causes**

The application failed to create a background task (foreground tasks directly preempt resources and do not involve the work queue).

**Resolution Steps**

1. Query all background tasks of the application through the retrieval interface.  
2. Actively clean up and release quotas.  
3. Recreate the background task.

## 21900005 Task Mode Error

**Error Message**

task mode error.

**Error Description**

Incorrect task mode.

**Possible Causes**

A non-foreground application attempted to create a foreground task.

**Resolution Steps**

1. Register or unregister event listeners for foreground applications.  
2. This is an interface restriction—follow the interface specifications.

## 21900006 Non-Existent Task Operation Error

**Error Message**

task not found error.

**Error Description**

Operation on a non-existent task.

**Possible Causes**

Attempting to delete or query a non-existent task.

**Resolution Steps**

1. Query existing tasks through the retrieval interface.  
2. Confirm whether the queried task exists (the system periodically cleans up garbage tasks).  
3. Retry the operation with the correct task ID.

## 21900007 Unsupported State Operation

**Error Message**

task state error.

**Error Description**

Operation on a task in an unsupported state.

**Possible Causes**

1. Starting a deleted task;  
2. Starting a non-initialized task;  
3. Pausing a non-running task;  
4. Resuming a non-paused task;  
5. Stopping a non-running task.

**Resolution Steps**

1. Query the task state;  
2. Perform operations supported by the current task state.