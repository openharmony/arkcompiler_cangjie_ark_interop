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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { requireCJLib } from "libark_interop_loader.so"

interface Lib {
  compare():void;
  substr():void;
  substrAdvanced():void;
  split():void;
  splitAdv():void;
  indexOf():void;
  lastIndexOf():void;
  countOf():void;
  replace():void;
  contains():void;
  startsWith():void;
  endsWith():void;
}

export default function TestUtf16String() {
  describe('TestUtf16String', () => {
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
      lib.compare();
    })
    it('test01', 0, () => {
      lib.substr();
    })
    it('test02', 0, () => {
      lib.substrAdvanced();
    })
    it('test03', 0, () => {
      lib.split();
    })
    it('test04', 0, () => {
      lib.splitAdv();
    })
    it('test05', 0, () => {
      lib.indexOf();
    })
    it('test06', 0, () => {
      lib.lastIndexOf();
    })
    it('test07', 0, () => {
      lib.countOf();
    })
    it('test08', 0, () => {
      lib.replace();
    })
    it('test09', 0, () => {
      lib.contains();
    })
    it('test10', 0, () => {
      lib.startsWith();
    })
    it('test11', 0, () => {
      lib.endsWith();
    })
  });
}

