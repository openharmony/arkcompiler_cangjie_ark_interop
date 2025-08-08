# Requesting User Authorization Again

When an application triggers a pop-up dialog to [request user authorization](./cj-request-user-authorization.md) via [requestPermissionsFromUser()](../../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability_access_ctrl.md#func-requestpermissionsfromuserstagecontext-arraypermissions-asynccallbackaccessctrlpermissionrequestresult), and the user denies the authorization, the application cannot trigger the pop-up dialog again using requestPermissionsFromUser(). Instead, the user must manually grant the permission in the system "Settings" application.

Path in the "Settings" application:

<!--RP1-->
Privacy > Permission Management > *Permission Type (e.g., Location)* > *Specific Application*
<!--RP1End-->

Visual demonstration:

The following example code demonstrates how to request the ohos.permission.APPROXIMATELY_LOCATION permission again by triggering the pop-up dialog.

1. Obtain the context

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

2. Request permissions

    <!-- compile -->

    ```cangjie
    // index.cj
    import kit.UIKit.AsyncError
    import kit.AbilityKit.*

    func getContext(): UIAbilityContext {
        match(globalAbilityContext) {
            case Some(context) => context
            case _ => throw Exception("can not get globalAbilityContext.")
        }
    }

    func requestPermissons(): Unit {
        var resCallback = {
            errorCode: Option<AsyncError>, data: Option<Array<GrantStatus>> => match (errorCode) {
                case Some(e) => AppLog.info("CallBack request error: errcode is ${e.code}")
                case _ =>
                    match (data) {
                        case Some(value) =>
                            for (i in (0..value.size)) {
                                AppLog.info("CallBack GrantStatus: ${value[i].toString()}")
                            }
                        case _ => AppLog.info("CallBack request error: data is null")
                    }
            }
        }
        let atManager = AbilityAccessCtrl.createAtManager()
        atManager.requestPermissionOnSetting(getContext(), ["ohos.permission.APPROXIMATELY_LOCATION"], resCallback)
    }
    ```