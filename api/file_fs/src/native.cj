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

package ohos.file_fs

import ohos.ffi.*
import ohos.base.*

foreign {
    // Copy
    func FfiOHOSFileFsCreateCopyOptions(progressId: Int64, signalId: Int64): Int64

    func FfiOHOSFileFsCreateTaskSignal(): Int64

    func FfiOHOSFileFsTaskSignalCancel(id: Int64): Int64

    func FfiOHOSFileFsCopy(src: CString, dest: CString, opt: Int64): Unit

    // Stat
    func FfiOHOSFileFsStatByID(file: Int32): RetDataI64

    func FfiOHOSFileFsStatByString(file: CString): RetDataI64

    func FfiOHOSStatGetIno(id: Int64): Int64

    func FfiOHOSStatGetMode(id: Int64): Int64

    func FfiOHOSStatGetUid(id: Int64): Int64

    func FfiOHOSStatGetGid(id: Int64): Int64

    func FfiOHOSStatGetSize(id: Int64): Int64

    func FfiOHOSStatGetAtime(id: Int64): Int64

    func FfiOHOSStatGetMtime(id: Int64): Int64

    func FfiOHOSStatGetCtime(id: Int64): Int64

    func FfiOHOSStatIsBlockDevice(id: Int64): Bool

    func FfiOHOSStatIsCharacterDevice(id: Int64): Bool

    func FfiOHOSStatIsDirectory(id: Int64): Bool

    func FfiOHOSStatIsFIFO(id: Int64): Bool

    func FfiOHOSStatIsFile(id: Int64): Bool

    func FfiOHOSStatIsSocket(id: Int64): Bool

    func FfiOHOSStatIsSymbolicLink(id: Int64): Bool

    func FfiOHOSStatGetLocation(id: Int64): RetDataI32

    // Stream
    func FfiOHOSFileFsCreateStream(path: CString, mode: CString): RetDataI64

    func FfiOHOSFileFsFdopenStream(fd: Int32, mode: CString): RetDataI64

    func FfiOHOSStreamClose(id: Int64): RetCode

    func FfiOHOSStreamFlush(id: Int64): RetCode

    func FfiOHOSStreamWriteCur(id: Int64, string: CPointer<UInt8>, length: Int64, encoding: CString): RetDataI64

    func FfiOHOSStreamWrite(id: Int64, string: CPointer<UInt8>, length: Int64, offset: Int64, encoding: CString): RetDataI64

    func FfiOHOSStreamReadCur(id: Int64, buffer: CPointer<UInt8>, size: Int64, length: Int64): RetDataI64

    func FfiOHOSStreamRead(id: Int64, buffer: CPointer<UInt8>, size: Int64, length: Int64, offset: Int64): RetDataI64

    // RandomAccessFile
    func FfiOHOSFileFsCreateRandomAccessFileByString(file: CString, mode: Int64): RetDataI64

    func FfiOHOSFileFsCreateRandomAccessFileByID(file: Int64, mode: Int64): RetDataI64

    func FfiOHOSRandomAccessFileGetFd(id: Int64): Int32

    func FfiOHOSRandomAccessFileGetFPointer(id: Int64): Int64

    func FfiOHOSRandomAccessFileSetFilePointerSync(id: Int64, fd: Int64): Unit

    func FfiOHOSRandomAccessFileClose(id: Int64): Unit

    func FfiOHOSRandomAccessFileWrite(id: Int64, buffer: CPointer<Byte>, length: UIntNative, offset: Int64): RetDataI64

    func FfiOHOSRandomAccessFileRead(id: Int64, buffer: CPointer<Byte>, length: UIntNative, offset: Int64): RetDataI64

    // File
    func FfiOHOSFileFsOpen(path: CString, openMode: Int64): RetDataI64

    func FfiOHOSFileFsDup(fd: Int32): RetDataI64

    func FfiOHOSFILEFsGetFD(id: Int64): Int32

    func FfiOHOSFILEFsGetPath(id: Int64): CString

    func FfiOHOSFILEFsGetName(id: Int64): CString

    func FfiOHOSFILEFsTryLock(id: Int64, exclusive: Bool): RetCode

    func FfiOHOSFILEFsUnLock(id: Int64): RetCode

    func FfiOHOSFILEFsGetParent(id: Int64): RetDataCString

    // Watcher

    func FfiOHOSFileFsCreateWatcher(path: CString, events: UInt32, id: Int64): RetDataI64

    func FfiOHOSFileFsWatcherStart(id: Int64): Int32

    func FfiOHOSFileFsWatcherStop(id: Int64): Int32

    func FfiOHOSFileFsLstat(path: CString): RetDataI64

    func FfiOHOSFileFsMkdir(path: CString, recursion: Bool, isTwoArgs: Bool): Int32

    func FfiOHOSFileFsRmdir(path: CString): Int32

    func FfiOHOSFileFsMoveDir(src: CString, dest: CString, mode: Int32): RetDataCArrConflictFiles

    func FfiOHOSFileFsRename(oldFile: CString, newFile: CString): Int32

    func FfiOHOSFileFsUnlink(path: CString): Int32

    func FfiOHOSFileFsAccess(path: CString): RetDataBool

    func FfiOHOSFileFsAccessExt(path: CString, mode: Int32, flag: Int32): RetDataBool

    func FfiOHOSFileFsRead(fd: Int32, buffer: CPointer<Byte>, size: Int64, length: UIntNative, offset: Int64): RetDataI64

    func FfiOHOSFileFsReadCur(fd: Int32, buffer: CPointer<Byte>, size: Int64, length: UIntNative): RetDataI64

    func FfiOHOSFileFsWrite(fd: Int32, buffer: CPointer<UInt8>, length: UIntNative, offset: Int64, encoding: CString): RetDataI64

    func FfiOHOSFileFsWriteCur(fd: Int32, buffer: CPointer<UInt8>, length: UIntNative, encoding: CString): RetDataI64

    func FfiOHOSFileFsCopyDir(src: CString, dest: CString, mode: Int32): RetDataCArrConflictFiles

    func FfiOHOSFileFsCopyFile(src: CString, dest: CString, mode: Int32): Int32

    func FfiOHOSFileFsCopyFileSI(src: CString, dest: Int32, mode: Int32): Int32

    func FfiOHOSFileFsCopyFileIS(src: Int32, dest: CString, mode: Int32): Int32

    func FfiOHOSFileFsCopyFileII(src: Int32, dest: Int32, mode: Int32): Int32

    func FfiOHOSFileFsMoveFile(src: CString, dest: CString, mode: Int32): Int32

    func FfiOHOSFileFsMkdtemp(prefix: CString): RetDataCString

    func FfiOHOSFileListFile(path: CString, options: CListFileOptions): RetDataCArrStringN

    func FfiOHOSFileFsLseek(fd: Int32, offset: Int64, whence: Int32): RetDataI64

    func FfiOHOSFileFsFdatasync(fd: Int32): Int32

    func FfiOHOSFileFsFsync(fd: Int32): Int32

    func FfiOHOSFileFsSymlink(target: CString, srcPath: CString): Int32

    func FfiOHOSFileFsTruncateByString(file: CString, len: Int64): Int32

    func FfiOHOSFileFsTruncateByFd(file: Int32, len: Int64): Int32

    func FfiOHOSFileFsClose(file: Int64): Int32

    func FfiOHOSFileFsCloseByFd(file: Int32): Int32

    func FfiOHOSFileFsReadLines(path: CString, encoding: CString): RetDataI64

    func FfiOHOSFileFsReaderIteratorNext(id: Int64): RetReaderIteratorResult

    func FfiOHOSFileFsReadText(path: CString, offset: Int64, hasLen: Bool, len: Int64, encoding: CString): RetDataCString

    func FfiOHOSFileFsUtimes(path: CString, mtime: Float64): Int32

    func FfiOHOSFileFsSetXattr(path: CString, key: CString, value: CString): Int32

    func FfiOHOSFileFsGetXattr(path: CString, key: CString): RetDataCString

    func FfiOHOSFileFsReleaseCString(str: CString): Unit
}
