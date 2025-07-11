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

import ohos.ffi.*
import ohos.base.BusinessException
import std.collection.ArrayList
import ohos.labels.*

const BYTE_SIZE_16: UIntNative = 2
const BYTE_SIZE_32: UIntNative = 4
const BYTE_SIZE_64: UIntNative = 8

/**
 * A data object used for remote procedure call (RPC).
 * <p>
 * During RPC, the sender can use the write methods provided by {@link MessageSequence} to
 * write the to-be-sent data into a {@link MessageSequence} object in a specific format, and the receiver can use the
 * read methods provided by {@link MessageSequence} to read data of the specific format from
 * the {@link MessageSequence} object.
 * <p>
 * <p>
 * The default capacity of a {@link MessageSequence} instance is 200KB. If you want more or less,
 * use {@link #setCapacity(int)} to change it.
 * </p>
 * <b>Note</b>: Only data of the following data types can be written into or read from a {@link MessageSequence}:
 * Int8, Int8Array, Int16, Int16Array, Int32, Int32Array, Int64, Int64Array, Float32, Float32Array, Float64, Float64Array,
 * Bool, BoolArray, UInt8, UInt8Array, String, StringArray,
 * {@link Parcelable}, and ParcelableArray.
 *
 * @relation class MessageSequence
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.IPC.Core"
]
public class MessageSequence <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Creates an empty {@link MessageSequence} object.
     *
     * @returns { MessageSequence } Return the object created.
     * @relation static create(): MessageSequence;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static func create(): MessageSequence {
        let id: Int64 = unsafe { FfiRpcMessageSequenceImplCreate() }
        if (id < 0) {
            throw BusinessException(0, "[MessageSequence] create: Failed to create the instance!")
        }
        return MessageSequence(id)
    }

    /**
     * Reclaim the {@link MessageSequence} object.
     *
     * @relation reclaim(): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func reclaim(): Unit {
        releaseFFIData(myDataId)
    }

    /**
     * Writes an interface token into the {@link MessageSequence} object.
     *
     * @param { String } token - Interface descriptor to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match;
     *     3.The String length exceeds 40960 bytes;
     *     4.The number of bytes copied to the buffer is different from the length of the obtained String.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeInterfaceToken(token: string): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeInterfaceToken(token: String): Unit {
        try (ctoken = unsafe { LibC.mallocCString(token).asResource() }) {
            var errCode: Int32 = 0
            unsafe { FfiRpcMessageSequenceImplWriteInterfaceToken(getID(), ctoken.value, inout errCode) }
            checkRet(errCode)
        }
    }

    /**
     * Reads an interface token from the {@link MessageSequence} object.
     *
     * @returns { String } Return a String value.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readInterfaceToken(): string;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readInterfaceToken(): String {
        var errCode: Int32 = 0
        let returnStr: CString = unsafe { FfiRpcMessageSequenceImplReadInterfaceToken(getID(), inout errCode) }
        try {
            checkRet(errCode)
            return returnStr.toString()
        } finally {
            unsafe { LibC.free(returnStr) }
        }
    }

    /**
     * Obtains the size of data (in bytes) contained in the {@link MessageSequence} object.
     *
     * @returns { UInt32 } Return the size of data contained in the {@link MessageSequence} object.
     * @relation getSize(): number;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func getSize(): UInt32 {
        var errCode: Int32 = 0
        let returnNum: UInt32 = unsafe { FfiRpcMessageSequenceImplGetSize(getID(), inout errCode) }
        checkRet(errCode)
        return returnNum
    }

    /**
     * Obtains the storage capacity (in bytes) of the {@link MessageSequence} object.
     *
     * @returns { UInt32 } Return the storage capacity of the {@link MessageSequence} object.
     * @relation getCapacity(): number;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func getCapacity(): UInt32 {
        var errCode: Int32 = 0
        let returnNum: UInt32 = unsafe { FfiRpcMessageSequenceImplGetCapacity(getID(), inout errCode) }
        checkRet(errCode)
        return returnNum
    }

    /**
     * Sets the size of data (in bytes) contained in the {@link MessageSequence} object.
     * <p>{@code false} is returned if the data size set in this method is greater
     * than the storage capacity of the {@link MessageSequence}.
     *
     * @param { UInt32 } size - Indicates the data size of the {@link MessageSequence} object.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match.
     * @relation setSize(size: number): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func setSize(size: UInt32): Unit {
        var errCode: Int32 = 0
        unsafe { FfiRpcMessageSequenceImplSetSize(getID(), size, inout errCode) }
        checkRet(errCode)
    }

    /**
     * Sets the storage capacity (in bytes) of the {@link MessageSequence} object.
     * <p>{@code false} is returned if the capacity set in this method is less than
     * the size of data contained in the {@link MessageSequence}.
     *
     * @param { UInt32 } size - Indicates the storage capacity of the {@link MessageSequence} object.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match.
     * @throws { BusinessException } 1900011 - Memory allocation failed.
     * @relation setCapacity(size: number): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func setCapacity(size: UInt32): Unit {
        var errCode: Int32 = 0
        unsafe { FfiRpcMessageSequenceImplSetCapacity(getID(), size, inout errCode) }
        checkRet(errCode)
    }

    /**
     * Obtains the writable data space (in bytes) in the {@link MessageSequence} object.
     * <p>Writable data space = Storage capacity of the {@link MessageSequence} – Size of data contained in
     * the {@link MessageSequence}.
     *
     * @returns { UInt32 } Return the writable data space of the {@link MessageSequence} object.
     * @relation getWritableBytes(): number;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func getWritableBytes(): UInt32 {
        var errCode: Int32 = 0
        let returnNum: UInt32 = unsafe { FfiRpcMessageSequenceImplGetWritableBytes(getID(), inout errCode) }
        checkRet(errCode)
        return returnNum
    }

    /**
     * Obtains the readable data space (in bytes) in the {@link MessageSequence} object.
     * <p>Readable data space = Size of data contained in the {@link MessageSequence} – Size of data that has been read.
     *
     * @returns { UInt32 } Return the readable data space of the {@link MessageSequence} object.
     * @relation getReadableBytes(): number;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func getReadableBytes(): UInt32 {
        var errCode: Int32 = 0
        let returnNum: UInt32 = unsafe { FfiRpcMessageSequenceImplGetReadableBytes(getID(), inout errCode) }
        checkRet(errCode)
        return returnNum
    }

    /**
     * Obtains the current read position in the {@link MessageSequence} object.
     *
     * @returns { UInt32 } Return the current read position in the {@link MessageSequence} object.
     * @relation getReadPosition(): number;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func getReadPosition(): UInt32 {
        var errCode: Int32 = 0
        let returnNum: UInt32 = unsafe { FfiRpcMessageSequenceImplGetReadPosition(getID(), inout errCode) }
        checkRet(errCode)
        return returnNum
    }

    /**
     * Obtains the current write position in the {@link MessageSequence} object.
     *
     * @returns { UInt32 } Return the current write position in the {@link MessageSequence} object.
     * @relation getWritePosition(): number;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func getWritePosition(): UInt32 {
        var errCode: Int32 = 0
        let returnNum: UInt32 = unsafe { FfiRpcMessageSequenceImplGetWritePosition(getID(), inout errCode) }
        checkRet(errCode)
        return returnNum
    }

    /**
     * Changes the current read position in the {@link MessageSequence} object.
     * <p>Generally, you are advised not to change the current read position. If you must
     * change it, change it to an accurate position. Otherwise, the read data may be incorrect.
     *
     * @param { UInt32 } pos - Indicates the target position to start data reading.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match.
     * @relation rewindWrite(pos: number): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func rewindWrite(pos: UInt32): Unit {
        var errCode: Int32 = 0
        unsafe { FfiRpcMessageSequenceImplRewindWrite(getID(), pos, inout errCode) }
        checkRet(errCode)
    }

    /**
     * Changes the current write position in the {@link MessageSequence} object.
     * <p>Generally, you are advised not to change the current write position. If you must
     * change it, change it to an accurate position. Otherwise, the data to be read may be incorrect.
     *
     * @param { UInt32 } pos - Indicates the target position to start data writing.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match.
     * @relation rewindRead(pos: number): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func rewindRead(pos: UInt32): Unit {
        var errCode: Int32 = 0
        unsafe { FfiRpcMessageSequenceImplRewindRead(getID(), pos, inout errCode) }
        checkRet(errCode)
    }

    /**
     * Writes information to this MessageSequence object indicating that no exception occurred.
     * <p>After handling requests, you should call this method before writing any data to reply
     * {@link MessageSequence}.
     *
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeNoException(): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeNoException(): Unit {
        var errCode: Int32 = 0
        unsafe { FfiRpcMessageSequenceImplWriteNoException(getID(), inout errCode) }
        checkRet(errCode)
    }

    /**
     * Reads the exception information from this MessageSequence object.
     * <p>If exception was thrown in server side, it will be thrown here.
     * This method should be called before reading any data from reply {@link MessageSequence}
     * if {@link writeNoException} was invoked in server side.
     *
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readException(): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readException(): Unit {
        var errCode: Int32 = 0
        let errMsg: CString = unsafe { FfiRpcMessageSequenceImplReadException(getID(), inout errCode) }
        if (errCode != 0) {
            try {
                let msg = errMsg.toString()
                throw BusinessException(errCode, msg)
            } finally {
                unsafe { LibC.free(errMsg) }
            }
        }
    }

    /**
     * Writes a Int8 value into the {@link MessageSequence} object.
     *
     * @param { Int8 } val - Indicates the Int8 value to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeByte(val: number): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeByte(val: Int8): Unit {
        var errCode: Int32 = 0
        unsafe { FfiRpcMessageSequenceImplWriteByte(getID(), val, inout errCode) }
        checkRet(errCode)
    }

    /**
     * Writes a Int16 value into the {@link MessageSequence} object.
     *
     * @param { Int16 } val - Indicates the Int16 value to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeShort(val: number): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeShort(val: Int16): Unit {
        var errCode: Int32 = 0
        unsafe { FfiRpcMessageSequenceImplWriteShort(getID(), val, inout errCode) }
        checkRet(errCode)
    }

    /**
     * Writes an Int32 into the {@link MessageSequence} object.
     *
     * @param { Int32 } val - Indicates the Int32 value to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeInt(val: number): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeInt(val: Int32): Unit {
        var errCode: Int32 = 0
        unsafe { FfiRpcMessageSequenceImplWriteInt(getID(), val, inout errCode) }
        checkRet(errCode)
    }

    /**
     * Writes a Int64 value into the {@link MessageSequence} object.
     *
     * @param { Int64 } val - Indicates the Int64 value to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeLong(val: number): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeLong(val: Int64): Unit {
        var errCode: Int32 = 0
        unsafe { FfiRpcMessageSequenceImplWriteLong(getID(), val, inout errCode) }
        checkRet(errCode)
    }

    /**
     * Writes a Float32 value into the {@link MessageSequence} object.
     *
     * @param { Float32 } val - Indicates the Float32 value to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeFloat(val: number): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeFloat(val: Float32): Unit {
        var errCode: Int32 = 0
        unsafe { FfiRpcMessageSequenceImplWriteFloat(getID(), val, inout errCode) }
        checkRet(errCode)
    }

    /**
     * Writes a Float64 value into the {@link MessageSequence} object.
     *
     * @param { Float64 } val - Indicates the Float64 value to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeDouble(val: number): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeDouble(val: Float64): Unit {
        var errCode: Int32 = 0
        unsafe { FfiRpcMessageSequenceImplWriteDouble(getID(), val, inout errCode) }
        checkRet(errCode)
    }

    /**
     * Writes a Bool value into the {@link MessageSequence} object.
     *
     * @param { Bool } val - Indicates the Bool value to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeBoolean(val: boolean): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeBoolean(val: Bool): Unit {
        let value: Int8 = if (val) {
            1
        } else {
            0
        }
        var errCode: Int32 = 0
        unsafe { FfiRpcMessageSequenceImplWriteBoolean(getID(), value, inout errCode) }
        checkRet(errCode)
    }

    /**
     * Writes a UInt8 value into the {@link MessageSequence} object.
     *
     * @param { UInt8 } val - Indicates the UInt8 value to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeChar(val: number): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeChar(val: UInt8): Unit {
        var errCode: Int32 = 0
        unsafe { FfiRpcMessageSequenceImplWriteChar(getID(), val, inout errCode) }
        checkRet(errCode)
    }

    /**
     * Writes a String value into the {@link MessageSequence} object.
     *
     * @param { String } val - Indicates the String value to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match;
     *     3.The String length exceeds 40960 bytes;
     *     4.The number of bytes copied to the buffer is different from the length of the obtained String.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeString(val: string): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeString(val: String): Unit {
        let value: CString = unsafe { LibC.mallocCString(val) }
        var errCode: Int32 = 0
        unsafe { FfiRpcMessageSequenceImplWriteString(getID(), value, inout errCode) }
        unsafe { LibC.free(value) }
        checkRet(errCode)
    }

    /**
     * Writes a Int8 array into the {@link MessageSequence} object.
     *
     * @param { Array<Int8> } byteArray - Indicates the Int8 array to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match;
     *     4.The element does not exist in the array.
     *     5.The type of the element in the array is incorrect.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeParcelable(val: Parcelable): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeByteArray(byteArray: Array<Int8>): Unit {
        let value: ByteArray = ByteArray(byteArray)
        var errCode: Int32 = 0
        unsafe { FfiRpcMessageSequenceImplWriteByteArray(getID(), value, inout errCode) }
        value.free()
        checkRet(errCode)
    }

    /**
     * Writes a Int16 array into the {@link MessageSequence} object.
     * Ensure that the data type and size comply with the interface definition.
     * Otherwise,data may be truncated.
     *
     * @param { Array<Int16> } shortArray - Indicates the Int16 array to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match;
     *     4.The element does not exist in the array;
     *     5.The type of the element in the array is incorrect.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeByteArray(byteArray: number[]): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeShortArray(shortArray: Array<Int16>): Unit {
        let value: ShortArray = ShortArray(shortArray)
        var errCode: Int32 = 0
        unsafe { FfiRpcMessageSequenceImplWriteShortArray(getID(), value, inout errCode) }
        value.free()
        checkRet(errCode)
    }

    /**
     * Writes a Int32 array into the {@link MessageSequence} object.
     * Ensure that the data type and size comply with the interface definition.
     * Otherwise,data may be truncated.
     *
     * @param { Array<Int32> } intArray - Indicates the Int32 array to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match;
     *     4.The element does not exist in the array;
     *     5.The type of the element in the array is incorrect.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeIntArray(intArray: number[]): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeIntArray(intArray: Array<Int32>): Unit {
        let value: CIntArray = CIntArray(intArray)
        var errCode: Int32 = 0
        unsafe { FfiRpcMessageSequenceImplWriteIntArray(getID(), value, inout errCode) }
        value.free()
        checkRet(errCode)
    }

    /**
     * Writes a Int64 array into the {@link MessageSequence} object.
     * Ensure that the data type and size comply with the interface definition.
     * Otherwise,data may be truncated.
     *
     * @param { Array<Int64> } longArray - Indicates the Int64 array to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match;
     *     4.The element does not exist in the array;
     *     5.The type of the element in the array is incorrect.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeLongArray(longArray: number[]): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeLongArray(longArray: Array<Int64>): Unit {
        let value: LongArray = LongArray(longArray)
        var errCode: Int32 = 0
        unsafe { FfiRpcMessageSequenceImplWriteLongArray(getID(), value, inout errCode) }
        value.free()
        checkRet(errCode)
    }

    /**
     * Writes a Float32 array into the {@link MessageSequence} object.
     * Ensure that the data type and size comply with the interface definition.
     * Otherwise,data may be truncated.
     *
     * @param { Array<Float32> } floatArray - Indicates the Float32 array to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match;
     *     4.The element does not exist in the array;
     *     5.The type of the element in the array is incorrect.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeFloatArray(floatArray: number[]): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeFloatArray(floatArray: Array<Float32>): Unit {
        let value: FloatArray = FloatArray(floatArray)
        var errCode: Int32 = 0
        unsafe { FfiRpcMessageSequenceImplWriteFloatArray(getID(), value, inout errCode) }
        value.free()
        checkRet(errCode)
    }

    /**
     * Writes a Float64 array into the {@link MessageSequence} object.
     * Ensure that the data type and size comply with the interface definition.
     * Otherwise,data may be truncated.
     *
     * @param { Array<Float64> } doubleArray - Indicates the Float64 array to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match;
     *     4.The element does not exist in the array;
     *     5.The type of the element in the array is incorrect.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeDoubleArray(doubleArray: number[]): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeDoubleArray(doubleArray: Array<Float64>): Unit {
        let value: DoubleArray = DoubleArray(doubleArray)
        var errCode: Int32 = 0
        unsafe { FfiRpcMessageSequenceImplWriteDoubleArray(getID(), value, inout errCode) }
        value.free()
        checkRet(errCode)
    }

    /**
     * Writes a Bool array into the {@link MessageSequence} object.
     * Ensure that the data type and size comply with the interface definition.
     * Otherwise,data may be truncated.
     *
     * @param { Array<Bool> } booleanArray - Indicates the Bool array to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match;
     *     4.The element does not exist in the array.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeBooleanArray(booleanArray: boolean[]): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeBooleanArray(booleanArray: Array<Bool>): Unit {
        let byteArr = Array<Int8>(
            booleanArray.size,
            {
                i => if (booleanArray[i]) {
                    1
                } else {
                    0
                }
            }
        )
        let value: ByteArray = ByteArray(byteArr)
        var errCode: Int32 = 0
        unsafe { FfiRpcMessageSequenceImplWriteBooleanArray(getID(), value, inout errCode) }
        value.free()
        checkRet(errCode)
    }

    /**
     * Writes a UInt8 array into the {@link MessageSequence} object.
     * Ensure that the data type and size comply with the interface definition.
     * Otherwise,data may be truncated.
     *
     * @param { Array<UInt8> } charArray - Indicates the UInt8 array to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match;
     *     4.The element does not exist in the array.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeCharArray(charArray: number[]): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeCharArray(charArray: Array<UInt8>): Unit {
        let value: CharArray = CharArray(charArray)
        var errCode: Int32 = 0
        unsafe { FfiRpcMessageSequenceImplWriteCharArray(getID(), value, inout errCode) }
        value.free()
        checkRet(errCode)
    }

    /**
     * Writes a String array into the {@link MessageSequence} object.
     * Ensure that the data type and size comply with the interface definition.
     * Otherwise,data may be truncated.
     *
     * @param { Array<String> } StringArray - Indicates the String array to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match;
     *     4.The String length exceeds 40960 bytes;
     *     5.The number of bytes copied to the buffer is different from the length of the obtained String.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeStringArray(stringArray: string[]): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeStringArray(stringArray: Array<String>): Unit {
        let value: CStringArray = CStringArray(stringArray)
        var errCode: Int32 = 0
        unsafe { FfiRpcMessageSequenceImplWriteStringArray(getID(), value, inout errCode) }
        value.free()
        checkRet(errCode)
    }

    /**
     * Reads a Int8 value from the {@link MessageParcel} object.
     *
     * @returns { Int8 } Return a Int8 value.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readByte(): number;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readByte(): Int8 {
        var errCode: Int32 = 0
        let returnNum: Int8 = unsafe { FfiRpcMessageSequenceImplReadByte(getID(), inout errCode) }
        checkRet(errCode)
        return returnNum
    }

    /**
     * Reads a Int16 value from the {@link MessageSequence} object.
     *
     * @returns { Int16 } Return a Int16 value.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readShort(): number;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readShort(): Int16 {
        var errCode: Int32 = 0
        let returnNum: Int16 = unsafe { FfiRpcMessageSequenceImplReadShort(getID(), inout errCode) }
        checkRet(errCode)
        return returnNum
    }

    /**
     * Reads an Int32 value from the {@link MessageSequence} object.
     *
     * @returns { Int32 } Return an Int32 value.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readInt(): number;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readInt(): Int32 {
        var errCode: Int32 = 0
        let returnNum: Int32 = unsafe { FfiRpcMessageSequenceImplReadInt(getID(), inout errCode) }
        checkRet(errCode)
        return returnNum
    }

    /**
     * Reads a Int64 value from the {@link MessageSequence} object.
     *
     * @returns { Int64 } Return a Int64 value.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readLong(): number;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readLong(): Int64 {
        var errCode: Int32 = 0
        let returnNum: Int64 = unsafe { FfiRpcMessageSequenceImplReadLong(getID(), inout errCode) }
        checkRet(errCode)
        return returnNum
    }

    /**
     * Reads a Float32 value from the {@link MessageSequence} object.
     *
     * @returns { Float32 } Return a Float32 value.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readFloat(): number;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readFloat(): Float32 {
        var errCode: Int32 = 0
        let returnNum: Float32 = unsafe { FfiRpcMessageSequenceImplReadFloat(getID(), inout errCode) }
        checkRet(errCode)
        return returnNum
    }

    /**
     * Reads a Float64 value from the {@link MessageSequence} object.
     *
     * @returns { Float64 } Return a Float64 value.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readDouble(): number;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readDouble(): Float64 {
        var errCode: Int32 = 0
        let returnNum: Float64 = unsafe { FfiRpcMessageSequenceImplReadDouble(getID(), inout errCode) }
        checkRet(errCode)
        return returnNum
    }

    /**
     * Reads a Bool value from the {@link MessageSequence} object.
     *
     * @returns { Bool } Return a Bool value.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readBoolean(): boolean;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readBoolean(): Bool {
        var errCode: Int32 = 0
        let returnNum: Int8 = unsafe { FfiRpcMessageSequenceImplReadBoolean(getID(), inout errCode) }
        checkRet(errCode)
        return if (returnNum == 1) {
            true
        } else {
            false
        }
    }

    /**
     * Reads a UInt8 value from the {@link MessageSequence} object.
     *
     * @returns { UInt8 } Return a UInt8 value.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readChar(): number;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readChar(): UInt8 {
        var errCode: Int32 = 0
        let returnNum: UInt8 = unsafe { FfiRpcMessageSequenceImplReadChar(getID(), inout errCode) }
        checkRet(errCode)
        return returnNum
    }

    /**
     * Reads a String value from the {@link MessageSequence} object.
     *
     * @returns { String } Return a String value.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readString(): string;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readString(): String {
        var errCode: Int32 = 0
        let returnStr: CString = unsafe { FfiRpcMessageSequenceImplReadString(getID(), inout errCode) }
        try {
            checkRet(errCode)
            return returnStr.toString()
        } finally {
            unsafe { LibC.free(returnStr) }
        }
    }

    /**
     * Writes a Int8 array into the {@link MessageSequence} object.
     *
     * @param { ArrayList<Int8> } dataIn - Indicates the Int8 array read from MessageSequence.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readByteArray(dataIn: number[]): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readByteArray(dataIn: ArrayList<Int8>): Unit {
        let arr = readByteArray()
        dataIn.add(all: arr)
    }

    /**
     * Reads a Int8 array from the {@link MessageSequence} object.
     *
     * @returns { Array<Int8> } Return a Int8 array.
     * @throws { BusinessException } 401 - check param failed
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readByteArray(): number[];
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readByteArray(): Array<Int8> {
        var errCode: Int32 = 0
        let returnArr: ByteArray = unsafe { FfiRpcMessageSequenceImplReadByteArray(getID(), inout errCode) }
        checkRet(errCode)
        let arr: Array<Int8> = returnArr.toArray()
        returnArr.free()
        return arr
    }

    /**
     * Reads a Int16 array from the {@link MessageSequence} object.
     *
     * @param { ArrayList<Int16> } dataIn - Indicates the Int16 array read from MessageSequence.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readShortArray(dataIn: number[]): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readShortArray(dataIn: ArrayList<Int16>): Unit {
        let arr = readShortArray()
        dataIn.add(all: arr)
    }

    /**
     * Reads a Int16 array from the {@link MessageSequence} object.
     *
     * @returns { Array<Int16> } Return a Int16 array.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readShortArray(): number[];
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readShortArray(): Array<Int16> {
        var errCode: Int32 = 0
        let returnArr: ShortArray = unsafe { FfiRpcMessageSequenceImplReadShortArray(getID(), inout errCode) }
        checkRet(errCode)
        let arr: Array<Int16> = returnArr.toArray()
        returnArr.free()
        return arr
    }

    /**
     * Reads an Int32 array from the {@link MessageSequence} object.
     *
     * @param { ArrayList<Int32> } dataIn - Indicates the Int32 array to read.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readIntArray(dataIn: number[]): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readIntArray(dataIn: ArrayList<Int32>): Unit {
        let arr = readIntArray()
        dataIn.add(all: arr)
    }

    /**
     * Reads an Int32 array from the {@link MessageSequence} object.
     *
     * @returns { Array<Int32> } Return an Int32 array.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readIntArray(): number[];
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readIntArray(): Array<Int32> {
        var errCode: Int32 = 0
        let returnArr: CIntArray = unsafe { FfiRpcMessageSequenceImplReadIntArray(getID(), inout errCode) }
        checkRet(errCode)
        let arr: Array<Int32> = returnArr.toArray()
        returnArr.free()
        return arr
    }

    /**
     * Reads a Int64 array from the {@link MessageSequence} object.
     *
     * @param { ArrayList<Int64> } dataIn - Indicates the Int64 array to read.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readLongArray(dataIn: number[]): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readLongArray(dataIn: ArrayList<Int64>): Unit {
        let arr = readLongArray()
        dataIn.add(all: arr)
    }

    /**
     * Reads a Int64 array from the {@link MessageSequence} object.
     *
     * @returns { Array<Int64> } Return a Int64 array.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readLongArray(): number[];
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readLongArray(): Array<Int64> {
        var errCode: Int32 = 0
        let returnArr: LongArray = unsafe { FfiRpcMessageSequenceImplReadLongArray(getID(), inout errCode) }
        checkRet(errCode)
        let arr: Array<Int64> = returnArr.toArray()
        returnArr.free()
        return arr
    }

    /**
     * Reads a Float32 array from the {@link MessageSequence} object.
     *
     * @param { ArrayList<Float32> } dataIn - Indicates the Float32 array to read.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readFloatArray(dataIn: number[]): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readFloatArray(dataIn: ArrayList<Float32>): Unit {
        let arr = readFloatArray()
        dataIn.add(all: arr)
    }

    /**
     * Reads a Float32 array from the {@link MessageSequence} object.
     *
     * @returns { Array<Float32> } Return a Float32 array.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readFloatArray(): number[];
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readFloatArray(): Array<Float32> {
        var errCode: Int32 = 0
        let returnArr: FloatArray = unsafe { FfiRpcMessageSequenceImplReadFloatArray(getID(), inout errCode) }
        checkRet(errCode)
        let arr: Array<Float32> = returnArr.toArray()
        returnArr.free()
        return arr
    }

    /**
     * Reads a Float64 array from the {@link MessageSequence} object.
     *
     * @param { ArrayList<Float64> } dataIn - Indicates the Float64 array to read.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readDoubleArray(dataIn: number[]): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readDoubleArray(dataIn: ArrayList<Float64>): Unit {
        let arr = readDoubleArray()
        dataIn.add(all: arr)
    }

    /**
     * Reads a Float64 array from the {@link MessageSequence} object.
     *
     * @returns { Array<Float64> } Return a Float64 array.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readDoubleArray(): number[];
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readDoubleArray(): Array<Float64> {
        var errCode: Int32 = 0
        let returnArr: DoubleArray = unsafe { FfiRpcMessageSequenceImplReadDoubleArray(getID(), inout errCode) }
        checkRet(errCode)
        let arr: Array<Float64> = returnArr.toArray()
        returnArr.free()
        return arr
    }

    /**
     * Reads a Bool array from the {@link MessageSequence} object.
     *
     * @param { ArrayList<Bool> } dataIn - Indicates the Bool array to read.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readBooleanArray(dataIn: boolean[]): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readBooleanArray(dataIn: ArrayList<Bool>): Unit {
        let arr = readBooleanArray()
        dataIn.add(all: arr)
    }

    /**
     * Reads a Bool array from the {@link MessageSequence} object.
     *
     * @returns { Array<Bool> } Return a Bool array.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readBooleanArray(): boolean[];
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readBooleanArray(): Array<Bool> {
        var errCode: Int32 = 0
        let returnArr: ByteArray = unsafe { FfiRpcMessageSequenceImplReadBooleanArray(getID(), inout errCode) }
        checkRet(errCode)
        let arr: Array<Bool> = returnArr.toBoolArray()
        returnArr.free()
        return arr
    }

    /**
     * Reads a UInt8 array from the {@link MessageSequence} object.
     *
     * @param { ArrayList<UInt8> } dataIn - Indicates the UInt8 array to read.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readCharArray(dataIn: number[]): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readCharArray(dataIn: ArrayList<UInt8>): Unit {
        let arr = readCharArray()
        dataIn.add(all: arr)
    }

    /**
     * Reads a UInt8 array from the {@link MessageSequence} object.
     *
     * @returns { Array<UInt8> } Return a UInt8 array.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readCharArray(): number[];
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readCharArray(): Array<UInt8> {
        var errCode: Int32 = 0
        let returnArr: CharArray = unsafe { FfiRpcMessageSequenceImplReadCharArray(getID(), inout errCode) }
        checkRet(errCode)
        let arr: Array<UInt8> = returnArr.toArray()
        returnArr.free()
        return arr
    }

    /**
     * Reads a String array from the {@link MessageSequence} object.
     *
     * @param { ArrayList<String> } dataIn - Indicates the String array to read.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readStringArray(dataIn: string[]): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readStringArray(dataIn: ArrayList<String>): Unit {
        let arr = readStringArray()
        dataIn.add(all: arr)
    }

    /**
     * Reads a String array from the {@link MessageSequence} object.
     *
     * @returns { Array<String> } Return a String array.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readStringArray(): string[];
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readStringArray(): Array<String> {
        var errCode: Int32 = 0
        let returnArr: CStringArray = unsafe { FfiRpcMessageSequenceImplReadStringArray(getID(), inout errCode) }
        try {
            checkRet(errCode)
            return returnArr.toArray()
        } finally {
            returnArr.free()
        }
    }

    /**
     * Closes the specified file descriptor.
     *
     * @param { Int32 } fd - File descriptor to be closed.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match.
     * @relation static closeFileDescriptor(fd: number): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static func closeFileDescriptor(fd: Int32): Unit {
        unsafe { FfiRpcMessageSequenceImplCloseFileDescriptor(fd) }
    }

    /**
     * Duplicates the specified file descriptor.
     *
     * @param { Int32 } fd - File descriptor to be duplicated.
     * @returns { Int32 } Return a duplicated file descriptor.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match.
     * @throws { BusinessException } 1900013 - Failed to call dup.
     * @relation static dupFileDescriptor(fd: number): number;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public static func dupFileDescriptor(fd: Int32): Int32 {
        let dupFd = unsafe { FfiRpcMessageSequenceImplDupFileDescriptor(fd) }
        if (dupFd < 0) {
            throw BusinessException(ErrorCode.OS_DUP_ERROR, ERR_CODE_MAP[ErrorCode.OS_DUP_ERROR])
        }
        return dupFd
    }

    /**
     * Checks whether this {@link MessageSequence} object contains a file descriptor.
     *
     * @returns { Bool } Return {@code true} if the {@link MessageSequence} object contains a file descriptor;
     *                      return {@code false} otherwise.
     * @relation containFileDescriptors(): boolean;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func containFileDescriptors(): Bool {
        var errCode: Int32 = 0
        let returnBool: Bool = unsafe { FfiRpcMessageSequenceImplContainFileDescriptors(getID(), inout errCode) }
        checkRet(errCode)
        return returnBool
    }

    /**
     * Writes a file descriptor to this {@link MessageSequence} object.
     *
     * @param { Int32 } fd - File descriptor to wrote.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeFileDescriptor(fd: number): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeFileDescriptor(fd: Int32): Unit {
        var errCode: Int32 = 0
        unsafe { FfiRpcMessageSequenceImplWriteFileDescriptor(getID(), fd, inout errCode) }
        checkRet(errCode)
    }

    /**
     * Reads a file descriptor from this {@link MessageSequence} object.
     *
     * @returns { Int32 } Return a file descriptor obtained.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readFileDescriptor(): number;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readFileDescriptor(): Int32 {
        var errCode: Int32 = 0
        let returnInt: Int32 = unsafe { FfiRpcMessageSequenceImplReadFileDescriptor(getID(), inout errCode) }
        checkRet(errCode)
        return returnInt
    }

    /**
     * Writes an anonymous shared memory object to this {@link MessageSequence} object.
     *
     * @param { Ashmem } ashmem - Anonymous shared memory object to wrote.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter is not an instance of the Ashmem object.
     * @throws { BusinessException } 1900003 - Failed to write data to the shared memory.
     * @relation writeAshmem(ashmem: Ashmem): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeAshmem(ashmem: Ashmem): Unit {
        var errCode: Int32 = 0
        unsafe { FfiRpcMessageSequenceImplWriteAshmem(getID(), ashmem.getID(), inout errCode) }
        checkRet(errCode)
    }

    /**
     * Reads the anonymous shared memory object from this {@link MessageSequence} object.
     *
     * @returns { Ashmem } Return the anonymous share object obtained.
     * @throws { BusinessException } 401 - check param failed
     * @throws { BusinessException } 1900004 - Failed to read data from the shared memory.
     * @relation readAshmem(): Ashmem;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readAshmem(): Ashmem {
        var errCode: Int32 = 0
        let ashmem: Int64 = unsafe { FfiRpcMessageSequenceImplReadAshmem(getID(), inout errCode) }
        checkRet(errCode)
        return Ashmem(ashmem)
    }

    /**
     * Obtains the maximum amount of raw data that can be sent in a time.
     *
     * @returns { UInt32 } 128 MB.
     * @relation getRawDataCapacity(): number;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func getRawDataCapacity(): UInt32 {
        var errCode: Int32 = 0
        let returnInt: UInt32 = unsafe { FfiRpcMessageSequenceImplGetRawDataCapacity(getID(), inout errCode) }
        checkRet(errCode)
        return returnInt
    }

    /**
     * Writes the data in an Array<Int8> object into this {@Link MessageSequence} object.
     *
     * @param { Array<Int8> } buf - Data to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match;
     *     4.The obtained value of typeCode is incorrect;
     *     5.Failed to obtain array information.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeArrayBuffer(buf: ArrayBuffer, typeCode: TypeCode): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeInt8Array(buf: Array<Int8>): Unit {
        if (buf.size == 0) {
            throw BusinessException(ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR,
                "MessageSequence writeInt8Array: Write data to message sequence failed.")
        }
        let cp = unsafe { acquireArrayRawData(buf) }
        var errCode = 0i32
        unsafe {
            FfiRpcMessageSequenceImplWriteArrayBuffer(getID(), INT8_ARRAY.value, CPointer<Unit>(cp.pointer),
                UIntNative(buf.size), inout errCode)
        }
        unsafe { releaseArrayRawData(cp) }
        checkRet(errCode)
    }

    /**
     * Writes the data in an Array<UInt8> object into this {@Link MessageSequence} object.
     *
     * @param { Array<UInt8> } buf - Data to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match;
     *     4.The obtained value of typeCode is incorrect;
     *     5.Failed to obtain array information.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeArrayBuffer(buf: ArrayBuffer, typeCode: TypeCode): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeUInt8Array(buf: Array<UInt8>): Unit {
        if (buf.size == 0) {
            throw BusinessException(ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR,
                "MessageSequence writeUInt8Array:  Write data to message sequence failed.")
        }
        let cp = unsafe { acquireArrayRawData(buf) }
        var errCode = 0i32
        unsafe {
            FfiRpcMessageSequenceImplWriteArrayBuffer(getID(), UINT8_ARRAY.value, CPointer<Unit>(cp.pointer),
                UIntNative(buf.size), inout errCode)
        }
        unsafe { releaseArrayRawData(cp) }
        checkRet(errCode)
    }

    /**
     * Writes the data in an Array<Int16> object into this {@Link MessageSequence} object.
     *
     * @param { Array<Int16> } buf - Data to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match;
     *     4.The obtained value of typeCode is incorrect;
     *     5.Failed to obtain array information.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeArrayBuffer(buf: ArrayBuffer, typeCode: TypeCode): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeInt16Array(buf: Array<Int16>): Unit {
        if (buf.size == 0) {
            throw BusinessException(ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR,
                "MessageSequence writeInt16Array:  Write data to message sequence failed.")
        }
        let cp = unsafe { acquireArrayRawData(buf) }
        var errCode = 0i32
        unsafe {
            FfiRpcMessageSequenceImplWriteArrayBuffer(getID(), INT16_ARRAY.value, CPointer<Unit>(cp.pointer),
                UIntNative(buf.size) * BYTE_SIZE_16, inout errCode)
        }
        unsafe { releaseArrayRawData(cp) }
        checkRet(errCode)
    }

    /**
     * Writes the data in an Array<UInt16> object into this {@Link MessageSequence} object.
     *
     * @param { Array<UInt16> } buf - Data to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match;
     *     4.The obtained value of typeCode is incorrect;
     *     5.Failed to obtain array information.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeArrayBuffer(buf: ArrayBuffer, typeCode: TypeCode): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeUInt16Array(buf: Array<UInt16>): Unit {
        if (buf.size == 0) {
            throw BusinessException(ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR,
                "MessageSequence writeUInt16Array:  Write data to message sequence failed.")
        }
        let cp = unsafe { acquireArrayRawData(buf) }
        var errCode = 0i32
        unsafe {
            FfiRpcMessageSequenceImplWriteArrayBuffer(getID(), UINT16_ARRAY.value, CPointer<Unit>(cp.pointer),
                UIntNative(buf.size) * BYTE_SIZE_16, inout errCode)
        }
        unsafe { releaseArrayRawData(cp) }
        checkRet(errCode)
    }

    /**
     * Writes the data in an Array<Int32> object into this {@Link MessageSequence} object.
     *
     * @param { Array<Int32> } buf - Data to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match;
     *     4.The obtained value of typeCode is incorrect;
     *     5.Failed to obtain array information.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeArrayBuffer(buf: ArrayBuffer, typeCode: TypeCode): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeInt32Array(buf: Array<Int32>): Unit {
        if (buf.size == 0) {
            throw BusinessException(ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR,
                "MessageSequence writeInt32Array:  Write data to message sequence failed.")
        }
        let cp = unsafe { acquireArrayRawData(buf) }
        var errCode = 0i32
        unsafe {
            FfiRpcMessageSequenceImplWriteArrayBuffer(getID(), INT32_ARRAY.value, CPointer<Unit>(cp.pointer),
                UIntNative(buf.size) * BYTE_SIZE_32, inout errCode)
        }
        unsafe { releaseArrayRawData(cp) }
        checkRet(errCode)
    }

    /**
     * Writes the data in an Array<UInt32> object into this {@Link MessageSequence} object.
     *
     * @param { Array<UInt32> } buf - Data to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match;
     *     4.The obtained value of typeCode is incorrect;
     *     5.Failed to obtain array information.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeArrayBuffer(buf: ArrayBuffer, typeCode: TypeCode): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeUInt32Array(buf: Array<UInt32>): Unit {
        if (buf.size == 0) {
            throw BusinessException(ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR,
                "MessageSequence writeUInt32Array:  Write data to message sequence failed.")
        }
        let cp = unsafe { acquireArrayRawData(buf) }
        var errCode = 0i32
        unsafe {
            FfiRpcMessageSequenceImplWriteArrayBuffer(getID(), UINT32_ARRAY.value, CPointer<Unit>(cp.pointer),
                UIntNative(buf.size) * BYTE_SIZE_32, inout errCode)
        }
        unsafe { releaseArrayRawData(cp) }
        checkRet(errCode)
    }

    /**
     * Writes the data in an Array<Int64> object into this {@Link MessageSequence} object.
     *
     * @param { Array<Int64> } buf - Data to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match;
     *     4.The obtained value of typeCode is incorrect;
     *     5.Failed to obtain array information.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeArrayBuffer(buf: ArrayBuffer, typeCode: TypeCode): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeInt64Array(buf: Array<Int64>): Unit {
        if (buf.size == 0) {
            throw BusinessException(ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR,
                "MessageSequence writeInt64Array:  Write data to message sequence failed.")
        }
        let cp = unsafe { acquireArrayRawData(buf) }
        var errCode = 0i32
        unsafe {
            FfiRpcMessageSequenceImplWriteArrayBuffer(getID(), BIGINT64_ARRAY.value, CPointer<Unit>(cp.pointer),
                UIntNative(buf.size) * BYTE_SIZE_64, inout errCode)
        }
        unsafe { releaseArrayRawData(cp) }
        checkRet(errCode)
    }

    /**
     * Writes the data in an Array<UInt64> object into this {@Link MessageSequence} object.
     *
     * @param { Array<UInt64> } buf - Data to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match;
     *     4.The obtained value of typeCode is incorrect;
     *     5.Failed to obtain array information.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeArrayBuffer(buf: ArrayBuffer, typeCode: TypeCode): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeUInt64Array(buf: Array<UInt64>): Unit {
        if (buf.size == 0) {
            throw BusinessException(ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR,
                "MessageSequence writeUInt64Array:  Write data to message sequence failed.")
        }
        let cp = unsafe { acquireArrayRawData(buf) }
        var errCode = 0i32
        unsafe {
            FfiRpcMessageSequenceImplWriteArrayBuffer(getID(), BIGUINT64_ARRAY.value, CPointer<Unit>(cp.pointer),
                UIntNative(buf.size) * BYTE_SIZE_64, inout errCode)
        }
        unsafe { releaseArrayRawData(cp) }
        checkRet(errCode)
    }

    /**
     * Writes the data in an Array<Float32> object into this {@Link MessageSequence} object.
     *
     * @param { Array<Float32> } buf - Data to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match;
     *     4.The obtained value of typeCode is incorrect;
     *     5.Failed to obtain array information.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeArrayBuffer(buf: ArrayBuffer, typeCode: TypeCode): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeFloat32Array(buf: Array<Float32>): Unit {
        if (buf.size == 0) {
            throw BusinessException(ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR,
                "MessageSequence writeFloat32Array:  Write data to message sequence failed.")
        }
        let cp = unsafe { acquireArrayRawData(buf) }
        var errCode = 0i32
        unsafe {
            FfiRpcMessageSequenceImplWriteArrayBuffer(getID(), FLOAT32_ARRAY.value, CPointer<Unit>(cp.pointer),
                UIntNative(buf.size) * BYTE_SIZE_32, inout errCode)
        }
        unsafe { releaseArrayRawData(cp) }
        checkRet(errCode)
    }

    /**
     * Writes the data in an Array<Float64> object into this {@Link MessageSequence} object.
     *
     * @param { Array<Float64> } buf - Data to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match;
     *     4.The obtained value of typeCode is incorrect;
     *     5.Failed to obtain array information.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeArrayBuffer(buf: ArrayBuffer, typeCode: TypeCode): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeFloat64Array(buf: Array<Float64>): Unit {
        if (buf.size == 0) {
            throw BusinessException(ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR,
                "MessageSequence writeFloat64Array:  Write data to message sequence failed.")
        }
        let cp = unsafe { acquireArrayRawData(buf) }
        var errCode = 0i32
        unsafe {
            FfiRpcMessageSequenceImplWriteArrayBuffer(getID(), FLOAT64_ARRAY.value, CPointer<Unit>(cp.pointer),
                UIntNative(buf.size) * BYTE_SIZE_64, inout errCode)
        }
        unsafe { releaseArrayRawData(cp) }
        checkRet(errCode)
    }

    /**
     * Reads raw data from this {@link MessageSequence} object.
     *
     * @returns { Array<Int8> } Returns the Array<Int8> obtained.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match;
     *     3.The obtained value of typeCode is incorrect;
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readArrayBuffer(typeCode: TypeCode): ArrayBuffer;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readInt8Array(): Array<Int8> {
        var errCode: Int32 = 0
        let buf: ByteArray = unsafe { FfiRpcMessageSequenceImplReadInt8ArrayBuffer(getID(), inout errCode) }
        checkRet(errCode)
        let result = buf.toArray()
        buf.free()
        return result
    }

    /**
     * Reads raw data from this {@link MessageSequence} object.
     *
     * @returns { Array<UInt8> } Returns the Array<UInt8> obtained.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match;
     *     3.The obtained value of typeCode is incorrect;
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readArrayBuffer(typeCode: TypeCode): ArrayBuffer;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readUInt8Array(): Array<UInt8> {
        var errCode: Int32 = 0
        let buf: CharArray = unsafe { FfiRpcMessageSequenceImplReadUInt8ArrayBuffer(getID(), inout errCode) }
        checkRet(errCode)
        let result = buf.toArray()
        buf.free()
        return result
    }

    /**
     * Reads raw data from this {@link MessageSequence} object.
     *
     * @returns { Array<Int16> } Returns the Array<Int16> obtained.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match;
     *     3.The obtained value of typeCode is incorrect;
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readArrayBuffer(typeCode: TypeCode): ArrayBuffer;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readInt16Array(): Array<Int16> {
        var errCode: Int32 = 0
        let buf: ShortArray = unsafe { FfiRpcMessageSequenceImplReadInt16ArrayBuffer(getID(), inout errCode) }
        checkRet(errCode)
        let result = buf.toArray()
        buf.free()
        return result
    }

    /**
     * Reads raw data from this {@link MessageSequence} object.
     *
     * @returns { Array<UInt16> } Returns the Array<UInt16> obtained.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match;
     *     3.The obtained value of typeCode is incorrect;
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readArrayBuffer(typeCode: TypeCode): ArrayBuffer;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readUInt16Array(): Array<UInt16> {
        var errCode: Int32 = 0
        let buf: UInt16Array = unsafe { FfiRpcMessageSequenceImplReadUInt16ArrayBuffer(getID(), inout errCode) }
        checkRet(errCode)
        let result = buf.toArray()
        buf.free()
        return result
    }

    /**
     * Reads raw data from this {@link MessageSequence} object.
     *
     * @returns { Array<Int32> } Returns the Array<Int32> obtained.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match;
     *     3.The obtained value of typeCode is incorrect;
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readArrayBuffer(typeCode: TypeCode): ArrayBuffer;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readInt32Array(): Array<Int32> {
        var errCode: Int32 = 0
        let buf: CIntArray = unsafe { FfiRpcMessageSequenceImplReadInt32ArrayBuffer(getID(), inout errCode) }
        checkRet(errCode)
        let result = buf.toArray()
        buf.free()
        return result
    }

    /**
     * Reads raw data from this {@link MessageSequence} object.
     *
     * @returns { Array<UInt32> } Returns the Array<UInt32> obtained.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match;
     *     3.The obtained value of typeCode is incorrect;
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readArrayBuffer(typeCode: TypeCode): ArrayBuffer;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readUInt32Array(): Array<UInt32> {
        var errCode: Int32 = 0
        let buf: UInt32Array = unsafe { FfiRpcMessageSequenceImplReadUInt32ArrayBuffer(getID(), inout errCode) }
        checkRet(errCode)
        let result = buf.toArray()
        buf.free()
        return result
    }

    /**
     * Reads raw data from this {@link MessageSequence} object.
     *
     * @returns { Array<Int64> } Returns the Array<Int64> obtained.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match;
     *     3.The obtained value of typeCode is incorrect;
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readArrayBuffer(typeCode: TypeCode): ArrayBuffer;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readInt64Array(): Array<Int64> {
        var errCode: Int32 = 0
        let buf: LongArray = unsafe { FfiRpcMessageSequenceImplReadInt64ArrayBuffer(getID(), inout errCode) }
        checkRet(errCode)
        let result = buf.toArray()
        buf.free()
        return result
    }

    /**
     * Reads raw data from this {@link MessageSequence} object.
     *
     * @returns { Array<UInt64> } Returns the Array<UInt64> obtained.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match;
     *     3.The obtained value of typeCode is incorrect;
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readArrayBuffer(typeCode: TypeCode): ArrayBuffer;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readUInt64Array(): Array<UInt64> {
        var errCode: Int32 = 0
        let buf: UInt64Array = unsafe { FfiRpcMessageSequenceImplReadUInt64ArrayBuffer(getID(), inout errCode) }
        checkRet(errCode)
        let result = buf.toArray()
        buf.free()
        return result
    }

    /**
     * Reads raw data from this {@link MessageSequence} object.
     *
     * @returns { Array<Float32> } Returns the Array<Float32> obtained.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match;
     *     3.The obtained value of typeCode is incorrect;
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readArrayBuffer(typeCode: TypeCode): ArrayBuffer;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readFloat32Array(): Array<Float32> {
        var errCode: Int32 = 0
        let buf: FloatArray = unsafe { FfiRpcMessageSequenceImplReadFloatArrayBuffer(getID(), inout errCode) }
        checkRet(errCode)
        let result = buf.toArray()
        buf.free()
        return result
    }

    /**
     * Reads raw data from this {@link MessageSequence} object.
     *
     * @returns { Array<Float64> } Returns the Array<Float64> obtained.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match;
     *     3.The obtained value of typeCode is incorrect;
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readArrayBuffer(typeCode: TypeCode): ArrayBuffer;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readFloat64Array(): Array<Float64> {
        var errCode: Int32 = 0
        let buf: DoubleArray = unsafe { FfiRpcMessageSequenceImplReadDoubleArrayBuffer(getID(), inout errCode) }
        checkRet(errCode)
        let result = buf.toArray()
        buf.free()
        return result
    }

    /**
     * Writes a {@link Parcelable} object into the {@link MessageSequence} object.
     *
     * @param { Parcelable } val - Indicates the {@link Parcelable} object to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeParcelable(val: Parcelable): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeParcelable(val: Parcelable): Unit {
        let pos = getWritePosition()
        writeInt(1)
        try {
            val.marshalling(this)
        } catch (e: BusinessException) {
            rewindWrite(pos)
            checkRet(ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR)
        }
    }

    /**
     * Reads a {@link Parcelable} object from the {@link MessageSequence} instance.
     *
     * @param { Parcelable } dataIn - Indicates the {@link Parcelable} object that needs to perform
     *                       the {@code unmarshalling} operation using the {@link MessageSequence}.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @throws { BusinessException } 1900012 - Failed to call the JS callback function.
     * @relation readParcelable(dataIn: Parcelable): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readParcelable(dataIn: Parcelable): Unit {
        let len = readInt()
        if (len > 0) {
            dataIn.unmarshalling(this)
            return
        }
        checkRet(ErrorCode.CALL_JS_METHOD_ERROR)
    }

    /**
     * Writes a {@link Parcelable} object array into the {@link MessageSequence} object.
     *
     * @param { Array<Parcelable> } parcelableArray - Indicates the {@link Parcelable} object array to write.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match;
     *     4.The element does not exist in the array.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeParcelableArray(parcelableArray: Parcelable[]): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeParcelableArray(parcelableArray: Array<Parcelable>): Unit {
        let pos = getWritePosition()
        let result = unsafe { FfiRpcMessageSequenceImplWriteUint32(getID(), UInt32(parcelableArray.size)) }
        if (!result) {
            checkRet(ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR)
        }
        for (i in 0..parcelableArray.size) {
            try {
                writeInt(1)
                parcelableArray[i].marshalling(this)
            } catch (e: BusinessException) {
                rewindWrite(pos)
                checkRet(ErrorCode.WRITE_DATA_TO_MESSAGE_SEQUENCE_ERROR)
            }
        }
    }

    /**
     * Reads the specified {@link Parcelable} array from this {@link MessageSequence} object.
     *
     * @param { Array<Parcelable> } parcelableArray - Parcelable array to read.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The parameter is an empty array;
     *     2.The number of parameters is incorrect;
     *     3.The parameter type does not match;
     *     4.The length of the array passed when reading is not equal to the length passed when writing to the array;
     *     5.The element does not exist in the array.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @throws { BusinessException } 1900012 - Failed to call the JS callback function.
     * @relation readParcelableArray(parcelableArray: Parcelable[]): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readParcelableArray(parcelableArray: Array<Parcelable>): Unit {
        let arrayLength = readInt()
        if (Int64(arrayLength) != parcelableArray.size) {
            throw BusinessException(ErrorCode.CHECK_PARAM_ERROR, "Parameter error.")
        }
        for (i in 0..parcelableArray.size) {
            let len = readInt()
            if (len > 0) {
                parcelableArray[i].unmarshalling(this)
            }
        }
    }

    /**
     * Writes raw data to this {@link MessageSequence} object.
     *
     * @param { Array<Byte> } rawData - Raw data to wrote.
     * @param { Int64 } size - Size of the raw data, in bytes.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match;
     *     3.Failed to obtain array information;
     *     4.The transferred size cannot be obtained;
     *     5.The transferred size is less than or equal to 0;
     *     6.The transferred size is greater than the byte length of rawData.
     * @throws { BusinessException } 1900009 - Failed to write data to the message sequence.
     * @relation writeRawDataBuffer(rawData: ArrayBuffer, size: number): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func writeRawDataBuffer(rawData: Array<Byte>, size: Int64): Unit {
        if (size <= 0 || size > rawData.size) {
            throw BusinessException(ErrorCode.CHECK_PARAM_ERROR, "Parameter error.")
        }
        unsafe {
            let cp = acquireArrayRawData(rawData)
            var errCode = 0i32
            FfiRpcMessageSequenceImplWriteRawDataBuffer(getID(), cp.pointer, size, inout errCode)
            releaseArrayRawData(cp)
            checkRet(errCode)
        }
    }

    /**
     * Reads raw data from this {@link MessageSequence} object.
     *
     * @param { Int64 } size - Size of the raw data to read.
     * @returns { Array<Byte> } Return the raw data obtained, in bytes.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     *     1.The number of parameters is incorrect;
     *     2.The parameter type does not match.
     * @throws { BusinessException } 1900010 - Failed to read data from the message sequence.
     * @relation readRawDataBuffer(size: number): ArrayBuffer;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.IPC.Core"
    ]
    public func readRawDataBuffer(size: Int64): Array<Byte> {
        if (size <= 0) {
            throw BusinessException(ErrorCode.CHECK_PARAM_ERROR, "Parameter error.")
        }
        unsafe {
            var errCode: Int32 = 0
            let data = FfiRpcMessageSequenceImplReadRawDataBuffer(getID(), size, inout errCode)
            checkRet(errCode)
            let arr = Array<Byte>(size, {i => data.read(i)})
            LibC.free(data)
            return arr
        }
    }
}
