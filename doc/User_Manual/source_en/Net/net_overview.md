# Overview of Network Programming

Network communication is the process of data exchange between two devices over a computer network. The act of writing software to achieve network communication is referred to as network programming.

Cangjie provides developers with fundamental network programming capabilities. Within the Cangjie standard library, developers can utilize the `socket` package under the `std` module to implement transport-layer network communication.

In transport-layer protocols, there are two categories: unreliable transmission and reliable transmission. Cangjie abstracts these as `DatagramSocket` and `StreamSocket`, respectively. Among unreliable transmission protocols, UDP is the most common, while TCP is the predominant reliable transmission protocol. Cangjie abstracts these as `UdpSocket` and `TcpSocket` accordingly. Additionally, Cangjie implements support for the transport-layer Unix Domain protocol, enabling communication through both reliable and unreliable transmission methods.

At the application layer, the HTTP protocol is widely used, particularly in developing web applications. Currently, there are multiple versions of the HTTP protocol, and Cangjie supports HTTP/1.0, HTTP/1.1, and HTTP/2.0.

Furthermore, WebSocket, as an application-layer protocol designed to enhance communication efficiency between web servers and clients, is abstracted by Cangjie as the `WebSocket` object. Cangjie also supports protocol upgrades from HTTP to WebSocket.

It is important to note that Cangjie's network programming is blocking. However, it is the Cangjie thread that gets blocked, and during blocking, the Cangjie thread yields the system thread, thus not actually blocking a system thread.