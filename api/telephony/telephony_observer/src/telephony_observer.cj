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

package ohos.telephony_observer

import ohos.base.*
import ohos.telephony_call.*
import ohos.telephony_data.*
import ohos.telephony_radio.*
import ohos.telephony_sim.*
import std.sync.*
import ohos.ffi.*
import std.collection.*
import ohos.labels.*

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.StateRegistry"
]
public class TelephonyObserver {
    private static let CALLBACK_LIST = ArrayList<(CallbackObject, String, Int64)>()
    private static let ON_OFF_MUTEX = Mutex()

    private static func onNetworkStateChange(options: CObserverOptions, callback: Callback1Argument<NetworkState>): Unit {
        synchronized(ON_OFF_MUTEX) {
            for (item in CALLBACK_LIST) {
                if (refEq(callback, item[0]) && item[1] == "networkStateChange") {
                    TELEPHONY_OBSERVER_LOG.info(
                        "Telephony Observer on networkStateChange failed: The same function has registered.")
                    return
                }
            }
            unsafe {
                let wrapper = {
                    value: CPointer<Unit> =>
                    let workstate = CPointer<CNetworkState>(value).read()
                    let networkState = workstate.toNetworkState()
                    workstate.free()
                    callback.invoke(networkState)
                }
                let lambdaData = Callback1Param<CPointer<Unit>, Unit>(wrapper)
                let errCode = FfiTelephonyObserverOnNetworkStateChange(options, lambdaData.getID())
                throwIfNotSuccess(errCode, "TelephonyObserver", "onNetworkStateChange")
                CALLBACK_LIST.add((callback, "networkStateChange", lambdaData.getID()))
            }
        }
    }

    private static func offNetworkStateChange(callback: Callback1Argument<NetworkState>): Unit {
        synchronized(ON_OFF_MUTEX) {
            for (idx in 0..CALLBACK_LIST.size) {
                let item = CALLBACK_LIST[idx]
                if (refEq(callback, item[0]) && item[1] == "networkStateChange") {
                    let errCode = unsafe { FfiTelephonyObserverOffNetworkStateChange(item[2]) }
                    throwIfNotSuccess(errCode, "TelephonyObserver", "offNetworkStateChange")
                    CALLBACK_LIST.remove(at: idx)
                    return
                }
            }
            TELEPHONY_OBSERVER_LOG.info("Telephony Observer off networkStateChange: This function cannot be found.")
        }
    }

    private static func offNetworkStateChange(): Unit {
        synchronized(ON_OFF_MUTEX) {
            unsafe {
                let errCode = FfiTelephonyObserverOffAllNetworkStateChange()
                throwIfNotSuccess(errCode, "TelephonyObserver", "offNetworkStateChange")
                CALLBACK_LIST.removeIf({item => item[1] == "networkStateChange"})
            }
        }
    }

    private static func onSignalInfoChange(
        options: CObserverOptions,
        callback: Callback1Argument<Array<SignalInformation>>
    ): Unit {
        synchronized(ON_OFF_MUTEX) {
            for (item in CALLBACK_LIST) {
                if (refEq(callback, item[0]) && item[1] == "signalInfoChange") {
                    TELEPHONY_OBSERVER_LOG.info(
                        "Telephony Observer on signalInfoChange failed: The same function has registered.")
                    return
                }
            }
            unsafe {
                let wrapper = {
                    value: CPointer<Unit> =>
                    let arraySignalInformation = CPointer<CArraySignalInformation>(value).read()
                    let signalInformations = arraySignalInformation.toArraySignalInformation()
                    arraySignalInformation.free()
                    callback.invoke(signalInformations)
                }
                let lambdaData = Callback1Param<CPointer<Unit>, Unit>(wrapper)
                let errCode = FfiTelephonyObserverOnSignalInfoChange(options, lambdaData.getID())
                throwIfNotSuccess(errCode, "TelephonyObserver", "onSignalInfoChange")
                CALLBACK_LIST.add((callback, "signalInfoChange", lambdaData.getID()))
            }
        }
    }

