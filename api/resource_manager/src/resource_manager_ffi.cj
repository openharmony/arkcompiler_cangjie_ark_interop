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

import ohos.ffi.{RetDataI64, RetDataCArrUI8, RetDataCArrString, RetDataCString}
import ohos.raw_file_descriptor.RetDataRawFileDescriptor
import ohos.resource.CResource

foreign {
    func CJ_GetResourceManagerStageMode(context: StageContext): Int64

    func CJ_GetSystemResMgr(): RetDataI64

    func CJ_CloseRawFd(id: Int64, path: CString): Int32

    func CJ_GetRawFd(id: Int64, rawFileName: CString, fd: CPointer<RetDataRawFileDescriptor>): Int32

    func CJ_GetRawFileContent(id: Int64, path: CString): RetDataCArrUI8

    func CJ_GetRawFileList(id: Int64, path: CString): RetDataCArrString

    func CJ_GetColorByName(id: Int64, name: CString, data: CPointer<UInt32>): Int32

    func CJ_GetColor(id: Int64, resId: UInt32, data: CPointer<UInt32>): Int32

    func CJ_GetColorByResource(id: Int64, resource: CResource, data: CPointer<UInt32>): Int32

    func CJ_GetBoolean(id: Int64, resId: UInt32, data: CPointer<Bool>): Int32

    func CJ_GetBooleanByResource(id: Int64, resource: CResource, data: CPointer<Bool>): Int32

    func CJ_GetBooleanByName(id: Int64, name: CString, data: CPointer<Bool>): Int32

    func CJ_GetNumber(id: Int64, resId: UInt32, data: CPointer<RetGetNumber>): Int32

    func CJ_GetNumberByResource(id: Int64, resource: CResource, data: CPointer<RetGetNumber>): Int32

    func CJ_GetNumberByName(id: Int64, name: CString, data: CPointer<RetGetNumber>): Int32

    func CJ_GetMediaByName(id: Int64, resName: CString, density: UInt32): RetDataCArrUI8

    func CJ_GetMediaContent(id: Int64, resId: UInt32, density: UInt32): RetDataCArrUI8

    func CJ_GetMediaContentByResource(id: Int64, resource: CResource, density: UInt32): RetDataCArrUI8

    func CJ_GetMediaContentBase64(id: Int64, resId: UInt32, density: UInt32): RetDataCString

    func CJ_GetMediaContentBase64ByResource(id: Int64, resource: CResource, density: UInt32): RetDataCString

    func CJ_GetMediaContentBase64ByName(id: Int64, name: CString, density: UInt32): RetDataCString

    func CJ_GetPluralStringValue(id: Int64, resId: UInt32, num: Int64): RetDataCString

    func CJ_GetPluralStringValueByResource(id: Int64, resource: CResource, num: Int64): RetDataCString

    func CJ_GetPluralStringByName(id: Int64, name: CString, num: Int64): RetDataCString

    func CJ_GetStringArrayValue(id: Int64, resId: UInt32): RetDataCArrString

    func CJ_GetStringArrayValueByResource(id: Int64, resource: CResource): RetDataCArrString

    func CJ_GetStringArrayByName(id: Int64, name: CString): RetDataCArrString

    func CJ_GetString(id: Int64, resId: UInt32): RetDataCString

    func CJ_GetStringByResource(id: Int64, resource: CResource): RetDataCString

    func CJ_GetStringByName(id: Int64, name: CString): RetDataCString

    func CJ_AddResource(id: Int64, path: CString): Int32

    func CJ_RemoveResource(id: Int64, path: CString): Int32

    func CJ_GetConfiguration(id: Int64, cfg: CPointer<RetConfiguration>): Int32

    func CJ_GetDeviceCapability(id: Int64, cfg: CPointer<RetDeviceCapability>): Int32

    func CJ_GetDrawableDescriptor(id: Int64, resId: UInt32, density: UInt32): RetDataI64

    func CJ_GetDrawableDescriptorByResource(id: Int64, resId: CResource, density: UInt32): RetDataI64

    func CJ_GetDrawableDescriptorByName(id: Int64, resName: CString, density: UInt32): RetDataI64

    func CJ_GetLocales(id: Int64, includeSystem: Bool): RetDataCArrString

    func CJ_GetSymbol(id: Int64, resId: UInt32): RetDataU32

    func CJ_GetSymbolByResource(id: Int64, resource: CResource): RetDataU32

    func CJ_GetSymbolByName(id: Int64, name: CString): RetDataU32

    func FfiResMgrGetConfiguration(id: Int64, cfg: CPointer<RetConfigurationEx>): Int32

    func FfiResMgrGetOverrideConfiguration(id: Int64, cfg: CPointer<RetConfigurationEx>): Int32

    func FfiGetOverrideResMgr(id: Int64, cfg: RetConfigurationEx): RetDataI64

    func FfiResMgrFreeConfiguration(cfg: CPointer<RetConfigurationEx>): Unit
}

@C
struct RetDeviceCapability {
    RetDeviceCapability(
        let screenDensity: Int32,
        let deviceType: Int32
    ) {}

    func toDeviceCapability(): DeviceCapability {
        DeviceCapability(ScreenDensity.parse(screenDensity), DeviceType.parse(deviceType))
    }
}

@C
struct RetConfiguration {
    RetConfiguration(
        let direction: Int32,
        let locale: CString
    ) {}
}

@C
struct RetConfigurationEx {
    RetConfigurationEx(
        let direction: Int32,
        let deviceType: Int32,
        let screenDensity: Int32,
        let colorMode: Int32,
        let mcc: UInt32,
        let mnc: UInt32,
        let locale: CString
    ) {}

    func toConfiguration(): Configuration {
        Configuration(
            Direction.parse(direction),
            locale.toString()
        )
    }

    func free() {
        unsafe { LibC.free(locale) }
    }
}

@C
struct RetGetNumber {
    RetGetNumber(
        let isInt: Bool,
        let intValue: Int32,
        let floatValue: Float32
    ) {}

    func toNumber(): Number {
        if (isInt) {
            Number.Int32Value(intValue)
        } else {
            Number.Float32Value(floatValue)
        }
    }
}

@C
struct RetDataU32 {
    RetDataU32(
        let code: Int32,
        let data: UInt32
    ) {}
}
