# Introduction to Basic Services Kit  

The Basic Services Kit provides a suite of fundamental capabilities for application developers, offering commonly used basic functionalities. These include clipboard read/write operations, file upload/download, file compression, file printing, inter-process/inter-thread communication, device management, application account management, and more.  

## Usage Scenarios  

The Basic Services Kit equips developers with various foundational capabilities to meet development needs across different scenarios.  

**Typical use cases include:**  

- **Clipboard Read/Write:**  
  - Local copy-paste: For example, copying text in Application A and pasting it into another application.  
  - Cross-device copy-paste: For example, copying text in a browser on Device A and pasting it into the notes app on Device B.  

- **File Upload/Download:**  
  - Small file foreground upload/download: Posting social media updates (images, short videos, etc.), sending files to friends, or saving images locally—typically involving small data volumes that require immediate user feedback.  
  - Large file background upload/download: Cloud storage synchronization, movie downloads—usually involving large data volumes that can run in the background and support resumable transfers.  

- **Inter-Process/Inter-Thread Communication:**  
  - Inter-process communication: For example, an ExtensionAbility sending an event to the main process.  
  - Inter-thread communication: For example, a worker thread passing an event back to the UI main thread after processing a network request.  

## Capability Scope  

Categorized by usage scenarios, this Kit primarily includes the following capabilities:  

- **Data File Handling:**  
  - [Compression](../../../reference/source_en/AbilityKit/cj-apis-bundle_manager.md): Provides file compression and decompression capabilities.  
  - [Upload/Download](../../../reference/source_en/BasicServicesKit/cj-apis-request-agent.md): Offers foundational capabilities for file upload/download and background transfer proxying.  

- **Inter-Process/Inter-Thread Communication:**  
  - [Common Events](../../../reference/source_en/BasicServicesKit/cj-apis-common_event_manager.md): Enables inter-process communication, including subscribing to, publishing, and unsubscribing from common events. For development guidelines, refer to [Common Event Overview](./common-event/cj-common-event-overview.md).  

- **Device Management:**  
  - [Device Information](../../../reference/source_en/BasicServicesKit/cj-apis-device_info.md): Provides the ability to query product information, such as device type, brand name, product series, and version number.  
  - [Settings Data Items](../../../reference/source_en/BasicServicesKit/cj-apis-settings.md): Enables querying system settings, such as whether airplane mode or touch browsing is enabled.  
  - [Battery Information Query](../../../reference/source_en/BasicServicesKit/cj-apis-battery_info.md): Provides the ability to query battery-related information.  

- **Others:**  
  - [Common Callbacks](../../../reference/source_en/BasicServicesKit/cj-apis-base.md): Defines common callback types for Cangjie interfaces, including public callbacks and error messages during interface invocation.  
  - [Time and Time Zone](../../../reference/source_en/BasicServicesKit/cj-apis-system_date_time.md): Provides the ability to retrieve system time and time zone information.  

## Relationship with Other Kits  

- **[Ability Kit](../../../reference/source_en/AbilityKit/cj-apis-app-ability-ui_ability.md):** Inter-process communication in the Ability Kit relies on the Common Events capability provided by this Kit.  

- **[Core File Kit](../../../reference/source_en/CoreFileKit/cj-apis-file_fs.md):** Unlike the Core File Kit, which primarily focuses on file access and management (e.g., application file sharing, data backup/restore), this Kit is used for scenarios involving file compression, upload/download, and printing.