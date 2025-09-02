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
import { CustomLib, Node } from "libark_interop_api.so"
import { requireCJLib } from "libark_interop_loader.so"
import { JSON } from '@kit.ArkTS';

export default function TestBinaryTree() {
  describe('TestBinaryTree', () => {
    const lib: CustomLib = requireCJLib("libohos_app_cangjie_entry.so") as CustomLib;
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    it('simpleTreeConstruction', 0, () => {
      const root = new lib.Node('root', undefined, undefined);
      expect(root.name).assertEqual('root');
      expect(JSON.stringify(root.childNodeNameList)).assertEqual('["root"]');
      expect(root.childCount).assertEqual(1);
      expect(root.hasLeftChild).assertFalse();
      expect(root.hasRightChild).assertFalse();
      expect(root.hasAnyDescendants).assertFalse();
      const a = new lib.Node('a', undefined, undefined);
      const b = new lib.Node('b', undefined, undefined);
      const c = new lib.Node('c', a, b);
      const d = new lib.Node('d', undefined, undefined);
      root.leftChild = c;
      root.rightChild = d;
      expect(root.hasLeftChild).assertTrue();
      expect(root.hasRightChild).assertTrue();
      expect(root.childCount).assertEqual(5);
      expect(root.hasAnyDescendants).assertTrue();
      expect(JSON.stringify(root.childNodeNameList)).assertEqual('["root","c","a","b","d"]');
      const map = new Map<string, Node>();
      root.toMap(map);
      expect(map.size).assertEqual(5);
      const arr = new Array<string>();
      for (let e of map.keys()) {
        arr.push(e);
      }
      expect(JSON.stringify(arr)).assertEqual('["root","c","a","b","d"]');
    })
  })
}