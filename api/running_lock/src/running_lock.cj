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

package ohos.running_lock

import ohos.base.*
import ohos.ffi.*
import ohos.labels.*

/**
 * Enumerates the {@link RunningLock} types.
 * One {@link RunningLock} type is available: {@link PROXIMITY_SCREEN_CONTROL}.
 * {@link PROXIMITY_SCREEN_CONTROL} determines whether to turn on or off the screen based on the proximity sensor.
 *
 * @enum { Int32 }
 * @syscap SystemCapability.PowerManager.PowerManager.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.PowerManager.Core"
]
public enum RunningLockType <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.PowerManager.Core"
    ]
    PROXIMITY_SCREEN_CONTROL | ...

    prop value: Int32 {
        get() {
            match (this) {
                case PROXIMITY_SCREEN_CONTROL => 2
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    @!APILevel[
        19,
        deprecated: 10,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.PowerManager.Core"
    ]
    public func toString(): String {
        match (this) {
            case PROXIMITY_SCREEN_CONTROL => "PROXIMITY_SCREEN_CONTROL"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Checks whether the specified {@link RunningLockType} is supported.
 *
 * @param { RunningLockType } type Indicates the specified {@link RunningLockType}.
 * the RunningLockType type is an enumeration class.
 * @returns { Bool } Whether the specified {@link RunningLockType} is supported.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Incorrect parameter types;
 * 2. Parameter verification failed.
 * @throws { BusinessException } 4900101 - Failed to connect to the service.
 * @syscap SystemCapability.PowerManager.PowerManager.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.PowerManager.Core"
]
public func isSupported(`type`: RunningLockType): Bool {
    let num_type: Int32 = `type`.value
    var ret: Int32 = SUCCESS_CODE
    let result: Bool = unsafe { FfiOHOSRunningLockIsSupported(num_type, inout ret) }
    if (ret != SUCCESS_CODE) {
        throw BusinessException(ret, getErrorMsg(ret))
    }
    return result
}

/**
 * Creates a {@link RunningLock} object.
 * This method requires the ohos.permission.RUNNING_LOCK permission.
 * The {@link RunningLock} object can be used to perform a lock operation to prevent the system from hibernating.
 *
 * @permission ohos.permission.RUNNING_LOCK
 * @param { String } name Indicates the {@link RunningLock} name. A recommended name consists of the package or class name and
 * a suffix.
 * @param { RunningLockType } type Indicates the {@link RunningLockType}.
 * @returns { RunningLock } Returns the {@link RunningLock} object.
 * @syscap SystemCapability.PowerManager.PowerManager.Core
 */
@!APILevel[
    19,
    permission: "ohos.permission.RUNNING_LOCK",
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.PowerManager.Core"
]
public func create(name: String, `type`: RunningLockType): RunningLock {
    unsafe {
        var ret: Int32 = SUCCESS_CODE
        var name_cstr = LibC.mallocCString(name)
        let id = FfiOHOSRunningLockCreate(name_cstr, `type`.value, inout ret)
        name_cstr.free()
        if (ret != SUCCESS_CODE) {
            throw BusinessException(ret, getErrorMsg(ret))
        }
        return RunningLock(id)
    }
}

/**
 * Provides a mechanism to prevent the system from hibernating so that the applications can run in the background or
 * when the screen is off.
 * @syscap SystemCapability.PowerManager.PowerManager.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.PowerManager.Core"
]
public class RunningLock <: RemoteDataLite {
    protected init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Prevents the system from hibernating and sets the lock duration.
     * This method requires the ohos.permission.RUNNING_LOCK permission.
     *
     * @permission ohos.permission.RUNNING_LOCK
     * @param { Int32 } timeout Indicates the lock duration (ms). After the lock duration times out,
     * the lock is automatically released and the system hibernates if no other {@link RunningLock} is set.
     * timeout parameter must be of type Int32.
     * @throws { BusinessException } 201 – If the permission is denied.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Incorrect parameter types;
     * @throws { BusinessException } 4900101 - Failed to connect to the service.
     * @syscap SystemCapability.PowerManager.PowerManager.Core
     */
    @!APILevel[
        19,
        permission: "ohos.permission.RUNNING_LOCK",
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.PowerManager.Core"
    ]
    public func hold(timeout: Int32): Unit {
        var ret: Int32 = SUCCESS_CODE
        unsafe { FfiOHOSRunningLockHold(getID(), timeout, inout ret) }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(ret, getErrorMsg(ret))
        }
    }

    /**
     * Checks whether a lock is held or in use.
     *
     * @returns { Bool } Returns true if the lock is held or in use; returns false if the lock has been released.
     * @throws { BusinessException } 4900101 - Failed to connect to the service.
     * @syscap SystemCapability.PowerManager.PowerManager.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.PowerManager.Core"
    ]
    public func isHolding(): Bool {
        var ret: Int32 = SUCCESS_CODE
        let result: Bool = unsafe { FfiOHOSRunningLockIsHolding(getID(), inout ret) }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(ret, getErrorMsg(ret))
        }
        return result
    }

    /**
     * Release the {@link RunningLock} that prevents the system from hibernating.
     * This method requires the ohos.permission.RUNNING_LOCK permission.
     *
     * @permission ohos.permission.RUNNING_LOCK
     * @throws { BusinessException } 201 – If the permission is denied.
     * @throws { BusinessException } 4900101 - Failed to connect to the service.
     * @syscap SystemCapability.PowerManager.PowerManager.Core
     */
    @!APILevel[
        19,
        permission: "ohos.permission.RUNNING_LOCK",
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.PowerManager.Core"
    ]
    public func unhold(): Unit {
        var ret: Int32 = SUCCESS_CODE
        unsafe { FfiOHOSRunningLockUnhold(getID(), inout ret) }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(ret, getErrorMsg(ret))
        }
    }
}
