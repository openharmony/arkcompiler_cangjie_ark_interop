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

package ohos.unifiedDataChannel

import ohos.image.*
import ohos.ffi.*
import ohos.base.*
import ohos.labels.*

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
]
public enum ShareOptions {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    IN_APP
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    CROSS_APP
    | ...
}

public type GetDelayData = (dtype: String) -> UnifiedData

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
]
public enum ValueType {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    INTEGER32(Int32)
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    INTEGER64(Int64)
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    DOUBLE(Float64)
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    BOOLEAN(Bool)
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    STRING(String)
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    ARRAYBUFFER(Array<UInt8>)
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    PIXELMAP(PixelMap)
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    NULL
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    UNDEFINED
    | ...
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
]
public enum Intention {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    DATA_HUB
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    DRAG
    | ...

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    public func getValue(): String {
        return match (this) {
            case DATA_HUB => "DataHub"
            case DRAG => "Drag"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
]
public class Options {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
    ]
    public Options(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
        ]
        public var intention!: Intention,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.DistributedDataManager.UDMF.Core"
        ]
        public var key!: String
    ) {}
}