    private static func offSignalInfoChange(callback: Callback1Argument<Array<SignalInformation>>): Unit {
        synchronized(ON_OFF_MUTEX) {
            for (idx in 0..CALLBACK_LIST.size) {
                let item = CALLBACK_LIST[idx]
                if (refEq(callback, item[0]) && item[1] == "signalInfoChange") {
                    let errCode = unsafe { FfiTelephonyObserverOffSignalInfoChange(item[2]) }
                    throwIfNotSuccess(errCode, "TelephonyObserver", "offSignalInfoChange")
                    CALLBACK_LIST.remove(at: idx)
                    return
                }
            }
            TELEPHONY_OBSERVER_LOG.info("Telephony Observer off signalInfoChange: This function cannot be found.")
        }
    }

    private static func offSignalInfoChange(): Unit {
        synchronized(TelephonyObserver.ON_OFF_MUTEX) {
            unsafe {
                let errCode = FfiTelephonyObserverOffAllSignalInfoChange()
                throwIfNotSuccess(errCode, "TelephonyObserver", "offSignalInfoChange")
                CALLBACK_LIST.removeIf({item => item[1] == "signalInfoChange"})
            }
        }
    }

    private static func onCallStateChange(options: CObserverOptions, callback: Callback1Argument<CallStateInfo>): Unit {
        synchronized(ON_OFF_MUTEX) {
            for (item in CALLBACK_LIST) {
                if (refEq(callback, item[0]) && item[1] == "callStateChange") {
                    TELEPHONY_OBSERVER_LOG.info(
                        "Telephony Observer on callStateChange failed: The same function has registered.")
                    return
                }
            }
            unsafe {
                let wrapper = {
                    value: CPointer<Unit> =>
                    let stateInfo = CPointer<CCallStateInfo>(value).read()
                    let callStateInfo = stateInfo.toCallStateInfo()
                    stateInfo.free()
                    callback.invoke(callStateInfo)
                }
                let lambdaData = Callback1Param<CPointer<Unit>, Unit>(wrapper)
                let errCode = FfiTelephonyObserverOnCallStateChange(options, lambdaData.getID())
                throwIfNotSuccess(errCode, "TelephonyObserver", "onCallStateChange")
                CALLBACK_LIST.add((callback, "callStateChange", lambdaData.getID()))
            }
        }
    }

    private static func offCallStateChange(callback: Callback1Argument<CallStateInfo>): Unit {
        synchronized(ON_OFF_MUTEX) {
            for (idx in 0..CALLBACK_LIST.size) {
                let item = CALLBACK_LIST[idx]
                if (refEq(callback, item[0]) && item[1] == "callStateChange") {
                    let errCode = unsafe { FfiTelephonyObserverOffCallStateChange(item[2]) }
                    throwIfNotSuccess(errCode, "TelephonyObserver", "callStateChange")
                    CALLBACK_LIST.remove(at: idx)
                    return
                }
            }
            TELEPHONY_OBSERVER_LOG.info("Telephony Observer off callStateChange: This function cannot be found.")
        }
    }

    private static func offCallStateChange(): Unit {
        synchronized(ON_OFF_MUTEX) {
            unsafe {
                let errCode = FfiTelephonyObserverOffAllCallStateChange()
                throwIfNotSuccess(errCode, "TelephonyObserver", "offCallStateChange")
                CALLBACK_LIST.removeIf({item => item[1] == "callStateChange"})
            }
        }
    }

    private static func onCellularDataConnectionStateChange(
        options: CObserverOptions,
        callback: Callback1Argument<DataConnectionStateInfo>
    ): Unit {
        synchronized(ON_OFF_MUTEX) {
            for (item in CALLBACK_LIST) {
                if (refEq(callback, item[0]) && item[1] == "cellularDataConnectionStateChange") {
                    TELEPHONY_OBSERVER_LOG.info(
                        "Telephony Observer on cellularDataConnectionStateChange failed: The same function has registered.")
                    return
                }
            }
            unsafe {
                let wrapper = {
                    value: CPointer<Unit> =>
                    let stateInfo = CPointer<CDataConnectionStateInfo>(value).read()
                    callback.invoke(stateInfo.toDataConnectionStateInfo())
                }
                let lambdaData = Callback1Param<CPointer<Unit>, Unit>(wrapper)
                let errCode = FfiTelephonyObserverOnCellularDataConnectionStateChange(options, lambdaData.getID())
                throwIfNotSuccess(errCode, "TelephonyObserver", "onCellularDataConnectionStateChange")
                CALLBACK_LIST.add((callback, "cellularDataConnectionStateChange", lambdaData.getID()))
            }
        }
    }

