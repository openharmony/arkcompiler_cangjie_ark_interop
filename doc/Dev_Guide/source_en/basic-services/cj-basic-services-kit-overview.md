# Introduction to Basic Services Kit  

The Basic Services Kit provides a suite of fundamental capabilities for application developers, including commonly used functionalities such as clipboard read/write, file upload/download, file compression, file printing, inter-process/inter-thread communication, device management, and application account management.  

## Usage Scenarios  

The Basic Services Kit offers various foundational capabilities to meet developers' needs across different scenarios.  

**Typical usage scenarios include:**  

- **Clipboard Read/Write:**  
  - Local copy-paste: For example, copying text in App A and pasting it into other applications.  
  - Cross-device copy-paste: For example, copying text in Device A's browser and pasting it into Device B's notes app.  

- **File Upload/Download:**  
  - Small file foreground upload/download: Posting social media content (images, short videos, etc.), sending files to friends, or saving images locally—typically involving small data volumes that require immediate user feedback.  
  - Large file background upload/download: Cloud storage synchronization or downloading movies—typically involving large data volumes that can be processed in the background with support for resumable transfers.  

- **Inter-Process/Inter-Thread Communication:**  
  - Inter-process communication: For example, an ExtensionAbility sending an event to the main process.  
  - Inter-thread communication: For example, a worker thread passing processed network request events back to the UI main thread.  

## Capability Scope  

Categorized by usage scenarios, this Kit primarily includes the following capabilities:  

- **Data File Handling:**  
  - [Compression](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-bundle_manager.md): Provides file compression and decompression capabilities.  
  - [Upload/Download](../../../API_Reference/source_en/apis/BasicServicesKit/cj-apis-request-agent.md): Offers foundational capabilities for file upload/download and background transfer agents.  

- **Inter-Process/Inter-Thread Communication:**  
  - [Common Events](../../../API_Reference/source_en/apis/BasicServicesKit/cj-apis-common_event_manager.md): Enables inter-process communication, including subscribing to, publishing, and unsubscribing from common events. For development guidelines, refer to [Common Event Introduction](./common-event/cj-common-event-overview.md).  

- **Device Management:**  
  - [Device Information](../../../API_Reference/source_en/apis/BasicServicesKit/cj-apis-device_info.md): Provides capabilities to query product information, such as device type, brand name, product series, and version number.  
  - [Settings Data Items](../../../API_Reference/source_en/apis/BasicServicesKit/cj-apis-settings.md): Enables querying system settings, such as whether airplane mode or touch browsing is enabled.  
  - [Battery Information Query](../../../API_Reference/source_en/apis/BasicServicesKit/cj-apis-battery_info.md): Provides battery information querying capabilities.  
  - System Power Management: Offers power management-related capabilities, such as querying screen status.  

- **Others:**  
  - [Common Callbacks](../../../API_Reference/source_en/apis/BasicServicesKit/cj-apis-base.md): Defines common callback types for Cangjie interfaces, including standard callbacks and error messages during API calls.  
  - [Time and Time Zone](../../../API_Reference/source_en/apis/BasicServicesKit/cj-apis-system_date_time.md): Provides capabilities to retrieve system time and time zone information.  

## Relationship with Other Kits  

- **[Ability Kit](../../../API_Reference/source_en/apis/AbilityKit/cj-apis-ability.md):** Inter-process communication in the Ability Kit relies on the Common Events capability provided by this Kit.  

- **[Core File Kit](../../../API_Reference/source_en/apis/CoreFileKit/cj-apis-file_fs.md):** The usage scenarios differ from those of the Core File Kit. The Core File Kit primarily provides file access and management capabilities, enabling developers to work on scenarios such as application file access, file sharing, and data backup/restore. In contrast, this Kit is used for scenarios involving file compression, upload/download, and printing.