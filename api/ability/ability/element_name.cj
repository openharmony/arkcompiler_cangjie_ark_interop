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

package ohos.ability

import std.collection.*
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

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class ElementName {
    private var deviceId_: String
    private var bundleName_: String
    private var abilityName_: String
    private var moduleName_: String = ""
    private var shortName_: String = ""

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public init(deviceId: String, bundleName: String, abilityName: String, moduleName: String) {
        this.deviceId_ = deviceId
        this.bundleName_ = bundleName
        this.abilityName_ = abilityName
        this.moduleName_ = moduleName
        this.shortName_ = ""
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public init(deviceId: String, bundleName: String, abilityName: String) {
        this(deviceId, bundleName, abilityName, "")
    }

    // protected function: available only for this package.
    init(elementNameHandle: ElementNameHandle) {
        var paramsHandle = unsafe { FFICJElementNameGetElementNameInfo(elementNameHandle) }
        let params = unsafe { paramsHandle.read() }

        this.deviceId_ = params.deviceId.toString()
        this.bundleName_ = params.bundleName.toString()
        this.abilityName_ = params.abilityName.toString()
        this.moduleName_ = params.moduleName.toString()
        this.shortName_ = ""
        unsafe { FFICJElementNameParamsDelete(paramsHandle) }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public prop deviceId: String {
        get() {
            this.deviceId_
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public prop bundleName: String {
        get() {
            this.bundleName_
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public prop abilityName: String {
        get() {
            this.abilityName_
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public prop moduleName: String {
        get() {
            this.moduleName_
        }
    }

    // protected function: available only for this package.
    static func release(elementNameHandle: ElementNameHandle): Unit {
        unsafe { FFICJElementNameDelete(elementNameHandle) }
    }

    // protected function: available only for this package.
    func createElementNameHandle(): ElementNameHandle {
        unsafe {
            var handle: ElementNameHandle = 0
            try (
                id = LibC.mallocCString(this.deviceId_).asResource(),
                bundle = LibC.mallocCString(this.bundleName_).asResource(),
                ability = LibC.mallocCString(this.abilityName_).asResource(),
                module = LibC.mallocCString(this.moduleName_).asResource()
            ) {
                handle = FFICJElementNameCreateWithContent(id.value, bundle.value, ability.value, module.value)
            }
            return handle
        }
    }
}