    private static func offCellularDataConnectionStateChange(callback: Callback1Argument<DataConnectionStateInfo>): Unit {
        synchronized(ON_OFF_MUTEX) {
            for (idx in 0..CALLBACK_LIST.size) {
                let item = CALLBACK_LIST[idx]
                if (refEq(callback, item[0]) && item[1] == "cellularDataConnectionStateChange") {
                    let errCode = unsafe { FfiTelephonyObserverOffCellularDataConnectionStateChange(item[2]) }
                    throwIfNotSuccess(errCode, "TelephonyObserver", "cellularDataConnectionStateChange")
                    CALLBACK_LIST.remove(at: idx)
                    return
                }
            }
            TELEPHONY_OBSERVER_LOG.info(
                "Telephony Observer off cellularDataConnectionStateChange: This function cannot be found.")
        }
    }

    private static func offCellularDataConnectionStateChange(): Unit {
        synchronized(ON_OFF_MUTEX) {
            unsafe {
                let errCode = FfiTelephonyObserverOffAllCellularDataConnectionStateChange()
                throwIfNotSuccess(errCode, "TelephonyObserver", "offCellularDataConnectionStateChange")
                CALLBACK_LIST.removeIf({item => item[1] == "cellularDataConnectionStateChange"})
            }
        }
    }

    private static func onCellularDataFlowChange(options: CObserverOptions, callback: Callback1Argument<DataFlowType>): Unit {
        synchronized(ON_OFF_MUTEX) {
            for (item in CALLBACK_LIST) {
                if (refEq(callback, item[0]) && item[1] == "cellularDataFlowChange") {
                    TELEPHONY_OBSERVER_LOG.info(
                        "Telephony Observer on cellularDataFlowChange failed: The same function has registered.")
                    return
                }
            }
            unsafe {
                let wrapper = {
                    value: CPointer<Unit> =>
                    let dataFlow = CPointer<Int32>(value).read()
                    callback.invoke(DataFlowType.parse(dataFlow))
                }
                let lambdaData = Callback1Param<CPointer<Unit>, Unit>(wrapper)
                let errCode = FfiTelephonyObserverOnCellularDataFlowChange(options, lambdaData.getID())
                throwIfNotSuccess(errCode, "TelephonyObserver", "onCellularDataFlowChange")
                CALLBACK_LIST.add((callback, "cellularDataFlowChange", lambdaData.getID()))
            }
        }
    }

    private static func offCellularDataFlowChange(callback: Callback1Argument<DataFlowType>): Unit {
        synchronized(ON_OFF_MUTEX) {
            for (idx in 0..CALLBACK_LIST.size) {
                let item = CALLBACK_LIST[idx]
                if (refEq(callback, item[0]) && item[1] == "cellularDataFlowChange") {
                    let errCode = unsafe { FfiTelephonyObserverOffCellularDataFlowChange(item[2]) }
                    throwIfNotSuccess(errCode, "TelephonyObserver", "offCellularDataFlowChange")
                    CALLBACK_LIST.remove(at: idx)
                    return
                }
            }
            TELEPHONY_OBSERVER_LOG.info("Telephony Observer off cellularDataFlowChange: This function cannot be found.")
        }
    }

    private static func offCellularDataFlowChange(): Unit {
        synchronized(ON_OFF_MUTEX) {
            unsafe {
                let errCode = FfiTelephonyObserverOffAllCellularDataFlowChange()
                throwIfNotSuccess(errCode, "TelephonyObserver", "offCellularDataFlowChange")
                CALLBACK_LIST.removeIf({item => item[1] == "cellularDataFlowChange"})
            }
        }
    }

