# Using ImagePacker for Image Encoding

Image encoding refers to the process of converting PixelMap into various archive image formats. Currently supported formats include JPEG, WebP, PNG, and HEIF (availability may vary across different hardware devices), which can be used for subsequent processing such as storage or transmission.

## Development Procedure

For detailed API documentation on image encoding, refer to: [Image Encoding API Reference](../../../../API_Reference/source_zh_cn/apis/ImageKit/cj-apis-image.md#class-imagepacker).

### Encoding Images into File Streams

1. Create an ImagePacker object for image encoding.

    <!-- compile -->

    ```cangjie
    // Import relevant module packages.
    import kit.ImageKit.*

    let imagePackerApi = createImagePacker()
    ```

2. Configure encoding output stream and encoding parameters.

    - format specifies the image encoding format; quality indicates image quality ranging from 0-100, where 100 represents the best quality.

        > **Note:**
        > According to MIME standards, the standard encoding format is image/jpeg. When using image encoding, set PackingOption.format to image/jpeg. The file extension for encoded images can be .jpg or .jpeg, and can be used on platforms supporting image/jpeg decoding.

        <!-- compile -->

        ```cangjie
        var packOpts = PackingOption('image/jpeg', 98)
        ```

    - Encode as HDR content (requires the source to be HDR, supports JPEG format).

        <!-- compile -->

        ```cangjie
        packOpts.desiredDynamicRange = image.PackingDynamicRange.Auto;
        ```

3. [Create a PixelMap object or create an ImageSource object](./cj-image-decoding.md).

4. Perform image encoding and save the encoded image.

    Method 1: Encode via PixelMap.

    <!-- compile -->

    ```cangjie
    // 'data' contains the packed file stream, which can be written to a file to obtain the final image.
    let data = imagePackerApi.packToData(pixelMap, packOpts)
    ```

    Method 2: Encode via ImageSource.

    <!-- compile -->

    ```cangjie
    // 'data' contains the packed file stream, which can be written to a file to obtain the final image.
    let data = imagePackerApi.packToData(imageSource, packOpts)
    ```

### Encoding Images into Files

During encoding, developers can specify a target file path, and the encoded memory data will be directly written to the file.

Method 1: Encode PixelMap into a file.

<!-- compile -->

```cangjie
import kit.CoreFileKit.*
var abilityContext = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow()
// Obtain the resourceManager.
let resourceManager = abilityContext.resourceManager   
        
let img = resourceManager.getMediaContent(@r(app.media.layered_image))
let imageSource = createImageSource(img)
let cacheDir = "/data/storage/el2/base/haps/entry/cache"
let filePath = cacheDir + '/test.jpg'

let file = FileIo.open(path, mode: OpenMode.CREATE | OpenMode.READ_WRITE)
// Directly encode into the file.
imagePackerApi.packToFile(pixelMap, Int32(file.fd), packOpts)
FileFs.close(file.fd)
```

Method 2: Encode ImageSource into a file.

<!-- compile -->

```cangjie
import kit.CoreFileKit.*
var abilityContext = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow()
// Obtain the resourceManager.
let resourceManager = abilityContext.resourceManager   
        
let img = resourceManager.getMediaContent(@r(app.media.layered_image))
let imageSource = createImageSource(img)
let cacheDir = "/data/storage/el2/base/haps/entry/cache"
let filePath = cacheDir + '/test.jpg'

let file = FileIo.open(path, mode: OpenMode.CREATE | OpenMode.READ_WRITE)
// Directly encode into the file.
imagePackerApi.packToFile(imageSource, Int32(file.fd), packOpts)
FileFs.close(file.fd)
```