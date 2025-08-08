# HTTP Data Request

## Scenario Description

Applications can initiate data requests via HTTP, supporting common methods such as GET, POST, OPTIONS, HEAD, PUT, DELETE, TRACE, and CONNECT.

## Interface Specifications

The HTTP data request functionality is primarily provided by the http module.

To use this feature, the `ohos.permission.INTERNET` permission must be granted. 

For permission application, refer to [Declaring Permissions](../security/AccessToken/cj-declare-permissions.md).

The relevant interfaces are listed in the table below. For detailed interface descriptions, please refer to the [API Documentation](../../../API_Reference/source_en/apis/NetworkKit/cj-apis-net-http.md).

| Interface Name             | Description                                            |
| -------------------------- | ----------------------------------------------------- |
| createHttp()               | Creates an HTTP request.                              |
| request()                  | Initiates an HTTP network request based on a URL.     |
| requestInStream()          | Initiates an HTTP network request and returns a streaming response. |
| destroy()                  | Aborts the request task.                              |
| onHeadersReceive()         | Subscribes to HTTP Response Header events.            |
| offHeadersReceive()        | Unsubscribes from HTTP Response Header events.        |
| onceHeadersReceive()       | Subscribes to HTTP Response Header events but triggers only once. |
| onDataReceive()            | Subscribes to HTTP streaming response data reception events. |
| offDataReceive()           | Unsubscribes from HTTP streaming response data reception events. |
| onDataEnd()                | Subscribes to HTTP streaming response data completion events. |
| offDataEnd()               | Unsubscribes from HTTP streaming response data completion events. |
| onDataReceiveProgress()    | Subscribes to HTTP streaming response data reception progress events. |
| offDataReceiveProgress()   | Unsubscribes from HTTP streaming response data reception progress events. |
| onDataSendProgress()       | Subscribes to HTTP network request data transmission progress events. |
| offDataSendProgress()      | Unsubscribes from HTTP network request data transmission progress events. |

## request Interface Development Steps

1. Import `http` from `kit.NetworkKit`.
2. Call the `createHttp()` method to create an `HttpRequest` object.
3. Call the `on()` method of this object to subscribe to HTTP response header events. This interface returns before the `request` call. Subscribe to this event as needed for business requirements.
4. Call the `request()` method of this object, passing the HTTP request URL and optional parameters to initiate the network request.
5. Parse the returned results as needed for business requirements.
6. Call the `off()` method of this object to unsubscribe from HTTP response header events.
7. When the request is no longer needed, call the `destroy()` method to actively release resources.

<!--compile-->
```cangjie
// Import packages
import kit.NetworkKit.*
import kit.BasicServicesKit.*
import ohos.base.*
import std.collection.*
import ohos.net.http.CertType as CT

// Each httpRequest corresponds to one HTTP request task and cannot be reused
let httpRequest = createHttp()

// Request configuration
let option = HttpRequestOptions(
    method: RequestMethod.POST, // Optional, defaults to http.RequestMethod.GET
    // This field is used to pass content for POST requests
    extraData: HttpData.STRING_DATA("data to send"),
    expectDataType: HttpDataType.STRING, // Optional, specifies the return data type
    usingCache: true, // Optional, defaults to true
    priority: 1, // Optional, defaults to 1
    // Add header fields as needed for business requirements
    header: HashMap<String, String>([("content-type", "application/json")]),
    readTimeout: 60000, // Optional, defaults to 60000ms
    connectTimeout: 60000, // Optional, defaults to 60000ms
    usingProtocol: HttpProtocol.HTTP1_1, // Optional, protocol type defaults to system-specified
    usingProxy: UsingProxy.USE_DEFAULT, // Optional, defaults to no proxy (supported since API 21)
    caPath: "/path/to/cacert.pem", // Optional, defaults to system CA certificates (supported since API 21)
    clientCert: ClientCert(
        "/path/to/client.pem", // Default: no client certificate
        "/path/to/client.key", // If the certificate includes Key info, pass an empty string
        certType: CT.PEM, // Optional, defaults to PEM
        keyPassword: "passwordToKey" // Optional, password for the key file
    ),
    multiFormDataList: [ // Optional, only effective when 'content-Type' in Header is 'multipart/form-data'
        MultiFormData (
            "Part1", // Data name
            "text/plain", // Data type
            data: STRING_DATA("Example data"), // Optional, data content
            remoteFileName: "example.txt" // Optional
        ),
        MultiFormData (
            "Part2", // Data name
            "text/plain", // Data type
            filePath: "/data/app/el2/100/base/com.example.myapplication/haps/entry/files/fileName.txt", // Optional, file path
            remoteFileName: "fileName.txt" // Optional
        )
    ]
)

httpRequest.request(
    // Fill in the HTTP request URL, with or without parameters. The URL should be customized by the developer. Request parameters can be specified in extraData.
    "EXAMPLE_URL",
    {
        err, resp =>
        if (let Some(v) <- err) {
            AppLog.error("v")
        }
        if (let Some(v) <- resp) {
            // data.result contains the HTTP response content, which can be parsed as needed
            AppLog.info("Result: ${v.result}")
            AppLog.info("code: ${v.responseCode.getValue()}")
            // data.header contains the HTTP response headers, which can be parsed as needed
            AppLog.info("header: ${v.header}")
            AppLog.info("cookies: ${v.cookies}")
            // Call destroy() to release resources when the request is no longer needed
            httpRequest.destroy()
        }
    },
    options: option)
```

