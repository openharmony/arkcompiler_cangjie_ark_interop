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

package ohos_app_cangjie_entry

let _ = testsuite()

func testsuite(): Unit {
    registerTestSuite("testPropertyKeyToString_1", {
        => testPropertyKeyToString_1()
    })
    registerTestSuite("testCreateImageSource_String_1", {
        => testCreateImageSource_String_1()
    })
    registerTestSuite("testCreateImageSource_String_SourceOptions_1",
        {
            => testCreateImageSource_String_SourceOptions_1()
        })
    registerTestSuite("testCreateImageSource_Int32_1", {
        => testCreateImageSource_Int32_1()
    })
    registerTestSuite("testCreateImageSource_Int32_SourceOptions_1", {
        => testCreateImageSource_Int32_SourceOptions_1()
    })
    registerTestSuite("testCreateImageSource_Array_1", {
        => testCreateImageSource_Array_1()
    })
    registerTestSuite("testCreateImageSource_Array_SourceOptions_1", {
        => testCreateImageSource_Array_SourceOptions_1()
    })
    registerTestSuite("testCreateImageSource_RawFileDescriptor_1", {
        => testCreateImageSource_RawFileDescriptor_1()
    })
    registerTestSuite("testCreateImageSource_RawFileDescriptor_SourceOptions_1",
        {
            => testCreateImageSource_RawFileDescriptor_SourceOptions_1()
        })
    registerTestSuite("testImageSource_getImageInfo_1", {
        => testImageSource_getImageInfo_1()
    })
    registerTestSuite("testImageSource_getImageProperty_1", {
        => testImageSource_getImageProperty_1()
    })
    registerTestSuite("testImageSource_modifyImageProperty_1", {
        => testImageSource_modifyImageProperty_1()
    })
    registerTestSuite("testImageSource_getFrameCount_1", {
        => testImageSource_getFrameCount_1()
    })
    registerTestSuite("testImageSource_getDelayTimeList_1", {
        => testImageSource_getDelayTimeList_1()
    })
    registerTestSuite("testImageSource_createPixelMap_1", {
        => testImageSource_createPixelMap_1()
    })
    registerTestSuite("testImageSource_createPixelMap_DecodingOptions_1",
        {
            => testImageSource_createPixelMap_DecodingOptions_1()
        })
    registerTestSuite("testImageSource_createPixelMapList_1", {
        => testImageSource_createPixelMapList_1()
    })
    registerTestSuite("testImageSource_createPixelMapList_DecodingOptions_1",
        {
            => testImageSource_createPixelMapList_DecodingOptions_1()
        })
    registerTestSuite("testImageSource_updateData_1", {
        => testImageSource_updateData_1()
    })
    registerTestSuite("testImageSource_Release_1", {
        => testImageSource_Release_1()
    })
    registerTestSuite("testImageReceiver_getReceivingSurfaceId_1", {
        => testImageReceiver_getReceivingSurfaceId_1()
    })
    registerTestSuite("testImageReceiver_Release_1", {
        => testImageReceiver_Release_1()
    })
    registerTestSuite("testCreateImagePacker_1", {
        => testCreateImagePacker_1()
    })
    registerTestSuite("testImagePacker_packing_PixelMap_1", {
        => testImagePacker_packing_PixelMap_1()
    })
    registerTestSuite("testImagePacker_packing_ImageSource_1", {
        => testImagePacker_packing_ImageSource_1()
    })
    registerTestSuite("testImagePacker_packToFile_PixelMap_1", {
        => testImagePacker_packToFile_PixelMap_1()
    })
    registerTestSuite("testImagePacker_packToFile_ImageSource_1", {
        => testImagePacker_packToFile_ImageSource_1()
    })
    registerTestSuite("testImagePacker_Release_1", {
        => testImagePacker_Release_1()
    })
    registerTestSuite("testCreatePixelMap_1", {
        => testCreatePixelMap_1()
    })
    registerTestSuite("testPixelMap_getImageInfo_1", {
        => testPixelMap_getImageInfo_1()
    })
    registerTestSuite("testPixelMap_getBytesNumberPerRow_1", {
        => testPixelMap_getBytesNumberPerRow_1()
    })
    registerTestSuite("testPixelMap_getPixelBytesNumber_1", {
        => testPixelMap_getPixelBytesNumber_1()
    })
    registerTestSuite("testPixelMap_Release_1", {
        => testPixelMap_Release_1()
    })
    registerTestSuite("testPixelMap_getDensity_1", {
        => testPixelMap_getDensity_1()
    })
    registerTestSuite("testPixelMap_opacity_1", {
        => testPixelMap_opacity_1()
    })
    registerTestSuite("testPixelMap_scale_1", {
        => testPixelMap_scale_1()
    })
    registerTestSuite("testPixelMap_translate_1", {
        => testPixelMap_translate_1()
    })
    registerTestSuite("testPixelMap_rotate_1", {
        => testPixelMap_rotate_1()
    })
    registerTestSuite("testPixelMap_flip_1", {
        => testPixelMap_flip_1()
    })
    registerTestSuite("testPixelMap_crop_1", {
        => testPixelMap_crop_1()
    })
    registerTestSuite("testPixelMap_createAlphaPixelmap_1", {
        => testPixelMap_createAlphaPixelmap_1()
    })
    registerTestSuite("testPixelMap_applyColorSpace_1", {
        => testPixelMap_applyColorSpace_1()
    })
    registerTestSuite("testPixelMap_readPixelsToBuffer_1", {
        => testPixelMap_readPixelsToBuffer_1()
    })
    registerTestSuite("testPixelMap_readPixels_1", {
        => testPixelMap_readPixels_1()
    })
    registerTestSuite("testPixelMap_writeBufferToPixels_1", {
        => testPixelMap_writeBufferToPixels_1()
    })
    registerTestSuite("testPixelMap_writePixels_1", {
        => testPixelMap_writePixels_1()
    })
}
