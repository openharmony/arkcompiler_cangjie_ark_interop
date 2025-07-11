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

package ohos.eventhub

import std.collection.ArrayList
import std.collection.HashMap
import ohos.base.*
import ohos.labels.*

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public abstract class EventBase {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func as0(): Event0 {
        (this as Event0).getOrThrow({=> BusinessException(ERR_NOT_SUPPOERTED, "Capability not supported.")})
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func as1<A>(): Event1<A> {
        (this as Event1<A>).getOrThrow({=> BusinessException(ERR_NOT_SUPPOERTED, "Capability not supported.")})
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func as2<A1, A2>(): Event2<A1, A2> {
        (this as Event2<A1, A2>).getOrThrow({=> BusinessException(ERR_NOT_SUPPOERTED, "Capability not supported.")})
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func as3<A1, A2, A3>(): Event3<A1, A2, A3> {
        (this as Event3<A1, A2, A3>).getOrThrow({=> BusinessException(ERR_NOT_SUPPOERTED, "Capability not supported.")})
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func as4<A1, A2, A3, A4>(): Event4<A1, A2, A3, A4> {
        (this as Event4<A1, A2, A3, A4>).getOrThrow(
            {=> BusinessException(ERR_NOT_SUPPOERTED, "Capability not supported.")})
    }
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func as5<A1, A2, A3, A4, A5>(): Event5<A1, A2, A3, A4, A5> {
        (this as Event5<A1, A2, A3, A4, A5>).getOrThrow(
            {=> BusinessException(ERR_NOT_SUPPOERTED, "Capability not supported.")})
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public abstract class EventCallBack0 {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func invoke(): Unit
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public abstract class EventCallBack1<A> {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func invoke(arg: A): Unit
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public abstract class EventCallBack2<A1, A2> {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func invoke(arg1: A1, arg2: A2): Unit
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public abstract class EventCallBack3<A1, A2, A3> {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func invoke(arg1: A1, arg2: A2, arg3: A3): Unit
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public abstract class EventCallBack4<A1, A2, A3, A4> {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func invoke(arg1: A1, arg2: A2, arg3: A3, arg4: A4): Unit
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public abstract class EventCallBack5<A1, A2, A3, A4, A5> {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func invoke(arg1: A1, arg2: A2, arg3: A3, arg4: A4, arg5: A5): Unit
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class Event0 <: EventBase {
    private let allFuncs: ArrayList<EventCallBack0> = ArrayList()

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func on(callback: EventCallBack0): Unit {
        var inFlist = false
        for (item in allFuncs) {
            if (refEq(callback, item)) {
                inFlist = true
                return
            }
        }
        if (!inFlist) {
            allFuncs.add(callback)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func off(callback: EventCallBack0): Unit {
        var rindex = -1
        var count = 0
        for (item in allFuncs) {
            if (refEq(callback, item)) {
                rindex = count
                break
            }
            count += 1
        }
        if (rindex != -1) {
            allFuncs.remove(at: rindex)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func off(): Unit {
        allFuncs.clear()
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func emit(): Unit {
        for (f in allFuncs) {
            f.invoke()
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class Event1<A> <: EventBase {
    private let allFuncs: ArrayList<EventCallBack1<A>> = ArrayList()

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func on(callback: EventCallBack1<A>): Unit {
        var inFlist1 = false
        for (item in allFuncs) {
            if (refEq(callback, item)) {
                inFlist1 = true
                return
            }
        }
        if (!inFlist1) {
            allFuncs.add(callback)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func off(callback: EventCallBack1<A>): Unit {
        var rindex1 = -1
        var count = 0
        for (item in allFuncs) {
            if (refEq(callback, item)) {
                rindex1 = count
                break
            }
            count += 1
        }
        if (rindex1 != -1) {
            allFuncs.remove(at: rindex1)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func off(): Unit {
        allFuncs.clear()
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func emit(arg: A): Unit {
        for (f in allFuncs) {
            f.invoke(arg)
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class Event2<A1, A2> <: EventBase {
    private let allFuncs: ArrayList<EventCallBack2<A1, A2>> = ArrayList()

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func on(callback: EventCallBack2<A1, A2>): Unit {
        var inFlist2 = false
        for (item in allFuncs) {
            if (refEq(callback, item)) {
                inFlist2 = true
                return
            }
        }
        if (!inFlist2) {
            allFuncs.add(callback)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func off(callback: EventCallBack2<A1, A2>): Unit {
        var rindex2 = -1
        var count = 0
        for (item in allFuncs) {
            if (refEq(callback, item)) {
                rindex2 = count
                break
            }
            count += 1
        }
        if (rindex2 != -1) {
            allFuncs.remove(at: rindex2)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func off(): Unit {
        allFuncs.clear()
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func emit(arg1: A1, arg2: A2): Unit {
        for (f in allFuncs) {
            f.invoke(arg1, arg2)
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class Event3<A1, A2, A3> <: EventBase {
    private let allFuncs: ArrayList<EventCallBack3<A1, A2, A3>> = ArrayList()

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func on(callback: EventCallBack3<A1, A2, A3>): Unit {
        var inFlist3 = false
        for (item in allFuncs) {
            if (refEq(callback, item)) {
                inFlist3 = true
                return
            }
        }
        if (!inFlist3) {
            allFuncs.add(callback)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func off(callback: EventCallBack3<A1, A2, A3>): Unit {
        var rindex3 = -1
        var count = 0
        for (item in allFuncs) {
            if (refEq(callback, item)) {
                rindex3 = count
                break
            }
            count += 1
        }
        if (rindex3 != -1) {
            allFuncs.remove(at: rindex3)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func off(): Unit {
        allFuncs.clear()
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func emit(arg1: A1, arg2: A2, arg3: A3): Unit {
        for (f in allFuncs) {
            f.invoke(arg1, arg2, arg3)
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class Event4<A1, A2, A3, A4> <: EventBase {
    private let allFuncs: ArrayList<EventCallBack4<A1, A2, A3, A4>> = ArrayList()

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func on(callback: EventCallBack4<A1, A2, A3, A4>): Unit {
        var inFlist4 = false
        for (item in allFuncs) {
            if (refEq(callback, item)) {
                inFlist4 = true
                return
            }
        }
        if (!inFlist4) {
            allFuncs.add(callback)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func off(callback: EventCallBack4<A1, A2, A3, A4>): Unit {
        var rindex4 = -1
        var count = 0
        for (item in allFuncs) {
            if (refEq(callback, item)) {
                rindex4 = count
                break
            }
            count += 1
        }
        if (rindex4 != -1) {
            allFuncs.remove(at: rindex4)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func off(): Unit {
        allFuncs.clear()
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func emit(arg1: A1, arg2: A2, arg3: A3, arg4: A4): Unit {
        for (f in allFuncs) {
            f.invoke(arg1, arg2, arg3, arg4)
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class Event5<A1, A2, A3, A4, A5> <: EventBase {
    private let allFuncs: ArrayList<EventCallBack5<A1, A2, A3, A4, A5>> = ArrayList()

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func on(callback: EventCallBack5<A1, A2, A3, A4, A5>): Unit {
        var inFlist5 = false
        for (item in allFuncs) {
            if (refEq(callback, item)) {
                inFlist5 = true
                return
            }
        }
        if (!inFlist5) {
            allFuncs.add(callback)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func off(callback: EventCallBack5<A1, A2, A3, A4, A5>): Unit {
        var rindex5 = -1
        var count = 0
        for (item in allFuncs) {
            if (refEq(callback, item)) {
                rindex5 = count
                break
            }
            count += 1
        }
        if (rindex5 != -1) {
            allFuncs.remove(at: rindex5)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func off(): Unit {
        allFuncs.clear()
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func emit(arg1: A1, arg2: A2, arg3: A3, arg4: A4, arg5: A5): Unit {
        for (f in allFuncs) {
            f.invoke(arg1, arg2, arg3, arg4, arg5)
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class EventHub {
    private static var allEvents: HashMap<String, EventBase> = HashMap<String, EventBase>()

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func obtainEvent0(name: String): Event0 {
        var v = allEvents.entryView(name)
        if (v.value.isNone()) {
            var e = Event0()
            v.value = e
            e
        } else {
            (v.value.getOrThrow({=> BusinessException(ERR_PARAMETER_ERROR, "Invalid paramter.")}) as Event0)
                .getOrThrow({=> BusinessException(ERR_PARAMETER_ERROR, "Invalid paramter.")})
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func obtainEvent1<A>(name: String): Event1<A> {
        var v = allEvents.entryView(name)
        if (v.value.isNone()) {
            var e = Event1<A>()
            v.value = e
            e
        } else {
            (v.value.getOrThrow({=> BusinessException(ERR_PARAMETER_ERROR, "Invalid paramter.")}) as Event1<A>)
                .getOrThrow({=> BusinessException(ERR_PARAMETER_ERROR, "Invalid paramter.")})
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func obtainEvent2<A1, A2>(name: String): Event2<A1, A2> {
        var v = allEvents.entryView(name)
        if (v.value.isNone()) {
            var e = Event2<A1, A2>()
            v.value = e
            e
        } else {
            (v.value.getOrThrow({=> BusinessException(ERR_PARAMETER_ERROR, "Invalid paramter.")}) as Event2<A1, A2>)
                .getOrThrow({=> BusinessException(ERR_PARAMETER_ERROR, "Invalid paramter.")})
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func obtainEvent3<A1, A2, A3>(name: String): Event3<A1, A2, A3> {
        var v = allEvents.entryView(name)
        if (v.value.isNone()) {
            var e = Event3<A1, A2, A3>()
            v.value = e
            e
        } else {
            (v.value.getOrThrow({=> BusinessException(ERR_PARAMETER_ERROR, "Invalid paramter.")}) as Event3<A1, A2, A3>)
                .getOrThrow({=> BusinessException(ERR_PARAMETER_ERROR, "Invalid paramter.")})
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func obtainEvent4<A1, A2, A3, A4>(name: String): Event4<A1, A2, A3, A4> {
        var v = allEvents.entryView(name)
        if (v.value.isNone()) {
            var e = Event4<A1, A2, A3, A4>()
            v.value = e
            e
        } else {
            (v.value.getOrThrow({=> BusinessException(ERR_PARAMETER_ERROR, "Invalid paramter.")}) as Event4<A1, A2, A3,
                A4>).getOrThrow({=> BusinessException(ERR_PARAMETER_ERROR, "Invalid paramter.")})
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func obtainEvent5<A1, A2, A3, A4, A5>(name: String): Event5<A1, A2, A3, A4, A5> {
        var v = allEvents.entryView(name)
        if (v.value.isNone()) {
            var e = Event5<A1, A2, A3, A4, A5>()
            v.value = e
            e
        } else {
            (v.value.getOrThrow({=> BusinessException(ERR_PARAMETER_ERROR, "Invalid paramter.")}) as Event5<A1, A2, A3,
                A4, A5>).getOrThrow({=> BusinessException(ERR_PARAMETER_ERROR, "Invalid paramter.")})
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func get(s: String): EventBase {
        allEvents.get(s).getOrThrow({=> BusinessException(ERR_PARAMETER_ERROR, "Invalid paramter.")})
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func get0(s: String): Event0 {
        allEvents.get(s).getOrThrow({=> BusinessException(ERR_PARAMETER_ERROR, "Invalid paramter.")}).as0()
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func get1<A>(s: String): Event1<A> {
        allEvents.get(s).getOrThrow({=> BusinessException(ERR_PARAMETER_ERROR, "Invalid paramter.")}).as1<A>()
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func get2<A1, A2>(s: String): Event2<A1, A2> {
        allEvents.get(s).getOrThrow({=> BusinessException(ERR_PARAMETER_ERROR, "Invalid paramter.")}).as2<A1, A2>()
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func get3<A1, A2, A3>(s: String): Event3<A1, A2, A3> {
        allEvents.get(s).getOrThrow({=> BusinessException(ERR_PARAMETER_ERROR, "Invalid paramter.")}).as3<A1, A2, A3>()
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func get4<A1, A2, A3, A4>(s: String): Event4<A1, A2, A3, A4> {
        allEvents.get(s).getOrThrow({=> BusinessException(ERR_PARAMETER_ERROR, "Invalid paramter.")})
            .as4<A1, A2, A3, A4>()
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func get5<A1, A2, A3, A4, A5>(s: String): Event5<A1, A2, A3, A4, A5> {
        allEvents.get(s).getOrThrow({=> BusinessException(ERR_PARAMETER_ERROR, "Invalid paramter.")})
            .as5<A1, A2, A3, A4, A5>()
    }
}
