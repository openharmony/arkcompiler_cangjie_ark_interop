/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package ohos.app.ability.want

import std.collection.HashMap
import ohos.base.*
import ohos.element_name.ElementName
import ohos.encoding.json.*
import ohos.labels.*

protected type WantHandle = UIntNative
type ElementNameHandle = UIntNative

const NULL_PTR: UIntNative = 0

@C
struct CJWantParams {
    CJWantParams(
        let elementName: ElementNameHandle,
        let flags: UInt32,
        let uri: CString,
        let action: CString,
        let entities: VectorStringHandle,
        let wantType: CString,
        let parameters: CString
    ) {}
}

foreign func FFICJWantDelete(want: WantHandle): Unit

foreign func FFICJWantGetWantInfo(want: WantHandle): CPointer<CJWantParams>

foreign func FFICJWantParamsDelete(params: CPointer<CJWantParams>): Unit

foreign func FFICJWantCreateWithWantInfo(params: CJWantParams): WantHandle

foreign func FFICJWantParseUri(uri: CString): WantHandle

foreign func FFICJWantAddEntity(want: WantHandle, entity: CString): Unit

/**
 * Want is a carrier for information transfer between objects (application components).
 * Want can be used as a parameter of startAbility to specify a startup target and information that needs to be carried
 * during startup, for example, bundleName and abilityName, which respectively indicate the bundle name of the target
 * ability and the ability name in the bundle.
 * When UIAbilityA needs to start UIAbilityB and transfer some data to UIAbilityB, it can use Want a carrier to
 * transfer the data.
 *
 * @relation export default class Want
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityBase"
]
public class Want {
    private var elementName_: ElementName
    private var paramJsonObj_: JsonObject

    /**
    * ID of the device running the ability.
    * If this field is unspecified, the local device is used.
    *
    * @relation deviceId?: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var deviceId: String

    /**
    * Bundle name of the ability.
    *
    * @relation bundleName?: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var bundleName: String

    /**
    * Name of the ability.
    * If both bundleName and abilityName are specified in a Want object, the Want object can match a specific ability.
    * The value of abilityName must be unique in an application.
    * 
    * @relation abilityName?: string
   */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var abilityName: String

    /**
    * Name of the module to which the ability belongs.
    * If the ability belongs to a HAR module, moduleName must be set to the name of the HAP or HSP module that
    * depends on this HAR.
    *
    * @relation moduleName?: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var moduleName: String

    /**
    * How the Want object will be handled. By default, a number is passed in.
    * For example, wantConstant.Flags.FLAG_ABILITY_CONTINUATION specifies whether to start the ability in cross-device
    * migration scenarios.
    *
    * @relation flags?: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var flags: UInt32

    /**
    * Data carried.
    * This field is used together with type to specify the data type.
    * If uri is specified in a Want, the Want will match the specified URI information, including scheme,
    * schemeSpecificPart, authority, and path.
    *
    * @relation uri?: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var uri: String

    /**
    * Action to take, such as viewing and sharing application details.
    * In implicit Want, you can define this field and use it together with uri or parameters to specify the operation
    * to be performed on the data.
    *
    * @relation action?: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var action: String

    /**
    * Additional category information (such as browser and video player) of the ability.
    * It is a supplement to the action field for implicit Want. and is used to filter ability types.
    *
    * @relation entities?: Array<string>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var entities: Array<String>

    /**
    * MIME type, that is, the type of the file to open.
    *
    * @relation type?: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var `type`: String

    /**
    * List of parameters in the Want object.
    * 
    * 1. The values of the following keys are assigned by the system. Manual settings do not take effect, since the
    * system automatically changes the values to the actual values during data transfer.
    * -ohos.aafwk.param.callerPid: PID of the caller. The value is a string.
    * -ohos.aafwk.param.callerBundleName: bundle name of the caller. The value is a string.
    * -ohos.aafwk.param.callerAbilityName: ability name of the caller. The value is a string.
    * -ohos.aafwk.param.callerNativeName: process name of the caller when the native method is called. The value is
    * a string.
    * -ohos.aafwk.param.callerAppId: appId of the caller. The value is a string.
    * -ohos.aafwk.param.callerAppIdentifier: appIdentifier of the caller. The value is a string.
    * -ohos.aafwk.param.callerToken: token of the caller. The value is a string.
    * -ohos.aafwk.param.callerUid: UID in BundleInfo, that is, the application's UID in the bundle information. The
    * value is a number.
    * -ohos.param.callerAppCloneIndex: clone index of the caller. The value is of the numeric type.
    * -component.startup.newRules: enabled status of the new control rule. The value is of the Boolean type.
    * -moduleName: module name of the caller. The value is a string.
    * -ability.params.backToOtherMissionStack: support for redirection back across mission stacks. The value is of
    * the Boolean type.
    * -ohos.ability.params.abilityRecoveryRestart: support for ability restart upon fault recovery. The value is of
    * the Boolean type.
    * -ohos.extra.param.key.contentTitle: title that can be shared by the atomic service. The value is a string.
    * -ohos.extra.param.key.shareAbstract: content that can be shared by the atomic service. The value is a string.
    * -ohos.extra.param.key.shareUrl: URL of the content that can be shared by the atomic service. The value is
    * a string.
    * -ohos.extra.param.key.supportContinuePageStack: support for migration of page stack information during
    * cross-device migration. The value is of the Boolean type. The default value is true, indicating that page stack
    * information is automatically migrated.
    * -ohos.extra.param.key.supportContinueSourceExit: support for application exit on the source device during
    * cross-device migration. The value is of the Boolean type. The default value is true, indicating that the
    * application on the source device automatically exits.
    * -ohos.extra.param.key.showMode: mode to show the atomic service startup. The value is an enumerated value of
    * wantConstant.ShowMode.
    * -ohos.dlp.params.sandbox: available only for DLP files. This key is involved only in system applications.
    * -ohos.dlp.params.bundleName: bundle name of DLP. The value is a string. This key is involved only in system
    * applications.
    * -ohos.dlp.params.moduleName: module name of DLP. The value is a string. This key is involved only in system
    * applications.
    * -ohos.dlp.params.abilityName: ability name of DLP. The value is a string. This key is involved only in system
    * applications.
    * -ohos.dlp.params.index: DLP index. The value is a number. This key is involved only in system applications.
    * -ohos.ability.params.asssertFaultSessionId: session ID of the fault assertion. The value is a string. This key
    * is involved only in system applications.
    * 
    * 2. The following keys are defined by the system, and their values need to be manually assigned.
    * -ability.params.stream: File URIs to be authorized to the target ability. The value is a file URI array of the
    * string type.
    * -ohos.extra.param.key.appCloneIndex: index of the application clone.
    * 
    * 3. In addition to the foregoing cases, applications may further agree on the key-value pairs to transfer.
    * 
    * For details about the constants of Params in want, see wantConstant.
    * Note that a maximum of 200 KB data that can be transferred by using WantParams. If the data volume exceeds
    * 200 KB, transfer data in WriteRawDataBuffer or uri mode.
    * The values of parameters must be of the following basic data types: String, Number, Boolean, Object,
    * undefined, and null. Functions in an object cannot be transferred.
    *
    * @relation parameters?: Record<string, Object>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public var parameters: HashMap<String, WantValueType>

    /**
    * Want constructor.
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public init(
        deviceId!: String = "",
        bundleName!: String = "",
        abilityName!: String = "",
        moduleName!: String = "",
        flags!: UInt32 = 0,
        uri!: String = "",
        action!: String = "",
        entities!: Array<String> = [],
        `type`!: String = "",
        parameters!: HashMap<String, WantValueType> = HashMap<String, WantValueType>()
    ) {
        this.elementName_ = ElementName(bundleName, abilityName, deviceId: deviceId, moduleName: moduleName)
        this.deviceId = deviceId
        this.bundleName = bundleName
        this.abilityName = abilityName
        this.moduleName = moduleName
        this.flags = flags
        this.uri = uri
        this.action = action
        this.entities = entities
        this.`type` = `type`
        this.parameters = parameters
        this.paramJsonObj_ = mapToJsonObject(parameters)
    }

    // Attention: Do not modify the wantHandle on the native side. Otherwise, inconsistency may occur.
    protected init(wantHandle: WantHandle) {
        if (wantHandle == NULL_PTR) {
            throw IllegalArgumentException("no such wantHandle")
        }
        var paramsHandle = unsafe { FFICJWantGetWantInfo(wantHandle) }
        let params = unsafe { paramsHandle.read() }

        var entitiesHandle = params.entities
        var unsafeEntities = FFIVectorString(entitiesHandle)
        var entitiesSize = unsafeEntities.getSize()

        this.elementName_ = ElementName(params.elementName)
        this.deviceId = elementName_.deviceId
        this.bundleName = elementName_.bundleName
        this.abilityName = elementName_.abilityName
        this.moduleName = elementName_.moduleName
        this.flags = params.flags
        this.uri = params.uri.toString()
        this.action = params.action.toString()
        this.entities = Array<String>(entitiesSize, repeat: "")
        for (i in 0..entitiesSize) {
            this.entities[i] = unsafeEntities.getElement(i)
        }
        this.`type` = params.wantType.toString()
        this.paramJsonObj_ = jsonStringUnWrapper(params.parameters.toString())
        this.parameters = mapFromJsonObject(paramJsonObj_)

        unsafe { FFICJWantParamsDelete(paramsHandle) }
    }

    // available only for this package.
    protected unsafe static func releaseWantHandle(wantHandle: WantHandle): Unit {
        FFICJWantDelete(wantHandle)
    }

    // available only for this package.
    protected func createWantHandle(): WantHandle {
        var wantHandle: WantHandle = NULL_PTR
        unsafe {
            try (
                unsafeUri = LibC.mallocCString(uri).asResource(),
                unsafeAction = LibC.mallocCString(action).asResource(),
                unsafeType = LibC.mallocCString(`type`).asResource(),
                unsafeParameters = LibC.mallocCString(jsonObjectWrapper(paramJsonObj_).toString()).asResource()
            ) {
                let elementNameHandle = this.elementName_.createElementNameHandle()
                // Entities handled later.
                let param = CJWantParams(elementNameHandle, flags, unsafeUri.value, unsafeAction.value,
                    VectorStringHandle(), unsafeType.value, unsafeParameters.value)
                wantHandle = FFICJWantCreateWithWantInfo(param)
                ElementName.release(elementNameHandle)
                if (wantHandle == NULL_PTR) {
                    throw IllegalArgumentException("Invalid wantHandle")
                }
                for (entity in entities) {
                    var value = LibC.mallocCString(entity)
                    FFICJWantAddEntity(wantHandle, value)
                    LibC.free(value)
                }
            }
        }
        return wantHandle
    }
}
