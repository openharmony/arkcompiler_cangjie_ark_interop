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

package ohos.file_fileuri

import ohos.ffi.*
import ohos.hilog.*
import ohos.base.*
import ohos.labels.*

foreign func FfiOHOSFILEUriCreateUri(uriOrPath: CString): Int64

foreign func FfiOHOSFILEUriGetPath(id: Int64): CString

foreign func FfiOHOSFILEUriGetName(id: Int64): CString

foreign func FfiOHOSFILEUriToString(id: Int64): CString

foreign func FfiOHOSFILEUriGetUriFromPath(cPath: CString): CString

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.AppFileService"
]
public class FileUri <: RemoteDataLite & ToString {

    /**
     * Constructor for obtaining the instance of the FileUri class.
     *
     * @param { String } uriOrPath - Uri or Path.
     * @since 10
     * @brief constructor(uriOrPath: string)
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.AppFileService"
    ]
    public init(uriOrPath: String) {
        super(
            unsafe {
                if (uriOrPath == "") {
                    Hilog.error(0xD003900, "File-FileUir", "Invalid argument")
                    throw BusinessException(13900020, "Invalid argument")
                }
                let uriCString = LibC.mallocCString(uriOrPath)
                let id = FfiOHOSFILEUriCreateUri(uriCString)
                LibC.free(uriCString)
                if (id < 0) {
                    Hilog.error(0xD003900, "File-FileUir", "Out of memory")
                    throw BusinessException(13900011, "Out of memory")
                }
                id
            })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Obtains the file path of uri.
     *
     * @type { String }
     * @readonly
     * @brief readonly path: string
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.AppFileService"
    ]
    public prop path: String {
        get() {
            unsafe {
                let cPath = FfiOHOSFILEUriGetPath(getID())
                let resultPath = cPath.toString()
                LibC.free(cPath)
                return resultPath
            }
        }
    }

    /**
     * Obtains the file name of uri.
     *
     * @type { String }
     * @readonly
     * @brief readonly name: string
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.AppFileService"
    ]
    public prop name: String {
        get() {
            unsafe {
                let cName = FfiOHOSFILEUriGetName(getID())
                let resultName = cName.toString()
                LibC.free(cName)
                return resultName
            }
        }
    }

    /**
     * Get the uri string
     *
     * @returns { string } Return the file uri string
     * @brief toString(): string
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.AppFileService"
    ]
    public func toString(): String {
        unsafe {
            let cStr = FfiOHOSFILEUriToString(getID())
            let str = cStr.toString()
            LibC.free(cStr)
            return str
        }
    }

    /**
     * Get the uri from the path of file in app sandbox
     *
     * @param { string } path the path of file in app sandbox
     * @returns { string } Return the file uri
     * @brief getUriFromPath(path: string): string
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.AppFileService"
    ]
    public static func getUriFromPath(path: String): String {
        if (path == "") {
            Hilog.error(0xD003900, "File-FileUir", "The input parameter is invalid")
            throw BusinessException(ERR_PARAMETER_ERROR, "The input parameter is invalid")
        }
        unsafe {
            let cPath = LibC.mallocCString(path)
            let cUri = FfiOHOSFILEUriGetUriFromPath(cPath)
            LibC.free(cPath)
            let str = cUri.toString()
            LibC.free(cUri)
            return str
        }
    }
}
