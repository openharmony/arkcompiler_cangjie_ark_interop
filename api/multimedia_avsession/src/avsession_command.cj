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

package ohos.multimedia_avsession

import std.deriving.*
import std.collection.*
import ohos.multimedia_media.*
import ohos.labels.*

@Derive[ToString, Equatable, Hashable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.AVCast"
]
public enum AVCastControlCommandType {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    CAST_CONTROL_CMD_INVALID
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    CAST_CONTROL_CMD_PLAY
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    CAST_CONTROL_CMD_PAUSE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    CAST_CONTROL_CMD_STOP
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    CAST_CONTROL_CMD_PLAY_NEXT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    CAST_CONTROL_CMD_PLAY_PREVIOUS
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    CAST_CONTROL_CMD_FAST_FORWARD
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    CAST_CONTROL_CMD_REWIND
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    CAST_CONTROL_CMD_SEEK
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    CAST_CONTROL_CMD_SET_VOLUME
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    CAST_CONTROL_CMD_SET_SPEED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    CAST_CONTROL_CMD_SET_LOOP_MODE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    CAST_CONTROL_CMD_TOGGLE_FAVORITE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    CAST_CONTROL_CMD_TOGGLE_MUTE
    | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case CAST_CONTROL_CMD_INVALID => -1
                case CAST_CONTROL_CMD_PLAY => 0
                case CAST_CONTROL_CMD_PAUSE => 1
                case CAST_CONTROL_CMD_STOP => 2
                case CAST_CONTROL_CMD_PLAY_NEXT => 3
                case CAST_CONTROL_CMD_PLAY_PREVIOUS => 4
                case CAST_CONTROL_CMD_FAST_FORWARD => 5
                case CAST_CONTROL_CMD_REWIND => 6
                case CAST_CONTROL_CMD_SEEK => 7
                case CAST_CONTROL_CMD_SET_VOLUME => 8
                case CAST_CONTROL_CMD_SET_SPEED => 9
                case CAST_CONTROL_CMD_SET_LOOP_MODE => 10
                case CAST_CONTROL_CMD_TOGGLE_FAVORITE => 11
                case CAST_CONTROL_CMD_TOGGLE_MUTE => 12
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    protected static func parse(value: Int32): AVCastControlCommandType {
        match (value) {
            case 0 => CAST_CONTROL_CMD_PLAY
            case 1 => CAST_CONTROL_CMD_PAUSE
            case 2 => CAST_CONTROL_CMD_STOP
            case 3 => CAST_CONTROL_CMD_PLAY_NEXT
            case 4 => CAST_CONTROL_CMD_PLAY_PREVIOUS
            case 5 => CAST_CONTROL_CMD_FAST_FORWARD
            case 6 => CAST_CONTROL_CMD_REWIND
            case 7 => CAST_CONTROL_CMD_SEEK
            case 8 => CAST_CONTROL_CMD_SET_VOLUME
            case 9 => CAST_CONTROL_CMD_SET_SPEED
            case 10 => CAST_CONTROL_CMD_SET_LOOP_MODE
            case 11 => CAST_CONTROL_CMD_TOGGLE_FAVORITE
            case 12 => CAST_CONTROL_CMD_TOGGLE_MUTE
            case _ => CAST_CONTROL_CMD_INVALID
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public enum AVCastControlCommandParameterType {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    INT32(Int32)
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SPEED(PlaybackSpeed)
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    LOOP_MODE(LoopMode)
    | ...
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.AVCast"
]
public class AVCastControlCommand {
    private var parameter_: ?AVCastControlCommandParameterType = None
    private var kind: Int32 = NULL_TYPE
    private static let NEED_PARA_MAP = HashMap<AVCastControlCommandType, Int32>(
        [
            (CAST_CONTROL_CMD_FAST_FORWARD, INT32_TYPE),
            (CAST_CONTROL_CMD_REWIND, INT32_TYPE),
            (CAST_CONTROL_CMD_SET_VOLUME, INT32_TYPE),
            (CAST_CONTROL_CMD_SET_SPEED, SPEED_TYPE),
            (CAST_CONTROL_CMD_SET_LOOP_MODE, LOOP_MODE_TYPE)
        ]
    )

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public AVCastControlCommand(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.AVCast"
        ]
        public var command: AVCastControlCommandType
    ) {}

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public mut prop parameter: ?AVCastControlCommandParameterType {
        get() {
            parameter_
        }
        set(value) {
            kind = match (value) {
                case Some(para) => match (para) {
                    case INT32(v) => INT32_TYPE
                    case SPEED(v) => SPEED_TYPE
                    case LOOP_MODE(v) => LOOP_MODE_TYPE
                    case _ => throw IllegalArgumentException("The type is not supported.")
                }
                case None => NULL_TYPE
            }
            checkParameterIsValid()
            parameter_ = value
        }
    }

    func checkParameterIsValid(): Unit {
        if (NEED_PARA_MAP.contains(command)) {
            if (kind == NULL_TYPE) {
                throw IllegalArgumentException("Command ${command} must not set None parameter!")
            } else {
                if (NEED_PARA_MAP[command] != kind) {
                    throw IllegalArgumentException(
                        "Command ${command} needs ${TYPE_TO_STRING[NEED_PARA_MAP[command]]}!")
                }
            }
        } else {
            if (kind != NULL_TYPE) {
                LOGGER.info("The parameter will be ignored!")
            }
        }
    }
}

@Derive[Equatable, Hashable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public enum AVControlCommandType <: ToString {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SESSION_CMD_INVALID
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SESSION_CMD_PLAY
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SESSION_CMD_PAUSE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SESSION_CMD_STOP
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SESSION_CMD_PLAY_NEXT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SESSION_CMD_PLAY_PREVIOUS
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SESSION_CMD_FAST_FORWARD
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SESSION_CMD_REWIND
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SESSION_CMD_SEEK
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SESSION_CMD_SET_SPEED
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SESSION_CMD_SET_LOOP_MODE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SESSION_CMD_TOGGLE_FAVORITE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SESSION_CMD_PLAY_FROM_ASSETID
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SESSION_CMD_AVCALL_ANSWER
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SESSION_CMD_AVCALL_HANG_UP
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SESSION_CMD_AVCALL_TOGGLE_CALL_MUTE
    | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case SESSION_CMD_INVALID => -1
                case SESSION_CMD_PLAY => 0
                case SESSION_CMD_PAUSE => 1
                case SESSION_CMD_STOP => 2
                case SESSION_CMD_PLAY_NEXT => 3
                case SESSION_CMD_PLAY_PREVIOUS => 4
                case SESSION_CMD_FAST_FORWARD => 5
                case SESSION_CMD_REWIND => 6
                case SESSION_CMD_SEEK => 7
                case SESSION_CMD_SET_SPEED => 8
                case SESSION_CMD_SET_LOOP_MODE => 9
                case SESSION_CMD_TOGGLE_FAVORITE => 10
                case SESSION_CMD_PLAY_FROM_ASSETID => 11
                case SESSION_CMD_AVCALL_ANSWER => 12
                case SESSION_CMD_AVCALL_HANG_UP => 13
                case SESSION_CMD_AVCALL_TOGGLE_CALL_MUTE => 14
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    public func toString(): String {
        match (this) {
            case SESSION_CMD_INVALID => "invalid "
            case SESSION_CMD_PLAY => "play "
            case SESSION_CMD_PAUSE => "pause "
            case SESSION_CMD_STOP => "stop "
            case SESSION_CMD_PLAY_NEXT => "playNext "
            case SESSION_CMD_PLAY_PREVIOUS => "playPrevious "
            case SESSION_CMD_FAST_FORWARD => "fastForward "
            case SESSION_CMD_REWIND => "rewind "
            case SESSION_CMD_SEEK => "seek "
            case SESSION_CMD_SET_SPEED => "setSpeed "
            case SESSION_CMD_SET_LOOP_MODE => "setLoopMode "
            case SESSION_CMD_TOGGLE_FAVORITE => "toggleFavorite "
            case SESSION_CMD_PLAY_FROM_ASSETID => "playFromAssetId "
            case SESSION_CMD_AVCALL_ANSWER => "answer "
            case SESSION_CMD_AVCALL_HANG_UP => "hangUp "
            case SESSION_CMD_AVCALL_TOGGLE_CALL_MUTE => "toggleCallMute "
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parse(value: Int32): AVControlCommandType {
        match (value) {
            case 0 => SESSION_CMD_PLAY
            case 1 => SESSION_CMD_PAUSE
            case 2 => SESSION_CMD_STOP
            case 3 => SESSION_CMD_PLAY_NEXT
            case 4 => SESSION_CMD_PLAY_PREVIOUS
            case 5 => SESSION_CMD_FAST_FORWARD
            case 6 => SESSION_CMD_REWIND
            case 7 => SESSION_CMD_SEEK
            case 8 => SESSION_CMD_SET_SPEED
            case 9 => SESSION_CMD_SET_LOOP_MODE
            case 10 => SESSION_CMD_TOGGLE_FAVORITE
            case 11 => SESSION_CMD_PLAY_FROM_ASSETID
            case 12 => SESSION_CMD_AVCALL_ANSWER
            case 13 => SESSION_CMD_AVCALL_HANG_UP
            case 14 => SESSION_CMD_AVCALL_TOGGLE_CALL_MUTE
            case _ => SESSION_CMD_INVALID
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public enum AVControlCommandParameterType {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    STRING(String)
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    INT32(Int32)
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    INT64(Int64)
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    FLOAT64(Float64)
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    LOOP_MODE(LoopMode)
    | ...
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.Core"
]
public class AVControlCommand {
    private var parameter_: ?AVControlCommandParameterType = None
    private var kind: Int32 = NULL_TYPE
    private static let NEED_PARA_MAP = HashMap<AVControlCommandType, Int32>(
        [
            (SESSION_CMD_TOGGLE_FAVORITE, STRING_TYPE),
            (SESSION_CMD_FAST_FORWARD, INT32_TYPE),
            (SESSION_CMD_REWIND, INT32_TYPE),
            (SESSION_CMD_SEEK, INT32_TYPE),
            (SESSION_CMD_SET_SPEED, FLOAT64_TYPE),
            (SESSION_CMD_SET_LOOP_MODE, LOOP_MODE_TYPE),
            (SESSION_CMD_SET_LOOP_MODE, INT64_TYPE)
        ]
    )

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public AVControlCommand(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var command: AVControlCommandType
    ) {}

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public mut prop parameter: ?AVControlCommandParameterType {
        get() {
            parameter_
        }
        set(value) {
            kind = match (value) {
                case Some(para) => match (para) {
                    case STRING(v) => STRING_TYPE
                    case INT32(v) => INT32_TYPE
                    case INT64(v) => INT64_TYPE
                    case FLOAT64(v) => FLOAT64_TYPE
                    case LOOP_MODE(v) => LOOP_MODE_TYPE
                    case _ => throw IllegalArgumentException("The type is not supported.")
                }
                case None => NULL_TYPE
            }
            checkParameterIsValid()
            parameter_ = value
        }
    }

    func checkParameterIsValid(): Unit {
        if (NEED_PARA_MAP.contains(command)) {
            if (kind == NULL_TYPE) {
                throw IllegalArgumentException("Command ${command} must not set None parameter!")
            } else {
                if (NEED_PARA_MAP[command] != kind) {
                    throw IllegalArgumentException(
                        "Command ${command} needs ${TYPE_TO_STRING[NEED_PARA_MAP[command]]}!")
                }
            }
        } else {
            if (kind != NULL_TYPE) {
                LOGGER.info("The parameter will be ignored!")
            }
        }
    }
}

@C
protected struct CAVSessionCommand {
    private let command_: Int32
    private var parameter_: CParameters

    protected init(command: AVCastControlCommand) {
        command_ = command.command.value
        parameter_ = CParameters(command.parameter)
    }

    protected init(command: AVControlCommand) {
        command_ = command.command.value
        parameter_ = CParameters(command.parameter)
    }
    protected func free() {
        parameter_.free()
    }
}
