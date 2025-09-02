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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { requireCJLib } from "libark_interop_loader.so"
import { hilog } from '@kit.PerformanceAnalysisKit';
import json from '@ohos.util.json';

interface Lib {
  test_object_00(jsObject: JSObject, jsClass: new () => JSObject): void;

  test_object_01(jsObject: JSObject01): void;

  test_object_02(jsObject: JSObject02): void;

}

class JSObject {
  constructor() {
  }

  instanceProperty0: undefined = undefined;
  instanceProperty1: null = null;
  instanceProperty2: boolean = true;
  instanceProperty3: number = 114.514;
  instanceProperty4: string = 'kiki, do you love me?';
  instanceProperty5: (a: number, b: number) => number = (a: number, b: number) => {
    return a + b;
  }

  instanceMethod0(a: number): number {
    return a + 1;
  }

  static staticMethod0(a: number): number {
    return a + 1;
  }

  static staticProperty0: undefined = undefined;
}

class JSObject01 {
}

class JSObject02 {
}

export default function TestObject() {
  describe('TestObject', () => {
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
      let jsObject = new JSObject();
      Object.defineProperty(jsObject, 'ownProperty0', {
        value: 114514,
        writable: true,
      });

      lib.test_object_00(jsObject, JSObject);
    })
    it('test01', 0, () => {
      let jsObject = new JSObject01();
      lib.test_object_01(jsObject);
      expect(json.stringify(jsObject)).assertEqual('{"someProperty":114.514}');
      expect(jsObject.hasOwnProperty('someProperty')).assertTrue();
      let d = Object.getOwnPropertyNames(jsObject);
      expect(d.toString()).assertEqual('someProperty');
      let s = Object.getOwnPropertySymbols(jsObject);
      expect(s.toString()).assertEqual('');
      let w = Object.getOwnPropertyDescriptor(jsObject, 'someProperty');
      expect(w?.value).assertEqual(114.514);
    })
    it('test02', 0, () => {
      let jsObject = new JSObject02();
      lib.test_object_02(jsObject);
      expect(json.stringify(jsObject)).assertEqual('{"someProperty":true}');
      expect(jsObject.hasOwnProperty('someProperty')).assertTrue();
      let d = Object.getOwnPropertyNames(jsObject);
      expect(d.toString()).assertEqual('someProperty');
      let s = Object.getOwnPropertySymbols(jsObject);
      expect(s.toString()).assertEqual('');
      let w = Object.getOwnPropertyDescriptor(jsObject, 'someProperty');
      expect(w?.value).assertEqual(true);
    })
  })
}