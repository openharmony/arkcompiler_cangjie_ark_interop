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

package ohos.nfc.cardEmulation

public import ohos.ability.ElementName
import ohos.hilog.*
import ohos.base.*
import ohos.ffi.*
import std.collection.*
import std.sync.*
import std.deriving.*
import ohos.labels.*

let LOGGER = HilogChannel(0, 0x0, "CJ-nfc")

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NFC.CardEmulation"
]
public enum CardType {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NFC.CardEmulation"
    ]
    PAYMENT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NFC.CardEmulation"
    ]
    OTHER
    | ...

    prop value: String {
        get() {
            match (this) {
                case PAYMENT => "payment"
                case OTHER => "other"
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(val: String): CardType {
        match (val) {
            case "payment" => PAYMENT
            case "other" => OTHER
            case _ => OTHER
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    permission: "ohos.NFC_CARD_EMULATION",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NFC.CardEmulation"
]
public enum NfcEventType {
    | HceCmd | ...

    prop value: Int8 {
        get() {
            match (this) {
                case HceCmd => 0
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    permission: "ohos.NFC_CARD_EMULATION",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NFC.CardEmulation"
]
public func hasHceCapability(): Bool {
    let hasHceCapability: Bool = true
    return hasHceCapability
}

@!APILevel[
    19,
    atomicservice: true,
    permission: "ohos.NFC_CARD_EMULATION",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NFC.CardEmulation"
]
public func isDefaultService(elementName: ElementName, `type`: CardType): Bool {
    if (`type` != PAYMENT) {
        throw BusinessException(ERR_PARAMETER_ERROR, "IsDefaultService: unsupported card type")
    }
    var ret: Bool = false
    try (
        bundleName = unsafe { LibC.mallocCString(elementName.bundleName).asResource() },
        abilityName = unsafe { LibC.mallocCString(elementName.abilityName).asResource()},
        moduleName = unsafe { LibC.mallocCString(elementName.moduleName).asResource() },
        cardTypeName = unsafe {LibC.mallocCString(`type`.value).asResource()}
    ) {
        let errorcode = unsafe {
            FfiNfcCardEmulationisDefaultService(
                bundleName.value,
                abilityName.value,
                moduleName.value,
                cardTypeName.value,
                inout ret
            )
        }
        if (errorcode != SUCCESS_CODE) {
            throw BusinessException(errorcode, getErrorMsg(errorcode))
        }
    }
    return ret
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NFC.CardEmulation"
]
public class HceService {
    private var isRegisted: Bool = false
    private var hceCallback: Option<Callback1Argument<Array<UInt8>>> = None
    private let hceMutex = Mutex()

    @!APILevel[
        19,
        atomicservice: true,
        permission: "ohos.NFC_CARD_EMULATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NFC.CardEmulation"
    ]
    public func start(elementName: ElementName, aidList: Array<String>): Unit {
        var errorcode: Int32 = 0
        let cAidList = unsafe { toArrayCString(aidList) }
        try (
            bundleName = unsafe { LibC.mallocCString(elementName.bundleName).asResource() },
            abilityName = unsafe {LibC.mallocCString(elementName.abilityName).asResource()},
            moduleName = unsafe { LibC.mallocCString(elementName.moduleName).asResource() }
        ) {
            errorcode = unsafe {
                FfiNfcCardEmulationstart(
                    bundleName.value,
                    abilityName.value,
                    moduleName.value,
                    cAidList
                )
            }
        } finally {
            unsafe {
                cAidList.free()
            }
        }

        if (errorcode != SUCCESS_CODE) {
            throw BusinessException(errorcode, getErrorMsg(errorcode))
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        permission: "ohos.NFC_CARD_EMULATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NFC.CardEmulation"
    ]
    public func stop(elementName: ElementName): Unit {
        try (
            bundleName = unsafe { LibC.mallocCString(elementName.bundleName).asResource() },
            abilityName = unsafe {LibC.mallocCString(elementName.abilityName).asResource()},
            moduleName = unsafe { LibC.mallocCString(elementName.moduleName).asResource() }
        ) {
            let errorcode = unsafe { FfiNfcCardEmulationstop(bundleName.value, abilityName.value, moduleName.value) }
            if (errorcode != SUCCESS_CODE) {
                throw BusinessException(errorcode, getErrorMsg(errorcode))
            }
            synchronized(hceMutex) {
                isRegisted = false
                hceCallback = None
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        permission: "ohos.NFC_CARD_EMULATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NFC.CardEmulation"
    ]
    public func on(`type`: NfcEventType, callback: Callback1Argument<Array<UInt8>>): Unit {
        match (`type`) {
            case HceCmd => onhceCmd(callback)
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        permission: "ohos.NFC_CARD_EMULATION",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NFC.CardEmulation"
    ]
    public func transmit(responseApdu: Array<UInt8>, callback: Callback0Argument): Unit {
        spawn (Main) {
            let cResponseApdu = toCArrayUInt8(responseApdu)
            try {
                let errorcode = unsafe { FfiNfcCardEmulationTransmit(cResponseApdu) }
                callback.invoke()
                if (errorcode != SUCCESS_CODE) {
                    throw BusinessException(errorcode, getErrorMsg(errorcode))
                }
            } finally {
                cResponseApdu.free()
            }
        }
    }

    private func onhceCmd(callback: Callback1Argument<Array<UInt8>>): Unit {
        LOGGER.info("subscribe HceCmd")
        let wrapper = {
            head: CPointer<UInt8>, size: Int64 =>
            var numbers: Array<UInt8>
            if (head.isNull()) {
                numbers = Array<UInt8>()
            } else {
                numbers = Array<UInt8>(size) {i => unsafe { head.read(i) }}
            }
            match (hceCallback) {
                case Some(cb) => cb.invoke(numbers)
                case None => LOGGER.info("")
            }
        }
        let registerCall = Callback2Param<CPointer<UInt8>, Int64, Unit>(wrapper)
        let id = registerCall.getID()
        synchronized(hceMutex) {
            if (!isRegisted) {
                on(HceCmd.value, id)
                isRegisted = true
            }
            if (hceCallback.isSome()) {
                LOGGER.info("")
            }
            hceCallback = Some(callback)
        }
    }

    private func on(eventType: Int8, id: Int64) {
        let errorcode: Int32 = unsafe { FfiNfcCardEmulationOn(eventType, id) }
        if (errorcode != SUCCESS_CODE) {
            LOGGER.error("on ${eventType} failed: ${errorcode}")
            throw BusinessException(errorcode, getErrorMsg(errorcode))
        }
    }

    private func toCArrayUInt8(arr: Array<UInt8>): CArrUI8 {
        if (arr.isEmpty()) {
            throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }

        unsafe {
            let p = LibC.malloc<UInt8>(count: arr.size)
            if (p.isNull()) {
                throw BusinessException(ERR_NO_PERMISSION, getErrorMsg(ERR_NO_PERMISSION))
            }
            for (i in 0..arr.size) {
                p.write(i, arr[i])
            }
            return CArrUI8(p, arr.size)
        }
    }
}
