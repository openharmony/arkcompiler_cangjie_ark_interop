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

import ohos.labels.*
import ohos.ffi.*
import ohos.base.*
import std.collection.*

/**
 * Provides an instance that bear data network capabilities.
 * 
 * @relation export interface NetSpecifier
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public class NetSpecifier {
    /**
     * The transmission capacity and support of the network's global proxy storage data network.
     *
     * @relation netCapabilities: NetCapabilities;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var netCapabilities: NetCapabilities
    /**
     * Network identifier, the identifier for Wi Fi networks is "wifi", and the identifier for cellular networks is "simId1" (corresponding to SIM card 1).
     *
     * @relation bearerPrivateIdentifier?: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var bearerPrivateIdentifier: ?String 

    /**
     * NetSpecifier constructor
     */
    public init(netCapabilities: NetCapabilities, bearerPrivateIdentifier!: ?String = None) {
        this.netCapabilities = netCapabilities
        this.bearerPrivateIdentifier = bearerPrivateIdentifier
    }
}

/**
 * Receive information about changes in network capabilities.
 *
 * @relation export interface NetCapabilityInfo
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public class NetCapabilityInfo {
    /**
     * Defines the handle of the data network.
     *
     * @relation netHandle: NetHandle;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var netHandle: NetHandle
    /**
     * Defines the network capability set.
     *
     * @relation netCap: NetCapabilities;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var netCap: ?NetCapabilities
    
    /**
     * NetCapabilityInfo constructor
     */
    public init(netHandle: NetHandle, netCap!: ?NetCapabilities = None) {
        this.netHandle = netHandle
        this.netCap = netCap
    }

    /**
     * NetCapabilityInfo constructor
     */
    init(cInfo: CNetCapabilityInfo) {
        this.netHandle = NetHandle(cInfo.netHandle)
        this.netCap = NetCapabilities(cInfo.netCap)
    }
}

/**
 * Defines the network capability set.
 *
 * @relation export interface NetCapabilities
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public class NetCapabilities {
    /**
     * Network type.
     *
     * @relation bearerTypes: Array<NetBearType>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var bearerTypes: Array<NetBearType>
    /**
     * Uplink (device-to-network) bandwidth.
     *
     * @relation linkUpBandwidthKbps?: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var linkUpBandwidthKbps: ?UInt32 
    /**
     * Downstream (network-to-device) bandwidth.
     *
     * @relation linkDownBandwidthKbps?: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var linkDownBandwidthKbps: ?UInt32 
    /**
     * Network-specific capabilities.
     *
     * @relation networkCap?: Array<NetCap>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var networkCap: ?Array<NetCap>
    
    /**
     * NetCapabilities constructor
     */
    public init(bearerTypes: Array<NetBearType>, linkUpBandwidthKbps!: ?UInt32 = None, linkDownBandwidthKbps!: ?UInt32 = None, networkCap!: ?Array<NetCap>) {
        this.bearerTypes = bearerTypes
        this.linkUpBandwidthKbps = linkUpBandwidthKbps
        this.linkDownBandwidthKbps = linkDownBandwidthKbps
        this.networkCap = networkCap
    }
    
    /**
     * NetCapabilities constructor
     */
    init(cNetCapabilities: CNetCapabilities) {
        let bearedTypeSize = cNetCapabilities.bearedTypeSize
        let networkCapSize = cNetCapabilities.networkCapSize
        let bt = cNetCapabilities.bearerTypes
        let nc = cNetCapabilities.networkCap
        this.linkUpBandwidthKbps = cNetCapabilities.linkUpBandwidthKbps
        this.linkDownBandwidthKbps = cNetCapabilities.linkDownBandwidthKbps
        try {
            this.bearerTypes = Array<NetBearType>(
                bearedTypeSize,
                {
                    i => NetBearType.parse(unsafe { bt.read(i) })
                }
            )
            this.networkCap = if (networkCapSize == 0) {
                None
            } else {
                Array<NetCap>(networkCapSize, {i => NetCap.parse(unsafe { nc.read(i) })})
            }
        } finally {
            cNetCapabilities.free()
        }
    }
}

