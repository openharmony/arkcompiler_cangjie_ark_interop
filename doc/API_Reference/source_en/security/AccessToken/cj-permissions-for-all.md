# Open to All Applications

Before applying for target permissions, developers are advised to first read about applying for application permissions to gain a basic understanding of the workflow. Then, by combining the specific descriptions of the permission fields below, determine whether the application can request the target permissions to improve development efficiency.

## system_grant Permission List

The following permissions are all granted via `system_grant`. For the application method, please refer to Declaring Permissions.

### ohos.permission.USE_BLUETOOTH

Allows the application to view Bluetooth configurations.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: true  

### ohos.permission.GET_BUNDLE_INFO

Allows querying basic information about applications.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: true  

### ohos.permission.PREPARE_APP_TERMINATE

Allows the application to perform custom pre-termination actions before closing.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: true  

### ohos.permission.PRINT

Allows the application to access the printing framework's capabilities.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: true  

### ohos.permission.DISCOVER_BLUETOOTH

Allows the application to configure local Bluetooth, discover remote devices, and pair/connect with them.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: true  

### ohos.permission.ACCELEROMETER

Allows the application to read data from the accelerometer sensor.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: true  

### ohos.permission.ACCESS_BIOMETRIC

Allows the application to use biometric recognition capabilities for identity authentication.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: true  

### ohos.permission.ACCESS_NOTIFICATION_POLICY

Allows the application to access notification policies on this device.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: false  

### ohos.permission.GET_NETWORK_INFO

Allows the application to obtain data network information.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: true  

### ohos.permission.GET_WIFI_INFO

Allows the application to obtain Wi-Fi information.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: true  

### ohos.permission.GYROSCOPE

Allows the application to read data from the gyroscope sensor.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: true  

### ohos.permission.INTERNET

Allows the use of the Internet network.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: true  

### ohos.permission.KEEP_BACKGROUND_RUNNING

Allows the Service Ability to continue running in the background.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: true  

### ohos.permission.NFC_CARD_EMULATION

Allows the application to implement card emulation functionality.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: false  

### ohos.permission.NFC_TAG

Allows the application to read/write Tag cards.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: false  

### ohos.permission.PRIVACY_WINDOW

Allows the application to set a window as a privacy window, preventing screenshots or screen recordings.

**Permission Level**: system_basic  
**Grant Method**: system_grant  
**ACL Enabled**: true  

### ohos.permission.PUBLISH_AGENT_REMINDER

Allows the application to use background agent reminders.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: true  

### ohos.permission.SET_NETWORK_INFO

Allows the application to configure data networks.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: true  

### ohos.permission.SET_WIFI_INFO

Allows the application to configure Wi-Fi devices.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: true  

### ohos.permission.GET_WIFI_PEERS_MAC

Allows the application to obtain the MAC addresses of peer WLAN or Bluetooth devices.

**Permission Level**: system_core  
**Grant Method**: system_grant  
**ACL Enabled**: true  

### ohos.permission.GET_WIFI_LOCAL_MAC

Allows the application to obtain the MAC addresses of local WLAN or Bluetooth devices.

**Permission Level**: system_basic  
**Grant Method**: system_grant  
**ACL Enabled**: true  

### ohos.permission.VIBRATE

Allows the application to control motor vibrations.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: true  

### ohos.permission.CLEAN_BACKGROUND_PROCESSES

Allows the application to clean up related background processes based on package names.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: true  

### ohos.permission.COMMONEVENT_STICKY

Allows the application to publish sticky common events.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: true  

### ohos.permission.MODIFY_AUDIO_SETTINGS

Allows the application to modify audio settings.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: true  

### ohos.permission.RUNNING_LOCK

Allows the application to obtain a running lock to ensure continuous background operation.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: true  

### ohos.permission.SET_WALLPAPER

Allows the application to set wallpapers.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: true  

### ohos.permission.ACCESS_CERT_MANAGER

Allows the application to query certificates and private credentials.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: false  

### ohos.permission.hsdr.HSDR_ACCESS

