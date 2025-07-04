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

package ohos.image

import std.collection.HashMap
import ohos.base.*
import ohos.ffi.*

let ERRCODE_MAP = HashMap<UInt32, String>(
    [
        (501, "Resource unavailable."),
        (62980096, "Transaction operation failed."),
        (62980097, "Rpc error."),
        (62980098, "Shared memory does not exist."),
        (62980099, "Shared memory data abnormal."),
        (62980100, "Image decoding abnormal."),
        (62980101, "The image data is abnormal."),
        (62980102, "Image malloc abnormal."),
        (62980103, "Image types are not supported."),
        (62980104, "Image initialization abnormal."),
        (62980105, "Image get data abnormal."),
        (62980106, "The image data is too large."),
        (62980107, "Image conversion abnormal."),
        (62980108, "Image color conversion is abnormal."),
        (62980109, "Cropping exceptions."),
        (62980110, "The image source data is abnormal."),
        (62980111, "The image source data incomplete."),
        (62980112, "The image format does not match."),
        (62980113, "Image unknown format."),
        (62980114, "Image source not parsed."),
        (62980115, "Invalid image parameter."),
        (62980116, "Decoding failed."),
        (62980117, "Failed to register plugin."),
        (62980118, "Failed to create plugin."),
        (62980119, "Image encoding failed."),
        (62980120, "Image addition pixel mapping failed."),
        (62980121, "Image hardware decoding is not supported."),
        (62980122, "Decoding image header abnormal."),
        (62980123, "Image decoding exif support."),
        (62980124, "The image property does not exist."),
        (62980133, "The EXIF data is out of range."),
        (62980135, "The EXIF value is invalid."),
        (62980137, "Invalid media operation."),
        (62980146, "The EXIF data failed to be written to the file."),
        (62980149, "Invalid MIME type for the image source."),
        (62980172, "Failed to encode icc."),
        (62980173, "The DMA memory does not exist."),
        (62980174, "The DMA memory data is abnormal."),
        (62980177, "Abnormal API environment."),
        (62980178, "Failed to create the PixelMap."),
        (62980179, "Abnormal buffer size."),
        (62980180, "FD mapping failed."),
        (62980246, "Failed to read pixel map."),
        (62980247, "Writing to pixel mapping failed."),
        (62980248, "PixelMap does not allow modification."),
        (62980252, "Failed to create surface."),
        (62980259, "Configuration error."),
        (62980274, "The conversion failed."),
        (62980276, "The type to be converted is an unsupported target pixel format."),
        (62980286, "Memory format not supported."),
        (62980302, "Memory copy failed."),
        (7600201, "Unsupported operation."),
        (7600202, "Unsupported metadata. Possible causes: Unsupported metadata type."),
        (7600301, "Memory alloc failed."),
        (7600302, "Memory copy failed."),
        (7600901, "Unknown error."),
        (7700101, "Bad source."),
        (7700102, "Unsupported mimetype."),
        (7700103, "Image too large."),
        (7700201,
            "Unsupported allocator type, e.g., use share memory to decode a HDR image as only DMA supported hdr metadata."),
        (7700203, "Unsupported options, e.g, cannot convert image into desired pixel format."),
        (7700301, "Decode failed."),
        (7700302, "Memory allocation failed."),
        (7800201, "Unsupported options."),
        (7800301, "Encode failed.")
    ]
)

func checkRet(errCode: UInt32, message: String, handle!: () -> Unit = {=>}): Unit {
    if (errCode != 0) {
        let msg = if (let Some(errMsg) <- ERRCODE_MAP.get(errCode)) {
            message + " " + errMsg
        } else {
            message + " Unrecognized error code"
        }
        handle()
        throw BusinessException(Int32(errCode), msg)
    }
}

//This function is used in API20 and later versions so that error code 401 is not used.
func checkRetFor20(errCode: UInt32, message!: ?String = None): Unit {
    let newErrCode = convertErrCode(errCode)
    if (newErrCode != 0) {
        let msg = if (let Some(errMsg) <- ERRCODE_MAP.get(newErrCode)) {
            message ?? "" + errMsg
        } else {
            message ?? "" + "Unrecognized error code"
        }
        throw BusinessException(Int32(newErrCode), msg)
    }
}

const OLD_INVALID_PARAMETER: UInt32 = 401
const NEW_INVALID_PARAMETER: UInt32 = 62980115

func convertErrCode(errCode: UInt32): UInt32 {
    if (errCode == OLD_INVALID_PARAMETER) {
        return NEW_INVALID_PARAMETER
    }
    return errCode
}
