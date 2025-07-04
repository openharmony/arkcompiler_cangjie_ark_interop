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

package ohos.bluetooth.socket

import ohos.bluetooth.*
import std.deriving.Derive
import ohos.base.{BusinessException, CallbackObject, Callback1Argument}
import ohos.ffi.{SUCCESS_CODE, CArrUI8, cArr2cjArr, Callback1Param}
import ohos.bluetooth.{getErrorMsg, BLUETOOTH_LOG}
import std.collection.ArrayList
import ohos.labels.APILevel

foreign {
    func FfiBluetoothSocketSppListen(name: CString, options: CSppOptions, errCode: CPointer<Int32>): Int32

    func FfiBluetoothSocketSppAccept(serverSocket: Int32, errCode: CPointer<Int32>): Int32

    func FfiBluetoothSocketSppConnect(deviceId: CString, options: CSppOptions, errCode: CPointer<Int32>): Int32

    func FfiBluetoothSocketGetDeviceId(clientSocket: Int32, errCode: CPointer<Int32>): CString

    func FfiBluetoothSocketSppCloseServerSocket(socket: Int32, errCode: CPointer<Int32>): Unit

    func FfiBluetoothSocketSppCloseClientSocket(socket: Int32, errCode: CPointer<Int32>): Unit

    func FfiBluetoothSocketSppWrite(clientSocket: Int32, data: CArrUI8, errCode: CPointer<Int32>): Unit

    func FfiBluetoothSocketOn(sppType: CString, clientSocket: Int32, cbId: Int64, errCode: CPointer<Int32>): Unit

    func FfiBluetoothSocketOff(sppType: CString, clientSocket: Int32, cbId: Int64, errCode: CPointer<Int32>): Unit
}

/**
 * The enum of SPP type.
 *
 * @relation enum SppType
 */