/**
 * Defines the network connection properties.
 *
 * @relation export interface ConnectionProperties
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public class ConnectionProperties {
    /**
     * Network card name.
     *
     * @relation interfaceName: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var interfaceName: String
    /**
     * Domain. The default value is "".
     *
     * @relation domains: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var domains: String
    /**
     * Link information.
     *
     * @relation linkAddresses: Array<LinkAddress>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var linkAddresses: Array<LinkAddress>
    /**
     * Network address, refer to [NetAddress].
     *
     * @relation dnses: Array<NetAddress>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var dnses: Array<NetAddress>
    /**
     * Routing information.
     *
     * @relation routes: Array<RouteInfo>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var routes: Array<RouteInfo>
    /**
     * Maximum transmission unit.
     *
     * @relation mtu: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var mtu: UInt16

    /**
     * ConnectionProperties constructor
     */
    public init(interfaceName: String, domains: String, linkAddresses: Array<LinkAddress>, dnses: Array<NetAddress>, routes: Array<RouteInfo>, mtu: UInt16) {
        this.interfaceName = interfaceName
        this.domains = domains
        this.linkAddresses = linkAddresses
        this.dnses = dnses
        this.routes = routes
        this.mtu = mtu
    }
    
    /**
     * ConnectionProperties constructor
     */
    init(cProp: CConnectionProperties) {
        unsafe {
            this.interfaceName = cProp.interfaceName.toString()
            this.domains = cProp.domains.toString()
            this.mtu = cProp.mtu
            this.linkAddresses = cArr2cjArr<CLinkAddress, LinkAddress>(cProp.linkAddressSize, cProp.linkAddresses,
                {addr => LinkAddress(addr)})
            this.dnses = cArr2cjArr<CNetAddress, NetAddress>(cProp.dnsSize, cProp.dnses, {dns => NetAddress(dns)})
            this.routes = cArr2cjArr<CRouteInfo, RouteInfo>(cProp.routeSize, cProp.routes, {route => RouteInfo(route)})
            cProp.free()
        }
    }
}

/**
 * Defines network route information.
 *
 * @relation export interface RouteInfo
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public class RouteInfo {
    /**
     * Network card name.
     *
     * @relation interfaceName: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var interfaceName: String

    /**
     * Destination Address
     *
     * @relation destination: LinkAddress;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var destination: LinkAddress

    /**
     * Gateway address.
     *
     * @relation gateway: NetAddress;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var gateway: NetAddress

    /**
     * Whether a gateway is present.
     *
     * @relation hasGateway: boolean;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var hasGateway: Bool

    /**
     * Whether the route is the default route.
     *
     * @relation isDefaultRoute: boolean;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var isDefaultRoute: Bool
    
    /**
     * RouteInfo constructor
     */
    public init(interfaceName: String, destination: LinkAddress, gateway: NetAddress, hasGateway: Bool, isDefaultRoute: Bool) {
        this.interfaceName = interfaceName
        this.destination = destination
        this.gateway = gateway
        this.hasGateway = hasGateway
        this.isDefaultRoute = isDefaultRoute
    }
    
    /**
     * RouteInfo constructor
     */
    init(cRoute: CRouteInfo) {
        this.interfaceName = cRoute.interfaceName.toString()
        this.destination = LinkAddress(cRoute.destination)
        this.gateway = NetAddress(cRoute.gateway)
        this.hasGateway = cRoute.hasGateway
        this.isDefaultRoute = cRoute.isDefaultRoute
        cRoute.free()
    }
}

/**
 * Defines network link information.
 *
 * @relation export interface LinkAddress
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public class LinkAddress {
    /**
     * Link address.
     *
     * @relation address: NetAddress;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var address: NetAddress
    /**
     * The length of the link address prefix.
     *
     * @relation prefixLength: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var prefixLength: Int32
 
    /**
     * LinkAddress constructor
     */
    public init(address: NetAddress, prefixLength: Int32) {
        this.address = address
        this.prefixLength = prefixLength
    }

    /**
     * LinkAddress constructor
     */
    init(cAddr: CLinkAddress) {
        this.address = NetAddress(cAddr.address)
        this.prefixLength = cAddr.prefixLength
    }
}

/**
 * Defines a network address.
 *
 * @relation export interface NetAddress
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public class NetAddress {
    /**
     * Network address.
     *
     * @relation address: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var address: String
    /**
     * Address family identifier. The value is 1 for IPv4 and 2 for IPv6. The default value is 1.
     *
     * @relation family?: number; 
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var family: ?UInt32
    /**
     * Port number. The value ranges from 0 to 65535.
     *
     * @relation port?: number; 
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var port: ?UInt16
   
    /**
     * NetAddress constructor
     */
    public init(address: String, family!: ?UInt32 = None, port!: ?UInt16 = None) {
        this.address = address
        this.family = family
        this.port = port
    }
    
    /**
     * NetAddress constructor
     */
    init(cAddress: CNetAddress) {
        this.address = cAddress.address.toString()
        this.family = cAddress.family
        this.port = cAddress.port
        cAddress.free()
    }
}

