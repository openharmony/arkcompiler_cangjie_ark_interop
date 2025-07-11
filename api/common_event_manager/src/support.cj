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

package ohos.common_event_manager

import ohos.base.*
import ohos.labels.*

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.CommonEvent"
]
public enum Support {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventAbilityAdded
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventAbilityRemoved
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventAbilityUpdated
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventAccountDeleted
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventAirplaneModeChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventAudioQualityChange
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBatteryChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBatteryLow
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBatteryOkay
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothHandsfreeAgConnectStateUpdate
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothHandsfreeAgCurrentDeviceUpdate
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothHandsfreeAgAudioStateUpdate
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothA2DpsourceConnectStateUpdate
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothA2DpsourceCurrentDeviceUpdate
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothA2DpsourcePlayingStateUpdate
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothA2DpsourceAvrcpConnectStateUpdate
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothA2DpsourceCodecValueUpdate
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothRemotedeviceDiscovered
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothRemotedeviceClassValueUpdate
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothRemotedeviceAclConnected
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothRemotedeviceAclDisconnected
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothRemotedeviceNameUpdate
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothRemotedevicePairState
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothRemotedeviceBatteryValueUpdate
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothRemotedeviceSdpResult
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothRemotedeviceUuidValue
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothRemotedevicePairingReq
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothRemotedevicePairingCancel
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothRemotedeviceConnectReq
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothRemotedeviceConnectReply
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothRemotedeviceConnectCancel
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothHandsfreeunitConnectStateUpdate
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothHandsfreeunitAudioStateUpdate
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothHandsfreeunitAgCommonEvent
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothHandsfreeunitAgCallStateUpdate
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothHostStateUpdate
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothHostReqDiscoverable
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothHostReqEnable
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothHostReqDisable
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothHostScanModeUpdate
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothHostDiscoveryStarted
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothHostDiscoveryFinished
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothHostNameUpdate
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothA2DpsinkConnectStateUpdate
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothA2DpsinkPlayingStateUpdate
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBluetoothA2DpsinkAudioStateUpdate
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBundleRemoved
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventBootCompleted
    | @!APILevel[
        21,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventConnectivityChange
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventCellularDataStateChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventCallStateChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventChargeIdleModeChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventChargeTypeChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventCharging
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventConfigurationChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventCloseSystemDialogs
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventDeviceIdleExemptionListUpdated
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventDomainAccountStatusChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventDiskEject
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventDiskUnmountable
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventDiskBadRemoval
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventDiskMounted
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventDiskUnmounted
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventDiskRemoved
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventDeviceIdleModeChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventDischarging
    | @!APILevel[
        21,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventDistributedAccountLogoff
    | @!APILevel[
        21,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventDistributedAccountTokenInvalid
    | @!APILevel[
        21,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventDistributedAccountLogout
    | @!APILevel[
        21,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventDistributedAccountLogin
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventDriveMode
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventDateChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventExternalApplicationsUnavailable
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventExternalApplicationsAvailable
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventFoundationReady
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventHomeMode
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventHttpProxyChange
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventIviSleep
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventIviPause
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventIviStandby
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventIviLastmodeSave
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventIviVoltageAbnormal
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventIviHighTemperature
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventIviExtremeTemperature
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventIviTemperatureAbnormal
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventIviVoltageRecovery
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventIviTemperatureRecovery
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventIviActive
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventIncomingCallMissed
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventLockedBootCompleted
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventLocaleChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventLocationModeStateChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventMyPackageReplaced
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventMyPackageSuspended
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventMyPackageUnsuspended
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventManagePackageStorage
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventNfcActionAdapterStateChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventNfcActionRfFieldOnDetected
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventNfcActionRfFieldOffDetected
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventNetworkStateChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventOfficeMode
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventOperatorConfigChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventPowerConnected
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventPowerDisconnected
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventPackageAdded
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventPackageReplaced
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventPackageRemoved
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventPackageFullyRemoved
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventPackageChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventPackageRestarted
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventPackageDataCleared
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventPackageCacheCleared
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventPackagesSuspended
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventPackagesUnsuspended
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventPackageFirstLaunch
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventPackageNeedsVerification
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventPackageVerified
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventPowerSaveModeChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventPrivacyStateChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventPrimarySlotRoaming
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventQuickFixApplyResult
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventQuickFixRevokeResult
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventRadioStateChange
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventShutdown
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventScreenOff
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventScreenOn
    | @!APILevel[
        21,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventSplitScreen
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventSlotChange
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventSpnInfoChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventSignalInfoChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventSimStateChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventStkSessionEnd
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventSmsEmergencyCbReceiveCompleted
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventStkCommand
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventStkAlphaIdentifier
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventSimCardDefaultVoiceSubscriptionChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventSimCardDefaultMainSubscriptionChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventStkCardStateChanged
    | @!APILevel[
        21,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventScreenLocked
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventSimCardDefaultDataSubscriptionChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventSmsReceiveCompleted
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventSmsWappushReceiveCompleted
    | @!APILevel[
        21,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventScreenUnlocked
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventSimCardDefaultSmsSubscriptionChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventSmsCbReceiveCompleted
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventSpecialCode
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventSetPrimarySlotStatus
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventThermalLevelChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventTimeTick
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventTimeChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventTimezoneChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventUidRemoved
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventUserStarted
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventUserBackground
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventUserForeground
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventUserSwitched
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventUserStarting
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventUserUnlocked
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventUserStopping
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventUserStopped
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventUserAdded
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventUserRemoved
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventUsbState
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventUsbPortChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventUsbDeviceAttached
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventUsbDeviceDetached
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventUsbAccessoryAttached
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventUsbAccessoryDetached
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventUserInfoUpdated
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventVolumeRemoved
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventVolumeUnmounted
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventVolumeMounted
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventVolumeBadRemoval
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventVolumeEject
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventVisibleAccountsUpdated
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventWifiPowerState
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventWifiScanFinished
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventWifiRssiValue
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventWifiConnState
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventWifiHotspotState
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventWifiApStaJoin
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventWifiApStaLeave
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventWifiMplinkStateChange
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventWifiP2PConnState
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventWifiP2PStateChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventWifiP2PPeersStateChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventWifiP2PPeersDiscoveryStateChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventWifiP2PCurrentDeviceStateChanged
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    CommonEventWifiP2PGroupStateChanged
    | ...

    public func toString(): String {
        match (this) {
            case CommonEventAbilityAdded => "common.event.ABILITY_ADDED"
            case CommonEventAbilityRemoved => "common.event.ABILITY_REMOVED"
            case CommonEventAbilityUpdated => "common.event.ABILITY_UPDATED"
            case CommonEventAccountDeleted => "usual.event.data.ACCOUNT_DELETED"
            case CommonEventAirplaneModeChanged => "usual.event.AIRPLANE_MODE"
            case CommonEventAudioQualityChange => "usual.event.AUDIO_QUALITY_CHANGE"
            case CommonEventBatteryChanged => "usual.event.BATTERY_CHANGED"
            case CommonEventBatteryLow => "usual.event.BATTERY_LOW"
            case CommonEventBatteryOkay => "usual.event.BATTERY_OKAY"
            case CommonEventBluetoothHandsfreeAgConnectStateUpdate => "usual.event.bluetooth.handsfree.ag.CONNECT_STATE_UPDATE"
            case CommonEventBluetoothHandsfreeAgCurrentDeviceUpdate => "usual.event.bluetooth.handsfree.ag.CURRENT_DEVICE_UPDATE"
            case CommonEventBluetoothHandsfreeAgAudioStateUpdate => "usual.event.bluetooth.handsfree.ag.AUDIO_STATE_UPDATE"
            case CommonEventBluetoothA2DpsourceConnectStateUpdate => "usual.event.bluetooth.a2dpsource.CONNECT_STATE_UPDATE"
            case CommonEventBluetoothA2DpsourceCurrentDeviceUpdate => "usual.event.bluetooth.a2dpsource.CURRENT_DEVICE_UPDATE"
            case CommonEventBluetoothA2DpsourcePlayingStateUpdate => "usual.event.bluetooth.a2dpsource.PLAYING_STATE_UPDATE"
            case CommonEventBluetoothA2DpsourceAvrcpConnectStateUpdate => "usual.event.bluetooth.a2dpsource.AVRCP_CONNECT_STATE_UPDATE"
            case CommonEventBluetoothA2DpsourceCodecValueUpdate => "usual.event.bluetooth.a2dpsource.CODEC_VALUE_UPDATE"
            case CommonEventBluetoothRemotedeviceDiscovered => "usual.event.bluetooth.remotedevice.DISCOVERED"
            case CommonEventBluetoothRemotedeviceClassValueUpdate => "usual.event.bluetooth.remotedevice.CLASS_VALUE_UPDATE"
            case CommonEventBluetoothRemotedeviceAclConnected => "usual.event.bluetooth.remotedevice.ACL_CONNECTED"
            case CommonEventBluetoothRemotedeviceAclDisconnected => "usual.event.bluetooth.remotedevice.ACL_DISCONNECTED"
            case CommonEventBluetoothRemotedeviceNameUpdate => "usual.event.bluetooth.remotedevice.NAME_UPDATE"
            case CommonEventBluetoothRemotedevicePairState => "usual.event.bluetooth.remotedevice.PAIR_STATE"
            case CommonEventBluetoothRemotedeviceBatteryValueUpdate => "usual.event.bluetooth.remotedevice.BATTERY_VALUE_UPDATE"
            case CommonEventBluetoothRemotedeviceSdpResult => "usual.event.bluetooth.remotedevice.SDP_RESULT"
            case CommonEventBluetoothRemotedeviceUuidValue => "usual.event.bluetooth.remotedevice.UUID_VALUE"
            case CommonEventBluetoothRemotedevicePairingReq => "usual.event.bluetooth.remotedevice.PAIRING_REQ"
            case CommonEventBluetoothRemotedevicePairingCancel => "usual.event.bluetooth.remotedevice.PAIRING_CANCEL"
            case CommonEventBluetoothRemotedeviceConnectReq => "usual.event.bluetooth.remotedevice.CONNECT_REQ"
            case CommonEventBluetoothRemotedeviceConnectReply => "usual.event.bluetooth.remotedevice.CONNECT_REPLY"
            case CommonEventBluetoothRemotedeviceConnectCancel => "usual.event.bluetooth.remotedevice.CONNECT_CANCEL"
            case CommonEventBluetoothHandsfreeunitConnectStateUpdate => "usual.event.bluetooth.handsfreeunit.CONNECT_STATE_UPDATE"
            case CommonEventBluetoothHandsfreeunitAudioStateUpdate => "usual.event.bluetooth.handsfreeunit.AUDIO_STATE_UPDATE"
            case CommonEventBluetoothHandsfreeunitAgCommonEvent => "usual.event.bluetooth.handsfreeunit.AG_CommonEvent"
            case CommonEventBluetoothHandsfreeunitAgCallStateUpdate => "usual.event.bluetooth.handsfreeunit.AG_CALL_STATE_UPDATE"
            case CommonEventBluetoothHostStateUpdate => "usual.event.bluetooth.host.STATE_UPDATE"
            case CommonEventBluetoothHostReqDiscoverable => "usual.event.bluetooth.host.REQ_DISCOVERABLE"
            case CommonEventBluetoothHostReqEnable => "usual.event.bluetooth.host.REQ_ENABLE"
            case CommonEventBluetoothHostReqDisable => "usual.event.bluetooth.host.REQ_DISABLE"
            case CommonEventBluetoothHostScanModeUpdate => "usual.event.bluetooth.host.SCAN_MODE_UPDATE"
            case CommonEventBluetoothHostDiscoveryStarted => "usual.event.bluetooth.host.DISCOVERY_STARTED"
            case CommonEventBluetoothHostDiscoveryFinished => "usual.event.bluetooth.host.DISCOVERY_FINISHED"
            case CommonEventBluetoothHostNameUpdate => "usual.event.bluetooth.host.NAME_UPDATE"
            case CommonEventBluetoothA2DpsinkConnectStateUpdate => "usual.event.bluetooth.a2dpsink.CONNECT_STATE_UPDATE"
            case CommonEventBluetoothA2DpsinkPlayingStateUpdate => "usual.event.bluetooth.a2dpsink.PLAYING_STATE_UPDATE"
            case CommonEventBluetoothA2DpsinkAudioStateUpdate => "usual.event.bluetooth.a2dpsink.AUDIO_STATE_UPDATE"
            case CommonEventBundleRemoved => "usual.event.BUNDLE_REMOVED"
            case CommonEventBootCompleted => "usual.event.BOOT_COMPLETED"
            case CommonEventConnectivityChange => "usual.event.CONNECTIVITY_CHANGE"
            case CommonEventCellularDataStateChanged => "usual.event.CELLULAR_DATA_STATE_CHANGED"
            case CommonEventCallStateChanged => "usual.event.CALL_STATE_CHANGED"
            case CommonEventChargeIdleModeChanged => "usual.event.CHARGE_IDLE_MODE_CHANGED"
            case CommonEventChargeTypeChanged => "usual.event.CHARGE_TYPE_CHANGED"
            case CommonEventCharging => "usual.event.CHARGING"
            case CommonEventConfigurationChanged => "usual.event.CONFIGURATION_CHANGED"
            case CommonEventCloseSystemDialogs => "usual.event.CLOSE_SYSTEM_DIALOGS"
            case CommonEventDeviceIdleExemptionListUpdated => "usual.event.DEVICE_IDLE_EXEMPTION_LIST_UPDATED"
            case CommonEventDomainAccountStatusChanged => "usual.event.DOMAIN_ACCOUNT_STATUS_CHANGED"
            case CommonEventDiskEject => "usual.event.data.DISK_EJECT"
            case CommonEventDiskUnmountable => "usual.event.data.DISK_UNMOUNTABLE"
            case CommonEventDiskBadRemoval => "usual.event.data.DISK_BAD_REMOVAL"
            case CommonEventDiskMounted => "usual.event.data.DISK_MOUNTED"
            case CommonEventDiskUnmounted => "usual.event.data.DISK_UNMOUNTED"
            case CommonEventDiskRemoved => "usual.event.data.DISK_REMOVED"
            case CommonEventDeviceIdleModeChanged => "usual.event.DEVICE_IDLE_MODE_CHANGED"
            case CommonEventDischarging => "usual.event.DISCHARGING"
            case CommonEventDistributedAccountLogoff => "common.event.DISTRIBUTED_ACCOUNT_LOGOFF"
            case CommonEventDistributedAccountTokenInvalid => "common.event.DISTRIBUTED_ACCOUNT_TOKEN_INVALID"
            case CommonEventDistributedAccountLogout => "common.event.DISTRIBUTED_ACCOUNT_LOGOUT"
            case CommonEventDistributedAccountLogin => "common.event.DISTRIBUTED_ACCOUNT_LOGIN"
            case CommonEventDriveMode => "common.event.DRIVE_MODE"
            case CommonEventDateChanged => "usual.event.DATE_CHANGED"
            case CommonEventExternalApplicationsUnavailable => "usual.event.EXTERNAL_APPLICATIONS_UNAVAILABLE"
            case CommonEventExternalApplicationsAvailable => "usual.event.EXTERNAL_APPLICATIONS_AVAILABLE"
            case CommonEventFoundationReady => "common.event.FOUNDATION_READY"
            case CommonEventHomeMode => "common.event.HOME_MODE"
            case CommonEventHttpProxyChange => "usual.event.HTTP_PROXY_CHANGE"
            case CommonEventIviSleep => "common.event.IVI_SLEEP"
            case CommonEventIviPause => "common.event.IVI_PAUSE"
            case CommonEventIviStandby => "common.event.IVI_STANDBY"
            case CommonEventIviLastmodeSave => "common.event.IVI_LASTMODE_SAVE"
            case CommonEventIviVoltageAbnormal => "common.event.IVI_VOLTAGE_ABNORMAL"
            case CommonEventIviHighTemperature => "common.event.IVI_HIGH_TEMPERATURE"
            case CommonEventIviExtremeTemperature => "common.event.IVI_EXTREME_TEMPERATURE"
            case CommonEventIviTemperatureAbnormal => "common.event.IVI_TEMPERATURE_ABNORMAL"
            case CommonEventIviVoltageRecovery => "common.event.IVI_VOLTAGE_RECOVERY"
            case CommonEventIviTemperatureRecovery => "common.event.IVI_TEMPERATURE_RECOVERY"
            case CommonEventIviActive => "common.event.IVI_ACTIVE"
            case CommonEventIncomingCallMissed => "usual.event.INCOMING_CALL_MISSED"
            case CommonEventLockedBootCompleted => "usual.event.LOCKED_BOOT_COMPLETED"
            case CommonEventLocaleChanged => "usual.event.LOCALE_CHANGED"
            case CommonEventLocationModeStateChanged => "usual.event.location.MODE_STATE_CHANGED"
            case CommonEventMyPackageReplaced => "usual.event.MY_PACKAGE_REPLACED"
            case CommonEventMyPackageSuspended => "usual.event.MY_PACKAGE_SUSPENDED"
            case CommonEventMyPackageUnsuspended => "usual.event.MY_PACKAGE_UNSUSPENDED"
            case CommonEventManagePackageStorage => "usual.event.MANAGE_PACKAGE_STORAGE"
            case CommonEventNfcActionAdapterStateChanged => "usual.event.nfc.action.ADAPTER_STATE_CHANGED"
            case CommonEventNfcActionRfFieldOnDetected => "usual.event.nfc.action.RF_FIELD_ON_DETECTED"
            case CommonEventNfcActionRfFieldOffDetected => "usual.event.nfc.action.RF_FIELD_OFF_DETECTED"
            case CommonEventNetworkStateChanged => "usual.event.NETWORK_STATE_CHANGED"
            case CommonEventOfficeMode => "common.event.OFFICE_MODE"
            case CommonEventOperatorConfigChanged => "usual.event.OPERATOR_CONFIG_CHANGED"
            case CommonEventPowerConnected => "usual.event.POWER_CONNECTED"
            case CommonEventPowerDisconnected => "usual.event.POWER_DISCONNECTED"
            case CommonEventPackageAdded => "usual.event.PACKAGE_ADDED"
            case CommonEventPackageReplaced => "usual.event.PACKAGE_REPLACED"
            case CommonEventPackageRemoved => "usual.event.PACKAGE_REMOVED"
            case CommonEventPackageFullyRemoved => "usual.event.PACKAGE_FULLY_REMOVED"
            case CommonEventPackageChanged => "usual.event.PACKAGE_CHANGED"
            case CommonEventPackageRestarted => "usual.event.PACKAGE_RESTARTED"
            case CommonEventPackageDataCleared => "usual.event.PACKAGE_DATA_CLEARED"
            case CommonEventPackageCacheCleared => "usual.event.PACKAGE_CACHE_CLEARED"
            case CommonEventPackagesSuspended => "usual.event.PACKAGES_SUSPENDED"
            case CommonEventPackagesUnsuspended => "usual.event.PACKAGES_UNSUSPENDED"
            case CommonEventPackageFirstLaunch => "usual.event.PACKAGE_FIRST_LAUNCH"
            case CommonEventPackageNeedsVerification => "usual.event.PACKAGE_NEEDS_VERIFICATION"
            case CommonEventPackageVerified => "usual.event.PACKAGE_VERIFIED"
            case CommonEventPowerSaveModeChanged => "usual.event.POWER_SAVE_MODE_CHANGED"
            case CommonEventPrivacyStateChanged => "usual.event.PRIVACY_STATE_CHANGED"
            case CommonEventPrimarySlotRoaming => "usual.event.PRIMARY_SLOT_ROAMING"
            case CommonEventQuickFixApplyResult => "usual.event.QUICK_FIX_APPLY_RESULT"
            case CommonEventQuickFixRevokeResult => "usual.event.QUICK_FIX_REVOKE_RESULT"
            case CommonEventRadioStateChange => "usual.event.RADIO_STATE_CHANGE"
            case CommonEventShutdown => "usual.event.SHUTDOWN"
            case CommonEventScreenOff => "usual.event.SCREEN_OFF"
            case CommonEventScreenOn => "usual.event.SCREEN_ON"
            case CommonEventSplitScreen => "common.event.SPLIT_SCREEN"
            case CommonEventSlotChange => "usual.event.SLOT_CHANGE"
            case CommonEventSpnInfoChanged => "usual.event.SPN_INFO_CHANGED"
            case CommonEventSignalInfoChanged => "usual.event.SIGNAL_INFO_CHANGED"
            case CommonEventSimStateChanged => "usual.event.SIM_STATE_CHANGED"
            case CommonEventStkSessionEnd => "usual.event.STK_SESSION_END"
            case CommonEventSmsEmergencyCbReceiveCompleted => "usual.event.SMS_EMERGENCY_CB_RECEIVE_COMPLETED"
            case CommonEventStkCommand => "usual.event.STK_COMMAND"
            case CommonEventStkAlphaIdentifier => "usual.event.STK_ALPHA_IDENTIFIER"
            case CommonEventSimCardDefaultVoiceSubscriptionChanged => "usual.event.SIM.DEFAULT_VOICE_SUBSCRIPTION_CHANGED"
            case CommonEventSimCardDefaultMainSubscriptionChanged => "usual.event.SIM.DEFAULT_MAIN_SUBSCRIPTION_CHANGED"
            case CommonEventStkCardStateChanged => "usual.event.STK_CARD_STATE_CHANGED"
            case CommonEventScreenLocked => "usual.event.SCREEN_LOCKED"
            case CommonEventSimCardDefaultDataSubscriptionChanged => "usual.event.SIM.DEFAULT_DATA_SUBSCRIPTION_CHANGED"
            case CommonEventSmsReceiveCompleted => "usual.event.SMS_RECEIVE_COMPLETED"
            case CommonEventSmsWappushReceiveCompleted => "usual.event.SMS_WAPPUSH_RECEIVE_COMPLETED"
            case CommonEventScreenUnlocked => "usual.event.SCREEN_UNLOCKED"
            case CommonEventSimCardDefaultSmsSubscriptionChanged => "usual.event.SIM.DEFAULT_SMS_SUBSCRIPTION_CHANGED"
            case CommonEventSmsCbReceiveCompleted => "usual.event.SMS_CB_RECEIVE_COMPLETED"
            case CommonEventSpecialCode => "common.event.SPECIAL_CODE"
            case CommonEventSetPrimarySlotStatus => "usual.event.SET_PRIMARY_SLOT_STATUS"
            case CommonEventThermalLevelChanged => "usual.event.THERMAL_LEVEL_CHANGED"
            case CommonEventTimeTick => "usual.event.TIME_TICK"
            case CommonEventTimeChanged => "usual.event.TIME_CHANGED"
            case CommonEventTimezoneChanged => "usual.event.TIMEZONE_CHANGED"
            case CommonEventUidRemoved => "usual.event.UID_REMOVED"
            case CommonEventUserStarted => "usual.event.USER_STARTED"
            case CommonEventUserBackground => "usual.event.USER_BACKGROUND"
            case CommonEventUserForeground => "usual.event.USER_FOREGROUND"
            case CommonEventUserSwitched => "usual.event.USER_SWITCHED"
            case CommonEventUserStarting => "usual.event.USER_STARTING"
            case CommonEventUserUnlocked => "usual.event.USER_UNLOCKED"
            case CommonEventUserStopping => "usual.event.USER_STOPPING"
            case CommonEventUserStopped => "usual.event.USER_STOPPED"
            case CommonEventUserAdded => "usual.event.USER_ADDED"
            case CommonEventUserRemoved => "usual.event.USER_REMOVED"
            case CommonEventUsbState => "usual.event.hardware.usb.action.USB_STATE"
            case CommonEventUsbPortChanged => "usual.event.hardware.usb.action.USB_PORT_CHANGED"
            case CommonEventUsbDeviceAttached => "usual.event.hardware.usb.action.USB_DEVICE_ATTACHED"
            case CommonEventUsbDeviceDetached => "usual.event.hardware.usb.action.USB_DEVICE_DETACHED"
            case CommonEventUsbAccessoryAttached => "usual.event.hardware.usb.action.USB_ACCESSORY_ATTACHED"
            case CommonEventUsbAccessoryDetached => "usual.event.hardware.usb.action.USB_ACCESSORY_DETACHED"
            case CommonEventUserInfoUpdated => "usual.event.USER_INFO_UPDATED"
            case CommonEventVolumeRemoved => "usual.event.data.VOLUME_REMOVED"
            case CommonEventVolumeUnmounted => "usual.event.data.VOLUME_UNMOUNTED"
            case CommonEventVolumeMounted => "usual.event.data.VOLUME_MOUNTED"
            case CommonEventVolumeBadRemoval => "usual.event.data.VOLUME_BAD_REMOVAL"
            case CommonEventVolumeEject => "usual.event.data.VOLUME_EJECT"
            case CommonEventVisibleAccountsUpdated => "usual.event.data.VISIBLE_ACCOUNTS_UPDATED"
            case CommonEventWifiPowerState => "usual.event.wifi.POWER_STATE"
            case CommonEventWifiScanFinished => "usual.event.wifi.SCAN_FINISHED"
            case CommonEventWifiRssiValue => "usual.event.wifi.RSSI_VALUE"
            case CommonEventWifiConnState => "usual.event.wifi.CONN_STATE"
            case CommonEventWifiHotspotState => "usual.event.wifi.HOTSPOT_STATE"
            case CommonEventWifiApStaJoin => "usual.event.wifi.WIFI_HS_STA_JOIN"
            case CommonEventWifiApStaLeave => "usual.event.wifi.WIFI_HS_STA_LEAVE"
            case CommonEventWifiMplinkStateChange => "usual.event.wifi.mplink.STATE_CHANGE"
            case CommonEventWifiP2PConnState => "usual.event.wifi.p2p.CONN_STATE_CHANGE"
            case CommonEventWifiP2PStateChanged => "usual.event.wifi.p2p.STATE_CHANGE"
            case CommonEventWifiP2PPeersStateChanged => "usual.event.wifi.p2p.DEVICES_CHANGE"
            case CommonEventWifiP2PPeersDiscoveryStateChanged => "usual.event.wifi.p2p.PEER_DISCOVERY_STATE_CHANGE"
            case CommonEventWifiP2PCurrentDeviceStateChanged => "usual.event.wifi.p2p.CURRENT_DEVICE_CHANGE"
            case CommonEventWifiP2PGroupStateChanged => "usual.event.wifi.p2p.GROUP_STATE_CHANGED"
            case _ => throw IllegalArgumentException("Unknown value")
        }
    }
}
