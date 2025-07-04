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

package ohos.form.form_info

import std.deriving.Derive
import std.collection.HashMap
import ohos.labels.*

/**
 * Provides state about a form.
 *
 * @relation enum FormState
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.Form"
]
@Derive[ToString, Equatable]
public enum FormState {
    /**
     * Indicates that the form status is unknown due to an internal error.
     *
     * @relation UNKNOWN = -1;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    Unknown
    /**
     * Indicates that the form is in the default state.
     *
     * @relation DEFAULT = 0;
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    Default
    /**
     * Indicates that the form is ready.
     *
     * @relation READY = 1;
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    Ready
    | ...

    protected static func parse(value: Int32): FormState {
        match (value) {
            case -1 => Unknown
            case 0 => Default
            case 1 => Ready
            case _ => throw IllegalArgumentException("No corresponding FormState: ${value}")
        }
    }

    protected func getValue(): Int32 {
        match (this) {
            case Unknown => -1
            case Default => 0
            case Ready => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Type of form.
 *
 * @relation enum FormType
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.Form"
]
@Derive[ToString, Equatable]
public enum FormType {
    /**
     * JS form.
     *
     * @relation JS = 1;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    Js
    /**
     * eTS form.
     *
     * @relation eTS = 2;
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    Ets
    | ...

    protected static func parse(value: Int32): FormType {
        match (value) {
            case 1 => Js
            case 2 => Ets
            case _ => throw IllegalArgumentException("No corresponding FormType: ${value}")
        }
    }

    protected func getValue(): Int32 {
        match (this) {
            case Js => 1
            case Ets => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Defines the FormShape enum.
 *
 * @relation enum FormShape
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.Form"
]
@Derive[ToString, Equatable]
public enum FormShape {
    /**
     * The rect shape.
     *
     * @relation RECT = 1;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    Rect
    /**
     * The circle shape.
     *
     * @relation CIRCLE = 2;
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    Circle
    | ...

    protected static func parse(value: Int32): FormShape {
        match (value) {
            case 1 => Rect
            case 2 => Circle
            case _ => throw IllegalArgumentException("No corresponding FormType: ${value}")
        }
    }

    protected func getValue(): Int32 {
        match (this) {
            case Rect => 1
            case Circle => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Color mode.
 *
 * @relation enum ColorMode
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.Form"
]
@Derive[ToString, Equatable]
public enum ColorMode {
    /**
     * Automatic mode.
     *
     * @relation MODE_AUTO = -1;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    ModeAuto
    /**
     * Dark mode.
     *
     * @relation MODE_DARK = 0;
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    ModeDark
    /**
     * Light mode.
     *
     * @relation MODE_LIGHT = 1;
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    ModeLight
    | ...

    protected static func parse(value: Int32): ColorMode {
        match (value) {
            case -1 => ModeAuto
            case 0 => ModeDark
            case 1 => ModeLight
            case _ => throw IllegalArgumentException("No corresponding ColorMode: ${value}")
        }
    }

    protected func getValue(): Int32 {
        match (this) {
            case ModeAuto => -1
            case ModeDark => 0
            case ModeLight => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Parameter of form.
 *
 * @relation enum FormParam
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.Form"
]
@Derive[Equatable]
public enum FormParam {
    /**
     * Indicates the key specifying the ID of the form to be obtained.
     *
     * @relation IDENTITY_KEY = 'ohos.extra.param.key.form_identity';
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    IdentityKey
    /**
     * Indicates the key specifying the grid style of the form to be obtained.
     *
     * @relation DIMENSION_KEY = 'ohos.extra.param.key.form_dimension';
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    DimensionKey
    /**
     * Indicates the key specifying the name of the form to be obtained.
     *
     * @relation NAME_KEY = 'ohos.extra.param.key.form_name';
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    NameKey
    /**
     * Indicates the key specifying the name of the module to which the form to be obtained belongs.
     *
     * @relation MODULE_NAME_KEY = 'ohos.extra.param.key.module_name';
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    ModuleNameKey
    /**
     * Indicates the key specifying the width of the form to be obtained.
     *
     * @relation WIDTH_KEY = 'ohos.extra.param.key.form_width';
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    WidthKey
    /**
     * Indicates the key specifying the height of the form to be obtained.
     *
     * @relation HEIGHT_KEY = 'ohos.extra.param.key.form_height';
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    HeightKey
    /**
     * Indicates the key specifying whether a form is temporary.
     *
     * @relation TEMPORARY_KEY = 'ohos.extra.param.key.form_temporary';
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    TemporaryKey
    /**
     * Indicates the key specifying the name of the ability to be obtained.
     *
     * @relation ABILITY_NAME_KEY = 'ohos.extra.param.key.ability_name';
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    AbilityNameKey
    /**
     * Indicates the key specifying the name of the bundle to be obtained.
     *
     * @relation BUNDLE_NAME_KEY = 'ohos.extra.param.key.bundle_name';
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    BundleNameKey
    /**
     * Indicates the key specifying the launch reason of the form to be obtained.
     *
     * @relation LAUNCH_REASON_KEY = 'ohos.extra.param.key.form_launch_reason';
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    LaunchReasonKey
    /**
     * Indicates the key specifying the custom data of the form to be obtained.
     *
     * @relation PARAM_FORM_CUSTOMIZE_KEY = 'ohos.extra.param.key.form_customize';
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    ParamFormCustomizeKey
    /**
     * Indicates the key specifying the form rendering mode.
     *
     * @relation FORM_RENDERING_MODE_KEY = 'ohos.extra.param.key.form_rendering_mode';
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    FormRenderingModeKey
    /**
     * Indicates the key specifying the inverse of the host background color.
     *
     * @relation HOST_BG_INVERSE_COLOR_KEY = 'ohos.extra.param.key.host_bg_inverse_color';
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    HostBgInverseColorKey
    /**
     * Indicates the key specifying the form location.
     *
     * @relation FORM_LOCATION_KEY = 'ohos.extra.param.key.form_location';
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    FormLocationKey
    /**
     * Indicates the key specifying the user granted permission name.
     *
     * @relation FORM_PERMISSION_NAME_KEY = 'ohos.extra.param.key.permission_name';
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    FormPermissionNameKey
    /**
     * Indicates the key specifying whether the user granted.
     *
     * @relation FORM_PERMISSION_GRANTED_KEY = 'ohos.extra.param.key.permission_granted';
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    FormPermissionGrantedKey
    | ...

    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public func getValue(): String {
        match (this) {
            case IdentityKey => "ohos.extra.param.key.form_identity"
            case DimensionKey => "ohos.extra.param.key.form_dimension"
            case NameKey => "ohos.extra.param.key.form_name"
            case ModuleNameKey => "ohos.extra.param.key.module_name"
            case WidthKey => "ohos.extra.param.key.form_width"
            case HeightKey => "ohos.extra.param.key.form_height"
            case TemporaryKey => "ohos.extra.param.key.form_temporary"
            case AbilityNameKey => "ohos.extra.param.key.ability_name"
            case BundleNameKey => "ohos.extra.param.key.bundle_name"
            case LaunchReasonKey => "ohos.extra.param.key.form_launch_reason"
            case ParamFormCustomizeKey => "ohos.extra.param.key.form_customize"
            case FormRenderingModeKey => "ohos.extra.param.key.form_rendering_mode"
            case HostBgInverseColorKey => "ohos.extra.param.key.host_bg_inverse_color"
            case FormLocationKey => "ohos.extra.param.key.form_location"
            case FormPermissionNameKey => "ohos.extra.param.key.permission_name"
            case FormPermissionGrantedKey => "ohos.extra.param.key.permission_granted"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Defines the FormDimension enum.
 *
 * @relation enum FormDimension
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.Form"
]
@Derive[ToString, Equatable]
public enum FormDimension {
    /**
     * 1 x 2 form.
     *
     * @relation Dimension_1_2 = 1;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    Dimension12
    /**
     * 2 x 2 form.
     *
     * @relation Dimension_2_2 = 2;
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    Dimension22
    /**
     * 2 x 4 form.
     *
     * @relation Dimension_2_4 = 3;
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    Dimension24
    /**
     * 4 x 4 form.
     *
     * @relation Dimension_4_4 = 4;
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    Dimension44
    /**
     * 2 x 1 form.
     *
     * @relation Dimension_2_1 = 5;
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    Dimension21
    /**
     * 1 x 1 form.
     *
     * @relation Dimension_1_1 = 6;
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    Dimension11
    /**
     * 6 x 4 form.
     *
     * @relation Dimension_6_4 = 7;
     */
    | @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    Dimension64
    | ...

    protected static func parse(value: Int32): FormDimension {
        match (value) {
            case 1 => Dimension12
            case 2 => Dimension22
            case 3 => Dimension24
            case 4 => Dimension44
            case 5 => Dimension21
            case 6 => Dimension11
            case 7 => Dimension64
            case _ => throw IllegalArgumentException("No corresponding ColorMode: ${value}")
        }
    }

    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public func getValue(): Int32 {
        match (this) {
            case Dimension12 => 1
            case Dimension22 => 2
            case Dimension24 => 3
            case Dimension44 => 4
            case Dimension21 => 5
            case Dimension11 => 6
            case Dimension64 => 7
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * The optional options used as filters to ask
 * getFormsInfo to return formInfos from only forms that match the options.
 *
 * @relation interface FormInfoFilter
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.Form"
]
public class FormInfoFilter {
    let moduleName_: String

    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public init(moduleName: String) {
        this.moduleName_ = moduleName
    }

    /**
     * optional moduleName that used to ask getFormsInfo to return
     * form infos with the same moduleName.
     *
     * @relation moduleName?: string;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public prop moduleName: String {
        get() {
            return moduleName_
        }
    }
}

/**
 * Provides information about a form.
 *
 * @relation interface FormInfo
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.Form"
]
public class FormInfo {
    let bundleName_: String
    let moduleName_: String
    let abilityName_: String
    let name_: String
    let displayName_: String
    let displayNameId_: UInt32
    let description_: String
    let descriptionId_: UInt32
    let formType_: Int32
    let jsComponentName_: String
    let colorMode_: Int32
    let isDefault_: Bool
    let updateEnabled_: Bool
    let formVisibleNotify_: Bool
    let scheduledUpdateTime_: String
    let formConfigAbility_: String
    let updateDuration_: Int32
    let defaultDimension_: Int32
    let supportDimensions_: Array<Int32>
    var supportDimensionsEnum_: ?Array<FormDimension> = None
    let customizeData_: HashMap<String, String>
    let isDynamic_: Bool
    let transparencyEnabled_: Bool
    let supportedShapes_: Array<Int32>
    var supportedShapesEnum_: ?Array<FormShape> = None

    FormInfo(
        bundleName: String,
        moduleName: String,
        abilityName: String,
        name: String,
        displayName: String,
        displayNameId: UInt32,
        description: String,
        descriptionId: UInt32,
        formType: Int32,
        jsComponentName: String,
        colorMode: Int32,
        isDefault: Bool,
        updateEnabled: Bool,
        formVisibleNotify: Bool,
        scheduledUpdateTime: String,
        formConfigAbility: String,
        updateDuration: Int32,
        defaultDimension: Int32,
        supportDimensions: Array<Int32>,
        customizeData: HashMap<String, String>,
        isDynamic: Bool,
        transparencyEnabled: Bool,
        supportedShapes: Array<Int32>
    ) {
        this.bundleName_ = bundleName
        this.moduleName_ = moduleName
        this.abilityName_ = abilityName
        this.name_ = name
        this.displayName_ = displayName
        this.displayNameId_ = displayNameId
        this.description_ = description
        this.descriptionId_ = descriptionId
        this.formType_ = formType
        this.jsComponentName_ = jsComponentName
        this.colorMode_ = colorMode
        this.isDefault_ = isDefault
        this.updateEnabled_ = updateEnabled
        this.formVisibleNotify_ = formVisibleNotify
        this.scheduledUpdateTime_ = scheduledUpdateTime
        this.formConfigAbility_ = formConfigAbility
        this.updateDuration_ = updateDuration
        this.defaultDimension_ = defaultDimension
        this.supportDimensions_ = supportDimensions
        this.customizeData_ = customizeData
        this.isDynamic_ = isDynamic
        this.transparencyEnabled_ = transparencyEnabled
        this.supportedShapes_ = supportedShapes
    }

    /**
     * Obtains the bundle name of the application to which this form belongs.
     *
     * @relation bundleName: string;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public prop bundleName: String {
        get() {
            return bundleName_
        }
    }

    /**
     * Obtains the name of the application module to which this form belongs.
     *
     * @relation moduleName: string;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public prop moduleName: String {
        get() {
            return moduleName_
        }
    }

    /**
     * Obtains the class name of the ability to which this form belongs.
     *
     * @relation abilityName: string;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public prop abilityName: String {
        get() {
            return abilityName_
        }
    }

    /**
     * Obtains the name of this form.
     *
     * @relation name: string;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public prop name: String {
        get() {
            return name_
        }
    }

    /**
     * Obtains the display name of this form.
     *
     * @relation displayName: string;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public prop displayName: String {
        get() {
            return displayName_
        }
    }

    /**
     * Obtains the displayName resource id of this form.
     *
     * @relation displayNameId: number;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public prop displayNameId: UInt32 {
        get() {
            return displayNameId_
        }
    }

    /**
     * Obtains the description of this form.
     *
     * @relation description: string;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public prop description: String {
        get() {
            return description_
        }
    }

    /**
     * Obtains the description id of this form.
     *
     * @relation descriptionId: number;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public prop descriptionId: UInt32 {
        get() {
            return descriptionId_
        }
    }

    /**
     * Obtains the type of this form. Currently, JS forms are supported.
     *
     * @relation type: FormType;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public prop formType: FormType {
        get() {
            try {
                return FormType.parse(formType_)
            } catch (e: Exception) {
                return Js
            }
        }
    }

    /**
     * Obtains the JS component name of this JS form.
     *
     * @relation jsComponentName: string;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public prop jsComponentName: String {
        get() {
            return jsComponentName_
        }
    }

    /**
     * Obtains the color mode of this form.
     *
     * @relation colorMode: ColorMode;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public prop colorMode: ColorMode {
        get() {
            try {
                return ColorMode.parse(colorMode_)
            } catch (e: Exception) {
                return ModeAuto
            }
        }
    }

    /**
     * Checks whether this form is a default form.
     *
     * @relation isDefault: boolean;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public prop isDefault: Bool {
        get() {
            return isDefault_
        }
    }

    /**
     * Obtains the updateEnabled.
     *
     * @relation updateEnabled: boolean;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public prop updateEnabled: Bool {
        get() {
            return updateEnabled_
        }
    }

    /**
     * Obtains whether notify visible of this form.
     *
     * @relation formVisibleNotify: boolean;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public prop formVisibleNotify: Bool {
        get() {
            return formVisibleNotify_
        }
    }

    /**
     * Obtains the scheduledUpdateTime.
     *
     * @relation scheduledUpdateTime: string;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public prop scheduledUpdateTime: String {
        get() {
            return scheduledUpdateTime_
        }
    }

    /**
     * Obtains the form config ability about this form.
     *
     * @relation formConfigAbility: string;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public prop formConfigAbility: String {
        get() {
            return formConfigAbility_
        }
    }

    /**
     * Obtains the updateDuration.
     *
     * @relation updateDuration: number;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public prop updateDuration: Int32 {
        get() {
            return updateDuration_
        }
    }

    /**
     * Obtains the default grid style of this form.
     *
     * @relation defaultDimension: number;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public prop defaultDimension: FormDimension {
        get() {
            return FormDimension.parse(defaultDimension_)
        }
    }

    /**
     * Obtains the grid styles supported by this form.
     *
     * @relation supportDimensions: Array<number>;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public prop supportDimensions: Array<FormDimension> {
        get() {
            match (supportDimensionsEnum_) {
                case Some(dimensions) => return dimensions
                case None =>
                    let arryDimension = Array<FormDimension>(supportDimensions_.size,) {
                        i => FormDimension.parse(supportDimensions_[i])
                    }
                    supportDimensionsEnum_ = arryDimension
                    return arryDimension
            }
        }
    }

    /**
     * Obtains the custom data defined in this form.
     *
     * @relation customizeData: Record<string, string>;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public prop customizeData: HashMap<String, String> {
        get() {
            return customizeData_
        }
    }

    /**
     * Obtains whether this form is a dynamic form.
     *
     * @relation isDynamic: boolean;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public prop isDynamic: Bool {
        get() {
            return isDynamic_
        }
    }

    /**
     * Indicates whether the form can be set as a transparent background
     *
     * @relation transparencyEnabled: boolean;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public prop transparencyEnabled: Bool {
        get() {
            return transparencyEnabled_
        }
    }

    /**
     * Obtains the shape supported by this form.
     *
     * @relation supportedShapes: Array<number>;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public prop supportedShapes: Array<FormShape> {
        get() {
            match (supportedShapesEnum_) {
                case Some(shapes) => return shapes
                case None =>
                    let arryShapes = Array<FormShape>(supportedShapes_.size,) {
                        i => FormShape.parse(supportedShapes_[i])
                    }
                    supportedShapesEnum_ = arryShapes
                    return arryShapes
            }
        }
    }
}
