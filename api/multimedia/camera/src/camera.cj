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

package ohos.multimedia.camera

import ohos.ability.UIAbilityContext
import ohos.base.*
import ohos.ffi.*
import ohos.labels.*

/**
 * Creates a CameraManager instance.
 *
 * @param { UIAbilityContext } context - Current application context.
 * @returns { CameraManager } CameraManager instance.
 * @throws { BusinessException } 7400101 - Parameter missing or parameter type incorrect.
 * @throws { BusinessException } 7400201 - Camera service fatal error.
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public func getCameraManager(context: UIAbilityContext): CameraManager { /*cjlint-ignore !G.FUNC.02 */
    return CameraManager()
}