Allows the application to access the security detection and response framework.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: false  

### ohos.permission.RUN_DYN_CODE

Allows the application to run dynamic code.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: false  

### ohos.permission.READ_CLOUD_SYNC_CONFIG

Allows cloud-integrated applications to query cloud synchronization configuration information.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: true  

### ohos.permission.STORE_PERSISTENT_DATA

Allows the application to store persistent data, which remains until the device is factory reset or the system is reinstalled.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: false  

### ohos.permission.ACCESS_EXTENSIONAL_DEVICE_DRIVER

Allows the application to use external device enhancement features.

**Permission Level**: normal  
**Grant Method**: system_grant  
**ACL Enabled**: false  

## user_grant Permission List

The following permissions are all granted via `user_grant`. For the application method, please refer to Declaring Permissions > Requesting User Authorization.

### ohos.permission.ACCESS_BLUETOOTH

Allows the application to access Bluetooth and use Bluetooth capabilities, such as pairing and connecting to peripheral devices.

**Permission Level**: normal  
**Grant Method**: user_grant  
**ACL Enabled**: false  

### ohos.permission.MEDIA_LOCATION

Allows the application to access geographic location information in user media files.

**Permission Level**: normal  
**Grant Method**: user_grant  
**ACL Enabled**: true  

### ohos.permission.APP_TRACKING_CONSENT

Allows the application to read open anonymous device identifiers.

**Permission Level**: normal  
**Grant Method**: user_grant  
**ACL Enabled**: true  

### ohos.permission.ACTIVITY_MOTION

Allows the application to read the user's motion state.

**Permission Level**: normal  
**Grant Method**: user_grant  
**ACL Enabled**: true  

### ohos.permission.CAMERA

Allows the application to use the camera.

**Permission Level**: normal  
**Grant Method**: user_grant  
**ACL Enabled**: true  

### ohos.permission.DISTRIBUTED_DATASYNC

Allows data exchange between different devices.

**Permission Level**: normal  
**Grant Method**: user_grant  
**ACL Enabled**: true### ohos.permission.LOCATION_IN_BACKGROUND

Allows an application to obtain device location information while running in the background.

**Prerequisite**: This permission can only be requested after obtaining the foreground location permissions [ohos.permission.LOCATION](#ohospermissionlocation) and [ohos.permission.APPROXIMATELY_LOCATION](#ohospermissionapproximately_location).

**Permission Level**: normal

**Authorization Method**: user_grant

**ACL Enabled**: false

### ohos.permission.LOCATION

Allows an application to obtain device location information.

**Prerequisite**: This permission can only be requested after obtaining the approximate location permission [ohos.permission.APPROXIMATELY_LOCATION](#ohospermissionapproximately_location).

**Permission Level**: normal

**Authorization Method**: user_grant

**ACL Enabled**: true

### ohos.permission.APPROXIMATELY_LOCATION

Allows an application to obtain approximate device location information.

**Permission Level**: normal

**Authorization Method**: user_grant

**ACL Enabled**: false

### ohos.permission.MICROPHONE

Allows an application to use the microphone.

**Permission Level**: normal

**Authorization Method**: user_grant

**ACL Enabled**: true

### ohos.permission.READ_CALENDAR

Allows an application to read calendar information.

**Permission Level**: normal

**Authorization Method**: user_grant

**ACL Enabled**: true

### ohos.permission.READ_HEALTH_DATA

Allows an application to read user health data.

**Permission Level**: normal

**Authorization Method**: user_grant

**ACL Enabled**: true

### ohos.permission.READ_MEDIA

Allows an application to read media file information from external storage.

**Permission Level**: normal

**Authorization Method**: user_grant

**ACL Enabled**: true

### ohos.permission.WRITE_CALENDAR

Allows an application to add, remove, or modify calendar events.

**Permission Level**: normal

**Authorization Method**: user_grant

**ACL Enabled**: true

### ohos.permission.WRITE_MEDIA

Allows an application to read and write media file information in external storage.

**Permission Level**: normal

**Authorization Method**: user_grant

**ACL Enabled**: true