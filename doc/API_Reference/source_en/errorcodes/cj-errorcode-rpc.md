# RPC Error Codes

## 1900001 mmap System Call Failed

**Error Message**

Failed to call mmap.

**Error Description**

The mmap system call execution failed.

**Possible Causes**

1. The mapped region is too large.
2. High system memory pressure with insufficient available memory for mapping.

**Resolution Steps**

1. Verify if Ashmem::create() was called with excessively large memory allocation.
2. Check whether the system has sufficient available memory during mapping execution.

## 1900002 ioctl System Call Failed

**Error Message**

Failed to call ioctl.

**Error Description**

The ioctl system call execution on shared memory file descriptor failed.

**Possible Causes**

1. Invalid kernel parameters were specified.
2. The set type exceeds the type specified during shared memory mapping.

**Resolution Steps**

1. Verify if the called parameters originate from Ashmem class's PROT_EXEC, PROT_READ, and PROT_WRITE.
2. Check whether the specified parameters are subsets of the types indicated during shared memory mapping.

## 1900003 Shared Memory Write Failure

**Error Message**

Failed to write data to the shared memory.

**Error Description**

Data writing to shared memory failed.

**Possible Causes**

1. Single or cumulative write operations exceed the mapped shared memory size.
2. PROT_WRITE mode was not set for the shared memory.

**Resolution Steps**

1. Verify whether current write operations exceed the total mapped size.
2. Check if PROT_WRITE protection permission was configured.

## 1900004 Shared Memory Read Failure

**Error Message**

Failed to read data from the shared memory.

**Error Description**

Data reading from shared memory failed.

**Possible Causes**

1. Single or cumulative read operations exceed the mapped shared memory size.
2. PROT_READ mode was not set for the shared memory.

**Resolution Steps**

1. Verify whether current read operations exceed the total mapped size.
2. Check if PROT_READ protection permission was configured.

## 1900005 IPC Object Permission Error

**Error Message**

Operation allowed only for the proxy object.

**Error Description**

This operation is permitted only for proxy objects.

**Possible Causes**

A method supported exclusively by RemoteProxy was invoked on a RemoteObject.

**Resolution Steps**

Verify whether RemoteProxy-exclusive methods were called on a RemoteObject.

## 1900006 IPC Object Permission Error

**Error Message**

Operation allowed only for the remote object.

**Error Description**

This operation is permitted only for remote objects.

**Possible Causes**

A method supported exclusively by RemoteObject was invoked on a RemoteProxy.

**Resolution Steps**

Verify whether RemoteObject-exclusive methods were called on a RemoteProxy.

## 1900007 Remote Object Communication Failure

**Error Message**

Communication failed.

**Error Description**

Inter-process communication with remote object failed.

**Possible Causes**

1. The remote object has been destroyed.
2. The remote object was recreated after destruction, making the local proxy object obsolete.

**Resolution Steps**

1. Verify whether the remote object still exists.
2. Check if death notification was registered and whether the remote object was reconstructed.

## 1900008 Invalid IPC Object

**Error Message**

The proxy or remote object is invalid.

**Error Description**

Invalid proxy or remote object detected.

**Possible Causes**

1. The proxy object has expired.
2. The remote object has been destroyed.

**Resolution Steps**

1. Verify any anomalies during proxy object acquisition.
2. Check whether the remote object has been destructed.

## 1900009 MessageSequence Write Failure

**Error Message**

Failed to write data to the message sequence.

**Error Description**

Data writing to MessageSequence failed.

**Possible Cause**

The default sequence capacity has been exhausted.

**Resolution Steps**

Use MessageSequence's buffer space query methods to confirm remaining capacity.

## 1900010 MessageSequence Read Failure

**Error Message**

Failed to read data from the message sequence.

**Error Description**

Data reading from MessageSequence failed.

**Possible Cause**

Read operations don't match the write sequence.

**Resolution Steps**

Ensure read operations strictly follow the write sequence.

## 1900011 Memory Allocation Failure

**Error Message**

Memory allocation failed.

**Error Description**

Memory allocation failed during serialization.

**Possible Cause**

Excessively large data being written.

**Resolution Steps**

Verify whether written data or parameters exceed reasonable limits.

## 1900012 JS Method Failure

**Error Message**

Failed to call the JS callback function.

**Error Description**

JS callback function execution failed.

**Possible Cause**

Business logic JS method returned failure.

**Resolution Steps**

Verify successful execution of business JS methods.

## 1900013 dup System Call Failed

**Error Message**

Failed to call dup.

**Error Description**

The dup system call execution failed.

**Possible Causes**

1. Process file descriptor resources exhausted.
2. Input fd parameter was already closed.

**Resolution Steps**

1. Verify whether the input fd remains valid.
2. Investigate potential fd resource exhaustion in the process.