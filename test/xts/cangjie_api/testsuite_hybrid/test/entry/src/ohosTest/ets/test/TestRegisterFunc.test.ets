

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { JSON } from '@kit.ArkTS';
import { testRegisterFunc00, testRegisterFunc01 } from 'libohos_app_cangjie_entry.so';

export default function TestRegisterFunc() {
  describe('TestRegisterFunc', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    /* 
    * @tc.number    : Sub_Cangjie_arkts_interop_TestRegisterFunc_0100
    * @tc.name      : test00
    * @tc.desc      : Returns "testRegisterFunc00".
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('test00', 0, () => {
      expect(testRegisterFunc00()).assertEqual('testRegisterFunc00');
    })
    /* 
    * @tc.number    : Sub_Cangjie_arkts_interop_TestRegisterFunc_0200
    * @tc.name      : test01
    * @tc.desc      : Returns "testRegisterFunc01".
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('test01', 0, () => {
      expect(testRegisterFunc01()).assertEqual('testRegisterFunc01');
    })
  })
}