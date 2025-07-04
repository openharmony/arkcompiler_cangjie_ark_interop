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

package ohos.wifi_manager

import ohos.base.*
import ohos.ffi.*
import ohos.labels.*

foreign {
    func FfiWifiIsWifiActive(ret: CPointer<Bool>): Int32

    func FfiWifiGetScanInfoList(ret: CPointer<Int32>): WifiScanInfoArr

    func FfiWifiRemoveCandidateConfig(id: Int32): Int32

    func FfiWifiConnectToCandidateConfig(id: Int32): Int32

    func FfiWifiGetSignalLevel(rssi: Int32, band: Int32, ret: CPointer<UInt32>): Int32

    func FfiWifiIsConnected(ret: CPointer<Bool>): Int32

    func FfiWifiIsFeatureSupported(featureId: Int64, ret: CPointer<Bool>): Int32

    func FfiWifiGetIpInfo(ret: CPointer<CIpInfo>): Int32

    func FfiWifiGetIpv6Info(ret: CPointer<CIpv6Info>): Int32

    func FfiWifiGetCountryCode(code: CPointer<Int32>): CString

    func FfiWifiIsBandTypeSupported(bandType: Int32, ret: CPointer<Bool>): Int32

    func FfiWifiIsMeteredHotspot(ret: CPointer<Bool>): Int32

    func FfiWifiRemoveGroup(): Int32

    func FfiWifiP2pConnect(cfg: CWifiP2PConfig): Int32

    func FfiWifiP2pCancelConnect(): Int32

    func FfiWifiStartDiscoverDevices(): Int32

    func FfiWifiStopDiscoverDevices(): Int32

    func FfiWifiGetP2pLinkedInfo(info: CPointer<CWifiP2pLinkedInfo>): Int32

    func FfiWifiGetCurrentGroup(info: CPointer<CWifiP2pGroupInfo>): Int32

    func FfiWifiGetP2pPeerDevices(code: CPointer<Int32>): WifiP2pDeviceArr

    func FfiWifiGetP2pLocalDevice(info: CPointer<CWifiP2pDevice>): Int32

    func FfiWifiCreateGroup(cfg: CWifiP2PConfig): Int32

    func FfiWifiGetLinkedInfo(info: CPointer<CWifiLinkedInfo>): Int32

    func FfiWifiAddCandidateConfig(cfg: CWifiDeviceConfig, ret: CPointer<Int32>): Int32

    func FfiWifiGetCandidateConfigs(code: CPointer<Int32>): WifiDeviceConfigArr

    func FfiWifiWifiOn(event: CString, id: Int64): Int32

    func FfiWifiWifiOff(event: CString): Int32
}

@C
struct CWifiInfoElem {
    CWifiInfoElem(
        let eid: UInt32,
        let content: CArrUI8
    ) {}

    func free() {
        unsafe { LibC.free(content.head) }
    }
}

@C
struct CWifiScanInfo {
    CWifiScanInfo(
        let ssid: CString, // the maximum length is 32
        let bssid: CString, // the length is 6
        let bssidType: Int32,
        let capabilities: CString,
        let securityType: Int32,
        let rssi: Int32, // Received signal strength indicator
        let band: Int32, // Frequency band, 1: 2.4G, 2: 5G
        let frequency: Int32,
        let channelWidth: Int32,
        let centerFrequency0: Int32,
        let centerFrequency1: Int32,
        let infoElems: CPointer<CWifiInfoElem>,
        let elemsSize: Int64,
        let timestamp: Int64,
        let supportedWifiCategory: Int32,
        let isHiLinkNetwork: Bool
    ) {}

    func free() {
        unsafe {
            LibC.free(ssid)
            LibC.free(bssid)
            LibC.free(capabilities)
            if (infoElems.isNotNull()) {
                for (i in 0..elemsSize) {
                    infoElems.read(i).free()
                }
            }
            LibC.free(infoElems)
        }
    }
}

@C
struct WifiScanInfoArr {
    WifiScanInfoArr(
        let head: CPointer<CWifiScanInfo>,
        let size: Int64
    ) {}

