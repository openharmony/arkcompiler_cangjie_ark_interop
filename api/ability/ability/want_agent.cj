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

import ohos.base.*
import ohos.ffi.*
import ohos.encoding.json.*
import std.deriving.*
import ohos.labels.*

@C
struct CJWantAgentInfo {
    CJWantAgentInfo(
        let wants: CJWantArr,
        let actionType: Int32,
        let requestCode: Int32,
        let actionFlags: CArrI32,
        let extraInfos: CString
    ) {}

    unsafe func free(): Unit {
        Want.releaseWantHandle(wants.head.read(0))
        LibC.free<WantHandle>(wants.head)
        if (actionFlags.size != 0) {
            LibC.free<Int32>(actionFlags.head)
        }
        LibC.free(extraInfos)
    }
}

@C
struct CJWantArr {
    CJWantArr(
        let head: CPointer<WantHandle>,
        let size: Int64
    ) {}
}

@C
struct CJTriggerInfo {
    CJTriggerInfo(
        let code: Int32,
        let want: WantHandle,
        let hasWant: Bool,
        let permission: CString,
        let extraInfos: CString
    ) {}

    unsafe func free(): Unit {
        // null pointer checking is in c++ side
        if (hasWant) {
            Want.releaseWantHandle(want)
        }
        LibC.free(permission)
        LibC.free(extraInfos)
    }
}

@C
struct CJCompleteData {
    CJCompleteData(
        let info: Int64,
        let want: WantHandle,
        let finalCode: Int32,
        let finalData: CString,
        let extraInfo: CString
    ) {}

    unsafe func free(): Unit {
        Want.releaseWantHandle(want)
        LibC.free(finalData)
        LibC.free(extraInfo)
    }

    func toCompleteData(): CompleteData {
        return CompleteData(info: WantAgent(info), want: Want(want), finalCode: finalCode,
            finalData: finalData.toString(), extraInfo: jsonStringUnWrapper(extraInfo.toString()).toString())
    }
}

