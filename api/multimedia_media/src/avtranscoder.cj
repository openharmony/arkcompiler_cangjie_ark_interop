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

package ohos.multimedia_media

import std.sync.*
import ohos.labels.APILevel
import ohos.ffi.*
import ohos.base.*
import std.collection.*
import ohos.hilog.HilogChannel

foreign {
    func FfiAVTranscoderCreateAVTranscoder(errCode: CPointer<Int32>): Int64

    func FfiAVTranscoderPrepare(id: Int64, config: CAVTranscoderConfig): Int32

    func FfiAVTranscoderRelease(id: Int64): Int32

    func FfiAVTranscoderCancel(id: Int64): Int32

    func FfiAVTranscoderResume(id: Int64): Int32

    func FfiAVTranscoderPause(id: Int64): Int32

    func FfiAVTranscoderStart(id: Int64): Int32

    func FfiAVTranscoderGetFdSrc(id: Int64, errCode: CPointer<Int32>): CAVFileDescriptor

    func FfiAVTranscoderSetFdSrc(id: Int64, fdSrc: CAVFileDescriptor): Int32

    func FfiAVTranscoderGetFdDst(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiAVTranscoderSetFdDst(id: Int64, fdDst: Int32): Int32

    func FfiAVTranscoderOnProgressUpdate(id: Int64, callbackId: Int64): Int32

    func FfiAVTranscoderOffProgressUpdate(id: Int64): Int32

    func FfiAVTranscoderOnComplete(id: Int64, callbackId: Int64): Int32

    func FfiAVTranscoderOffComplete(id: Int64): Int32

    func FfiAVTranscoderOnError(id: Int64, callbackId: Int64): Int32

    func FfiAVTranscoderOffError(id: Int64): Int32
}

let AV_TRANSCODER_LOG = HilogChannel(LOG_CORE, LOG_DOMAIN_PLAYER, "CJ-AVTranscoder")

/**
 * Creates a AVTranscoder instance.
 * @throws { BusinessException } 5400101 - No memory.
 * @relation function createAVTranscoder(): Promise<AVTranscoder>;
 */
@!APILevel[
    20,
    syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
]
public func createAVTranscoder(): AVTranscoder {
    var errCode: Int32 = 0
    let id = unsafe { FfiAVTranscoderCreateAVTranscoder(inout errCode) }
    throwIfNotSuccess(errCode, "media", "createAVTranscoder")
    return AVTranscoder(id)
}

/**
 * Transcode a source video file to a destination video file.
 * Before calling an AVTranscoder method, you must use @createAVTranscoder
 * to create an AVTranscoder instance.
 * @relation interface AVTranscoder
 */
@!APILevel[
    20,
    syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
]
public class AVTranscoder <: RemoteDataLite {
    let callBackMap: HashMap<String, (CallbackObject, Int64)> = HashMap<String, (CallbackObject, Int64)>()

    protected init(id: Int64) {
        super(id)
        AV_TRANSCODER_LOG.info("[AVTranscoder] construct success")
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Source media file descriptor. Mainstream media formats are supported.
     * @throws { BusinessException } 5400101 - No memory.
     * @throws { BusinessException } 5400102 - Operation not allowed.
     * @relation fdSrc: AVFileDescriptor;
     */
    @!APILevel[
        20,
        syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
    ]
    public mut prop fdSrc: AVFileDescriptor {
        get() {
            var errCode: Int32 = 0
            let fdSrc_ = unsafe { FfiAVTranscoderGetFdSrc(getID(), inout errCode) }
            throwIfNotSuccess(errCode, "AVTranscoder", "get fdSrc")
            let result = fdSrc_.toCJObject()
            return result
        }
        set(value) {
            let fdSrc_ = CAVFileDescriptor(value)
            var errCode = unsafe { FfiAVTranscoderSetFdSrc(getID(), fdSrc_) }
            throwIfNotSuccess(errCode, "AVTranscoder", "set fdSrc")
        }
    }

    /**
     * Destination media file descriptor. Mainstream media formats are supported.
     * @throws { BusinessException } 5400101 - No memory.
     * @throws { BusinessException } 5400102 - Operation not allowed.
     * @relation fdDst: number;
     */
    @!APILevel[
        20,
        syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
    ]
    public mut prop fdDst: Int32 {
        get() {
            var errCode: Int32 = 0
            let fdDst_ = unsafe { FfiAVTranscoderGetFdDst(getID(), inout errCode) }
            throwIfNotSuccess(errCode, "AVTranscoder", "get fdDst")
            return fdDst_
        }
        set(value) {
            var errCode = unsafe { FfiAVTranscoderSetFdDst(getID(), value) }
            throwIfNotSuccess(errCode, "AVTranscoder", "set fdDst")
        }
    }

    /**
     * Prepares for transcoding.
     * @throws { BusinessException } 401 - The parameter check failed.
     * @throws { BusinessException } 5400101 - No memory.
     * @throws { BusinessException } 5400102 - Operation not allowed.
     * @throws { BusinessException } 5400105 - Service died.
     * @throws { BusinessException } 5400106 - Unsupported format.
     * @relation prepare(config: AVTranscoderConfig): Promise<void>;
     */
    @!APILevel[
        20,
        syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
    ]
    public func prepare(config: AVTranscoderConfig): Unit {
        var cconfig = CAVTranscoderConfig(config)
        var errCode = unsafe { FfiAVTranscoderPrepare(getID(), cconfig) }
        cconfig.free()
        throwIfNotSuccess(errCode, "AVTranscoder", "prepare")
    }

    /**
     * Start AVTranscoder.
     * @throws { BusinessException } 5400101 - No memory.
     * @throws { BusinessException } 5400102 - Operation not allowed.
     * @throws { BusinessException } 5400103 - IO error.
     * @throws { BusinessException } 5400105 - Service died.
     * @relation start(): Promise<void>;
     */
    @!APILevel[
        20,
        syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
    ]
    public func start(): Unit {
        var errCode = unsafe { FfiAVTranscoderStart(getID()) }
        throwIfNotSuccess(errCode, "AVTranscoder", "start")
    }

    /**
     * Pause AVTranscoder.
     * @throws { BusinessException } 5400101 - No memory.
     * @throws { BusinessException } 5400102 - Operation not allowed.
     * @throws { BusinessException } 5400103 - IO error.
     * @throws { BusinessException } 5400105 - Service died.
     * @relation pause(): Promise<void>;
     */
    @!APILevel[
        20,
        syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
    ]
    public func pause(): Unit {
        var errCode = unsafe { FfiAVTranscoderPause(getID()) }
        throwIfNotSuccess(errCode, "AVTranscoder", "pause")
    }

    /**
     * Resume AVTranscoder.
     * @throws { BusinessException } 5400101 - No memory.
     * @throws { BusinessException } 5400102 - Operation not allowed.
     * @throws { BusinessException } 5400103 - IO error.
     * @throws { BusinessException } 5400105 - Service died.
     * @relation resume(): Promise<void>;
     */
    @!APILevel[
        20,
        syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
    ]
    public func resume(): Unit {
        var errCode = unsafe { FfiAVTranscoderResume(getID()) }
        throwIfNotSuccess(errCode, "AVTranscoder", "resume")
    }

    /**
     * Cancel AVTranscoder.
     * @throws { BusinessException } 5400101 - No memory.
     * @throws { BusinessException } 5400102 - Operation not allowed.
     * @throws { BusinessException } 5400103 - IO error.
     * @throws { BusinessException } 5400105 - Service died.
     * @relation cancel(): Promise<void>;
     */
    @!APILevel[
        20,
        syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
    ]
    public func cancel(): Unit {
        var errCode = unsafe { FfiAVTranscoderCancel(getID()) }
        throwIfNotSuccess(errCode, "AVTranscoder", "cancel")
    }

    /**
     * Release resources used for AVTranscoder.
     * @throws { BusinessException } 5400101 - No memory.
     * @throws { BusinessException } 5400102 - Operation not allowed.
     * @throws { BusinessException } 5400105 - Service died.
     * @relation release(): Promise<void>;
     */
    @!APILevel[
        20,
        syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
    ]
    public func release(): Unit {
        var errCode = unsafe { FfiAVTranscoderRelease(getID()) }
        throwIfNotSuccess(errCode, "AVTranscoder", "release")
    }

    /**
     * Register listener for trancoding progressUpdate event.
     * @throws { BusinessException } 401 - The parameter check failed.
     * @throws { BusinessException } 5400101 - No memory.
     * @relation on(type:'progressUpdate', callback: Callback<number>):void;
     */
    @!APILevel[
        20,
        syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
    ]
    public func on(`type`: AVTranscoderCallbackType, callback: Callback1Argument<Int32>): Unit {
        match (`type`) {
            case AVTranscoderCallbackType.ProgressUpdate =>
                if (let Some(cb) <- callBackMap.get(`type`.toString())) {
                    if (refEq(callback, cb[0])) {
                        AV_TRANSCODER_LOG.error("AVTranscoder on failed: This request already exists")
                        return
                    }
                }
                unsafe {
                    let wrapper = {param: Int32 => callback.invoke(param)}
                    let lambdaData = Callback1Param<Int32, Unit>(wrapper)
                    let errCode = FfiAVTranscoderOnProgressUpdate(getID(), lambdaData.getID())
                    if (errCode != SUCCESS_CODE) {
                        throw BusinessException(errCode, getErrorMsg(errCode))
                    }
                    callBackMap.add(`type`.toString(), (callback, lambdaData.getID()))
                }
            case _ => throw BusinessException(MSERR_EXT_API9_INVALID_PARAMETER,
                getErrorMsg(MSERR_EXT_API9_INVALID_PARAMETER))
        }
    }

    /**
     * Register listener for trancoding error event.
     * @throws { BusinessException } 401 - The parameter check failed.
     * @throws { BusinessException } 5400101 - No memory.
     * @relation on(type:'error', callback: ErrorCallback):void;
     */
    @!APILevel[
        20,
        syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
    ]
    public func on(`type`: AVTranscoderCallbackType, callback: Callback1Argument<BusinessException>): Unit {
        match (`type`) {
            case AVTranscoderCallbackType.Error =>
                if (let Some(cb) <- callBackMap.get(`type`.toString())) {
                    if (refEq(callback, cb[0])) {
                        AV_TRANSCODER_LOG.error("AVTranscoder on failed: This request already exists")
                        return
                    }
                }
                unsafe {
                    let wrapper = {code: Int32, msg: CString => callback.invoke(BusinessException(code, msg.toString()))}
                    let lambdaData = Callback2Param<Int32, CString, Unit>(wrapper)
                    let errCode = FfiAVTranscoderOnError(getID(), lambdaData.getID())
                    if (errCode != SUCCESS_CODE) {
                        throw BusinessException(errCode, getErrorMsg(errCode))
                    }
                    callBackMap.add(`type`.toString(), (callback, lambdaData.getID()))
                }
            case _ => throw BusinessException(MSERR_EXT_API9_INVALID_PARAMETER,
                getErrorMsg(MSERR_EXT_API9_INVALID_PARAMETER))
        }
    }

    /**
     * Register listener for trancoding complete event.
     * @throws { BusinessException } 401 - The parameter check failed.
     * @throws { BusinessException } 5400101 - No memory.
     * @relation on(type:'complete', callback: Callback<void>):void;
     */
    @!APILevel[
        20,
        syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
    ]
    public func on(`type`: AVTranscoderCallbackType, callback: Callback0Argument): Unit {
        match (`type`) {
            case AVTranscoderCallbackType.Complete =>
                if (let Some(cb) <- callBackMap.get(`type`.toString())) {
                    if (refEq(callback, cb[0])) {
                        AV_TRANSCODER_LOG.error("AVTranscoder on failed: This request already exists")
                        return
                    }
                }
                unsafe {
                    let wrapper = {=> callback.invoke()}
                    let lambdaData = Callback0Param<Unit>(wrapper)
                    let errCode = FfiAVTranscoderOnComplete(getID(), lambdaData.getID())
                    if (errCode != SUCCESS_CODE) {
                        throw BusinessException(errCode, getErrorMsg(errCode))
                    }
                    callBackMap.add(`type`.toString(), (callback, lambdaData.getID()))
                }
            case _ => throw BusinessException(MSERR_EXT_API9_INVALID_PARAMETER,
                getErrorMsg(MSERR_EXT_API9_INVALID_PARAMETER))
        }
    }

    /**
     * Unregister listener for trancoding event.
     * @throws { BusinessException } 401 - The parameter check failed.
     * @throws { BusinessException } 5400101 - No memory.
     * @relation off(type:'complete', callback?: Callback<void>):void;
     * off(type:'error', callback?: ErrorCallback):void;
     * off(type:'progressUpdate', callback?: Callback<number>):void;
     */
    @!APILevel[
        20,
        syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
    ]
    public func off(`type`: AVTranscoderCallbackType, callback!: ?CallbackObject = None): Unit {
        AV_TRANSCODER_LOG.debug("unsubscribe StateChange or error")
        if (!callBackMap.contains(`type`.toString())) {
            return
        }
        var errorCode: Int32 = 0
        unsafe {
            match (`type`) {
                case AVTranscoderCallbackType.ProgressUpdate => errorCode = FfiAVTranscoderOffProgressUpdate(getID())
                case AVTranscoderCallbackType.Complete => errorCode = FfiAVTranscoderOffComplete(getID())
                case AVTranscoderCallbackType.Error => errorCode = FfiAVTranscoderOffError(getID())
                case _ => throw BusinessException(MSERR_EXT_API9_INVALID_PARAMETER,
                    getErrorMsg(MSERR_EXT_API9_INVALID_PARAMETER))
            }
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
        if (let Some(v) <- callback) {
            if (let Some(cb) <- callBackMap.get(`type`.toString())) {
                if (refEq(v, cb[0])) {
                    callBackMap.remove(`type`.toString())
                }
            }
            return
        }
        callBackMap.remove(`type`.toString())
    }
}
