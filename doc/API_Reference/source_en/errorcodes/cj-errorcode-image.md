# Image Error Codes

> **Note:**
>
> The following describes only the module-specific error codes. For general error codes, please refer to the [Universal Error Code Documentation](cj-errorcode-universal.md).

## 501 Unable to Call Interface

**Error Message**

Resource unavailable.

**Possible Causes**

The image was passed across threads, making the original object unable to call the interface.

**Resolution Steps**

Check the image and re-decode it as instructed.

## 62980096 Operation Failed

**Error Message**

Transaction operation failed.

**Possible Causes**

1. An exception occurred during image upload.
2. Other operations were performed during decoding.
3. Image decoding was not performed as instructed.
4. Insufficient device memory.
5. Decoding library processing failed.

**Resolution Steps**

Check the image and re-decode it as instructed.

## 62980097 Operation Failed

**Error Message**

Rpc error.

**Possible Causes**

1. An exception occurred during image upload.
2. Other operations were performed during decoding.
3. Image decoding was not performed as instructed.
4. Insufficient device memory.

**Resolution Steps**

Check the image and re-decode it as instructed.

## 62980098 Shared Memory Space Error

**Error Message**

Shared memory does not exist.

**Possible Causes**

1. Insufficient memory size.
2. Out-of-bounds access to shared memory.
3. Invalid pointer usage.

**Resolution Steps**

Check memory usage or restart the device.

## 62980099 Shared Memory Data Exception

**Error Message**

Shared memory data abnormal.

**Possible Causes**

1. Synchronization operations were not performed correctly during shared memory read/write.
2. Out-of-bounds access to shared memory.
3. Invalid pointer usage.

**Resolution Steps**

Restart the device.

## 62980100 Image Decoding Error

**Error Message**

Image decoding abnormal.

**Possible Causes**

1. An exception occurred during image upload.
2. Other operations were performed during decoding.
3. Image decoding was not performed as instructed.
4. Insufficient device memory.

**Resolution Steps**

Check the image and re-decode it as instructed.

## 62980101 Image Input Data Error

**Error Message**

The image data is abnormal.

**Possible Causes**

1. Incorrect image input data.
2. Incorrect image format input.
3. Incorrect image size input.

**Resolution Steps**

Re-enter the correct image.

## 62980102 Image Memory Allocation Error

**Error Message**

Image malloc abnormal.

**Possible Causes**

Insufficient device memory or memory is occupied.

**Resolution Steps**

Free up memory and retry.

## 62980103 Unsupported Image Type

**Error Message**

Image types are not supported.

**Possible Causes**

The type of the uploaded image is currently unsupported.

**Resolution Steps**

Retry with a different image type.

## 62980104 Image Initialization Error

**Error Message**

Image initialization abnormal.

**Possible Causes**

1. Unsupported image type.
2. Unsupported image size.
3. An error occurred during initialization.

**Resolution Steps**

Re-enter the correct parameters or replace the image.

## 62980105 Image Data Retrieval Error

**Error Message**

Image get data abnormal.

**Possible Causes**

1. The device does not support the image type.
2. Image data is lost.

**Resolution Steps**

Input a new image or check the image data.

## 62980106 Image Data Too Large

**Error Message**

The image data is too large.

**Possible Causes**

The image size is too large.

**Resolution Steps**

Replace with a smaller image.

## 62980107 Image Conversion Error

**Error Message**

Image conversion abnormal.

**Possible Causes**

1. Image conversion was abnormally terminated.
2. Incorrect encoding parameter settings.

**Resolution Steps**

Replace the image or set supported encoding parameters.

## 62980108 Image Color Conversion Error

**Error Message**

Image color conversion is abnormal.

**Possible Causes**

1. Color conversion for the image type is unsupported.
2. Device malfunction.

**Resolution Steps**

Retry or replace the image type.

## 62980109 Cropping Error

**Error Message**

Cropping exceptions.

**Possible Causes**

1. Incorrect cropping parameter settings.
2. Image data error.

**Resolution Steps**