foreign {
    func FfiWantAgentGetWantAgent(info: CJWantAgentInfo, errCode: CPointer<Int32>): Int64

    func FfiWantAgentGetBoundleName(cjWantAgent: Int64, errCode: CPointer<Int32>): CString

    func FfiWantAgentGetUid(cjWantAgent: Int64, errCode: CPointer<Int32>): Int32

    func FfiWantAgentTrigger(cjWantAgent: Int64, triggerInfo: CJTriggerInfo, funcId: Int64, errCode: CPointer<Int32>): Unit

    func FfiWantAgentCancel(cjWantAgent: Int64, errCode: CPointer<Int32>): Unit

    func FfiWantAgentGetOperationType(cjWantAgent: Int64, errCode: CPointer<Int32>): Int32

    func FfiWantAgentEqual(cjWantAgentFirst: Int64, cjWantAgentSecond: Int64, errCode: CPointer<Int32>): Bool
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum OperationType {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    UNKNOWN_TYPE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    START_ABILITY
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    START_ABILITIES
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    START_SERVICE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    SEND_COMMON_EVENT
    | ...

    func getValue(): Int32 {
        match (this) {
            case UNKNOWN_TYPE => 0
            case START_ABILITY => 1
            case START_ABILITIES => 2
            case START_SERVICE => 3
            case SEND_COMMON_EVENT => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(code: Int32) {
        match (code) {
            case 1 => START_ABILITY
            case 2 => START_ABILITIES
            case 3 => START_SERVICE
            case 4 => SEND_COMMON_EVENT
            case 0 => UNKNOWN_TYPE
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum WantAgentFlags {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    ONE_TIME_FLAG
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    NO_BUILD_FLAG
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    CANCEL_PRESENT_FLAG
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    UPDATE_PRESENT_FLAG
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    CONSTANT_FLAG
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    REPLACE_ELEMENT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    REPLACE_ACTION
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    REPLACE_URI
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    REPLACE_ENTITIES
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    REPLACE_BUNDLE
    | ...

    func getValue(): Int32 {
        match (this) {
            case ONE_TIME_FLAG => 0
            case NO_BUILD_FLAG => 1
            case CANCEL_PRESENT_FLAG => 2
            case UPDATE_PRESENT_FLAG => 3
            case CONSTANT_FLAG => 4
            case REPLACE_ELEMENT => 5
            case REPLACE_ACTION => 6
            case REPLACE_URI => 7
            case REPLACE_ENTITIES => 8
            case REPLACE_BUNDLE => 9
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class WantAgentInfo {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public WantAgentInfo(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let wants!: Array<Want>,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let actionType!: OperationType = UNKNOWN_TYPE,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let requestCode!: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let actionFlags!: Array<WantAgentFlags> = Array<WantAgentFlags>(),
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let extraInfos!: String = ""
    ) {}

    unsafe func toCJWantAgentInfo(): CJWantAgentInfo {
        let infoJsonObject = jsStringToJsObject(extraInfos)
        if (wants.size == 0) {
            throw BusinessException(INVALID_PARA, getErrorMsg(INVALID_PARA))
        }
        let cArrayWantHandlePtr = LibC.malloc<WantHandle>(count: 1)
        if (cArrayWantHandlePtr.isNull()) {
            throw BusinessException(ERROR_CODE_INNER, getErrorMsg(ERROR_CODE_INNER))
        }
        let handle = wants[0].createWantHandle()
        cArrayWantHandlePtr.write(0, handle)
        let cWantArr = CJWantArr(cArrayWantHandlePtr, 1)
        let cActionFlags = if (actionFlags.size == 0) {
            CArrI32(CPointer<Int32>(), 0)
        } else {
            let cArrayI32Ptr = safeMalloc<Int32>(
                actionFlags.size,
                {
                    =>
                    Want.releaseWantHandle(handle)
                    LibC.free<WantHandle>(cArrayWantHandlePtr)
                }
            )
            for (i in 0..actionFlags.size) {
                cArrayI32Ptr.write(i, actionFlags[i].getValue())
            }
            CArrI32(cArrayI32Ptr, actionFlags.size)
        }
        let cExtraInfos: CString
        try {
            cExtraInfos = LibC.mallocCString(jsonObjectWrapper(infoJsonObject).toString())
        } catch (e: Exception) {
            Want.releaseWantHandle(handle)
            LibC.free<WantHandle>(cArrayWantHandlePtr)
            if (cActionFlags.size != 0) {
                LibC.free<Int32>(cActionFlags.head)
            }
            throw e
        }
        return CJWantAgentInfo(cWantArr, actionType.getValue(), requestCode, cActionFlags, cExtraInfos)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class TriggerInfo {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public TriggerInfo(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let code!: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let want!: ?Want = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let permission!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let extraInfos!: ?String = None
    ) {}

    unsafe func toCJTriggerInfo(): CJTriggerInfo {
        let handle: WantHandle
        let hasWant: Bool
        if (let Some(v) <- want) {
            handle = v.createWantHandle()
            hasWant = true
        } else {
            handle = 0
            hasWant = false
        }
        let infos = if (let Some(v) <- extraInfos) {
            let infoJsonObject = jsStringToJsObject(v)
            try {
                LibC.mallocCString(jsonObjectWrapper(infoJsonObject).toString())
            } catch (e: Exception) {
                if (hasWant) {
                    Want.releaseWantHandle(handle)
                }
                throw e
            }
        } else {
            CString(CPointer())
        }
        let cPermission = try {
            LibC.mallocCString(permission)
        } catch (e: Exception) {
            if (hasWant) {
                Want.releaseWantHandle(handle)
            }
            LibC.free(infos)
            throw e
        }
        return CJTriggerInfo(code, handle, hasWant, cPermission, infos)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class CompleteData {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public CompleteData(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let info!: WantAgent,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let want!: Want,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let finalCode!: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let finalData!: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let extraInfo!: String
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class WantAgent <: RemoteDataLite {
    protected init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public func getWantAgent(info: WantAgentInfo): WantAgent {
    unsafe {
        var code: Int32 = 0
        let cInfo = info.toCJWantAgentInfo()
        let id = FfiWantAgentGetWantAgent(cInfo, inout code)
        cInfo.free()
        if (code != SUCCESS_CODE) {
            throw BusinessException(code, getErrorMsg(code))
        }
        return WantAgent(id)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public func getBundleName(agent: WantAgent): String {
    unsafe {
        var code: Int32 = 0
        let cBoundleName = FfiWantAgentGetBoundleName(agent.getID(), inout code)
        if (code != SUCCESS_CODE) {
            throw BusinessException(code, getErrorMsg(code))
        }
        let bundleName = cBoundleName.toString()
        LibC.free(cBoundleName)
        return bundleName
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public func getUid(agent: WantAgent): Int32 {
    unsafe {
        var code: Int32 = 0
        let uid = FfiWantAgentGetUid(agent.getID(), inout code)
        if (code != SUCCESS_CODE) {
            throw BusinessException(code, getErrorMsg(code))
        }
        return uid
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public func trigger(agent: WantAgent, triggerInfo: TriggerInfo,
    callback!: (CompleteData) -> Unit = {_: CompleteData => ()}): Unit {
    let wrapper = {
        value: CJCompleteData =>
        let data = value.toCompleteData()
        unsafe { value.free() }
        callback(data)
    }
    let lambdaData = Callback1Param<CJCompleteData, Unit>(wrapper)
    let cTriggerInfo = unsafe { triggerInfo.toCJTriggerInfo() }
    var code: Int32 = 0
    unsafe {
        FfiWantAgentTrigger(agent.getID(), cTriggerInfo, lambdaData.getID(), inout code)
        cTriggerInfo.free()
    }
    if (code != SUCCESS_CODE) {
        throw BusinessException(code, getErrorMsg(code))
    }
    return
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public func cancel(agent: WantAgent): Unit {
    unsafe {
        var code: Int32 = 0
        FfiWantAgentCancel(agent.getID(), inout code)
        if (code != SUCCESS_CODE) {
            throw BusinessException(code, getErrorMsg(code))
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public func equal(agent: WantAgent, otherAgent: WantAgent): Bool {
    unsafe {
        var code: Int32 = 0
        let isEqual = FfiWantAgentEqual(agent.getID(), otherAgent.getID(), inout code)
        if (code != SUCCESS_CODE) {
            throw BusinessException(code, getErrorMsg(code))
        }
        return isEqual
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public func getOperationType(agent: WantAgent): OperationType {
    unsafe {
        var code: Int32 = 0
        let typeCode = FfiWantAgentGetOperationType(agent.getID(), inout code)
        if (code != SUCCESS_CODE) {
            throw BusinessException(code, getErrorMsg(code))
        }
        return OperationType.parse(typeCode)
    }
}
