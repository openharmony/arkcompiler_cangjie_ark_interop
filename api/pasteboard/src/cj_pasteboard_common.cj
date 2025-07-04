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

package ohos.pasteboard

import ohos.labels.*
import ohos.ffi.*
import ohos.base.*

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.Pasteboard"
]
public const MIMETYPE_TEXT_HTML: String = "text/html"

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.Pasteboard"
]
public const MIMETYPE_TEXT_WANT: String = "text/want"

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.Pasteboard"
]
public const MIMETYPE_TEXT_PLAIN: String = "text/plain"

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.Pasteboard"
]
public const MIMETYPE_TEXT_URI: String = "text/uri"

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.Pasteboard"
]
public const MIMETYPE_PIXELMAP: String = "pixelMap"

@C
struct CPasteDataProperty {
    CPasteDataProperty(
        var mimeTypes: CArrString,
        var tag: CString,
        var timestamp: Int64,
        var localOnly: Bool,
        var shareOption: Int32
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.Pasteboard"
]
public struct PasteDataProperty {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.Pasteboard"
    ]
    public PasteDataProperty(
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.Pasteboard"
        ]
        public var mimeTypes: Array<String>,
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.Pasteboard"
        ]
        public var tag: String,
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.Pasteboard"
        ]
        public var timestamp: Int64,
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.Pasteboard"
        ]
        public var localOnly!: Bool = false,
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.Pasteboard"
        ]
        public var shareOption!: ShareOption = CROSSDEVICE
    ) {}

    init(pasteDataProperty: CPasteDataProperty) {
        this.tag = pasteDataProperty.tag.toString()
        unsafe { LibC.free(pasteDataProperty.tag) }
        this.timestamp = pasteDataProperty.timestamp
        this.localOnly = pasteDataProperty.localOnly
        this.shareOption = ShareOption.parse(pasteDataProperty.shareOption)
        let pPtr = pasteDataProperty.mimeTypes.head
        let pSize = pasteDataProperty.mimeTypes.size
        unsafe {
            this.mimeTypes = Array<String>(
                pSize,
                {
                    i =>
                    let cString = pPtr.read(i)
                    let mimeTypes = cString.toString()
                    LibC.free(cString)
                    mimeTypes
                }
            )
            LibC.free<CString>(pPtr)
        }
    }
}