    private static func onSimStateChange(options: CObserverOptions, callback: Callback1Argument<SimStateData>): Unit {
        synchronized(ON_OFF_MUTEX) {
            for (item in CALLBACK_LIST) {
                if (refEq(callback, item[0]) && item[1] == "simStateChange") {
                    TELEPHONY_OBSERVER_LOG.info(
                        "Telephony Observer on simStateChange failed: The same function has registered.")
                    return
                }
            }
            unsafe {
                let wrapper = {
                    value: CPointer<Unit> =>
                    let simStateData = CPointer<CSimStateData>(value).read()
                    callback.invoke(simStateData.toSimStateData())
                }
                let lambdaData = Callback1Param<CPointer<Unit>, Unit>(wrapper)
                let errCode = FfiTelephonyObserverOnSimStateChange(options, lambdaData.getID())
                throwIfNotSuccess(errCode, "TelephonyObserver", "onSimStateChange")
                CALLBACK_LIST.add((callback, "simStateChange", lambdaData.getID()))
            }
        }
    }

    private static func offSimStateChange(callback: Callback1Argument<SimStateData>): Unit {
        synchronized(ON_OFF_MUTEX) {
            for (idx in 0..CALLBACK_LIST.size) {
                let item = CALLBACK_LIST[idx]
                if (refEq(callback, item[0]) && item[1] == "simStateChange") {
                    let errCode = unsafe { FfiTelephonyObserverOffSimStateChange(item[2]) }
                    throwIfNotSuccess(errCode, "TelephonyObserver", "offSimStateChange")
                    CALLBACK_LIST.remove(at: idx)
                    return
                }
            }
            TELEPHONY_OBSERVER_LOG.info("Telephony Observer off simStateChange: This function cannot be found.")
        }
    }

    private static func offSimStateChange(): Unit {
        synchronized(ON_OFF_MUTEX) {
            unsafe {
                let errCode = FfiTelephonyObserverOffAllSimStateChange()
                throwIfNotSuccess(errCode, "TelephonyObserver", "offSimStateChange")
                CALLBACK_LIST.removeIf({item => item[1] == "simStateChange"})
            }
        }
    }

    private static func onIccAccountInfoChange(callback: Callback0Argument): Unit {
        synchronized(ON_OFF_MUTEX) {
            for (item in CALLBACK_LIST) {
                if (refEq(callback, item[0]) && item[1] == "iccAccountInfoChange") {
                    TELEPHONY_OBSERVER_LOG.info(
                        "Telephony Observer on iccAccountInfoChange failed: The same function has registered.")
                    return
                }
            }
            unsafe {
                let wrapper = {_: CPointer<Unit> => callback.invoke()}
                let lambdaData = Callback1Param<CPointer<Unit>, Unit>(wrapper)
                let errCode = FfiTelephonyObserverOnIccAccountInfoChange(lambdaData.getID())
                throwIfNotSuccess(errCode, "TelephonyObserver", "onIccAccountInfoChange")
                CALLBACK_LIST.add((callback, "iccAccountInfoChange", lambdaData.getID()))
            }
        }
    }

    private static func offIccAccountInfoChange(callback: Callback0Argument): Unit {
        synchronized(ON_OFF_MUTEX) {
            for (idx in 0..CALLBACK_LIST.size) {
                let item = CALLBACK_LIST[idx]
                if (refEq(callback, item[0]) && item[1] == "iccAccountInfoChange") {
                    let errCode = unsafe { FfiTelephonyObserverOffIccAccountInfoChange(item[2]) }
                    throwIfNotSuccess(errCode, "TelephonyObserver", "offIccAccountInfoChange")
                    CALLBACK_LIST.remove(at: idx)
                    return
                }
            }
            TELEPHONY_OBSERVER_LOG.info("Telephony Observer off iccAccountInfoChange: This function cannot be found.")
        }
    }

