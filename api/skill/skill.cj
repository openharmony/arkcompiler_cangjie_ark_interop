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

protected package ohos.skill

import ohos.labels.*

/**
* Obtains configuration information about an skill
*
* @relation export interface Skill
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class Skill {
    /**
    * Indicates the actions of the skill
    *
    * @relation readonly actions: Array<string>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let actions: Array<String>
    /**
    * Indicates the entities of the skill
    *
    * @relation readonly entities: Array<string>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let entities: Array<String>
    /**
    * Indicates the uris of the skill
    *
    * @relation readonly uris: Array<SkillUri>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let uris: Array<SkillUri>
    /**
    * Indicates the domainVerify of the skill
    *
    * @relation readonly domainVerify: boolean
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let domainVerify: Bool

    init(ret: RetSkill) {
        this.actions = readArrStr(ret.actions)
        this.entities = readArrStr(ret.entities)
        this.uris = readArrSkillUri(ret.uris)
        this.domainVerify = ret.domainVerify
    }
}

/**
* Obtains configuration information about an skillUri
*
* @relation export interface SkillUri
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class SkillUri {
    /**
    * Indicates the scheme of the skillUri
    *
    * @relation readonly scheme: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let scheme: String
    /**
    * Indicates the host of the skillUri
    *
    * @relation readonly host: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let host: String
    /**
    * Indicates the port of the skillUri
    *
    * @relation readonly port: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let port: String
    /**
    * Indicates the path of the skillUri
    *
    * @relation readonly path: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let path: String
    /**
    * Indicates the pathStartWith of the skillUri
    *
    * @relation readonly pathStartWith: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let pathStartWith: String
    /**
    * Indicates the pathRegex of the skillUri
    *
    * @relation readonly pathRegex: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let pathRegex: String
    /**
    * Indicates the type of the skillUri
    *
    * @relation readonly type: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let uriType: String
    /**
    * Indicates the utd of the skillUri
    *
    * @relation readonly utd: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let utd: String
    /**
    * Indicates the maxFileSupported of the skillUri
    *
    * @relation readonly maxFileSupported: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let maxFileSupported: Int32
    /**
    * Indicates the linkFeature of the skillUri
    *
    * @relation readonly linkFeature: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let linkFeature: String

    init(ret: RetSkillUri) {
        this.scheme = ret.scheme.toString()
        this.host = ret.host.toString()
        this.port = ret.port.toString()
        this.path = ret.path.toString()
        this.pathStartWith = ret.pathStartWith.toString()
        this.pathRegex = ret.pathRegex.toString()
        this.uriType = ret.uriType.toString()
        this.utd = ret.utd.toString()
        this.maxFileSupported = ret.maxFileSupported
        this.linkFeature = ret.linkFeature.toString()
    }
}