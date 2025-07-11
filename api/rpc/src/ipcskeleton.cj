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

package ohos.rpc

import ohos.labels.*
import ohos.ffi.*

const REMOTE_OBJECT: Int32 = 0
const REMOTE_PROXY: Int32 = 1

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.IPC.Core"
]
public class IPCSkeleton {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static func getContextObject(): IRemoteObject {
        let res = unsafe { FfiRpcIPCSkeletonGetContextObject() }
        if (res.data == 0) {
            throw IllegalArgumentException("could not get iRemoteObject")
        }
        if (res.code == REMOTE_OBJECT) {
            return RemoteObject(res.data)
        } else if (res.code == REMOTE_PROXY) {
            return RemoteProxy(res.data)
        } else {
            throw IllegalArgumentException("Unreachable branch")
        }
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static func getCallingPid(): Int32 {
        return unsafe { FfiRpcIPCSkeletonGetCallingPid() }
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static func getCallingUid(): Int32 {
        return unsafe { FfiRpcIPCSkeletonGetCallingUid() }
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static func getCallingTokenId(): UInt32 {
        return unsafe { FfiRpcIPCSkeletonGetCallingTokenId() }
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static func getCallingDeviceID(): String {
        let stringValue = unsafe { FfiRpcIPCSkeletonGetCallingDeviceID() }
        let id = stringValue.toString()
        unsafe { LibC.free(stringValue) }
        return id
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static func getLocalDeviceID(): String {
        let stringValue = unsafe { FfiRpcIPCSkeletonGetLocalDeviceID() }
        let id = stringValue.toString()
        unsafe { LibC.free(stringValue) }
        return id
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static func isLocalCalling(): Bool {
        return unsafe { FfiRpcIPCSkeletonIsLocalCalling() }
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static func flushCmdBuffer(object: IRemoteObject): Unit {
        match (object) {
            case v: RemoteObject => unsafe { FfiRpcIPCSkeletonFlushCmdBuffer(v.getID()) }
            case v: RemoteProxy => unsafe { FfiRpcIPCSkeletonFlushCmdBuffer(v.getID()) }
            case _ => ()
        }
    }
}
