# Open to All Applications

Before applying for target permissions, developers are advised to first read about applying for application permissions to gain a basic understanding of the workflow. Then, by combining the specific descriptions of the permission fields below, determine whether the application can request the target permissions to improve development efficiency.

## system_grant Permission List

The authorization method for the following permissions is system_grant. For the application method, please refer to Declaring Permissions.

### ohos.permission.USE_BLUETOOTH

Allows the application to view Bluetooth configurations.

**Permission Level**: normal

**Authorization Method**: system_grant

**ACL Enabled**: true

### ohos.permission.GET_BUNDLE_INFO

Allows querying basic information about applications.

**Permission Level**: normal

**Authorization Method**: system_grant

**ACL Enabled**: true

### ohos.permission.PREPARE_APP_TERMINATE

Allows the application to perform custom pre-termination actions before closing.

**Permission Level**: normal

**Authorization Method**: system_grant

**ACL Enabled**: true

### ohos.permission.PRINT

Allows the application to access printing framework capabilities.

**Permission Level**: normal

**Authorization Method**: system_grant

**ACL Enabled**: true

### ohos.permission.DISCOVER_BLUETOOTH

Allows the application to configure local Bluetooth, discover remote devices, and pair/connect with them.

**Permission Level**: normal

**Authorization Method**: system_grant

**ACL Enabled**: true

### ohos.permission.ACCELEROMETER

Allows the application to read data from the accelerometer sensor.

**Permission Level**: normal

**Authorization Method**: system_grant

**ACL Enabled**: true

### ohos.permission.ACCESS_BIOMETRIC

Allows the application to use biometric recognition capabilities for identity authentication.

**Permission Level**: normal

**Authorization Method**: system_grant

**ACL Enabled**: true

### ohos.permission.ACCESS_NOTIFICATION_POLICY

Allows the application to access notification policies on this device.

**Permission Level**: normal

**Authorization Method**: system_grant

**ACL Enabled**: false

### ohos.permission.GET_NETWORK_INFO

Allows the application to obtain data network information.

**Permission Level**: normal

**Authorization Method**: system_grant

**ACL Enabled**: true

### ohos.permission.GET_WIFI_INFO

Allows the application to obtain Wi-Fi information.

**Permission Level**: normal

**Authorization Method**: system_grant

**ACL Enabled**: true

### ohos.permission.GYROSCOPE

Allows the application to read data from the gyroscope sensor.

**Permission Level**: normal

**Authorization Method**: system_grant

**ACL Enabled**: true

### ohos.permission.INTERNET

Allows the use of Internet networks.

**Permission Level**: normal

**Authorization Method**: system_grant

**ACL Enabled**: true

### ohos.permission.KEEP_BACKGROUND_RUNNING

Allows the Service Ability to continue running in the background.

**Permission Level**: normal

**Authorization Method**: system_grant

**ACL Enabled**: true

### ohos.permission.NFC_CARD_EMULATION

Allows the application to implement card emulation functionality.

**Permission Level**: normal

**Authorization Method**: system_grant

**ACL Enabled**: false

### ohos.permission.NFC_TAG

Allows the application to read/write Tag cards.

**Permission Level**: normal

**Authorization Method**: system_grant

**ACL Enabled**: false

### ohos.permission.PRIVACY_WINDOW

Allows the application to set a window as a privacy window, prohibiting screenshots and screen recordings.

**Permission Level**: system_basic

**Authorization Method**: system_grant

**ACL Enabled**: true

### ohos.permission.PUBLISH_AGENT_REMINDER

Allows the application to use background agent reminders.

**Permission Level**: normal

**Authorization Method**: system_grant

**ACL Enabled**: true

### ohos.permission.SET_NETWORK_INFO

Allows the application to configure data networks.

**Permission Level**: normal

**Authorization Method**: system_grant

**ACL Enabled**: true

### ohos.permission.SET_WIFI_INFO

Allows the application to configure Wi-Fi devices.

**Permission Level**: normal

**Authorization Method**: system_grant

**ACL Enabled**: true

### ohos.permission.GET_WIFI_PEERS_MAC

Allows the application to obtain the MAC addresses of peer WLAN or Bluetooth devices.

**Permission Level**: system_core

**Authorization Method**: system_grant

**ACL Enabled**: true

### ohos.permission.GET_WIFI_LOCAL_MAC

Allows the application to obtain the MAC addresses of local WLAN or Bluetooth devices.

**Permission Level**: system_basic

**Authorization Method**: system_grant

**ACL Enabled**: true

### ohos.permission.VIBRATE

Allows the application to control motor vibrations.

**Permission Level**: normal

**Authorization Method**: system_grant

**ACL Enabled**: true

### ohos.permission.CLEAN_BACKGROUND_PROCESSES

Allows the application to clean up related background processes based on package names.

**Permission Level**: normal

**Authorization Method**: system_grant

**ACL Enabled**: true

### ohos.permission.COMMONEVENT_STICKY

Allows the application to publish sticky common events.

**Permission Level**: normal

**Authorization Method**: system_grant

**ACL Enabled**: true

### ohos.permission.MODIFY_AUDIO_SETTINGS

