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

package ohos.i18n

import ohos.labels.APILevel

foreign {
    func FfiI18nSystemGetAppPreferredLanguage(): CString
}

/**
 * Provides system functions.
 *
 * @relation export class System
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public class System {
    /**
     * Obtains the preferred language of an application.
     *
     * @relation static getAppPreferredLanguage(): string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public static func getAppPreferredLanguage(): String {
        let clanguage = unsafe { FfiI18nSystemGetAppPreferredLanguage() }
        try {
            let language = clanguage.toString()
            return language
        } finally {
            unsafe { LibC.free(clanguage) }
        }
    }
}
