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
import { CustomLib } from "libark_interop_api.so"
import { requireCJLib } from "libark_interop_loader.so"

export default function TestAsyncFunction() {
  describe('TestAsyncFunction', () => {
    const lib: CustomLib = requireCJLib("libohos_app_cangjie_entry.so") as CustomLib;
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    it('returnTypeBeingPromiseOfVoid', 0, async () => {
      const result = await lib.returnTypeBeingPromiseOfVoid()
      expect(result === undefined).assertTrue();
    })
    it('returnTypeBeingPromiseOfArrayBuffer', 0, async () => {
      const result = await lib.returnTypeBeingPromiseOfArrayBuffer();
      expect(result.byteLength).assertEqual(5);
    })
    it('returnTypeBeingPromiseOfOptionalArrayBuffer', 0, async () => {
      const result = await lib.returnTypeBeingPromiseOfOptionalArrayBuffer();
      expect(result !== undefined).assertTrue();
      expect(result?.byteLength).assertEqual(5);
    })
    it('returnTypeBeingPromiseOfOptionalBool', 0, async () => {
      const result = await lib.returnTypeBeingPromiseOfOptionalBool();
      expect(result?.valueOf()).assertEqual(true);
    })
    it('returnTypeBeingPromiseOfOptionalInt64', 0, async () => {
      const result = await lib.returnTypeBeingPromiseOfOptionalInt64();
      expect(result?.valueOf()).assertEqual(114514);
    })
    it('returnTypeBeingPromiseOfFunction_00', 0, async () => {
      const result = await lib.returnTypeBeingPromiseOfFunction_00();
      expect(result() === undefined).assertTrue();
    })
    it('returnTypeBeingPromiseOfFunction_01', 0, async () => {
      const result = await lib.returnTypeBeingPromiseOfFunction_01();
      expect(result(new ArrayBuffer(114514))?.byteLength).assertEqual(114514);
    })
  })
}