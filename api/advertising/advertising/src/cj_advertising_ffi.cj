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

package ohos.advertising.advertising

import std.collection.HashMap
import ohos.base.*
import ohos.ffi.*

@C
struct CParameter {
    let valueType: Int8
    let key: CString
    let value: CPointer<Unit>
    let size: Int64
    init(p: Parameter) {
        this.key = unsafe { LibC.mallocCString(p.key) }
        (valueType, this.value, this.size) = getValue(p.value)
    }
    func free(): Unit {
        unsafe {
            LibC.free<Unit>(value)
            LibC.free(key)
        }
    }
}

unsafe func createPtr<T>(value: T): CPointer<Unit> where T <: CType {
    let ptr = safeMalloc<T>()
    ptr.write(value)
    return CPointer<Unit>(ptr)
}

func throwIfEmpty<T>(arr: Array<T>): Unit {
    if (arr.size == 0) {
        throw BusinessException(ERR_PARAMETER_ERROR, "Invalid input parameter.")
    }
}

func getValue(value: ValueType): (Int8, CPointer<Unit>, Int64) {
    unsafe {
        match (value) {
            case INT(v) => return (INT_TYPE, createPtr<Int32>(v), 1)
            case STRING(v) =>
                let ptr = LibC.mallocCString(v).getChars()
                return (STRING_TYPE, CPointer<Unit>(ptr), 1)
            case BOOL(v) => return (BOOL_TYPE, createPtr<Bool>(v), 1)
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@C
struct CParameterArr {
    CParameterArr(
        let head: CPointer<CParameter>,
        let size: Int64
    ) {}

    init(v: Array<Parameter>) {
        if (v.size == 0) {
            this.head = CPointer<CParameter>()
            this.size = 0
            return
        }
        let res = safeMalloc<CParameter>(count: v.size)
        var index = 0
        try {
            for (item in v) {
                unsafe { res.write(index, CParameter(item)) }
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

    func toCJValue(): Array<Parameter> {
        Array<Parameter>(size) {
            i =>
            let ctype = unsafe { head.read(i) }
            Parameter(ctype)
        }
    }

    func toCJOptionValue(): ?Array<Parameter> {
        if (head.isNull() || size <= 0) {
            return None
        }
        toCJValue()
    }

    func free() {
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
        if (key.isNull()) {
            return
        }
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
struct CAdvertisement {
    var adType: UInt32
    var uniqueId: CString = CString(CPointer())
    var rewarded: Bool
    var shown: Bool
    var clicked: Bool
    var rewardVerifyConfig: CHashStrArr = CHashStrArr()
    var extraAttrs: CParameterArr = CParameterArr(CPointer<CParameter>(), 0)

    init() {
        adType = 0
        rewarded = false
        shown = false
        clicked = false
    }

    init(v: Advertisement) {
        this.adType = v.adType
        try {
            unsafe {
                this.uniqueId = LibC.mallocCString(v.uniqueId)
            }
            this.rewardVerifyConfig = CHashStrArr(v.rewardVerifyConfig)
            this.extraAttrs = CParameterArr(v.extraAttrs)
        } catch (e: Exception) {
            unsafe {
                LibC.free(uniqueId)
                this.rewardVerifyConfig.free()
                this.extraAttrs.free()
            }
            throw e
        }
        this.rewarded = v.rewarded
        this.shown = v.shown
        this.clicked = v.clicked
    }

    func free() {
        unsafe {
            LibC.free(uniqueId)
        }
        this.rewardVerifyConfig.free()
        this.extraAttrs.free()
    }
}

@C
struct CAdvertisementArr {
    var head: CPointer<CAdvertisement> = CPointer<CAdvertisement>()
    var size: Int64 = 0

    init() {}

    init(v: Array<Advertisement>) {
        if (v.size == 0) {
            this.head = CPointer<CAdvertisement>()
            this.size = 0
            return
        }
        let res = safeMalloc<CAdvertisement>(count: v.size)
        var index = 0
        try {
            for (item in v) {
                unsafe { res.write(index, CAdvertisement(item)) }
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

    func toCJValue(): Array<Advertisement> {
        if (head.isNull() || size <= 0) {
            return Array<Advertisement>()
        }

        Array<Advertisement>(size) {
            i =>
            let ctype = unsafe { head.read(i) }
            Advertisement(ctype)
        }
    }

    func free() {
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
struct CAdvertisementHashStrArrPair {
    var str: CString = CString(CPointer())
    var formItems: CAdvertisementArr = CAdvertisementArr()

    init() {}

    init(key: ?String, value: ?Array<Advertisement>) {
        try {
            unsafe {
                this.str = LibC.mallocCString(key ?? "")
                this.formItems = CAdvertisementArr(value ?? Array<Advertisement>())
            }
        } catch (e: Exception) {
            unsafe {
                LibC.free(str)
                formItems.free()
            }
            throw e
        }
    }

    func free(): Unit {
        unsafe {
            LibC.free(str)
            if (formItems.size == 0) {
                return
            }
            formItems.free()
        }
    }
}

@C
struct CAdvertisementHashStrArr {
    var headers: CPointer<CAdvertisementHashStrArrPair> = CPointer<CAdvertisementHashStrArrPair>()
    var size: Int64 = 0

    init() {}

    init(headers: HashMap<String, Array<Advertisement>>) {
        if (headers.size == 0) {
            return
        }

        let res: CPointer<CAdvertisementHashStrArrPair> = safeMalloc<CAdvertisementHashStrArrPair>(count: headers.size)
        var index = 0
        try {
            for ((k, v) in headers) {
                unsafe { res.write(index, CAdvertisementHashStrArrPair(k, v)) }
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

    func toHashMap(): HashMap<String, Array<Advertisement>> {
        if (headers.isNull()) {
            return HashMap<String, Array<Advertisement>>()
        }

        HashMap<String, Array<Advertisement>>(size) {
            i: Int64 =>
            let elem: CAdvertisementHashStrArrPair = unsafe { headers.read(i) }
            (elem.str.toString(), elem.formItems.toCJValue())
        }
    }

    func toHashMapOption(): ?HashMap<String, Array<Advertisement>> {
        if (headers.isNull()) {
            return None
        }
        toHashMap()
    }
}

@C
struct CAdRequestParams {
    var adId: CString = CString(CPointer())
    var adType: NativeOptionUInt32 = NativeOptionUInt32(false, 0)
    var adCount: NativeOptionUInt32 = NativeOptionUInt32(false, 0)
    var adWidth: NativeOptionUInt32 = NativeOptionUInt32(false, 0)
    var adHeight: NativeOptionUInt32 = NativeOptionUInt32(false, 0)
    var adSearchKeyword: NativeOptionCString = NativeOptionCString(false, CString(CPointer()))
    var extraAttrs: CParameterArr = CParameterArr(CPointer<CParameter>(), 0)
    var hasExtraAttrs: Bool = false

    init() {}

    init(adRequestParams: AdRequestParams) {
        try {
            unsafe {
                adId = LibC.mallocCString(adRequestParams.adId)
            }
            this.adType = match (adRequestParams.adType) {
                case Some(v) => NativeOptionUInt32(true, v)
                case None => NativeOptionUInt32(false, 0)
            }
            this.adCount = match (adRequestParams.adCount) {
                case Some(v) => NativeOptionUInt32(true, v)
                case None => NativeOptionUInt32(false, 0)
            }
            this.adWidth = match (adRequestParams.adWidth) {
                case Some(v) => NativeOptionUInt32(true, v)
                case None => NativeOptionUInt32(false, 0)
            }
            this.adHeight = match (adRequestParams.adHeight) {
                case Some(v) => NativeOptionUInt32(true, v)
                case None => NativeOptionUInt32(false, 0)
            }
            this.adSearchKeyword = unsafe {
                match (adRequestParams.adSearchKeyword) {
                    case Some(v) => NativeOptionCString(true, LibC.mallocCString(v))
                    case None => NativeOptionCString(false, CString(CPointer()))
                }
            }

            unsafe {
                if (adRequestParams.extraAttrs.isNone()) {
                    this.hasExtraAttrs = false
                    this.extraAttrs = CParameterArr(Array<Parameter>())
                } else {
                    this.hasExtraAttrs = true
                    this.extraAttrs = CParameterArr(adRequestParams.extraAttrs ?? Array<Parameter>())
                }
            }
        } catch (e: Exception) {
            unsafe {
                LibC.free(adId)
                this.adSearchKeyword.free()
                this.extraAttrs.free()
            }
            throw e
        }
    }

    func free() {
        unsafe {
            LibC.free(adId)
            this.adSearchKeyword.free()
            this.extraAttrs.free()
        }
    }
}

@C
struct CAdRequestParamsArr {
    var head: CPointer<CAdRequestParams> = CPointer<CAdRequestParams>()
    var size: Int64 = 0

    init() {}

    init(v: Array<AdRequestParams>) {
        if (v.size == 0) {
            this.head = CPointer<CAdRequestParams>()
            this.size = 0
            return
        }
        let res = safeMalloc<CAdRequestParams>(count: v.size)
        var index = 0
        try {
            for (item in v) {
                unsafe { res.write(index, CAdRequestParams(item)) }
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

    func toCJValue(): ?Array<AdRequestParams> {
        if (head.isNull() || size <= 0) {
            return None
        }

        Array<AdRequestParams>(size) {
            i =>
            let ctype = unsafe { head.read(i) }
            AdRequestParams(ctype)
        }
    }

    func free() {
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
struct CAdOptions {
    var tagForChildProtection: Int32 = -1
    var adContentClassification: NativeOptionCString = NativeOptionCString(false, CString(CPointer()))
    var nonPersonalizedAd: NativeOptionUInt32 = NativeOptionUInt32(false, 0)
    var extraAttrs: CParameterArr = CParameterArr(CPointer<CParameter>(), 0)
    var hasExtraAttrs: Bool = false

    init() {}

    init(adOptions: AdOptions) {
        if (let Some(v) <- adOptions.tagForChildProtection) {
            this.tagForChildProtection = adOptions.tagForChildProtection.getOrThrow()
        }
        if (let Some(v) <- adOptions.adContentClassification) {
            this.adContentClassification = NativeOptionCString(true, unsafe { LibC.mallocCString(v) })
        }
        if (let Some(v) <- adOptions.nonPersonalizedAd) {
            this.nonPersonalizedAd = NativeOptionUInt32(true, v)
        }

        unsafe {
            try {
                if (let Some(v) <- adOptions.extraAttrs) {
                    this.hasExtraAttrs = true
                    this.extraAttrs = CParameterArr(v)
                }
            } catch (e: Exception) {
                this.adContentClassification.free()
                throw e
            }
        }
    }

    func free() {
        unsafe {
            this.adContentClassification.free()
            if (hasExtraAttrs) {
                this.extraAttrs.free()
            }
        }
    }
}

@C
struct CAdDisplayOptions {
    var customData: NativeOptionCString = NativeOptionCString(false, CString(CPointer()))
    var userId: NativeOptionCString = NativeOptionCString(false, CString(CPointer()))
    var useMobileDataReminder: NativeOptionBool = NativeOptionBool(false, false)
    var mute: NativeOptionBool = NativeOptionBool(false, false)
    var audioFocusType: NativeOptionUInt32 = NativeOptionUInt32(false, 0)
    var extraAttrs: CParameterArr = CParameterArr(CPointer<CParameter>(), 0)
    var hasExtraAttrs: Bool = false

    init() {}

    init(adDisplayOptions: AdDisplayOptions) {
        try {
            if (let Some(v) <- adDisplayOptions.customData) {
                this.customData = NativeOptionCString(true, unsafe { LibC.mallocCString(v) })
            }
            if (let Some(v) <- adDisplayOptions.userId) {
                this.userId = NativeOptionCString(true, unsafe { LibC.mallocCString(v) })
            }
            if (let Some(v) <- adDisplayOptions.useMobileDataReminder) {
                this.useMobileDataReminder = NativeOptionBool(true, v)
            }
            if (let Some(v) <- adDisplayOptions.mute) {
                this.mute = NativeOptionBool(true, v)
            }
            if (let Some(v) <- adDisplayOptions.audioFocusType) {
                this.audioFocusType = NativeOptionUInt32(true, v)
            }
            if (let Some(v) <- adDisplayOptions.extraAttrs) {
                this.extraAttrs = CParameterArr(v)
                this.hasExtraAttrs = true
            }
        } catch (e: Exception) {
            free()
            throw e
        }
    }

    func free() {
        unsafe {
            this.customData.free()
            this.userId.free()
            if (this.hasExtraAttrs) {
                this.extraAttrs.free()
            }
        }
    }
}

@C
struct CAdLoadListenerId {
    let onAdLoadSuccessId_: Int64
    let onAdLoadFailureId_: Int64

    init(onAdLoadSuccessId: Int64, onAdLoadFailureId: Int64) {
        this.onAdLoadSuccessId_ = onAdLoadSuccessId
        this.onAdLoadFailureId_ = onAdLoadFailureId
    }

    init(data: AdLoadListenerId) {
        this.onAdLoadSuccessId_ = data.onAdLoadSuccessId_
        this.onAdLoadFailureId_ = data.onAdLoadFailureId_
    }
}

foreign {
    func FfiOHOSAdvertisingAdLoaderConstructor(context: StageContext): Int64

    func FfiOHOSAdvertisingShowAd(
        cAdvertisement: CAdvertisement,
        cAdDisplayOptions: CAdDisplayOptions,
        context: StageContext
    ): Int32

    func FfiOHOSAdvertisingAdLoaderLoadAd(
        id: Int64,
        cAdParam: CAdRequestParams,
        cAdOptions: CAdOptions,
        listener: CAdLoadListenerId
    ): Int32

    func FfiOHOSAdvertisingAdLoaderLoadAdWithMultiSlots(
        id: Int64,
        cAdParam: CAdRequestParamsArr,
        cAdOptions: CAdOptions,
        listener: CAdLoadListenerId
    ): Int32

    func FfiOHOSAdvertisingGetAdRequestBody(
        cAdParams: CAdRequestParamsArr,
        cAdOptions: CAdOptions,
        errCode: CPointer<Int32>
    ): CString
}
