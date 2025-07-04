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

foreign {
    func FfiRpcMessageSequenceImplCreate(): Int64

    func FfiRpcMessageSequenceImplWriteInterfaceToken(id: Int64, tokemn: CString, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplReadInterfaceToken(id: Int64, errCode: CPointer<Int32>): CString

    func FfiRpcMessageSequenceImplGetSize(id: Int64, errCode: CPointer<Int32>): UInt32

    func FfiRpcMessageSequenceImplGetCapacity(id: Int64, errCode: CPointer<Int32>): UInt32

    func FfiRpcMessageSequenceImplSetSize(id: Int64, value: UInt32, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplSetCapacity(id: Int64, value: UInt32, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplGetWritableBytes(id: Int64, errCode: CPointer<Int32>): UInt32

    func FfiRpcMessageSequenceImplGetReadableBytes(id: Int64, errCode: CPointer<Int32>): UInt32

    func FfiRpcMessageSequenceImplGetReadPosition(id: Int64, errCode: CPointer<Int32>): UInt32

    func FfiRpcMessageSequenceImplGetWritePosition(id: Int64, errCode: CPointer<Int32>): UInt32

    func FfiRpcMessageSequenceImplRewindWrite(id: Int64, pos: UInt32, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplRewindRead(id: Int64, pos: UInt32, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplWriteNoException(id: Int64, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplReadException(id: Int64, errCode: CPointer<Int32>): CString

    func FfiRpcMessageSequenceImplWriteByte(id: Int64, value: Int8, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplWriteShort(id: Int64, value: Int16, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplWriteInt(id: Int64, value: Int32, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplWriteLong(id: Int64, value: Int64, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplWriteFloat(id: Int64, value: Float32, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplWriteDouble(id: Int64, value: Float64, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplWriteBoolean(id: Int64, value: Int8, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplWriteChar(id: Int64, value: UInt8, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplWriteString(id: Int64, value: CString, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplWriteByteArray(id: Int64, value: ByteArray, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplWriteShortArray(id: Int64, value: ShortArray, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplWriteIntArray(id: Int64, value: CIntArray, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplWriteLongArray(id: Int64, value: LongArray, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplWriteFloatArray(id: Int64, value: FloatArray, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplWriteDoubleArray(id: Int64, value: DoubleArray, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplWriteBooleanArray(id: Int64, value: ByteArray, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplWriteCharArray(id: Int64, value: CharArray, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplWriteStringArray(id: Int64, value: CStringArray, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplWriteArrayBuffer(id: Int64, typeCode: Int32, value: CPointer<Unit>,
        byteLength: UIntNative, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplWriteUint32(id: Int64, value: UInt32): Bool

    func FfiRpcMessageSequenceImplWriteRawDataBuffer(id: Int64, data: CPointer<UInt8>, size: Int64,
        errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplWriteRemoteObject(id: Int64, object: Int64, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplWriteRemoteObjectArray(id: Int64, value: LongArray, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplReadByte(id: Int64, errCode: CPointer<Int32>): Int8

    func FfiRpcMessageSequenceImplReadShort(id: Int64, errCode: CPointer<Int32>): Int16

    func FfiRpcMessageSequenceImplReadInt(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiRpcMessageSequenceImplReadLong(id: Int64, errCode: CPointer<Int32>): Int64

    func FfiRpcMessageSequenceImplReadFloat(id: Int64, errCode: CPointer<Int32>): Float32

    func FfiRpcMessageSequenceImplReadDouble(id: Int64, errCode: CPointer<Int32>): Float64

    func FfiRpcMessageSequenceImplReadBoolean(id: Int64, errCode: CPointer<Int32>): Int8

    func FfiRpcMessageSequenceImplReadChar(id: Int64, errCode: CPointer<Int32>): UInt8

    func FfiRpcMessageSequenceImplReadString(id: Int64, errCode: CPointer<Int32>): CString

    func FfiRpcMessageSequenceImplReadByteArray(id: Int64, errCode: CPointer<Int32>): ByteArray

    func FfiRpcMessageSequenceImplReadShortArray(id: Int64, errCode: CPointer<Int32>): ShortArray

    func FfiRpcMessageSequenceImplReadIntArray(id: Int64, errCode: CPointer<Int32>): CIntArray

    func FfiRpcMessageSequenceImplReadLongArray(id: Int64, errCode: CPointer<Int32>): LongArray

    func FfiRpcMessageSequenceImplReadFloatArray(id: Int64, errCode: CPointer<Int32>): FloatArray

    func FfiRpcMessageSequenceImplReadDoubleArray(id: Int64, errCode: CPointer<Int32>): DoubleArray

    func FfiRpcMessageSequenceImplReadBooleanArray(id: Int64, errCode: CPointer<Int32>): ByteArray

    func FfiRpcMessageSequenceImplReadCharArray(id: Int64, errCode: CPointer<Int32>): CharArray

    func FfiRpcMessageSequenceImplReadStringArray(id: Int64, errCode: CPointer<Int32>): CStringArray

    func FfiRpcMessageSequenceImplReadInt8ArrayBuffer(id: Int64, errCode: CPointer<Int32>): ByteArray

    func FfiRpcMessageSequenceImplReadUInt8ArrayBuffer(id: Int64, errCode: CPointer<Int32>): CharArray

    func FfiRpcMessageSequenceImplReadInt16ArrayBuffer(id: Int64, errCode: CPointer<Int32>): ShortArray

    func FfiRpcMessageSequenceImplReadUInt16ArrayBuffer(id: Int64, errCode: CPointer<Int32>): UInt16Array

    func FfiRpcMessageSequenceImplReadInt32ArrayBuffer(id: Int64, errCode: CPointer<Int32>): CIntArray

    func FfiRpcMessageSequenceImplReadUInt32ArrayBuffer(id: Int64, errCode: CPointer<Int32>): UInt32Array

    func FfiRpcMessageSequenceImplReadFloatArrayBuffer(id: Int64, errCode: CPointer<Int32>): FloatArray

    func FfiRpcMessageSequenceImplReadDoubleArrayBuffer(id: Int64, errCode: CPointer<Int32>): DoubleArray

    func FfiRpcMessageSequenceImplReadInt64ArrayBuffer(id: Int64, errCode: CPointer<Int32>): LongArray

    func FfiRpcMessageSequenceImplReadUInt64ArrayBuffer(id: Int64, errCode: CPointer<Int32>): UInt64Array

    func FfiRpcMessageSequenceImplReadRawDataBuffer(id: Int64, size: Int64, errCode: CPointer<Int32>): CPointer<UInt8>

    func FfiRpcMessageSequenceImplReadRemoteObject(id: Int64, errCode: CPointer<Int32>): RetDataI64

    func FfiRpcMessageSequenceImplReadRemoteObjectArray(id: Int64, errCode: CPointer<Int32>): RemoteObjectArray

    func FfiRpcMessageSequenceImplCloseFileDescriptor(fd: Int32): Unit

    func FfiRpcMessageSequenceImplDupFileDescriptor(fd: Int32): Int32

    func FfiRpcMessageSequenceImplContainFileDescriptors(id: Int64, errCode: CPointer<Int32>): Bool

    func FfiRpcMessageSequenceImplWriteFileDescriptor(id: Int64, fd: Int32, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplReadFileDescriptor(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiRpcMessageSequenceImplWriteAshmem(mid: Int64, aid: Int64, errCode: CPointer<Int32>): Unit

    func FfiRpcMessageSequenceImplReadAshmem(id: Int64, errCode: CPointer<Int32>): Int64

    func FfiRpcMessageSequenceImplGetRawDataCapacity(id: Int64, errCode: CPointer<Int32>): UInt32

    func FfiRpcAshmemImplCreate(ashmemName: CString, ashmemSize: Int32): Int64

    func FfiRpcAshmemImplCreateFromExisting(id: Int64, errCode: CPointer<Int32>): Int64

    func FfiRpcAshmemImplCloseAshmem(id: Int64): Unit

    func FfiRpcAshmemImplUnmapAshmem(id: Int64): Unit

    func FfiRpcAshmemImplGetAshmemSize(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiRpcAshmemImplMapTypedAshmem(id: Int64, mapType: UInt32, errCode: CPointer<Int32>): Unit

    func FfiRpcAshmemImplMapReadWriteAshmem(id: Int64, errCode: CPointer<Int32>): Unit

    func FfiRpcAshmemImplMapReadonlyAshmem(id: Int64, errCode: CPointer<Int32>): Unit

    func FfiRpcAshmemImplSetProtectionType(id: Int64, protectionType: UInt32, errCode: CPointer<Int32>): Unit

    func FfiRpcAshmemImplWriteDataToAshmem(id: Int64, data: CPointer<UInt8>, size: Int64, offset: Int64,
        errCode: CPointer<Int32>): Unit

    func FfiRpcAshmemImplReadDataFromAshmem(id: Int64, size: Int64, offset: Int64, errCode: CPointer<Int32>): CPointer<UInt8>

    func FfiRpcRemoteObjectConstructor(stringValue: CString): Int64

    func FfiRpcRemoteObjectSendMessageRequest(id: Int64, code: UInt32, dataId: Int64, replyId: Int64, opt: MesOption,
        funcId: Int64): Int32

    func FfiRpcRemoteObjectGetCallingPid(): Int32

    func FfiRpcRemoteObjectGetCallingUid(): Int32

    func FfiRpcRemoteObjectGetDescriptor(id: Int64, errCode: CPointer<Int32>): CString

    func FfiRpcRemoteObjectModifyLocalInterface(id: Int64, stringValue: CString, errCode: CPointer<Int32>): Unit

    func FfiRpcRemoteProxySendMessageRequest(id: Int64, code: UInt32, dataId: Int64, replyId: Int64, opt: MesOption,
        funcId: Int64): Int32

    func FfiRpcRemoteProxyRegisterDeathRecipient(id: Int64, funcId: Int64, flag: Int32, errCode: CPointer<Int32>): Unit

    func FfiRpcRemoteProxyUnregisterDeathRecipient(id: Int64, funcId: Int64, flag: Int32, errCode: CPointer<Int32>): Unit

    func FfiRpcRemoteProxyGetDescriptor(id: Int64, errCode: CPointer<Int32>): CString

    func FfiRpcRemoteProxyIsObjectDead(id: Int64): Bool

    func FfiRpcIPCSkeletonGetContextObject(): RetDataI64

    func FfiRpcIPCSkeletonGetCallingPid(): Int32

    func FfiRpcIPCSkeletonGetCallingUid(): Int32

    func FfiRpcIPCSkeletonGetCallingTokenId(): UInt32

    func FfiRpcIPCSkeletonGetCallingDeviceID(): CString

    func FfiRpcIPCSkeletonGetLocalDeviceID(): CString

    func FfiRpcIPCSkeletonIsLocalCalling(): Bool

    func FfiRpcIPCSkeletonFlushCmdBuffer(object: Int64): Unit

    func memcpy_s(dest: CPointer<UInt8>, destMax: UIntNative, src: CPointer<UInt8>, count: UIntNative): Int32
}
