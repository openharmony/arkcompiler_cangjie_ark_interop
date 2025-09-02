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

export default function TestParameterNumber() {
  describe('TestParameterNumber', () => {
    const lib: CustomLib = requireCJLib("libohos_app_cangjie_entry.so") as CustomLib;
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    it('zeroParams', 0, () => {
      const result = lib.zeroParams();
      hilog.info(0, 'WBT', JSON.stringify(result));
      expect(result === undefined).assertTrue();
    })
    it('oneParam', 0, () => {
      const result = lib.oneParam(null);
      expect(result === undefined).assertTrue();
    })
    it('twoParams', 0, () => {
      const result = lib.twoParams(114514, true);
      expect(result).assertEqual(114.514);
    })
  })
}