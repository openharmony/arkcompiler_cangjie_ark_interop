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


/**
 * During inter-process communication, objects of the class are written to the {@link MessageSequence} and
 * they are recovered from the {@link MessageSequence}.
 *
 * @relation interface Parcelable
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.IPC.Core"
]
public interface Parcelable {
    /**
     * Marshal this {@code Parcelable} object into a {@link MessageSequence}.
     *
     * @relation marshalling(dataOut: MessageSequence): boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    func marshalling(dataOut: MessageSequence): Bool

    /**
     * Unmarshal this {@code Parcelable} object from a {@link MessageSequence}.
     *
     * @relation unmarshalling(dataIn: MessageSequence): boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    func unmarshalling(dataIn: MessageSequence): Bool
}

