# mediatool Utility

mediatool is a lightweight command-line toolset that enables developers to manipulate media library resources. The media library provides and manages data for the gallery, where images and videos from the media library are displayed in the gallery interface.

The mediatool utility comes pre-installed with the system and does not require additional installation. It is built into the `/bin` directory and can be directly invoked via hdc shell.

## Prerequisites

- Establish normal device connection
- Enable Developer Mode in system settings
- Enter command-line execution mode using hdc shell

## Command Reference

<!--Del-->

### mediatool send

```shell
mediatool send <path-to-local-media-file> [-ts] [-tas] [-rf] [-urf]
```

This command pushes image/video files from the device path `<path-to-local-media-file>` into the media library for storage. Supports saving images, videos, and audio files. Files retain their original names in the media library. `<path-to-local-media-file>` can be a directory, in which case mediatool will place all files within the directory into the media library. Upon successful saving, the URI of the imported resource will be printed.

By default, media files are saved to the media library with synchronous thumbnail generation, and the source files under ```<path-to-local-media-file>``` will be deleted after import.

| Option | Description |
| :---- | :--------------- |
| -ts | Create thumbnails synchronously when saving images/videos. Ensures thumbnails are generated before media becomes visible, but increases save time. (Default) |
| -tas | Create thumbnails asynchronously when saving images/videos. Cannot be used with -ts. Media becomes visible immediately without waiting for thumbnail generation. Faster save time. |
| -rf | Delete source files after media import. (Default) |
| -urf | Do not delete source files after media import. Cannot be used with -rf. |

**Usage Example:**

```shell
> mediatool send /data/tmp/MyImage.jpg
file://media/Photo/3/IMG_1721381297_001/MyImage.jpg # Successfully pushed, prints URI of imported resource
```

### mediatool list

```shell
mediatool list <resource-uri>
```

This command prints information about media library resources corresponding to the specified `<resource-uri>` in CSV format.

For example, if image resource A in the media library has URI file://media/Photo/3/IMG_1721381297_001/MyImage.jpg, both `mediatool list file://media/Photo/3` and `mediatool list file://media/Photo/3/IMG_1721381297_001/MyImage.jpg` can successfully print the resource information.

Printed information includes:

- uri: The resource's URI
- display_name: The resource's name
- data: Physical path of the resource's source file on the device

Alternatively, `<resource-uri>` can be specified as `all`. `mediatool list all` will print information for all resources in the media library.

**Usage Example:**

```shell
# Query with existing URI
> mediatool list file://media/Photo/3
Table Name: Photos
uri, display_name, data
"file://media/Photo/3/IMG_1721381297_001/MyImage.jpg", "MyImage.jpg", "/storage/cloud/100/files/Photo/2/IMG_1721381297_001.jpg"

# Query with malformed URI
> mediatool list file://media/Photo/
[FAIL] uri invalid. uri:file://media/Photo/
```

<!--DelEnd-->

### mediatool recv

```shell
mediatool recv <resource-uri> <dest-path>
```

This command exports the source file content of the media library resource specified by `<resource-uri>` to the device path specified by `<dest-path>`.

`<dest-path>` can specify either a target file path or directory path. If a directory path is specified, files will be exported to that directory while retaining their media library names.

When `<dest-path>` specifies a target file path, it must not point to an existing file.
<!--Del-->
`<dest-path>` must specify a path with accessible permissions.
<!--DelEnd-->

Upon successful export, the path of the exported file will be printed.

