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

package ohos.common_event_manager

import ohos.labels.*
import ohos.ffi.*
import ohos.base.*

foreign {
    func CJ_GetCode(id: Int64): RetDataI32

    func CJ_SetCode(id: Int64, code: Int32): Int32

    func CJ_GetData(id: Int64): RetDataCString

    func CJ_SetData(id: Int64, data: CString): Int32

    func CJ_SetCodeAndData(id: Int64, code: Int32, data: CString): Int32

    func CJ_IsOrderedCommonEvent(id: Int64): RetDataBool

    func CJ_IsStickyCommonEvent(id: Int64): RetDataBool

    func CJ_AbortCommonEvent(id: Int64): Int32

    func CJ_ClearAbortCommonEvent(id: Int64): Int32

    func CJ_GetAbortCommonEvent(id: Int64): RetDataBool

    func CJ_GetSubscribeInfo(id: Int64): RetDataI64

    func CJ_FinishCommonEvent(id: Int64): Int32
}

/**
 * The CommonEventSubscriber module provides APIs for describing the common event subscriber.
 * @relation export interface CommonEventSubscriber
 */
@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.CommonEvent"
]
public class CommonEventSubscriber <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Obtains the result code of an ordered common event.
     * @throws { BusinessException } 1500008 - Failed to initialize the common event service.
     * @relation getCodeSync(): number;
     */
    @!APILevel[
        20,
        atomicservice: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public func getCode(): Int32 {
        let ret = unsafe { CJ_GetCode(getID()) }
        throwIfNotSuccess(ret.code, "getCode")
        return ret.data
    }

    /**
     * Sets the result code of an ordered common event.
     * @throws { BusinessException } 1500008 - Failed to initialize the common event service.
     * @relation setCodeSync(code: number): void;
     */
    @!APILevel[
        20,
        atomicservice: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public func setCode(code: Int32): Unit {
        let errCode = unsafe { CJ_SetCode(getID(), code) }
        throwIfNotSuccess(errCode, "setCode")
    }

    /**
     * Obtains the result data of an ordered common event.
     * @throws { BusinessException } 1500008 - Failed to initialize the common event service.
     * @relation getDataSync(): string;
     */
    @!APILevel[
        20,
        atomicservice: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public func getData(): String {
        let ret = unsafe { CJ_GetData(getID()) }
        throwIfNotSuccess(ret.code, "getData")
        let data = ret.data.toString()
        unsafe { LibC.free(ret.data) }
        return data
    }

    /**
     * Sets the result data for an ordered common event.
     * @throws { BusinessException } 1500008 - Failed to initialize the common event service.
     * @relation setDataSync(data: string): void;
     */
    @!APILevel[
        20,
        atomicservice: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public func setData(data: String): Unit {
        unsafe {
            try (cData = LibC.mallocCString(data).asResource()) {
                let errCode = CJ_SetData(getID(), cData.value)
                throwIfNotSuccess(errCode, "setData")
            }
        }
    }

    /**
     * Sets the result code and data of an ordered common event.
     * @throws { BusinessException } 1500008 - Failed to initialize the common event service.
     * @relation setCodeAndDataSync(code: number, data: string): void;
     */
    @!APILevel[
        20,
        atomicservice: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public func setCodeAndData(code: Int32, data: String): Unit {
        unsafe {
            try (cData = LibC.mallocCString(data).asResource()) {
                let errCode = CJ_SetCodeAndData(getID(), code, cData.value)
                throwIfNotSuccess(errCode, "setCodeAndData")
            }
        }
    }

    /**
     * Checks whether the current common event is an ordered common event.
     * @throws { BusinessException } 1500008 - Failed to initialize the common event service.
     * @relation isOrderedCommonEvent(): Promise<boolean>;
     */
    @!APILevel[
        20,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public func isOrderedCommonEvent(): Bool {
        let ret = unsafe { CJ_IsOrderedCommonEvent(getID()) }
        throwIfNotSuccess(ret.code, "isOrderedCommonEvent")
        return ret.data
    }

    /**
     * Checks whether a common event is a sticky one.
     * @throws { BusinessException } 1500008 - Failed to initialize the common event service.
     * @relation isStickyCommonEvent(): Promise<boolean>;
     */
    @!APILevel[
        20,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public func isStickyCommonEvent(): Bool {
        let ret = unsafe { CJ_IsStickyCommonEvent(getID()) }
        throwIfNotSuccess(ret.code, "isStickyCommonEvent")
        return ret.data
    }

    /**
     * Aborts an ordered common event when used with finishCommonEvent. After the abort, the common event is not sent to the next subscriber.
     * @throws { BusinessException } 1500008 - Failed to initialize the common event service.
     * @relation abortCommonEventSync(): void;
     */
    @!APILevel[
        20,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public func abortCommonEvent(): Unit {
        let errCode = unsafe { CJ_AbortCommonEvent(getID()) }
        throwIfNotSuccess(errCode, "abortCommonEvent")
    }

    /**
     * Clears the aborted state of an ordered common event when used with finishCommonEvent. After the clearance, the common event is sent to the next subscriber.
     * @throws { BusinessException } 1500008 - Failed to initialize the common event service.
     * @relation clearAbortCommonEventSync(): void;
     */
    @!APILevel[
        20,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public func clearAbortCommonEvent(): Unit {
        let errCode = unsafe { CJ_ClearAbortCommonEvent(getID()) }
        throwIfNotSuccess(errCode, "clearAbortCommonEvent")
    }

    /**
     * Checks whether this ordered common event should be aborted.
     * @throws { BusinessException } 1500008 - Failed to initialize the common event service.
     * @relation getAbortCommonEventSync(): boolean;
     */
    @!APILevel[
        20,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public func getAbortCommonEvent(): Bool {
        let ret = unsafe { CJ_GetAbortCommonEvent(getID()) }
        throwIfNotSuccess(ret.code, "getAbortCommonEvent")
        return ret.data
    }

    /**
     * Obtains the subscriber information.
     * @throws { BusinessException } 1500008 - Failed to initialize the common event service.
     * @relation getSubscribeInfoSync(): CommonEventSubscribeInfo;
     */
    @!APILevel[
        20,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public func getSubscribeInfo(): CommonEventSubscribeInfo {
        let ret = unsafe { CJ_GetSubscribeInfo(getID()) }
        throwIfNotSuccess(ret.code, "getSubscribeInfo")
        return CommonEventSubscribeInfo(ret.data)
    }

    /**
     * Finishes this ordered common event.
     * @throws { BusinessException } 1500008 - Failed to initialize the common event service.
     * @relation finishCommonEvent(): Promise<void>;
     */
    @!APILevel[
        20,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public func finishCommonEvent(): Unit {
        let errCode = unsafe { CJ_FinishCommonEvent(getID()) }
        throwIfNotSuccess(errCode, "finishCommonEvent")
    }
}
