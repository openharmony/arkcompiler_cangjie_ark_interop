

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { testPostJSTask00, testPostJSTask01 } from 'libohos_app_cangjie_entry.so';

export default function TestPostJSTask() {
  describe('TestPostJSTask', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    /* 
    * @tc.number    : Sub_Cangjie_arkts_interop_TestPostJSTask_0100
    * @tc.name      : test00
    * @tc.desc      : Tests that posting a task to the JS thread changes the thread check result.
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('test00', 0, () => {
      testPostJSTask00();
    })
    /* 
    * @tc.number    : Sub_Cangjie_arkts_interop_TestPostJSTask_0200
    * @tc.name      : test01
    * @tc.desc      : Tests posting a JS task and resolving a promise from a background thread.
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('test01', 0, async () => {
      let result = await testPostJSTask01(1, 2, (a: number, b: number) => {
        return a + b;
      });
    })
  })
}