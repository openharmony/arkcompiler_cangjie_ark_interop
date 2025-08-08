# HTTP Error Codes

> **Note:**
>
> The following only describes error codes specific to this module. For general error codes, please refer to the [Universal Error Code Documentation](cj-errorcode-universal.md).

## 2300001 Unsupported Protocol

**Error Message**

Unsupported protocol.

**Error Description**

The protocol version is not supported by the server.

**Possible Causes**

The protocol version passed in is not supported by the server.

**Resolution Steps**

Check whether the protocol version passed in is reasonable and investigate the server implementation.

## 2300003 URL Format Error

**Error Message**

URL using bad/illegal format or missing URL.

**Error Description**

The URL format is incorrect.

**Possible Causes**

The URL format passed in may be incorrect.

**Resolution Steps**

Verify that the URL format passed in is correct.

## 2300005 Proxy Server Domain Resolution Failed

**Error Message**

Couldn't resolve proxy name.

**Error Description**

The proxy server's domain name cannot be resolved.

**Possible Causes**

The server's URL is incorrect.

**Resolution Steps**

Check whether the proxy server's URL is correct.

## 2300006 Domain Resolution Failed

**Error Message**

Couldn't resolve host name.

**Error Description**

The server's domain name cannot be resolved.

**Possible Causes**

1. The server's URL passed in is incorrect.
2. Network connectivity issues.

**Resolution Steps**

1. Verify that the server's URL entered is reasonable.
2. Check the network connection status.

## 2300007 Failed to Connect to Server

**Error Message**

Couldn't connect to server.

**Error Description**

Failed to connect to the server.

**Possible Causes**

The URL format passed in may be incorrect.

**Resolution Steps**

Verify that the URL format passed in is correct.

## 2300008 Server Returned Illegal Data

**Error Message**

Weird server reply.

**Error Description**

The server returned illegal data.

**Possible Causes**

The server encountered an error and returned non-HTTP formatted data.

**Resolution Steps**

Investigate the server implementation.

## 2300009 Access Denied to Remote Resource

**Error Message**

Access denied to remote resource.

**Error Description**

Access to the remote resource is denied.

**Possible Causes**

The specified content is denied access by the server.

**Resolution Steps**

Investigate the request content.

## 2300016 HTTP2 Framing Layer Error

**Error Message**

Error in the HTTP2 framing layer.

**Error Description**

An HTTP2 layer error occurred.

**Possible Causes**

The server does not support HTTP2.

**Resolution Steps**

Capture packets for analysis and verify whether the server supports HTTP2.

## 2300018 Server Returned Incomplete Data

**Error Message**

Transferred a partial file.

**Error Description**

The server returned incomplete data.

**Possible Causes**

This may be related to the server implementation.

**Resolution Steps**

Investigate the server implementation.

## 2300023 Failed to Write Received Data to Disk/Application

**Error Message**

Failed writing received data to disk/application.

**Error Description**

Failed to write received data to disk/application.

**Possible Causes**

The application lacks file write permissions, or the file to be downloaded exceeds 5MB.

**Resolution Steps**

Check the application permissions and the size of the file to be downloaded.

## 2300025 Upload Failed

**Error Message**

Upload failed.

**Error Description**

Upload failed.

**Possible Causes**

The file is too large or there are network issues. For FTP, the server typically rejects the STOR command. The error buffer usually contains the server's explanation.

**Resolution Steps**

Check the file size and network conditions.

## 2300026 Failed to Open/Read Local Data from File/Application

**Error Message**

Failed to open/read local data from file/application.

**Error Description**

Failed to open/read local data from file/application.

**Possible Causes**

The application lacks file read permissions.

**Resolution Steps**

Check the application permissions.

## 2300027 Out of Memory

**Error Message**

Out of memory.

**Error Description**

Out of memory.

**Possible Causes**

Insufficient memory.

**Resolution Steps**

Check the system memory.

## 2300028 Operation Timeout

**Error Message**

Timeout was reached.

**Error Description**

Operation timeout.

**Possible Causes**

TCP connection timeout or read/write timeout.

