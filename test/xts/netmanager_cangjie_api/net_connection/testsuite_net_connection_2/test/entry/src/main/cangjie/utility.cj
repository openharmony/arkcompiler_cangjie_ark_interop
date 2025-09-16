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

package ohos_app_cangjie_entry

import std.sync.{Monitor}
import ohos.business_exception.{BusinessException}
import ohos.resource_manager.{ResourceManager}
import std.time.{DateTime}
import std.unittest.testmacro.*
import std.unittest.*
import std.unittest.common.*
import std.regex.*
import kit.NetworkKit.*
import ohos.hilog.Hilog

func matchAddress(addresses: Array<NetAddress>): Unit {
    let regex = Regex("\\d.+")
    @Expect(regex.matches(addresses[0].address))
    @Expect(addresses[0].family==2||addresses[0].family==1)
    @Expect(addresses[0].port >=0&&addresses[0].port<=65535)
    @Expect(regex.matches(addresses[1].address))
    @Expect(addresses[1].family==2||addresses[1].family==1)
    @Expect(addresses[1].port>=0&&addresses[1].port<=65535)

    @Expect(regex.matches(addresses[2].address))
    @Expect(addresses[2].family==2||addresses[2].family==1)
    @Expect(addresses[2].port>=0&&addresses[2].port<=65535)

    @Expect(regex.matches(addresses[3].address))
    @Expect(addresses[3].family==2||addresses[3].family==1)
    @Expect(addresses[3].port>=0&&addresses[3].port<=65535)
}
