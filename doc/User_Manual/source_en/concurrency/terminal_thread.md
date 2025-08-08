# Terminating Threads

The `cancel()` method of `Future<T>` can be used to send a termination request to the corresponding thread, but this method does not forcibly stop thread execution. Developers need to use the `hasPendingCancellation` property of `Thread` to check whether a termination request exists for the thread.

Generally, if a thread has a pending termination request, developers should implement appropriate thread termination logic. Therefore, the actual termination of the thread is left to the developer's discretion. If the termination request is ignored, the thread will continue executing until it completes normally.

Example code:

<!-- verify -->

```cangjie
import std.sync.SyncCounter

main(): Unit {
    let syncCounter = SyncCounter(1)
    let fut = spawn {
        syncCounter.waitUntilZero()  // block until the syncCounter becomes zero
        if (Thread.currentThread.hasPendingCancellation) {  // Check cancellation request
            println("cancelled")
            return
        }
        println("hello")
    }
    fut.cancel()    // Send cancellation request
    syncCounter.dec()
    fut.get() // Join thread
}
```

Output:

```text
cancelled
```