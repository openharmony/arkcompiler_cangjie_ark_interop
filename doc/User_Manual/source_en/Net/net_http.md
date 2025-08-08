# HTTP Programming

HTTP, as a universal application-layer protocol, facilitates data transmission through a request-response mechanism where clients send requests and servers return responses. The format of requests and responses is fixed, consisting of headers and a body.

The most commonly used request types are GET and POST. A GET request contains only headers and is used to request application-layer data from the server. A POST request includes a body, separated from the headers by an empty line, and is used to provide application-layer data to the server.

Request and response headers contain numerous fields, which won't be exhaustively detailed here. Cangjie supports HTTP protocol versions 1.0/1.1/2.0. Developers can construct requests and responses based on RFCs 9110, 9112, 9113, 9218, 7541, and using Cangjie's `HttpRequestBuilder` and `HttpResponseBuilder` classes.

The following example demonstrates client-server programming with Cangjie, implementing functionality where the client sends a GET /hello request and the server responds with "Hello Cangjie!" in the response body:

> **Note:**
>
> Libraries such as `net` and `log` have been moved from the Cangjie SDK to the `stdx` module. Before use, download the package and configure it in `cjpm.toml`.

<!-- verify -->

```cangjie
import stdx.net.http.*
import std.time.*
import std.sync.*
import stdx.log.*

// 1. Create Server instance
let server = ServerBuilder()
    .addr("127.0.0.1")
    .port(0)
    .build()

func startServer(): Unit {
    // 2. Register request handler
    server.distributor.register("/hello", {httpContext =>
        httpContext.responseBuilder.body("Hello Cangjie!")
    })
    server.logger.level = LogLevel.OFF
    // 3. Start service
    server.serve()
}

func startClient(): Unit {
    // 1. Create client instance
    let client = ClientBuilder().build()
    // 2. Send request
    let response = client.get("http://127.0.0.1:${server.port}/hello")
    // 3. Read response body
    let buffer = Array<Byte>(32, repeat: 0)
    let length = response.body.read(buffer)
    println(String.fromUtf8(buffer[..length]))
    // 4. Close connection
    client.close()
}

main () {
    spawn {
        startServer()
    }
    sleep(Duration.second)
    startClient()
}
```

Compiling and executing the above code will print:

```text
Hello Cangjie!
```