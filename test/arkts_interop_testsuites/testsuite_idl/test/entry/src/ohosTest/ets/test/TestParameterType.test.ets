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

export default function TestParameterType() {
  describe('TestParameterType', () => {
    const lib: CustomLib = requireCJLib("libohos_app_cangjie_entry.so") as CustomLib;
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    it('complexParam_00', 0, () => {
      type F = (a: (b: (c: (d: (e: null) => boolean) => number) => number) => (number | undefined)) => ArrayBuffer;
      const f: F = (something) => {
        return new ArrayBuffer(666);
      }
      const result = lib.complexParam_00(f);
      expect(result === undefined).assertTrue();
    })
    it('complexParam_01', 0, () => {
      type F = (a: (b: (c: (d: (e: null, f: boolean) => boolean, g: number) => number, h: number) => number,
        i: ArrayBuffer) => (number | undefined), j: null) => null;
      const f: F = (something) => {
        return null;
      }
      const result = lib.complexParam_01(f);
      expect(result === undefined).assertTrue();
    })
    it('paramsOfAllKindsOfPrimitiveTypes', 0, () => {
      const result = lib.paramsOfAllKindsOfPrimitiveTypes(null, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1);
    })
  })
}