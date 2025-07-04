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

import ohos.base.*
import ohos.ffi.*

foreign {
    func FfiSECreateService(errorCode: CPointer<Int32>): Int64

    func FfiSESESGetReaders(id: Int64, errorCode: CPointer<Int32>): CArrI64

    func FfiSESESIsConnected(id: Int64, errorCode: CPointer<Int32>): Bool

    func FfiSESESShutdown(id: Int64, errorCode: CPointer<Int32>): Unit

    func FfiSESESGetVersion(id: Int64, errorCode: CPointer<Int32>): CString

    func FfiSEReaderGetName(id: Int64, errorCode: CPointer<Int32>): CString

    func FfiSEReaderIsSecureElementPresent(id: Int64, errorCode: CPointer<Int32>): Bool

    func FfiSEReaderOpenSession(id: Int64, errorCode: CPointer<Int32>): Int64

    func FfiSEReaderCloseSessions(id: Int64, errorCode: CPointer<Int32>): Unit

    func FfiSEChannelGetSession(id: Int64, errorCode: CPointer<Int32>): Int64

    func FfiSEChannelClose(id: Int64, errorCode: CPointer<Int32>): Unit

    func FfiSEChannelIsClosed(id: Int64, errorCode: CPointer<Int32>): Bool

    func FfiSEChannelIsBasicChannel(id: Int64, errorCode: CPointer<Int32>): Bool

    func FfiSEChannelGetSelectResponse(id: Int64, errorCode: CPointer<Int32>): CArrI32

    func FfiSEChannelTransmit(id: Int64, command: CArrI32, errorCode: CPointer<Int32>): CArrI32

    func FfiSESessionGetReader(id: Int64, errorCode: CPointer<Int32>): Int64

    func FfiSESessionGetATR(id: Int64, errorCode: CPointer<Int32>): CArrI32

    func FfiSESessionOpenBasicChannel(id: Int64, aid: CArrI32, errorCode: CPointer<Int32>): Int64

    func FfiSESessionOpenBasicChannelWithP2(id: Int64, aid: CArrI32, p2: Int32, errorCode: CPointer<Int32>): Int64

    func FfiSESessionOpenLogicalChannel(id: Int64, aid: CArrI32, errorCode: CPointer<Int32>): Int64

    func FfiSESessionOpenLogicalChannelWithP2(id: Int64, aid: CArrI32, p2: Int32, errorCode: CPointer<Int32>): Int64

    func FfiSESessionClose(id: Int64, errorCode: CPointer<Int32>): Unit

    func FfiSESessionIsClosed(id: Int64, errorCode: CPointer<Int32>): Bool

    func FfiSESessionCloseChannels(id: Int64, errorCode: CPointer<Int32>): Unit
}