## requestInStream Interface Development Steps

1. Import `http` from `kit.NetworkKit`.
2. Call the `createHttp()` method to create an `HttpRequest` object.
3. Call the `on()` method of this object to subscribe to HTTP response header events, HTTP streaming response data reception events, HTTP streaming response data reception progress events, and HTTP streaming response data completion events as needed.
4. Call the `requestInStream()` method of this object, passing the HTTP request URL and optional parameters to initiate the network request.
5. Parse the returned response code as needed.
6. Call the `off()` method of this object to unsubscribe from response events.
7. When the request is no longer needed, call the `destroy()` method to actively release resources.

<!--compile-->
```cangjie
// Import packages
import kit.NetworkKit.*
import kit.BasicServicesKit.*
import ohos.base.*
import std.collection.*
import ohos.net.http.CertType as CT

// Each httpRequest corresponds to one HTTP request task and cannot be reused
let httpRequest = createHttp()
// Subscribe to HTTP response header events
httpRequest.onHeadersReceive { header =>
    AppLog.info("header: ${header}")
}
// Subscribe to HTTP streaming response data reception events
let res = ArrayList<Byte>()
httpRequest.onDataReceive { bytes =>
    res.add(all: bytes)
    AppLog.info("receive length: ${bytes.size}")
}
// Subscribe to HTTP streaming response data completion events
httpRequest.onDataEnd { =>
    AppLog.info("No more data in response, data receive end")
    // Unsubscribe from HTTP response header events
    httpRequest.offHeadersReceive()
    // Unsubscribe from HTTP streaming response data reception events
    httpRequest.offDataReceive()
    // Unsubscribe from HTTP streaming response data reception progress events
    httpRequest.offDataReceiveProgress()
    // Unsubscribe from HTTP streaming response data completion events
    httpRequest.offDataEnd()
    // Call destroy() to release resources when the request is no longer needed
    httpRequest.destroy()
}
// Subscribe to HTTP streaming response data reception progress events
httpRequest.onDataReceiveProgress { progress =>
     AppLog.info("dataReceiveProgress receiveSize: ${progress.receiveSize} totalSize: ${progress.totalSize}")
}

let option = HttpRequestOptions(
    method: RequestMethod.POST, // Optional, defaults to http.RequestMethod.GET
    // This field is used to pass content for POST requests
    extraData: HttpData.STRING_DATA("data to send"),
    expectDataType: HttpDataType.STRING, // Optional, specifies the return data type
    usingCache: true, // Optional, defaults to true
    priority: 1, // Optional, defaults to 1
    // Add header fields as needed for business requirements
    header: HashMap<String, String>([("content-type", "application/json")]),
    readTimeout: 60000, // Optional, defaults to 60000ms
    connectTimeout: 60000, // Optional, defaults to 60000ms
    usingProtocol: HttpProtocol.HTTP1_1, // Optional, protocol type defaults to system-specified
    usingProxy: UsingProxy.USE_DEFAULT, // Optional, defaults to no proxy (supported since API 21)
    caPath: "/path/to/cacert.pem", // Optional, defaults to system CA certificates (supported since API 21)
    clientCert: ClientCert(
        "/path/to/client.pem", // Default: no client certificate
        "/path/to/client.key", // If the certificate includes Key info, pass an empty string
        certType: CT.PEM, // Optional, defaults to PEM
        keyPassword: "passwordToKey" // Optional, password for the key file
    ),
    multiFormDataList: [ // Optional, only effective when 'content-Type' in Header is 'multipart/form-data'
        MultiFormData (
            "Part1", // Data name
            "text/plain", // Data type
            data: STRING_DATA("Example data"), // Optional, data content
            remoteFileName: "example.txt" // Optional
        ),
        MultiFormData (
            "Part2", // Data name
            "text/plain", // Data type
            filePath: "/data/app/el2/100/base/com.example.myapplication/haps/entry/files/fileName.txt", // Optional, file path
            remoteFileName: "fileName.txt" // Optional
        )
    ]
)

// Fill in the HTTP request URL, with or without parameters. The URL should be customized by the developer. Request parameters can be specified in extraData.

httpRequest.requestInStream("EXAMPLE_URL", {err, code =>
    if (let Some(e) <- err) {
        AppLog.error("exception: ${e.message}")
    }
    if (let Some(respCode) <- code) {
        AppLog.info("ResponseCode: ${respCode}")
    } else {
        AppLog.error("response is none")
    }
}, options: option)
```

