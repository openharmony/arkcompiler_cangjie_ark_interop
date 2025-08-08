# 二次向用户申请授权

当应用通过[requestPermissionsFromUser()](../../../../API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-ability_access_ctrl.md#func-requestpermissionsfromuserstagecontext-arraypermissions-asynccallbackaccessctrlpermissionrequestresult)拉起弹框[请求用户授权](./cj-request-user-authorization.md)时，用户拒绝授权，应用将无法再次通过requestPermissionsFromUser()拉起弹框，需要用户在系统应用“设置”的界面中，手动授予权限。

在“设置”应用中的路径：

<!--RP1-->
隐私 > 权限管理 > *权限类型（如位置信息）* > *具体应用*
<!--RP1End-->

效果展示：

<!--RP2-->
![zh-cn_image_location](figures/zh-cn_image_location_second.png)
<!--RP2End-->

以下示例代码以再次拉起弹窗申请ohos.permission.APPROXIMATELY_LOCATION权限为例。

1. 获取context

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
            // 获取context
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

2. 申请权限

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