    unsafe func free() {
        if (head.isNotNull()) {
            for (i in 0..size) {
                head.read(i).free()
            }
        }
        LibC.free(head)
    }
}

@C
struct CWifiDeviceConfig {
    var securityType: Int32 = 0
    var bssidType: Int32 = 0
    var isHiddenSsid: Bool = false
    var bssid: CString = CString(CPointer<UInt8>())
    var ssid: CString = CString(CPointer<UInt8>())
    var preSharedKey: CString = CString(CPointer<UInt8>())
    var eapConfig: CWifiEapConfig = CWifiEapConfig()
    var wapiConfig: CWifiWapiConfig = CWifiWapiConfig()

    init(cfg: WifiDeviceConfig) {
        this.securityType = cfg.securityType.getValue()
        this.bssidType = cfg.bssidType?.getValue() ?? 0
        this.isHiddenSsid = cfg.isHiddenSsid ?? false
        try {
            this.ssid = unsafe { LibC.mallocCString(cfg.ssid) }
            this.preSharedKey = unsafe { LibC.mallocCString(cfg.preSharedKey) }
            match (cfg.bssid) {
                case Some(v) => this.bssid = unsafe { LibC.mallocCString(v) }
                case None => ()
            }
            match (cfg.eapConfig) {
                case Some(v) => this.eapConfig = CWifiEapConfig(v)
                case None => ()
            }
            match (cfg.wapiConfig) {
                case Some(v) => this.wapiConfig = CWifiWapiConfig(v)
                case None => ()
            }
        } catch (e: Exception) {
            unsafe {
                LibC.free(bssid)
                LibC.free(ssid)
                LibC.free(preSharedKey)
                eapConfig.free()
                wapiConfig.free()
            }
            throw e
        }
    }

    func free() {
        unsafe {
            LibC.free(bssid)
            LibC.free(ssid)
            LibC.free(preSharedKey)
            eapConfig.free()
            wapiConfig.free()
        }
    }
}

@C
struct WifiDeviceConfigArr {
    WifiDeviceConfigArr(
        let head: CPointer<CWifiDeviceConfig>,
        let size: Int64
    ) {}

    unsafe func free() {
        if (head.isNotNull()) {
            for (i in 0..size) {
                head.read(i).free()
            }
        }
        LibC.free(head)
    }
}

@C
struct CWifiEapConfig {
    var eapMethod: Int32 = 0
    var phase2Method: Int32 = 0
    var identity: CString = CString(CPointer<UInt8>())
    var anonymousIdentity: CString = CString(CPointer<UInt8>())
    var password: CString = CString(CPointer<UInt8>())
    var caCertAlias: CString = CString(CPointer<UInt8>())
    var caPath: CString = CString(CPointer<UInt8>())
    var clientCertAlias: CString = CString(CPointer<UInt8>())
    var certEntry: CArrUI8 = CArrUI8(CPointer<UInt8>(), 0)
    var certPassword: CString = CString(CPointer<UInt8>())
    var altSubjectMatch: CString = CString(CPointer<UInt8>())
    var domainSuffixMatch: CString = CString(CPointer<UInt8>())
    var realm: CString = CString(CPointer<UInt8>())
    var plmn: CString = CString(CPointer<UInt8>())
    var eapSubId: Int32 = 0
    var isNone: Bool = true

    init() {}

