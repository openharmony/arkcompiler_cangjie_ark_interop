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

import ohos.hilog.*
import ohos.base.*
import ohos.ability.*
import ohos.ffi.*
import std.collection.*
import std.io.*
import ohos.labels.*

type StageContext = CPointer<Unit>

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Advertising.Ads"
]
public class Parameter {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Advertising.Ads"
    ]
    public Parameter(
        let key: String,
        let value: ValueType
    ) {}

    init(ret: CParameter) {
        this.key = ret.key.toString()
        this.value = readValueType(ret.valueType, ret.value)
    }
}

const INT_TYPE: Int8 = 0
const STRING_TYPE: Int8 = 1
const BOOL_TYPE: Int8 = 2

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Advertising.Ads"
]
public enum ValueType {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Advertising.Ads"
    ]
    INT(Int32)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Advertising.Ads"
    ]
    BOOL(Bool)
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Advertising.Ads"
    ]
    STRING(String)
    | ...
}

func readValueType(valueType: Int8, value: CPointer<Unit>): ValueType {
    unsafe {
        if (value.isNull()) {
            throw IllegalMemoryException("Out of Memory!")
        }
        match (valueType) {
            case 0 =>
                var res = CPointer<Int32>(value).read()
                return INT(res)
            case 1 =>
                var res = CString(CPointer<UInt8>(value))
                return STRING(res.toString())
            case 2 =>
                var res = CPointer<Bool>(value).read()
                return BOOL(res)
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Advertising.Ads"
]
public class Advertisement {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Advertising.Ads"
    ]
    public Advertisement(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let adType: UInt32,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let uniqueId: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let rewarded: Bool,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let shown: Bool,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let clicked: Bool,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let rewardVerifyConfig: HashMap<String, String>,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let extraAttrs: Array<Parameter>
    ) {}

    init(cAdvertisement: CAdvertisement) {
        this.adType = cAdvertisement.adType
        this.uniqueId = cAdvertisement.uniqueId.toString()
        this.rewarded = cAdvertisement.rewarded
        this.shown = cAdvertisement.shown
        this.clicked = cAdvertisement.clicked
        this.rewardVerifyConfig = cAdvertisement.rewardVerifyConfig.toHashMap()
        this.extraAttrs = cAdvertisement.extraAttrs.toCJValue()
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Advertising.Ads"
]
public class AdRequestParams {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Advertising.Ads"
    ]
    public AdRequestParams(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let adId!: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let adType!: ?UInt32 = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let adCount!: ?UInt32 = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let adWidth!: ?UInt32 = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let adHeight!: ?UInt32 = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let adSearchKeyword!: ?String = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let extraAttrs!: ?Array<Parameter> = None
    ) {}

    init(v: CAdRequestParams) {
        this.adId = v.adId.toString()
        if (v.adType.hasValue) {
            this.adType = v.adType.value
        } else {
            this.adType = None
        }
        if (v.adCount.hasValue) {
            this.adCount = v.adCount.value
        } else {
            this.adCount = None
        }
        if (v.adWidth.hasValue) {
            this.adWidth = v.adWidth.value
        } else {
            this.adWidth = None
        }
        if (v.adHeight.hasValue) {
            this.adHeight = v.adHeight.value
        } else {
            this.adHeight = None
        }
        if (v.adSearchKeyword.hasValue) {
            this.adSearchKeyword = v.adSearchKeyword.value.toString()
        } else {
            this.adSearchKeyword = None
        }
        if (v.hasExtraAttrs) {
            this.extraAttrs = v.extraAttrs.toCJOptionValue()
        } else {
            this.extraAttrs = None
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Advertising.Ads"
]
public class AdOptions {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Advertising.Ads"
    ]
    public AdOptions(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let tagForChildProtection!: ?Int32 = -1,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let adContentClassification!: ?String = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let nonPersonalizedAd!: ?UInt32 = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let extraAttrs!: ?Array<Parameter> = None
    ) {}

    init(v: CAdOptions) {
        this.tagForChildProtection = v.tagForChildProtection
        if (v.adContentClassification.hasValue) {
            this.adContentClassification = v.adContentClassification.value.toString()
        } else {
            this.adContentClassification = None
        }
        if (v.nonPersonalizedAd.hasValue) {
            this.nonPersonalizedAd = v.nonPersonalizedAd.value
        } else {
            this.nonPersonalizedAd = None
        }
        if (v.hasExtraAttrs) {
            this.extraAttrs = v.extraAttrs.toCJOptionValue()
        } else {
            this.extraAttrs = None
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Advertising.Ads"
]
public class AdDisplayOptions {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Advertising.Ads"
    ]
    public AdDisplayOptions(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let customData!: ?String = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let userId!: ?String = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let useMobileDataReminder!: ?Bool = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let mute!: ?Bool = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let audioFocusType!: ?UInt32 = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let extraAttrs!: ?Array<Parameter> = None
    ) {}

    init(cadDisplayOptions: CAdDisplayOptions) {
        if (cadDisplayOptions.customData.hasValue) {
            this.customData = cadDisplayOptions.customData.value.toString()
        } else {
            this.customData = None
        }
        if (cadDisplayOptions.userId.hasValue) {
            this.userId = cadDisplayOptions.userId.value.toString()
        } else {
            this.userId = None
        }
        if (cadDisplayOptions.useMobileDataReminder.hasValue) {
            this.useMobileDataReminder = cadDisplayOptions.useMobileDataReminder.value
        } else {
            this.useMobileDataReminder = None
        }
        if (cadDisplayOptions.mute.hasValue) {
            this.mute = cadDisplayOptions.mute.value
        } else {
            this.mute = None
        }
        if (cadDisplayOptions.audioFocusType.hasValue) {
            this.audioFocusType = cadDisplayOptions.audioFocusType.value
        } else {
            this.audioFocusType = None
        }
        if (cadDisplayOptions.hasExtraAttrs) {
            this.extraAttrs = cadDisplayOptions.extraAttrs.toCJOptionValue()
        } else {
            this.extraAttrs = None
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Advertising.Ads"
]
public class AdInteractionListener {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Advertising.Ads"
    ]
    public AdInteractionListener(
        /**
         * Ads status callback.
         * @param { String } status - The current ad status.
         * @param { Advertisement } ad - The ad which status is changed.
         * @param { String } data - The data of current ad status.
         * @syscap SystemCapability.Advertising.Ads
         * @atomicservice
         * @brief onStatusChanged(status: string, ad: Advertisement, data: string);
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let onStatusChanged: (status: String, ad: Advertisement, data: String) -> Unit
    ) {}
}

func adInteractionListenerImp(listener: AdInteractionListener): Int64 {
    let onStatusChangedWrapper = {
        status: CString, ad: CAdvertisement, data: CString => listener.onStatusChanged(status.toString(),
            Advertisement(ad), data.toString())
    }
    let onStatusChangedLambdaData = Callback3Param<CString, CAdvertisement, CString, Unit>(onStatusChangedWrapper)

    return onStatusChangedLambdaData.getID()
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Advertising.Ads"
]
public class AdLoadListener {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Advertising.Ads"
    ]
    public AdLoadListener(
        /**
         * Called by system when the ad load has been succeeded.
         * @param { Array<Advertisement> } ads - advertisements are loaded successfully.
         * @syscap SystemCapability.Advertising.Ads
         * @atomicservice
         * @brief onAdLoadSuccess(ads: Array<Advertisement>): void;
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let onAdLoadSuccess: (ads: Array<Advertisement>) -> Unit,

        /**
         * Called by system when the ad load has been failed.
         * @param { number } errorCode - code of ad loading failure.
         * @param { String } errorMsg - error message.
         * @syscap SystemCapability.Advertising.Ads
         * @atomicservice
         * @brief onAdLoadFailure(errorCode: number, errorMsg: string): void;
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let onAdLoadFailure: (errorCode: Int32, errorMsg: String) -> Unit
    ) {}
}

struct AdLoadListenerId {
    let onAdLoadSuccessId_: Int64
    let onAdLoadFailureId_: Int64

    init(onAdLoadSuccessId: Int64, onAdLoadFailureId: Int64) {
        this.onAdLoadSuccessId_ = onAdLoadSuccessId
        this.onAdLoadFailureId_ = onAdLoadFailureId
    }

    init(data: CAdLoadListenerId) {
        this.onAdLoadSuccessId_ = data.onAdLoadSuccessId_
        this.onAdLoadFailureId_ = data.onAdLoadFailureId_
    }
}

func adLoadListenerImp(listener: AdLoadListener): AdLoadListenerId {
    let onAdLoadSuccessWrapper = {ads: CAdvertisementArr => listener.onAdLoadSuccess(ads.toCJValue())}
    let onAdLoadSuccessLambdaData = Callback1Param<CAdvertisementArr, Unit>(onAdLoadSuccessWrapper)

    let onAdLoadFailureWrapper = {
        errorCode: Int32, errorMsg: CString => listener.onAdLoadFailure(errorCode, errorMsg.toString())
    }
    let onAdLoadFailureLambdaData = Callback2Param<Int32, CString, Unit>(onAdLoadFailureWrapper)

    return AdLoadListenerId(onAdLoadSuccessLambdaData.getID(), onAdLoadFailureLambdaData.getID())
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Advertising.Ads"
]
public class MultiSlotsAdLoadListener {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Advertising.Ads"
    ]
    public MultiSlotsAdLoadListener(
        /**
         * Called by system when the ad load has been succeeded.
         * @param { HashMap<String, Array<Advertisement>> } adsMap - advertisements are loaded successfully.
         * @syscap SystemCapability.Advertising.Ads
         * @atomicservice
         * @brief onAdLoadSuccess(adsMap: Map<string, Array<Advertisement>>): void;
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let onAdLoadSuccess: (adsMap: HashMap<String, Array<Advertisement>>) -> Unit,

        /**
         * Called by system when the ad load has been failed.
         * @param { number } errorCode - code of ad loading failure.
         * @param { String } errorMsg - error message.
         * @syscap SystemCapability.Advertising.Ads
         * @atomicservice
         * @brief onAdLoadFailure(errorCode: number, errorMsg: string): void;
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Advertising.Ads"
        ]
        public let onAdLoadFailure: (errorCode: Int32, errorMsg: String) -> Unit
    ) {}
}

func multiSlotsAdLoadListenerImp(listener: MultiSlotsAdLoadListener): AdLoadListenerId {
    let onAdLoadSuccessWrapper = {ads: CAdvertisementHashStrArr => listener.onAdLoadSuccess(ads.toHashMap())}
    let onAdLoadSuccessLambdaData = Callback1Param<CAdvertisementHashStrArr, Unit>(onAdLoadSuccessWrapper)

    let onAdLoadFailureWrapper = {
        errorCode: Int32, errorMsg: CString => listener.onAdLoadFailure(errorCode, errorMsg.toString())
    }
    let onAdLoadFailureLambdaData = Callback2Param<Int32, CString, Unit>(onAdLoadFailureWrapper)

    return AdLoadListenerId(onAdLoadSuccessLambdaData.getID(), onAdLoadFailureLambdaData.getID())
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Advertising.Ads"
]
public class AdLoader <: RemoteDataLite {
    /**
     * @brief  constructor()
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Advertising.Ads"
    ]
    public init(context: StageContext) {
        super(unsafe { FfiOHOSAdvertisingAdLoaderConstructor(context) })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Load ad.
     * @param { AdRequestParams } adParam - Indicates the parameters in the request.
     * @param { AdOptions } adOptions - Indicates the ad options.
     * @param { AdLoadListener } listener - Indicates the listener to be registered that use to load ad.
     * @throws { BusinessError } 401 - Invalid input parameter.
     * @throws { BusinessError } 801 - Device not supported.
     * @throws { BusinessError } 21800001 - System internal error.
     * @throws { BusinessError } 21800003 - Failed to load the ad request.
     * @syscap SystemCapability.Advertising.Ads
     * @atomicservice
     * @brief loadAd(adParam: AdRequestParams, adOptions: AdOptions, listener: AdLoadListener): void;
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Advertising.Ads"
    ]
    public func loadAd(adParam: AdRequestParams, adOptions: AdOptions, listener: AdLoadListener): Unit {
        unsafe {
            var cAdParam = CAdRequestParams()
            var cAdOptions = CAdOptions()
            try {
                cAdParam = CAdRequestParams(adParam)
                cAdOptions = CAdOptions(adOptions)
                let listenerId = adLoadListenerImp(listener)

                let ret = FfiOHOSAdvertisingAdLoaderLoadAd(getID(), cAdParam, cAdOptions, CAdLoadListenerId(listenerId))
                if (ret != SUCCESS_CODE) {
                    throw BusinessException(ret, getErrorInfo(ret))
                }
            } finally {
                cAdParam.free()
                cAdOptions.free()
            }
        }
    }

    /**
     * Load ad with multi-slots.
     * @param { Array<AdRequestParams> } adParams - Indicates the parameters in the request.
     * @param { AdOptions } adOptions - Indicates the ad options.
     * @param { MultiSlotsAdLoadListener } listener - Indicates the listener to be registered that use to load ad.
     * @throws { BusinessError } 401 - Invalid input parameter.
     * @throws { BusinessError } 801 - Device not supported.
     * @throws { BusinessError } 21800001 - System internal error.
     * @throws { BusinessError } 21800003 - Failed to load the ad request.
     * @syscap SystemCapability.Advertising.Ads
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Advertising.Ads"
    ]
    public func loadAdWithMultiSlots(
        adParams: Array<AdRequestParams>,
        adOptions: AdOptions,
        listener: MultiSlotsAdLoadListener
    ): Unit {
        unsafe {
            var cAdParams = CAdRequestParamsArr()
            var cAdOptions = CAdOptions()
            try {
                cAdParams = CAdRequestParamsArr(adParams)
                cAdOptions = CAdOptions(adOptions)
                let listenerId = multiSlotsAdLoadListenerImp(listener)

                let ret = FfiOHOSAdvertisingAdLoaderLoadAdWithMultiSlots(getID(), cAdParams, cAdOptions,
                    CAdLoadListenerId(listenerId))
                if (ret != SUCCESS_CODE) {
                    throw BusinessException(ret, getErrorInfo(ret))
                }
            } finally {
                cAdParams.free()
                cAdOptions.free()
            }
        }
    }
}

/**
 * Show the reward and interstitial ad.
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Advertising.Ads"
]
public func showAd(
    advertisement: Advertisement,
    adDisplayoptions: AdDisplayOptions,
    context: ?StageContext
): Unit {
    unsafe {
        var cAdvertisement = CAdvertisement()
        var cAdDisplayoptions = CAdDisplayOptions()
        try {
            cAdvertisement = CAdvertisement(advertisement)
            cAdDisplayoptions = CAdDisplayOptions(adDisplayoptions)

            let result = FfiOHOSAdvertisingShowAd(cAdvertisement, cAdDisplayoptions, context.getOrThrow())
            if (result != SUCCESS_CODE) {
                throw BusinessException(result, getErrorInfo(result))
            }
        } finally {
            cAdvertisement.free()
            cAdDisplayoptions.free()
        }
    }
}

/**
 * Get message body for ad requesting.
 * @param { Array<AdRequestParams> } adParams - Indicates the parameters in the request.
 * @param { AdOptions } adOptions - Indicates the ad options.
 * @returns { String } ad request message body.
 * @throws { BusinessError } 401 - Invalid input parameter. Possible causes: Mandatory parameters are left unspecified.
 * @throws { BusinessError } 801 - Device not supported.
 * @throws { BusinessError } 21800001 - System internal error.
 * @syscap SystemCapability.Advertising.Ads
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Advertising.Ads"
]
public func getAdRequestBody(adParams: Array<AdRequestParams>, adOptions: AdOptions): String {
    unsafe {
        var cAdParams = CAdRequestParamsArr()
        var cAdOptions = CAdOptions()
        try {
            cAdParams = CAdRequestParamsArr(adParams)
            cAdOptions = CAdOptions(adOptions)

            var errorCode = 0i32
            let result = FfiOHOSAdvertisingGetAdRequestBody(cAdParams, cAdOptions, inout errorCode)
            if (errorCode != SUCCESS_CODE) {
                throw BusinessException(errorCode, getErrorInfo(errorCode))
            }

            let body = result.toString()
            LibC.free(result)
            return body
        } finally {
            cAdParams.free()
            cAdOptions.free()
        }
    }
}
