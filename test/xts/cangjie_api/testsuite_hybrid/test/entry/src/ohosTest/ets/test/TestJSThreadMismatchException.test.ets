

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { testJSThreadMismatchException00 } from 'libohos_app_cangjie_entry.so';

export default function TestJSThreadMismatchException() {
  describe('TestJSThreadMismatchException', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    /* 
    * @tc.number    : Sub_Cangjie_arkts_interop_TestJSThreadMismatchException_0100
    * @tc.name      : test00
    * @tc.desc      : This function tests that calling a JS function from a different JS context throws a thread mismatch exception.
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('test00', 0, () => {
      testJSThreadMismatchException00(() => {
      });
    })
  })
}