## Certificate Pinning

Certificate pinning can be implemented by preloading application-level certificates or preloading certificate public key hashes. This ensures that only developer-specified certificates can establish HTTPS connections.

Both methods are configured in a configuration file located at `src/main/resources/base/profile/network_config.json` in the app. This configuration maps preloaded certificates to corresponding network servers.

If the server's certificate is unknown, you can retrieve it using the following command (replace `www.example.com` with the target domain and `www.example.com.pem` with the desired certificate filename):

```shell
openssl s_client -servername www.example.com -connect www.example.com:443 \
    < /dev/null | sed -n "/-----BEGIN/,/-----END/p" > www.example.com.pem
```

For Windows users:
- Replace `/dev/null` with `NUL`.
- OpenSSL behavior may differ; press Enter to exit if it waits for input.
- If `sed` is unavailable, manually copy the content between `-----BEGIN CERTIFICATE-----` and `-----END CERTIFICATE-----` (including these lines).

### Preloading Application-Level Certificates

Directly preload certificate files in the app. Currently, `.crt` and `.pem` formats are supported.

> **Note:**
>
> Currently, certificate pinning for `ohos.net.http` and the Image component matches the hash values of all certificates in the chain. If any server certificate is updated, validation will fail. If the server updates its certificates, the app version should be updated accordingly, and users should upgrade promptly to avoid connectivity issues.

### Preloading Certificate Public Key Hashes

Specify the public key hash of the domain certificate in the configuration to allow only certificates with matching public key hashes to access the domain.

The public key hash of a domain certificate can be calculated using the following commands (assuming the certificate is saved as `www.example.com.pem`):

```shell
# Extract the public key from the certificate
openssl x509 -in www.example.com.pem -pubkey -noout > www.example.com.pubkey.pem
# Convert the PEM-format public key to DER format
openssl asn1parse -noout -inform pem -in www.example.com.pubkey.pem -out www.example.com.pubkey.der
# Calculate the SHA256 hash of the public key and encode it in base64
openssl dgst -sha256 -binary www.example.com.pubkey.der | openssl base64
```

### JSON Configuration Example

Example configuration for preloading application-level certificates:

```json
{
  "network-security-config": {
    "base-config": {
      "trust-anchors": [
        {
          "certificates": "/etc/security/certificates"
        }
      ]
    },
    "domain-config": [
      {
        "domains": [
          {
            "include-subdomains": true,
            "name": "example.com"
          }
        ],
        "trust-anchors": [
          {
            "certificates": "/data/storage/el1/bundle/entry/resources/resfile"
          }
        ]
      }
    ]
  }
}
```

Example configuration for preloading certificate public key hashes:

```json
{
  "network-security-config": {
    "domain-config": [
      {
        "domains": [
          {
            "include-subdomains": true,
            "name": "server.com"
          }
        ],
        "pin-set": {
          "expiration": "2024-11-08",
          "pin": [
            {
              "digest-algorithm": "sha256",
              "digest": "FEDCBA987654321"
            }
          ]
        }
      }
    ]
  }
}
```

**Field Descriptions:**

| Field                    | Type    | Description                                                                                                                         |
| ----------------------- | ------- | ---------------------------------------------------------------------------------------------------------------------------- |
| network-security-config | object  | Network security configuration. May contain 0 or 1 base-config, and must contain 1 domain-config.                                                          |
| base-config             | object  | Specifies application-wide security settings. Must contain 1 trust-anchors.                                                                       |
| domain-config           | array   | Specifies security configurations per domain. May contain any number of items. Each item must contain 1 domains, may contain 0 or 1 trust-anchors, and may contain 0 or 1 pin-set. |
| trust-anchors           | array   | Trusted Certificate Authorities (CAs). May contain any number of items. Each item must contain 1 certificates.                                                                |
| certificates            | string  | Path to CA certificate.                                                                                                                 |
| domains                 | array   | Domain specifications. May contain any number of items. Each item must contain 1 name (string: specifies domain name), and may contain 0 or 1 include-subdomains.                           |
| include-subdomains      | boolean | Indicates whether the rule applies to subdomains.                                                                                                     |
| pin-set                 | object  | Certificate public key pinning settings. Must contain 1 pin, and may contain 0 or 1 expiration.                                                               |
| expiration              | string  | Specifies the expiration time for public key pins.                                                                                                 |
| pin                     | array   | Public key pins. May contain any number of items. Each item must contain 1 digest-algorithm and 1 digest.                                   |
| digest-algorithm        | string  | Specifies the hash algorithm used for generating the digest. Currently only `sha256` is supported.                                                                             |
| digest                  | string  | Specifies the public key hash.                                                                                                               |
```