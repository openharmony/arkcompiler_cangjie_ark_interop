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

package ohos.base

import ohos.business_exception.*
import ohos.labels.APILevel

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class CallbackObjectEx {}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class Callback0ArgumentEx <: CallbackObjectEx {
    public open func invoke(err: ?BusinessExceptionEx): Unit
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class Callback1ArgumentEx<A> <: CallbackObjectEx {
    public open func invoke(err: ?BusinessExceptionEx, arg: A): Unit
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class Callback2ArgumentEx<A, B> <: CallbackObjectEx {
    public open func invoke(err: ?BusinessExceptionEx, arg1: A, arg2: B): Unit
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class Callback3ArgumentWithReturnEx<A, B, C, D> <: CallbackObjectEx {
    public open func invoke(err: ?BusinessExceptionEx, arg1: A, arg2: B, arg3: C): D
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class Callback1ArgumentWithReturnEx<A, B> <: CallbackObjectEx {
    public open func invoke(err: ?BusinessExceptionEx, arg1: A): B
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class CallbackWithReturnEx<A> <: CallbackObjectEx {
    public open func invoke(err: ?BusinessExceptionEx): A
}
