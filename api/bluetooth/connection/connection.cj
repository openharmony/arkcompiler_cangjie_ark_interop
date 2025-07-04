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

package ohos.bluetooth.connection

import ohos.base.*
import ohos.bluetooth.*
import ohos.ffi.*
import ohos.labels.*
import ohos.bluetooth.common_util.*
import ohos.bluetooth.constant.*

/**
 * Starts pairing with a remote Bluetooth device.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @param { String } deviceId - Indicates device ID. For example, "11:22:33:AA:BB:FF".
 * @param { AsyncCallback<void> } callback - the callback of pairDevice.
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
 * <br>2. Incorrect parameter types. 3. Parameter verification failed.
 * @throws { BusinessError } 801 - Capability not supported.
 * @throws { BusinessError } 2900001 - Service stopped.
 * @throws { BusinessError } 2900003 - Bluetooth disabled.
 * @throws { BusinessError } 2900099 - Operation failed.
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func pairDevice(deviceId: String): Unit {
    var errorCode: Int32 = 0
    unsafe {
        try (id = LibC.mallocCString(deviceId).asResource()) {
            FfiBluetoothConPairDevice(id.value, inout errorCode)
        }
    }
    if (errorCode != SUCCESS_CODE) {
        throw BusinessException(errorCode, getErrorMsg(errorCode))
    }
}

/**
 * Obtains the name of a peer Bluetooth device.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @param { String } deviceId - Indicates device ID. For example, "11:22:33:AA:BB:FF".
 * @returns { String } Returns the device name in character string format.
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
 * <br>2. Incorrect parameter types. 3. Parameter verification failed.
 * @throws { BusinessError } 801 - Capability not supported.
 * @throws { BusinessError } 2900001 - Service stopped.
 * @throws { BusinessError } 2900003 - Bluetooth disabled.
 * @throws { BusinessError } 2900099 - Operation failed.
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func getRemoteDeviceName(deviceId: String): String {
    var errorCode: Int32 = 0
    var str = ""
    unsafe {
        try (id = LibC.mallocCString(deviceId).asResource()) {
            let cValue = FfiBluetoothConGetRemoteDeviceName(id.value, inout errorCode)
            if (errorCode != SUCCESS_CODE) {
                LibC.free(cValue)
                throw BusinessException(errorCode, getErrorMsg(errorCode))
            }
            // may be invalid UTF8 and may be parsed abnormally
            try {
                str = cValue.toString()
            } finally {
                LibC.free(cValue)
            }
        }
    }
    return str
}

/**
 * Obtains the class of a peer Bluetooth device.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @param { String } deviceId - Indicates device ID. For example, "11:22:33:AA:BB:FF".
 * @returns { DeviceClass } The class of the remote device.
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
 * <br>2. Incorrect parameter types. 3. Parameter verification failed.
 * @throws { BusinessError } 801 - Capability not supported.
 * @throws { BusinessError } 2900001 - Service stopped.
 * @throws { BusinessError } 2900003 - Bluetooth disabled.
 * @throws { BusinessError } 2900099 - Operation failed.
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    crossplatform: true,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func getRemoteDeviceClass(deviceId: String): DeviceClass {
    var errorCode: Int32 = 0
    var cDeviceClass = CDeviceClass(0i32, 0i32, 0i32)
    unsafe {
        try (id = LibC.mallocCString(deviceId).asResource()) {
            cDeviceClass = FfiBluetoothConGetRemoteDeviceClass(id.value, inout errorCode)
        }
    }
    if (errorCode != SUCCESS_CODE) {
        throw BusinessException(errorCode, getErrorMsg(errorCode))
    }
    BLUETOOTH_LOG.info(
        '''
    the majorClass is ${cDeviceClass.majorClass},
    the majorMinorClass is ${cDeviceClass.majorMinorClass},
    the classOfDevice is ${cDeviceClass
            .classOfDevice}''')
    return cDeviceClass.toObject()
}

/**
 * Obtains the profile UUIDs supported by the remote device.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @param { String } deviceId - Indicates device ID. For example, "11:22:33:AA:BB:FF".
 * @param { Array<ProfileUuids> } profile UUIDs supported by the remote device.
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 401 - Invalid parameter.
 * @throws { BusinessError } 801 - Capability not supported.
 * @throws { BusinessError } 2900001 - Service stopped.
 * @throws { BusinessError } 2900003 - Bluetooth disabled.
 * @throws { BusinessError } 2900099 - Operation failed.
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    crossplatform: true,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func getRemoteProfileUuids(deviceId: String): Array<ProfileUuids> {
    var errorCode: Int32 = 0
    var profileUuids = Array<ProfileUuids>()
    unsafe {
        try (id = LibC.mallocCString(deviceId).asResource()) {
            let cProfileUuids = FfiBluetoothConGetRemoteProfileUuids(id.value, inout errorCode)
            if (errorCode != SUCCESS_CODE) {
                cProfileUuids.free()
                throw BusinessException(errorCode, getErrorMsg(errorCode))
            }
            // Universally Unique Identifier translation does not throw exception.
            profileUuids = cArrString2ArrProfileUuids(cProfileUuids)
            cProfileUuids.free()
        }
    }
    return profileUuids
}

/**
 * Obtains the Bluetooth local name of a device.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @returns { String } Returns the name the device.
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 801 - Capability not supported.
 * @throws { BusinessError } 2900001 - Service stopped.
 * @throws { BusinessError } 2900099 - Operation failed.
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    crossplatform: true,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func getLocalName(): String {
    var errorCode: Int32 = 0
    var name = ""
    unsafe {
        let cValue = FfiBluetoothConGetLocalName(inout errorCode)
        if (errorCode != SUCCESS_CODE) {
            LibC.free(cValue)
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
        // may be invalid UTF8 and may be parsed abnormally
        try {
            name = cValue.toString()
        } finally {
            LibC.free(cValue)
        }
    }
    return name
}

/**
 * Obtains the list of Bluetooth devices that have been paired with the current device.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @returns { Array<String> } Returns a list of paired Bluetooth devices's address.
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 801 - Capability not supported.
 * @throws { BusinessError } 2900001 - Service stopped.
 * @throws { BusinessError } 2900003 - Bluetooth disabled.
 * @throws { BusinessError } 2900099 - Operation failed.
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func getPairedDevices(): Array<String> {
    var errorCode: Int32 = 0
    var devices = Array<String>()
    unsafe {
        let cDevices = FfiBluetoothConGetPairedDevices(inout errorCode)
        if (errorCode != SUCCESS_CODE) {
            cDevices.free()
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
        devices = cArrString2ArrString(cDevices)
        cDevices.free()
    }
    return devices
}

/**
 * Obtains the pair state of a specified device.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @param { String } deviceId - Indicates device ID. For example, "11:22:33:AA:BB:FF".
 * @returns { BondState } Returns the pair state.
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
 * <br>2. Incorrect parameter types. 3. Parameter verification failed.
 * @throws { BusinessError } 801 - Capability not supported.
 * @throws { BusinessError } 2900001 - Service stopped.
 * @throws { BusinessError } 2900003 - Bluetooth disabled.
 * @throws { BusinessError } 2900099 - Operation failed.
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func getPairState(deviceId: String): BondState {
    var errorCode: Int32 = 0
    var res = BOND_STATE_INVALID
    unsafe {
        try (id = LibC.mallocCString(deviceId).asResource()) {
            let state = FfiBluetoothConGetPairState(id.value, inout errorCode)
            BLUETOOTH_LOG.info("pair state is ${state}")
            res = BondState.parse(state)
        }
    }
    if (errorCode != SUCCESS_CODE) {
        throw BusinessException(errorCode, getErrorMsg(errorCode))
    }
    return res
}

/**
 * Get the profile connection state of the current device.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @param { ?ProfileId } [profileId] - Indicate the profile id. This is an optional parameter.
 *                                  With profileId, returns the current connection state of this profile, {@link ProfileConnectionState}.
 *                                  Without profileId, if any profile is connected, {@link ProfileConnectionState#STATE_CONNECTED} is returned.
 *                                  Otherwise, {@link ProfileConnectionState#STATE_DISCONNECTED} is returned.
 * @returns { ProfileConnectionState } Returns the connection state.
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 401 - Invalid parameter. Possible causes: 1. Incorrect parameter types.
 * @throws { BusinessError } 801 - Capability not supported.
 * @throws { BusinessError } 2900001 - Service stopped.
 * @throws { BusinessError } 2900003 - Bluetooth disabled.
 * @throws { BusinessError } 2900004 - Profile not supported.
 * @throws { BusinessError } 2900099 - Operation failed.
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    crossplatform: true,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func getProfileConnectionState(profileId!: ?ProfileId = None): ProfileConnectionState {
    var errorCode: Int32 = 0
    var id: Int32 = profileId?.getValue() ?? 0
    var state: Int32 = 0
    unsafe {
        state = FfiBluetoothConGetProfileConnectionState(id, inout errorCode)
    }
    BLUETOOTH_LOG.info("profile connection state is ${state}")
    if (errorCode != SUCCESS_CODE) {
        throw BusinessException(errorCode, getErrorMsg(errorCode))
    }
    return ProfileConnectionState.parse(state)
}

/**
 * Sets the confirmation of pairing with a certain device.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH and ohos.permission.MANAGE_BLUETOOTH
 * @param { String } deviceId - Indicates device ID. For example, "11:22:33:AA:BB:FF".
 * @param { Bool } accept - Indicates whether to accept the pairing request, {@code true} indicates accept or {@code false} otherwise.
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
 * <br>2. Incorrect parameter types. 3. Parameter verification failed.
 * @throws { BusinessError } 801 - Capability not supported.
 * @throws { BusinessError } 2900001 - Service stopped.
 * @throws { BusinessError } 2900003 - Bluetooth disabled.
 * @throws { BusinessError } 2900099 - Operation failed.
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    permission: "ACCESS_BLUETOOTH" & "MANAGE_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func setDevicePairingConfirmation(deviceId: String, accept: Bool): Unit {
    var errorCode: Int32 = 0
    unsafe {
        try (id = LibC.mallocCString(deviceId).asResource()) {
            FfiBluetoothConSetDevicePairingConfirmation(id.value, accept, inout errorCode)
        }
    }
    if (errorCode != SUCCESS_CODE) {
        throw BusinessException(errorCode, getErrorMsg(errorCode))
    }
}

/**
 * Set the pin during pairing when the pin type is PIN_TYPE_ENTER_PIN_CODE.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @param { String } deviceId - Indicates device ID. For example, "11:22:33:AA:BB:FF".
 * @param { String } code - The pin code entered by the user.
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
 * <br>2. Incorrect parameter types. 3. Parameter verification failed.
 * @throws { BusinessError } 801 - Capability not supported.
 * @throws { BusinessError } 2900001 - Service stopped.
 * @throws { BusinessError } 2900003 - Bluetooth disabled.
 * @throws { BusinessError } 2900099 - Operation failed.
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func setDevicePinCode(deviceId: String, code: String): Unit {
    var errorCode: Int32 = 0
    unsafe {
        try (
            id = LibC.mallocCString(deviceId).asResource(),
            cCode = LibC.mallocCString(code).asResource()
        ) {
            FfiBluetoothConSetDevicePinCode(id.value, cCode.value, inout errorCode)
        }
    }
    if (errorCode != SUCCESS_CODE) {
        throw BusinessException(errorCode, getErrorMsg(errorCode))
    }
}

/**
 * Sets the Bluetooth friendly name of a device. It is used only by system applications for security.
 * If a non-system application invokes the interface, exception 801 is thrown.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @param { String } name - Indicates a valid Bluetooth name.
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
 * <br>2. Incorrect parameter types. 3. Parameter verification failed.
 * @throws { BusinessError } 801 - Capability not supported.
 * @throws { BusinessError } 2900001 - Service stopped.
 * @throws { BusinessError } 2900003 - Bluetooth disabled.
 * @throws { BusinessError } 2900099 - Operation failed.
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    12,
    deprecated: 19,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func setLocalName(name: String): Unit {
    var errorCode: Int32 = 0
    unsafe {
        try (cName = LibC.mallocCString(name).asResource()) {
            FfiBluetoothConSetLocalName(cName.value, inout errorCode)
        }
    }
    if (errorCode != SUCCESS_CODE) {
        throw BusinessException(errorCode, getErrorMsg(errorCode))
    }
}

/**
 * Sets the Bluetooth scan mode for a device.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @param { ScanMode } mode - Indicates the Bluetooth scan mode to set.
 * @param { Int32 } duration - Indicates the duration in seconds, in which the host is discoverable.
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
 * <br>2. Incorrect parameter types. 3. Parameter verification failed.
 * @throws { BusinessError } 801 - Capability not supported.
 * @throws { BusinessError } 2900001 - Service stopped.
 * @throws { BusinessError } 2900003 - Bluetooth disabled.
 * @throws { BusinessError } 2900099 - Operation failed.
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func setBluetoothScanMode(mode: ScanMode, duration: Int32): Unit {
    var errorCode: Int32 = 0
    let cMode = mode.getValue()
    unsafe {
        FfiBluetoothConSetBluetoothScanMode(cMode, duration, inout errorCode)
    }
    if (errorCode != SUCCESS_CODE) {
        throw BusinessException(errorCode, getErrorMsg(errorCode))
    }
}

/**
 * Obtains the Bluetooth scanning mode of a device.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @returns { ScanMode } Returns the Bluetooth scanning mode.
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 801 - Capability not supported.
 * @throws { BusinessError } 2900001 - Service stopped.
 * @throws { BusinessError } 2900003 - Bluetooth disabled.
 * @throws { BusinessError } 2900099 - Operation failed.
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    crossplatform: true,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func getBluetoothScanMode(): ScanMode {
    var errorCode: Int32 = 0
    var mode = ScanMode.SCAN_MODE_NONE
    unsafe {
        let cMode = FfiBluetoothConGetBluetoothScanMode(inout errorCode)
        mode = ScanMode.parse(cMode)
        BLUETOOTH_LOG.info("bluetooth scan mode is ${cMode}")
    }
    if (errorCode != SUCCESS_CODE) {
        throw BusinessException(errorCode, getErrorMsg(errorCode))
    }
    return mode
}

/**
 * Starts scanning Bluetooth devices.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 801 - Capability not supported.
 * @throws { BusinessError } 2900001 - Service stopped.
 * @throws { BusinessError } 2900003 - Bluetooth disabled.
 * @throws { BusinessError } 2900099 - Operation failed.
 * @syscap SystemCapability.Communication.Bluetooth.Core
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func startBluetoothDiscovery(): Unit {
    var errorCode: Int32 = 0
    unsafe {
        FfiBluetoothConStartBluetoothDiscovery(inout errorCode)
    }
    if (errorCode != SUCCESS_CODE) {
        throw BusinessException(errorCode, getErrorMsg(errorCode))
    }
}

/**
 * Stops Bluetooth device scanning.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 801 - Capability not supported.
 * @throws { BusinessError } 2900001 - Service stopped.
 * @throws { BusinessError } 2900003 - Bluetooth disabled.
 * @throws { BusinessError } 2900099 - Operation failed.
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func stopBluetoothDiscovery(): Unit {
    var errorCode: Int32 = 0
    unsafe {
        FfiBluetoothConStopBluetoothDiscovery(inout errorCode)
    }
    if (errorCode != SUCCESS_CODE) {
        throw BusinessException(errorCode, getErrorMsg(errorCode))
    }
}

/**
 * Check if bluetooth is discovering.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @returns { Bool } Returns {@code true} if the local device is discovering; returns {@code false} otherwise.
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 801 - Capability not supported.
 * @throws { BusinessError } 2900001 - Service stopped.
 * @throws { BusinessError } 2900003 - Bluetooth disabled.
 * @throws { BusinessError } 2900099 - Operation failed.
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    crossplatform: true,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func isBluetoothDiscovering(): Bool {
    var errorCode: Int32 = 0
    var isDiscovering = false
    unsafe {
        isDiscovering = FfiBluetoothConIsBluetoothDiscovering(inout errorCode)
    }
    if (errorCode != SUCCESS_CODE) {
        throw BusinessException(errorCode, getErrorMsg(errorCode))
    }
    return isDiscovering
}

/**
 * Modify remote device name.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @param { String } deviceId - Indicates device ID. For example, "11:22:33:AA:BB:FF".
 * @param { String } name - New device name. Max length is 64 bytes.
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
 * <br>2. Incorrect parameter types. 3. Parameter verification failed.
 * @throws { BusinessError } 2900001 - Service stopped.
 * @throws { BusinessError } 2900003 - Bluetooth disabled.
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    crossplatform: true,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func setRemoteDeviceName(deviceId: String, name: String): Unit {
    var errorCode: Int32 = 0
    unsafe {
        try (
            id = LibC.mallocCString(deviceId).asResource(),
            cName = LibC.mallocCString(name).asResource()
        ) {
            FfiBluetoothConSetRemoteDeviceName(id.value, cName.value, inout errorCode)
        }
    }
    if (errorCode != SUCCESS_CODE) {
        throw BusinessException(errorCode, getErrorMsg(errorCode))
    }
}

/**
 * Get remote device battery information.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @param { String } deviceId - Indicates device ID. For example, "11:22:33:AA:BB:FF".
 * @returns { BatteryInfo } Returns battery info.
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 401 - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
 * <br>2. Incorrect parameter types. 3. Parameter verification failed.
 * @throws { BusinessError } 2900001 - Service stopped.
 * @throws { BusinessError } 2900003 - Bluetooth disabled.
 * @syscap SystemCapability.Communication.Bluetooth.Core
 */
