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

package ohos.crypto

import ohos.labels.*
import ohos.ffi.*
import ohos.base.*

foreign {
    func FFiOHOSECCKeyUtilGenECCCommonParamsSpec(curveName: CString, errCode: CPointer<Int32>): CPointer<HcfEccCommParamsSpec>

    func FFiOHOSECCKeyUtilConvertPoint(curveName: CString, encodedPoint: HcfBlob, errCode: CPointer<Int32>): HcfPoint

    func FFiOHOSECCKeyUtilGetEncodedPoint(curveName: CString, point: HcfPoint, format: CString, errCode: CPointer<Int32>): HcfBlob
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
]
public class ECCKeyUtil {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public static func genECCCommonParamsSpec(curveName: String): ECCCommonParamsSpec {
        unsafe {
            let cstr: CString = LibC.mallocCString(curveName)
            var errCode = 0i32
            let res: CPointer<HcfEccCommParamsSpec> = FFiOHOSECCKeyUtilGenECCCommonParamsSpec(cstr, inout errCode)
            LibC.free(cstr)
            checkRet(errCode, "[ECCKeyUtil] genECCCommonParamsSpec: ")
            let spec: ECCCommonParamsSpec = ECCCommonParamsSpec(res.read())
            res.read().free()
            LibC.free(res)
            return spec
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public static func convertPoint(curveName: String, encodedPoint: Array<UInt8>): Point {
        unsafe {
            let cstr: CString = LibC.mallocCString(curveName)
            let blob: HcfBlob = try {
                HcfBlob(DataBlob(encodedPoint))
            } catch (e: Exception) {
                LibC.free(cstr)
                throw e
            }
            var errCode = 0i32
            let returnPoint: HcfPoint = FFiOHOSECCKeyUtilConvertPoint(cstr, blob, inout errCode)
            LibC.free(cstr)
            blob.free()
            checkRet(errCode, "[ECCKeyUtil] convertPoint: ")
            let point: Point = returnPoint.toPoint()
            returnPoint.free()
            return point
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.CryptoFramework.Key.AsymKey"
    ]
    public static func getEncodedPoint(curveName: String, point: Point, format: String): Array<UInt8> {
        unsafe {
            try (
                cName = LibC.mallocCString(curveName).asResource(),
                cFormat = LibC.mallocCString(format).asResource()
            ) {
                var errCode = 0i32
                let cPoint: HcfPoint = HcfPoint(point)
                let returnBlob: HcfBlob = FFiOHOSECCKeyUtilGetEncodedPoint(cName.value, cPoint, cFormat.value,
                    inout errCode)
                cPoint.free()
                checkRet(errCode, "[ECCKeyUtil] getEncodedPoint: ")
                let blob: DataBlob = returnBlob.toDataBlob()
                returnBlob.free()
                return blob.data
            }
            throw BusinessException(0, "[ECCKeyUtil] getEncodedPoint: unreachable branch.")
        }
    }
}