Check the image data or modify the cropping parameters correctly.

## 62980110 Image Source Data Error

**Error Message**

The image source data is abnormal.

**Possible Causes**

Image data source is missing or corrupted.

**Resolution Steps**

Check the operation steps or replace the image.

## 62980111 Incomplete Image Source Data

**Error Message**

The image source data incomplete.

**Possible Causes**

Image source data is missing.

**Resolution Steps**

Check the operation steps or replace the image.

## 62980112 Image Format Mismatch

**Error Message**

The image format does not match.

**Possible Causes**

The image format does not match.

**Resolution Steps**

Replace with a matching image type.

## 62980113 Unknown Image Format

**Error Message**

Image unknown format.

**Possible Causes**

The image format is unsupported.

**Resolution Steps**

Replace the image.

## 62980114 Image Source Not Parsed

**Error Message**

Image source not parsed.**Possible Causes**

Incorrect image source data.

**Handling Steps**

Check the image source data.

## 62980115 Invalid Image Parameter  

**Error Message**  

Invalid image parameter.  

**Possible Causes**  

Invalid input parameters.  

**Handling Steps**  

Re-enter the correct parameters.  

## 62980116 Decoding Failed  

**Error Message**  

Decoding failed.  

**Possible Causes**  

1. Abnormal termination during the decoding process.  
2. Unsupported image format.  
3. Failed to read the image.  

**Handling Steps**  

Verify if the image was successfully read or replace the image.  

## 62980117 Plugin Registration Failed  

**Error Message**  

Failed to register plugin.  

**Possible Causes**  

1. No matching decoding or encoding plugin for the corresponding format.  
2. Incorrect input data.  

**Handling Steps**  

Replace the image or check the input data.  

## 62980118 Plugin Creation Failed  

**Error Message**  

Failed to create plugin.  

**Possible Causes**  

1. No matching decoding or encoding plugin for the corresponding format.  
2. Incorrect input data.  

**Handling Steps**  

Replace the image or check the input data.  

## 62980119 Image Encoding Failed  

**Error Message**  

Image encoding failed.  

**Possible Causes**  

1. Unsupported encoding format specified.  
2. Incorrect input data.  

**Handling Steps**  

Replace the image or check the input data.  

## 62980120 Pixel Mapping Addition Failed  

**Error Message**  

Image addition pixel mapping failed.  

**Possible Causes**  

1. Pixel mapping addition may not be supported.  
2. Abnormal termination during pixel mapping addition.  

**Handling Steps**  

Check the mapping steps or replace the image.  

## 62980121 Hardware Decoding Not Supported  

**Error Message**  

Image hardware decoding is not supported.  

**Possible Causes**  

Hardware decoding was attempted.  

**Handling Steps**  

Use alternative decoding methods.  

## 62980122 Abnormal Image Header Decoding  

**Error Message**  

Decoding image header abnormal.  

**Possible Causes**  

1. Abnormal termination during header decoding.  
2. The image header does not meet requirements.  

**Handling Steps**  

Replace the image or check the image data.  

## 62980123 EXIF Decoding Not Supported  

**Error Message**  

Image decoding exif support.  

**Possible Causes**  

The image does not support EXIF decoding.  

**Handling Steps**  

Replace the image.  

## 62980124 Image Property Does Not Exist  

**Error Message**  

The image property does not exist.  

**Possible Causes**  

1. Missing image properties.  
2. Unreasonable modifications were made to the image.  

**Handling Steps**  

Replace the image.  

## 62980133 Image Property Assignment Out of Range  

**Error Message**  

The EXIF data is out of range.  

**Possible Causes**  

Image property assignment exceeds valid range.  

**Handling Steps**  

Replace the image or verify the range of the assigned property values.  

## 62980135 Invalid Image Property Value  

**Error Message**  

The EXIF value is invalid.  

**Possible Causes**  

Missing image property value.  

**Handling Steps**  

Replace the image or check the image property values.  

## 62980137 Invalid Image Operation  

**Error Message**  

Invalid media operation.  

