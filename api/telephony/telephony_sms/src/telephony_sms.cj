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

package ohos.telephony_sms

import ohos.ffi.*
import ohos.base.*
import ohos.telephony_call.*
import std.deriving.*
import ohos.labels.*

const SIM_SLOT_0 = 0i32
const TELEPHONY_SUCCESS = 8300000i32

foreign {
    func FfiSMSCreateMessage(arr: CArrI32, specification: CString): CJShortMessage

    func FfiSMSGetDefaultSmsSlotId(): Int32

    func FfiSMSGetDefaultSmsSimId(): RetDataI32

    func FfiSMSHasSmsCapability(): Bool
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.SmsMms"
]
public func createMessage(pdu: Array<Int32>, specification: String): ShortMessage {
    unsafe {
        let spec = LibC.mallocCString(specification)
        let head: CPointer<Int32> = try {
            cjArr2CArr(pdu)
        } catch (e: Exception) {
            LibC.free(spec)
            throw e
        }
        let arr = CArrI32(head, pdu.size)
        let message = FfiSMSCreateMessage(arr, spec)
        LibC.free(spec)
        LibC.free(head)
        if (message.errCode != 0) {
            throw BusinessException(message.errCode, getErrorMsg(message.errCode))
        }
        return message.toShortMessage()
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.SmsMms"
]
public func getDefaultSmsSlotId(): Int32 {
    let id = unsafe { FfiSMSGetDefaultSmsSlotId() }
    if (id < SIM_SLOT_0) {
        throw BusinessException(id, "get default sms slot id error")
    }
    return id
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.SmsMms"
]
public func hasSmsCapability(): Bool {
    return unsafe { FfiSMSHasSmsCapability() }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.SmsMms"
]
public func getDefaultSmsSimId(): Int32 {
    let ret = unsafe { FfiSMSGetDefaultSmsSimId() }
    if (ret.code != TELEPHONY_SUCCESS) {
        throw BusinessException(ret.code, getErrorMsg(ret.code))
    }
    return ret.data
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.SmsMms"
]
public class ShortMessage {
    ShortMessage(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.SmsMms"
        ]
        public let hasReplyPath: Bool,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.SmsMms"
        ]
        public let isReplaceMessage: Bool,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.SmsMms"
        ]
        public let isSmsStatusReportMessage: Bool,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.SmsMms"
        ]
        public let messageClass: ShortMessageClass,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.SmsMms"
        ]
        public let pdu: Array<Int32>,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.SmsMms"
        ]
        public let protocolId: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.SmsMms"
        ]
        public let scAddress: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.SmsMms"
        ]
        public let scTimestamp: Int64,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.SmsMms"
        ]
        public let status: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.SmsMms"
        ]
        public let visibleMessageBody: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.SmsMms"
        ]
        public let visibleRawAddress: String
    ) {}
}

@C
struct CJShortMessage {
    CJShortMessage(
        let hasReplyPath: Bool,
        let isReplaceMessage: Bool,
        let isSmsStatusReportMessage: Bool,
        let messageClass: Int32,
        let pdu: CArrI32,
        let protocolId: Int32,
        let scAddress: CString,
        let scTimestamp: Int64,
        let status: Int32,
        let visibleMessageBody: CString,
        let visibleRawAddress: CString,
        let errCode: Int32
    ) {}

    func toShortMessage(): ShortMessage {
        unsafe {
            let address = scAddress.toString()
            let messageBody = visibleMessageBody.toString()
            let rawAddress = visibleRawAddress.toString()
            let arr = cArr2cjArr(pdu.size, pdu.head, {i => i})
            LibC.free(scAddress)
            LibC.free(visibleMessageBody)
            LibC.free(visibleRawAddress)
            LibC.free(pdu.head)
            let mclass = ShortMessageClass.parse(messageClass)
            return ShortMessage(
                hasReplyPath,
                isReplaceMessage,
                isSmsStatusReportMessage,
                mclass,
                arr,
                protocolId,
                address,
                scTimestamp,
                status,
                messageBody,
                rawAddress
            )
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.SmsMms"
]
public enum ShortMessageClass {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.SmsMms"
    ]
    UNKNOWN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.SmsMms"
    ]
    INSTANT_MESSAGE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.SmsMms"
    ]
    OPTIONAL_MESSAGE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.SmsMms"
    ]
    SIM_MESSAGE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.SmsMms"
    ]
    FORWARD_MESSAGE
    | ...

    static func parse(messageClass: Int32): ShortMessageClass {
        match (messageClass) {
            case 0 => UNKNOWN
            case 1 => INSTANT_MESSAGE
            case 2 => OPTIONAL_MESSAGE
            case 3 => SIM_MESSAGE
            case 4 => FORWARD_MESSAGE
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.SmsMms"
]
public class SendMessageOptions {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.SmsMms"
    ]
    public SendMessageOptions(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.SmsMms"
        ]
        public let slotId: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.SmsMms"
        ]
        public let destinationHost: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.SmsMms"
        ]
        public let content: ContentType,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.SmsMms"
        ]
        public let serviceCenter!: String = "",
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.SmsMms"
        ]
        public let destinationPort!: UInt16 = 0,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.SmsMms"
        ]
        public let sendCallback!: ?ISendShortMessageCallback = None,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.SmsMms"
        ]
        public let deliveryCallback!: ?IDeliveryShortMessageCallback = None
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.SmsMms"
]
public enum ContentType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.SmsMms"
    ]
    STRING(String)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.SmsMms"
    ]
    UINT8ARR(Array<UInt8>)
    | ...
}

public type ISendShortMessageCallback = (SendSmsResult) -> Unit

public type IDeliveryShortMessageCallback = (Array<Int32>) -> Unit

@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.SmsMms"
]
public enum SendSmsResult {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.SmsMms"
    ]
    SEND_SMS_SUCCESS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.SmsMms"
    ]
    SEND_SMS_FAILURE_UNKNOWN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.SmsMms"
    ]
    SEND_SMS_FAILURE_RADIO_OFF
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.SmsMms"
    ]
    SEND_SMS_FAILURE_SERVICE_UNAVAILABLE
    | ...
}
