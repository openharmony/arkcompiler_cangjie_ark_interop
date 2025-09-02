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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { CanFly, CustomLib, Node, NormalInterface } from "libark_interop_api.so"
import { requireCJLib } from "libark_interop_loader.so"
import { JSON } from '@kit.ArkTS';

class Bird implements CanFly {
  flies() {

  }
}

export default function TestZoo() {
  describe('TestZoo', () => {
    const lib: CustomLib = requireCJLib("libohos_app_cangjie_entry.so") as CustomLib;
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    it('simpleTreeConstruction', 0, () => {
      const bird = new Bird();
      const result = lib.cookBird(bird);
      expect(result).assertEqual('bird poop');
    })
    it('testInterface', 0, () => {
      const obj: NormalInterface = {
        mutableInstanceProperty: 114514,
        ImmutableInstanceProperty: 'love',
        abstractInstanceMemberFunctionWithoutDefaultImplementation: (a: number, b: number): number => {
          return a + b;
        },
        abstractOverloadedInstanceMemberFunction: (p0: string): void => {
        },
        abstractInstanceMemberFunctionWithDefaultImplementation: (p0: string[], p1: Map<string, string[]>): string => {
          return "abc";
        },
        abstractImmutableInstanceMemberPropertyWithDefaultImplementation: new Map(),
        abstractMutableInstanceMemberPropertyWithDefaultImplementation: new Array(),
      }
      lib.checkObjectThatImplementsNormalInterface(obj);
      expect(obj.mutableInstanceProperty).assertEqual(66666);
    })
  })
}