**Possible Causes**  

The target image format does not support the operation.  

**Handling Steps**  

Replace the image.  

## 62980146 Failed to Write Image Property to File  

**Error Message**  

The EXIF data failed to be written to the file.  

**Possible Causes**  

Abnormal image property values.  

**Handling Steps**  

Replace the image.  

## 62980149 Invalid Image Parameter  

**Error Message**  

Invalid MIME type for the image source.  

**Possible Causes**  

The target image format does not support the operation.  

**Handling Steps**  

Replace the image.  

## 62980172 ICC Encoding Failed  

**Error Message**  

Failed to encode icc.  

**Possible Causes**  

Issues with the image ICC information.  

**Handling Steps**  

Check the image data or replace the image.  

## 62980173 DMA Memory Space Error  

**Error Message**  

The DMA memory does not exist.  

**Possible Causes**  

1. Insufficient memory size.  
2. Memory access out of bounds.  
3. Invalid pointer usage.  

**Handling Steps**  

Check memory usage or restart the system.  

## 62980174 DMA Memory Data Abnormal  

**Error Message**  

The DMA memory data is abnormal.  

**Possible Causes**  

1. Improper synchronization during shared memory read/write operations.  
2. Memory access out of bounds.  
3. Invalid pointer usage.  

**Handling Steps**  

Restart the system.  

## 62980177 Abnormal API Environment  

**Error Message**  

Abnormal API environment.  

**Possible Causes**  

Issues with the API usage environment.  

**Handling Steps**  

Check the SDK version.  

## 62980178 PixelMap Creation Failed  

**Error Message**  

Failed to create the PixelMap.  

**Possible Causes**  

1. Parameter errors (e.g., region size exceeds limits, illegal input values) leading to creation failure.  
2. Premature release causing instance creation failure.  

**Handling Steps**  

Check function input parameters or verify if the instance was prematurely released.## 62980179 Abnormal Buffer Size

**Error Message**

Abnormal buffer size.

**Possible Causes**

Creation failure due to parameter errors (e.g., region size exceeds limits, illegal input values, etc.).

**Resolution Steps**

Check function input parameters.

## 62980180 File Descriptor Mapping Failure

**Error Message**

FD mapping failed.

**Possible Causes**

Issues with the provided file descriptor.

**Resolution Steps**

Verify if the correct file descriptor was passed.

## 62980246 Failed to Read Pixel Map

**Error Message**

Failed to read pixel map.

**Possible Causes**

1. Pixel map data error.
2. No read permission for the pixel map.

**Resolution Steps**

Recreate the pixel map or modify read permissions.

## 62980247 Failed to Write to Pixel Mapping

**Error Message**

Writing to pixel mapping failed.

**Possible Causes**

1. Pixel map data error.
2. No write permission for the pixel map.

**Resolution Steps**

Recreate the pixel map or modify write permissions.

## 62980248 PixelMap Modification Not Allowed

**Error Message**

PixelMap does not allow modification.

**Possible Causes**

Attempted modification of PixelMap.

**Resolution Steps**

Discontinue modifications to the PixelMap.

## 62980252 Failed to Create Surface

**Error Message**

Failed to create surface.

**Possible Causes**

Memory allocation error during image encoding.

**Resolution Steps**

Retry or replace the image.

## 62980259 Configuration Error

**Error Message**

Configuration error.

**Possible Causes**

Configuration error occurred.

**Resolution Steps**

Reconfigure correctly.

## 62980274 Image Conversion Failure

**Error Message**

The conversion failed.

**Possible Causes**

1. Abnormal termination during image conversion.
2. Incorrect encoding parameter settings.

**Resolution Steps**

Replace the image or set supported encoding parameters.

## 62980276 Unsupported Target Type for Image Conversion

**Error Message**

The type to be converted is an unsupported target pixel format.

**Possible Causes**

Conversion to the target type is not supported.

**Resolution Steps**

Replace the image or change the conversion type.

## 62980286 Failed to Set Memory Identifier for PixelMap

**Error Message**

