# Overview of I/O Streams

This chapter introduces fundamental I/O concepts and file operations.

In the Cangjie programming language, operations that interact with external carriers of applications are referred to as I/O operations. "I" stands for Input, and "O" stands for Output.

All I/O mechanisms in Cangjie are based on data streams for input and output, where these streams represent sequences of byte data. A data stream is a continuous collection of data, functioning like a pipeline that carries data - input is fed at one end and output is received at the other.

The Cangjie programming language abstracts input and output as Streams.

- Reading data from external storage into memory is called an Input Stream (InputStream). The input end can write data segments into the pipeline piece by piece, and these segments form a long data stream in sequence.
- Writing data from memory to external storage is called an Output Stream (OutputStream). The output end can also read data from the pipeline segment by segment, where each read can be of any length (without needing to match the input segments), but must follow the first-in-first-out order.

With this layer of abstraction, the Cangjie programming language can use a unified interface to interact with external data.

The Cangjie programming language describes various operations - including standard input/output, file operations, network data streams, string streams, encryption streams, compression streams, etc. - uniformly using the concept of Stream.

Stream primarily deals with raw binary data, where the smallest data unit in a Stream is the `Byte`.

In Cangjie, Stream is defined as an `interface`, allowing different Streams to be combined using the decorator pattern, significantly enhancing extensibility.

## Input Stream

A program reads data sources (including external devices like keyboards, files, networks, etc.) from an input stream. An input stream is the communication channel that reads data sources into the program.

The Cangjie programming language uses the `InputStream` interface type to represent input streams. It provides a `read` function that writes readable data into a `buffer`, with the return value indicating the total number of bytes read in that operation.

InputStream interface definition:

<!-- run -->

```cangjie
interface InputStream {
    func read(buffer: Array<Byte>): Int64
}
```

When you have an input stream, you can read byte data as shown in the following example. The read data will be written into the input parameter array of `read`.

Input stream reading example:

<!-- run -->

```cangjie
import std.io.InputStream
import std.io.ByteBuffer

main() {
    let input: InputStream = ByteBuffer("Hello World".toArray())
    let buf = Array<Byte>(256, repeat: 0)
    while (input.read(buf) > 0) {
        println(String.fromUtf8(buf))
    }
}
```

## Output Stream

A program writes data to an output stream. An output stream is the communication channel that outputs data from the program to external destinations (displays, printers, files, networks, etc.).

The Cangjie programming language uses the `OutputStream` interface type to represent output streams. It provides a `write` function that writes data from the `buffer` into the bound stream.

Notably, some output streams' `write` operations don't immediately write to external storage but employ certain buffering strategies for performance optimization. The data is only physically written when certain conditions are met or when `flush` is explicitly called.

To uniformly handle these `flush` operations, `OutputStream` includes a default implementation of `flush`, helping to standardize API call differences.

OutputStream interface definition:

<!-- run -->

```cangjie
interface OutputStream {
    func write(buffer: Array<Byte>): Unit

    func flush(): Unit {
        // Empty implementation
    }
}
```

When you have an output stream, you can write byte data to it.

Output stream writing example:

<!-- run -->

```cangjie
import std.io.OutputStream
import std.io.ByteBuffer

main() {
    let output: OutputStream = ByteBuffer()
    let buf = "Hello World".toArray()
    output.write(buf)
    output.flush()
}
```

## Stream Classification

Based on their functional differences, Streams can be broadly categorized into two types:

- Node Streams: Directly provide data sources. Node streams are typically constructed by directly depending on external resources (e.g., files, networks).
- Processing Streams: Can only process data by proxying other streams. Processing streams are typically constructed by depending on other streams.