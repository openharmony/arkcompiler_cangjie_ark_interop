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

package ohos.resource_manager

public import ohos.drawable_descriptor.DrawableDescriptor
public import ohos.raw_file_descriptor.RawFileDescriptor
public import ohos.resource.AppResource
import ohos.ffi.{RemoteDataLite, releaseFFIData, RetDataCArrUI8}
import ohos.labels.APILevel
import std.collection.{HashMap, ArrayList}
import std.sync.Mutex
import ohos.raw_file_descriptor.RetDataRawFileDescriptor
import ohos.resource.CResource

/**
 * Provides the capability of accessing application resources.
 *
 * @relation export interface ResourceManager
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.ResourceManager"
]
public class ResourceManager <: RemoteDataLite {
    private static let RES_MGR_MAP = HashMap<UIntNative, ResourceManager>()
    private static let APP_MUTEX = Mutex()
    private static let SYS_MUTEX = Mutex()
    private static var sysResMgr = Option<ResourceManager>.None

    init(id: Int64) {
        super(id)
        RES_LOG.info("ResourceManager construct success")
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    protected static func getResourceManager(context: StageContext): ResourceManager {
        let ptrAddr = context.toUIntNative()
        match (RES_MGR_MAP.get(ptrAddr)) {
            case Some(v) => v
            case None => synchronized(APP_MUTEX) {
                match (RES_MGR_MAP.get(ptrAddr)) {
                    case Some(v) => v
                    case None =>
                        let mgrId = unsafe { CJ_GetResourceManagerStageMode(context) }
                        let mgr = ResourceManager(mgrId)
                        RES_MGR_MAP.add(ptrAddr, mgr)
                        mgr
                }
            }
        }
    }

    /**
     * Obtains the raw file resource descriptor corresponding to the specified resource path.
     *
     * @param { String } path - Indicates the resource relative path.
     * @returns { RawFileDescriptor } The raw file resource descriptor.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: Incorrect parameter types.
     * @throws { BusinessException } 9001005 - Invalid relative path.
     * @relation getRawFdSync(path: string): RawFileDescriptor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getRawFd(path: String): RawFileDescriptor {
        unsafe {
            let cPath = LibC.mallocCString(path)
            var retRawFd = RetDataRawFileDescriptor(0, 0, 0)
            let retCode = CJ_GetRawFd(getID(), cPath, inout retRawFd)
            LibC.free(cPath)
            let rawFd = RawFileDescriptor(retRawFd)
            throwIfNotSuccess(retCode, getErrorMsg(retCode))
            rawFd
        }
    }

    /**
     * Close the raw file resource descriptor corresponding to the specified resource path.
     *
     * @param { String } path - Indicates the resource relative path.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: Incorrect parameter types.
     * @throws { BusinessException } 9001005 - Invalid relative path.
     * @relation closeRawFdSync(path: string): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func closeRawFd(path: String): Unit {
        unsafe {
            let cPath = LibC.mallocCString(path)
            let retCode = CJ_CloseRawFd(getID(), cPath)
            LibC.free(cPath)
            throwIfNotSuccess(retCode, getErrorMsg(retCode))
        }
    }

    /**
     * Obtains the raw file resource corresponding to the specified resource path.
     *
     * @param { String } path - Indicates the resource relative path.
     * @returns { Array<UInt8> } the raw file resource corresponding to the specified resource path.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: Incorrect parameter types.
     * @throws { BusinessException } 9001005 - Invalid relative path.
     * @relation getRawFileContentSync(path: string): Uint8Array
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getRawFileContent(path: String): Array<UInt8> {
        unsafe {
            let cPath = LibC.mallocCString(path)
            let ret = CJ_GetRawFileContent(getID(), cPath)
            LibC.free(cPath)
            throwIfNotSuccess(ret.code, getErrorMsg(ret.code))
            let size = ret.data.size
            let data = Array<UInt8>(ret.data.size, repeat: 0)
            for (i in 0..size) {
                data[i] = ret.data.head.read(i)
            }
            LibC.free<UInt8>(ret.data.head)
            data
        }
    }

    /**
     * Obtains the rawfile resource list corresponding to the specified resource path.
     *
     * @param { String } path - Indicates the resource relative path.
     * @returns { Array<String> } The rawfile resource list.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: Incorrect parameter types.
     * @throws { BusinessException } 9001005 - Invalid relative path.
     * @relation getRawFileListSync(path: string): Array<string>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getRawFileList(path: String): Array<String> {
        unsafe {
            let cPath = LibC.mallocCString(path)
            let ret = CJ_GetRawFileList(getID(), cPath)
            LibC.free(cPath)
            throwIfNotSuccess(ret.code, getErrorMsg(ret.code))
            let size = ret.data.size
            let arrPtr = ret.data.head
            let arr = Array<String>(size, repeat: "")
            for (i in 0..size) {
                var temp = arrPtr.read(i)
                arr[i] = temp.toString()
                LibC.free(temp)
            }
            LibC.free<CString>(ret.data.head)
            arr
        }
    }

    /**
     * Obtains the color resource corresponding to the specified resource name.
     *
     * @param { String } resName - Indicates the resource name.
     * @returns { UInt32 } Indicates the integer reference value representing the color data.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: Incorrect parameter types.
     * @throws { BusinessException } 9001003 - Invalid resource name.
     * @throws { BusinessException } 9001004 - No matching resource is found based on the resource name.
     * @throws { BusinessException } 9001006 - The resource is referenced cyclically.
     * @relation getColorByNameSync(resName: string) : number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getColorByName(resName: String): UInt32 {
        unsafe {
            let cName = LibC.mallocCString(resName)
            var data: UInt32 = 0
            let retCode = CJ_GetColorByName(getID(), cName, inout data)
            LibC.free(cName)
            throwIfNotSuccess(retCode, getErrorMsg(retCode))
            data
        }
    }

    /**
     * Obtains the color resource corresponding to the specified resource object.
     *
     * @param { AppResource } resource - Indicates the resource object.
     * @returns { UInt32 } Indicates the integer reference value representing the color data.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: Incorrect parameter types.
     * @throws { BusinessException } 9001001 - Invalid resource ID.
     * @throws { BusinessException } 9001002 - No matching resource is found based on the resource ID.
     * @throws { BusinessException } 9001006 - The resource is referenced cyclically.
     * @relation getColorSync(resource: Resource) : number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getColor(resource: AppResource): UInt32 {
        unsafe {
            var data: UInt32 = 0
            let res = CResource(resource)
            let retCode = CJ_GetColorByResource(getID(), res, inout data)
            res.free()
            throwIfNotSuccess(retCode, getErrorMsg(retCode))
            data
        }
    }

    /**
     * Obtains the color resource corresponding to the specified resource ID.
     *
     * @param { UInt32 } resId - Indicates the resource ID.
     * @returns { UInt32 } Indicates the integer reference value representing the color data.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: Incorrect parameter types.
     * @throws { BusinessException } 9001001 - Invalid resource ID.
     * @throws { BusinessException } 9001002 - No matching resource is found based on the resource ID.
     * @throws { BusinessException } 9001006 - The resource is referenced cyclically.
     * @relation getColorSync(resId: number) : number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getColor(resId: UInt32): UInt32 {
        var data: UInt32 = 0
        let retCode = unsafe { CJ_GetColor(getID(), resId, inout data) }
        throwIfNotSuccess(retCode, getErrorMsg(retCode))
        data
    }

    /**
     * Obtains the boolean result with a specified resource ID.
     *
     * @param { UInt32 } resId - Indicates the resource ID.
     * @returns { Bool } The boolean resource corresponding to the resource ID.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: Incorrect parameter types.
     * @throws { BusinessException } 9001001 - Invalid resource ID.
     * @throws { BusinessException } 9001002 - No matching resource is found based on the resource ID.
     * @throws { BusinessException } 9001006 - The resource is referenced cyclically.
     * @relation getBoolean(resId: number): boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getBoolean(resId: UInt32): Bool {
        var data = true
        let retCode = unsafe { CJ_GetBoolean(getID(), resId, inout data) }
        throwIfNotSuccess(retCode, getErrorMsg(retCode))
        data
    }

    /**
     * Obtains the boolean result with a specified resource object.
     *
     * @param { AppResource } resource - Indicates the resource object.
     * @returns { Bool } The boolean resource corresponding to the resource object.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: Incorrect parameter types.
     * @throws { BusinessException } 9001001 - Invalid resource ID.
     * @throws { BusinessException } 9001002 - No matching resource is found based on the resource ID.
     * @throws { BusinessException } 9001006 - The resource is referenced cyclically.
     * @relation getBoolean(resource: Resource): boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getBoolean(resource: AppResource): Bool {
        unsafe {
            var data = true
            let res = CResource(resource)
            let retCode = CJ_GetBooleanByResource(getID(), res, inout data)
            res.free()
            throwIfNotSuccess(retCode, getErrorMsg(retCode))
            data
        }
    }

    /**
     * Obtains the boolean result with a specified resource name.
     *
     * @param { String } resName - Indicates the resource name.
     * @returns { Bool } The boolean resource corresponding to the resource name.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: Incorrect parameter types.
     * @throws { BusinessException } 9001003 - Invalid resource name.
     * @throws { BusinessException } 9001004 - No matching resource is found based on the resource name.
     * @throws { BusinessException } 9001006 - The resource is referenced cyclically.
     * @relation getBooleanByName(resName: string): boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getBooleanByName(resName: String): Bool {
        unsafe {
            let cName = LibC.mallocCString(resName)
            var data = true
            let retCode = CJ_GetBooleanByName(getID(), cName, inout data)
            LibC.free(cName)
            throwIfNotSuccess(retCode, getErrorMsg(retCode))
            data
        }
    }

    /**
     * Obtains the number result with a specified resource ID.
     *
     * @param { UInt32 } resId - Indicates the resource ID.
     * @returns { Number } The number resource corresponding to the resource ID.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: Incorrect parameter types.
     * @throws { BusinessException } 9001001 - Invalid resource ID.
     * @throws { BusinessException } 9001002 - No matching resource is found based on the resource ID.
     * @throws { BusinessException } 9001006 - The resource is referenced cyclically.
     * @relation getNumber(resId: number): number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getNumber(resId: UInt32): Number {
        unsafe {
            var data = RetGetNumber(true, 0, 0.0)
            let retCode = CJ_GetNumber(getID(), resId, inout data)
            throwIfNotSuccess(retCode, getErrorMsg(retCode))
            data.toNumber()
        }
    }

    /**
     * Obtains the number result with a specified resource object.
     *
     * @param { AppResource } resource - Indicates the resource object.
     * @returns { Number } The number resource corresponding to the resource object.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: Incorrect parameter types.
     * @throws { BusinessException } 9001001 - Invalid resource ID.
     * @throws { BusinessException } 9001002 - No matching resource is found based on the resource ID.
     * @throws { BusinessException } 9001006 - The resource is referenced cyclically.
     * @relation getNumber(resource: Resource): number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getNumber(resource: AppResource): Number {
        unsafe {
            var data = RetGetNumber(true, 0, 0.0)
            let res = CResource(resource)
            let retCode = CJ_GetNumberByResource(getID(), res, inout data)
            res.free()
            throwIfNotSuccess(retCode, getErrorMsg(retCode))
            data.toNumber()
        }
    }

    /**
     * Obtains the number result with a specified resource name.
     *
     * @param { String } resName - Indicates the resource name.
     * @returns { Number } The number resource corresponding to the resource name.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: Incorrect parameter types.
     * @throws { BusinessException } 9001003 - Invalid resource name.
     * @throws { BusinessException } 9001004 - No matching resource is found based on the resource name.
     * @throws { BusinessException } 9001006 - The resource is referenced cyclically.
     * @relation getNumberByName(resName: string): number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getNumberByName(resName: String): Number {
        unsafe {
            let cName = LibC.mallocCString(resName)
            var data = RetGetNumber(true, 0, 0.0)
            let retCode = CJ_GetNumberByName(getID(), cName, inout data)
            LibC.free(cName)
            throwIfNotSuccess(retCode, getErrorMsg(retCode))
            data.toNumber()
        }
    }

    /**
     * Obtains the content of the specified screen density media file corresponding to a specified resource name.
     *
     * @param { String } resName - Indicates the resource name.
     * @param { UInt32 } density - The parameter ScreenDensity{@link ScreenDensity}, A value of 0 means
     *                 to use the density of current system dpi.
     * @returns { Array<UInt8> } The obtained specified screen density media file content.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 -  If the input parameter invalid. Possible causes: 1.Incorrect parameter types; 2.Parameter verification failed.
     * @throws { BusinessException } 9001003 - Invalid resource name.
     * @throws { BusinessException } 9001004 - No matching resource is found based on the resource name.
     * @relation getMediaByNameSync(resName: string, density?: number): Uint8Array
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getMediaByName(resName: String, density!: UInt32 = 0): Array<UInt8> {
        unsafe {
            let cName = LibC.mallocCString(resName)
            let ret = CJ_GetMediaByName(getID(), cName, density)
            LibC.free(cName)
            throwIfNotSuccess(ret.code, getErrorMsg(ret.code))
            let size = ret.data.size
            let result = Array<UInt8>(size, repeat: 0)
            for (i in 0..size) {
                result[i] = ret.data.head.read(i)
            }
            LibC.free<UInt8>(ret.data.head)
            result
        }
    }

    /**
     * Obtains the content of the specified screen density media file corresponding to a specified resource ID.
     *
     * @param { UInt32 } resId - Indicates the resource ID.
     * @param { UInt32 } density - The optional parameter ScreenDensity{@link ScreenDensity}, A value of 0 means
     *                to use the density of current system dpi.
     * @returns { Array<UInt8> } Indicates the obtained media file content.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: 1.Incorrect parameter types; 2.Parameter verification failed.
     * @throws { BusinessException } 9001001 - Invalid resource ID.
     * @throws { BusinessException } 9001002 - No matching resource is found based on the resource ID.
     * @relation getMediaContentSync(resId: number, density?: number): Uint8Array
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getMediaContent(resId: UInt32, density!: UInt32 = 0): Array<UInt8> {
        let ret = unsafe { CJ_GetMediaContent(getID(), resId, density) }
        getMediaContentResult(ret)
    }

    /**
     * Obtains the content of the specified screen density media file corresponding to a specified resource object.
     *
     * @param { AppResource } resource - Indicates the resource object.
     * @param { UInt32 } density - The optional parameter ScreenDensity{@link ScreenDensity}, A value of 0 means
     *                to use the density of current system dpi.
     * @returns { Array<UInt8> } Indicates the obtained media file content.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: 1.Incorrect parameter types; 2.Parameter verification failed.
     * @throws { BusinessException } 9001001 - Invalid resource ID.
     * @throws { BusinessException } 9001002 - No matching resource is found based on the resource ID.
     * @relation getMediaContentSync(resource: Resource, density?: number): Uint8Array
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getMediaContent(resource: AppResource, density!: UInt32 = 0): Array<UInt8> {
        let res = CResource(resource)
        let ret = unsafe { CJ_GetMediaContentByResource(getID(), res, density) }
        res.free()
        getMediaContentResult(ret)
    }

    func getMediaContentResult(ret: RetDataCArrUI8): Array<UInt8> {
        throwIfNotSuccess(ret.code, getErrorMsg(ret.code))
        let size = ret.data.size
        let result = Array<UInt8>(size, repeat: 0)
        for (i in 0..size) {
            result[i] = unsafe { ret.data.head.read(i) }
        }
        unsafe { LibC.free<UInt8>(ret.data.head) }
        return result
    }

    /**
     * Obtains the Base64 code of the specified screen density media file corresponding to the specified resource ID.
     *
     * @param { UInt32 } resId - Indicates the resource ID.
     * @param { UInt32 } density - The optional parameter ScreenDensity{@link ScreenDensity}, A value of 0 means
     *                to use the density of current system dpi.
     * @returns { String } Indicates the obtained Base64 code of the media file.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws IllegalMemoryException - Out of memory.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: 1.Incorrect parameter types; 2.Parameter verification failed.
     * @throws { BusinessException } 9001001 - Invalid resource ID.
     * @throws { BusinessException } 9001002 - No matching resource is found based on the resource ID.
     * @relation getMediaContentBase64Sync(resId: number, density?: number): string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getMediaContentBase64(resId: UInt32, density!: UInt32 = 0): String {
        let retData = unsafe { CJ_GetMediaContentBase64(getID(), resId, density) }
        throwIfNotSuccess(retData.code, getErrorMsg(retData.code))
        throwIfNull(retData.data)
        let ret = retData.data.toString()
        unsafe { LibC.free(retData.data) }
        return ret
    }

    /**
     * Obtains the content of the specified screen density media file corresponding to the specified resource object.
     *
     * @param { AppResource } resource - Indicates the resource object.
     * @param { UInt32 } density - The optional parameter ScreenDensity{@link ScreenDensity}, A value of 0 means
     *                to use the density of current system dpi.
     * @returns { String } Indicates the obtained Base64 code of the media file.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws IllegalMemoryException - Out of memory.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: 1.Incorrect parameter types; 2.Parameter verification failed.
     * @throws { BusinessException } 9001001 - Invalid resource ID.
     * @throws { BusinessException } 9001002 - No matching resource is found based on the resource ID.
     * @relation getMediaContentBase64Sync(resource: Resource, density?: number): string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getMediaContentBase64(resource: AppResource, density!: UInt32 = 0): String {
        let cResource = CResource(resource)
        let retData = unsafe { CJ_GetMediaContentBase64ByResource(getID(), cResource, density) }
        cResource.free()
        throwIfNotSuccess(retData.code, getErrorMsg(retData.code))
        throwIfNull(retData.data)
        let ret = retData.data.toString()
        unsafe { LibC.free(retData.data) }
        return ret
    }

    /**
     * Obtains the Base64 code of the specified screen density media file corresponding to the specified resource name.
     *
     * @param { String } resName - Indicates the resource name.
     * @param { UInt32 } density - The parameter ScreenDensity{@link ScreenDensity}, A value of 0 means
     *                 to use the density of current system dpi.
     * @returns { String } The obtained Base64 code of the specified screen density media file.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws IllegalMemoryException - Out of memory.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: 1.Incorrect parameter types; 2.Parameter verification failed.
     * @throws { BusinessException } 9001003 - Invalid resource name.
     * @throws { BusinessException } 9001004 - No matching resource is found based on the resource name.
     * @relation getMediaBase64ByNameSync(resName: string, density?: number): string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getMediaBase64ByName(resName: String, density!: UInt32 = 0): String {
        let cName = unsafe { LibC.mallocCString(resName) }
        let retData = unsafe { CJ_GetMediaContentBase64ByName(getID(), cName, density) }
        unsafe { LibC.free(cName) }
        throwIfNotSuccess(retData.code, getErrorMsg(retData.code))
        throwIfNull(retData.data)
        let ret = retData.data.toString()
        unsafe { LibC.free(retData.data) }
        return ret
    }

    /**
     * Obtains the singular-plural character string represented by the ID string corresponding to
     * the specified number.
     *
     * @param { UInt32 } resId - Indicates the resource ID.
     * @param { Int64 } num - Indicates the number.
     * @returns { String } The singular-plural character string represented by the ID string
     *         corresponding to the specified number.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws IllegalMemoryException - Out of memory.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: Incorrect parameter types.
     * @throws { BusinessException } 9001001 - Invalid resource ID.
     * @throws { BusinessException } 9001002 - No matching resource is found based on the resource ID.
     * @throws { BusinessException } 9001006 - The resource is referenced cyclically.
     * @relation getPluralStringValueSync(resId: number, num: number): string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getPluralStringValue(resId: UInt32, num: Int64): String {
        let retData = unsafe { CJ_GetPluralStringValue(getID(), resId, num) }
        throwIfNotSuccess(retData.code, getErrorMsg(retData.code))
        throwIfNull(retData.data)
        let ret = retData.data.toString()
        unsafe { LibC.free(retData.data) }
        return ret
    }

    /**
     * Obtains the singular-plural character string represented by the resource object string corresponding to the
     * specified number.
     *
     * @param { AppResource } resource - Indicates the resource object.
     * @param { Int64 } num - Indicates the number.
     * @returns { String } The singular-plural character string represented by the ID string
     *         corresponding to the specified number.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws IllegalMemoryException - Out of memory.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: Incorrect parameter types.
     * @throws { BusinessException } 9001001 - Invalid resource ID.
     * @throws { BusinessException } 9001002 - No matching resource is found based on the resource ID.
     * @throws { BusinessException } 9001006 - The resource is referenced cyclically.
     * @relation getPluralStringValueSync(resource: Resource, num: number): string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getPluralStringValue(resource: AppResource, num: Int64): String {
        let cResource = CResource(resource)
        let retData = unsafe { CJ_GetPluralStringValueByResource(getID(), cResource, num) }
        cResource.free()
        throwIfNotSuccess(retData.code, getErrorMsg(retData.code))
        throwIfNull(retData.data)
        let ret = retData.data.toString()
        unsafe { LibC.free(retData.data) }
        return ret
    }

    /**
     * Obtains the singular-plural character string represented by the name string corresponding to
     * the specified number.
     *
     * @param { String } resName - Indicates the resource name.
     * @param { Int64 } num - Indicates the number.
     * @returns { String } The singular-plural character string represented by the name string
     *         corresponding to the specified number.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws IllegalMemoryException - Out of memory.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: Incorrect parameter types.
     * @throws { BusinessException } 9001003 - Invalid resource name.
     * @throws { BusinessException } 9001004 - No matching resource is found based on the resource name.
     * @throws { BusinessException } 9001006 - The resource is referenced cyclically.
     * @relation getPluralStringByNameSync(resName: string, num: number): string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getPluralStringByName(resName: String, num: Int64): String {
        unsafe {
            let cName = LibC.mallocCString(resName)
            let retData = CJ_GetPluralStringByName(getID(), cName, num)
            LibC.free(cName)
            throwIfNotSuccess(retData.code, getErrorMsg(retData.code))
            throwIfNull(retData.data)
            let ret = retData.data.toString()
            LibC.free(retData.data)
            return ret
        }
    }

    /**
     * Obtains the array of character strings corresponding to a specified resource ID.
     *
     * @param { UInt32 } resId - Indicates the resource ID.
     * @returns { Array<String> } The array of character strings corresponding to the specified resource ID.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: Incorrect parameter types.
     * @throws { BusinessException } 9001001 - Invalid resource ID.
     * @throws { BusinessException } 9001002 - No matching resource is found based on the resource ID.
     * @throws { BusinessException } 9001006 - The resource is referenced cyclically.
     * @relation getStringArrayValueSync(resId: number): Array<string>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getStringArrayValue(resId: UInt32): Array<String> {
        let retData = unsafe { CJ_GetStringArrayValue(getID(), resId) }
        throwIfNotSuccess(retData.code, getErrorMsg(retData.code))
        return retData.getDataAndFree()
    }

    /**
     * Obtains the array of character strings corresponding to a specified resource object.
     *
     * @param { AppResource } resource - Indicates the resource object.
     * @returns { Array<String> } The array of character strings corresponding to the specified resource object.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: Incorrect parameter types.
     * @throws { BusinessException } 9001001 - Invalid resource ID.
     * @throws { BusinessException } 9001002 - No matching resource is found based on the resource ID.
     * @throws { BusinessException } 9001006 - The resource is referenced cyclically.
     * @relation getStringArrayValueSync(resource: Resource): Array<string>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getStringArrayValue(resource: AppResource): Array<String> {
        let cResource = CResource(resource)
        let retData = unsafe { CJ_GetStringArrayValueByResource(getID(), cResource) }
        cResource.free()
        throwIfNotSuccess(retData.code, getErrorMsg(retData.code))
        return retData.getDataAndFree()
    }

    /**
     * Obtains the array of character strings corresponding to a specified resource name.
     *
     * @param { String } resName - Indicates the resource name.
     * @returns { Array<String> } the array of character strings corresponding to the specified resource name.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: Incorrect parameter types.
     * @throws { BusinessException } 9001003 - Invalid resource name.
     * @throws { BusinessException } 9001004 - No matching resource is found based on the resource name.
     * @throws { BusinessException } 9001006 - The resource is referenced cyclically.
     * @relation getStringArrayByNameSync(resName: string): Array<string>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getStringArrayByName(resName: String): Array<String> {
        unsafe {
            let cName = LibC.mallocCString(resName)
            let retData = CJ_GetStringArrayByName(getID(), cName)
            LibC.free(cName)
            throwIfNotSuccess(retData.code, getErrorMsg(retData.code))
            return retData.getDataAndFree()
        }
    }

    /**
     * Obtains string resources associated with a specified resource ID.
     *
     * @param { UInt32 } resId - Indicates the resource ID.
     * @returns { String } The character string corresponding to the resource ID.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws IllegalMemoryException - Out of memory.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: Incorrect parameter types.
     * @throws { BusinessException } 9001001 - Invalid resource ID.
     * @throws { BusinessException } 9001002 - No matching resource is found based on the resource ID.
     * @throws { BusinessException } 9001006 - The resource is referenced cyclically.
     * @relation getStringSync(resId: number): string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getString(resId: UInt32): String {
        let retData = unsafe { CJ_GetString(getID(), resId) }
        throwIfNotSuccess(retData.code, getErrorMsg(retData.code))
        throwIfNull(retData.data)
        let ret = retData.data.toString()
        unsafe { LibC.free(retData.data) }
        return ret
    }

    /**
     * Obtains string resources associated with a specified resource ID formated by args.
     *
     * @param { UInt32 } resId - Indicates the resource ID.
     * @param { Array<FormatArgs> } args - Indicates the formatting string resource parameters.
     * @returns { String } The character string corresponding to the resource ID.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid.
     * @throws { BusinessException } 9001001 - Invalid resource ID.
     * @throws { BusinessException } 9001002 - No matching resource is found based on the resource ID.
     * @throws { BusinessException } 9001006 - The resource is referenced cyclically.
     * @throws { BusinessException } 9001007 - Failed to format the resource obtained based on the resource ID.
     * @relation getStringSync(resId: number, ...args: Array<string | number>): string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getString(resId: UInt32, args: Array<FormatArgs>): String {
        return formatString(getString(resId), args)
    }

    /**
     * Obtains string resources associated with a specified resource object.
     *
     * @param { AppResource } resource - Indicates the resource object.
     * @returns { String } The character string corresponding to the resource object.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: Incorrect parameter types.
     * @throws { BusinessException } 9001001 - Invalid resource ID.
     * @throws { BusinessException } 9001002 - No matching resource is found based on the resource ID.
     * @throws { BusinessException } 9001006 - The resource is referenced cyclically.
     * @relation getStringSync(resource: Resource): string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getString(resource: AppResource): String {
        let cResource = CResource(resource)
        let retData = unsafe { CJ_GetStringByResource(getID(), cResource) }
        cResource.free()
        throwIfNotSuccess(retData.code, getErrorMsg(retData.code))
        let ret = retData.data.toString()
        unsafe { LibC.free(retData.data) }
        return ret
    }
    /**
     * Obtains string resources associated with a specified resource object formated by args.
     *
     * @param { AppResource } resource - Indicates the resource object.
     * @returns { String } The character string corresponding to the resource object.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: Incorrect parameter types.
     * @throws { BusinessException } 9001001 - Invalid resource ID.
     * @throws { BusinessException } 9001002 - No matching resource is found based on the resource ID.
     * @throws { BusinessException } 9001006 - The resource is referenced cyclically.
     * @throws { BusinessException } 9001007 - Failed to format the resource obtained based on the resource ID.
     * @relation getStringSync(resource: Resource, ...args: Array<string | number>): string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getString(resource: AppResource, args: Array<FormatArgs>): String {
        return formatString(getString(resource), args)
    }

    /**
     * Obtains string resources associated with a specified resource name.
     *
     * @param { String } resName - Indicates the resource name.
     * @returns { String } The character string corresponding to the resource name.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: Incorrect parameter types.
     * @throws { BusinessException } 9001003 - Invalid resource name.
     * @throws { BusinessException } 9001004 - No matching resource is found based on the resource name.
     * @throws { BusinessException } 9001006 - The resource is referenced cyclically.
     * @relation getStringByNameSync(resName: string): string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getStringByName(resName: String): String {
        unsafe {
            let cName = LibC.mallocCString(resName)
            let retData = CJ_GetStringByName(getID(), cName)
            LibC.free(cName)
            throwIfNotSuccess(retData.code, getErrorMsg(retData.code))
            let ret = retData.data.toString()
            LibC.free(retData.data)
            return ret
        }
    }

    /**
     * Obtains string resources associated with a specified resource name formated by args.
     *
     * @param { String } resName - Indicates the resource name.
     * @returns { String } The character string corresponding to the resource name.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: Incorrect parameter types.
     * @throws { BusinessException } 9001003 - Invalid resource name.
     * @throws { BusinessException } 9001004 - No matching resource is found based on the resource name.
     * @throws { BusinessException } 9001006 - The resource is referenced cyclically.
     * @throws { BusinessException } 9001008 - Failed to format the resource obtained based on the resource Name.
     * @relation getStringByNameSync(resName: string, ...args: Array<string | number>): string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getStringByName(resName: String, args: Array<FormatArgs>): String {
        return formatString(getStringByName(resName), args)
    }

    /**
     * Obtains the device configuration.
     *
     * @throws IllegalStateException - If the instance id invallid.
     * @returns { Configuration } the device configuration.
     * @relation getConfigurationSync(): Configuration
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getConfiguration(): Configuration {
        unsafe {
            var cfg = RetConfigurationEx(0, 0, 0, 0, 0, 0, CString(CPointer<UInt8>()))
            let retCode = FfiResMgrGetConfiguration(getID(), inout cfg)
            let configuration = cfg.toConfiguration()
            LibC.free(cfg.locale)
            throwIfNotSuccess(retCode, getErrorMsg(retCode))
            return configuration
        }
    }

    /**
     * Obtains the device capability.
     *
     * @throws IllegalStateException - If the instance id invallid.
     * @returns { DeviceCapability } the device capability.
     * @relation getDeviceCapabilitySync(): DeviceCapability
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getDeviceCapability(): DeviceCapability {
        var deviceCapability = RetDeviceCapability(0, 0)
        let retCode = unsafe { CJ_GetDeviceCapability(getID(), inout deviceCapability) }
        let result = deviceCapability.toDeviceCapability()
        throwIfNotSuccess(retCode, getErrorMsg(retCode))
        return result
    }

    /**
     * Obtains the DrawableDescriptor of the media file corresponding to a specified resource ID.
     *
     * @param { UInt32 } resId - Indicates the resource ID.
     * @param { UInt32 } density - The optional parameter ScreenDensity{@link ScreenDensity}, A value of 0 means
     *                to use the density of current system dpi.
     * @returns { DrawableDescriptor } The DrawableDescriptor class to get drawable image.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: 1.Incorrect parameter types; 2.Parameter verification failed.
     * @throws { BusinessException } 9001001 - Invalid resource ID.
     * @throws { BusinessException } 9001002 - No matching resource is found based on the resource ID.
     * @relation getDrawableDescriptor(resId: number, density?: number, type?: number): DrawableDescriptor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getDrawableDescriptor(resId: UInt32, density!: UInt32 = 0): DrawableDescriptor {
        let retData = unsafe { CJ_GetDrawableDescriptor(getID(), resId, density) }
        throwIfNotSuccess(retData.code, getErrorMsg(retData.code))
        return DrawableDescriptor(retData.data)
    }

    /**
     * Obtains the DrawableDescriptor of the media file corresponding to a specified resource.
     *
     * @param { AppResource } resource - Indicates the resource object.
     * @param { UInt32 } density - The optional parameter ScreenDensity{@link ScreenDensity}, A value of 0 means
     *             to use the density of current system dpi.
     * @returns { DrawableDescriptor } The DrawableDescriptor class to get drawable image.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid.
     * @throws { BusinessException } 9001001 - Invalid resource ID.
     * @throws { BusinessException } 9001002 - No matching resource is found based on the resource ID.
     * @relation getDrawableDescriptor(resource: Resource, density?: number, type?: number): DrawableDescriptor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getDrawableDescriptor(resource: AppResource, density!: UInt32 = 0): DrawableDescriptor {
        let cResource = CResource(resource)
        let retData = unsafe { CJ_GetDrawableDescriptorByResource(getID(), cResource, density) }
        cResource.free()
        throwIfNotSuccess(retData.code, getErrorMsg(retData.code))
        return DrawableDescriptor(retData.data)
    }

    /**
     * Obtains the DrawableDescriptor of the media file corresponding to a specified resource Name.
     *
     * @param { String } resName - Indicates the resource name.
     * @param { UInt32 } density - The optional parameter ScreenDensity{@link ScreenDensity}, A value of 0 means
     *             to use the density of current system dpi.
     * @returns { DrawableDescriptor } The DrawableDescriptor class to get drawable image.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: 1.Incorrect parameter types; 2.Parameter verification failed.
     * @throws { BusinessException } 9001003 - Invalid resource name.
     * @throws { BusinessException } 9001004 - No matching resource is found based on the resource name.
     * @relation getDrawableDescriptorByName(resName: string, density?: number, type?: number): DrawableDescriptor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getDrawableDescriptorByName(resName: String, density!: UInt32 = 0): DrawableDescriptor {
        unsafe {
            let cName = LibC.mallocCString(resName)
            let retData = CJ_GetDrawableDescriptorByName(getID(), cName, density)
            LibC.free(cName)
            throwIfNotSuccess(retData.code, getErrorMsg(retData.code))
            return DrawableDescriptor(retData.data)
        }
    }

    /**
     * Add overlay resources during application runtime.
     *
     * @param { String } resName - Resource path.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 9001010 - Invalid overlay path.
     * @relation addResource(path: string): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func addResource(path: String): Unit {
        unsafe {
            let cPath = LibC.mallocCString(path)
            let retCode = CJ_AddResource(getID(), cPath)
            LibC.free(cPath)
            throwIfNotSuccess(retCode, getErrorMsg(retCode))
        }
    }

    /**
     * Remove overlay resources during application runtime.
     *
     * @param { String } resName - Resource path.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 9001010 - Invalid overlay path.
     * @relation removeResource(path: string): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func removeResource(path: String): Unit {
        unsafe {
            let cPath = LibC.mallocCString(path)
            let retCode = CJ_RemoveResource(getID(), cPath)
            LibC.free(cPath)
            throwIfNotSuccess(retCode, getErrorMsg(retCode))
        }
    }

    /**
     * Obtains locales list.
     *
     * @param { Bool } includeSystem - the parameter controls whether to include system resources,
     *     the default value is false, it has no effect when only system resources query the locales list.
     * @returns { Array<String> } the list of strings for the locales.
     * @throws IllegalStateException - If the instance id invallid.
     * @throws { BusinessException } 401 - If the input parameter invalid. Possible causes: Incorrect parameter types.
     * @relation getLocales(includeSystem?: boolean): Array<string>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getLocales(includeSystem!: Bool = false): Array<String> {
        let retData = unsafe { CJ_GetLocales(getID(), includeSystem) }
        throwIfNotSuccess(retData.code, getErrorMsg(retData.code))
        return retData.getDataAndFree()
    }
}

/**
 * Generates resource. Exposed due to macro using.
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.ResourceManager"
]
public func __GenerateResource__(
    bundleName: String,
    moudleType: String,
    moduleName: String,
    resId: Int32,
    resStr: String,
    params: Array<Any>,
    resType: Int32
): AppResource {
    if (moudleType == HAR_TYPE) {
        let paramsArr: ArrayList<Any> = ArrayList<Any>([resStr])
        paramsArr.add(all: params)
        return AppResource(DEFAULT_HAR_BUNDLE_NAME, DEFAULT_HAR_MODULE_NAME, 0, params: paramsArr.toArray(),
            resType: resType)
    } else if (resType == RAWFILE_TYPE) {
        return AppResource(bundleName, moduleName, resId, params: [resStr], resType: resType)
    } else {
        return AppResource(bundleName, moduleName, resId, params: params, resType: resType)
    }
}