    init(cfg: WifiEapConfig) {
        this.eapMethod = cfg.eapMethod.getValue()
        this.phase2Method = cfg.phase2Method.getValue()
        this.eapSubId = cfg.eapSubId
        try {
            this.identity = unsafe { LibC.mallocCString(cfg.identity) }
            this.anonymousIdentity = unsafe { LibC.mallocCString(cfg.identity) }
            this.password = unsafe { LibC.mallocCString(cfg.identity) }
            this.caCertAlias = unsafe { LibC.mallocCString(cfg.identity) }
            this.caPath = unsafe { LibC.mallocCString(cfg.identity) }
            this.clientCertAlias = unsafe { LibC.mallocCString(cfg.identity) }
            this.certEntry = unsafe { CArrUI8(cjArr2CArr<UInt8, UInt8>(cfg.certEntry) {i => i}, cfg.certEntry.size) }
            this.certPassword = unsafe { LibC.mallocCString(cfg.identity) }
            this.altSubjectMatch = unsafe { LibC.mallocCString(cfg.identity) }
            this.domainSuffixMatch = unsafe { LibC.mallocCString(cfg.identity) }
            this.realm = unsafe { LibC.mallocCString(cfg.identity) }
            this.plmn = unsafe { LibC.mallocCString(cfg.identity) }
        } catch (e: Exception) {
            unsafe {
                LibC.free(identity)
                LibC.free(anonymousIdentity)
                LibC.free(password)
                LibC.free(caCertAlias)
                LibC.free(caPath)
                LibC.free(clientCertAlias)
                LibC.free(certPassword)
                LibC.free(altSubjectMatch)
                LibC.free(domainSuffixMatch)
                LibC.free(realm)
                LibC.free(plmn)
                LibC.free(certEntry.head)
            }
            throw e
        }
    }

    func free() {
        unsafe {
            LibC.free(identity)
            LibC.free(anonymousIdentity)
            LibC.free(password)
            LibC.free(caCertAlias)
            LibC.free(caPath)
            LibC.free(clientCertAlias)
            LibC.free(certPassword)
            LibC.free(altSubjectMatch)
            LibC.free(domainSuffixMatch)
            LibC.free(realm)
            LibC.free(plmn)
            LibC.free(certEntry.head)
        }
    }
}

@C
struct CWifiWapiConfig {
    var wapiPskType: Int32 = 0
    var wapiAsCert: CString = CString(CPointer<UInt8>())
    var wapiUserCert: CString = CString(CPointer<UInt8>())
    var isNone: Bool = true

    init() {}

    init(cfg: WifiWapiConfig) {
        this.wapiPskType = cfg.wapiPskType.getValue()
        this.wapiAsCert = unsafe { LibC.mallocCString(cfg.wapiAsCert) }
        try {
            this.wapiUserCert = unsafe { LibC.mallocCString(cfg.wapiUserCert) }
        } catch (e: Exception) {
            unsafe { LibC.free(wapiAsCert) }
            throw e
        }
    }

