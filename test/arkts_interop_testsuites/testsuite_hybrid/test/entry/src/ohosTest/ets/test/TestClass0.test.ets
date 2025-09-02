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

interface Lib {
  testJSClass00(student: Student_test_jsclass_00): void;

  testJSClass01(): void;

  Student_test_jsclass_00: { new(name: string, age: number, grade: number): Student_test_jsclass_00 }
}

interface Student_test_jsclass_00 {
  name: string;
  age: number;
  grade: number;
}

export default function TestClass0() {
  describe('TestClass0', () => {
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
      let student = new lib.Student_test_jsclass_00('tom', 19, 99);
      expect(student.name).assertEqual('tom');
      expect(student.age).assertEqual(19);
      expect(student.grade).assertEqual(99);
      lib.testJSClass00(student);
    })
    it('test01', 0, () => {
      lib.testJSClass01();
    })
  })
}