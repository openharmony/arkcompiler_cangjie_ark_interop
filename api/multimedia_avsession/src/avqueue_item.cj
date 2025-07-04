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

import ohos.labels.*

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.Core"
]
public class AVQueueItem {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public AVQueueItem(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var itemId: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var description: ?AVMediaDescription
    ) {}

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public init(itemId: Int32) {
        this.itemId = itemId
        this.description = None
    }

    func isValid(): Bool {
        if (let Some(desc) <- description) {
            desc.isValid()
        } else {
            return false
        }
    }
}

@C
protected struct CAVQueueItem {
    protected var itemId: Int32
    protected var description: CAVMediaDescription

    init() {
        itemId = 0
        description = CAVMediaDescription()
    }
    protected init(item: AVQueueItem) {
        this(item.itemId, item.description)
    }

    protected init(itemId: Int32, description: ?AVMediaDescription) {
        this.itemId = itemId
        this.description = CAVMediaDescription(
            description ?? AVMediaDescription("0", None, None, None, None, None, None, None, None, None, None, None,
                None, None, None, None, None, None, None, None, None, None))
    }

    protected func toCJObjectAndFree(): AVQueueItem {
        AVQueueItem(itemId, description.toCJObjectAndFree())
    }

    protected func toCJObject(): AVQueueItem {
        AVQueueItem(itemId, description.toCJObject())
    }

    protected func free() {
        unsafe {
            description.free()
        }
    }
}
