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

package ohos.request.agent

import std.collection.*
import ohos.base.*
import ohos.ffi.*

@C
struct CHashStrPair {
    var key: CString = CString(CPointer())
    var value: CString = CString(CPointer())

    init(key: ?String, value: ?String) {
        unsafe {
            try {
                this.key = LibC.mallocCString(key ?? "")
                this.value = LibC.mallocCString(value ?? "")
            } catch (e: Exception) {
                LibC.free(this.key)
                LibC.free(this.value)
                throw e
            }
        }
    }

    func free(): Unit {
        unsafe {
            LibC.free(key)
            LibC.free(value)
        }
    }
}

@C
struct CHashStrArr {
    var headers: CPointer<CHashStrPair> = CPointer<CHashStrPair>()
    var size: Int64 = 0

    init() {}

    init(headers: HashMap<String, String>) {
        if (headers.size == 0) {
            return
        }

        let res: CPointer<CHashStrPair> = safeMalloc<CHashStrPair>(count: headers.size)
        var index = 0
        try {
            for ((k, v) in headers) {
                unsafe { res.write(index, CHashStrPair(k, v)) }
                index++
            }
        } catch (e: Exception) {
            for (i in 0..index) {
                unsafe { res.read(i).free() }
            }
            unsafe { LibC.free(res) }
            throw e
        }
        this.headers = res
        this.size = headers.size
    }

    func free(): Unit {
        if (headers.isNull()) {
            return
        }
        for (i in 0..size) {
            unsafe { headers.read(i).free() }
        }
        unsafe { LibC.free(headers) }
    }

    func toHashMap(): HashMap<String, String> {
        if (headers.isNull()) {
            return HashMap<String, String>()
        }

        HashMap<String, String>(size) {
            i: Int64 =>
            let elem: CHashStrPair = unsafe { headers.read(i) }
            (elem.key.toString(), elem.value.toString())
        }
    }

    func toHashMapOption(): ?HashMap<String, String> {
        if (headers.isNull()) {
            return None
        }
        toHashMap()
    }
}

@C
struct CFileSpec {
    var path: CString = CString(CPointer())
    var mimeType: CString = CString(CPointer())
    var filename: CString = CString(CPointer())
    var extras: CHashStrArr = CHashStrArr()

    init() {}

    init(f: FileSpec) {
        try {
            unsafe {
                this.path = LibC.mallocCString(f.path)
                this.mimeType = LibC.mallocCString(f.mimeType ?? "")
                this.filename = LibC.mallocCString(f.filename ?? "")
            }
            this.extras = CHashStrArr(f.extras ?? HashMap<String, String>())
        } catch (e: Exception) {
            unsafe {
                LibC.free(path)
                LibC.free(mimeType)
                LibC.free(filename)
            }
            extras.free()
            throw e
        }
    }

    func free() {
        unsafe {
            LibC.free(path)
            LibC.free(mimeType)
            LibC.free(filename)
        }
        extras.free()
    }
}

@C
struct CFileSpecArr {
    var head: CPointer<CFileSpec> = CPointer<CFileSpec>()
    var size: Int64 = 0

    init() {}

    init(fs: Array<FileSpec>) {
        if (fs.size == 0) {
            this.head = CPointer<CFileSpec>()
            this.size = 0
            return
        }

        let res = safeMalloc<CFileSpec>(count: fs.size)
        var index = 0
        try {
            for (f in fs) {
                unsafe { res.write(index, CFileSpec(f)) }
                index++
            }
        } catch (e: Exception) {
            for (i in 0..index) {
                unsafe { res.read(i).free() }
            }
            unsafe { LibC.free(res) }
            throw e
        }

        this.head = res
        this.size = index
    }

    func toCJValue(): Array<FileSpec> {
        if (head.isNull() || size <= 0) {
            return Array<FileSpec>()
        }
        Array<FileSpec>(size) {
            i =>
            let data = unsafe { head.read(i) }
            FileSpec(data)
        }
    }

    func free() {
        if (head.isNull()) {
            return
        }

        for (i in 0..size) {
            unsafe { head.read(i).free() }
        }
        unsafe { LibC.free(head) }
    }
}

