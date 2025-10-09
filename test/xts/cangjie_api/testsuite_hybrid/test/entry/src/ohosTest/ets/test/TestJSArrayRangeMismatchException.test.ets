

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { testJSArrayRangeMismatchException00 } from 'libohos_app_cangjie_entry.so';

export default function TestJSArrayRangeMismatchException() {
  describe('TestJSArrayRangeMismatchException', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    /* 
    * @tc.number    : Sub_Cangjie_arkts_interop_TestJSArrayRangeMismatchException_0100
    * @tc.name      : test00
    * @tc.desc      : This function tests that accessing an out-of-bounds index in a JS array throws a "JSArrayRangeMisMatch" exception.
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('test00', 0, () => {
      testJSArrayRangeMismatchException00();
    })
  })
}