Allows the application to modify audio settings.

**Permission Level**: normal

**Authorization Method**: system_grant

**ACL Enabled**: true

### ohos.permission.RUNNING_LOCK

Allows the application to obtain a running lock to ensure continuous operation in the background.

**Permission Level**: normal

**Authorization Method**: system_grant

**ACL Enabled**: true

### ohos.permission.SET_WALLPAPER

Allows the application to set wallpapers.

**Permission Level**: normal

**Authorization Method**: system_grant

**ACL Enabled**: true

### ohos.permission.ACCESS_CERT_MANAGER

Allows the application to perform operations such as querying certificates and private credentials.

**Permission Level**: normal

**Authorization Method**: system_grant

**ACL Enabled**: false

### ohos.permission.hsdr.HSDR_ACCESS

Allows the application to access the security detection and response framework.

**Permission Level**: normal

**Authorization Method**: system_grant

**ACL Enabled**: false

### ohos.permission.RUN_DYN_CODEAllow applications to execute dynamic code.

**Permission Level**: normal

**Grant Mode**: system_grant

**ACL Enabled**: false

### ohos.permission.READ_CLOUD_SYNC_CONFIG

Allows applications connected to cloud storage to query cloud synchronization configuration information.

**Permission Level**: normal

**Grant Mode**: system_grant

**ACL Enabled**: true

### ohos.permission.STORE_PERSISTENT_DATA

Allows applications to store persistent data, which remains until the device is factory reset or the system is reinstalled.

**Permission Level**: normal

**Grant Mode**: system_grant

**ACL Enabled**: false

### ohos.permission.ACCESS_EXTENSIONAL_DEVICE_DRIVER

Allows applications to use extended functionalities of external devices.

**Permission Level**: normal

**Grant Mode**: system_grant

**ACL Enabled**: false

## user_grant Permission List

The following permissions are granted via user_grant. For application methods, please refer to Declaring Permissions > Requesting User Authorization.

### ohos.permission.ACCESS_BLUETOOTH

Allows applications to access Bluetooth and utilize Bluetooth capabilities, such as pairing and connecting peripheral devices.

**Permission Level**: normal

**Grant Mode**: user_grant

**ACL Enabled**: false

### ohos.permission.MEDIA_LOCATION

Allows applications to access geographic location information in user media files.

**Permission Level**: normal

**Grant Mode**: user_grant

**ACL Enabled**: true

### ohos.permission.APP_TRACKING_CONSENT

Allows applications to read open anonymous device identifiers.

**Permission Level**: normal

**Grant Mode**: user_grant

**ACL Enabled**: true

### ohos.permission.ACTIVITY_MOTION

Allows applications to read user motion status.

**Permission Level**: normal

**Grant Mode**: user_grant

**ACL Enabled**: true

### ohos.permission.CAMERA

Allows applications to use the camera.

**Permission Level**: normal

**Grant Mode**: user_grant

**ACL Enabled**: true

### ohos.permission.DISTRIBUTED_DATASYNC

Allows data exchange between different devices.

**Permission Level**: normal

**Grant Mode**: user_grant

**ACL Enabled**: true

### ohos.permission.LOCATION_IN_BACKGROUND

Allows applications to obtain device location information while running in the background.

**Prerequisite**: This permission can only be requested after obtaining the foreground location permissions [ohos.permission.LOCATION](#ohospermissionlocation) and [ohos.permission.APPROXIMATELY_LOCATION](#ohospermissionapproximately_location).

**Permission Level**: normal

**Grant Mode**: user_grant

**ACL Enabled**: false

### ohos.permission.LOCATION

Allows applications to obtain device location information.

**Prerequisite**: This permission can only be requested after obtaining the approximate location permission [ohos.permission.APPROXIMATELY_LOCATION](#ohospermissionapproximately_location).

**Permission Level**: normal

**Grant Mode**: user_grant

**ACL Enabled**: true

### ohos.permission.APPROXIMATELY_LOCATION

Allows applications to obtain approximate device location information.

**Permission Level**: normal

**Grant Mode**: user_grant

**ACL Enabled**: false

### ohos.permission.MICROPHONE

Allows applications to use the microphone.

**Permission Level**: normal

**Grant Mode**: user_grant

**ACL Enabled**: true

### ohos.permission.READ_CALENDAR

Allows applications to read calendar information.

**Permission Level**: normal

**Grant Mode**: user_grant

**ACL Enabled**: true

### ohos.permission.READ_HEALTH_DATA

Allows applications to read user health data.

**Permission Level**: normal

**Grant Mode**: user_grant

**ACL Enabled**: true

### ohos.permission.READ_MEDIA

Allows applications to read media file information from user external storage.

**Permission Level**: normal

**Grant Mode**: user_grant

**ACL Enabled**: true

### ohos.permission.WRITE_CALENDAR

Allows applications to add, remove, or modify calendar events.

**Permission Level**: normal

**Grant Mode**: user_grant

**ACL Enabled**: true

### ohos.permission.WRITE_MEDIA

Allows applications to read and write media file information in user external storage.

**Permission Level**: normal

**Grant Mode**: user_grant

**ACL Enabled**: true