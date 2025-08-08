# Using ImageSource for Image Decoding

Image decoding refers to converting archived images in supported formats into a unified [PixelMap](./cj-image-overview.md) for image display or [image processing](./cj-image-transformation.md) in applications or systems. Currently supported archived image formats include JPEG, PNG, GIF, WebP, BMP, SVG, ICO, DNG, and HEIF (support may vary across different hardware devices).

## Development Steps

For detailed API documentation on image decoding, refer to: [Image Decoding API Reference](../../../../API_Reference/source_en/apis/ImageKit/cj-apis-image.md#class-imagesource).

1. Import the Image module globally.

    <!-- compile -->

    ```cangjie
    import kit.ImageKit.*
    import kit.AbilityKit.*
    ```

2. Obtain the image.
    - Method 1: Get the sandbox path. Refer to "Obtaining Application File Paths" for details.

        <!-- compile -->

        ```cangjie
        // globalcontext needs to be assigned in func onCreate of main_ability.cj: globalcontext = this.context
        var globalAbilityContext: Option<UIAbilityContext> = Option<UIAbilityContext>.None
        let filePath = globalAbilityContext.getOrThrow().cacheDir + '/test.jpg'
        ```

    - Method 2: Obtain the file descriptor through the sandbox path. Refer to [file.fs API Documentation](../../../../API_Reference/source_en/apis/CoreFileKit/cj-apis-file_fs.md).
      This method requires importing the kit.CoreFileKit module first.

        <!-- compile -->

        ```cangjie
        import kit.CoreFileKit.*
        ```

        Then call FileFs.open() to get the file descriptor.

        <!-- compile -->

        ```cangjie
        // globalcontext needs to be assigned in func onCreate of main_ability.cj: globalcontext = this.context
        var globalAbilityContext: Option<UIAbilityContext> = Option<UIAbilityContext>.None
        let filePath = globalAbilityContext.getOrThrow().cacheDir + '/test.jpg'
        let file = FileFs.open(filePath, mode: OpenMode.READ_WRITE.mode)
        let fd = file.fd
        ```

    - Method 3: Obtain the resource file's Array\<UInt8> through the ResourceManager. Refer to [ResourceManager API Documentation](../../../../API_Reference/source_en/apis/LocalizationKit/cj-apis-resource_manager.md#func-getrawfilecontentstring).

        <!-- compile -->

        ```cangjie
        // Import the resourceManager.
        import kit.LocalizationKit.*
        import ohos.base.BusinessException

        // globalcontext needs to be assigned in func onCreate of main_ability.cj: globalcontext = this.context
        var globalAbilityContext: Option<UIAbilityContext> = Option<UIAbilityContext>.None
        let stageContext = getStageContext(globalAbilityContext.getOrThrow())
        // Get the resourceManager.
        let resourceManager = ResourceManager.getResourceManager(stageContext)
        ```

        Different models may have different ways to obtain the ResourceManager. After obtaining it, call getRawFileContent() to get the resource file's Array\<UInt8>.

        <!-- compile -->

        ```cangjie
        try {
          let buffer = resourceManager.getRawFileContent("test.jpg")
        } catch (e: BusinessException) {
          AppLog.error("Failed to get RawFileContent")
        }
        ```

    - Method 4: Obtain the resource file's RawFileDescriptor through the ResourceManager. Refer to [ResourceManager API Documentation](../../../../API_Reference/source_en/apis/LocalizationKit/cj-apis-resource_manager.md#func-getrawfdstring).

        <!-- compile -->

        ```cangjie
        // Import the resourceManager.
        import kit.LocalizationKit.*
        import ohos.base.BusinessException

        // globalcontext needs to be assigned in func onCreate of main_ability.cj: globalcontext = this.context
        var globalAbilityContext: Option<UIAbilityContext> = Option<UIAbilityContext>.None
        let stageContext = getStageContext(globalAbilityContext.getOrThrow())
        // Get the resourceManager.
        let resourceManager = ResourceManager.getResourceManager(stageContext)
        ```

        Different models may have different ways to obtain the ResourceManager. After obtaining it, call getRawFd() to get the resource file's RawFileDescriptor.

        <!-- compile -->

        ```cangjie
        try {
          let rawFileDescriptor = resourceManager.getRawFd("test.jpg")
        } catch (e: BusinessException) {
          AppLog.error("Failed to get RawFileDescriptor")
        }
        ```

3. Create an ImageSource instance.

    - Method 1: Create ImageSource through the sandbox path. The sandbox path can be obtained via Method 1 in Step 2.

        <!-- compile -->

        ```cangjie
        // filePath is the obtained sandbox path.
        let imageSource = createImageSource(filePath)
        ```

    - Method 2: Create ImageSource through the file descriptor fd. The file descriptor can be obtained via Method 2 in Step 2.

        <!-- compile -->

        ```cangjie
        // fd is the obtained file descriptor.
        let imageSource = createImageSource(fd)
        ```

    - Method 3: Create ImageSource through the buffer array. The buffer array can be obtained via Method 3 in Step 2.

        <!-- compile -->

        ```cangjie
        let imageSource = createImageSource(buffer)
        ```

    - Method 4: Create ImageSource through the resource file's RawFileDescriptor. The RawFileDescriptor can be obtained via Method 4 in Step 2.

        <!-- compile -->

        ```cangjie
        let imageSource = createImageSource(rawFileDescriptor);
        ```

4. Set decoding parameters (DecodingOptions) and decode to obtain the pixelMap image object.
    - Decode with the desired format:

        <!-- compile -->

        ```cangjie
        import kit.ImageKit.*
        import kit.AbilityKit.*
		import ohos.state_macro_manage.r

        // globalcontext needs to be assigned in func onCreate of main_ability.cj: globalcontext = this.context
        var globalAbilityContext: Option<UIAbilityContext> = Option<UIAbilityContext>.None
        let stageContext = getStageContext(globalAbilityContext.getOrThrow())
        // Get the resourceManager.
        let resourceManager = ResourceManager.getResourceManager(stageContext)

        let img = resourceManager.getMediaContent(@r(app.media.layered_image), 0)
        let imagesource = createImageSource(img)
        let decodingOptions = DecodingOptions(editable: true, desiredPixelFormat: PixelMapFormat.RGBA_8888)

        // Create pixelMap.
        let pixelMap = imagesource.createPixelMap(options: decodingOptions)
        ```

    - HDR Image Decoding

        <!-- compile -->

        ```cangjie
        import kit.ImageKit.*
        import kit.AbilityKit.*
		import ohos.state_macro_manage.r

        // globalcontext needs to be assigned in func onCreate of main_ability.cj: globalcontext = this.context
        var globalAbilityContext: Option<UIAbilityContext> = Option<UIAbilityContext>.None
        let stageContext = getStageContext(globalAbilityContext.getOrThrow())
        // Get the resourceManager.
        let resourceManager = ResourceManager.getResourceManager(stageContext)

        let img = resourceManager.getMediaContent(@r(app.media.layered_image), 0)
        let imagesource = createImageSource(img)
        // Set to AUTO to decode based on the image resource format. If the resource is HDR, it will decode to an HDR pixelmap.
        let decodingOptions = DecodingOptions(desiredDynamicRange: DecodingDynamicRange.AUTO)

        // Create pixelMap.
        let pixelMap = imagesource.createPixelMap(options: decodingOptions)
        // Check if the pixelmap contains HDR content.
        let info = pixelMap.getImageInfo()
        AppLog.info('pixelmap isHdr: ${info.isHdr}')
        ```

    After decoding is complete and the pixelMap object is obtained, you can proceed with subsequent [image processing](./cj-image-transformation.md).

5. Release pixelMap and imageSource.

    Ensure that the pixelMap and imageSource methods have completed execution. When these variables are no longer needed, manually call the following methods to release them as required.

    <!-- compile -->

    ```cangjie
    pixelMap.Release();
    imageSource.Release();
    ```

## Development Example - Decoding an Image from Resource Files

1. Obtain the resourceManager.

    <!-- compile -->

    ```cangjie
    // Import the resourceManager.
    import kit.LocalizationKit.*
    import kit.AbilityKit.*

    // globalcontext needs to be assigned in func onCreate of main_ability.cj: globalcontext = this.context
    var globalAbilityContext: Option<UIAbilityContext> = Option<UIAbilityContext>.None
    let stageContext = getStageContext(globalAbilityContext.getOrThrow())
    // Get the resourceManager.
    let resourceManager = ResourceManager.getResourceManager(stageContext)
    ```

2. Create ImageSource.
    - Method 1: Create using Array\<UInt8> from test.jpg in the rawfile folder.

        <!-- compile -->

        ```cangjie
        let buffer = resourceManager.getRawFileContent("test.jpg")
        let imageSource = createImageSource(buffer)
        ```

    - Method 2: Create using RawFileDescriptor from test.jpg in the rawfile folder.

        <!-- compile -->

        ```cangjie
        let rawFileDescriptor = resourceManager.getRawFd("test.jpg")
        let imageSource = createImageSource(rawFileDescriptor)
        ```

3. Create pixelMap.

    <!-- compile -->

    ```cangjie
    let pixelMap = imageSource.createPixelMap()
    ```

4. Release pixelMap and imageSource.

    Ensure that the pixelMap and imageSource methods have completed execution. When these variables are no longer needed, manually call the following methods to release them as required.

    <!-- compile -->

    ```cangjie
    pixelMap.Release();
    imageSource.Release();
    ```