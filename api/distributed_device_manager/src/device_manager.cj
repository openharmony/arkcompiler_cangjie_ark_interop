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

package ohos.distributed_device_manager

import ohos.base.*
import ohos.ffi.{RemoteDataLite, BaseCallBack, Callback1Param, Callback2Param, SUCCESS_CODE, releaseFFIData}
import std.collection.HashMap
import std.deriving.Derive
import std.io.{ByteBuffer, readToEnd}
import ohos.encoding.json.*
import ohos.labels.*

@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedHardware.DeviceManager"
]
public enum ValueType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedHardware.DeviceManager"
    ]
    Integer(Int64)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedHardware.DeviceManager"
    ]
    Str(String)
    | ...
}

/**
 * The type to be registed in on/off function.
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedHardware.DeviceManager"
]
public enum DeviceStatusType {
    /**
     * Indicate that the device state has changed.
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedHardware.DeviceManager"
    ]
    DEVICE_STATE_CHANGE
    |

        /**
         * Indicate that discover divices has successed.
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedHardware.DeviceManager"
    ]
    DISCOVER_SUCCESS
    |

        /**
         * Indicate that the remote device name has changed.
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedHardware.DeviceManager"
    ]
    DEVICE_NAME_CHANGE
    |

        /**
         * Indicate that discover divices has failed.
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedHardware.DeviceManager"
    ]
    DISCOVER_FAILURE
    |

        /**
         * Unknown type.
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedHardware.DeviceManager"
    ]
    UNKNOWN
    | ...

    prop value: String {
        get() {
            match (this) {
                case DEVICE_NAME_CHANGE => "deviceNameChange"
                case DEVICE_STATE_CHANGE => "deviceStateChange"
                case DISCOVER_SUCCESS => "discoverSuccess"
                case DISCOVER_FAILURE => "discoverFailure"
                case UNKNOWN => "unknown"
                case _ => "unknown"
            }
        }
    }

    static func parse(v: String): DeviceStatusType {
        match (v) {
            case "deviceNameChange" => DEVICE_NAME_CHANGE
            case "deviceStateChange" => DEVICE_STATE_CHANGE
            case "discoverSuccess" => DISCOVER_SUCCESS
            case "discoverFailure" => DISCOVER_FAILURE
            case _ => UNKNOWN
        }
    }
}

/**
 * The state of the nearby devices.
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedHardware.DeviceManager"
]
public enum DeviceStateChange {
    /**
     * This state indicates the device is online but the state is unknown,The distributed function cannot used until
     * state changes to AVAILABLE.
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedHardware.DeviceManager"
    ]
    UNKNOWN
    |

        /**
         * This state indicates the device has been synchronized to the database, Now the distributed function can be used.
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedHardware.DeviceManager"
    ]
    AVAILABLE
    |

        /**
         * This state indicates the device is offline.
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedHardware.DeviceManager"
    ]
    UNAVAILABLE
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case UNKNOWN => 0
                case AVAILABLE => 1
                case UNAVAILABLE => 2
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(v: Int32): DeviceStateChange {
        match (v) {
            case 0 => UNKNOWN
            case 1 => AVAILABLE
            case 2 => UNAVAILABLE
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Basic description information of a distributed device.
 * @struct DeviceBasicInfo
 * @syscap SystemCapability.DistributedHardware.DeviceManager
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedHardware.DeviceManager"
]
public class DeviceBasicInfo {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedHardware.DeviceManager"
    ]
    public DeviceBasicInfo(
        /**
         * Device identifier. The actual value is udid-hash confused with appid and salt value based on sha256.
         * This id remains unchanged after application installation. If the application is uninstalled and reinstalled,
         * the obtained ID will change.
         * @type { String }
         * @syscap SystemCapability.DistributedHardware.DeviceManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.DistributedHardware.DeviceManager"
        ]
        public let deviceId: String,
        /**
         * Device name.
         * @type { String }
         * @syscap SystemCapability.DistributedHardware.DeviceManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.DistributedHardware.DeviceManager"
        ]
        public let deviceName: String,
        /**
         * Obtains the device type represented by a string,
         * which can be {@code phone}, {@code tablet}, {@code tv}, {@code smartVision}, {@code car}.
         * @type { Int32 }
         * @syscap SystemCapability.DistributedHardware.DeviceManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.DistributedHardware.DeviceManager"
        ]
        public let deviceType: Int32,
        /**
         * Device network id.
         * @type { String }
         * @syscap SystemCapability.DistributedHardware.DeviceManager
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.DistributedHardware.DeviceManager"
        ]
        public let networkId: String
    ) {}

    init(data: CDeviceBasicInfo) {
        deviceId = data.deviceId.toString()
        deviceName = data.deviceName.toString()
        deviceType = Int32(data.deviceType)
        networkId = data.networkId.toString()
    }
}

/**
 * Creates an {@code DeviceManager} instance.
 *
 * To manage devices, you must first call this method to obtain a {@code DeviceManager} instance and then
 * use this instance to call other device management methods.
 *
 * @param { String } bundleName - Indicates the bundle name of the application.
 * @returns { DeviceManager } - Return the DeviceManager object.
 * @throws { BusinessError } 401 - Parameter error. Possible causes:
 *                                                  1. Mandatory parameters are left unspecified;
 *                                                  2. Incorrect parameter type;
 *                                                  3. Parameter verification failed.
 * @syscap SystemCapability.DistributedHardware.DeviceManager
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedHardware.DeviceManager"
]
public func createDeviceManager(bundleName: String): DeviceManager {
    var errCode: Int32 = SUCCESS_CODE
    var id: Int64 = 0
    unsafe {
        try (cBundleName = LibC.mallocCString(bundleName).asResource()) {
            id = FfiOHOSDistributedDeviceManagerCreateDeviceManager(cBundleName.value, inout errCode)
        }
        if (errCode != SUCCESS_CODE) {
            throw BusinessException(errCode, getErrorMsg(errCode))
        }
    }
    return DeviceManager(id)
}

/**
 * Releases the {@code DeviceManager} instance that is no longer used.
 *
 * @permission ohos.permission.DISTRIBUTED_DATASYNC
 * @param { DeviceManager } deviceManager - Indicates the {@code DeviceManager} instance.
 * @throws { BusinessError } 201 - Permission verification failed. The application does not have the permission required to call the API.
 * @throws { BusinessError } 401 - Parameter error. Possible causes:
 *                                                  1. Mandatory parameters are left unspecified;
 *                                                  2. Incorrect parameter types;
 *                                                  3. Parameter verification failed.
 * @throws { BusinessError } 11600101 - Failed to execute the function.
 * @syscap SystemCapability.DistributedHardware.DeviceManager
 */