For obtaining media library resource URIs, refer to [Media Library URI Introduction/Acquisition Methods](#媒体库uri介绍获取方式).

Specifying `all` for `<resource-uri>` will export source files for all media library resources. When `<resource-uri>` is `all`, `<dest-path>` must be a directory path.

This command cannot export media assets from hidden albums.

<!--RP1--><!--RP1End-->

**Usage Example:**

```shell
> mediatool recv file://media/Photo/3 /data/local/tmp/out.jpg
Table Name: Photos
/data/local/tmp/out.jpg
```

### mediatool delete

```shell
mediatool delete <resource-uri>
```

This command permanently deletes the media library resource specified by `<resource-uri>`. Deleted resources cannot be recovered—use with caution.

For obtaining media library resource URIs, refer to [Media Library URI Introduction/Acquisition Methods](#媒体库uri介绍获取方式).

Specifying `all` for `<resource-uri>` will delete all media library resources and reset all media library data.

**Usage Example:**

```shell
> mediatool delete file://media/Photo/3
[SUCCESS] delete success.

> mediatool delete all # Successful execution of delete all produces no output
```

### mediatool query

```shell
mediatool query <display-name> [-p] [-u]
```

This command queries all media library resources named `<display-name>`, returning either the resource's source file path or media resource URI. By default, returns the source file path.

This command cannot query media assets from hidden albums.

| Option | Description |
| ---- |----- |
| -p | Returns the physical path of the media resource's source file on the device. (Default) |
| -u | Returns the media resource URI. Cannot be used with -p. |

**Usage Example:**

```shell
# Query for existing media resource
> mediatool query MyImage.jpg
find 1 result:
path
/storage/cloud/100/files/Photo/2/IMG_1721381297_001.jpg

# Query for non-existent media resource
> mediatool query non_exist.jpg
find 0 result

# Query with malformed name format
> mediatool query IMG_001
find 0 result
The displayName format is not correct!

# Query for media resource source file path
> mediatool query MyImage.jpg -p
find 1 result:
path
/storage/cloud/100/files/Photo/2/IMG_1721381297_001.jpg

# Query for media resource URI
> mediatool query MyImage.jpg -u
find 1 result:
uri
"file://media/Photo/2/IMG_1721381297_001/MyImage.jpg"
```

## Usage Guidelines

The following guidelines illustrate common mediatool usage scenarios.

### Exporting Specific Media Library Assets

Example: Exporting a JPG image named MyImage from the gallery.

```shell
> hdc shell mediatool query -u MyImage.jpg
find 1 result
uri
"file://media/Photo/1/IMG_1743078145_000/MyImage.jpg"

> hdc shell mediatool recv file://media/Photo/1 /data/local/tmp/out.jpg
Table Name: Photos
/data/local/tmp/out.jpg

> hdc file recv /data/local/tmp/out.jpg .
FileTransfer finish, Size:10015455, File count = 1, time:679ms rate:14750.30kB/s
```

### Exporting All Media Library Assets

```shell
> hdc shell mediatool recv all /data/local/tmp/media
Table Name: Photos
/data/local/tmp/media/MyImage.jpg

Table Name: Audios

> hdc shell tar -cvf /data/local/tmp/media.tar /data/local/tmp/media/*
removing leading '/' from member names
data/local/tmp/media/MyImage.jpg

> hdc file recv /data/local/tmp/media.tar .
FileTransfer finish, Size:10017280, File count = 1, time:664ms rate:15086.27kB/s
```

### Deleting Specific Media Library Assets

Example: Deleting a JPG image named MyImage from the gallery.

```shell
> hdc shell mediatool query -u MyImage.jpg
find 1 result
uri
"file://media/Photo/1/IMG_1743078145_000/MyImage.jpg"

> hdc shell mediatool delete file://media/Photo/1/IMG_1743078145_000/MyImage.jpg
[SUCCESS] delete success.
```

### Completely Resetting Media Library Database

```shell
> hdc shell mediatool delete all
```

## Media Library URI Introduction/Acquisition Methods

URIs serve as unique identifiers for media library assets, with each URI corresponding to one media asset. mediatool uses URIs to identify target media assets for operations.

URIs can be obtained through the following methods:

- `mediatool query` with the -u option returns the URI of corresponding media assets. Requires input of the asset's display name (the name shown in gallery including extension).<!--Del-->
- `mediatool list all` retrieves URI lists for all media library assets along with their display names.<!--DelEnd-->

Media library URIs can be used with `mediatool recv` to export specific media library assets, or with `mediatool delete` to remove specific media library assets.

URI Example: `file://media/Photo/1/IMG_1743078145_000/MyImage.jpg`.
When using this URI in mediatool operations, both `file://media/Photo/1/IMG_1743078145_000/MyImage.jpg` and `file://media/Photo/1` will correctly locate the target asset.