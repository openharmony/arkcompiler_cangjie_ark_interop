# Socket Programming

Cangjie's socket programming refers to the implementation of network packet transmission functionality based on transport layer protocols.

In reliable transmission scenarios, Cangjie initiates client sockets and server sockets separately. The client socket must specify the remote address to connect to and may optionally bind to a local address. Only after a successful connection can it send and receive messages. The server socket, on the other hand, must bind to a local address, and only after successful binding can it send and receive messages.

In unreliable transmission scenarios, sockets do not need to distinguish between client and server roles. Cangjie initiates two sockets separately for data transmission. The socket must bind to a local address, and only after successful binding can it send and receive messages. Additionally, the socket may optionally specify a remote connection address. Once specified, it will only accept messages from that specific remote address, and when sending (via `send`), there's no need to specify the remote address—messages will be sent to the successfully connected address.

## TCP Programming

TCP, as a common reliable transmission protocol, serves as an example for TCP-type sockets. The reference programming model for Cangjie in reliable transmission scenarios is as follows:

1. Create a server socket and specify the local binding address.
2. Perform binding.
3. Execute the `accept` action, which will block and wait until a client socket connection is established.
4. Synchronously create a client socket and specify the remote address to connect to.
5. Perform the connection.
6. After a successful connection, the server will return a new socket via the `accept` interface. At this point, the server can perform read/write operations (i.e., send/receive messages) through this socket, while the client can directly perform read/write operations.

Example of TCP server and client programs:

<!-- verify -->

```cangjie
import std.time.*
import std.sync.*
import std.net.*

var SERVER_PORT: UInt16 = 0

func runTcpServer() {
    try (serverSocket = TcpServerSocket(bindAt: SERVER_PORT)) {
        serverSocket.bind()
        SERVER_PORT = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0

        try (client = serverSocket.accept()) {
            let buf = Array<Byte>(10, repeat: 0)
            let count = client.read(buf)

            // Data read by the server: [1, 2, 3, 0, 0, 0, 0, 0, 0, 0]
            println("Server read ${count} bytes: ${buf}")
        }
    }
}

main(): Int64 {
    let future = spawn {
        runTcpServer()
    }
    sleep(Duration.millisecond * 500)

    try (socket = TcpSocket("127.0.0.1", SERVER_PORT)) {
        socket.connect()
        socket.write([1, 2, 3])
    }

    future.get()

    return 0
}
```

Compiling and executing the above code will print:

```text
Server read 3 bytes: [1, 2, 3, 0, 0, 0, 0, 0, 0, 0]
```

## UDP Programming

UDP, as a common unreliable transmission protocol, serves as an example for UDP-type sockets. The reference programming model for Cangjie in unreliable transmission scenarios is as follows:

1. Create a socket and specify the local binding address.
2. Perform binding.
3. Specify the remote address for message sending.
4. In scenarios without connecting to a remote address, messages from different remote addresses can be received, and the remote address information can be returned.

Example of UDP message sending and receiving program:

<!-- verify -->

```cangjie
import std.time.*
import std.sync.*
import std.net.*

let SERVER_PORT: UInt16 = 8080

func runUpdServer() {
    try (serverSocket = UdpSocket(bindAt: SERVER_PORT)) {
        serverSocket.bind()

        let buf = Array<Byte>(3, repeat: 0)
        let (clientAddr, count) = serverSocket.receiveFrom(buf)
        let sender = (clientAddr as IPSocketAddress)?.address.toString() ?? ""

        // Server receive 3 bytes: [1, 2, 3] from 127.0.0.1
        println("Server receive ${count} bytes: ${buf} from ${sender}")
    }
}

main(): Int64 {
    let future = spawn {
        runUpdServer()
    }
    sleep(Duration.second)

    try (udpSocket = UdpSocket(bindAt: 0)) {
        udpSocket.sendTimeout = Duration.second * 2
        udpSocket.bind()
        udpSocket.sendTo(
            IPSocketAddress("127.0.0.1", SERVER_PORT),
            [1, 2, 3]
        )
    }

    future.get()

    return 0
}
```

Compiling and executing the above code will print:

```text
Server receive 3 bytes: [1, 2, 3] from 127.0.0.1
```