@!APILevel[
    19,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func getRemoteDeviceBatteryInfo(deviceId: String): BatteryInfo {
    var errorCode: Int32 = 0
    var cBatteryInfo = CBatteryInfo(0, 0, 0, 0, 0, 0, 0)
    unsafe {
        try (id = LibC.mallocCString(deviceId).asResource()) {
            cBatteryInfo = FfiBluetoothConGetRemoteDeviceBatteryInfo(id.value, inout errorCode)
            if (errorCode != SUCCESS_CODE) {
                throw BusinessException(errorCode, getErrorMsg(errorCode))
            }
            BLUETOOTH_LOG.info(
                '''
            remote device batteryLevel is ${cBatteryInfo.batteryLevel},
            remote device leftEarBatteryLevel is ${cBatteryInfo
                    .leftEarBatteryLevel},
            remote device leftEarChargeState is ${cBatteryInfo
                    .leftEarChargeState}
            remote device rightEarBatteryLevel is ${cBatteryInfo
                    .rightEarBatteryLevel},
            remote device rightEarBatteryLevel is ${cBatteryInfo
                    .rightEarChargeState},
            remote device boxBatteryLevel is ${cBatteryInfo
                    .rightEarChargeState},
            remote device boxChargeState is ${cBatteryInfo
                    .rightEarChargeState}''')
        }
    }
    return cBatteryInfo.toObject()
}
