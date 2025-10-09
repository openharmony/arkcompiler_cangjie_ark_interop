

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { testString00 } from 'libohos_app_cangjie_entry.so';

export default function TestString00() {
  describe('TestString00', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    /* 
    * @tc.number    : Sub_Cangjie_arkts_interop_TestString00_0100
    * @tc.name      : test00
    * @tc.desc      : Tests that the input string is correctly processed and matches "123%Efdasdf".
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('test00', 0, () => {
      let s = '123%Efdasdf'
      testString00(s);
    })
  })
}