    func free() {
        unsafe {
            LibC.free(wapiAsCert)
            LibC.free(wapiUserCert)
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public class IpInfo {
    IpInfo(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let ipAddress: UInt32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let gateway: UInt32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let netmask: UInt32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let primaryDns: UInt32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let secondDns: UInt32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let serverIp: UInt32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let leaseDuration: UInt32
    ) {}
}

@C
struct CIpInfo {
    CIpInfo(
        let ipAddress: UInt32,
        let gateway: UInt32,
        let netmask: UInt32,
        let primaryDns: UInt32,
        let secondDns: UInt32,
        let serverIp: UInt32,
        let leaseDuration: UInt32
    ) {}

    func toIpInfo(): IpInfo {
        IpInfo(ipAddress, gateway, netmask, primaryDns, secondDns, serverIp, leaseDuration)
    }
}

@C
struct CIpv6Info {
    CIpv6Info(
        let linkIpv6Address: CString,
        let globalIpv6Address: CString,
        let randomGlobalIpv6Address: CString,
        let uniqueIpv6Address: CString,
        let randomUniqueIpv6Address: CString,
        let gateway: CString,
        let netmask: CString,
        let primaryDNS: CString,
        let secondDNS: CString
    ) {}

    func free() {
        unsafe {
            LibC.free(linkIpv6Address)
            LibC.free(globalIpv6Address)
            LibC.free(randomGlobalIpv6Address)
            LibC.free(uniqueIpv6Address)
            LibC.free(randomUniqueIpv6Address)
            LibC.free(gateway)
            LibC.free(netmask)
            LibC.free(primaryDNS)
            LibC.free(secondDNS)
        }
    }
}

@C
struct CWifiP2pLinkedInfo {
    CWifiP2pLinkedInfo(
        let connectState: Int32,
        let isGroupOwner: Bool,
        let groupOwnerAddr: CString
    ) {}

    func free() {
        unsafe { LibC.free(groupOwnerAddr) }
    }
}

@C
struct CWifiP2pGroupInfo {
    CWifiP2pGroupInfo(
        let isP2pGo: Bool,
        let ownerInfo: CWifiP2pDevice,
        let passphrase: CString,
        let interfaceName: CString,
        let groupName: CString,
        let networkId: Int32,
        let frequency: Int32,
        let clientDevices: CPointer<CWifiP2pDevice>,
        let clientSize: Int64,
        let goIpAddress: CString
    ) {}

    func free() {
        unsafe {
            ownerInfo.free()
            LibC.free(passphrase)
            LibC.free(interfaceName)
            LibC.free(groupName)
            LibC.free(goIpAddress)
            LibC.free(clientDevices)
            if (clientDevices.isNotNull()) {
                for (i in 0..clientSize) {
                    clientDevices.read(i).free()
                }
            }
        }
    }
}

@C
struct CWifiP2pDevice {
    CWifiP2pDevice(
        let deviceName: CString,
        let deviceAddress: CString,
        let primaryDeviceType: CString,
        let deviceStatus: Int32,
        let groupCapabilities: Int32,
        let deviceAddressType: Int32
    ) {}

    func free() {
        unsafe {
            LibC.free(deviceName)
            LibC.free(deviceAddress)
            LibC.free(primaryDeviceType)
        }
    }
}

@C
struct WifiP2pDeviceArr {
    WifiP2pDeviceArr(
        let head: CPointer<CWifiP2pDevice>,
        let size: Int64
    ) {}

    func toCjArrAndFree(): Array<WifiP2pDevice> {
        var arr: Array<WifiP2pDevice> = Array<WifiP2pDevice>()
        // ffi return information may be invalid UTF8 and may be parsed abnormally.
        try {
            arr = unsafe { cArr2cjArr<CWifiP2pDevice, WifiP2pDevice>(size, head) {
                ct => WifiP2pDevice(ct)
            } }
        } finally {
            if (head.isNotNull()) {
                for (i in 0..size) {
                    unsafe { head.read(i).free() }
                }
            }
            unsafe { LibC.free(head) }
        }
        arr
    }
}

@C
struct CWifiP2PConfig {
    var deviceAddress: CString = CString(CPointer<UInt8>())
    var passphrase: CString = CString(CPointer<UInt8>())
    var groupName: CString = CString(CPointer<UInt8>())
    let goBand: Int32
    let netId: Int32
    let deviceAddressType: Int32

    init(cfg: WifiP2PConfig) {
        this.netId = cfg.netId
        this.goBand = cfg.goBand.getValue()
        this.deviceAddressType = cfg.deviceAddressType.getValue()
        try {
            this.deviceAddress = unsafe { LibC.mallocCString(cfg.deviceAddress) }
            this.passphrase = unsafe { LibC.mallocCString(cfg.passphrase) }
            this.groupName = unsafe { LibC.mallocCString(cfg.groupName) }
        } catch (e: Exception) {
            unsafe {
                LibC.free(deviceAddress)
                LibC.free(passphrase)
                LibC.free(groupName)
            }
            throw e
        }
    }

    func free() {
        unsafe {
            LibC.free(deviceAddress)
            LibC.free(passphrase)
            LibC.free(groupName)
        }
    }
}

@C
struct CWifiLinkedInfo {
    CWifiLinkedInfo(
        let ssid: CString,
        let bssid: CString,
        let rssi: Int32,
        let band: Int32,
        let linkSpeed: Int32,
        let rxLinkSpeed: Int32,
        let maxSupportedTxLinkSpeed: Int32,
        let maxSupportedRxLinkSpeed: Int32,
        let frequency: Int32,
        let isHidden: Bool,
        let isRestricted: Bool,
        let macType: Int32, // Type of macAddress: 0 - real mac, 1 - random mac.
        let macAddress: CString,
        let ipAddress: UInt32,
        let connState: Int32,
        let channelWidth: Int32,
        let wifiStandard: Int32,
        let supportedWifiCategory: Int32,
        let isHiLinkNetwork: Bool
    ) {}

    func free() {
        unsafe {
            LibC.free(ssid)
            LibC.free(bssid)
            LibC.free(macAddress)
        }
    }
}