@C
struct CFormItemValueTypeUion {
    var str: CString = CString(CPointer())
    var file: CFileSpec = CFileSpec()
    var files: CFileSpecArr = CFileSpecArr()
    var valueType: UInt32 = 0

    init() {}

    init(data: FormItemValueType) {
        this.str = CString(CPointer())
        this.file = CFileSpec()
        this.files = CFileSpecArr()

        try {
            match (data) {
                case STR(s) =>
                    unsafe { this.str = LibC.mallocCString(s) }
                    this.file = CFileSpec()
                    this.files = CFileSpecArr()
                case FILE(f) =>
                    this.str = CString(CPointer())
                    this.file = CFileSpec(f)
                    this.files = CFileSpecArr()
                case FILES(fs) =>
                    this.str = CString(CPointer())
                    this.file = CFileSpec()
                    this.files = CFileSpecArr(fs)
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        } catch (e: Exception) {
            unsafe {
                LibC.free(str)
                file.free()
                files.free()
            }
            throw e
        }
        this.valueType = data.valueType
    }

    func toCJValue(): FormItemValueType {
        match (valueType) {
            case 0 => FormItemValueType.STR(str.toString())
            case 1 => FormItemValueType.FILE(FileSpec(file))
            case 2 => FormItemValueType.FILES(files.toCJValue())
            case _ => throw BusinessException(EXCEPTION_OTHERS, "Error FormItemValueType")
        }
    }

    func free() {
        unsafe {
            LibC.free(str)
            file.free()
            files.free()
        }
    }
}

@C
struct CFormItem {
    var name: CString = CString(CPointer())
    var value: CFormItemValueTypeUion = CFormItemValueTypeUion()

    init(form: FormItem) {
        try {
            this.name = unsafe { LibC.mallocCString(form.name) }
            this.value = CFormItemValueTypeUion(form.value)
        } catch (e: Exception) {
            unsafe { LibC.free(name) }
            this.value.free()
            throw e
        }
    }

    func free(): Unit {
        unsafe { LibC.free(name) }
        this.value.free()
    }
}

@C
struct CFormItemArr {
    var head: CPointer<CFormItem> = CPointer<CFormItem>()
    var size: Int64 = 0

    init() {}

    init(v: Array<FormItem>) {
        if (v.size == 0) {
            this.head = CPointer<CFormItem>()
            this.size = 0
            return
        }

        let res = safeMalloc<CFormItem>(count: v.size)
        var index = 0
        try {
            for (item in v) {
                unsafe { res.write(index, CFormItem(item)) }
                index++
            }
        } catch (e: Exception) {
            for (i in 0..index) {
                unsafe { res.read(i).free() }
            }
            unsafe { LibC.free(res) }
            throw e
        }

        this.head = res
        this.size = index
    }

    func toCJValue(): ?Array<FormItem> {
        if (head.isNull() || size <= 0) {
            return None
        }

        Array<FormItem>(size) {
            i =>
            let ctype = unsafe { head.read(i) }
            FormItem(ctype)
        }
    }

    func free(): Unit {
        if (head.isNull()) {
            return
        }
        for (index in 0..size) {
            unsafe { head.read(index).free() }
        }
        unsafe { LibC.free(head) }
    }
}

@C
struct CConfigDataTypeUion {
    var str: CString = CString(CPointer())
    var formItems: CFormItemArr = CFormItemArr()

    init() {}

