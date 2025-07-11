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

const MAX_WAIT_TIME: Int32 = 3000

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.IPC.Core"
]
public class MessageOption {
    private var _flags: UInt32
    private var _waitTime: Int32

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const TF_SYNC: Int32 = 0x00
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const TF_ASYNC: Int32 = 0x01
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const TF_ACCEPT_FDS: Int32 = 0x10
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const TF_WAIT_TIME: Int32 = 0x8

    init(flags: Int32, waitTime: Int32) {
        this._flags = UInt32(flags)
        this._waitTime = waitTime
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public init(async!: Bool = false, waitTime!: Int32 = MessageOption.TF_WAIT_TIME) {
        this._flags = if (async) {
            UInt32(MessageOption.TF_ASYNC)
        } else {
            UInt32(MessageOption.TF_SYNC)
        }
        this._waitTime = waitTime
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func isAsync(): Bool {
        return _flags != 0
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func setAsync(async: Bool): Unit {
        let flag: UInt32 = if (async) {
            1
        } else {
            0
        }
        _flags |= flag
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func getFlags(): Int32 {
        return Int32(_flags)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func setFlags(flags: Int32): Unit {
        _flags = _flags | UInt32(flags)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func getWaitTime(): Int32 {
        return _waitTime
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func setWaitTime(waitTime: Int32): Unit {
        if (waitTime <= 0) {
            _waitTime = MessageOption.TF_WAIT_TIME
        } else if (waitTime > MAX_WAIT_TIME) {
            _waitTime = MAX_WAIT_TIME
        } else {
            _waitTime = waitTime
        }
    }
}
