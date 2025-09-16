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

/**
 * Created on 2025/8/4
 */
package ohos_app_cangjie_entry

import std.unittest.testmacro.*
import std.unittest.*
import std.unittest.common.*
import kit.ConnectivityKit.*

public func stringifierAdvertisingState(advertisingState: AdvertisingState): String {
    match (advertisingState) {
        case STARTED => "STARTED"
        case ENABLED => "ENABLED"
        case DISABLED => "DISABLED"
        case STOPPED => "STOPPED"
        case _ => throw Exception("unsupported enum constructor")
    }
}

public func stringifierBluetoothBleCallbackType(bluetoothBleCallbackType: BluetoothBleCallbackType): String {
    match (bluetoothBleCallbackType) {
        case ADVERTISING_STATE_CHANGE => "ADVERTISING_STATE_CHANGE"
        case BLE_DEVICE_FIND => "BLE_DEVICE_FIND"
        case _ => throw Exception("unsupported enum constructor")
    }
}

public func stringifierBluetoothBleGattClientDeviceCallbackType(
    bluetoothBleGattClientDeviceCallbackType: BluetoothBleGattClientDeviceCallbackType): String {
    match (bluetoothBleGattClientDeviceCallbackType) {
        case BLE_CHARACTERISTIC_CHANGE => "BLE_CHARACTERISTIC_CHANGE"
        case BLE_CONNECTION_STATE_CHANGE => "BLE_CONNECTION_STATE_CHANGE"
        case BLE_MTU_CHANGE => "BLE_MTU_CHANGE"
        case _ => throw Exception("unsupported enum constructor")
    }
}

public func stringifierBluetoothBluetoothBleGattServerCallbackType(
    bluetoothBleGattServerCallbackType: BluetoothBleGattServerCallbackType): String {
    match (bluetoothBleGattServerCallbackType) {
        case CHARACTERISTIC_READ => "CHARACTERISTIC_READ"
        case CHARACTERISTIC_WRITE => "CHARACTERISTIC_WRITE"
        case DESCRIPTOR_READ => "DESCRIPTOR_READ"
        case DESCRIPTOR_WRITE => "DESCRIPTOR_WRITE"
        case CONNECTION_STATE_CHANGE => "CONNECTION_STATE_CHANGE"
        case BLE_MTU_CHANGE => "BLE_MTU_CHANGE"
        case _ => throw Exception("unsupported enum constructor")
    }
}

public func stringifierBluetoothGattWriteType(gattWriteType: GattWriteType): String {
    match (gattWriteType) {
        case WRITE => "WRITE"
        case WRITE_NO_RESPONSE => "WRITE_NO_RESPONSE"
        case _ => throw Exception("unsupported enum constructor")
    }
}

public func stringifierBluetoothMatchMode(matchMode: MatchMode): String {
    match (matchMode) {
        case MatchModeAggressive => "MatchModeAggressive"
        case MATCH_MODE_STICKY => "MATCH_MODE_STICKY"
        case _ => throw Exception("unsupported enum constructor")
    }
}

public func stringifierBluetoothPhyType(phyType: PhyType): String {
    match (phyType) {
        case PhyLe1M => "PhyLe1M"
        case PHY_LE_ALL_SUPPORTED => "PHY_LE_ALL_SUPPORTED"
        case _ => throw Exception("unsupported enum constructor")
    }
}

public func stringifierBluetoothScanDuty(scanDuty: ScanDuty): String {
    match (scanDuty) {
        case ScanModeLowPower => "ScanModeLowPower"
        case SCAN_MODE_BALANCED => "SCAN_MODE_BALANCED"
        case SCAN_MODE_LOW_LATENCY => "SCAN_MODE_LOW_LATENCY"
        case _ => throw Exception("unsupported enum constructor")
    }
}

