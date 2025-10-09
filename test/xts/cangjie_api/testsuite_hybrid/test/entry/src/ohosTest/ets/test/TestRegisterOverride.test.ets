

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, ExpectExtend } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { JSON } from '@kit.ArkTS';
import { testRegisterOverride00,
  testRegisterOverride01 } from 'libohos_app_cangjie_entry.so';

export default function TestRegisterOverride() {
  describe('TestRegisterOverride', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    /* 
    * @tc.number    : Sub_Cangjie_arkts_interop_TestRegisterOverride_0100
    * @tc.name      : test00
    * @tc.desc      : Checks that testRegisterOverride00 returns 3, showing function override.
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('test00', 0, () => {
      expect(testRegisterOverride00()).assertEqual(3);
    })
    /* 
    * @tc.number    : Sub_Cangjie_arkts_interop_TestRegisterOverride_0200
    * @tc.name      : test01
    * @tc.desc      : Checks that testRegisterOverride01 is 2, showing module property override.
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('test01', 0, () => {
      expect(testRegisterOverride01).assertEqual(2);
    })
  })
}