Memory format not supported.

**Possible Causes**

1. PixelMap memory type mismatch.
2. PixelMap file descriptor (fd) is invalid.
3. Unknown kernel error.

**Resolution Steps**

Check if the PixelMap instance has been released. Verify memory type compatibility.

## 62980302 Memory Copy Failure

**Error Message**

Memory copy failed.

**Possible Causes**

1. Memory type mismatch.
2. File descriptor (fd) is invalid.
3. Unknown kernel error.

**Resolution Steps**

Check if the instance to be copied has been released. Verify memory type compatibility.

## 7600201 Unsupported Operation

**Error Message**

Unsupported operation.

**Possible Causes**

Unsupported operation.

**Resolution Steps**

Use supported operations.

## 7600202 Unsupported Metadata Read/Write

**Error Message**

Unsupported metadata. Possible causes: Unsupported metadata type.

**Possible Causes**

Unsupported metadata read/write, such as unsupported Exif fields, mismatched auxiliary image types, or attempting to retrieve specific auxiliary image metadata (e.g., fetching GainmapMetadata for a depth map).

**Resolution Steps**

Reconfirm auxiliary image type and metadata compatibility before performing read/write operations.

## 7600301 Memory Allocation Failure

**Error Message**

Memory alloc failed.

**Possible Causes**

Insufficient device memory or memory occupied.

**Resolution Steps**

Free up memory and retry.

## 7600302 Memory Copy Failure

**Error Message**

Memory copy failed.

**Possible Causes**

Memory to be copied does not exist, or device memory is insufficient.

**Resolution Steps**

Verify the existence of the memory to be copied. Free up memory and retry.

## 7600901 Unknown Error

**Error Message**

Unknown error.

**Possible Causes**

Error caused by unknown reasons.

**Resolution Steps**

Investigate logs to identify the cause.

## 7700101 Image Source Issue

**Error Message**

Bad source.

**Possible Causes**

1. Device does not support the image type.
2. Image decoding was not performed as instructed.

**Resolution Steps**

Check image data or replace the image.

## 7700102 Unsupported MIME Type

**Error Message**

Unsupported mimetype.

**Possible Causes**

Device does not support the image type.

**Resolution Steps**

Check image data or replace the image.

## 7700103 Image Too Large

**Error Message**

Image too large.

**Possible Causes**

Image size exceeds limits.

**Resolution Steps**

Check image data or replace the image.

## 7700201 Unsupported Memory Allocation Type

**Error Message**

Unsupported allocator type, e.g., use share memory to decode a HDR image as only DMA supported hdr metadata.

**Possible Causes**

Memory allocation type was not specified or an incorrect type was specified. For example, using shared memory to decode an HDR image will fail because only DMA supports HDR metadata.

**Resolution Steps**

Use the correct memory allocation type.

## 7700203 Unsupported Option

**Error Message**

Unsupported options, e.g, cannot convert image into desired pixel format.

**Possible Causes**

Some option parameters are incorrectly configured, and the operation requested by the option is not supported.

**Resolution Steps**Check the option parameter configuration.

## 7700301 Decoding Failed

**Error Message**

Decode failed.

**Possible Causes**

1. Insufficient device memory.
2. The device does not support this image type.
3. Image decoding was not performed as per the instructions.

**Resolution Steps**

Check the image data or replace the image.

## 7700302 Memory Allocation Failed

**Error Message**

Memory allocation failed.

**Possible Causes**

1. Insufficient device memory.
2. Image decoding was not performed as per the instructions.

**Resolution Steps**

Check the device memory or verify the input data.

## 7800201 Unsupported Option

**Error Message**

Unsupported options.

**Possible Causes**

Some option parameter configurations are incorrect, and the operation requested by the option is not supported.

**Resolution Steps**

Check the option parameter configuration.

## 7800301 Encoding Failed

**Error Message**

Encode failed.

**Possible Causes**

1. The specified encoding format is not supported.
2. The input data is incorrect.

**Resolution Steps**

Replace the image or verify the input data.