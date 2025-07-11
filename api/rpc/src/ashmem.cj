/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package ohos.rpc

import ohos.labels.*
import ohos.ffi.*
import ohos.base.BusinessException

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.IPC.Core"
]
public class Ashmem <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * The mapped memory is executable.
     *
     * @type { UInt32 }
     * @default 4
     * @syscap SystemCapability.Communication.IPC.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const PROT_EXEC: UInt32 = 4
    /**
     * The mapped memory is inaccessible.
     *
     * @type { UInt32 }
     * @default 0
     * @syscap SystemCapability.Communication.IPC.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const PROT_NONE: UInt32 = 0
    /**
     * The mapped memory is readable.
     *
     * @type { UInt32 }
     * @default 1
     * @syscap SystemCapability.Communication.IPC.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const PROT_READ: UInt32 = 1
    /**
     * The mapped memory is writable.
     *
     * @type { UInt32 }
     * @default 2
     * @syscap SystemCapability.Communication.IPC.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static const PROT_WRITE: UInt32 = 2

    /**
     * Creates an Ashmem object with the specified name and size.
     *
     * @param { String } name - Name of the Ashmem object to create.
     * @param { Int32 } size - Size (in bytes) of the Ashmem object to create.
     * @returns { Ashmem } Return the Ashmem object if it is created successfully; return null otherwise.
     * @throws { BusinessError } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match;
     *     3.The Ashmem name passed is empty;
     *     4.The Ashmem size passed is less than or equal to 0.
     * @syscap SystemCapability.Communication.IPC.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static func create(name: String, size: Int32): Ashmem {
        if (name.isEmpty()) {
            throw BusinessException(ErrorCode.CHECK_PARAM_ERROR, "Parameter error.")
        }
        try (cname = unsafe { LibC.mallocCString(name).asResource() }) {
            let id = unsafe { FfiRpcAshmemImplCreate(cname.value, size) }
            if (id < 0) {
                throw BusinessException(ErrorCode.CHECK_PARAM_ERROR, "Parameter error.")
            }
            return Ashmem(id)
        }
        throw BusinessException(0, "Unreachable branch.")
    }

    /**
     * Creates an Ashmem object by copying the file descriptor (FD) of an existing Ashmem object.
     * The two Ashmem objects point to the same shared memory region.
     *
     * @param { Ashmem } ashmem - Existing Ashmem object.
     * @returns { Ashmem } Ashmem object created.
     * @throws { BusinessError } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The passed parameter is not an Ahmem object;
     *     3.The ashmem instance for obtaining packaging is empty.
     * @syscap SystemCapability.Communication.IPC.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static func create(ashmem: Ashmem): Ashmem {
        var errCode: Int32 = 0
        let id = unsafe { FfiRpcAshmemImplCreateFromExisting(ashmem.getID(), inout errCode) }
        checkRet(errCode)
        return Ashmem(id)
    }

    /**
     * Closes this Ashmem object.
     *
     * @syscap SystemCapability.Communication.IPC.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func closeAshmem(): Unit {
        unsafe { FfiRpcAshmemImplCloseAshmem(getID()) }
    }

    /**
     * Deletes the mappings for the specified address range of this Ashmem object.
     *
     * @syscap SystemCapability.Communication.IPC.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func unmapAshmem(): Unit {
        unsafe { FfiRpcAshmemImplUnmapAshmem(getID()) }
    }

    /**
     * Obtains the mapped memory size of this Ashmem object.
     *
     * @returns { number } Memory size mapped.
     * @syscap SystemCapability.Communication.IPC.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func getAshmemSize(): Int32 {
        var errCode: Int32 = 0
        let size = unsafe { FfiRpcAshmemImplGetAshmemSize(getID(), inout errCode) }
        checkRet(errCode)
        return size
    }

    /**
     * Creates the shared file mapping on the virtual address space of this process.
     * The size of the mapping region is specified by this Ashmem object.
     *
     * @param { UInt32 } mapType - Protection level of the memory region to which the shared file is mapped.
     * @throws { BusinessError } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match;
     *     3.The passed mapType exceeds the maximum protection level.
     * @throws { BusinessError } 1900001 - Failed to call mmap.
     * @syscap SystemCapability.Communication.IPC.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func mapTypedAshmem(mapType: UInt32): Unit {
        var errCode = 0i32
        unsafe { FfiRpcAshmemImplMapTypedAshmem(getID(), mapType, inout errCode) }
        checkRet(errCode)
    }

    /**
     * Maps the shared file to the readable and writable virtual address space of the process.
     *
     * @throws { BusinessError } 1900001 - Failed to call mmap.
     * @syscap SystemCapability.Communication.IPC.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func mapReadWriteAshmem(): Unit {
        var errCode = 0i32
        unsafe { FfiRpcAshmemImplMapReadWriteAshmem(getID(), inout errCode) }
        checkRet(errCode)
    }

    /**
     * Maps the shared file to the read-only virtual address space of the process.
     *
     * @throws { BusinessError } 1900001 - Failed to call mmap.
     * @syscap SystemCapability.Communication.IPC.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func mapReadonlyAshmem(): Unit {
        var errCode = 0i32
        unsafe { FfiRpcAshmemImplMapReadonlyAshmem(getID(), inout errCode) }
        checkRet(errCode)
    }

    /**
     * Sets the protection level of the memory region to which the shared file is mapped.
     *
     * @param { number } protectionType - Protection type to set.
     * @throws { BusinessError } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match.
     * @throws { BusinessError } 1900002 - Failed to call ioctl.
     * @syscap SystemCapability.Communication.IPC.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func setProtectionType(protectionType: UInt32): Unit {
        var errCode = 0i32
        unsafe { FfiRpcAshmemImplSetProtectionType(getID(), protectionType, inout errCode) }
        checkRet(errCode)
    }

    /**
     * Writes data to the shared file associated with this Ashmem object.
     *
     * @param { Array<Byte> } buf - Data to write
     * @param { Int64 } size - Size of the data to write
     * @param { Int64 } offset - Start position of the data to write in the memory region associated
     *                   with this Ashmem object.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match;
     *     3.Failed to obtain arrayBuffer information.
     * @throws { BusinessException } 1900003 - Failed to write data to the shared memory.
     * @syscap SystemCapability.Communication.IPC.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeDataToAshmem(buf: Array<Byte>, size: Int64, offset: Int64): Unit {
        if (buf.size == 0) {
            throw BusinessException(ErrorCode.WRITE_TO_ASHMEM_ERROR, "Write to ashmem failed.")
        }
        unsafe {
            let cp = acquireArrayRawData(buf)
            var errCode = 0i32
            FfiRpcAshmemImplWriteDataToAshmem(getID(), cp.pointer, size, offset, inout errCode)
            releaseArrayRawData(cp)
            checkRet(errCode)
        }
    }

    /**
     * Reads data from the shared file associated with this Ashmem object.
     *
     * @param { Int64 } size - Size of the data to read.
     * @param { Int64 } offset - Start position of the data to read in the memory region associated
     *                   with this Ashmem object.
     * @returns { Array<Byte> } Data read.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match.
     * @throws { BusinessException } 1900004 - Failed to read data from the shared memory.
     * @syscap SystemCapability.Communication.IPC.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readDataFromAshmem(size: Int64, offset: Int64): Array<Byte> {
        unsafe {
            var errCode: Int32 = 0
            let data = FfiRpcAshmemImplReadDataFromAshmem(getID(), size, offset, inout errCode)
            checkRet(errCode)
            let arr = Array<Byte>(size, repeat: 0)
            let arrPtr = acquireArrayRawData(arr)
            memcpy_s(arrPtr.pointer, UIntNative(size), data, UIntNative(size))
            releaseArrayRawData(arrPtr)
            LibC.free(data)
            return arr
        }
    }
}
