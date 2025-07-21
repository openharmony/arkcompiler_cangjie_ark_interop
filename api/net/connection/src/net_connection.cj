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
import ohos.hilog.*
import ohos.base.*
import ohos.labels.*

import std.deriving.Derive

let CONNECTION_LOG = HilogChannel(0, 0xD0015B0, "CJ-net-Connection")

/**
 * Create a network connection with optional netSpecifier and timeout.
 * @param { NetSpecifier } netSpecifier - Indicates the network specifier. See {@link NetSpecifier}.
 * @param { UInt32 } timeout - The time in milliseconds to attempt looking for a suitable network before
 * {@link NetConnection#netUnavailable} is called.
 * @returns { NetConnection } the NetConnection of the NetSpecifier.
 * @relation createNetConnection(netSpecifier?: NetSpecifier, timeout?: number): NetConnection;
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public func createNetConnection(netSpecifier!: ?NetSpecifier = None, timeout!: UInt32 = 0): NetConnection {
    CONNECTION_LOG.info("createNetConnection start")
    let specifier = match (netSpecifier) {
        case Some(v) => CNetSpecifier(v)
        case None => CNetSpecifier()
    }
    let id = unsafe { CJ_CreateNetConnection(specifier, timeout) }
    if (id < 0) {
        throw Exception("create net connection failed")
    }
    CONNECTION_LOG.info("createNetConnection success")
    NetConnection(id)
}

/**
 * Obtains the data network that is activated by default.
 * To call this method, you must have the {@code ohos.permission.GET_NETWORK_INFO} permission.
 * @permission ohos.permission.GET_NETWORK_INFO
 * @returns { NetHandle } The promise returned by the function.
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 2100002 - Operation failed. Cannot connect to service.
 * @throws { BusinessException } 2100003 - System internal error.
 * @relation getDefaultNet(): Promise<NetHandle>;
 */
@!APILevel[
    21,
    permission: "ohos.permission.GET_NETWORK_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public func getDefaultNet(): NetHandle {
    CONNECTION_LOG.info("getDefaultNet start")
    var netId = 0i32
    let retCode = unsafe { CJ_GetDefaultNet(inout netId) }
    if (retCode != SUCCESS_CODE) {
        let errCode = getErrorCode(retCode)
        throw BusinessException(errCode, "getDefaultNet failed: ${getErrorMsg(errCode)}")
    }
    CONNECTION_LOG.info("getDefaultNet success")
    NetHandle(netId)
}

/**
 * Obtains the default {@link HttpProxy} proxy settings.
 *
 * If a global proxy is set, the global proxy parameters are returned.
 * If the process is bound to a {@link NetHandle} using {@link setAppNet},
 * the {@link NetHandle} proxy settings are returned.
 * In other cases, the proxy settings of default network are returned.
 *
 * @returns { HttpProxy } the promise returned by the function.
 * @throws { BusinessException } 2100002 - Operation failed. Cannot connect to service.
 * @throws { BusinessException } 2100003 - System internal error.
 * @relation getDefaultHttpProxy(): Promise<HttpProxy>;
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public func getDefaultHttpProxy(): HttpProxy {
    CONNECTION_LOG.info("getDefaultHttpProxy start")
    unsafe {
        let cPtr = safeMalloc<CHttpProxy>()
        let retCode = CJ_GetDefaultHttpProxy(cPtr)
        let cHttpProxy = cPtr.read()
        LibC.free(cPtr)
        if (retCode != SUCCESS_CODE) {
            let errCode = getErrorCode(retCode)
            throw BusinessException(errCode, "getDefaultHttpProxy failed: ${getErrorMsg(errCode)}")
        }
        CONNECTION_LOG.info("getDefaultHttpProxy success")
        HttpProxy(cHttpProxy)
    }
}

/**
 * Obtains the {@link NetHandle} bound to a process using {@link setAppNet}.
 * @returns { NetHandle } the promise returned by the function.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 2100002 - Operation failed. Cannot connect to service.
 * @throws { BusinessException } 2100003 - System internal error.
 * @relation function getAppNetSync(): NetHandle;
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public func getAppNet(): NetHandle {
    CONNECTION_LOG.info("getAppNet start")
    var netId = 0i32
    let retCode = unsafe { CJ_GetAppNet(inout netId) }
    if (retCode != SUCCESS_CODE) {
        let errCode = getErrorCode(retCode)
        throw BusinessException(errCode, "getAppNet failed: ${getErrorMsg(errCode)}")
    }
    CONNECTION_LOG.info("getAppNet success")
    NetHandle(netId)
}

/**
 * Binds a process to {@code NetHandle}.
 * <p>All the sockets created from the process will be bound to the {@code NetHandle},
 * and the resolution of all host names will be managed by the {@code NetHandle}.</p>
 * @permission ohos.permission.INTERNET
 * @param { NetHandle } netHandle - Indicates the handle. For details, see {@link NetHandle}.
 * @returns { Promise<void> } the promise returned by the function.
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 2100001 - Invalid parameter value.
 * @throws { BusinessException } 2100002 - Operation failed. Cannot connect to service.
 * @throws { BusinessException } 2100003 - System internal error.
 * @relation setAppNet(netHandle: NetHandle): Promise<void>;
 */
