# Introduction to Telephony Kit

Telephony Kit (Cellular Communication Service) provides a series of APIs to assist developers in creating communication applications, including:

- **Call Module (Phone Calls)**:  
  System applications can directly make phone calls and display the call interface within the app. Third-party applications can launch the system phone app and navigate to the dialer interface to initiate calls. Additionally, applications can use the call module to format phone numbers, determine emergency numbers, and more. For details, refer to the [ohos.telephony.call API Reference](../../../API_Reference/source_en/apis/TelephonyKit/cj-apis-telephony_call.md).  

- **Data Module (Cellular Data)**:  
  Cellular data is a wireless communication technology standard that employs packet switching (Packet Switch) for data transmission and exchange. It enables mobile devices to access services such as voice, data, and video streaming, commonly used for running applications and browsing the web on mobile networks. For details, refer to the ohos.telephony.data API Reference.  

- **SIM Module (SIM Card Management)**:  
  Applications can use APIs to retrieve SIM card information, such as the service provider, ISO (International Organization for Standardization) country code, home PLMN (Public Land Mobile Network) number, etc. For details, refer to the ohos.telephony.sim API Reference.  

## Constraints and Limitations  

Before invoking the telephony service APIs, ensure that the hardware device has an independent cellular communication Modem and a SIM card.