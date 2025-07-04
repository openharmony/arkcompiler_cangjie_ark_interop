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

package ohos.multimodalInput.keyEvent

import ohos.ark_interop.*
import ohos.ark_interop_helper.*
import std.deriving.*
import ohos.base.*
import ohos.ffi.*
import ohos.multimodalInput.inputEvent.*
import ohos.multimodalInput.keyCode.*
import ohos.labels.*

/**
 * Action
 *
 * @enum { Int32 }
 * @syscap SystemCapability.MultimodalInput.Input.Core
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.MultimodalInput.Input.Core"
]
public enum Action {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    CANCEL
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    DOWN
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    UP
    | ...

    func get(): Int32 {
        match (this) {
            case CANCEL => 0
            case DOWN => 1
            case UP => 2
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    static func parse(val: Int32): Action {
        match (val) {
            case 0 => CANCEL
            case 1 => DOWN
            case 2 => UP
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    static func tryParse(val: ?Int32): ?Action {
        match (val) {
            case Some(v) => parse(v)
            case None => None
        }
    }
}

/**
 * Key
 *
 * @typedef Key
 * @syscap SystemCapability.MultimodalInput.Input.Core
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.MultimodalInput.Input.Core"
]
public class Key {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    public Key(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.MultimodalInput.Input.Core"
        ]
        public var code: KeyCode,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.MultimodalInput.Input.Core"
        ]
        public var pressedTime: Int64,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.MultimodalInput.Input.Core"
        ]
        public var deviceId: Int32
    ) {}

    protected init(cKey: CKey) {
        this.code = KeyCode.parse(cKey.code)
        this.pressedTime = cKey.pressedTime
        this.deviceId = cKey.deviceId
    }
}

/**
 * KeyEvent
 *
 * @typedef KeyEvent
 * @syscap SystemCapability.MultimodalInput.Input.Core
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.MultimodalInput.Input.Core"
]
public class KeyEvent <: InputEvent {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    public var action: Action
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    public var key: Key
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    public var unicodeChar: UInt32
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    public var keys: Array<Key>
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    public var ctrlKey: Bool
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    public var altKey: Bool
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    public var shiftKey: Bool
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    public var logoKey: Bool
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    public var fnKey: Bool
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    public var capsLock: Bool
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    public var numLock: Bool
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    public var scrollLock: Bool

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    public init(
        base: InputEvent,
        action: Action,
        key: Key,
        unicodeChar: UInt32,
        keys: Array<Key>,
        ctrlKey: Bool,
        altKey: Bool,
        shiftKey: Bool,
        logoKey: Bool,
        fnKey: Bool,
        capsLock: Bool,
        numLock: Bool,
        scrollLock: Bool
    ) {
        super(base.id, base.deviceId, base.actionTime, base.screenId, base.windowId)
        this.action = action
        this.key = key
        this.unicodeChar = unicodeChar
        this.keys = keys
        this.ctrlKey = ctrlKey
        this.altKey = altKey
        this.shiftKey = shiftKey
        this.logoKey = logoKey
        this.fnKey = fnKey
        this.capsLock = capsLock
        this.numLock = numLock
        this.scrollLock = scrollLock
    }
}

@C
protected struct CKey {
    protected CKey(
        protected let code: Int32,
        protected let pressedTime: Int64,
        protected let deviceId: Int32
    ) {}

    protected init(key: Key) {
        this(key.code.get(), key.pressedTime, key.deviceId)
    }
}

@C
protected struct CKeyEvent {
    protected CKeyEvent(
        protected let base: CInputEvent,
        protected let action: Int32,
        protected let key: CKey,
        protected let unicodeChar: UInt32,
        protected var keys: CPointer<CKey>,
        protected var keysLength: Int64,
        protected let ctrlKey: Bool,
        protected let altKey: Bool,
        protected let shiftKey: Bool,
        protected let logoKey: Bool,
        protected let fnKey: Bool,
        protected let capsLock: Bool,
        protected let numLock: Bool,
        protected let scrollLock: Bool
    ) {}

    protected init(keyEvent: KeyEvent) {
        let cKeys: CPointer<CKey> = unsafe {
            if (keyEvent.keys.size == 0) {
                CPointer<CKey>()
            } else {
                safeMalloc<CKey>(count: keyEvent.keys.size)
            }
        }
        for (index in 0..keyEvent.keys.size) {
            unsafe { cKeys.write(index, CKey(keyEvent.keys[index])) }
        }
        this.base = CInputEvent(keyEvent.id, keyEvent.deviceId, keyEvent.actionTime, keyEvent.screenId,
            keyEvent.windowId)
        this.action = keyEvent.action.get()
        this.key = CKey(keyEvent.key)
        this.unicodeChar = keyEvent.unicodeChar
        this.keys = cKeys
        this.keysLength = keyEvent.keys.size
        this.ctrlKey = keyEvent.ctrlKey
        this.altKey = keyEvent.altKey
        this.shiftKey = keyEvent.shiftKey
        this.logoKey = keyEvent.logoKey
        this.fnKey = keyEvent.fnKey
        this.capsLock = keyEvent.capsLock
        this.numLock = keyEvent.numLock
        this.scrollLock = keyEvent.scrollLock
    }

    protected func getCJObject(): KeyEvent {
        KeyEvent(InputEvent(base), Action.parse(action), Key(key), unicodeChar,
            unsafe { Array<Key>(keysLength, {index => Key((keys + index).read())}) }, ctrlKey, altKey, shiftKey, logoKey,
            fnKey, capsLock, numLock, scrollLock)
    }

    protected mut unsafe func free(): Unit {
        LibC.free<CKey>(keys)
        keys = CPointer<CKey>()
        keysLength = 0
    }
}