@Derive[ToString, Equatable]
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum SppType {
    /**
     * RFCOMM
     *
     * @relation SPP_RFCOMM
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    SppRfcomm
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case SppRfcomm => 0
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}

/**
 * The enum of tCallback type.
 *
 */
@Derive[Equatable]
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum BluetoothSocketCallbackType <: ToString {
    /**
     * Type of the spp read event to listen for.
     *
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    SppRead
    | ...

    /**
     * Return string.
     *
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func toString(): String {
        match (this) {
            case SppRead => "sppRead"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@C
struct CSppOptions {
    let uuid: CString
    let secure: Bool
    let sppType: Int32

    init(options: SppOptions) {
        this.uuid = unsafe { LibC.mallocCString(options.uuid) }
        this.secure = options.secure
        this.sppType = options.sppType.value
    }

    func free(): Unit {
        unsafe { LibC.free(uuid) }
    }
}

/**
 * Describes the spp parameters.
 *
 * @relation interface SppOptions
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class SppOptions {
    /**
     * Indicates the UUID in the SDP record.
     *
     * @relation uuid: string;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var uuid: String
    /**
     * Indicates secure channel or not.
     *
     * @relation secure: boolean;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var secure: Bool
    /**
     * Spp link type.
     *
     * @relation type: SppType;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var sppType: SppType

    /**
     * Constructor of SppOptions.
     *
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public SppOptions(uuid: String, secure: Bool, sppType: SppType) {
        this.uuid = uuid
        this.secure = secure
        this.sppType = sppType
    }
}

/**
 * Creates a Bluetooth server listening socket.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @param { String } name - Indicates the service name.
 * @param { SppOptions } options - Indicates the listen parameters.
 * @return { Int32 } callback - Return a server socket ID.
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { IllegalArgumentException } - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
 * <br>2. Incorrect parameter types. 3. Parameter verification failed.
 * @throws { BusinessException } 801 - Capability not supported.
 * @throws { BusinessException } 2900001 - Service stopped.
 * @throws { BusinessException } 2900003 - Bluetooth disabled.
 * @throws { BusinessException } 2900004 - Profile not supported.
 * @throws { BusinessException } 2900099 - Operation failed.
 * relation sppListen(name: string, options: SppOptions, callback: AsyncCallback<number>): void;
 */
@!APILevel[
    20,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func sppListen(name: String, options: SppOptions): Int32 {
    let cOption = CSppOptions(options)
    let cName = try {
        unsafe { LibC.mallocCString(name) }
    } catch (e: Exception) {
        cOption.free()
        throw e
    }
    var errCode: Int32 = 0
    let fd = unsafe { FfiBluetoothSocketSppListen(cName, cOption, inout errCode) }
    unsafe { LibC.free(cName) }
    cOption.free()
    checkRet(errCode)
    return fd
}

/**
 * Waits for a remote device to connect.
 *
 * @param { Int32 } serverSocket - Indicates the server socket ID, returned by {@link sppListen}.
 * @param { (?BusinessException, ?Int32) -> Unit) } callback - Callback used to return a client socket ID.
 * <br>2. Incorrect parameter types. 3. Parameter verification failed.
 * @throws { BusinessException } 801 - Capability not supported.
 * @throws { BusinessException } 2900001 - Service stopped.
 * @throws { BusinessException } 2900003 - Bluetooth disabled.
 * @throws { BusinessException } 2900004 - Profile not supported.
 * @throws { BusinessException } 2900099 - Operation failed.
 * relation sppAccept(serverSocket: number, callback: AsyncCallback<number>): void;
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func sppAccept(serverSocket: Int32, callback: (?BusinessException, ?Int32) -> Unit): Unit {
    spawn {
        var errCode: Int32 = 0
        let fd = unsafe { FfiBluetoothSocketSppAccept(serverSocket, inout errCode) }
        if (errCode != SUCCESS_CODE) {
            callback(BusinessException(errCode, getErrorMsg(errCode)), None)
        }
        callback(None, fd)
    }
}

/**
 * Connects to a remote device over the socket.
 *
 * @permission ohos.permission.ACCESS_BLUETOOTH
 * @param { String } deviceId - Indicates device ID. For example, "11:22:33:AA:BB:FF".
 * @param { SppOptions } options - Indicates the connect parameters {@link SppOptions}.
 * @param { (?BusinessException, ?Int32) -> Unit) } callback - Callback used to return a client socket ID.
 * @throws { BusinessException } 201 - Permission denied.
 * <br>2. Incorrect parameter types. 3. Parameter verification failed.
 * @throws { BusinessException } 801 - Capability not supported.
 * @throws { BusinessException } 2900001 - Service stopped.
 * @throws { BusinessException } 2900003 - Bluetooth disabled.
 * @throws { BusinessException } 2900004 - Profile not supported.
 * @throws { BusinessException } 2900099 - Operation failed.
 * relation sppConnect(deviceId: string, options: SppOptions, callback: AsyncCallback<number>): void;
 */
@!APILevel[
    20,
    permission: "ohos.ACCESS_BLUETOOTH",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func sppConnect(deviceId: String, options: SppOptions, callback: (?BusinessException, ?Int32) -> Unit): Unit {
    spawn {
        unsafe {
            let cOption = CSppOptions(options)
            let cDeviceId = try {
                LibC.mallocCString(deviceId)
            } catch (e: Exception) {
                cOption.free()
                throw e
            }
            var errCode: Int32 = 0
            let fd = FfiBluetoothSocketSppConnect(cDeviceId, cOption, inout errCode)
            LibC.free(cDeviceId)
            cOption.free()
            if (errCode != SUCCESS_CODE) {
                callback(BusinessException(errCode, getErrorMsg(errCode)), None)
            }
            callback(None, fd)
        }
    }
}

/**
 * Obtain the device id in the client socket.
 *
 * @param { Int32 } clientSocket - Indicates client socket.
 * @returns { String } Returns the connected device id
 * @throws { IllegalArgumentException } - Parameter error. Possible causes:
 * 1. Mandatory parameters are left unspecified;
 * 2. Incorrect parameter types;
 * 3. Parameter verification failed.
 * relation getDeviceId(clientSocket: number): string;
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func getDeviceId(clientSocket: Int32): String {
    var errCode: Int32 = 0
    let cDeviceId = unsafe { FfiBluetoothSocketGetDeviceId(clientSocket, inout errCode) }
    checkRet(errCode)
    let deviceId = cDeviceId.toString()
    unsafe { LibC.free(cDeviceId) }
    return deviceId
}

/**
 * Disables an spp server socket and releases related resources.
 *
 * @param { Int32 } socket - Indicates the server socket ID, returned by {@link sppListen}.
 * @throws { IllegalArgumentException } - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
 * <br>2. Incorrect parameter types.
 * @throws { BusinessException } 801 - Capability not supported.
 * @throws { BusinessException } 2900001 - Service stopped.
 * @throws { BusinessException } 2900099 - Operation failed.
 * relation sppCloseServerSocket(socket: number): void;
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func sppCloseServerSocket(socket: Int32): Unit {
    var errCode: Int32 = 0
    unsafe { FfiBluetoothSocketSppCloseServerSocket(socket, inout errCode) }
    checkRet(errCode)
}

/**
 * Disables an spp client socket and releases related resources.
 *
 * @param { Int32 } socket - Indicates the client socket ID, returned by {@link sppAccept} or {@link sppConnect}.
 * @throws { IllegalArgumentException } - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
 * <br>2. Incorrect parameter types.
 * @throws { BusinessException } 801 - Capability not supported.
 * @throws { BusinessException } 2900001 - Service stopped.
 * @throws { BusinessException } 2900099 - Operation failed.
 * relation sppCloseClientSocket(socket: number): void;
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func sppCloseClientSocket(socket: Int32): Unit {
    var errCode: Int32 = 0
    unsafe { FfiBluetoothSocketSppCloseClientSocket(socket, inout errCode) }
    checkRet(errCode)
}

/**
 * Write data through the socket.
 *
 * @param { Int32 } clientSocket - Indicates the client socket ID, returned by {@link sppAccept} or {@link sppConnect}.
 * @param { Array<UInt8> } data - Indicates the data to write.
 * @throws { IllegalArgumentException } - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
 * <br>2. Incorrect parameter types.
 * @throws { BusinessException } 801 - Capability not supported.
 * @throws { BusinessException } 2901054 - IO error.
 * @throws { BusinessException } 2900099 - Operation failed.
 * relation sppWrite(clientSocket: number, data: ArrayBuffer): void;
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func sppWrite(clientSocket: Int32, data: Array<UInt8>): Unit {
    var errCode: Int32 = 0
    unsafe {
        let arrPtr = acquireArrayRawData(data)
        FfiBluetoothSocketSppWrite(clientSocket, CArrUI8(arrPtr.pointer, data.size), inout errCode)
        releaseArrayRawData(arrPtr)
    }
    checkRet(errCode)
}

private var registerState = false
private let CALLBACK_LIST = ArrayList<CallbackObject>()

private func argWrapper1<CT, T>(ctor: (CT) -> T): Int64 where CT <: CType {
    let wrapper = {
        ctype: CT =>
        let cjType = ctor(ctype)
        for (caller in CALLBACK_LIST) {
            (caller as Callback1Argument<T>)?.invoke(cjType)
        }
    }
    let registerCall = Callback1Param<CT, Unit>(wrapper)
    registerCall.getID()
}

/**
 * Subscribe the event reported when data is read from the socket.
 *
 * @param { BluetoothSocketCallbackType } type - Type of the spp read event to listen for.
 * @param { Int32 } clientSocket - Client socket ID, which is obtained by sppAccept or sppConnect.
 * @param { Callback1Argument<Array<Byte>> } callback - Callback used to listen for the spp read event.
 * @throws { IllegalArgumentException } - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
 * <br>2. Incorrect parameter types.
 * @throws { BusinessException } 801 - Capability not supported.
 * @throws { BusinessException } 2901054 - IO error.
 * @throws { BusinessException } 2900099 - Operation failed.
 * relation on(type: 'sppRead', clientSocket: number, callback: Callback<ArrayBuffer>): void;
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func on(`type`: BluetoothSocketCallbackType, clientSocket: Int32, callback: Callback1Argument<Array<Byte>>): Unit {
    if (!registerState) {
        var errorCode: Int32 = 0
        let id = argWrapper1({param: CArrUI8 => unsafe { cArr2cjArr(param.size, param.head, {i => UInt8(i)}) }})
        unsafe {
            let cType = LibC.mallocCString(`type`.toString())
            FfiBluetoothSocketOn(cType, clientSocket, id, inout errorCode)
            LibC.free(cType)
        }
        checkRet(errorCode)
        registerState = true
    } else {
        for (idx in 0..CALLBACK_LIST.size) {
            if (refEq(callback, CALLBACK_LIST[idx])) {
                BLUETOOTH_LOG.info("The sppOn callback is registered, no need to re-registered")
                return
            }
        }
    }
    CALLBACK_LIST.add(callback)
    return
}

/**
 * Unsubscribe the event reported when data is read from the socket.
 *
 * @param { BluetoothSocketCallbackType } type - Type of the spp read event to listen for.
 * @param { Int32 } clientSocket - Client socket ID, which is obtained by sppAccept or sppConnect.
 * @param { ?CallbackObject } callback - Callback used to listen for the spp read event.
 * @throws { IllegalArgumentException } - Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.
 * <br>2. Incorrect parameter types.
 * @throws { BusinessException } 801 - Capability not supported.
 * relation off(type: 'sppRead', clientSocket: number, callback?: Callback<ArrayBuffer>): void;
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func off(`type`: BluetoothSocketCallbackType, clientSocket: Int32, callback!: ?CallbackObject = None): Unit {
    var errorCode: Int32 = 0
    match (callback) {
        case Some(v) => errorCode = removeCallback(`type`, clientSocket, v)
        case None =>
            unsafe {
                let cType = LibC.mallocCString(`type`.toString())
                FfiBluetoothSocketOff(cType, clientSocket, 0, inout errorCode)
                LibC.free(cType)
            }
            CALLBACK_LIST.clear()
    }
    checkRet(errorCode)
}

func removeCallback(`type`: BluetoothSocketCallbackType, clientSocket: Int32, callback: CallbackObject): Int32 {
    var errorCode: Int32 = 0
    for (idx in 0..CALLBACK_LIST.size) {
        if (refEq(callback, CALLBACK_LIST[idx])) {
            unsafe {
                let cType = LibC.mallocCString(`type`.toString())
                FfiBluetoothSocketOff(cType, clientSocket, 0, inout errorCode)
                LibC.free(cType)
            }
            CALLBACK_LIST.remove(at: idx)
        }
    }
    return errorCode
}