/**
 * Network Global Proxy Configuration Information.
 *
 * @relation export interface HttpProxy 
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public class HttpProxy {
    /**
     * Proxy server host name.
     *
     * @relation host: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var host: ?String 
    /**
     * Host port.
     *
     * @relation port: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var port: ?UInt16
    /**
     * Do not use a blocking list for proxy servers.
     *
     * @relation exclusionList: Array<string>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var exclusionList: ?Array<String> 

    /**
     * HttpProxy constructor
     */
    public init(host!: ?String = None,  port!: ?UInt16 = None, exclusionList!: ?Array<String>  = None) {
        this.host = host
        this.port = port
        this.exclusionList = exclusionList
    }

    /**
     * HttpProxy constructor
     */
    protected init(chttpProxy: CHttpProxy) {
        this.host = if (chttpProxy.host.isEmpty()) {
            None
        } else {
            chttpProxy.host.toString()
        }
        this.port = if (chttpProxy.port == 0) {
            None
        } else {
            chttpProxy.port
        }
        this.exclusionList = if (chttpProxy.exclusionListSize == 0) {
            None
        } else {
            unsafe {
                cArr2cjArr<CString, String>(
                    chttpProxy.exclusionListSize,
                    chttpProxy.exclusionList,
                    {cstring => cstring.toString()}
                )
            }
        }
        chttpProxy.free()
    }
}

/**
 * Defines the network capability.
 *
 * @relation export enum NetCap
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public enum NetCap {
    /**
     * Indicates that the network can access the carrier's MMSC to send and receive multimedia messages.
     *
     * @relation NET_CAPABILITY_MMS = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    NetCapabilityMms
    |
        /**
         * Indicates that the network traffic is not metered.
         *
         * @relation NET_CAPABILITY_NOT_METERED = 11
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    NetCapabilityNotMetered
    |
        /**
         * Indicates that the network can access the Internet.
         *
         * @relation NET_CAPABILITY_INTERNET = 12
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    NetCapabilityInternet
    |
        /**
         * Indicates that the network does not use a VPN.
         *
         * @relation NET_CAPABILITY_NOT_VPN = 15
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    NetCapabilityNotVpn
    |
        /**
         * Indicates that the network is available.
         *
         * @relation NET_CAPABILITY_VALIDATED = 16
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    NetCapabilityValidated
    | ...

    /**
     * get the corresponding mapping value
     */
    func getValue(): Int32 {
        match (this) {
            case NetCapabilityMms => 0
            case NetCapabilityNotMetered => 11
            case NetCapabilityInternet => 12
            case NetCapabilityNotVpn => 15
            case NetCapabilityValidated => 16
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): NetCap {
        match (val) {
            case 0 => NetCapabilityMms
            case 11 => NetCapabilityNotMetered
            case 12 => NetCapabilityInternet
            case 15 => NetCapabilityNotVpn
            case 16 => NetCapabilityValidated
            case _ => throw IllegalArgumentException("Unknown value ${val}")
        }
    }
}

/**
 * Enumerates network types.
 *
 * @relation export enum NetBearType
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public enum NetBearType {
    /**
     * Indicates that the network is based on a cellular network.
     *
     * @relation BEARER_CELLULAR = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    BearerCellular
    |
        /**
         * Indicates that the network is based on a Wi-Fi network.
         *
         * @relation BEARER_WIFI = 1
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    BearerWifi
    |
        /**
         * Indicates that the network is an Ethernet network.
         *
         * @relation BEARER_ETHERNET = 3
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    BearerEthernet
    | ...

    /**
     * get the corresponding mapping value
     */
    func getValue(): Int32 {
        match (this) {
            case BearerCellular => 0
            case BearerWifi => 1
            case BearerEthernet => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): NetBearType {
        match (val) {
            case 0 => BearerCellular
            case 1 => BearerWifi
            case 3 => BearerEthernet
            case _ => throw IllegalArgumentException("Unknown value ${val}")
        }
    }
}

let ERROR_CODE_MAP = HashMap<Int32, String>(
    [ /* Net base common error */
        (2100001, "Invalid parameter value."),
        (2100002, "Operation failed. Cannot connect to service."),
        (2100003, "System internal error."),
        /* Net ext common error */
        (2200001, "Invalid parameter value."),
        (2200002, "Operation failed. Cannot connect to service."),
        (2200003, "System internal error."),
        /* Net connection Manager */
        (2101002, "the supplier id is invalid."),
        (2101003, "the net type is not found."),
        (2101004, "no any net type."),
        (2101005, "no registered."),
        (2101006, "the net id is not found."),
        (2101007, "the callback is not found."),
        (2101008, "the same callback exists."),
        (2101009, "the request id is not found."),
        (2101010, "the net is not defualt."),
        (2101011, "the http proxy is invalid."),
        (2101012, "the httpProxy in service doesnot exist."),
        (2101013, "the network doesnot exist."),
        (2101014, "the service request connection failed."),
        (2101015, "the service update net link infomation failed."),
        (2101016, "supplier doesn't exist."),
        (2101017, "net monitor failed."),
        (2101018, "no service request."),
        (2101019, "address list doesnot exist."),
        (2101020, "the bestnetwork request was not found."),
        (2101021, "no restrict background."),
        (2101022, "the number of requests exceeded the maximum."),
        (2101023, "create dump failed.")
    ]
)

func getErrorCode(code: Int32): Int32 {
    if (code == -1) {
        2200003
    } else {
        code
    }
}

func getErrorMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error code ${code}"
    }
}
