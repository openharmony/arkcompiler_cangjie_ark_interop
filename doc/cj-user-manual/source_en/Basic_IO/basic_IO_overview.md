# Overview of I/O Streams

This chapter introduces fundamental I/O concepts and file operations.

In the Cangjie programming language, operations that interact with external carriers of applications are referred to as I/O operations. "I" stands for Input, and "O" stands for Output.

All I/O mechanisms in Cangjie are based on data streams for input and output. These data streams represent sequences of byte data. A data stream is a continuous collection of data, functioning like a pipeline that carries data - input is written at one end and output is read from the other.

The Cangjie programming language abstracts input and output as Streams.

- Reading data from external storage into memory is called an input stream (InputStream). The input end can write data segments into the pipeline piece by piece, and these segments form a long data stream in sequence.
- Writing data from memory to external storage is called an output stream (OutputStream). The output end can also read data segments from the pipeline piece by piece, each time reading any length of data (without needing to match the input end), but only in the order they were input.

With this abstraction layer, the Cangjie programming language can use a unified interface to interact with external data.

The Cangjie programming language describes various operations such as standard input/output, file operations, network data streams, string streams, encryption streams, compression streams, etc., uniformly using Stream.

Stream primarily handles raw binary data, with the smallest data unit in Stream being `Byte`.

The Cangjie programming language defines Stream as an `interface`, allowing different Streams to be combined using the decorator pattern, greatly enhancing extensibility.

## Input Stream

A program reads data sources (including external keyboards, files, networks, etc.) from an input stream, meaning the input stream is the communication channel that reads data sources into the program.

The Cangjie programming language uses the `InputStream` interface type to represent an input stream, providing a `read` function. This function writes readable data into a `buffer`, with the return value indicating the total number of bytes read in that operation.

InputStream interface definition:

<!-- run -->

```cangjie
interface InputStream {
    func read(buffer: Array<Byte>): Int64
}
```

When you have an input stream, you can read byte data as shown in the following code. The read data will be written into the input parameter array of `read`.

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

A program writes data to an output stream. The output stream is the communication channel that outputs data from the program to the outside world (displays, printers, files, networks, etc.).

The Cangjie programming language uses the `OutputStream` interface type to represent an output stream, providing a `write` function. This function writes data from the `buffer` into the bound stream.

Notably, some output streams' `write` operations do not immediately write to external storage but employ certain buffering strategies. Data is only actually written when certain conditions are met or when `flush` is actively called, aiming to improve performance.

To uniformly handle these `flush` operations, `OutputStream` includes a default implementation of `flush`, which helps smooth out API call differences.

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

When you have an output stream, you can write byte data.

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

## Classification of Data Streams

Based on the functional differences of data streams, Streams can be simply divided into two categories:

- Node Streams: Directly provide data sources. Node streams are typically constructed by relying on some direct external resource (such as files, networks, etc.).
- Processing Streams: Can only act as proxies for other data streams to perform processing. Processing streams are typically constructed by relying on other streams.