# Requesting User Authorization

When an application needs to access user privacy information or utilize system capabilities—such as obtaining location data, accessing calendars, using the camera to take photos, or recording videos—it must request user authorization. These permissions are classified as `user_grant` permissions.

When an application requests `user_grant` permissions, the following steps must be completed:

1. Declare the required permissions in the configuration file.

2. Associate the target objects in the application with the corresponding permissions to ensure users clearly understand which operations require granting specific permissions.

   For these two steps, refer to the section [Declaring Permissions](./cj-declare-permissions.md).

3. During runtime, when a user triggers an operation that accesses the target object, the application should invoke the appropriate interface to precisely trigger the dynamic authorization dialog. This interface internally checks whether the user has already granted the required permissions. If not, it will display the dynamic authorization dialog to request user authorization.

4. Verify the user's authorization result. Proceed with further operations only after confirming the user has granted permission.

This section explains how to complete steps 3 and 4.

## Constraints and Limitations

- Authorization for `user_grant` permissions must adhere to the principle of user awareness and control. Applications must actively invoke the system's dynamic permission request interface during runtime. The system dialog prompts the user for authorization, allowing them to assess the reasonableness of the requested sensitive permissions based on the application's operational context and make an informed decision.
  
- The system discourages frequent pop-ups that disrupt the user experience. If a user denies authorization, the dialog cannot be displayed again. The application must guide the user to manually grant permissions in the system "Settings" app.
  
- System permission dialogs must not be obscured.

  System permission dialogs must not be blocked by other components/controls. The dialog content must be fully displayed so users can recognize and complete the authorization action.

  If a system permission dialog and other components/controls appear simultaneously in the same location, the permission dialog will overlay the other components/controls by default.

