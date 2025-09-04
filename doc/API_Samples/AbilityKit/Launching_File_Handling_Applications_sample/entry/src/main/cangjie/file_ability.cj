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

/**
 * Created on 2025/8/18
 */
package ohos_app_cangjie_entry

import kit.AbilityKit.{UIAbility, Want, LaunchParam}
import kit.CoreFileKit.{FileIo, OpenMode}
import ohos.business_exception.BusinessException
import kit.PerformanceAnalysisKit.Hilog

class FileAbility <: UIAbility {

    public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
        // 从want信息中获取uri字段
        let uri = want.uri
        if (uri == "") {
            Hilog.error(0, "CangjieSample",'uri is invalid')
            return
        }
        Hilog.info(0, "CangjieSample","uri is ${uri}")
        try {
            // 根据待打开文件的URI进行相应操作。例如同步读写的方式打开URI获取file对象
            let file = FileIo.open(uri, mode: OpenMode
                .READ_WRITE)
            Hilog.info(0, "CangjieSample","Succeed to open file.")
        } catch (e: BusinessException) {
            Hilog.error(0, "CangjieSample","Failed to open file openSync, code: ${e.code}, message: ${e.message}")
        }
    }
}
