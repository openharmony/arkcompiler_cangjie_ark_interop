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

package ohos.telephony_call

import ohos.base.*
import ohos.ability.*
import std.collection.*
import ohos.encoding.json.*
import ohos.ffi.*
import std.collection.*
import ohos.labels.*

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.CallManager"
]
public class TelephonyCall {
    static init() {
        unsafe {
            FfiOHOSTelephonyCallInit()
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    public static func formatPhoneNumberToE164(phoneNumber: String, countryCode: String): String {
        unsafe {
            var result = ""
            try (
                cPhoneNumber = LibC.mallocCString(phoneNumber).asResource(),
                cCountryCode = LibC.mallocCString(countryCode).asResource()
            ) {
                var errCode = 0i32
                let formatNumber = FfiOHOSTelephonyCallFormatPhoneNumberToE164(cPhoneNumber.value, cCountryCode.value,
                    inout errCode)
                result = formatNumber.toString()
                LibC.free(formatNumber)
                if (errCode != SUCCESS_CODE) {
                    TELEPHONY_CALL_LOG.error("Telephony_Call formatPhoneNumberToE164 failed: ${getErrorMsg(errCode)}")
                    throw BusinessException(getErrorCode(errCode),
                        "TelephonyCall formatPhoneNumberToE164 failed: ${getErrorMsg(errCode)}")
                }
            }
            return result
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    public static func makeCall(phoneNumber: String): Unit {
        unsafe {
            try (cNumber = LibC.mallocCString(phoneNumber).asResource()) {
                let errCode = FfiOHOSTelephonyCallMakeCall(cNumber.value)
                if (errCode != SUCCESS_CODE) {
                    TELEPHONY_CALL_LOG.error("Telephony_Call makeCall failed: ${getErrorMsg(errCode)}")
                    throw BusinessException(getErrorCode(errCode),
                        "TelephonyCall makeCall failed: ${getErrorMsg(errCode)}")
                }
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    public static func makeCall(context: UIAbilityContext, phoneNumber: String): Unit {
        let parametersMap = HashMap<String, JsonValue>()
        parametersMap.add("phoneNumber", JsonString(phoneNumber))
        parametersMap.add("pageFlag", JsonString("page_flag_edit_before_calling"))
        context.startAbility(
            Want(bundleName: "com.ohos.contacts", abilityName: "com.ohos.contacts.MainAbility",
                parameters: JsonObject(parametersMap).toString()))
    }

    /**
     * @brief  isEmergencyPhoneNumber(phoneNumber: string, options: EmergencyNumberOptions,
     *  callback: AsyncCallback<boolean>): void
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    public static func isEmergencyPhoneNumber(phoneNumber: String, options: EmergencyNumberOptions): Bool {
        unsafe {
            var result = true
            try (cNumber = LibC.mallocCString(phoneNumber).asResource()) {
                var errCode = 0i32
                result = FfiOHOSTelephonyCallIsEmergencyPhoneNumber(cNumber.value, options.getValue(), inout errCode)
                if (errCode != SUCCESS_CODE) {
                    TELEPHONY_CALL_LOG.error("Telephony_Call isEmergencyPhoneNumber failed: ${getErrorMsg(errCode)}")
                    throw BusinessException(getErrorCode(errCode),
                        "TelephonyCall isEmergencyPhoneNumber failed: ${getErrorMsg(errCode)}")
                }
            }
            return result
        }
    }

    /**
     * @brief  isEmergencyPhoneNumber(phoneNumber: string, callback: AsyncCallback<boolean>): void
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    public static func isEmergencyPhoneNumber(phoneNumber: String): Bool {
        return isEmergencyPhoneNumber(phoneNumber, EmergencyNumberOptions.SlotIdOne)
    }

    /**
     * @brief  hasCallSync(): boolean
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    public static func hasCall(): Bool {
        return unsafe { FfiOHOSTelephonyCallHasCall() }
    }

    /**
     * @brief  getCallStateSync(): CallState
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    public static func getCallState(): CallState {
        let enumCode = unsafe { FfiOHOSTelephonyCallGetCallState() }
        return CallState.parse(enumCode)
    }

    /**
     * @brief  hasVoiceCapability(): boolean
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    public static func hasVoiceCapability(): Bool {
        unsafe {
            return FfiOHOSTelephonyCallHasVoiceCapability()
        }
    }

    /**
     * @brief  formatPhoneNumber(phoneNumber: string, callback: AsyncCallback<string>): void
     * @brief  formatPhoneNumber(phoneNumber: string, options: NumberFormatOptions,
     *  callback: AsyncCallback<string>): void
     * @brief  formatPhoneNumber(phoneNumber: string, options?: NumberFormatOptions): Promise<string>
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    public static func formatPhoneNumber(
        phoneNumber: String,
        options!: NumberFormatOptions = NumberFormatOptions("CN")
    ): String {
        unsafe {
            var result = ""
            try (
                cPhoneNumber = LibC.mallocCString(phoneNumber).asResource(),
                cCountryCode = LibC.mallocCString(options.countryCode).asResource()
            ) {
                var errCode = 0i32
                let formatNumber = FfiOHOSTelephonyCallFormatPhoneNumber(cPhoneNumber.value, cCountryCode.value,
                    inout errCode)
                result = formatNumber.toString()
                LibC.free(formatNumber)
                if (errCode != SUCCESS_CODE) {
                    TELEPHONY_CALL_LOG.error("Telephony_Call formatPhoneNumber failed: ${getErrorMsg(errCode)}")
                    throw BusinessException(getErrorCode(errCode),
                        "TelephonyCall formatPhoneNumber failed: ${getErrorMsg(errCode)}")
                }
            }
            return result
        }
    }
}
