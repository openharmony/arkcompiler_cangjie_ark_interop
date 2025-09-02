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

export default function TestNamedParameter() {
  describe('TestNamedParameter', () => {
    const lib: CustomLib = requireCJLib("libohos_app_cangjie_entry.so") as CustomLib;
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    it('oneParamWithOneNamedParameter', 0, () => {
      const result = lib.oneParamWithOneNamedParameter(null);
      expect(result === undefined).assertTrue();
    })
    it('twoParamsWithTwoNamedParameters', 0, () => {
      const result = lib.twoParamsWithTwoNamedParameters(true, 114514);
      expect(result === undefined).assertTrue();
    })
    it('twoParamsWithOneNamedParameter', 0, () => {
      const result = lib.twoParamsWithOneNamedParameter(114.514, new ArrayBuffer(666));
      expect(result === undefined).assertTrue();
    })
  })
}