**Resolution Steps**

Investigate network issues.

## 2300047 Maximum Number of Redirects Reached

**Error Message**

Number of redirects hit maximum amount.

**Error Description**

The maximum number of redirects has been reached.

**Possible Causes**

Too many redirects.

**Resolution Steps**

Investigate the server implementation.

## 2300052 Server Returned No Content

**Error Message**

Server returned nothing (no headers, no data).

**Error Description**

The server returned no content.

**Possible Causes**

This may be related to the server implementation.

**Resolution Steps**

Investigate the server implementation.

## 2300055 Failed to Send Network Data**Error Message**

Failed sending data to the peer.

**Error Description**

Failed to send data to the peer, network data transmission failed.

**Possible Causes**

Network issues.

**Resolution Steps**

Troubleshoot the network.

## 2300056 Failed to Receive Network Data

**Error Message**

Failure when receiving data from the peer.

**Error Description**

Failed to receive data from the peer, network data reception failed.

**Possible Causes**

Network issues.

**Resolution Steps**

Troubleshoot network issues.

## 2300058 Local SSL Certificate Error

**Error Message**

Problem with the local SSL certificate.

**Error Description**

Local SSL certificate error.

**Possible Causes**

Invalid SSL certificate format.

**Resolution Steps**

Check the SSL certificate format.

## 2300059 Specified Cipher Not Supported

**Error Message**

Couldn't use specified SSL cipher.

**Error Description**

Specified cipher is not supported.

**Possible Causes**

The encryption algorithm negotiated between client and server is not supported by the system.

**Resolution Steps**

Analyze the negotiated algorithm via packet capture.

## 2300060 Invalid Remote Server SSL Certificate or SSH Key

**Error Message**

SSL peer certificate or SSH remote key was not OK.

**Error Description**

Invalid remote server SSL certificate or SSH key.

**Possible Causes**

Failed to verify server identity, possibly due to an expired certificate.

**Resolution Steps**

Check certificate validity.

## 2300061 Unrecognized or Invalid HTTP Encoding Format

**Error Message**

Unrecognized or bad HTTP Content or Transfer-Encoding.

**Error Description**

Unrecognized or invalid HTTP encoding format.

**Possible Causes**

Incorrect HTTP encoding format.

**Resolution Steps**

Investigate server implementation; currently, only gzip encoding is supported.

## 2300063 Maximum File Size Exceeded

**Error Message**

Maximum file size exceeded.

**Error Description**

Maximum file size exceeded.

**Possible Causes**

Downloaded file is too large.

**Resolution Steps**

Investigate server implementation.

## 2300070 Insufficient Server Disk Space

**Error Message**

Remote disk full or allocation exceeded.

**Error Description**

Insufficient server disk space.

**Possible Causes**

Server disk is full.

**Resolution Steps**

Check server disk space.

## 2300073 Remote File Already Exists

**Error Message**

Remote file already exists.

**Error Description**

Remote file already exists.

**Possible Causes**

During file upload, the server reported that the file already exists.

**Resolution Steps**

Investigate server implementation.

## 2300077 SSL CA Certificate Missing or No Access Rights

**Error Message**

Problem with the SSL CA cert (path? access rights?).

**Error Description**

SSL CA certificate missing or no access rights.

**Possible Causes**

Certificate does not exist or lacks access permissions.

**Resolution Steps**

Check certificate existence and access permissions.

## 2300078 Requested File Not Found

**Error Message**

Remote file not found.

**Error Description**

Requested file not found.

**Possible Causes**

The file requested by the URL does not exist.

**Resolution Steps**

Verify the existence of the requested file.

## 2300094 Authentication Failed

**Error Message**

An authentication function returned an error.

**Error Description**

Authentication failed.

**Possible Causes**

Provided authentication fields do not match server records.

**Resolution Steps**

Verify if the provided authentication fields match server records.

## 2300999 Unknown Error

**Error Message**

Unknown Other Error.

**Error Description**

Unknown error.

**Possible Causes**

Unknown error.

**Resolution Steps**

Unknown error.