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
 */
@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public class NetSpecifier {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public NetSpecifier(
        // The transmission capacity and support of the network's global proxy storage data network.
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let netCapabilities: NetCapabilities,
        // Network identifier, the identifier for Wi Fi networks is "wifi",
        // and the identifier for cellular networks is "simId1" (corresponding to SIM card 1).
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let bearerPrivateIdentifier!: ?String = None
    ) {}
}

/**
 * Receive information about changes in network capabilities.
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public class NetCapabilityInfo {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public NetCapabilityInfo(
        /**
         * Defines the handle of the data network.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let netHandle: NetHandle,
        /**
         * Defines the network capability set.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let netCap!: ?NetCapabilities = None
    ) {}

    init(cInfo: CNetCapabilityInfo) {
        this.netHandle = NetHandle(cInfo.netHandle)
        this.netCap = NetCapabilities(cInfo.netCap)
    }
}

/**
 * Defines the network capability set.
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public class NetCapabilities {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public NetCapabilities(
        // Network type.
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let bearerTypes: Array<NetBearType>,
        // Uplink (device-to-network) bandwidth.
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let linkUpBandwidthKbps!: ?UInt32 = None,
        // Downstream (network-to-device) bandwidth.
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let linkDownBandwidthKbps!: ?UInt32 = None,
        // Network-specific capabilities.
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let networkCap!: ?Array<NetCap> = None
    ) {}

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
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public class ConnectionProperties {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public ConnectionProperties(
        /**
         * Network card name.
         */
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let interfaceName: String,
        /**
         * Domain. The default value is "".
         */
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let domains: String,
        /**
         * Link information.
         */
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let linkAddresses: Array<LinkAddress>,
        /**
         * Network address, refer to [NetAddress].
         */
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let dnses: Array<NetAddress>,
        /**
         * Routing information.
         */
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let routes: Array<RouteInfo>,
        /**
         * Maximum transmission unit.
         */
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let mtu: UInt16
    ) {}

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
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public class RouteInfo {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public RouteInfo(
        /**
         * Network card name.
         */
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let interfaceName: String,

        /**
         * Destination Address
         */
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let destination: LinkAddress,

        /**
         * Gateway address.
         */
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let gateway: NetAddress,

        /**
         * Whether a gateway is present.
         */
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let hasGateway: Bool,

        /**
         * Whether the route is the default route.
         */
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let isDefaultRoute: Bool
    ) {}

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
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public class LinkAddress {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public LinkAddress(
        /**
         * Link address.
         */
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let address: NetAddress,
        /**
         * The length of the link address prefix.
         */
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let prefixLength: Int32
    ) {}

    init(cAddr: CLinkAddress) {
        this.address = NetAddress(cAddr.address)
        this.prefixLength = cAddr.prefixLength
    }
}

/**
 * Defines a network address.
 */
@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public class NetAddress {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public NetAddress(
        /**
         * Network address.
         */
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let address: String,
        /**
         * Address family identifier. The value is 1 for IPv4 and 2 for IPv6. The default value is 1.
         */
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let family: ?UInt32,
        /**
         * Port number. The value ranges from 0 to 65535.
         */
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let port: ?UInt16
    ) {}

    init(cAddress: CNetAddress) {
        this.address = cAddress.address.toString()
        this.family = cAddress.family
        this.port = cAddress.port
        cAddress.free()
    }
}

/**
 * Network Global Proxy Configuration Information.
 */
@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public class HttpProxy {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public HttpProxy(
        /**
         * Proxy server host name.
         */
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let host!: ?String = None,
        /**
         * Host port.
         */
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let port!: ?UInt16 = None,
        /**
         * Do not use a blocking list for proxy servers.
         */
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.NetManager.Core"
        ]
        public let exclusionList!: ?Array<String> = None
    ) {}

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
 */
@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public enum NetCap {
    /**
     * Indicates that the network can access the carrier's MMSC to send and receive multimedia messages.
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    NET_CAPABILITY_MMS
    |
        /**
         * Indicates that the network traffic is not metered.
         */
        @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    NET_CAPABILITY_NOT_METERED
    |
        /**
         * Indicates that the network can access the Internet.
         */
        @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    NET_CAPABILITY_INTERNET
    |
        /**
         * Indicates that the network does not use a VPN.
         */
        @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    NET_CAPABILITY_NOT_VPN
    |
        /**
         * Indicates that the network is available.
         */
        @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    NET_CAPABILITY_VALIDATED
    |
        /**
         * Indicates that the network is portal.
         */
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    NET_CAPABILITY_PORTAL
    |
        /**
         * Indicates that the network is checking connectivity.
         */
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    NET_CAPABILITY_CHECKING_CONNECTIVITY
    | ...

    func getValue(): Int32 {
        match (this) {
            case NET_CAPABILITY_MMS => 0
            case NET_CAPABILITY_NOT_METERED => 11
            case NET_CAPABILITY_INTERNET => 12
            case NET_CAPABILITY_NOT_VPN => 15
            case NET_CAPABILITY_VALIDATED => 16
            case NET_CAPABILITY_PORTAL => 17
            case NET_CAPABILITY_CHECKING_CONNECTIVITY => 31
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): NetCap {
        match (val) {
            case 0 => NET_CAPABILITY_MMS
            case 11 => NET_CAPABILITY_NOT_METERED
            case 12 => NET_CAPABILITY_INTERNET
            case 15 => NET_CAPABILITY_NOT_VPN
            case 16 => NET_CAPABILITY_VALIDATED
            case 17 => NET_CAPABILITY_PORTAL
            case 31 => NET_CAPABILITY_CHECKING_CONNECTIVITY
            case _ => throw IllegalArgumentException("Unknown value ${val}")
        }
    }
}

/**
 * Enumerates network types.
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public enum NetBearType {
    /**
     * Indicates that the network is based on a cellular network.
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    BEARER_CELLULAR
    |
        /**
         * Indicates that the network is based on a Wi-Fi network.
         */
        @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    BEARER_WIFI
    |
        /**
         * Indicates that the network is based on a bluetooth network.
         */
        @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    BEARER_BLUETOOTH
    |
        /**
         * Indicates that the network is an Ethernet network.
         */
        @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    BEARER_ETHERNET
    |
        /**
         * Indicates that the network is based on a VPN network.
         */
        @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    BEARER_VPN
    | ...

    func getValue(): Int32 {
        match (this) {
            case BEARER_CELLULAR => 0
            case BEARER_WIFI => 1
            case BEARER_BLUETOOTH => 2
            case BEARER_ETHERNET => 3
            case BEARER_VPN => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): NetBearType {
        match (val) {
            case 0 => BEARER_CELLULAR
            case 1 => BEARER_WIFI
            case 2 => BEARER_BLUETOOTH
            case 3 => BEARER_ETHERNET
            case 4 => BEARER_VPN
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
