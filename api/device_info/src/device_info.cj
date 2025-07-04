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

package ohos.device_info

import ohos.labels.*

foreign {
    func FfiOHOSDeviceInfoGetHardwareProfile(): CString

    func FfiOHOSDeviceInfoDeviceType(): CString

    func FfiOHOSDeviceInfoOsFullName(): CString

    func FfiOHOSDeviceInfoProductModel(): CString

    func FfiOHOSDeviceInfoBrand(): CString

    func FfiOHOSDeviceInfoUdid(): CString

    func FfiOHOSDeviceInfoBuildRootHash(): CString

    func FfiOHOSDeviceInfoBuildTime(): CString

    func FfiOHOSDeviceInfoBuildHost(): CString

    func FfiOHOSDeviceInfoBuildUser(): CString

    func FfiOHOSDeviceInfoBuildType(): CString

    func FfiOHOSDeviceInfoVersionId(): CString

    func FfiOHOSDeviceInfoFirstApiVersion(): Int64

    func FfiOHOSDeviceInfoSdkApiVersion(): Int64

    func FfiOHOSDeviceInfoBuildVersion(): Int64

    func FfiOHOSDeviceInfoFeatureVersion(): Int64

    func FfiOHOSDeviceInfoSeniorVersion(): Int64

    func FfiOHOSDeviceInfoMajorVersion(): Int64

    func FfiOHOSDeviceInfoDisplayVersion(): CString

    func FfiOHOSDeviceInfoSerial(): CString

    func FfiOHOSDeviceInfoOsReleaseType(): CString

    func FfiOHOSDeviceInfoIncrementalVersion(): CString

    func FfiOHOSDeviceInfoSecurityPatchTag(): CString

    func FfiOHOSDeviceInfoAbiList(): CString

    func FfiOHOSDeviceInfoBootloaderVersion(): CString

    func FfiOHOSDeviceInfoHardwareModel(): CString

    func FfiOHOSDeviceInfoSoftwareModel(): CString

    func FfiOHOSDeviceInfoProductSeries(): CString

    func FfiOHOSDeviceInfoManufacture(): CString

    func FfiOHOSDeviceInfoMarketName(): CString

    func FfiOHOSDeviceInfoDistributionOSName(): CString

    func FfiOHOSDeviceInfoDistributionOSVersion(): CString

    func FfiOHOSDeviceInfoDistributionOSApiVersion(): Int64

    func FfiOHOSDeviceInfoDistributionOSReleaseType(): CString

    func FfiOHOSDeviceInfoDevOdid(): CString

    func FfiOHOSDeviceInfoDistributionOSApiName(): CString
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Startup.SystemInfo"
]
public class DeviceInfo {
    @!APILevel[
        12,
        deprecated: 9,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop hardwareProfile: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoGetHardwareProfile() }
            cValue.toString()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop deviceType: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoDeviceType() }
            cValue.toString()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop osFullName: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoOsFullName() }
            cValue.toString()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop productModel: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoProductModel() }
            cValue.toString()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop brand: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoBrand() }
            cValue.toString()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        permission: "ohos.permission.sec_ACCESS_UDID",
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop udid: String {
        get() {
            let cValue = unsafe { FfiOHOSDeviceInfoUdid() }
            let value = cValue.toString()
            unsafe { LibC.free(cValue) }
            return value
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop buildRootHash: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoBuildRootHash() }
            cValue.toString()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop buildTime: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoBuildTime() }
            cValue.toString()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop buildHost: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoBuildHost() }
            cValue.toString()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop buildUser: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoBuildUser() }
            cValue.toString()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop buildType: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoBuildType() }
            cValue.toString()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop versionId: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoVersionId() }
            cValue.toString()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop firstApiVersion: Int64 {
        get() {
            unsafe { FfiOHOSDeviceInfoFirstApiVersion() }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop sdkApiVersion: Int64 {
        get() {
            unsafe { FfiOHOSDeviceInfoSdkApiVersion() }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop buildVersion: Int64 {
        get() {
            unsafe { FfiOHOSDeviceInfoBuildVersion() }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop featureVersion: Int64 {
        get() {
            unsafe { FfiOHOSDeviceInfoFeatureVersion() }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop seniorVersion: Int64 {
        get() {
            unsafe { FfiOHOSDeviceInfoSeniorVersion() }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop majorVersion: Int64 {
        get() {
            unsafe { FfiOHOSDeviceInfoMajorVersion() }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop displayVersion: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoDisplayVersion() }
            cValue.toString()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        permission: "ohos.permission.sec_ACCESS_UDID",
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop serial: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoSerial() }
            cValue.toString()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop osReleaseType: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoOsReleaseType() }
            cValue.toString()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop incrementalVersion: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoIncrementalVersion() }
            cValue.toString()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop securityPatchTag: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoSecurityPatchTag() }
            cValue.toString()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop abiList: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoAbiList() }
            cValue.toString()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop bootloaderVersion: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoBootloaderVersion() }
            cValue.toString()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop hardwareModel: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoHardwareModel() }
            cValue.toString()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop softwareModel: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoSoftwareModel() }
            cValue.toString()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop productSeries: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoProductSeries() }
            cValue.toString()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop marketName: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoMarketName() }
            cValue.toString()
        }
    }

    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop manufacture: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoManufacture() }
            cValue.toString()
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop distributionOSName: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoDistributionOSName() }
            cValue.toString()
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop distributionOSVersion: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoDistributionOSVersion() }
            cValue.toString()
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop distributionOSApiVersion: Int64 {
        get() {
            unsafe { FfiOHOSDeviceInfoDistributionOSApiVersion() }
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop distributionOSReleaseType: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoDistributionOSReleaseType() }
            cValue.toString()
        }
    }

    /**
     * Open Device Identifier (ODID): a developer-level non-permanent device identifier.
     * A developer can be an enterprise or individual developer.
     * Example: dff3cdfd-7beb-1e7d-fdf7-1dbfddd7d30c
     *
     * @relation const ODID: string
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop ODID: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoDevOdid() }
            cValue.toString()
        }
    }

    /**
     * Obtains the Distribution OS api name.
     * <p>Independent Software Vendor (ISV) may distribute OHOS with their own OS api name.
     * distributionOSApiName will return the ISV OS api name
     *
     * @relation const distributionOSApiName: string
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Startup.SystemInfo"
    ]
    public static prop distributionOSApiName: String {
        get() {
            // cValue is local static variable from native, no need to free.
            let cValue = unsafe { FfiOHOSDeviceInfoDistributionOSApiName() }
            cValue.toString()
        }
    }
}