    init(data: ConfigDataType) {
        this.str = CString(CPointer())
        this.formItems = CFormItemArr()
        try {
            match (data) {
                case STR(s) =>
                    unsafe { this.str = LibC.mallocCString(s) }
                    this.formItems = CFormItemArr()
                case FORMITEMS(a) =>
                    formItems = CFormItemArr(a)
                    this.str = CString(CPointer())
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        } catch (e: Exception) {
            unsafe {
                LibC.free(str)
                formItems.free()
            }
            throw e
        }
    }

    func toCJValue(action: Action): ?ConfigDataType {
        match (action) {
            case DOWNLOAD =>
                if (str.isEmpty()) {
                    return None
                }
                ConfigDataType.STR(str.toString())

            case UPLOAD =>
                if (formItems.size <= 0 || formItems.head.isNull()) {
                    return None
                }
                if (let Some(cjFormItems) <- formItems.toCJValue()) {
                    ConfigDataType.FORMITEMS(cjFormItems)
                } else {
                    None
                }
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    func free(): Unit {
        unsafe {
            LibC.free(str)
            formItems.free()
        }
    }
}

@C
struct CConfig {
    var action: UInt32 = 0
    var url: CString = CString(CPointer())
    var title: CString = CString(CPointer())
    var description: CString = CString(CPointer())
    var mode: UInt32 = 0
    var overwrite: Bool = false
    var method: CString = CString(CPointer())
    var headers: CHashStrArr = CHashStrArr()
    var data: CConfigDataTypeUion = CConfigDataTypeUion()
    var saveas: CString = CString(CPointer())
    var network: UInt32 = 0
    var metered: Bool = false
    var roaming: Bool = true
    var retry: Bool = true
    var redirect: Bool = true
    var index: UInt32 = 0
    var begins: Int64 = 0
    var ends: Int64 = -1
    var gauge: Bool = false
    var precise: Bool = false
    var token: CString = CString(CPointer())
    var priority: UInt32 = 0
    var extras: CHashStrArr = CHashStrArr()

    init(config: Config) {
        try {
            unsafe {
                this.url = LibC.mallocCString(config.url)
                this.title = LibC.mallocCString(config.title ?? "")
                this.description = LibC.mallocCString(config.description ?? "")
                this.method = LibC.mallocCString(config.method ?? "")
                this.saveas = LibC.mallocCString(config.saveas ?? "")
                this.token = LibC.mallocCString(config.token ?? "")
            }
            this.headers = CHashStrArr(config.headers ?? HashMap<String, String>())
            this.extras = CHashStrArr(config.extras ?? HashMap<String, String>())
            this.data = match (config.data) {
                case Some(v) => CConfigDataTypeUion(v)
                case _ => CConfigDataTypeUion()
            }
        } catch (e: Exception) {
            unsafe {
                LibC.free(url)
                LibC.free(title)
                LibC.free(description)
                LibC.free(method)
                LibC.free(saveas)
                LibC.free(token)
                headers.free()
                extras.free()
                data.free()
                throw BusinessException(EXCEPTION_OTHERS, e.toString())
            }
        }

        this.action = config.action.value
        this.mode = match (config.mode) {
            case Some(v) => v.value
            case _ => Mode.BACKGROUND.value
        }

        this.overwrite = config.overwrite
        this.network = config.network.value
        this.metered = config.metered
        this.roaming = config.roaming
        this.retry = config.retry
        this.redirect = config.redirect
        this.index = config.index
        this.begins = config.begins
        this.ends = config.ends
        this.gauge = config.gauge
        this.precise = config.precise
        this.priority = config.priority
    }

    func asResource(): CTypeResource<CConfig> {
        CTypeResource<CConfig>(this, free)
    }

    func free(): Unit {
        unsafe {
            LibC.free(url)
            LibC.free(title)
            LibC.free(description)
            LibC.free(method)
            LibC.free(saveas)
            LibC.free(token)
            headers.free()
            extras.free()
            data.free()
        }
    }
}

class CMallocResource<T> where T <: CType {
    CMallocResource(
        let value: T,
        let free: () -> Unit
    ) {}

    ~init() {
        this.free()
    }
}

@C
struct CTask {
    CTask(
        let taskId: CString,
        let config: CConfig
    ) {}

    func free(): Unit {
        taskId.free()
        config.free()
    }
}

@C
struct RetReqData {
    private RetReqData(
        let instanceId: Int64,
        let taskId: CString,
        let err: RetError
    ) {}

    func asCMallocResource(): CMallocResource<RetReqData> {
        CMallocResource<RetReqData>(this, free)
    }

    func free(): Unit {
        unsafe {
            taskId.free()
            err.free()
        }
    }
}

@C
struct RetError {
    RetError(
        var errCode!: Int32,
        var errMsg!: CString
    ) {}

    init() {
        errCode = 0
        errMsg = CString(CPointer())
    }

    func asCMallocResource(): CMallocResource<RetError> {
        CMallocResource<RetError>(this, free)
    }

    func free(): Unit {
        unsafe {
            LibC.free(errMsg)
        }
    }
}

@C
struct RetTaskInfo {
    RetTaskInfo(
        let err: RetError,
        let task: CTaskInfo
    ) {}

    func asCMallocResource(): CMallocResource<RetTaskInfo> {
        CMallocResource<RetTaskInfo>(this, free)
    }

    func free(): Unit {
        unsafe {
            err.free()
            task.free()
        }
    }
}

@C
struct RetTaskArr {
    RetTaskArr(
        let err: RetError,
        let tasks: CArrString
    ) {}

    func asCMallocResource(): CMallocResource<RetTaskArr> {
        CMallocResource<RetTaskArr>(this, free)
    }

    func free(): Unit {
        unsafe {
            err.free()
            tasks.free()
        }
    }
}

@C
struct RetTask {
    RetTask(
        let err: RetError,
        let task: CTask
    ) {}

    func asCMallocResource(): CMallocResource<RetTask> {
        CMallocResource<RetTask>(this, free)
    }

    func free(): Unit {
        err.free()
        task.free()
    }
}

@C
struct CProgress {
    let state: UInt32 = 0
    let index: UInt32 = 0
    let processd: Int64 = 0
    let sizeArr: CPointer<Int64> = CPointer<Int64>()
    let sizeArrLen: Int64 = 0
    let extras: CHashStrArr = CHashStrArr()

    func free(): Unit {
        unsafe {
            LibC.free(sizeArr)
            extras.free()
        }
    }
}

@C
struct CTaskInfo {
    let uid: CString = CString(CPointer())
    let bundle: CString = CString(CPointer())
    let saveas: CString = CString(CPointer())
    let url: CString = CString(CPointer())
    let data: CConfigDataTypeUion = CConfigDataTypeUion()
    let tid: CString = CString(CPointer())
    let title: CString = CString(CPointer())
    let description: CString = CString(CPointer())
    let action: UInt32 = 0
    let mode: UInt32 = 0
    let priority: UInt32 = 0
    let mimeType: CString = CString(CPointer())
    let progress: CProgress = CProgress()
    let gauge: Bool = true
    let ctime: UInt64 = 0
    let mtime: UInt64 = 0
    let retry: Bool = true
    let tries: UInt32 = 0
    let faults: UInt32 = 0
    let reason: CString = CString(CPointer())
    let extras: CHashStrArr = CHashStrArr()

    func free(): Unit {
        unsafe {
            LibC.free(uid)
            LibC.free(bundle)
            LibC.free(saveas)
            LibC.free(tid)
            LibC.free(url)
            LibC.free(title)
            LibC.free(description)
            LibC.free(mimeType)
            LibC.free(reason)
            data.free()
            progress.free()
            extras.free()
        }
    }
}

@C
struct CFilter {
    var bundle: NativeOptionCString = NativeOptionCString(false, CString(CPointer()))
    var before: NativeOptionInt64 = NativeOptionInt64(false, 0)
    var after: NativeOptionInt64 = NativeOptionInt64(false, 0)
    var state: NativeOptionUInt32 = NativeOptionUInt32(false, 0)
    var action: NativeOptionUInt32 = NativeOptionUInt32(false, 0)
    var mode: NativeOptionUInt32 = NativeOptionUInt32(false, 0)

    init(filter: Filter) {
        this.bundle = unsafe {
            try {
                match (filter.bundle) {
                    case Some(v) => NativeOptionCString(true, LibC.mallocCString(v))
                    case None => NativeOptionCString(false, CString(CPointer()))
                }
            } catch (e: Exception) {
                throw BusinessException(EXCEPTION_OTHERS, e.toString())
            }
        }

        this.before = match (filter.before) {
            case Some(v) => NativeOptionInt64(true, v)
            case None => NativeOptionInt64(false, 0)
        }

        this.after = match (filter.after) {
            case Some(v) => NativeOptionInt64(true, v)
            case None => NativeOptionInt64(false, 0)
        }

        this.state = match (filter.state) {
            case Some(v) => NativeOptionUInt32(true, v.value)
            case None => NativeOptionUInt32(false, 0)
        }

        this.action = match (filter.action) {
            case Some(v) => NativeOptionUInt32(true, v.value)
            case None => NativeOptionUInt32(false, 0)
        }

        this.mode = match (filter.mode) {
            case Some(v) => NativeOptionUInt32(true, v.value)
            case None => NativeOptionUInt32(false, 0)
        }
    }

    func free() {
        this.bundle.free()
    }
}

struct TokenResource <: Resource {
    let value: RequestNativeOptionCString
    let isFree: Box<Bool> = Box(false)

    init(value: RequestNativeOptionCString) {
        this.value = value
    }

    public func isClosed(): Bool {
        return isFree.value
    }

    public func close(): Unit {
        if (isFree.value) {
            return
        }
        value.free()
        isFree.value = true
    }
}

@C
struct RequestNativeOptionCString {
    RequestNativeOptionCString(
        let hasValue: Bool,
        let value: CString
    ) {}

    init(value: ?String) {
        match (value) {
            case Some(v) =>
                this.hasValue = true
                this.value = unsafe { LibC.mallocCString(v) }
            case None =>
                this.hasValue = false
                this.value = CString(CPointer())
        }
    }

    func free(): Unit {
        this.value.free()
    }

    func asResource(): CTypeResource<RequestNativeOptionCString> {
        CTypeResource(this, free)
    }
}

@C
struct CHttpHeaderHashPair {
    var key: CString = CString(CPointer())
    var value: CArrString = CArrString(CPointer(), 0)

    func free(): Unit {
        unsafe {
            key.free()
            value.free()
        }
    }
}

@C
struct CHttpHeaders {
    var headers: CPointer<CHttpHeaderHashPair> = CPointer<CHttpHeaderHashPair>()
    var size: Int64 = 0

    func toHashMap(): HashMap<String, Array<String>> {
        if (headers.isNull()) {
            return HashMap<String, Array<String>>()
        }

        HashMap<String, Array<String>>(size) {
            i: Int64 =>
            let elem: CHttpHeaderHashPair = unsafe { headers.read(i) }
            (elem.key.toString(), elem.value.toStringArray())
        }
    }

    func free(): Unit {
        if (headers.isNull()) {
            return
        }
        for (index in 0..size) {
            unsafe { headers.read(index).free() }
        }
        unsafe { LibC.free(headers) }
    }
}

@C
struct CHttpResponse {
    let version: CString = CString(CPointer())
    let statusCode: Int32 = 0
    let reason: CString = CString(CPointer())
    let headers: CHttpHeaders = CHttpHeaders()

    func free(): Unit {
        unsafe {
            version.free()
            reason.free()
            headers.free()
        }
    }
}

foreign {
    func FfiOHOSRequestFreeTask(taskId: CString): Unit

    func FfiOHOSRequestTaskProgressOn(event: CString, taskId: CString, callback: Int64): RetError

    func FfiOHOSRequestTaskProgressOff(event: CString, taskId: CString, callback: Int64): RetError

    func FfiOHOSRequestTaskStart(taskId: CString): RetError

    func FfiOHOSRequestTaskPause(taskId: CString): RetError

    func FfiOHOSRequestTaskResume(taskId: CString): RetError

    func FfiOHOSRequestTaskStop(taskId: CString): RetError

    func FfiOHOSRequestCreateTask(context: StageContext, config: CConfig): RetReqData

    func FfiOHOSRequestRemoveTask(tid: CString): RetError

    func FfiOHOSRequestGetTask(context: StageContext, taskId: CString, token: RequestNativeOptionCString): RetTask

    func FfiOHOSRequestShowTask(tid: CString): RetTaskInfo

    func FfiOHOSRequestTouchTask(tid: CString, token: CString): RetTaskInfo

    func FfiOHOSRequestSearchTask(filter: CFilter): RetTaskArr
}
