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

package ohos.telephony.call

import ohos.base.*
import ohos.app.ability.ui_ability.*
import ohos.app.ability.want.*
import std.collection.*
import ohos.encoding.json.*
import ohos.ffi.*
import std.collection.*
import ohos.labels.*

/**
 * Provides methods related to call management.
 *
 * @relation declare namespace call
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.CallManager"
]
public class TelephonyCall {
    static init() {
        unsafe {
            FfiOHOSTelephonyCallInit()
        }
    }

    /**
     * Formats a phone number into an E.164 representation.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1.Mandatory parameters are left unspecified;
     * 2. Incorrect parameters types;
     * @throws { BusinessException } 8300001 - Invalid parameter value.
     * @throws { BusinessException } 8300002 - Operation failed. Cannot connect to service.
     * @throws { BusinessException } 8300003 - System internal error.
     * @throws { BusinessException } 8300999 - Unknown error code.
     * @relation function formatPhoneNumberToE164(phoneNumber: string, countryCode: string): Promise<string>
     */
    @!APILevel[
        21,
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

    /**
     * Go to the dial screen and the called number is displayed.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1.Mandatory parameters are left unspecified;
     * 2. Incorrect parameters types;
     * @throws { BusinessException } 8300001 - Invalid parameter value.
     * @throws { BusinessException } 8300002 - Operation failed. Cannot connect to service.
     * @throws { BusinessException } 8300003 - System internal error.
     * @throws { BusinessException } 8300999 - Unknown error code.
     * @relation function makeCall(phoneNumber: string): Promise<void>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.Contacts"
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

    /**
     * Go to the dial screen and the called number is displayed.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1.Mandatory parameters are left unspecified;
     * 2. Incorrect parameters types;
     * @throws { BusinessException } 8300001 - Invalid parameter value.
     * @throws { BusinessException } 8300002 - Operation failed. Cannot connect to service.
     * @throws { BusinessException } 8300003 - System internal error.
     * @throws { BusinessException } 8300999 - Unknown error code.
     * @relation function makeCall(context: Context, phoneNumber: string): Promise<void>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.Contacts"
    ]
    public static func makeCall(context: UIAbilityContext, phoneNumber: String): Unit {
        let parametersMap = HashMap<String, WantValueType>()
        parametersMap.add("phoneNumber", StringValue(phoneNumber))
        parametersMap.add("pageFlag", StringValue("page_flag_edit_before_calling"))
        context.startAbility(
            Want(bundleName: "com.ohos.contacts", abilityName: "com.ohos.contacts.MainAbility",
                parameters: parametersMap))
    }

    /**
     * Checks whether a phone number is on the emergency number list.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1.Mandatory parameters are left unspecified;
     * 2. Incorrect parameters types;
     * @throws { BusinessException } 8300001 - Invalid parameter value.
     * @throws { BusinessException } 8300002 - Operation failed. Cannot connect to service.
     * @throws { BusinessException } 8300003 - System internal error.
     * @throws { BusinessException } 8300999 - Unknown error code.
     * @relation function isEmergencyPhoneNumber(phoneNumber: string, options?: EmergencyNumberOptions): Promise<boolean>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    public static func isEmergencyPhoneNumber(phoneNumber: String, options: EmergencyNumberOptions): Bool {
        unsafe {
            var result = true
            try (cNumber = LibC.mallocCString(phoneNumber).asResource()) {
                var errCode = 0i32
                result = FfiOHOSTelephonyCallIsEmergencyPhoneNumber(cNumber.value, options.slotId, inout errCode)
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
     * Checks whether a phone number is on the emergency number list.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1.Mandatory parameters are left unspecified;
     * 2. Incorrect parameters types;
     * @throws { BusinessException } 8300001 - Invalid parameter value.
     * @throws { BusinessException } 8300002 - Operation failed. Cannot connect to service.
     * @throws { BusinessException } 8300003 - System internal error.
     * @throws { BusinessException } 8300999 - Unknown error code.
     * @relation function isEmergencyPhoneNumber(phoneNumber: string, callback: AsyncCallback<boolean>): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    public static func isEmergencyPhoneNumber(phoneNumber: String): Bool {
        return isEmergencyPhoneNumber(phoneNumber, EmergencyNumberOptions(0))
    }

    /**
     * Checks whether a call is ongoing.
     *
     * @relation function hasCallSync(): boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    public static func hasCall(): Bool {
        return unsafe { FfiOHOSTelephonyCallHasCall() }
    }

    /**
     * Obtains the call state.
     *
     * @relation function getCallStateSync(): CallState
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    public static func getCallState(): CallState {
        let enumCode = unsafe { FfiOHOSTelephonyCallGetCallState() }
        return CallState.parse(enumCode)
    }

    /**
     * Checks whether a device supports voice calls.
     *
     * @relation function hasVoiceCapability(): boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    public static func hasVoiceCapability(): Bool {
        unsafe {
            return FfiOHOSTelephonyCallHasVoiceCapability()
        }
    }

    /**
     * Formats a phone number according to the Chinese Telephone Code Plan. Before the formatting,
     * a phone number is in the format of country code (if any) + 3-digit service provider code
     * + 4-digit area code + 4-digit subscriber number. After the formatting,
     * each part is separated by a space.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1.Mandatory parameters are left unspecified;
     * 2. Incorrect parameters types;
     * @throws { BusinessException } 8300001 - Invalid parameter value.
     * @throws { BusinessException } 8300002 - Operation failed. Cannot connect to service.
     * @throws { BusinessException } 8300003 - System internal error.
     * @throws { BusinessException } 8300999 - Unknown error code.
     * @relation function formatPhoneNumber(phoneNumber: string, options?: NumberFormatOptions): Promise<string>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    public static func formatPhoneNumber(
        phoneNumber: String,
        options!: NumberFormatOptions = NumberFormatOptions()
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
