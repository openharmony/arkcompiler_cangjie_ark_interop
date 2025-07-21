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

package ohos.net.connection

import ohos.ffi.*

foreign {
    func CJ_CreateNetConnection(netSpecifier: CNetSpecifier, timeout: UInt32): Int64

    func CJ_GetDefaultNet(netId: CPointer<Int32>): Int32

    func CJ_GetAppNet(netId: CPointer<Int32>): Int32

    func CJ_SetAppNet(netId: Int32): Int32

    func CJ_GetAddressesByName(netId: Int32, host: CString): RetNetAddressArr

    func CJ_IsDefaultNetMetered(retPtr: CPointer<Bool>): Int32

    func CJ_HasDefaultNet(retPtr: CPointer<Bool>): Int32

    func CJ_GetNetCapabilities(netId: Int32, ptr: CPointer<CNetCapabilities>): Int32

    func CJ_GetConnectionProperties(netId: Int32, ret: CPointer<CConnectionProperties>): Int32

    func CJ_GetGlobalHttpProxy(chttpProxy: CPointer<CHttpProxy>): Int32

    func CJ_GetDefaultHttpProxy(chttpProxy: CPointer<CHttpProxy>): Int32

    func CJ_SetGlobalHttpProxy(cHttpProxy: CHttpProxy): Int32

    func CJ_GetAllNets(): RetDataCArrI32

    func CJ_EnableAirplaneMode(): Int32

    func CJ_DisableAirplaneMode(): Int32

    func CJ_ReportNetConnected(netId: Int32): Int32

    func CJ_ReportNetDisconnected(netId: Int32): Int32

    func CJ_NetConnectionRegister(id: Int64): Int32

    func CJ_NetConnectionUnRegister(id: Int64): Int32

    func CJ_OnNetAvailable(connId: Int64, callbackId: Int64): Unit

    func CJ_OnNetBlockStatusChange(connId: Int64, callbackId: Int64): Unit

    func CJ_OnNetCapabilitiesChange(connId: Int64, callbackId: Int64): Unit

    func CJ_OnNetConnectionPropertiesChange(connId: Int64, callbackId: Int64): Unit

    func CJ_OnNetLost(connId: Int64, callbackId: Int64): Unit

    func CJ_OnNetUnavailable(connId: Int64, callbackId: Int64): Unit

    func CJ_NetHandleBindSocket(netId: Int32, socketFd: IntNative): Int32
}

@C
struct CNetSpecifier {
    CNetSpecifier(
        let netCapabilities: CNetCapabilities,
        let bearerPrivateIdentifier: CString,
        let hasSpecifier!: Bool = false
    ) {}

    init(netSpecifier: NetSpecifier) {
        this.netCapabilities = CNetCapabilities(netSpecifier.netCapabilities)
        this.bearerPrivateIdentifier = try {
            unsafe { LibC.mallocCString(netSpecifier.bearerPrivateIdentifier ?? "") }
        } catch (e: Exception) {
            netCapabilities.free()
            throw e
        }
        this.hasSpecifier = true
    }
    init() {
        this.hasSpecifier = false
        this.bearerPrivateIdentifier = CString(CPointer<UInt8>())
        this.netCapabilities = CNetCapabilities()
    }

    func free(): Unit {
        unsafe {
            LibC.free(bearerPrivateIdentifier)
            netCapabilities.free()
        }
    }
}

// net.http will use this struct ,so make it public
@C
protected struct CHttpProxy {
    protected CHttpProxy(
        protected let host: CString,
        protected let port: UInt16,
        protected let exclusionList: CPointer<CString>,
        protected let exclusionListSize: Int64
    ) {}
    protected init(httpProxy: HttpProxy) {
        this.host = unsafe { LibC.mallocCString(httpProxy.host ?? "") }
        this.port = httpProxy.port ?? 0
        this.exclusionListSize = httpProxy.exclusionList?.size ?? 0
        unsafe {
            try {
                this.exclusionList = cjArr2CArr<String, CString>(httpProxy.exclusionList ?? Array<String>(0, repeat: ""),
                    {str => LibC.mallocCString(str)}) {cstr => LibC.free(cstr)}
            } catch (e: Exception) {
                LibC.free(host)
                throw e
            }
        }
    }

