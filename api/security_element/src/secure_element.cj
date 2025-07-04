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

package ohos.security_element

import std.collection.*
import ohos.base.*
import ohos.ffi.*
import std.deriving.*
import ohos.labels.*

@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.SecureElement"
]
public enum ServiceState {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.SecureElement"
    ]
    DISCONNECTED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.SecureElement"
    ]
    CONNECTED
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case DISCONNECTED => 0i32
                case CONNECTED => 1i32
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(state: Int32): ServiceState {
        match (state) {
            case 0i32 => DISCONNECTED
            case 1i32 => CONNECTED
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.SecureElement"
]
public func createService(): SEService {
    var errorCode = SUCCESS_CODE
    let id: Int64
    unsafe { id = FfiSECreateService(inout errorCode) }
    if (errorCode != SUCCESS_CODE) {
        throw BusinessException(errorCode, "Create Service failed")
    }
    SEService(id)
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.SecureElement"
]
public class SEService <: RemoteDataLite {
    init(instanceId: Int64) {
        super(instanceId)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.SecureElement"
    ]
    public func getReaders(): Array<Reader> {
        var errorCode = SUCCESS_CODE
        let ids: CArrI64
        let readers: Array<Reader>
        unsafe {
            ids = FfiSESESGetReaders(getID(), inout errorCode)
            if (errorCode != SUCCESS_CODE) {
                LibC.free<Int64>(ids.head)
                throw BusinessException(errorCode, "[SEService] getReaders:")
            }
            readers = cArr2cjArr<Int64, Reader>(ids.size, ids.head, {i => Reader(i)})
            LibC.free<Int64>(ids.head)
        }
        readers
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.SecureElement"
    ]
    public func isConnected(): Bool {
        var errorCode = SUCCESS_CODE
        let res: Bool
        unsafe { res = FfiSESESIsConnected(getID(), inout errorCode) }
        checkRet(errorCode, "[SEService] isConntected:")
        res
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.SecureElement"
    ]
    public func shutdown(): Unit {
        var errorCode = SUCCESS_CODE
        unsafe { FfiSESESShutdown(getID(), inout errorCode) }
        checkRet(errorCode, "[SEService] shutdown:")
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.SecureElement"
    ]
    public func getVersion(): String {
        var errorCode = SUCCESS_CODE
        let cVer: CString
        let version: String
        unsafe {
            cVer = FfiSESESGetVersion(getID(), inout errorCode)
            if (errorCode != SUCCESS_CODE) {
                LibC.free(cVer)
                throw BusinessException(errorCode, "[SEService] getVersion:")
            }
            if (cVer.isNotEmpty()) {
                version = cVer.toString()
                LibC.free(cVer)
            } else {
                version = ""
            }
        }
        version
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.SecureElement"
]
public class Reader <: RemoteDataLite {
    init(instanceId: Int64) {
        super(instanceId)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.SecureElement"
    ]
    public func getName(): String {
        var errorCode = SUCCESS_CODE
        let cName: CString
        let name: String
        unsafe {
            cName = FfiSEReaderGetName(getID(), inout errorCode)
            if (errorCode != SUCCESS_CODE) {
                LibC.free(cName)
                throw BusinessException(errorCode, "[Reader] getName:")
            }
            name = cName.toString()
            LibC.free(cName)
        }
        name
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.SecureElement"
    ]
    public func isSecureElementPresent(): Bool {
        var errorCode = SUCCESS_CODE
        let res: Bool
        unsafe { res = FfiSEReaderIsSecureElementPresent(getID(), inout errorCode) }
        checkRet(errorCode, "[Reader] isSecureElementPresent:")
        res
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.SecureElement"
    ]
    public func openSession(): Session {
        var errorCode = SUCCESS_CODE
        let id: Int64
        unsafe {
            id = FfiSEReaderOpenSession(getID(), inout errorCode)
            checkRet(errorCode, "[Reader] openSession:")
        }
        Session(id)
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.SecureElement"
    ]
    public func closeSessions(): Unit {
        var errorCode = SUCCESS_CODE
        unsafe { FfiSEReaderCloseSessions(getID(), inout errorCode) }
        checkRet(errorCode, "[Reader] closeSessions:")
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.SecureElement"
]
public class Channel <: RemoteDataLite {
    init(instanceId: Int64) {
        super(instanceId)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.SecureElement"
    ]
    public func getSession(): Session {
        var errorCode = SUCCESS_CODE
        let id: Int64
        unsafe {
            id = FfiSEChannelGetSession(getID(), inout errorCode)
            checkRet(errorCode, "[Channel] getSession:")
        }
        Session(id)
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.SecureElement"
    ]
    public func close(): Unit {
        var errorCode = SUCCESS_CODE
        unsafe { FfiSEChannelClose(getID(), inout errorCode) }
        checkRet(errorCode, "[Channel] close:")
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.SecureElement"
    ]
    public func isClosed(): Bool {
        var errorCode = SUCCESS_CODE
        let res: Bool
        unsafe { res = FfiSEChannelIsClosed(getID(), inout errorCode) }
        checkRet(errorCode, "[Channel] isClosed:")
        res
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.SecureElement"
    ]
    public func isBasicChannel(): Bool {
        var errorCode = SUCCESS_CODE
        let res: Bool
        unsafe { res = FfiSEChannelIsBasicChannel(getID(), inout errorCode) }
        checkRet(errorCode, "[Channel] isBasicChannel:")
        res
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.SecureElement"
    ]
    public func getSelectResponse(): Array<Int32> {
        var errorCode = SUCCESS_CODE
        let cArr: CArrI32
        let arr: Array<Int32>
        unsafe {
            cArr = FfiSEChannelGetSelectResponse(getID(), inout errorCode)
            if (errorCode != SUCCESS_CODE) {
                LibC.free<Int32>(cArr.head)
                throw BusinessException(errorCode, "[Channel] getSelectResponse:")
            }
            arr = cArr2cjArr<Int32, Int32>(cArr.size, cArr.head, {i => i})
            LibC.free<Int32>(cArr.head)
        }
        arr
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.SecureElement"
    ]
    public func transmit(command: Array<Int32>): Array<Int32> {
        var errorCode = SUCCESS_CODE
        let cArr: CArrI32
        let arr: Array<Int32>
        unsafe {
            let ptr = cjArr2CArr<Int32, Int32>(command, {i => i})
            cArr = FfiSEChannelTransmit(getID(), CArrI32(ptr, command.size), inout errorCode)
            LibC.free(ptr)
            if (errorCode != SUCCESS_CODE) {
                LibC.free<Int32>(cArr.head)
                throw BusinessException(errorCode, "[Channel] transmit:")
            }
            arr = cArr2cjArr<Int32, Int32>(cArr.size, cArr.head, {i => i})
            LibC.free<Int32>(cArr.head)
        }
        arr
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.SecureElement"
]
public class Session <: RemoteDataLite {
    init(instanceId: Int64) {
        super(instanceId)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.SecureElement"
    ]
    public func getReader(): Reader {
        var errorCode = SUCCESS_CODE
        let id: Int64
        unsafe {
            id = FfiSESessionGetReader(getID(), inout errorCode)
            checkRet(errorCode, "[Session] getReader:")
        }
        Reader(id)
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.SecureElement"
    ]
    public func getATR(): Array<Int32> {
        var errorCode = SUCCESS_CODE
        let cArr: CArrI32
        let arr: Array<Int32>
        unsafe {
            cArr = FfiSESessionGetATR(getID(), inout errorCode)
            if (errorCode != SUCCESS_CODE) {
                LibC.free<Int32>(cArr.head)
                throw BusinessException(errorCode, "[Session] getATR:")
            }
            arr = cArr2cjArr<Int32, Int32>(cArr.size, cArr.head, {i => i})
            LibC.free<Int32>(cArr.head)
        }
        arr
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.SecureElement"
    ]
    public func close(): Unit {
        var errorCode = SUCCESS_CODE
        unsafe { FfiSESessionClose(getID(), inout errorCode) }
        checkRet(errorCode, "[Session] close:")
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.SecureElement"
    ]
    public func isClosed(): Bool {
        var errorCode = SUCCESS_CODE
        let res: Bool
        unsafe { res = FfiSESessionIsClosed(getID(), inout errorCode) }
        checkRet(errorCode, "[Session] isClosed:")
        res
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.SecureElement"
    ]
    public func closeChannels(): Unit {
        var errorCode = SUCCESS_CODE
        unsafe { FfiSESessionCloseChannels(getID(), inout errorCode) }
        checkRet(errorCode, "[Session] closeChannels:")
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.SecureElement"
    ]
    public func openBasicChannel(aid: Array<Int32>): Channel {
        var errorCode = SUCCESS_CODE
        let id: Int64
        unsafe {
            let ptr = cjArr2CArr<Int32, Int32>(aid, {i => i})
            id = FfiSESessionOpenBasicChannel(getID(), CArrI32(ptr, aid.size), inout errorCode)
            LibC.free(ptr)
            checkRet(errorCode, "[Session] openBasicChannel:")
        }
        Channel(id)
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.SecureElement"
    ]
    public func openBasicChannel(aid: Array<Int32>, p2: Int32): Channel {
        var errorCode = SUCCESS_CODE
        let id: Int64
        unsafe {
            let ptr = cjArr2CArr<Int32, Int32>(aid, {i => i})
            id = FfiSESessionOpenBasicChannelWithP2(getID(), CArrI32(ptr, aid.size), p2, inout errorCode)
            LibC.free(ptr)
            checkRet(errorCode, "[Session] openBasicChannel:")
        }
        Channel(id)
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.SecureElement"
    ]
    public func openLogicalChannel(aid: Array<Int32>): Channel {
        var errorCode = SUCCESS_CODE
        let id: Int64
        unsafe {
            let ptr = cjArr2CArr<Int32, Int32>(aid, {i => i})
            id = FfiSESessionOpenLogicalChannel(getID(), CArrI32(ptr, aid.size), inout errorCode)
            LibC.free(ptr)
            checkRet(errorCode, "[Session] openLogicalChannel:")
        }
        Channel(id)
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.SecureElement"
    ]
    public func openLogicalChannel(aid: Array<Int32>, p2: Int32): Channel {
        var errorCode = SUCCESS_CODE
        let id: Int64
        unsafe {
            let ptr = cjArr2CArr<Int32, Int32>(aid, {i => i})
            id = FfiSESessionOpenLogicalChannelWithP2(getID(), CArrI32(ptr, aid.size), p2, inout errorCode)
            LibC.free(ptr)
            checkRet(errorCode, "[Session] openLogicalChannel:")
        }
        Channel(id)
    }
}
