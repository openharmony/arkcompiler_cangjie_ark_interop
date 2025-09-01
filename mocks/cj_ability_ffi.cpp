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

#include "mock_stub.h"

using MockMethod = void* (*)();

extern "C" {
void* FFIAbilityContextGetBroker()
{
#define DefMethod(name) [] { return OHOSFFICallMockFunc(#name);}
    static MockMethod allMethods[] = {
        DefMethod(AbilityContextBroker::isAbilityContextExisted),
        DefMethod(AbilityContextBroker::isAbilityContextExisted),
        DefMethod(AbilityContextBroker::getSizeOfStartOptions),
        DefMethod(AbilityContextBroker::getAbilityInfo),
        DefMethod(AbilityContextBroker::getHapModuleInfo),
        DefMethod(AbilityContextBroker::getConfiguration),
        DefMethod(AbilityContextBroker::startAbility),
        DefMethod(AbilityContextBroker::startAbilityWithOption),
        DefMethod(AbilityContextBroker::startAbilityWithAccount),
        DefMethod(AbilityContextBroker::startAbilityWithAccountAndOption),
        DefMethod(AbilityContextBroker::startServiceExtensionAbility),
        DefMethod(AbilityContextBroker::startServiceExtensionAbilityWithAccount),
        DefMethod(AbilityContextBroker::stopServiceExtensionAbility),
        DefMethod(AbilityContextBroker::stopServiceExtensionAbilityWithAccount),
        DefMethod(AbilityContextBroker::terminateSelf),
        DefMethod(AbilityContextBroker::terminateSelfWithResult),
        DefMethod(AbilityContextBroker::isTerminating),
        DefMethod(AbilityContextBroker::connectAbility),
        DefMethod(AbilityContextBroker::connectAbilityWithAccount),
        DefMethod(AbilityContextBroker::disconnectAbility),
        DefMethod(AbilityContextBroker::startAbilityForResult),
        DefMethod(AbilityContextBroker::startAbilityForResultWithOption),
        DefMethod(AbilityContextBroker::startAbilityForResultWithAccount),
        DefMethod(AbilityContextBroker::startAbilityForResultWithAccountAndOption),
        DefMethod(AbilityContextBroker::requestPermissionsFromUser),
        DefMethod(AbilityContextBroker::setMissionLabel),
        DefMethod(AbilityContextBroker::setMissionIcon),
    };
#undef DefMethod
    return allMethods;
}
}