    protected func free() {
        unsafe {
            LibC.free(host)
            for (i in 0..exclusionListSize) {
                LibC.free(exclusionList.read(i))
            }
            LibC.free<CString>(exclusionList)
        }
    }
}

@C
struct CNetAddress {
    CNetAddress(
        let address: CString,
        let family: UInt32,
        let port: UInt16
    ) {}

    func free() {
        unsafe { LibC.free(address) }
    }
}

@C
struct CLinkAddress {
    CLinkAddress(
        let address: CNetAddress,
        let prefixLength: Int32
    ) {}
}

@C
struct CRouteInfo {
    CRouteInfo(
        let interfaceName: CString,
        let destination: CLinkAddress,
        let gateway: CNetAddress,
        let hasGateway: Bool,
        let isDefaultRoute: Bool
    ) {}

    func free(): Unit {
        unsafe { LibC.free(interfaceName) }
    }
}

@C
struct RetNetAddressArr {
    RetNetAddressArr(
        let code: Int32,
        let size: Int64,
        let data: CPointer<CNetAddress>
    ) {}

    func free(): Unit {
        unsafe { LibC.free<CNetAddress>(data) }
    }
}

@C
struct CNetCapabilities {
    CNetCapabilities(
        let bearedTypeSize: Int64,
        let networkCapSize: Int64,
        let linkUpBandwidthKbps: UInt32,
        let linkDownBandwidthKbps: UInt32,
        let bearerTypes: CPointer<Int32>,
        let networkCap: CPointer<Int32>
    ) {}

    init(netCapabilities: NetCapabilities) {
        this.linkUpBandwidthKbps = netCapabilities.linkUpBandwidthKbps ?? 0
        this.linkDownBandwidthKbps = netCapabilities.linkDownBandwidthKbps ?? 0
        this.bearedTypeSize = netCapabilities.bearerTypes.size

        let networkCapArr = match (netCapabilities.networkCap) {
            case Some(v) => v
            case None => Array<NetCap>()
        }
        this.networkCapSize = networkCapArr.size
        unsafe {
            this.bearerTypes = cjArr2CArr<NetBearType, Int32>(netCapabilities.bearerTypes, {enums => enums.getValue()})
            try {
                this.networkCap = cjArr2CArr<NetCap, Int32>(networkCapArr, {enums => enums.getValue()})
            } catch (e: Exception) {
                LibC.free<Int32>(bearerTypes)
                throw e
            }
        }
    }

    init() {
        this.linkUpBandwidthKbps = 0
        this.linkDownBandwidthKbps = 0
        this.bearedTypeSize = 0
        this.networkCapSize = 0
        this.bearerTypes = CPointer<Int32>()
        this.networkCap = CPointer<Int32>()
    }

    func free(): Unit {
        unsafe {
            LibC.free<Int32>(bearerTypes)
            LibC.free<Int32>(networkCap)
        }
    }
}

@C
struct CNetCapabilityInfo {
    CNetCapabilityInfo(
        let netHandle: Int32,
        let netCap: CNetCapabilities
    ) {}
}

@C
struct CConnectionProperties {
    var interfaceName: CString = CString(CPointer<UInt8>())
    var domains: CString = CString(CPointer<UInt8>())
    var linkAddressSize: Int64 = 0
    var dnsSize: Int64 = 0
    var routeSize: Int64 = 0
    var mtu: UInt16 = 0
    var linkAddresses: CPointer<CLinkAddress> = CPointer<CLinkAddress>()
    var dnses: CPointer<CNetAddress> = CPointer<CNetAddress>()
    var routes: CPointer<CRouteInfo> = CPointer<CRouteInfo>()

    func free(): Unit {
        unsafe {
            LibC.free(interfaceName)
            LibC.free(domains)
            LibC.free<CLinkAddress>(linkAddresses)
            LibC.free<CNetAddress>(dnses)
            LibC.free<CRouteInfo>(routes)
        }
    }
}
