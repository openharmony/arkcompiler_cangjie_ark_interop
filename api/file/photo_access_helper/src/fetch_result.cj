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

package ohos.file.photo_access_helper

import ohos.labels.*
import ohos.ffi.*
import ohos.multimedia.fetchdata.*

/**
 * Provides APIs to manage the file retrieval result.
 *
 * @relation interface FetchResult<T>
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class FetchResult<T> <: RemoteDataLite where T <: RemoteDataLite & FetchData<T> {
    protected init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }
    /**
     * Release the fetch result.
     *
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 14000011 - System inner fail
     * @relation close(): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func close(): Unit {
        unsafe { FfiFetchResultClose(myDataId) }
        releaseFFIData(myDataId)
    }

    /**
     * Obtains the total number of objects in the fetch result.
     *
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types.
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 14000011 - System inner fail
     * @relation getCount(): number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func getCount(): Int32 {
        var errCode = 0i32
        unsafe {
            let count = FfiFetchResultGetCount(getID(), inout errCode)
            checkRet(errCode, "[FetchResult] getCount")
            return count
        }
    }

    /**
     * Checks whether the result set points to the last row.
     * You need to check whether the object is the last one before calling getNextObject.
     *
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 14000011 - System inner fail
     * @relation isAfterLast(): boolean;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func isAfterLast(): Bool {
        var errCode = 0i32
        unsafe {
            let ret = FfiFetchResultIsAfterLast(getID(), inout errCode)
            checkRet(errCode, "[FetchResult] isAfterLast")
            return ret
        }
    }

    /**
     * Obtains the first object in the fetch result.
     *
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 14000011 - System inner fail
     * @relation getFirstObject(): Promise<T>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func getFirstObject(): T {
        var errCode = 0i32
        unsafe {
            let ret = FfiFetchResultGetFirstObject(getID(), inout errCode)
            checkRet(errCode, "[FetchResult] getFirstObject")
            return T.create(ret.id)
        }
    }

    /**
     * Obtains the next object in the fetch result.
     * Before calling this method, you must use isAfterLast() to check whether the current position is the last row
     * in the fetch result. This method only works when the current position is not the last row.
     *
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 14000011 - System inner fail
     * @relation getNextObject(): Promise<T>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func getNextObject(): T {
        var errCode = 0i32
        unsafe {
            let ret = FfiFetchResultGetNextObject(getID(), inout errCode)
            checkRet(errCode, "[FetchResult] getNextObject")
            return T.create(ret.id)
        }
    }

    /**
     * Obtains the last object in the fetch result
     *
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 14000011 - System inner fail
     * @relation getLastObject(): Promise<T>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func getLastObject(): T {
        var errCode = 0i32
        unsafe {
            let ret = FfiFetchResultGetLastObject(getID(), inout errCode)
            checkRet(errCode, "[FetchResult] getLastObject")
            return T.create(ret.id)
        }
    }

    /**
     * Obtains the object with the specified index in the result set.
     *
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 14000011 - System inner fail
     * @relation getObjectByPosition(index: number): Promise<T>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func getObjectByPosition(index: Int32): T {
        var errCode = 0i32
        unsafe {
            let ret = FfiFetchResultGetObjectAtPosition(getID(), index, inout errCode)
            checkRet(errCode, "[FetchResult] getObjectByPosition")
            return T.create(ret.id)
        }
    }

    /**
     * Obtains all objects in the fetch result.
     *
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 14000011 - System inner fail
     * @relation getAllObjects(): Promise<Array<T>>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func getAllObjects(): Array<T> {
        var errCode = 0i32
        unsafe {
            let ret = FfiFetchResultGetAllObjects(getID(), inout errCode)
            checkRet(errCode, "[FetchResult] getAllObjects")
            let size = ret.size
            let head = ret.head
            let resullt = Array<T>(size, {i => T.create(head.read(i).id)})
            ret.free()
            return resullt
        }
    }
}