    private static func offIccAccountInfoChange(): Unit {
        synchronized(ON_OFF_MUTEX) {
            unsafe {
                let errCode = FfiTelephonyObserverOffAllIccAccountInfoChange()
                throwIfNotSuccess(errCode, "TelephonyObserver", "offIccAccountInfoChange")
                CALLBACK_LIST.removeIf({item => item[1] == "iccAccountInfoChange"})
            }
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public static func on(eventType: ObserverEventType, callback: Callback1Argument<NetworkState>,
        options!: ?ObserverOptions = None): Unit {
        let observerOptions = options?.toCObserverOptions() ?? CObserverOptions(0)
        match (eventType) {
            case NetworkStateChange => onNetworkStateChange(observerOptions, callback)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "${eventType.toString()} is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public static func off(eventType: ObserverEventType, callback: Callback1Argument<NetworkState>): Unit {
        match (eventType) {
            case NetworkStateChange => offNetworkStateChange(callback)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "${eventType.toString()} is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public static func on(eventType: ObserverEventType, callback: Callback1Argument<Array<SignalInformation>>,
        options!: ?ObserverOptions = None): Unit {
        let observerOptions = options?.toCObserverOptions() ?? CObserverOptions(0)
        match (eventType) {
            case SignalInfoChange => onSignalInfoChange(observerOptions, callback)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "${eventType.toString()} is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public static func off(eventType: ObserverEventType, callback: Callback1Argument<Array<SignalInformation>>): Unit {
        match (eventType) {
            case SignalInfoChange => offSignalInfoChange(callback)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "${eventType.toString()} is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public static func on(eventType: ObserverEventType, callback: Callback1Argument<CallStateInfo>,
        options!: ?ObserverOptions = None): Unit {
        let observerOptions = options?.toCObserverOptions() ?? CObserverOptions(0)
        match (eventType) {
            case CallStateChange => onCallStateChange(observerOptions, callback)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "${eventType.toString()} is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public static func off(eventType: ObserverEventType, callback: Callback1Argument<CallStateInfo>): Unit {
        match (eventType) {
            case CallStateChange => offCallStateChange(callback)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "${eventType.toString()} is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public static func on(eventType: ObserverEventType, callback: Callback1Argument<DataConnectionStateInfo>,
        options!: ?ObserverOptions = None): Unit {
        let observerOptions = options?.toCObserverOptions() ?? CObserverOptions(0)
        match (eventType) {
            case CellularDataConnectionStateChange => onCellularDataConnectionStateChange(observerOptions, callback)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "${eventType.toString()} is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public static func off(eventType: ObserverEventType, callback: Callback1Argument<DataConnectionStateInfo>): Unit {
        match (eventType) {
            case CellularDataConnectionStateChange => offCellularDataConnectionStateChange(callback)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "${eventType.toString()} is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public static func on(eventType: ObserverEventType, callback: Callback1Argument<DataFlowType>,
        options!: ?ObserverOptions = None): Unit {
        let observerOptions = options?.toCObserverOptions() ?? CObserverOptions(0)
        match (eventType) {
            case CellularDataFlowChange => onCellularDataFlowChange(observerOptions, callback)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "${eventType.toString()} is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public static func off(eventType: ObserverEventType, callback: Callback1Argument<DataFlowType>): Unit {
        match (eventType) {
            case CellularDataFlowChange => offCellularDataFlowChange(callback)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "${eventType.toString()} is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public static func on(eventType: ObserverEventType, callback: Callback1Argument<SimStateData>,
        options!: ?ObserverOptions = None): Unit {
        let observerOptions = options?.toCObserverOptions() ?? CObserverOptions(0)
        match (eventType) {
            case SimStateChange => onSimStateChange(observerOptions, callback)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "${eventType.toString()} is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public static func off(eventType: ObserverEventType, callback: Callback1Argument<SimStateData>): Unit {
        match (eventType) {
            case SimStateChange => offSimStateChange(callback)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "${eventType.toString()} is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public static func on(eventType: ObserverEventType, callback: Callback0Argument): Unit {
        match (eventType) {
            case IccAccountInfoChange => onIccAccountInfoChange(callback)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "${eventType.toString()} is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public static func off(eventType: ObserverEventType, callback: Callback0Argument): Unit {
        match (eventType) {
            case IccAccountInfoChange => offIccAccountInfoChange(callback)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "${eventType.toString()} is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public static func off(eventType: ObserverEventType): Unit {
        match (eventType) {
            case NetworkStateChange => offNetworkStateChange()
            case SignalInfoChange => offSignalInfoChange()
            case CallStateChange => offCallStateChange()
            case CellularDataConnectionStateChange => offCellularDataConnectionStateChange()
            case CellularDataFlowChange => offCellularDataFlowChange()
            case SimStateChange => offSimStateChange()
            case IccAccountInfoChange => offIccAccountInfoChange()
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
