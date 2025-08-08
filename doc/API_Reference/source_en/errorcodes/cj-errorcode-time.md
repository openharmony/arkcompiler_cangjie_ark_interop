# Time and Timezone Service Error Codes

## -1 Time and Timezone Service Exception

**Error Message**

  The parameter check failed or permission denied or system error.

**Error Description**

Parameter validation failed, permission verification failed, or time and timezone service exception.

**Possible Causes**

This error code represents a generic error code. The specific exception can be determined based on the error message. Possible causes include:

1. Parameter validation failed - invalid parameters were passed.
2. Permission verification failed - permissions are not configured. The application setting time lacks ohos.permission.SET_TIME configuration or the timezone setting lacks ohos.permission.SET_TIME_ZONE configuration.
3. System runtime exception - kernel generic errors such as memory allocation or multithreading processing failures.

**Resolution Steps**

1. For parameter validation failure: Check whether parameters are passed as required.
2. For permission verification failure: Configure ohos.permission.SET_TIME for application time setting or ohos.permission.SET_TIME_ZONE for timezone setting.
3. For system runtime exception: Verify whether sufficient memory is available.