- Before performing any operation requiring a target permission, the application must verify whether it already has the permission.

  To check if the user has granted a specific permission to your application, use the [`checkAccessToken()`](../../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability_access_ctrl.md#func-checkaccesstokenuint32-permissions) function. This method returns either [`PERMISSION_GRANTED`](../../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability_access_ctrl.md#enum-grantstatus) or [`PERMISSION_DENIED`](../../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability_access_ctrl.md#enum-grantstatus). Refer to the example below for details.

- Before accessing any interface protected by a target permission, use the [`requestPermissionsFromUser()`](../../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability_access_ctrl.md#func-requestpermissionsfromuserstagecontext-arraypermissions-asynccallbackaccessctrlpermissionrequestresult) interface to request the corresponding permission.

  Users may revoke granted permissions via system settings after dynamic authorization. Therefore, do not persist previously granted authorization states.

- When requesting authorization in the `onWindowStageCreate()` callback, ensure the asynchronous interfaces `loadContent()`/`setUIContent()` have completed execution or call [`requestPermissionsFromUser()`](../../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability_access_ctrl.md#func-requestpermissionsfromuserstagecontext-arraypermissions-asynccallbackaccessctrlpermissionrequestresult) within their callbacks. Otherwise, `requestPermissionsFromUser` will fail if called before content loading completes.
  <!--RP1--><!--RP1End-->

## Development Steps

The following example demonstrates how to request location permissions.

**Effect Demonstration:**

1. Request the `ohos.permission.LOCATION` and `ohos.permission.APPROXIMATELY_LOCATION` permissions. For configuration details, refer to [Declaring Permissions](./cj-declare-permissions.md).

2. Verify current authorization status.

   Before requesting permissions, check whether the application has already been granted the permissions. Use the [`checkAccessToken()`](../../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability_access_ctrl.md#func-checkaccesstokenuint32-permissions) method to verify the current authorization status. If permissions are granted, proceed with the target operation. Otherwise, proceed to the next step: requesting user authorization.

   <!-- compile -->

   ```cangjie
   import kit.AbilityKit.{Permissions, AbilityAccessCtrl, GrantStatus, BundleManager, BundleFlag}

   func checkPermissionGrant(permission: Permissions): GrantStatus {
       try {
           // Obtain the application's accessTokenID
           let tokenID = BundleManager.getBundleInfoForSelf(GET_BUNDLE_INFO_WITH_APPLICATION.getValue()).appInfo.accessTokenId
           let atManager = AbilityAccessCtrl.createAtManager()
           // Verify whether the application has been granted the permission
           return atManager.checkAccessToken(tokenID, permission)
       } catch(e: Exception) {
           AppLog.error("checkAccessToken Exception: ${e}")
           throw e
       }
   }

   func checkPermissions(): Unit {
       let grantStatus1: Bool = (checkPermissionGrant("ohos.permission.LOCATION") == GrantStatus.PERMISSION_GRANTED)
       let grantStatus2: Bool = (checkPermissionGrant("ohos.permission.APPROXIMATELY_LOCATION") == GrantStatus.PERMISSION_GRANTED)
       // The precise location permission (`ohos.permission.LOCATION`) can only be requested alongside the approximate location permission (`ohos.permission.APPROXIMATELY_LOCATION`) or if the approximate location permission is already granted.
       if (grantStatus2 && !grantStatus1) {
           // Approximate location permission granted, precise location permission not granted
           AppLog.info("Only APPROXIMATELY_LOCATION is granted")
       } else if (!grantStatus1 && !grantStatus2) {
           // Neither approximate nor precise location permissions granted. Request both or only the approximate location permission.
           AppLog.info("LOCATION and APPROXIMATELY_LOCATION not granted")
       } else {
           // Permissions granted; proceed with the target operation
           AppLog.info("LOCATION and APPROXIMATELY_LOCATION are granted")
       }
   }
   ```

3. Dynamically request user authorization.

   Dynamic permission requests involve prompting the user for authorization during runtime. Use the [`requestPermissionsFromUser()`](../../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability_access_ctrl.md#func-requestpermissionsfromuserstagecontext-arraypermissions-asynccallbackaccessctrlpermissionrequestresult) method, which accepts a list of permissions (e.g., location, calendar, camera, microphone). The user can choose to grant or deny the request.

   You can invoke [`requestPermissionsFromUser()`](../../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability_access_ctrl.md#func-requestpermissionsfromuserstagecontext-arraypermissions-asynccallbackaccessctrlpermissionrequestresult) in the `onWindowStageCreate()` callback of an Ability or request authorization via the UI based on business needs.

   When requesting authorization in the `onWindowStageCreate()` callback, ensure the asynchronous interfaces `loadContent()`/`setUIContent()` have completed execution or call [`requestPermissionsFromUser()`](../../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability_access_ctrl.md#func-requestpermissionsfromuserstagecontext-arraypermissions-asynccallbackaccessctrlpermissionrequestresult) within their callbacks. Otherwise, `requestPermissionsFromUser` will fail if called before content loading completes.

   <!--RP1--><!--RP1End-->

   <!--RP2-->

   - Request authorization in a UIAbility.

     <!-- compile -->

     ```cangjie
     // main_ability.cj
     import kit.UIKit.AsyncError
     import kit.AbilityKit.*

     class MainAbility <: UIAbility {
         // ...
         public override func onWindowStageCreate(windowStage: WindowStage): Unit {
             AppLog.info("MainAbility onWindowStageCreate.")
             windowStage.loadContent("EntryView")
             // Set callback
             var resultCallback = {
                 errorCode: Option<AsyncError>, data: Option<AccessCtrlPermissionRequestResult> => match (errorCode) {
                     case Some(e) => AppLog.error("requestPermissionsFromUser failed, errcode: ${e.code}")
                     case _ =>
                         match (data) {
                             case Some(value) =>
                                 for (i in (0..value.permissions.size)) {
                                     if (value.authResults[i] == 0) {
                                         // User granted permission
                                         AppLog.info("permission: ${value.permissions[i]} is granted.")
                                     } else {
                                         // User denied permission. Notify the user that authorization is required for current functionality and guide them to system settings.
                                         AppLog.info("permission: ${value.permissions[i]} is denied by user.")
                                     }
                                 }
                             case _ => AppLog.error("requestPermissionsFromUser error: data is null")
                         }
                 }
             }
             let permissionList = ["ohos.permission.LOCATION", "ohos.permission.APPROXIMATELY_LOCATION"]
             let atManager = AbilityAccessCtrl.createAtManager()
             // Request permissions. `requestPermissionsFromUser` checks the current authorization status to determine whether to display the dialog.
             atManager.requestPermissionsFromUser(getStageContext(this.context), permissionList, resultCallback)
         }
     }
     ```

   - Request authorization in the UI.

     1. Obtain the context.

        <!-- compile -->

        ```cangjie
        // main_ability.cj
        import kit.AbilityKit.*

        var globalAbilityContext: Option<UIAbilityContext> = Option<UIAbilityContext>.None

        class MainAbility <: UIAbility {
            public init() {
                super()
                registerSelf()
            }

            public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
                AppLog.info("MainAbility OnCreated.${want.abilityName}")
                // Obtain the context
                globalAbilityContext = Option<UIAbilityContext>.Some(this.context)
                match (launchParam.launchReason) {
                    case LaunchReason.START_ABILITY => AppLog.info("START_ABILITY")
                    case _ => ()
                }
            }

            public override func onWindowStageCreate(windowStage: WindowStage): Unit {
                AppLog.info("MainAbility onWindowStageCreate.")
                windowStage.loadContent("EntryView")
            }
        }
        ```

     2. Request permissions.

        <!-- compile -->

        ```cangjie
        // index.cj
        import kit.AbilityKit.*
        import kit.UIKit.AsyncError

        @Entry
        @Component
        class EntryView {
            // Obtain the context
            func getContext(): UIAbilityContext {
                match(globalAbilityContext) {
                    case Some(context) => context
                    case _ => throw Exception("can not get globalAbilityContext.")
                }
            }
            // Request permissions
            func requestPermissons(): Unit {
                var resultCallback = {
                    errorCode: Option<AsyncError>, data: Option<AccessCtrlPermissionRequestResult> => match (errorCode) {
                        case Some(e) => AppLog.info("permissionResultCallBack request error: errcode: ${e.code}")
                        case _ =>
                            match (data) {
                                case Some(value) =>
                                    for (i in (0..value.permissions.size)) {
                                        if (value.authResults[i] == 0) {
                                            // User granted permission
                                            AppLog.info("permission: ${value.permissions[i]} is granted.")
                                        } else {
                                            // User denied permission. Notify the user that authorization is required for current functionality and guide them to system settings.
                                            AppLog.info("permission: ${value.permissions[i]} is denied by user.")
                                        }
                                    }
                                case _ => AppLog.info("permissionResultCallBack request error: data is null")
                            }
                    }
                }
                let atManager = AbilityAccessCtrl.createAtManager()
                let stageContext = getStageContext(getContext())
                let permissionList = ["ohos.permission.LOCATION", "ohos.permission.APPROXIMATELY_LOCATION"]
                atManager.requestPermissionsFromUser(stageContext, permissionList, resultCallback)
            }

            func build() {
                Row {
                    Column {
                        Button("requestPermissons").onClick {
                            evt => AppLog.info("Hello Cangjie")
                            // Request permissions on button click
                            requestPermissons()
                        }.fontSize(30).height(50)

                    }.width(100.percent)
                }.height(100.percent)
            }
        }
        ```

   <!--RP2End-->

4. Handle authorization results.

   After invoking [`requestPermissionsFromUser()`](../../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability_access_ctrl.md#func-requestpermissionsfromuserstagecontext-arraypermissions-asynccallbackaccessctrlpermissionrequestresult), the application waits for the user's response. If the user grants permission, proceed with the target operation. If denied, notify the user that authorization is required for current functionality and guide them to the system "Settings" app to enable the permissions.
   <!--RP3-->

   Path: Settings > Privacy > Permission Management > Apps > Target App<!--RP3End-->