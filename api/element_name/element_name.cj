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

protected package ohos.element_name

import ohos.labels.*

internal type ElementNameHandle = UIntNative

@C
struct ElementNameParams {
    ElementNameParams(
        let deviceId: CString,
        let bundleName: CString,
        let abilityName: CString,
        let moduleName: CString
    ) {}
}

foreign func FFICJElementNameCreateWithContent(
    deviceId: CString,
    bundleName: CString,
    abilityName: CString,
    moduleName: CString
): ElementNameHandle

foreign func FFICJElementNameDelete(elementName: ElementNameHandle): Unit

// The return variable needs to delete by `FFICJElementNameParamsDelete`.
foreign func FFICJElementNameGetElementNameInfo(elementName: ElementNameHandle): CPointer<ElementNameParams>

foreign func FFICJElementNameParamsDelete(elementNameParams: CPointer<ElementNameParams>): Unit

/**
 * Contains basic Ability information, which uniquely identifies an ability.
 * You can use this class to obtain values of the fields set in an element,
 * such as the device ID, bundle name, and ability name.
 *
 * @relation export interface ElementName
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class ElementName {
    /**
    * Indicates device id
    *
    * @relation deviceId?: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var deviceId: String

    /**
    * Indicates bundle name
    * 
    * @relation bundleName: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var bundleName: String

    /**
    * Indicates ability name
    *
    * @relation abilityName: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var abilityName: String

    /**
    * Indicates module name
    *
    * @relation moduleName?: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var moduleName: String
    private var shortName_: String

    /**
    * ElementName constructor.
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public init(bundleName: String, abilityName: String, deviceId!: String = "", moduleName!: String = "") {
        this.bundleName = bundleName
        this.abilityName = abilityName
        this.deviceId = deviceId
        this.moduleName = moduleName
        this.shortName_ = ""
    }

    // protected function: available only for this package.
    protected init(elementNameHandle: ElementNameHandle) {
        var paramsHandle = unsafe { FFICJElementNameGetElementNameInfo(elementNameHandle) }
        let params = unsafe { paramsHandle.read() }

        this.deviceId = params.deviceId.toString()
        this.bundleName = params.bundleName.toString()
        this.abilityName = params.abilityName.toString()
        this.moduleName = params.moduleName.toString()
        this.shortName_ = ""
        unsafe { FFICJElementNameParamsDelete(paramsHandle) }
    }

    // protected function: available only for this package.
    protected static func release(elementNameHandle: ElementNameHandle): Unit {
        unsafe { FFICJElementNameDelete(elementNameHandle) }
    }

    // protected function: available only for this package.
    protected func createElementNameHandle(): ElementNameHandle {
        unsafe {
            var handle: ElementNameHandle = 0
            try (
                id = LibC.mallocCString(this.deviceId).asResource(),
                bundle = LibC.mallocCString(this.bundleName).asResource(),
                ability = LibC.mallocCString(this.abilityName).asResource(),
                module = LibC.mallocCString(this.moduleName).asResource()
            ) {
                handle = FFICJElementNameCreateWithContent(id.value, bundle.value, ability.value, module.value)
            }
            return handle
        }
    }
}
