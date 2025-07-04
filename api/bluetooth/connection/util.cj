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

import ohos.bluetooth.constant.*
import ohos.bluetooth.common_util.*
import std.deriving.*
import ohos.labels.*
import ohos.ffi.*
import ohos.bluetooth.*

/**
 * Describes the class of a bluetooth device.
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class BondStateParam {
    BondStateParam(
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let deviceId: String,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let state: BondState,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let cause: UnbondCause
    ) {}
}

@C
struct CBondStateParam {
    CBondStateParam(
        let deviceId: CString,
        let state: Int32,
        let cause: Int32
    ) {}

    func toObject(): BondStateParam {
        BondStateParam(
            // MAC address translation does not throw exception.
            deviceId.toString(),
            BondState.parse(state),
            UnbondCause.parse(cause)
        )
    }
}

/**
 * Describes the bond key param.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class PinRequiredParam {
    PinRequiredParam(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let deviceId: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let pinCode: String
    ) {}
}

@C
struct CPinRequiredParam {
    CPinRequiredParam(
        let deviceId: CString,
        let pinCode: CString
    ) {}

    func toObject(): PinRequiredParam {
        PinRequiredParam(
            deviceId.toString(),
            pinCode.toString()
        )
    }
}

/**
 * Describes the class of a bluetooth device.
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class DeviceClass {
    DeviceClass(
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let majorClass: MajorClass,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let majorMinorClass: MajorMinorClass,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let classOfDevice: Int32
    ) {}
}

@C
struct CDeviceClass {
    CDeviceClass(
        let majorClass: Int32,
        let majorMinorClass: Int32,
        let classOfDevice: Int32
    ) {}

    func toObject(): DeviceClass {
        DeviceClass(
            MajorClass.parse(majorClass),
            MajorMinorClass.parse(majorMinorClass),
            classOfDevice
        )
    }
}

/**
 * Describes the contents of the battery information.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class BatteryInfo {
    BatteryInfo(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let batteryLevel: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let leftEarBatteryLevel: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let leftEarChargeState: DeviceChargeState,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let rightEarBatteryLevel: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let rightEarChargeState: DeviceChargeState,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let boxBatteryLevel: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let boxChargeState: DeviceChargeState
    ) {}
}

@C
struct CBatteryInfo {
    CBatteryInfo(
        let batteryLevel: Int32,
        let leftEarBatteryLevel: Int32,
        let leftEarChargeState: Int32,
        let rightEarBatteryLevel: Int32,
        let rightEarChargeState: Int32,
        let boxBatteryLevel: Int32,
        let boxChargeState: Int32
    ) {}

    func toObject(): BatteryInfo {
        BatteryInfo(
            batteryLevel,
            leftEarBatteryLevel,
            DeviceChargeState.parse(leftEarChargeState),
            rightEarBatteryLevel,
            DeviceChargeState.parse(rightEarChargeState),
            boxBatteryLevel,
            DeviceChargeState.parse(boxChargeState)
        )
    }
}

/**
 * Enum for the transport of a remote device
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum BluetoothTransport {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    TRANSPORT_BR_EDR
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    TRANSPORT_LE
    | ...
}

/**
 * The enum of BR scan mode.
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum ScanMode {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    SCAN_MODE_NONE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    SCAN_MODE_CONNECTABLE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    SCAN_MODE_GENERAL_DISCOVERABLE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    SCAN_MODE_LIMITED_DISCOVERABLE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE
    | ...

    static func parse(mode: Int32): ScanMode {
        match (mode) {
            case 0 => SCAN_MODE_NONE
            case 1 => SCAN_MODE_CONNECTABLE
            case 2 => SCAN_MODE_GENERAL_DISCOVERABLE
            case 3 => SCAN_MODE_LIMITED_DISCOVERABLE
            case 4 => SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE
            case 5 => SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE
            case _ => throw NoneValueException("internal error")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case SCAN_MODE_NONE => 0
            case SCAN_MODE_CONNECTABLE => 1
            case SCAN_MODE_GENERAL_DISCOVERABLE => 2
            case SCAN_MODE_LIMITED_DISCOVERABLE => 3
            case SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE => 4
            case SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE => 5
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * The enum of bond state.
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum BondState {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    BOND_STATE_INVALID
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    BOND_STATE_BONDING
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    BOND_STATE_BONDED
    | ...

    static func parse(state: Int32): BondState {
        match (state) {
            case 0 => BOND_STATE_INVALID
            case 1 => BOND_STATE_BONDING
            case 2 => BOND_STATE_BONDED
            case _ => throw NoneValueException("internal error")
        }
    }
}

/**
 * Enum for cause of unbond.
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum UnbondCause {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    USER_REMOVED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    REMOTE_DEVICE_DOWN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    AUTH_FAILURE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    AUTH_REJECTED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    INTERNAL_ERROR
    | ...

    static func parse(cause: Int32): UnbondCause {
        match (cause) {
            case 0 => USER_REMOVED
            case 1 => REMOTE_DEVICE_DOWN
            case 2 => AUTH_FAILURE
            case 3 => AUTH_REJECTED
            case 4 => INTERNAL_ERROR
            case _ => throw NoneValueException("internal error")
        }
    }
}

/**
 * The charge state of the left ear.
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum DeviceChargeState {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    DEVICE_NORMAL_CHARGE_NOT_CHARGED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    DEVICE_NORMAL_CHARGE_IN_CHARGING
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    DEVICE_SUPER_CHARGE_NOT_CHARGED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    DEVICE_SUPER_CHARGE_IN_CHARGING
    | ...

    static func parse(state: Int32): DeviceChargeState {
        match (state) {
            case 0 => DEVICE_NORMAL_CHARGE_NOT_CHARGED
            case 1 => DEVICE_NORMAL_CHARGE_IN_CHARGING
            case 2 => DEVICE_SUPER_CHARGE_NOT_CHARGED
            case 3 => DEVICE_SUPER_CHARGE_IN_CHARGING
            case _ => throw NoneValueException("internal error")
        }
    }
}

unsafe func cArrString2ArrProfileUuids(cArr: CArrString): Array<ProfileUuids> {
    let ptr = cArr.head
    if (ptr.isNull()) {
        return Array<ProfileUuids>()
    }
    let size = cArr.size
    let ret = Array<ProfileUuids>(
        size,
        {
            i =>
            let cString = ptr.read(i)
            let uuid = cString.toString()
            BLUETOOTH_LOG.info("remote device profile uuid has ${uuid}")
            ProfileUuids.parse(uuid)
        }
    )
    return ret
}