@!APILevel[
    19,
    permission: "ohos.permission.DISTRIBUTED_DATASYNC",
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedHardware.DeviceManager"
]
public func releaseDeviceManager(deviceManager: DeviceManager): Unit {
    var errCode: Int32 = SUCCESS_CODE
    unsafe {
        FfiOHOSDistributedDeviceManagerReleaseDeviceManager(deviceManager.getID(), inout errCode)
    }
    if (errCode != SUCCESS_CODE) {
        throw BusinessException(errCode, getErrorMsg(errCode))
    }
}

/**
 * Provides methods for managing devices.
 *
 * @class DeviceManager
 * @syscap SystemCapability.DistributedHardware.DeviceManager
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedHardware.DeviceManager"
]
public class DeviceManager <: RemoteDataLite {
    DeviceManager(id: Int64) {
        super(id)
    }

    ~init() {
        var errCode: Int32 = 0
        unsafe {
            FfiOHOSDistributedDeviceManagerReleaseDeviceManager(myDataId, inout errCode)
        }
        if (errCode != SUCCESS_CODE) {
            DEVICE_MANAGER_LOG.error(
                "get errCode when release DeviceManager, errCode: ${errCode}, errMsg: ${getErrorMsg(errCode)}")
        }
        releaseFFIData(myDataId)
    }

    /**
     * Get a list of available devices. This interface query all authorized and connectable devices.
     *
     * @permission ohos.permission.DISTRIBUTED_DATASYNC
     * @returns { Array<DeviceBasicInfo> } - Returns a list of available devices.
     * @throws { BusinessError } 201 - Permission verification failed. The application does not have the permission required to call the API.
     * @throws { BusinessError } 401 - Parameter error. Possible causes:
     *                                                  1. Mandatory parameters are left unspecified;
     *                                                  2. Incorrect parameter types;
     *                                                  3. Parameter verification failed.
     * @throws { BusinessError } 11600101 - Failed to execute the function.
     * @syscap SystemCapability.DistributedHardware.DeviceManager
     */
    @!APILevel[
        19,
        permission: "ohos.permission.DISTRIBUTED_DATASYNC",
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedHardware.DeviceManager"
    ]
    public func getAvailableDeviceList(): Array<DeviceBasicInfo> {
        var errCode: Int32 = SUCCESS_CODE
        var deviceInfoList = CDeviceBasicInfoArray()
        unsafe {
            try {
                FfiOHOSDistributedDeviceManagerGetAvailableDeviceList(myDataId, inout deviceInfoList, inout errCode)
                if (errCode != SUCCESS_CODE) {
                    throw BusinessException(errCode, getErrorMsg(errCode))
                }
                deviceInfoList.toArray()
            } finally {
                FfiOHOSDistributedDeviceManagerFreeDeviceInfoList(deviceInfoList)
            }
        }
    }

    /**
     * Get the network id of the local device.
     *
     * @permission ohos.permission.DISTRIBUTED_DATASYNC
     * @returns { String } - Returns local device network id.
     * @throws { BusinessError } 201 - Permission verification failed. The application does not have the permission required to call the API.
     * @throws { BusinessError } 11600101 - Failed to execute the function.
     * @syscap SystemCapability.DistributedHardware.DeviceManager
     */
    @!APILevel[
        19,
        permission: "ohos.permission.DISTRIBUTED_DATASYNC",
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedHardware.DeviceManager"
    ]
    public func getLocalDeviceNetworkId(): String {
        var errCode: Int32 = SUCCESS_CODE
        unsafe {
            try (cNetworkId = FfiOHOSDistributedDeviceManagerGetLocalDeviceNetworkId(myDataId, inout errCode)
                .asResource()) {
                if (errCode != SUCCESS_CODE) {
                    throw BusinessException(errCode, getErrorMsg(errCode))
                }
                return cNetworkId.value.toString()
            }
        }
        ""
    }

    /**
     * Get the device name of the local device.
     *
     * @permission ohos.permission.DISTRIBUTED_DATASYNC
     * @returns { String } - Returns local device name.
     * @throws { BusinessError } 201 - Permission verification failed. The application does not have the permission required to call the API.
     * @throws { BusinessError } 11600101 - Failed to execute the function.
     * @syscap SystemCapability.DistributedHardware.DeviceManager
     */
    @!APILevel[
        19,
        permission: "ohos.permission.DISTRIBUTED_DATASYNC",
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedHardware.DeviceManager"
    ]
    public func getLocalDeviceName(): String {
        var errCode: Int32 = SUCCESS_CODE
        unsafe {
            try (cName = FfiOHOSDistributedDeviceManagerGetLocalDeviceName(myDataId, inout errCode).asResource()) {
                if (errCode != SUCCESS_CODE) {
                    throw BusinessException(errCode, getErrorMsg(errCode))
                }
                return cName.value.toString()
            }
        }
        ""
    }

    /**
     * Get the device type of the local device.
     *
     * @permission ohos.permission.DISTRIBUTED_DATASYNC
     * @returns { Int32 } - Returns local device type.
     * @throws { BusinessError } 201 - Permission verification failed. The application does not have the permission required to call the API.
     * @throws { BusinessError } 11600101 - Failed to execute the function.
     * @syscap SystemCapability.DistributedHardware.DeviceManager
     */
    @!APILevel[
        19,
        permission: "ohos.permission.DISTRIBUTED_DATASYNC",
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedHardware.DeviceManager"
    ]
    public func getLocalDeviceType(): Int32 {
        var errCode: Int32 = SUCCESS_CODE
        let deviceType = unsafe { FfiOHOSDistributedDeviceManagerGetLocalDeviceType(myDataId, inout errCode) }
        if (errCode != SUCCESS_CODE) {
            throw BusinessException(errCode, getErrorMsg(errCode))
        }
        return deviceType
    }

    /**
     * Get the device id of the local device.
     *
     * @permission ohos.permission.DISTRIBUTED_DATASYNC
     * @returns { String } - Device identifier. The actual value is udid-hash confused with appid and salt value based on sha256.
     * This id remains unchanged after application installation. If the application is uninstalled and reinstalled,
     * the obtained ID will change.
     * @throws { BusinessError } 201 - Permission verification failed. The application does not have the permission required to call the API.
     * @throws { BusinessError } 11600101 - Failed to execute the function.
     * @syscap SystemCapability.DistributedHardware.DeviceManager
     */
    @!APILevel[
        19,
        permission: "ohos.permission.DISTRIBUTED_DATASYNC",
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedHardware.DeviceManager"
    ]
    public func getLocalDeviceId(): String {
        var errCode: Int32 = SUCCESS_CODE
        unsafe {
            try (cDeviceId = FfiOHOSDistributedDeviceManagerGetLocalDeviceId(myDataId, inout errCode).asResource()) {
                if (errCode != SUCCESS_CODE) {
                    throw BusinessException(errCode, getErrorMsg(errCode))
                }
                return cDeviceId.value.toString()
            }
        }
        ""
    }

    /**
     * Get the device name by network id.
     *
     * @permission ohos.permission.DISTRIBUTED_DATASYNC
     * @param { String } networkId - Device network id.
     * @returns { String } - Returns device name.
     * @throws { BusinessError } 201 - Permission verification failed. The application does not have the permission required to call the API.
     * @throws { BusinessError } 401 - Parameter error. Possible causes:
     *                                                  1. Mandatory parameters are left unspecified;
     *                                                  2. Incorrect parameter type;
     *                                                  3. Parameter verification failed;
     *                                                  4. The size of specified networkId is greater than 255.
     * @throws { BusinessError } 11600101 - Failed to execute the function.
     * @syscap SystemCapability.DistributedHardware.DeviceManager
     */
    @!APILevel[
        19,
        permission: "ohos.permission.DISTRIBUTED_DATASYNC",
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedHardware.DeviceManager"
    ]
    public func getDeviceName(networkId: String): String {
        var errCode: Int32 = SUCCESS_CODE
        unsafe {
            try (
                cNetworkId = LibC.mallocCString(networkId).asResource(),
                cDeviceName = FfiOHOSDistributedDeviceManagerGetDeviceName(myDataId, cNetworkId.value, inout errCode)
                    .asResource()
            ) {
                if (errCode != SUCCESS_CODE) {
                    throw BusinessException(errCode, getErrorMsg(errCode))
                }
                return cDeviceName.value.toString()
            }
        }
        ""
    }

    /**
     * Get the device type by network id.
     *
     * @permission ohos.permission.DISTRIBUTED_DATASYNC
     * @param { String } networkId - Device network id.
     * @returns { Int32 } - Returns device type.
     * @throws { BusinessError } 201 - Permission verification failed. The application does not have the permission required to call the API.
     * @throws { BusinessError } 401 - Parameter error. Possible causes:
     *                                                  1. Mandatory parameters are left unspecified;
     *                                                  2. Incorrect parameter type;
     *                                                  3. Parameter verification failed;
     *                                                  4. The size of specified networkId is greater than 255.
     * @throws { BusinessError } 11600101 - Failed to execute the function.
     * @syscap SystemCapability.DistributedHardware.DeviceManager
     */
    @!APILevel[
        19,
        permission: "ohos.permission.DISTRIBUTED_DATASYNC",
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedHardware.DeviceManager"
    ]
    public func getDeviceType(networkId: String): Int32 {
        var errCode: Int32 = SUCCESS_CODE
        unsafe {
            try (cNetworkId = LibC.mallocCString(networkId).asResource()) {
                let deviceType = FfiOHOSDistributedDeviceManagerGetDeviceType(myDataId, cNetworkId.value, inout errCode)
                if (errCode != SUCCESS_CODE) {
                    throw BusinessException(errCode, getErrorMsg(errCode))
                }
                return deviceType
            }
        }
        0
    }

    /**
     * Start to discover nearby devices.
     *
     * @permission ohos.permission.DISTRIBUTED_DATASYNC
     * @param { HashMap<String,ValueType> } discoverParam - Identifies the type of target discovered:
     *       discoverTargetType : 1     - Discovery target as a device by default, the value is 1.
     * @param { HashMap<String,ValueType> } filterOptions - FilterOptions to filter discovery device.
     * The type of filterOptions is map. The map are as follows:
     *       availableStatus: 0-1       - Discover devices only are credible, The value is 0 indicates device isn't credible;
     *                                      0: Devices are offline, client need to bind the device by calling bindTarget() and then connect to it.
     *                                      1: Devices already online, client can make connection.
     *       discoverDistance: 0-100    - Discover devices within a certain distance from the local, the unit is cm.
     *       authenticationStatus: 0-1  - Discover devices based on different authentication status:
     *                                      0: Devices not authenticated.
                                            1: Devices already authenticated.
     *                                The value is 1 indicates device is trust.
     *       authorizationType: 0-2     - Discover devices based on different authorization type:
     *                                      0: Devices authenticated based on temporary negotiated session key.
     *                                      1: Devices authenticated based on the same account credential key.
     *                                      2: Devices authenticated based on different account credential keys.
     * @throws { BusinessError } 401 - Parameter error. Possible causes:
     *                                                  1. Mandatory parameters are left unspecified;
     *                                                  2. Incorrect parameter type;
     *                                                  3. Parameter verification failed.
     * @throws { BusinessError } 201 - Permission verification failed. The application does not have the permission required to call the API.
     * @throws { BusinessError } 11600104 - Discovery unavailable.
     * @throws { BusinessError } 11600101 - Failed to execute the function.
     * @syscap SystemCapability.DistributedHardware.DeviceManager
     */
    @!APILevel[
        19,
        permission: "ohos.permission.DISTRIBUTED_DATASYNC",
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedHardware.DeviceManager"
    ]
    public func startDiscovering(
        discoverParam: HashMap<String, ValueType>,
        filterOptions!: ?HashMap<String, ValueType> = None
    ): Unit {
        DEVICE_MANAGER_LOG.info("start discover.")
        if (!discoverParam.contains("discoverTargetType") || discoverParam["discoverTargetType"] != Integer(1)) {
            DEVICE_MANAGER_LOG.error("discover error with wrong discoverTargetType.")
            throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
        DEVICE_MANAGER_LOG.info("try get extra.")
        let extra: String = match (filterOptions) {
            case None => ""
            case Some(v) => getExtraInfo(v)
        }
        DEVICE_MANAGER_LOG.info("get extra.")
        var errCode: Int32 = SUCCESS_CODE
        unsafe {
            try (cExtra = LibC.mallocCString(extra).asResource()) {
                FfiOHOSDistributedDeviceManagerStartDiscovering(myDataId, cExtra.value, inout errCode)
            }
        }
        DEVICE_MANAGER_LOG.info("start discovering return with errCode ${errCode}")
        if (errCode != SUCCESS_CODE) {
            throw BusinessException(errCode, getErrorMsg(errCode))
        }
    }

    /**
     * Stop discovering nearby devices.
     *
     * @permission ohos.permission.DISTRIBUTED_DATASYNC
     * @throws { BusinessError } 401 - Parameter error. Possible causes:
     *                                                  1. Mandatory parameters are left unspecified;
     *                                                  2. Incorrect parameter type;
     *                                                  3. Parameter verification failed.
     * @throws { BusinessError } 201 - Permission verification failed. The application does not have the permission required to call the API.
     * @throws { BusinessError } 11600104 - Discovery unavailable.
     * @throws { BusinessError } 11600101 - Failed to execute the function.
     * @syscap SystemCapability.DistributedHardware.DeviceManager
     */
    @!APILevel[
        19,
        permission: "ohos.permission.DISTRIBUTED_DATASYNC",
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedHardware.DeviceManager"
    ]
    public func stopDiscovering(): Unit {
        var errCode: Int32 = SUCCESS_CODE
        unsafe { FfiOHOSDistributedDeviceManagerStopDiscovering(myDataId, inout errCode) }
        if (errCode != SUCCESS_CODE) {
            throw BusinessException(errCode, getErrorMsg(errCode))
        }
    }

    /**
     * Bind the specified target.
     *
     * @permission ohos.permission.DISTRIBUTED_DATASYNC
     * @param { String } deviceId - id of device to bind.
     * @param { HashMap<String,ValueType> } bindParam - parameters of device to bind, The parameter type is map,such as:
     *      "bindType" : 1,           - This value is type of bind, the values are as follows:
     *                                  1 - The bind type is pin code .

     *      "targetPkgName" : "xxxx", - The package name of binding target.
     *      "appName" : "xxxx",       - The app name that try to bind the target.
     *      "appOperation" : "xxxx"   - The reason why the app want to bind the target package.
     *      "customDescription" : "xxxx" - The detail description of the operation.
     * @param { AsyncCallback<{deviceId: string;}> } callback - indicates the callback to be invoked upon bindDevice.
     * @throws { BusinessError } 401 - Parameter error. Possible causes:
     *                                                  1. Mandatory parameters are left unspecified;
     *                                                  2. Incorrect parameter type;
     *                                                  3. Parameter verification failed;
     *                                                  4. The size of specified deviceId is greater than 255.
     * @throws { BusinessError } 201 - Permission verification failed. The application does not have the permission required to call the API.
     * @throws { BusinessError } 11600101 - Failed to execute the function.
     * @throws { BusinessError } 11600103 - Authentication unavailable.
     * @syscap SystemCapability.DistributedHardware.DeviceManager
     */
    @!APILevel[
        19,
        permission: "ohos.permission.DISTRIBUTED_DATASYNC",
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedHardware.DeviceManager"
    ]
    public func bindTarget(deviceId: String, bindParam: HashMap<String, ValueType>): String {
        if (!bindParam.contains("bindType") || bindParam["bindType"] != Integer(1)) {
            throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
        let bindParamJson = parseBindParam(bindParam)
        DEVICE_MANAGER_LOG.info("bindParamJson is ${bindParamJson}")
        var errCode: Int32 = SUCCESS_CODE
        let isMetaType: Bool = match (bindParam.get("metaType")) {
            case Some(Str(s)) => s.size > 0
            case None => false
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
        DEVICE_MANAGER_LOG.info("isMetaType is ${isMetaType}")
        unsafe {
            try (
                cDeviceId = LibC.mallocCString(deviceId).asResource(),
                cBindParamJson = LibC.mallocCString(bindParamJson).asResource()
            ) {
                FfiOHOSDistributedDeviceManagerBindTarget(myDataId, cDeviceId.value, cBindParamJson.value, isMetaType,
                    inout errCode)
            }
        }
        if (errCode != SUCCESS_CODE) {
            if (errCode != ERR_PARAMETER_ERROR && errCode != ERR_NO_PERMISSION && errCode != DISCOVER_UNAVAILABLE &&
                errCode != FAIL_TO_EXEC) {
                errCode = FAIL_TO_EXEC
            }
            throw BusinessException(errCode, getErrorMsg(errCode))
        }
        deviceId
    }

    /**
     * Unbind the specified target.
     *
     * @permission ohos.permission.DISTRIBUTED_DATASYNC
     * @param { String } deviceId - id of device to unbind
     * @throws { BusinessError } 401 - Parameter error. Possible causes:
     *                                                  1. Mandatory parameters are left unspecified;
     *                                                  2. Incorrect parameter type;
     *                                                  3. Parameter verification failed;
     *                                                  4. The size of specified deviceId is greater than 255.
     * @throws { BusinessError } 201 - Permission verification failed. The application does not have the permission required to call the API.
     * @throws { BusinessError } 11600101 - Failed to execute the function.
     * @syscap SystemCapability.DistributedHardware.DeviceManager
     */
    @!APILevel[
        19,
        permission: "ohos.permission.DISTRIBUTED_DATASYNC",
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedHardware.DeviceManager"
    ]
    public func unBindTarget(deviceId: String): Unit {
        var errCode: Int32 = SUCCESS_CODE
        unsafe {
            try (cDeviceId = LibC.mallocCString(deviceId).asResource()) {
                FfiOHOSDistributedDeviceManagerUnbindTarget(myDataId, cDeviceId.value, inout errCode)
            }
        }
        if (errCode != SUCCESS_CODE) {
            throw BusinessException(errCode, getErrorMsg(errCode))
        }
    }

    /**
     * Register a callback function of `type`.
     *
     * @permission ohos.permission.DISTRIBUTED_DATASYNC
     * @param { DeviceStatusType } type - Device state change.
     * @param { CallbackObject } callback. - Indicates the device state callback to register.
     * @throws { BusinessError } 201 - Permission verification failed. The application does not have the permission required to call the API.
     * @throws { BusinessError } 401 - Parameter error. Possible causes:
     *                                                  1. Mandatory parameters are left unspecified;
     *                                                  2. Incorrect parameter type;
     *                                                  3. Parameter verification failed;
     *                                                  4. The size of specified type is greater than 255.
     * @syscap SystemCapability.DistributedHardware.DeviceManager
     */
    @!APILevel[
        19,
        permission: "ohos.permission.DISTRIBUTED_DATASYNC",
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedHardware.DeviceManager"
    ]
    public func on(`type`: DeviceStatusType, callback: CallbackObject): Unit {
        let wrapper = getWrapper(`type`, callback)
        var errCode: Int32 = SUCCESS_CODE
        unsafe {
            try (cType = LibC.mallocCString(`type`.value).asResource()) {
                FfiOHOSDistributedDeviceManagerOn(myDataId, cType.value, wrapper.getID(), inout errCode)
            }
        }
        if (errCode != SUCCESS_CODE) {
            throw BusinessException(errCode, getErrorMsg(errCode))
        }
    }

    /**
     * UnRegister a callback function of `type`.
     *
     * @permission ohos.permission.DISTRIBUTED_DATASYNC
     * @param { DeviceStatusType } type - Device state change.
     * @param { CallbackObject } callback
     * Indicates the device state callback to unregister.
     * @throws { BusinessError } 201 - Permission verification failed. The application does not have the permission required to call the API.
     * @throws { BusinessError } 401 - Parameter error. Possible causes:
     *                                                  1. Mandatory parameters are left unspecified;
     *                                                  2. Incorrect parameter type;
     *                                                  3. Parameter verification failed;
     *                                                  4. The size of specified type is greater than 255.
     * @syscap SystemCapability.DistributedHardware.DeviceManager
     */
    @!APILevel[
        19,
        permission: "ohos.permission.DISTRIBUTED_DATASYNC",
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedHardware.DeviceManager"
    ]
    public func off(`type`: DeviceStatusType, callback: CallbackObject): Unit {
        DEVICE_MANAGER_LOG.info("off in")
        let getParaException = {=> BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))}
        match (`type`) {
            case DEVICE_STATE_CHANGE where refEq(callback, deviceStateChangeCallback.getOrThrow(getParaException)) => deviceStateChangeCallback = None
            case DEVICE_NAME_CHANGE where refEq(callback, deviceNameChangeCallback.getOrThrow(getParaException)) => deviceNameChangeCallback = None
            case DISCOVER_SUCCESS where refEq(callback, discoverSuccessCallback.getOrThrow(getParaException)) => discoverSuccessCallback = None
            case DISCOVER_FAILURE where refEq(callback, discoverFailureCallback.getOrThrow(getParaException)) => discoverFailureCallback = None
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
        var errCode: Int32 = SUCCESS_CODE
        DEVICE_MANAGER_LOG.info("off success")
        unsafe {
            try (cType = LibC.mallocCString(`type`.value).asResource()) {
                FfiOHOSDistributedDeviceManagerOff(myDataId, cType.value, inout errCode)
            }
        }
        if (errCode != SUCCESS_CODE) {
            throw BusinessException(errCode, getErrorMsg(errCode))
        }
    }

    func getExtraInfo(map: HashMap<String, ValueType>): String {
        let jsonMap = HashMap<String, JsonValue>()
        let availableStatus = match (map.get("availableStatus")) {
            case Some(Integer(i)) where i >= 0 && i <= 1 => i
            case None => -1
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
        jsonMap.add("credible", JsonInt(availableStatus))

        let discoverDistance = match (map.get("discoverDistance")) {
            case Some(Integer(i)) where i >= 0 && i <= 100 => i
            case None => -1
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
        jsonMap.add("range", JsonInt(discoverDistance))

        let authenticationStatus = match (map.get("authenticationStatus")) {
            case Some(Integer(i)) where i >= 0 && i <= 1 => i
            case None => -1
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
        jsonMap.add("isTrusted", JsonInt(authenticationStatus))

        let authorizationType = match (map.get("authorizationType")) {
            case Some(Integer(i)) where i >= 0 && i <= 2 => i
            case None => -2
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
        jsonMap.add("authForm", JsonInt(authorizationType))
        jsonMap.add("deviceType", JsonInt(getIntValue(map, "deviceType", default: -1)))
        return JsonObject(jsonMap).toString()
    }

    func parseBindParam(bindParam: HashMap<String, ValueType>): String {
        let jsonMap = HashMap<String, JsonValue>()
        jsonMap.add("authType", JsonInt(getIntValue(bindParam, "bindType")))
        jsonMap.add("appOperation", JsonString(getStringValue(bindParam, "appOperation")))
        jsonMap.add("customDescription", JsonString(getStringValue(bindParam, "customDescription")))
        jsonMap.add("TARGET_PKG_NAME", JsonString(getStringValue(bindParam, "targetPkgName")))
        jsonMap.add("META_TYPE", JsonString(getStringValue(bindParam, "metaType")))
        jsonMap.add("PIN_CODE", JsonString(getStringValue(bindParam, "pinCode")))
        jsonMap.add("AUTH_TOKEN", JsonString(getStringValue(bindParam, "authToken")))
        jsonMap.add("BR_MAC", JsonString(getStringValue(bindParam, "brMac")))
        jsonMap.add("BLE_MAC", JsonString(getStringValue(bindParam, "bleMac")))
        jsonMap.add("WIFI_IP", JsonString(getStringValue(bindParam, "wifiIP")))
        jsonMap.add("WIFI_PORT", JsonInt(getIntValue(bindParam, "wifiPort", default: -1)))
        jsonMap.add("bindLevel", JsonInt(getIntValue(bindParam, "bindLevel", default: 0)))
        return JsonObject(jsonMap).toString()
    }

    func getWrapper(`type`: DeviceStatusType, callback: CallbackObject): BaseCallBack {
        match (`type`) {
            case DEVICE_STATE_CHANGE where callback is Callback2Argument<DeviceStateChange, DeviceBasicInfo> =>
                deviceStateChangeCallback = callback as Callback2Argument<DeviceStateChange, DeviceBasicInfo>
                Callback2Param<Int32, CPointer<CDeviceBasicInfo>, Unit>(
                    {
                        state: Int32, basicInfo: CPointer<CDeviceBasicInfo> => unsafe {
                            deviceStateChangeCallback?.invoke(DeviceStateChange.parse(state),
                                DeviceBasicInfo(basicInfo.read()))
                        }
                    })
            case DEVICE_NAME_CHANGE where callback is Callback1Argument<String> =>
                deviceNameChangeCallback = callback as Callback1Argument<String>
                Callback1Param<CString, Unit>(
                    {
                        deviceName: CString => unsafe { deviceNameChangeCallback?.invoke(deviceName.toString()) }
                    })
            case DISCOVER_SUCCESS where callback is Callback1Argument<DeviceBasicInfo> =>
                discoverSuccessCallback = callback as Callback1Argument<DeviceBasicInfo>
                Callback1Param<CPointer<CDeviceBasicInfo>, Unit>(
                    {
                        basicInfo: CPointer<CDeviceBasicInfo> => unsafe {
                            discoverSuccessCallback?.invoke(DeviceBasicInfo(basicInfo.read()))
                        }
                    })
            case DISCOVER_FAILURE where callback is Callback1Argument<Int32> =>
                discoverFailureCallback = callback as Callback1Argument<Int32>
                Callback1Param<Int32, Unit>({
                    reason: Int32 => unsafe { discoverFailureCallback?.invoke(reason) }
                })
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
    }

    func getStringValue(map: HashMap<String, ValueType>, key: String, default!: String = ""): String {
        match (map.get(key)) {
            case Some(Str(s)) => s
            case None => default
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
    }

    func getIntValue(map: HashMap<String, ValueType>, key: String, default!: Int64 = 0): Int64 {
        match (map.get(key)) {
            case Some(Integer(i)) => i
            case None => default
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
    }

    var deviceStateChangeCallback: ?Callback2Argument<DeviceStateChange, DeviceBasicInfo> = None
    var deviceNameChangeCallback: ?Callback1Argument<String> = None
    var discoverSuccessCallback: ?Callback1Argument<DeviceBasicInfo> = None
    var discoverFailureCallback: ?Callback1Argument<Int32> = None
}
