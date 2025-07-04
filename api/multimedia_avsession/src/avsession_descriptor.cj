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

package ohos.multimedia_avsession

import std.collection.*
import std.deriving.*
import ohos.ffi.*
import ohos.labels.*

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.Core"
]
public class DeviceInfo {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public DeviceInfo(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var castCategory: AVCastCategory,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var deviceId: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var deviceName: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var deviceType: DeviceType,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var supportedProtocols: ?Array<ProtocolType>,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var supportedDrmCapabilities: ?Array<String>
    ) {}

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public init(castCategory: AVCastCategory, deviceId: String, deviceName: String, deviceType: DeviceType) {
        this.castCategory = castCategory
        this.deviceId = deviceId
        this.deviceName = deviceName
        this.deviceType = deviceType
        this.supportedProtocols = None
        this.supportedDrmCapabilities = None
    }
}

@C
protected struct CDeviceInfo {
    private var castCategory_: Int32
    private var deviceType_: Int32
    private var deviceId_: CString
    private var deviceName_: CString
    private var supportedProtocols_: Int32 //ProtocolType = TYPE_LOCAL
    private var supportedDrmCapabilities_: CStringArr

    protected init(deviceInfo: DeviceInfo) {
        this(deviceInfo.castCategory, deviceInfo.deviceId, deviceInfo.deviceName, deviceInfo.deviceType,
            deviceInfo.supportedProtocols, deviceInfo.supportedDrmCapabilities)
    }

    protected init(
        castCategory: AVCastCategory,
        deviceId: String,
        deviceName: String,
        deviceType: DeviceType,
        supportedProtocols: ?Array<ProtocolType>,
        supportedDrmCapabilities: ?Array<String>
    ) {
        castCategory_ = castCategory.value
        deviceId_ = CString(CPointer())
        deviceName_ = CString(CPointer())
        deviceType_ = deviceType.value
        supportedProtocols_ = protocolArrayToNumber(supportedProtocols ?? [ProtocolType.TYPE_LOCAL])
        supportedDrmCapabilities_ = CStringArr(supportedDrmCapabilities ?? Array<String>())
        unsafe {
            try {
                deviceId_ = LibC.mallocCString(deviceId)
                deviceName_ = LibC.mallocCString(deviceName)
            } catch (e: Exception) {
                free()
                throw e
            }
        }
    }

    private static func protocolArrayToNumber(arr: Array<ProtocolType>): Int32 {
        var result: Int32 = 0
        for (num in arr) {
            result += num.value
        }
        result
    }

    private static func numberToProtocolArray(number: Int32): Array<ProtocolType> {
        let arr = ArrayList<ProtocolType>()
        arr.add(ProtocolType.TYPE_LOCAL)
        if ((ProtocolType.TYPE_CAST_PLUS_STREAM.value & number) != 0) {
            arr.add(ProtocolType.TYPE_CAST_PLUS_STREAM)
        }
        if ((ProtocolType.TYPE_DLNA.value & number) != 0) {
            arr.add(ProtocolType.TYPE_DLNA)
        }
        arr.toArray()
    }

    protected prop castCategory: AVCastCategory {
        get() {
            AVCastCategory.parse(castCategory_)
        }
    }

    protected prop deviceId: String {
        get() {
            deviceId_.toString()
        }
    }

    protected prop deviceName: String {
        get() {
            deviceName_.toString()
        }
    }

    protected prop deviceType: DeviceType {
        get() {
            DeviceType.parse(deviceType_)
        }
    }

    protected mut prop supportedProtocols: Int32 {
        get() {
            supportedProtocols_
        }
        set(value) {
            supportedProtocols_ = value
        }
    }

    protected mut prop supportedDrmCapabilities: Array<String> {
        get() {
            supportedDrmCapabilities_.toArray()
        }
        set(value) {
            supportedDrmCapabilities_ = CStringArr(value)
        }
    }

    protected func toCJObject(): DeviceInfo {
        DeviceInfo(this.castCategory, this.deviceId, this.deviceName, this.deviceType,
            numberToProtocolArray(this.supportedProtocols), this.supportedDrmCapabilities)
    }

    protected func free() {
        unsafe {
            LibC.free(deviceId_)
            LibC.free(deviceName_)
        }
    }
}

@C
protected struct CDeviceInfotArr {
    protected let head: CPointer<CDeviceInfo>
    protected let size: Int64

    init() {
        head = CPointer<CDeviceInfo>()
        size = 0
    }

    protected init(devices: Array<DeviceInfo>) {
        size = devices.size
        head = unsafe { cjArr2CArr<DeviceInfo, CDeviceInfo>(devices, {i => CDeviceInfo(i)}, {i => i.free()}) }
    }

    protected func toArray(): Array<DeviceInfo> {
        unsafe {
            Array<DeviceInfo>(size, {
                i => head.read(i).toCJObject()
            })
        }
    }

    protected func free() {
        unsafe {
            for (i in 0..size) {
                head.read(i).free()
            }
            LibC.free(head)
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.Core"
]
public class OutputDeviceInfo {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public OutputDeviceInfo(public var devices: Array<DeviceInfo>) {}
}

@C
protected struct COutputDeviceInfo {
    private var devices_: CDeviceInfotArr

    init() {
        devices_ = CDeviceInfotArr()
    }

    protected init(outputDeviceInfo: OutputDeviceInfo) {
        this(outputDeviceInfo.devices)
    }

    protected init(devices: Array<DeviceInfo>) {
        devices_ = CDeviceInfotArr(devices)
    }

    protected prop devices: Array<DeviceInfo> {
        get() {
            devices_.toArray()
        }
    }

    protected func toCJObject(): OutputDeviceInfo {
        OutputDeviceInfo(this.devices)
    }

    protected func free() {
        unsafe {
            devices_.free()
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.Core"
]
public class CastDisplayInfo {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.ExtendedDisplayCast"
    ]
    public CastDisplayInfo(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.ExtendedDisplayCast"
        ]
        public var id: UInt64,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.ExtendedDisplayCast"
        ]
        public var name: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.ExtendedDisplayCast"
        ]
        public var state: CastDisplayState,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.ExtendedDisplayCast"
        ]
        public var width: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.ExtendedDisplayCast"
        ]
        public var height: Int32
    ) {}
}

@C
protected struct CCastDisplayInfo {
    private let id: UInt64
    private let name: CString
    private let displayState: Int32
    private let width: Int32
    private let height: Int32

    protected CCastDisplayInfo(info: CastDisplayInfo) {
        id = info.id
        displayState = info.state.value
        width = info.width
        height = info.height
        unsafe { name = LibC.mallocCString(info.name) }
    }

    protected func toCJObject(): CastDisplayInfo {
        CastDisplayInfo(id, name.toString(), CastDisplayState.parse(displayState), width, height)
    }

    protected func free(): Unit {
        unsafe { LibC.free(name) }
    }
}
