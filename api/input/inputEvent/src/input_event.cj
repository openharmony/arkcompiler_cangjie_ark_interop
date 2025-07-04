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

package ohos.multimodalInput.inputEvent

import ohos.ark_interop.*
import ohos.ark_interop_helper.*
import std.deriving.*
import ohos.labels.*

/**
 * InputEvent
 *
 * @typedef InputEvent
 * @syscap SystemCapability.MultimodalInput.Input.Core
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.MultimodalInput.Input.Core"
]
public open class InputEvent {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    public InputEvent(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.MultimodalInput.Input.Core"
        ]
        public var id: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.MultimodalInput.Input.Core"
        ]
        public var deviceId: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.MultimodalInput.Input.Core"
        ]
        public var actionTime: Int64,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.MultimodalInput.Input.Core"
        ]
        public var screenId: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.MultimodalInput.Input.Core"
        ]
        public var windowId: Int32
    ) {}

    protected init(cInputEvent: CInputEvent) {
        this.id = cInputEvent.id
        this.deviceId = cInputEvent.deviceId
        this.actionTime = cInputEvent.actionTime
        this.screenId = cInputEvent.screenId
        this.windowId = cInputEvent.windowId
    }
}

@C
protected struct CInputEvent {
    protected CInputEvent(
        protected let id: Int32,
        protected let deviceId: Int32,
        protected let actionTime: Int64,
        protected let screenId: Int32,
        protected let windowId: Int32
    ) {}

    protected init(inputEvent: InputEvent) {
        this(inputEvent.id, inputEvent.deviceId, inputEvent.actionTime, inputEvent.screenId, inputEvent.windowId)
    }
}
