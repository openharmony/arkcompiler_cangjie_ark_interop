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
import fs from '@ohos.file.fs';
import {
  basePath,
  defaultSoFileName,
  inaccessibleFileName,
  invalidFileName0,
  invalidFileName1,
  invalidFileName2,
  nonCangjieSoFileName,
  nonExistingFileName,
  relativePathRoot
} from '../../../main/ets/entryability/paths';

interface Lib {}

const lib = requireCJLib("libohos_app_cangjie_entry.so") as Lib;

export default function TestRelativePath() {
  describe('TestRelativePath', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    // 全局requireCJLib，使用相对路径
    it('test00', 0, async () => {
      let soFileExists = await fs.access(`${relativePathRoot}/${defaultSoFileName}`);
      expect(soFileExists).assertTrue();
      const lib = requireCJLib(defaultSoFileName) as Lib;
      expect(lib !== undefined).assertTrue();
    })
    it('test01', 0, async () => {
      const nonExistingFilePath = `${relativePathRoot}/${nonExistingFileName}`;
      const soFileExists = await fs.access(nonExistingFilePath);
      expect(soFileExists).assertFalse();
      const lib = requireCJLib(nonExistingFileName) as Lib;
      expect(lib === undefined).assertTrue();
    })
    // 全局requireCJLib，使用相对路径，路径空字符串
    it('test02', 0, () => {
      const lib = requireCJLib(invalidFileName0) as Lib;
      expect(lib === undefined).assertTrue();
    })
    it('test03', 0, () => {
      const lib = requireCJLib(invalidFileName1) as Lib;
      expect(lib === undefined).assertTrue();
    })
    it('test04', 0, () => {
      const lib = requireCJLib(invalidFileName2) as Lib;
      expect(lib === undefined).assertTrue();
    })
    // 相对路径存在，但无法加载
    it('test05', 0, async () => {
      let inaccessibleFilePath = `${basePath}/${inaccessibleFileName}`;
      let soFileExists = await fs.access(inaccessibleFilePath);
      expect(soFileExists).assertTrue();
      const lib = requireCJLib(inaccessibleFileName) as Lib;
      expect(lib === undefined).assertTrue();
    })
    it('test06', 0, async () => {
      let nonCangjieSoFilePath = `${relativePathRoot}/${nonCangjieSoFileName}`;
      hilog.error(0, 'WBT', nonCangjieSoFilePath);
      let soFileExists = await fs.access(nonCangjieSoFilePath);
      expect(soFileExists).assertTrue();
      const lib = requireCJLib(nonCangjieSoFileName) as Lib;
      expect(lib === undefined).assertTrue();
    })
    it('test07', 0, async () => {
      expect(lib !== undefined).assertTrue();
    })
  })
}