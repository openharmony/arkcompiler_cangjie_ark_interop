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
import ohos.base.*
import ohos.encoding.json.*
import ohos.labels.*

protected type WantHandle = UIntNative

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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityBase"
]
public class Want {
    private var elementName_: ElementName
    private var flags_: UInt32
    private var uri_: String
    private var action_: String
    private var entities_: Array<String>
    private var type_: String
    private var parameters_: String
    private var paramJsonObj_: JsonObject

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
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
        parameters!: String = ""
    ) {
        this.elementName_ = ElementName(deviceId, bundleName, abilityName, moduleName)
        this.flags_ = flags
        this.uri_ = uri
        this.action_ = action
        this.entities_ = entities
        this.type_ = `type`
        this.parameters_ = parameters
        this.paramJsonObj_ = jsStringToJsObject(parameters)
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
        this.flags_ = params.flags
        this.uri_ = params.uri.toString()
        this.action_ = params.action.toString()
        this.entities_ = Array<String>(entitiesSize, repeat: "")
        for (i in 0..entitiesSize) {
            this.entities_[i] = unsafeEntities.getElement(i)
        }
        this.type_ = params.wantType.toString()
        this.paramJsonObj_ = jsonStringUnWrapper(params.parameters.toString())
        this.parameters_ = paramJsonObj_.toString()

        unsafe { FFICJWantParamsDelete(paramsHandle) }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public prop deviceId: String {
        get() {
            this.elementName_.deviceId
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public prop bundleName: String {
        get() {
            this.elementName_.bundleName
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public prop abilityName: String {
        get() {
            this.elementName_.abilityName
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public prop moduleName: String {
        get() {
            this.elementName_.moduleName
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public prop flags: UInt32 {
        get() {
            this.flags_
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public prop uri: String {
        get() {
            this.uri_
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public prop action: String {
        get() {
            this.action_
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public prop entities: Array<String> {
        get() {
            this.entities_
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public prop `type`: String {
        get() {
            this.type_
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public prop parameters: String {
        get() {
            this.parameters_
        }
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
                unsafeUri = LibC.mallocCString(uri_).asResource(),
                unsafeAction = LibC.mallocCString(action_).asResource(),
                unsafeType = LibC.mallocCString(type_).asResource(),
                unsafeParameters = LibC.mallocCString(jsonObjectWrapper(paramJsonObj_).toString()).asResource()
            ) {
                let elementNameHandle = this.elementName_.createElementNameHandle()
                // Entities handled later.
                let param = CJWantParams(elementNameHandle, flags, unsafeUri.value, unsafeAction.value,
                    VectorStringHandle(), unsafeType.value, unsafeParameters.value)
                wantHandle = FFICJWantCreateWithWantInfo(param)
                ElementName.release(elementNameHandle)
                if (wantHandle == NULL_PTR) {
                    throw BusinessException(Int32(ERR_INVALID_INSTANCE_CODE), "Invalid wantHandle")
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
