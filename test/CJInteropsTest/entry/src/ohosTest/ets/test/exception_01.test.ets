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
import {CovLib} from "./List.test"

interface Lib {
  testException00(): void;

  testException01(f: () => void): void;

  testJSThreadMismatchException00(f: () => void): void;

  testJSThreadMismatchException01(f: () => void): void;

  testJSArrayRangeMismatchException00(): void;
}

function functionThatThrows() {
  throw new Error("message of this error");
}

export default function testException01() {
  describe('TestException', () => {
    const lib = requireCJLib('libentry.so') as Lib;
    const covlib = requireCJLib('libentry.so') as CovLib;
    beforeAll(() => {
      covlib.test_setEnv();
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
      covlib.test_gcov_dump();
    })
    it('test00', 0, () => {
      try {
        lib.testException00();
        expect().assertFail();
      } catch (e) {
        hilog.error(0, 'WBT', `|${e.message.toString()}|`);
        expect(e.message.toString().startsWith('Exception: message of this exception')).assertTrue();
      }
    })
    it('test01', 0, () => {
      try {
        lib.testException01(functionThatThrows);
      } catch (e) {
        hilog.error(0, 'WBT', `|${e.message.toString()}|`);
        expect(e.message.toString()).assertContain('message of this error');
      }
    })
    it('test02', 0, () => {
      lib.testJSThreadMismatchException00(() => {
      });
    })
    it('test03', 0, () => {
      lib.testJSArrayRangeMismatchException00();
    })
    it('test04', 0, () => {
      lib.testJSThreadMismatchException01(() => {
      });
    })
  })
}