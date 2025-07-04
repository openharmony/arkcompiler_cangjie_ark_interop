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

package ohos.account.appAccount

import ohos.base.*
import ohos.ability.*
import ohos.ffi.*
import ohos.hilog.*
import std.sync.*
import std.collection.*
import ohos.labels.*

let APP_ACCOUNT_LOG = HilogChannel(0, 0xD001B00, "CJ-AppAccount")

/**
 * Provides basic information of an application account, including the account owner and name.
 *
 * @interface AppAccountInfo
 * @syscap SystemCapability.Account.AppAccount
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Account.AppAccount"
]
public class AppAccountInfo {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public AppAccountInfo(
        /**
         * The owner an application account.
         *
         * @type { String }
         * @syscap SystemCapability.Account.AppAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.AppAccount"
        ]
        public var owner: String,

        /**
         * The name an application account.
         *
         * @type { String }
         * @syscap SystemCapability.Account.AppAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.AppAccount"
        ]
        public var name: String
    ) {}

    init(data: CAppAccountInfo) {
        this.owner = data.owner.toString()
        this.name = data.name.toString()
    }
}

/**
 * Provides basic information of an auth token, including the authentication type and token value.
 *
 * @interface AuthTokenInfo
 * @syscap SystemCapability.Account.AppAccount
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Account.AppAccount"
]
public class AuthTokenInfo {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public AuthTokenInfo(
        /**
         * The authentication type.
         *
         * @type { String }
         * @syscap SystemCapability.Account.AppAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.AppAccount"
        ]
        public var authType: String,

        /**
         * The token value.
         *
         * @type { String }
         * @syscap SystemCapability.Account.AppAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.AppAccount"
        ]
        public var token: String,

        /**
         * The account to which the token belongs.
         *
         * @type { ?AppAccountInfo }
         * @syscap SystemCapability.Account.AppAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.AppAccount"
        ]
        public var account!: ?AppAccountInfo = None
    ) {}

    init(data: CAuthTokenInfo) {
        this.authType = data.authType.toString()
        this.token = data.token.toString()
        this.account = AppAccountInfo(data.account)
    }
}

/**
 * Provides basic information of an authenticator, including the authenticator owner, icon id and label id.
 *
 * @interface AuthenticatorInfo
 * @syscap SystemCapability.Account.AppAccount
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Account.AppAccount"
]
public class AuthenticatorInfo {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public AuthenticatorInfo(
        /**
         * The owner of an authenticator.
         *
         * @type { String }
         * @syscap SystemCapability.Account.AppAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.AppAccount"
        ]
        public var owner: String,

        /**
         * The icon id of an authenticator.
         *
         * @type { Int32 }
         * @syscap SystemCapability.Account.AppAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.AppAccount"
        ]
        public var iconId: Int32,

        /**
         * The label id of an authenticator.
         *
         * @type { Int32 }
         * @syscap SystemCapability.Account.AppAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.AppAccount"
        ]
        public var labelId: Int32
    ) {}

    init(data: CAuthenticatorInfo) {
        this.owner = data.owner.toString()
        this.iconId = data.iconId
        this.labelId = data.labelId
    }
}

/**
 * Provides the definition of the authentication result.
 *
 * @interface AuthResult
 * @syscap SystemCapability.Account.AppAccount
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Account.AppAccount"
]
public class AuthResult {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public AuthResult(
        /**
         * The account information.
         *
         * @type { ?AppAccountInfo }
         * @syscap SystemCapability.Account.AppAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.AppAccount"
        ]
        public var account!: ?AppAccountInfo = None,

        /**
         * The token information.
         *
         * @type { ?AuthTokenInfo }
         * @syscap SystemCapability.Account.AppAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.AppAccount"
        ]
        public var tokenInfo!: ?AuthTokenInfo = None
    ) {}

    init(data: CAuthResult) {
        this.account = AppAccountInfo(data.account)
        this.tokenInfo = AuthTokenInfo(data.tokenInfo)
    }
}

/**
 * Provides the available options for creating an account.
 *
 * @interface CreateAccountOptions
 * @syscap SystemCapability.Account.AppAccount
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Account.AppAccount"
]
public class CreateAccountOptions {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public CreateAccountOptions(

        /**
         * The custom data for creating an account,
         * which can be further modified by function setCustomData.
         *
         * @type { ?HashMap<String, String> }
         * @syscap SystemCapability.Account.AppAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.AppAccount"
        ]
        public var customData!: ?HashMap<String, String> = None
    ) {}
}

/**
 * Provides the available options for creating an account implicitly.
 *
 * @interface CreateAccountImplicitlyOptions
 * @syscap SystemCapability.Account.AppAccount
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Account.AppAccount"
]
public class CreateAccountImplicitlyOptions {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public CreateAccountImplicitlyOptions(
        /**
         * The required labels for creating an account.
         *
         * @type { ?Array<string> }
         * @syscap SystemCapability.Account.AppAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.AppAccount"
        ]
        public var requiredLabels!: ?Array<String> = None,

        /**
         * The authentication type.
         *
         * @type { ?String }
         * @syscap SystemCapability.Account.AppAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.AppAccount"
        ]
        public var authType!: ?String = None,

        /**
         * The authenticator-specific parameters.
         * The list of reserved parameter name:
         * 1. Constants.KEY_CALLER_BUNDLE_NAME;
         * The above parameters are set by the appAccount management service and can be used for identify the caller.
         *
         * @type { ?HashMap<String, ValueType> }
         * @syscap SystemCapability.Account.AppAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.AppAccount"
        ]
        public var parameters!: HashMap<String, AppAccountValueType> = HashMap<String, AppAccountValueType>()
    ) {}
}

/**
 * Provides the available options for selecting accounts.
 *
 * @interface SelectAccountsOptions
 * @syscap SystemCapability.Account.AppAccount
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Account.AppAccount"
]
public class SelectAccountsOptions {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public SelectAccountsOptions(
        /**
         * The list of accounts allowed to be selected.
         *
         * @type { ?Array<AppAccountInfo> }
         * @syscap SystemCapability.Account.AppAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.AppAccount"
        ]
        public var allowedAccounts!: ?Array<AppAccountInfo> = None,

        /**
         * The list of account owners, whose accounts allowed to be selected.
         *
         * @type { ?Array<string> }
         * @syscap SystemCapability.Account.AppAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.AppAccount"
        ]
        public var allowedOwners!: ?Array<String> = None,

        /**
         * The labels required for the selected accounts.
         *
         * @type { ?Array<string> }
         * @syscap SystemCapability.Account.AppAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.AppAccount"
        ]
        public var requiredLabels!: ?Array<String> = None
    ) {}
}

/**
 * Provides the available options for verifying credential.
 *
 * @interface VerifyCredentialOptions
 * @syscap SystemCapability.Account.AppAccount
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Account.AppAccount"
]
public class VerifyCredentialOptions {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public VerifyCredentialOptions(
        /**
         * The credential type to be verified.
         *
         * @type { ?String }
         * @syscap SystemCapability.Account.AppAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.AppAccount"
        ]
        public var credentialType!: String = "",

        /**
         * The credential to be verified.
         *
         * @type { ?String }
         * @syscap SystemCapability.Account.AppAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.AppAccount"
        ]
        public var credential!: String = "",

        /**
         * The authenticator-specific parameters.
         * The list of reserved parameter name:
         * 1. Constants.KEY_CALLER_BUNDLE_NAME;
         * The above parameters are set by the appAccount management service and can be used for identify the caller.
         *
         * @type { ?HashMap<String, ValueType> }
         * @syscap SystemCapability.Account.AppAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.AppAccount"
        ]
        public var parameters!: HashMap<String, AppAccountValueType> = HashMap<String, AppAccountValueType>()
    ) {}
}

/**
 * Provides the available options for setting properties.
 *
 * @interface SetPropertiesOptions
 * @syscap SystemCapability.Account.AppAccount
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Account.AppAccount"
]
public class SetPropertiesOptions {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public SetPropertiesOptions(
        /**
         * The properties to be set.
         *
         * @type { ?HashMap<String, ValueType> }
         * @syscap SystemCapability.Account.AppAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.AppAccount"
        ]
        public var properties!: HashMap<String, AppAccountValueType> = HashMap<String, AppAccountValueType>(),

        /**
         * The authenticator-specific parameters.
         * The list of reserved parameter name:
         * 1. Constants.KEY_CALLER_BUNDLE_NAME;
         * The above parameters are set by the appAccount management service and can be used for identify the caller.
         *
         * @type { ?HashMap<String, ValueType> }
         * @syscap SystemCapability.Account.AppAccount
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.AppAccount"
        ]
        public var parameters!: HashMap<String, AppAccountValueType> = HashMap<String, AppAccountValueType>()
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Account.AppAccount"
]
public enum Constants {
    /**
     * Indicates the action for creating account implicitly.
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    ACTION_CREATE_ACCOUNT_IMPLICITLY
    |

        /**
         * Indicates the action for authenticating.
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    ACTION_AUTH
    |

        /**
         * Indicates the action for verifying credential.
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    ACTION_VERIFY_CREDENTIAL
    |

        /**
         * Indicates the action for set authenticator properties.
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    ACTION_SET_AUTHENTICATOR_PROPERTIES
    |

        /**
         * Indicates the key of name.
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    KEY_NAME
    |

        /**
         * Indicates the key of owner.
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    KEY_OWNER
    |

        /**
         * Indicates the key of token.
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    KEY_TOKEN
    |

        /**
         * Indicates the key of action.
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    KEY_ACTION
    |

        /**
         * Indicates the key of authentication type.
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    KEY_AUTH_TYPE
    |

        /**
         * Indicates the key of session id.
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    KEY_SESSION_ID
    |

        /**
         * Indicates the key of caller pid.
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    KEY_CALLER_PID
    |

        /**
         * Indicates the key of caller uid.
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    KEY_CALLER_UID
    |

        /**
         * Indicates the key of caller bundle name.
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    KEY_CALLER_BUNDLE_NAME
    |

        /**
         * Indicates the key of required labels.
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    KEY_REQUIRED_LABELS
    |

        /**
         * Indicates the key of boolean result.
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    KEY_BOOLEAN_RESULT
    | ...

    prop value: String {
        get() {
            match (this) {
                case ACTION_CREATE_ACCOUNT_IMPLICITLY => 'createAccountImplicitly'
                case ACTION_AUTH => 'auth'
                case ACTION_VERIFY_CREDENTIAL => 'verifyCredential'
                case ACTION_SET_AUTHENTICATOR_PROPERTIES => 'setAuthenticatorProperties'
                case KEY_NAME => 'name'
                case KEY_OWNER => 'owner'
                case KEY_TOKEN => 'token'
                case KEY_ACTION => 'action'
                case KEY_AUTH_TYPE => 'authType'
                case KEY_SESSION_ID => 'sessionId'
                case KEY_CALLER_PID => 'callerPid'
                case KEY_CALLER_UID => 'callerUid'
                case KEY_CALLER_BUNDLE_NAME => 'callerBundleName'
                case KEY_REQUIRED_LABELS => 'requiredLabels'
                case KEY_BOOLEAN_RESULT => 'booleanResult'
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}

struct AuthCallbackId {
    let onResultId_: Int64
    let onRequestRedirectedId_: Int64
    let onRequestContinuedId_: Int64

    init(onResultId: Int64, onRequestRedirectedId: Int64, onRequestContinuedId: Int64) {
        this.onResultId_ = onResultId
        this.onRequestRedirectedId_ = onRequestRedirectedId
        this.onRequestContinuedId_ = onRequestContinuedId
    }

    init(data: CAuthCallbackId) {
        this.onResultId_ = data.onResultId_
        this.onRequestRedirectedId_ = data.onRequestRedirectedId_
        this.onRequestContinuedId_ = data.onRequestContinuedId_
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Account.AppAccount"
]
public class AuthCallback {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public AuthCallback(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.AppAccount"
        ]
        public let onResult: (code: Int32, result: ?AuthResult) -> Unit,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.AppAccount"
        ]
        public let onRequestRedirected: (request: Want) -> Unit,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Account.AppAccount"
        ]
        public let onRequestContinued!: Option<() -> Unit>
    ) {}
}

func authCallbackImpl(ac: AuthCallback): AuthCallbackId {
    let onResultWrapper = {
        cCode: Int32, cResult: CAuthResult => if (cResult.flag) {
            ac.onResult(cCode, AuthResult(cResult))
        } else {
            ac.onResult(cCode, AuthResult())
        }
    }
    let onResultLambdaData = Callback2Param<Int32, CAuthResult, Unit>(onResultWrapper)

    let onRequestRedirectedWrapper = {
        cRequest: WantHandle =>
        let want = Want(cRequest)
        ac.onRequestRedirected(want)
    }
    let onRequestRedirectedLambdaData = Callback1Param<WantHandle, Unit>(onRequestRedirectedWrapper)

    var onRequestContinuedLambdaDataId = -1
    match (ac.onRequestContinued) {
        case Some(v) => onRequestContinuedLambdaDataId = Callback0Param<Unit>(v).getID()
        case None => onRequestContinuedLambdaDataId = -1
    }

    AuthCallbackId(onResultLambdaData.getID(), onRequestRedirectedLambdaData.getID(), onRequestContinuedLambdaDataId)
}

class RequestEvent {
    let callbackList: ArrayList<(Callback1Argument<Array<AppAccountInfo>>, Int64)>
    let callBackMutex: Mutex

    init() {
        callbackList = ArrayList<(Callback1Argument<Array<AppAccountInfo>>, Int64)>()
        callBackMutex = Mutex()
    }

    func off(target: Callback1Argument<Array<AppAccountInfo>>): Unit {
        synchronized(callBackMutex) {
            callbackList.removeIf({callback => refEq(callback[0], target)})
        }
    }

    func on(callback: Callback1Argument<Array<AppAccountInfo>>, id: Int64): Unit {
        synchronized(callBackMutex) {
            callbackList.add((callback, id))
        }
    }

    func clear(): Unit {
        synchronized(callBackMutex) {
            callbackList.clear()
        }
    }

    func contains(target: Callback1Argument<Array<AppAccountInfo>>): Bool {
        synchronized(callBackMutex) {
            for (callback in callbackList) {
                if (refEq(callback[0], target)) {
                    return true
                }
            }
        }
        false
    }

    func getId(target: Callback1Argument<Array<AppAccountInfo>>): Option<Int64> {
        synchronized(callBackMutex) {
            for (callback in callbackList) {
                if (refEq(callback[0], target)) {
                    return callback[1]
                }
            }
        }
        None
    }
}

class EventManage {
    let eventMap: HashMap<String, RequestEvent>
    let mutex: Mutex

    init() {
        eventMap = HashMap<String, RequestEvent>()
        mutex = Mutex()
    }

    func getOrCreate(eventName: String): RequestEvent {
        synchronized(mutex) {
            if (let Some(v) <- eventMap.get(eventName)) {
                return v
            }
            let event = RequestEvent()
            eventMap.add(eventName, event)
            event
        }
    }

    func remove(eventName: String) {
        synchronized(mutex) {
            eventMap.remove(eventName)
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Account.AppAccount"
]
public enum OnOffType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    ACCOUNTCHANGE | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func toString(): String {
        match (this) {
            case ACCOUNTCHANGE => "accountChange"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Account.AppAccount"
]
public class AppAccountManager <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    private let eventMng_: EventManage = EventManage()

    /**
     * Creates the account name and extra information of this application to the account management service.
     * <p>
     * Only the owner of the application account has the permission to call this method.
     *
     * @param { String } name - Indicates the name of the application account to add.
     * @param { CreateAccountOptions } [options] - Indicates the extra information of the application account to add.
     *        The extra information cannot be sensitive information of the application account.
     * @returns { Unit } used to return the result.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @throws { BusinessException } 12300002 - Invalid name or options.
     * @throws { BusinessException } 12300004 - Account already exists.
     * @throws { BusinessException } 12300007 - The number of accounts reaches the upper limit.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func createAccount(name: String, options!: ?CreateAccountOptions = None): Unit {
        unsafe {
            try (cName = LibC.mallocCString(name).asResource(), cOptions = match (options) {
                case Some(v) => CCreateAccountOptions(v)
                case None => CCreateAccountOptions()
            }.asResource()) {
                let ret = FfiAppAccountAppAccountManagerCreateAccount(getID(), cName.value, cOptions.value)
                if (ret != SUCCESS_CODE) {
                    throw BusinessException(ret, getErrorMsg(ret))
                }
            }
        }
    }

    /**
     * Removes an application account from the account management service.
     * <p>
     * Only the owner of the application account has the permission to call this method.
     *
     * @param { String } name - Indicates the name of the application account to delete.
     * @returns { Unit } used to return the result.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @throws { BusinessException } 12300002 - Invalid name.
     * @throws { BusinessException } 12300003 - Account not found.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func removeAccount(name: String): Unit {
        try (cName = unsafe { LibC.mallocCString(name).asResource() }) {
            let ret = unsafe { FfiAppAccountAppAccountManagerRemoveAccount(getID(), cName.value) }
            if (ret != SUCCESS_CODE) {
                throw BusinessException(ret, getErrorMsg(ret))
            }
        }
    }

    /**
     * Sets a third-party application with the specified bundle name to access the given application
     * account for data query and listening.
     *
     * @param { String } name - Indicates the name of the application account.
     * @param { String } bundleName - Indicates the bundle name of the third-party application.
     * @param { Bool } isAccessible - Indicates the accessibility flag, true for accessible, false for inaccessible.
     * @returns { Unit } used to return the result.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @throws { BusinessException } 12300002 - Invalid name or bundleName.
     * @throws { BusinessException } 12300003 - Account not found.
     * @throws { BusinessException } 12400001 - Application not found.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func setAppAccess(name: String, bundleName: String, isAccessible: Bool): Unit {
        try (
            cName = unsafe { LibC.mallocCString(name).asResource() },
            cBundleName = unsafe {LibC.mallocCString(bundleName).asResource()}
        ) {
            let ret = unsafe {
                FfiAppAccountAppAccountManagerSetAppAccess(getID(), cName.value, cBundleName.value, isAccessible)
            }
            if (ret != SUCCESS_CODE) {
                throw BusinessException(ret, getErrorMsg(ret))
            }
        }
    }

    /**
     * Checks whether a third-party application with the specified bundle name is allowed to access
     * the given application account for data query and listening.
     *
     * @param { string } name - Indicates the name of the application account.
     * @param { string } bundleName - Indicates the bundle name of the third-party application.
     * @returns { Bool } used to return the result.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @throws { BusinessException } 12300002 - Invalid name or bundleName.
     * @throws { BusinessException } 12300003 - Account not found.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func checkAppAccess(name: String, bundleName: String): Bool {
        var result = false
        unsafe {
            try (
                cName = LibC.mallocCString(name).asResource(),
                cBundleName = LibC.mallocCString(bundleName).asResource()
            ) {
                let ret = FfiAppAccountAppAccountManagerCheckAppAccess(getID(), cName.value, cBundleName.value)
                if (ret.code != SUCCESS_CODE) {
                    throw BusinessException(ret.code, getErrorMsg(ret.code))
                }
                result = ret.data
            }
        }
        result
    }

    /**
     * Checks whether application data synchronization is enabled for the specified account.
     * <p>
     * If the same OHOS account has logged in to multiple devices, these devices constitute a super device
     * through the distributed networking. On the connected devices, you can call this method to check
     * whether application data can be synchronized.
     * <p>
     *
     * @permission ohos.permission.DISTRIBUTED_DATASYNC
     * @param { String } name - Indicates the name of the application account.
     * @returns { Bool } used to return the result.
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @throws { BusinessException } 12300002 - Invalid name.
     * @throws { BusinessException } 12300003 - Account not found.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        permission: "ohos.permission.DISTRIBUTED_DATASYNC",
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func checkDataSyncEnabled(name: String): Bool {
        unsafe {
            let cName = LibC.mallocCString(name)
            let ret = FfiAppAccountAppAccountManagerCheckDataSyncEnabled(getID(), cName)
            cName.free()
            if (ret.code != SUCCESS_CODE) {
                throw BusinessException(ret.code, getErrorMsg(ret.code))
            }
            return ret.data
        }
    }

    /**
     * Sets the credential for this application account.
     *
     * @param { String } name - Indicates the name of the application account.
     * @param { String } credentialType - Indicates the type of the credential to set.
     * @param { String } credential - Indicates the credential to set.
     * @returns { Unit } used to return the result.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @throws { BusinessException } 12300002 - Invalid name, credentialType or credential.
     * @throws { BusinessException } 12300003 - Account not found.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func setCredential(name: String, credentialType: String, credential: String): Unit {
        unsafe {
            try (
                cName = LibC.mallocCString(name).asResource(),
                cCredentialType = LibC.mallocCString(credentialType).asResource(),
                cCredential = LibC.mallocCString(credential).asResource()
            ) {
                let ret = FfiAppAccountAppAccountManagerSetCredential(getID(), cName.value, cCredentialType.value,
                    cCredential.value)
                if (ret != SUCCESS_CODE) {
                    throw BusinessException(ret, getErrorMsg(ret))
                }
            }
        }
    }

    /**
     * Sets whether a specified application account enables application data synchronization.
     * <p>
     * If the same OHOS account has logged in to multiple devices, these devices constitute a super device
     * through the distributed networking. On the connected devices, you can call this method to set whether to
     * enable cross-device data synchronization. If synchronization is enabled, application data can be synchronized
     * among these devices in the event of any changes related to the application account.
     * If synchronization is not enabled, the application data is stored only on the local device.
     * <p>
     * <b>Application account-related changes</b>: adding or deleting an application account, setting extra
     * information (such as updating a token), and setting data associated with this application account
     * <p>
     * <b>Application data that can be synchronized</b>: application account name, token,
     * and data associated with this application account
     * <p>
     *
     * @permission ohos.permission.DISTRIBUTED_DATASYNC
     * @param { String } name - Indicates the name of the application account.
     * @param { Bool } isEnabled - Specifies whether to enable application data synchronization.
     * @returns { Unit } used to return the result.
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @throws { BusinessException } 12300002 - Invalid name.
     * @throws { BusinessException } 12300003 - Account not found.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        permission: "ohos.permission.DISTRIBUTED_DATASYNC",
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func setDataSyncEnabled(name: String, isEnabled: Bool): Unit {
        unsafe {
            try (cName = LibC.mallocCString(name).asResource()) {
                let ret = FfiAppAccountAppAccountManagerSetDataSyncEnabled(getID(), cName.value, isEnabled)
                if (ret != SUCCESS_CODE) {
                    throw BusinessException(ret, getErrorMsg(ret))
                }
            }
        }
    }

    /**
     * Sets data associated with this application account.
     *
     * @param { String } name - Indicates the name of the application account.
     * @param { String } key - Indicates the key of the data to set. The key can be customized.
     * @param { String } value - Indicates the value of the data to set.
     * @returns { Unit } used to return the result.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @throws { BusinessException } 12300002 - Invalid name, key or value.
     * @throws { BusinessException } 12300003 - Account not found.
     * @throws { BusinessException } 12400003 - The number of custom data reaches the upper limit.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func setCustomData(name: String, key: String, value: String): Unit {
        unsafe {
            try (cName = LibC.mallocCString(name).asResource(), cKey = LibC.mallocCString(key).asResource(), cValue = LibC
                .mallocCString(value).asResource()) {
                let ret = FfiAppAccountAppAccountManagerSetCustomData(getID(), cName.value, cKey.value, cValue.value)
                if (ret != SUCCESS_CODE) {
                    throw BusinessException(ret, getErrorMsg(ret))
                }
            }
        }
    }

    /**
     * Obtains information about all accessible accounts.
     * This method applies to the following accounts:
     * <br> Accounts of this application.
     * <br> Accounts of third-party applications. To obtain such information,
     * <br> your application must have gained authorization from the third-party applications or
     * <br> have gained the ohos.permission.GET_ALL_APP_ACCOUNTS permission.
     *
     * @returns { Array<AppAccountInfo> } Returns a list of application accounts.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func getAllAccounts(): Array<AppAccountInfo> {
        unsafe {
            let ret = FfiAppAccountAppAccountManagerGetAllAccounts(getID())
            if (ret.err != SUCCESS_CODE) {
                throw BusinessException(ret.err, getErrorMsg(ret.err))
            }
            try {
                ret.cArrAppAccountInfoPtr.toArray()
            } finally {
                ret.free()
            }
        }
    }

    /**
     * Gets information about all accounts of a specified account owner.
     * This method applies to the following accounts:
     * <br> Accounts of this application.
     * <br> Accounts of third-party applications. To obtain such information,
     * <br> your application must have gained authorization from the third-party applications or
     * <br> have gained the ohos.permission.GET_ALL_APP_ACCOUNTS permission.
     *
     * @param { String } owner - Indicates the account owner of your application or third-party applications.
     * @returns { Array<AppAccountInfo> } Returns a list of application accounts.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @throws { BusinessException } 12300002 - Invalid owner.
     * @throws { BusinessException } 12400001 - Application not found.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func getAccountsByOwner(owner: String): Array<AppAccountInfo> {
        unsafe {
            let cOwner = LibC.mallocCString(owner)
            let ret = FfiAppAccountAppAccountManagerGetAccountsByOwner(getID(), cOwner)
            cOwner.free()
            if (ret.err != SUCCESS_CODE) {
                throw BusinessException(ret.err, getErrorMsg(ret.err))
            }
            try {
                ret.cArrAppAccountInfoPtr.toArray()
            } finally {
                ret.free()
            }
        }
    }

    /**
     * Obtains the credential of this application account.
     *
     * @param { String } name - Indicates the name of the application account.
     * @param { String } credentialType - Indicates the type of the credential to obtain.
     * @returns { String } Returns the credential of the application account.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @throws { BusinessException } 12300002 - Invalid name or credentialType.
     * @throws { BusinessException } 12300003 - Account not found.
     * @throws { BusinessException } 12300102 - Credential not found.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func getCredential(name: String, credentialType: String): String {
        var result = ""
        unsafe {
            try (
                cName = LibC.mallocCString(name).asResource(),
                cCredentialType = LibC.mallocCString(credentialType).asResource()
            ) {
                let ret = FfiAppAccountAppAccountManagerGetCredential(getID(), cName.value, cCredentialType.value)
                if (ret.code != SUCCESS_CODE) {
                    throw BusinessException(ret.code, getErrorMsg(ret.code))
                }
                result = ret.data.toString()
                ret.free()
            }
        }
        result
    }

    /**
     * Obtains data associated with the specified account synchronously.
     *
     * @param { String } name - Indicates the name of the application account.
     * @param { String } key - Indicates the key of the data to obtain.
     * @returns { String } Returns the associated data of the application account.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @throws { BusinessException } 12300002 - Invalid name or key.
     * @throws { BusinessException } 12300003 - Account not found.
     * @throws { BusinessException } 12400002 - Custom data not found.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func getCustomData(name: String, key: String): String {
        var result = ""
        unsafe {
            try (
                cName = LibC.mallocCString(name).asResource(),
                cKey = LibC.mallocCString(key).asResource()
            ) {
                let ret = FfiAppAccountAppAccountManagerGetCustomData(getID(), cName.value, cKey.value)
                if (ret.code != SUCCESS_CODE) {
                    throw BusinessException(ret.code, getErrorMsg(ret.code))
                }
                result = ret.data.toString()
                ret.free()
            }
            return result
        }
    }

    /**
     * Subscribes to the change events of accounts of the specified owners.
     * <p>
     * When the account owner updates the account, the subscriber will receive a notification
     * about the account change event.
     *
     * @param { 'accountChange' } type - Event type.
     * @param { Array<String> } owners - Indicates the account owners, which are specified
     *        by {@link AppAccount#AppAccount(String name, String owner)}.
     * @param { Callback<Array<AppAccountInfo>> } callback - Asynchronous callback interface.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @throws { BusinessException } 12300002 - Invalid type or owners.
     * @throws { BusinessException } 12400001 - Application not found.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func on(`type`: OnOffType, owners: Array<String>, callback: Callback1Argument<Array<AppAccountInfo>>): Unit {
        let ty = `type`.toString()
        if (ty != "accountChange") {
            throw BusinessException(INVALID_PARAMETER, getErrorMsg(INVALID_PARAMETER))
        }

        APP_ACCOUNT_LOG.info("onChange start register")
        if (eventMng_.getOrCreate(ty).contains(callback)) {
            return
        }
        let wrapper = {
            info: CArrAppAccountInfo =>
            callback.invoke(info.toArray())
            info.free()
        }
        unsafe {
            let registerCall = Callback1Param<CArrAppAccountInfo, Unit>(wrapper)
            try (
                cTy = LibC.mallocCString(ty).asResource(),
                cArrStr = toArrayCString(owners).asResource()
            ) {
                let ret = FfiAppAccountAppAccountManagerOn(getID(), cTy.value, cArrStr.value, registerCall.getID())
                if (ret != SUCCESS_CODE) {
                    throw BusinessException(ret, getErrorMsg(ret))
                }
            }
            eventMng_.getOrCreate(ty).on(callback, registerCall.getID())
        }
        APP_ACCOUNT_LOG.info("onChange register success")
    }

    /**
     * Unsubscribes from account events.
     *
     * @param { 'accountChange' } type - Event type.
     * @param { Callback<Array<AppAccountInfo>> } [callback] - Asynchronous callback interface.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @throws { BusinessException } 12300002 - Invalid type.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func off(`type`: OnOffType, callback!: ?Callback1Argument<Array<AppAccountInfo>> = None): Unit {
        let ty = `type`.toString()
        if (ty != "accountChange") {
            throw BusinessException(INVALID_PARAMETER, getErrorMsg(INVALID_PARAMETER))
        }

        let id: Int64 = match (callback) {
            case Some(v) =>
                if (let Some(v) <- eventMng_.getOrCreate(ty).getId(v)) {
                    v
                } else {
                    return
                }
            case None => 0 // 0 is off all
        }

        unsafe {
            try (cTy = LibC.mallocCString(ty).asResource()) {
                let ret = FfiAppAccountAppAccountManagerOff(getID(), cTy.value, id)
                if (ret != SUCCESS_CODE) {
                    throw BusinessException(ret, getErrorMsg(ret))
                }
            }
        }

        if (let Some(v) <- callback) {
            eventMng_.getOrCreate(ty).off(v)
        } else {
            eventMng_.remove(ty)
        }
    }

    /**
     * Gets an auth token with the specified authentication type from a particular application account.
     *
     * @param { String } name - Indicates the account name of your application or third-party applications.
     * @param { String } owner - Indicates the account owner of your application or third-party applications.
     * @param { String } authType - Indicates the authentication type.
     * @returns { String } Returns an auth token.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @throws { BusinessException } 12300002 - Invalid name, owner or authType.
     * @throws { BusinessException } 12300003 - Account not found.
     * @throws { BusinessException } 12300107 - AuthType not found.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func getAuthToken(name: String, owner: String, authType: String): String {
        var result = ""
        unsafe {
            try (
                cName = LibC.mallocCString(name).asResource(),
                cOwner = LibC.mallocCString(owner).asResource(),
                cAuthType = LibC.mallocCString(authType).asResource()
            ) {
                let ret = FfiAppAccountAppAccountManagerGetAuthToken(
                    getID(),
                    cName.value,
                    cOwner.value,
                    cAuthType.value
                )
                if (ret.code != SUCCESS_CODE) {
                    throw BusinessException(ret.code, getErrorMsg(ret.code))
                }
                result = ret.data.toString()
                ret.free()
            }
        }
        result
    }

    /**
     * Sets an auth token with the specified authentication type for a particular account.
     * <p>
     * Only the owner of the application account has the permission to call this method.
     *
     * @param { String } name - Indicates the account name of your application.
     * @param { String } authType - Indicates the authentication type.
     * @param { String } token - Indicates the auth token.
     * @returns { Unit } used to return the result.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @throws { BusinessException } 12300002 - Invalid name, authType or token.
     * @throws { BusinessException } 12300003 - Account not found.
     * @throws { BusinessException } 12400004 - The number of tokens reaches the upper limit.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func setAuthToken(name: String, authType: String, token: String): Unit {
        unsafe {
            try (
                cName = LibC.mallocCString(name).asResource(),
                cAuthType = LibC.mallocCString(authType).asResource(),
                cToken = LibC.mallocCString(token).asResource()
            ) {
                let ret = FfiAppAccountAppAccountManagerSetAuthToken(
                    getID(),
                    cName.value,
                    cAuthType.value,
                    cToken.value
                )
                if (ret != SUCCESS_CODE) {
                    throw BusinessException(ret, getErrorMsg(ret))
                }
            }
        }
    }

    /**
     * Deletes an auth token for the specified application account.
     * <p>
     * Only tokens visible to the caller application can be deleted.
     *
     * @param { String } name - Indicates the account name of your application or third-party applications.
     * @param { String } owner - Indicates the account owner of your application or third-party applications.
     * @param { String } authType - Indicates the authentication type.
     * @param { String } token - Indicates the auth token.
     * @returns { Unit } used to return the result.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @throws { BusinessException } 12300002 - Invalid name, owner, authType or token.
     * @throws { BusinessException } 12300003 - Account not found.
     * @throws { BusinessException } 12300107 - AuthType not found.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func deleteAuthToken(name: String, owner: String, authType: String, token: String): Unit {
        unsafe {
            try (
                cName = LibC.mallocCString(name).asResource(),
                cOwner = LibC.mallocCString(owner).asResource(),
                cAuthType = LibC.mallocCString(authType).asResource(),
                cToken = LibC.mallocCString(token).asResource()
            ) {
                let ret = FfiAppAccountAppAccountManagerDeleteAuthToken(getID(), cName.value, cOwner.value,
                    cAuthType.value, cToken.value)
                if (ret != SUCCESS_CODE) {
                    throw BusinessException(ret, getErrorMsg(ret))
                }
            }
        }
    }

    /**
     * Sets the auth token visibility of the specified authentication type to a third-party application.
     * <p>
     * Only the owner of the application account has the permission to call this method.
     *
     * @param { String } name - Indicates the account name of your application.
     * @param { String } authType - Indicates the authentication type.
     * @param { String } bundleName - Indicates the bundle name of the third-party application.
     * @param { Bool } isVisible - Indicates the bool value of visibility.
     * @returns { Unit } used to return the result.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @throws { BusinessException } 12300002 - Invalid name, authType or bundleName.
     * @throws { BusinessException } 12300003 - Account not found.
     * @throws { BusinessException } 12300107 - AuthType not found.
     * @throws { BusinessException } 12400001 - Application not found.
     * @throws { BusinessException } 12400005 - The size of authorization list reaches the upper limit.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func setAuthTokenVisibility(name: String, authType: String, bundleName: String, isVisible: Bool): Unit {
        unsafe {
            try (
                cName = LibC.mallocCString(name).asResource(),
                cAuthType = LibC.mallocCString(authType).asResource(),
                cBundleName = LibC.mallocCString(bundleName).asResource()
            ) {
                let ret = FfiAppAccountAppAccountManagerSetAuthTokenVisibility(getID(), cName.value, cAuthType.value,
                    cBundleName.value, isVisible)
                if (ret != SUCCESS_CODE) {
                    throw BusinessException(ret, getErrorMsg(ret))
                }
            }
        }
    }

    /**
     * Checks the auth token visibility of the specified authentication type for a third-party application.
     * <p>
     * Only the owner of the application account has the permission to call this method.
     *
     * @param { String } name - Indicates the account name of your application or third-party applications.
     * @param { String } authType - Indicates the authentication type.
     * @param { String } bundleName - Indicates the bundle name of the third-party application.
     * @returns { Bool } Returns the bool value of visibility.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @throws { BusinessException } 12300002 - Invalid name, authType or bundleName.
     * @throws { BusinessException } 12300003 - Account not found.
     * @throws { BusinessException } 12300107 - AuthType not found.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func checkAuthTokenVisibility(name: String, authType: String, bundleName: String): Bool {
        var result = false
        unsafe {
            try (
                cName = LibC.mallocCString(name).asResource(),
                cAuthType = LibC.mallocCString(authType).asResource(),
                cBundleName = LibC.mallocCString(bundleName).asResource()
            ) {
                let ret = FfiAppAccountAppAccountManagerCheckAuthTokenVisibility(getID(), cName.value, cAuthType.value,
                    cBundleName.value)
                if (ret.code != SUCCESS_CODE) {
                    throw BusinessException(ret.code, getErrorMsg(ret.code))
                }
                result = ret.data
            }
        }
        result
    }

    /**
     * Gets all auth tokens visible to the caller application.
     *
     * @param { String } name - Indicates the account name of your application or third-party applications.
     * @param { String } owner - Indicates the account owner of your application or third-party applications.
     * @returns { Array<AuthTokenInfo> } Returns a list of auth tokens visible to the caller application.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @throws { BusinessException } 12300002 - Invalid name or owner.
     * @throws { BusinessException } 12300003 - Account not found.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func getAllAuthTokens(name: String, owner: String): Array<AuthTokenInfo> {
        var result = Array<AuthTokenInfo>()
        unsafe {
            try (
                cName = LibC.mallocCString(name).asResource(),
                cOwner = LibC.mallocCString(owner).asResource()
            ) {
                let ret = FfiAppAccountAppAccountManagerGetAllAuthTokens(getID(), cName.value, cOwner.value)
                if (ret.err != SUCCESS_CODE) {
                    throw BusinessException(ret.err, getErrorMsg(ret.err))
                }
                result = try {
                    ret.cArrAuthTokenInfoPtr.toArray()
                } finally {
                    ret.free()
                }
            }
        }
        result
    }

    /**
     * Gets the open authorization list with a specified authentication type for a particular application account.
     * <p>
     * Only the owner of the application account has the permission to call this method.
     *
     * @param { String } name - Indicates the account name of your application.
     * @param { String } authType - Indicates the authentication type.
     * @returns { Array<String> } Returns the open authorization list of the specified authentication type.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @throws { BusinessException } 12300002 - Invalid name or authType.
     * @throws { BusinessException } 12300003 - Account not found.
     * @throws { BusinessException } 12300107 - AuthType not found.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func getAuthList(name: String, authType: String): Array<String> {
        var result = Array<String>()
        unsafe {
            try (
                cName = LibC.mallocCString(name).asResource(),
                cAuthType = LibC.mallocCString(authType).asResource()
            ) {
                let ret = FfiAppAccountAppAccountManagerGetAuthList(getID(), cName.value, cAuthType.value)
                if (ret.code != SUCCESS_CODE) {
                    throw BusinessException(ret.code, getErrorMsg(ret.code))
                }
                result = readArrStr(ret.data)
                ret.data.free()
            }
        }
        result
    }

    /**
     * Queries the authenticator information of an application account.
     *
     * @param { String } owner - Indicates the account owner of your application or third-party applications.
     * @returns { AuthenticatorInfo } Returns the authenticator information of the application account.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @throws { BusinessException } 12300002 - Invalid owner.
     * @throws { BusinessException } 12300113 - Authenticator service not found.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func queryAuthenticatorInfo(owner: String): AuthenticatorInfo {
        unsafe {
            let cOwner = LibC.mallocCString(owner)
            let ret = FfiAppAccountAppAccountManagerQueryAuthenticatorInfo(getID(), cOwner)
            cOwner.free()
            if (ret.err != SUCCESS_CODE) {
                throw BusinessException(ret.err, getErrorMsg(ret.err))
            }

            try {
                AuthenticatorInfo(ret.cAuthenticatorInfo)
            } finally {
                ret.free()
            }
        }
    }

    /**
     * Checks whether a particular account has all specified labels.
     *
     * @param { String } name - Indicates the account name.
     * @param { String } owner - Indicates the account owner.
     * @param { Array<String> } labels - Indicates an array of labels to check.
     * @param { AsyncCallback<Bool> } callback - Asynchronous callback interface.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @throws { BusinessException } 12300002 - Invalid name, owner or labels.
     * @throws { BusinessException } 12300003 - Account not found.
     * @throws { BusinessException } 12300010 - Account service busy.
     * @throws { BusinessException } 12300113 - Authenticator service not found.
     * @throws { BusinessException } 12300114 - Authenticator service exception.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func checkAccountLabels(
        name: String,
        owner: String,
        labels: Array<String>,
        callback: AsyncCallback<Bool>
    ): Unit {
        unsafe {
            let wrapper = {
                value: RetDataBool => if (value.code == 0) {
                    try {
                        let data = value.data
                        callback(None, data)
                    } catch (e: BusinessException) {
                        callback(AsyncError(OUT_MEMORY_ERR), None)
                    }
                } else {
                    callback(AsyncError(value.code), None)
                }
            }
            let lambdaData = Callback1Param<RetDataBool, Unit>(wrapper)
            try (
                cName = LibC.mallocCString(name).asResource(),
                cOwner = LibC.mallocCString(owner).asResource(),
                cLabels = toArrayCString(labels).asResource()
            ) {
                let ret = FfiAppAccountAppAccountManagerCheckAccountLabels(getID(), cName.value, cOwner.value,
                    cLabels.value, lambdaData.getID())
                if (ret != SUCCESS_CODE) {
                    throw BusinessException(ret, getErrorMsg(ret))
                }
            }
        }
    }

    /**
     * Deletes the credential of the specified application account.
     *
     * @param { String } name - Indicates the account name.
     * @param { String } credentialType - Indicates the type of the credential to delete.
     * @returns { Unit } used to return the result.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @throws { BusinessException } 12300002 - Invalid name or credentialType.
     * @throws { BusinessException } 12300003 - Account not found.
     * @throws { BusinessException } 12300102 - Credential not found.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func deleteCredential(name: String, credentialType: String): Unit {
        unsafe {
            try (
                cName = LibC.mallocCString(name).asResource(),
                cCredentialType = LibC.mallocCString(credentialType).asResource()
            ) {
                let ret = FfiAppAccountAppAccountManagerDeleteCredential(getID(), cName.value, cCredentialType.value)
                if (ret != SUCCESS_CODE) {
                    throw BusinessException(ret, getErrorMsg(ret))
                }
            }
        }
    }

    /**
     * Selects a list of accounts that satisfied with the specified options.
     *
     * @param { SelectAccountsOptions } options - Indicates the options for selecting account.
     * @param { AsyncCallback<Array<AppAccountInfo>> } callback - Asynchronous callback interface.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @throws { BusinessException } 12300002 - Invalid options.
     * @throws { BusinessException } 12300010 - Account service busy.
     * @throws { BusinessException } 12300114 - Authenticator service exception.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func selectAccountsByOptions(
        options: SelectAccountsOptions,
        callback: AsyncCallback<Array<AppAccountInfo>>
    ): Unit {
        unsafe {
            let wrapper = {
                value: ErrCArrAppAccountInfo => if (value.err == 0) {
                    try {
                        let data = value.cArrAppAccountInfoPtr.toArray()
                        callback(None, data)
                    } catch (e: BusinessException) {
                        callback(AsyncError(OUT_MEMORY_ERR), None)
                    }
                } else {
                    callback(AsyncError(value.err), None)
                }
            }
            let cOptions = CSelectAccountsOptions(options)
            let lambdaData = Callback1Param<ErrCArrAppAccountInfo, Unit>(wrapper)
            let ret = FfiAppAccountAppAccountManagerSelectAccountsByOptions(getID(), cOptions, lambdaData.getID())
            cOptions.free()
            if (ret != SUCCESS_CODE) {
                throw BusinessException(ret, getErrorMsg(ret))
            }
        }
    }

    /**
     * Verifies the credential to ensure the user is the owner of the specified account.
     *
     * @param { string } name - Indicates the account name.
     * @param { string } owner - Indicates the account owner.
     * @param { AuthCallback } callback - Indicates the authenticator callback.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @throws { BusinessException } 12300002 - Invalid name or owner.
     * @throws { BusinessException } 12300003 - Account not found.
     * @throws { BusinessException } 12300010 - Account service busy.
     * @throws { BusinessException } 12300113 - Authenticator service not found.
     * @throws { BusinessException } 12300114 - Authenticator service exception.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func verifyCredential(name: String, owner: String, callback: AuthCallback,
        options!: ?VerifyCredentialOptions = None): Unit {
        unsafe {
            try (
                cName = LibC.mallocCString(name).asResource(),
                cOwner = LibC.mallocCString(owner).asResource(),
                cVerifyCredentialOptions = match (options) {
                    case Some(v) => CVerifyCredentialOptions(v).asResource()
                    case None => CVerifyCredentialOptions().asResource()}
            ) {
                let callbackId = authCallbackImpl(callback)
                let ret = FfiAppAccountAppAccountManagerVerifyCredential(getID(), cName.value, cOwner.value,
                    CAuthCallbackId(callbackId), cVerifyCredentialOptions.value)
                if (ret != SUCCESS_CODE) {
                    throw BusinessException(ret, getErrorMsg(ret))
                }
            }
        }
    }

    /**
     * Sets properties for the specified account authenticator.
     * <p>
     * If the authenticator supports setting its properties,
     * the caller will normally be redirected to an Ability specified by Want for property setting.
     *
     * @param { String } owner - Indicates the owner of authenticator.
     * @param { SetPropertiesOptions } options - Indicates the options for setting properties.
     * @param { AuthCallback } callback - Indicates the authenticator callback.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameter types.
     * @throws { BusinessException } 12300001 - System service exception.
     * @throws { BusinessException } 12300002 - Invalid owner or options.
     * @throws { BusinessException } 12300010 - Account service busy.
     * @throws { BusinessException } 12300113 - Authenticator service not found.
     * @throws { BusinessException } 12300114 - Authenticator service exception.
     * @syscap SystemCapability.Account.AppAccount
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Account.AppAccount"
    ]
    public func setAuthenticatorProperties(owner: String, callback: AuthCallback, options!: ?SetPropertiesOptions = None): Unit {
        unsafe {
            try (
                cOwner = LibC.mallocCString(owner).asResource(),
                cSetPropertiesOptions = match (options) {
                    case Some(v) => CSetPropertiesOptions(v).asResource()
                    case None => CSetPropertiesOptions().asResource()
                }
            ) {
                let callbackId = authCallbackImpl(callback)
                let ret = FfiAppAccountAppAccountManagerSetAuthenticatorProperties(getID(), cOwner.value,
                    CAuthCallbackId(callbackId), cSetPropertiesOptions.value)
                if (ret != SUCCESS_CODE) {
                    throw BusinessException(ret, getErrorMsg(ret))
                }
            }
        }
    }
}

/**
 * Obtains the AppAccountManager instance.
 *
 * @returns { AppAccountManager } Returns the instance of the AppAccountManager.
 * @syscap SystemCapability.Account.AppAccount
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Account.AppAccount"
]
public func createAppAccountManager(): AppAccountManager {
    let ret = unsafe { FfiAppAccountCreateAppAccountManager() }
    if (ret.code != SUCCESS_CODE) {
        throw IllegalArgumentException("failed to create AppAccountManager for insufficient memory")
    }

    AppAccountManager(ret.data)
}