@!APILevel[
    21,
    permission: "ohos.permission.INTERNET",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public func setAppNet(netHandle: NetHandle): Unit {
    CONNECTION_LOG.info("setAppNet start")
    let retCode = unsafe { CJ_SetAppNet(netHandle.netId) }
    if (retCode != SUCCESS_CODE) {
        let errCode = getErrorCode(retCode)
        throw BusinessException(errCode, "setAppNet failed: ${getErrorMsg(errCode)}")
    }
    CONNECTION_LOG.info("setAppNet success")
}

/**
 * Obtains the list of data networks that are activated.
 * To invoke this method, you must have the {@code ohos.permission.GET_NETWORK_INFO} permission.
 * @permission ohos.permission.GET_NETWORK_INFO
 * @returns { Array<NetHandle> } The promise returned by the function.
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 2100002 - Operation failed. Cannot connect to service.
 * @throws { BusinessException } 2100003 - System internal error.
 * @relation getAllNets(): Promise<Array<NetHandle>>;
 */
@!APILevel[
    21,
    permission: "ohos.permission.GET_NETWORK_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public func getAllNets(): Array<NetHandle> {
    CONNECTION_LOG.info("getAllNets start")
    let ret: RetDataCArrI32 = unsafe { CJ_GetAllNets() }
    let retCode = ret.code
    if (retCode != SUCCESS_CODE) {
        let errCode = getErrorCode(retCode)
        unsafe { LibC.free<Int32>(ret.data.head) }
        throw BusinessException(errCode, "getAllNets failed: ${getErrorMsg(errCode)}")
    }
    let arr = unsafe { cArr2cjArr<Int32, NetHandle>(ret.data.size, ret.data.head, {i => NetHandle(i)}) }
    unsafe { LibC.free<Int32>(ret.data.head) }
    CONNECTION_LOG.info("getAllNets success")
    arr
}

/**
 * Queries the connection properties of a network.
 * This method requires the {@code ohos.permission.GET_NETWORK_INFO} permission.
 * @permission ohos.permission.GET_NETWORK_INFO
 * @param { NetHandle } netHandle - Indicates the network to be queried.
 * @returns { ConnectionProperties } The promise returned by the function.
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 2100001 - Invalid parameter value.
 * @throws { BusinessException } 2100002 - Operation failed. Cannot connect to service.
 * @throws { BusinessException } 2100003 - System internal error.
 * @relation getConnectionProperties(netHandle: NetHandle): Promise<ConnectionProperties>;
 */
@!APILevel[
    21,
    permission: "ohos.permission.GET_NETWORK_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public func getConnectionProperties(netHandle: NetHandle): ConnectionProperties {
    CONNECTION_LOG.info("getConnectionProperties start")
    unsafe {
        let dataPtr = safeMalloc<CConnectionProperties>()
        dataPtr.write(CConnectionProperties())
        let retCode = CJ_GetConnectionProperties(netHandle.netId, dataPtr)
        let data = dataPtr.read()
        LibC.free(dataPtr)
        if (retCode != SUCCESS_CODE) {
            data.free()
            let errCode = getErrorCode(retCode)
            throw BusinessException(errCode, "getConnectionProperties failed: ${getErrorMsg(errCode)}")
        }
        let props = ConnectionProperties(data)
        CONNECTION_LOG.info("getConnectionProperties success")
        props
    }
}

/**
 * Obtains {@link NetCapabilities} of a {@link NetHandle} object.
 * To invoke this method, you must have the {@code ohos.permission.GET_NETWORK_INFO} permission.
 * @permission ohos.permission.GET_NETWORK_INFO
 * @param { NetHandle } netHandle - Indicates the handle. See {@link NetHandle}.
 * @returns { NetCapabilities>} The promise returned by the function.
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 2100001 - Invalid parameter value.
 * @throws { BusinessException } 2100002 - Operation failed. Cannot connect to service.
 * @throws { BusinessException } 2100003 - System internal error.
 * @relation getNetCapabilities(netHandle: NetHandle, callback: AsyncCallback<NetCapabilities>): void;
 */
@!APILevel[
    21,
    permission: "ohos.permission.GET_NETWORK_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public func getNetCapabilities(netHandle: NetHandle): NetCapabilities {
    CONNECTION_LOG.info("getNetCapabilities start")
    unsafe {
        let capPtr = safeMalloc<CNetCapabilities>()
        let retCode = CJ_GetNetCapabilities(netHandle.netId, capPtr)
        let cap = capPtr.read()
        LibC.free(capPtr)

        if (retCode != SUCCESS_CODE) {
            let errCode = getErrorCode(retCode)
            throw BusinessException(errCode, "getNetCapabilities failed: ${getErrorMsg(errCode)}")
        }
        CONNECTION_LOG.info("getNetCapabilities success")
        let capabilities = NetCapabilities(cap)
        capabilities
    }
}

/**
 * Checks whether data traffic usage on the current network is metered.
 * @permission ohos.permission.GET_NETWORK_INFO
 * @returns { Bool } Returns true if the current network is metered, else returns false.
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 2100002 - Operation failed. Cannot connect to service.
 * @throws { BusinessException } 2100003 - System internal error.
 * @relation isDefaultNetMetered(): Promise<boolean>;
 */
@!APILevel[
    21,
    permission: "ohos.permission.GET_NETWORK_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public func isDefaultNetMetered(): Bool {
    CONNECTION_LOG.info("isDefaultNetMetered start")
    var ret = false
    let retCode = unsafe { CJ_IsDefaultNetMetered(inout ret) }
    if (retCode != SUCCESS_CODE) {
        let errCode = getErrorCode(retCode)
        throw BusinessException(errCode, "isDefaultNetMetered failed: ${getErrorMsg(errCode)}")
    }
    CONNECTION_LOG.info("isDefaultNetMetered success")
    ret
}

/**
 * Checks whether the default data network is activated.
 * @permission ohos.permission.GET_NETWORK_INFO
 * @returns { Bool } Returns true if the default data network is activated, else returns false.
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 2100002 - Operation failed. Cannot connect to service.
 * @throws { BusinessException } 2100003 - System internal error.
 * @relation hasDefaultNet(): Promise<boolean>;
 */
@!APILevel[
    21,
    permission: "ohos.permission.GET_NETWORK_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public func hasDefaultNet(): Bool {
    CONNECTION_LOG.info("hasDefaultNet start")
    var ret = false
    let retCode = unsafe { CJ_HasDefaultNet(inout ret) }
    if (retCode != SUCCESS_CODE) {
        let errCode = getErrorCode(retCode)
        throw BusinessException(errCode, "hasDefaultNet failed: ${getErrorMsg(errCode)}")
    }
    CONNECTION_LOG.info("hasDefaultNet success")
    ret
}

/**
 * Reports the network state is connected.
 * @permission ohos.permission.GET_NETWORK_INFO and ohos.permission.INTERNET
 * @param { NetHandle } netHandle - Indicates the network whose state is to be reported.
 * @returns { Unit } The promise returned by the function.
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 2100001 - Invalid parameter value.
 * @throws { BusinessException } 2100002 - Operation failed. Cannot connect to service.
 * @throws { BusinessException } 2100003 - System internal error.
 * @relation reportNetConnected(netHandle: NetHandle): Promise<void>;
 */
@!APILevel[
    21,
    permission: "ohos.permission.GET_NETWORK_INFO & ohos.permission.INTERNET",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public func reportNetConnected(netHandle: NetHandle): Unit {
    CONNECTION_LOG.info("reportNetConnected start")
    let retCode = unsafe { CJ_ReportNetConnected(netHandle.netId) }
    if (retCode != SUCCESS_CODE) {
        let errCode = getErrorCode(retCode)
        throw BusinessException(errCode, "reportNetConnected failed: ${getErrorMsg(errCode)}")
    }
    CONNECTION_LOG.info("reportNetConnected success")
}

/**
 * Reports the network state is disconnected.
 * @permission ohos.permission.GET_NETWORK_INFO and ohos.permission.INTERNET
 * @param { NetHandle } netHandle - Indicates the network whose state is to be reported.
 * @returns { Unit } The promise returned by the function.
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 2100001 - Invalid parameter value.
 * @throws { BusinessException } 2100002 - Operation failed. Cannot connect to service.
 * @throws { BusinessException } 2100003 - System internal error.
 * @relation reportNetDisconnected(netHandle: NetHandle): Promise<void>;
 */
@!APILevel[
    21,
    permission: "ohos.permission.GET_NETWORK_INFO & ohos.permission.INTERNET",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public func reportNetDisconnected(netHandle: NetHandle): Unit {
    CONNECTION_LOG.info("reportNetDisconnected start")
    let retCode = unsafe { CJ_ReportNetDisconnected(netHandle.netId) }
    if (retCode != SUCCESS_CODE) {
        let errCode = getErrorCode(retCode)
        throw BusinessException(errCode, "reportNetDisconnected failed: ${getErrorMsg(errCode)}")
    }
    CONNECTION_LOG.info("reportNetDisconnected success")
}

/**
 * Resolves the host name to obtain all IP addresses based on the default data network.
 * @permission ohos.permission.INTERNET
 * @param { String } host - Indicates the host name or the domain.
 * @returns { Array<NetAddress> } The promise returned by the function.
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { BusinessException } 401 - Parameter error.
 * @throws { BusinessException } 2100001 - Invalid parameter value.
 * @throws { BusinessException } 2100002 - Operation failed. Cannot connect to service.
 * @throws { BusinessException } 2100003 - System internal error.
 * @syscap SystemCapability.Communication.NetManager.Core
 * @relation getAddressesByName(host: string): Promise<Array<NetAddress>>;
 */
@!APILevel[
    21,
    permission: "ohos.permission.INTERNET",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public func getAddressesByName(host: String): Array<NetAddress> {
    getDefaultNet().getAddressesByName(host)
}

/**
 * Represents the network connection handle.
 * 
 * @relation export interface NetConnection
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public class NetConnection <: RemoteDataLite {
    init(id: Int64) {
        super(id)
        CONNECTION_LOG.info("NetConnection construct success")
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Receives status change notifications of a specified network.
     * @permission ohos.permission.GET_NETWORK_INFO
     * @param { AsyncCallback<void> } callback - the callback of register.
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Parameter error.
     * @throws { BusinessException } 2100002 - Failed to connect to the service.
     * @throws { BusinessException } 2100003 - System internal error.
     * @throws { BusinessException } 2101008 - The callback already exists.
     * @throws { BusinessException } 2101022 - The number of requests exceeded the maximum allowed.
     * @relation register(callback: AsyncCallback<void>): void;
     */
    @!APILevel[
        21,
        permission: "ohos.permission.GET_NETWORK_INFO",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public func register(): Unit {
        CONNECTION_LOG.info("register start")
        let retCode = unsafe { CJ_NetConnectionRegister(getID()) }
        if (retCode != SUCCESS_CODE) {
            let errCode = getErrorCode(retCode)
            throw BusinessException(errCode, "register failed: ${getErrorMsg(errCode)}")
        }
        CONNECTION_LOG.info("register success")
    }

    /**
     * Cancels listening for network status changes.
     * @throws { BusinessException } 401 - Parameter error.
     * @throws { BusinessException } 2100002 - Failed to connect to the service.
     * @throws { BusinessException } 2100003 - System internal error.
     * @throws { BusinessException } 2101007 - The callback does not exist.
     * @relation unregister(callback: AsyncCallback<void>): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public func unregister(): Unit {
        CONNECTION_LOG.info("unregister start")
        let retCode = unsafe { CJ_NetConnectionUnRegister(getID()) }
        if (retCode != SUCCESS_CODE) {
            let errCode = getErrorCode(retCode)
            throw BusinessException(errCode, "unregister failed: ${getErrorMsg(errCode)}")
        }
        CONNECTION_LOG.info("unregister success")
    }

    /**
     * Registers a listener for netAvailable events.
     *
     * @relation on(type: 'netAvailable', callback: Callback<NetHandle>): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public func onNetAvailable(callback: (NetHandle) -> Unit): Unit {
        CONNECTION_LOG.info("onNetAvailable start register")
        let wrapper = {
            netId: Int32 =>
            let handle = NetHandle(netId)
            callback(handle)
        }
        let registerCall = Callback1Param<Int32, Unit>(wrapper)
        unsafe { CJ_OnNetAvailable(getID(), registerCall.getID()) }
        CONNECTION_LOG.info("onNetAvailable register success")
    }

    /**
     * Registers a listener for netBlockStatusChange events.
     *
     * @relation on(type: 'netBlockStatusChange', callback: Callback<NetBlockStatusInfo>): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public func onNetBlockStatusChange(callback: (NetHandle, Bool) -> Unit): Unit {
        CONNECTION_LOG.info("onNetBlockStatusChange start register")
        let wrapper = {
            netId: Int32, block: Bool =>
            let handle = NetHandle(netId)
            callback(handle, block)
        }
        let registerCall = Callback2Param<Int32, Bool, Unit>(wrapper)
        unsafe { CJ_OnNetBlockStatusChange(getID(), registerCall.getID()) }
        CONNECTION_LOG.info("onNetBlockStatusChange register success")
    }

    /**
     * Registers a listener for **netCapabilitiesChange** events.
     *
     * @relation on(type: 'netCapabilitiesChange', callback: Callback<NetCapabilityInfo>): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public func onNetCapabilitiesChange(callback: (NetCapabilityInfo) -> Unit): Unit {
        CONNECTION_LOG.info("onNetCapabilitiesChange start register")
        let wrapper = {
            info: CNetCapabilityInfo =>
            CONNECTION_LOG.info("onNetCapabilitiesChange callback called")
            let capabilitiesInfo = NetCapabilityInfo(info)
            callback(capabilitiesInfo)
            CONNECTION_LOG.info("onNetCapabilitiesChange callback end")
        }
        let registerCall = Callback1Param<CNetCapabilityInfo, Unit>(wrapper)
        unsafe { CJ_OnNetCapabilitiesChange(getID(), registerCall.getID()) }
        CONNECTION_LOG.info("onNetCapabilitiesChange register success")
    }

    /**
     * Registers a listener for netConnectionPropertiesChange events.
     *
     * @relation on(type: 'netConnectionPropertiesChange', callback: Callback<NetConnectionPropertyInfo>): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public func onNetConnectionPropertiesChange(callback: (NetHandle, ConnectionProperties) -> Unit): Unit {
        CONNECTION_LOG.info("onNetConnectionPropertiesChange start register")
        let wrapper = {
            netId: Int32, props: CConnectionProperties =>
            CONNECTION_LOG.info("onNetConnectionPropertiesChange callback called")
            let handle = NetHandle(netId)
            let connectionProprties = ConnectionProperties(props)
            callback(handle, connectionProprties)
            CONNECTION_LOG.info("onNetConnectionPropertiesChange callback end")
        }
        let registerCall = Callback2Param<Int32, CConnectionProperties, Unit>(wrapper)
        unsafe { CJ_OnNetConnectionPropertiesChange(getID(), registerCall.getID()) }
        CONNECTION_LOG.info("onNetConnectionPropertiesChange register success")
    }

    /**
     * Registers a listener for **netLost** events.
     *
     * @relation on(type: 'netLost', callback: Callback<NetHandle>): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public func onNetLost(callback: (NetHandle) -> Unit): Unit {
        CONNECTION_LOG.info("onNetLost start register")
        let wrapper = {
            netId: Int32 =>
            let handle = NetHandle(netId)
            callback(handle)
        }
        let registerCall = Callback1Param<Int32, Unit>(wrapper)
        unsafe { CJ_OnNetLost(getID(), registerCall.getID()) }
        CONNECTION_LOG.info("onNetLost register success")
    }

    /**
     * Registers a listener for netUnavailable events.
     *
     * @relation on(type: 'netUnavailable', callback: Callback<void>): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public func onNetUnavailable(callback: () -> Unit): Unit {
        CONNECTION_LOG.info("onNetAvailable start register")
        let registerCall = Callback0Param<Unit>(callback)
        unsafe { CJ_OnNetUnavailable(getID(), registerCall.getID()) }
        CONNECTION_LOG.info("onNetAvailable register success")
    }
}

/**
 * Defines the handle of the data network.
 * 
 * @relation export interface NetHandle
 */
@Derive[ToString]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.NetManager.Core"
]
public class NetHandle {
    /**
     * Network ID, a value of 0 means that there is no default network, and the other values must be greater than or equal to 100.
     *
     * @relation netId: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public var netId: Int32
    /**
     * NetHandle constructor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public init(netId: Int32 ) {
        this.netId = netId
    }


    /**
     * Resolves a host name to obtain all IP addresses based on the specified NetHandle.
     * @permission ohos.permission.INTERNET
     * @param { String } host - Indicates the host name or the domain.
     * @returns { Array<NetAddress> } The promise returned by the function.
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Parameter error.
     * @throws { BusinessException } 2100001 - Invalid parameter value.
     * @throws { BusinessException } 2100002 - Operation failed. Cannot connect to service.
     * @throws { BusinessException } 2100003 - System internal error.
     * @relation getAddressesByName(host: string): Promise<Array<NetAddress>>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public func getAddressesByName(host: String): Array<NetAddress> {
        CONNECTION_LOG.info("NetHandle getAddressesByName start")
        let cHost = unsafe { LibC.mallocCString(host) }
        let ret: RetNetAddressArr = unsafe { CJ_GetAddressesByName(netId, cHost) }
        unsafe { LibC.free(cHost) }
        let retCode = ret.code
        if (retCode != SUCCESS_CODE) {
            let errCode = getErrorCode(retCode)
            throw BusinessException(errCode, "NetHandle getAddressesByName failed: ${getErrorMsg(errCode)}")
        }
        let size = ret.size
        let ptr = ret.data
        let arr = Array<NetAddress>(
            size,
            {
                i =>
                let address = unsafe { ptr.read(i) }
                NetAddress(address)
            }
        )
        ret.free()
        CONNECTION_LOG.info("NetHandle getAddressesByName success")
        arr
    }

    /**
     * Resolves a host name to obtain the first IP address based on the specified NetHandle.
     * @permission ohos.permission.INTERNET
     * @param { String } host - Indicates the host name or the domain.
     * @returns { NetAddress } The promise returned by the function.
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Parameter error.
     * @throws { BusinessException } 2100001 - Invalid parameter value.
     * @throws { BusinessException } 2100002 - Operation failed. Cannot connect to service.
     * @throws { BusinessException } 2100003 - System internal error.
     * @relation getAddressByName(host: string): Promise<NetAddress>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.NetManager.Core"
    ]
    public func getAddressByName(host: String): NetAddress {
        let arr = getAddressesByName(host)
        if (arr.size > 0) {
            return arr[0]
        }
        // code address not found
        let errCode = 2101019i32
        throw BusinessException(errCode, "NetHandle getAddressesByName failed: ${getErrorMsg(errCode)}")
    }
}
