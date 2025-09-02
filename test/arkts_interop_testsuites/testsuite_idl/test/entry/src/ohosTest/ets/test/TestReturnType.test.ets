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
import { CustomLib } from "libark_interop_api.so"
import { requireCJLib } from "libark_interop_loader.so"

export default function TestReturnType() {
  describe('TestReturnType', () => {
    const lib: CustomLib = requireCJLib("libohos_app_cangjie_entry.so") as CustomLib;
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    it('returnTypeUnit_00', 0, () => {
      const result = lib.returnTypeUnit_00();
      expect(result === undefined).assertTrue();
    })
    it('returnTypeUnit_01', 0, () => {
      const result = lib.returnTypeUnit_01();
      expect(result === undefined).assertTrue();
    })
    it('returnTypeUnit_02', 0, () => {
      const result = lib.returnTypeUnit_02();
      expect(result === undefined).assertTrue();
    })
    it('returnTypeUnit_03', 0, () => {
      const result = lib.returnTypeUnit_03();
      expect(result === undefined).assertTrue();
    })
    it('returnTypeUnit_04', 0, () => {
      const result = lib.returnTypeUnit_04();
      expect(result === undefined).assertTrue();
    })
    it('returnTypeInt64_00', 0, () => {
      const result = lib.returnTypeInt64_00();
      expect(result).assertEqual(114514);
    })
    it('returnTypeUInt64_00', 0, () => {
      const result = lib.returnTypeUInt64_00();
      expect(result).assertEqual(114514);
    })
    it('returnTypeFloat64_00', 0, () => {
      const result = lib.returnTypeFloat64_00();
      expect(result).assertEqual(114.514);
    })
    it('returnTypeBool_00', 0, () => {
      const result = lib.returnTypeBool_00();
      expect(result).assertEqual(true);
    })
    it('returnTypeBool_01', 0, () => {
      const result = lib.returnTypeBool_01();
      expect(result).assertEqual(true);
    })
    it('returnTypeOption_00', 0, () => {
      const result = lib.returnTypeOption_00();
      expect(result).assertEqual(undefined);
    })
    it('returnTypeOption_01', 0, () => {
      const result = lib.returnTypeOption_01();
      expect(result).assertEqual(114514);
    })
    it('returnTypeOption_02', 0, () => {
      const result = lib.returnTypeOption_02();
      expect(result).assertEqual(undefined);
    })
    it('returnTypeArrayBuffer_00', 0, () => {
      const result = lib.returnTypeArrayBuffer_00();
      expect(result.byteLength).assertEqual(0);
    })
    it('returnTypeArrayBuffer_01', 0, () => {
      const result = lib.returnTypeArrayBuffer_01();
      expect(result.byteLength).assertEqual(4);
    })
    it('returnTypeArrayBuffer_02', 0, () => {
      const result = lib.returnTypeArrayBuffer_02();
      expect(result.byteLength).assertEqual(5);
    })
    it('returnTypeBeingFunctionType_00', 0, () => {
      const result = lib.returnTypeBeingFunctionType_00();
      expect(result() === undefined).assertTrue();
    })
    it('returnTypeBeingFunctionType_01', 0, () => {
      const result = lib.returnTypeBeingFunctionType_01();
      type FunctionType = (d: (c: (b: (a: undefined) => boolean) => number) => number) => (number | undefined);
      const f: FunctionType = (something) => {
        return undefined;
      }
      expect(result(f).byteLength).assertEqual(5);
    })
  })
}