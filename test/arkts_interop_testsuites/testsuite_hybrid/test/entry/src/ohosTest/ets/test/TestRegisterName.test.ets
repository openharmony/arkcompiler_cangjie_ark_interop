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
import { requireCJLib } from "libark_interop_loader.so"

interface Lib {
  if: number;
  var: number;
  $myName: boolean;
  _myName: number;
  my$Name: string;
  我的名字: number;
  my名字: boolean;
  myUnicode\u006ame: number;
}

export default function TestRegisterName() {
  describe('TestRegisterName', () => {
    const lib = requireCJLib('libohos_app_cangjie_entry.so') as Lib;
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    it('test00', 0, () => {
      expect(Object.keys(lib)).assertContain('');
    })
    it('test01', 0, () => {
      expect(Object.keys(lib)).assertContain('123MyName');
    })
    it('test02', 0, () => {
      expect(Object.keys(lib)).assertContain('var');
      expect(lib.if).assertEqual(114.514);
    })
    it('test03', 0, () => {
      expect(Object.keys(lib)).assertContain('if');
      expect(lib.var).assertEqual(114.514);
    })
    it('test04', 0, () => {
      expect(Object.keys(lib)).assertContain('\\b\\n\\a');
    })
    it('test05', 0, () => {
      expect(Object.keys(lib)).assertContain(' ');
    })
    it('test06', 0, () => {
      expect(Object.keys(lib)).assertContain('my name');
    })
    it('test07', 0, () => {
      expect(Object.keys(lib)).assertContain('my-name');
    })
    it('test08', 0, () => {
      expect(Object.keys(lib)).assertContain('my@name');
    })
    it('test09', 0, () => {
      expect(Object.keys(lib)).assertContain('{myName');
    })
    it('test10', 0, () => {
      expect(Object.keys(lib)).assertContain('$myName');
      expect(lib.$myName).assertEqual(true);
    })
    it('test11', 0, () => {
      expect(Object.keys(lib)).assertContain('我的名字');
      expect(lib.我的名字).assertEqual(114.514);
    })
    it('test12', 0, () => {
      expect(Object.keys(lib)).assertContain('_myName');
      expect(lib._myName).assertEqual(114.514);
    })
    it('test13', 0, () => {
      expect(Object.keys(lib)).assertContain('my$Name');
      expect(lib.my$Name).assertEqual('hello');
    })
    it('test14', 0, () => {
      expect(Object.keys(lib)).assertContain('my名字');
      expect(lib.my名字).assertEqual(false);
    })
    it('test15', 0, () => {
      expect(Object.keys(lib)).assertContain('myUnicode\\u006ame');
      expect(lib.myUnicode\u006ame).assertEqual(114.514);
    })
  })
}