@Test
class Test_ble_enum {
    /*
     * @tc.number    : Sub_Cangjie_ConnectivityKit_test_ble_enum_AdvertisingState
     * @tc.name      : test_ble_enum_AdvertisingState
     * @tc.desc      : test_ble_enum_AdvertisingState
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
//    @TestCase
//    @Tag[APILevel19, TestLevel0]
//    func test_ble_enum_AdvertisingState() {
//        try {
//            @Expect(stringifierAdvertisingState(STARTED),"STARTED")
//            @Expect(stringifierAdvertisingState(ENABLED),"ENABLED")
//            @Expect(stringifierAdvertisingState(STARTED),"STARTED")
//            @Expect(stringifierAdvertisingState(DISABLED),"DISABLED")
//            @Expect(stringifierAdvertisingState(STOPPED),"STOPPED")
//        } catch (e: Exception) {
//            throw Exception("ENUM NOT MATCHED")
//        }
//    }

    /*
     * @tc.number    : Sub_Cangjie_ConnectivityKit_test_ble_enum_BluetoothBleCallbackType
     * @tc.name      : test_ble_enum_BluetoothBleCallbackType
     * @tc.desc      : test_ble_enum_BluetoothBleCallbackType
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
//    @TestCase
//    @Tag[APILevel19, TestLevel0]
//    func test_ble_enum_BluetoothBleCallbackType() {
//        try {
//            @Expect(stringifierBluetoothBleCallbackType(ADVERTISING_STATE_CHANGE),"ADVERTISING_STATE_CHANGE")
//            @Expect(stringifierBluetoothBleCallbackType(BLE_DEVICE_FIND),"BLE_DEVICE_FIND")
//        } catch (e: Exception) {
//            throw Exception("ENUM NOT MATCHED")
//        }
//    }

    /*
     * @tc.number    : Sub_Cangjie_ConnectivityKit_test_ble_enum_BluetoothBleGattClientDeviceCallbackType
     * @tc.name      : test_ble_enum_BluetoothBleGattClientDeviceCallbackType
     * @tc.desc      : test_ble_enum_BluetoothBleGattClientDeviceCallbackType
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
//    @TestCase
//    @Tag[APILevel19, TestLevel0]
//    func test_ble_enum_BluetoothBleGattClientDeviceCallbackType() {
//        try {
//            @Expect(stringifierBluetoothBleGattClientDeviceCallbackType(BLE_CHARACTERISTIC_CHANGE),"BLE_CHARACTERISTIC_CHANGE")
//            @Expect(stringifierBluetoothBleGattClientDeviceCallbackType(BLE_CONNECTION_STATE_CHANGE),"BLE_CONNECTION_STATE_CHANGE")
//        //            @Expect(stringifierBluetoothBleGattClientDeviceCallbackType(BLE_MTU_CHANGE),"BLE_MTU_CHANGE")
//        } catch (e: Exception) {
//            throw Exception("ENUM NOT MATCHED")
//        }
//    }

    /*
     * @tc.number    : Sub_Cangjie_ConnectivityKit_test_ble_enum_BluetoothBleGattServerCallbackType
     * @tc.name      : test_ble_enum_BluetoothBleGattServerCallbackType
     * @tc.desc      : test_ble_enum_BluetoothBleGattServerCallbackType
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
//    @TestCase
//    @Tag[APILevel19, TestLevel0]
//    func test_ble_enum_BluetoothBleGattServerCallbackType() {
//        try {
//            @Expect(stringifierBluetoothBluetoothBleGattServerCallbackType(CHARACTERISTIC_READ),"CHARACTERISTIC_READ")
//            @Expect(stringifierBluetoothBluetoothBleGattServerCallbackType(CHARACTERISTIC_WRITE),"CHARACTERISTIC_WRITE")
//            @Expect(stringifierBluetoothBluetoothBleGattServerCallbackType(DESCRIPTOR_READ),"DESCRIPTOR_READ")
//            @Expect(stringifierBluetoothBluetoothBleGattServerCallbackType(DESCRIPTOR_WRITE),"DESCRIPTOR_WRITE")
//        //            @Expect(stringifierBluetoothBluetoothBleGattServerCallbackType(BLE_MTU_CHANGE),"BLE_MTU_CHANGE")
//        } catch (e: Exception) {
//            throw Exception("ENUM NOT MATCHED")
//        }
//    }

    /*
     * @tc.number    : Sub_Cangjie_ConnectivityKit_test_ble_enum_MatchMode
     * @tc.name      : test_ble_enum_MatchMode
     * @tc.desc      : test_ble_enum_MatchMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
//    @TestCase
//    @Tag[APILevel19, TestLevel0]
//    func test_ble_enum_MatchMode() {
//        try {
//            @Expect(stringifierBluetoothMatchMode(MatchModeAggressive),"MatchModeAggressive")
//            @Expect(stringifierBluetoothMatchMode(MATCH_MODE_STICKY),"MATCH_MODE_STICKY")
//        } catch (e: Exception) {
//            throw Exception("ENUM NOT MATCHED")
//        }
//    }

    /*
     * @tc.number    : Sub_Cangjie_ConnectivityKit_test_ble_enum_PhyType
     * @tc.name      : test_ble_enum_PhyType
     * @tc.desc      : test_ble_enum_PhyType
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
//    @TestCase
//    @Tag[APILevel19, TestLevel0]
//    func test_ble_enum_PhyType() {
//        try {
//            @Expect(stringifierBluetoothPhyType(PhyLe1M),"PhyLe1M")
//            @Expect(stringifierBluetoothPhyType(PHY_LE_ALL_SUPPORTED),"PHY_LE_ALL_SUPPORTED")
//        } catch (e: Exception) {
//            throw Exception("ENUM NOT MATCHED")
//        }
//    }

    /*
     * @tc.number    : Sub_Cangjie_ConnectivityKit_test_ble_enum_ScanDuty
     * @tc.name      : test_ble_enum_ScanDuty
     * @tc.desc      : test_ble_enum_ScanDuty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
//    @TestCase
//    @Tag[APILevel19, TestLevel0]
//    func test_ble_enum_ScanDuty() {
//        try {
//            @Expect(stringifierBluetoothScanDuty(ScanModeLowPower),"ScanModeLowPower")
//            @Expect(stringifierBluetoothScanDuty(SCAN_MODE_BALANCED),"SCAN_MODE_BALANCED")
//            @Expect(stringifierBluetoothScanDuty(SCAN_MODE_LOW_LATENCY),"SCAN_MODE_LOW_LATENCY")
//        } catch (e: Exception) {
//            throw Exception("ENUM NOT MATCHED")
//        }
//    }
}
