

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Lib } from './TestExternal';
import { testExternal00,MyObject_test_external_00 } from 'libohos_app_cangjie_entry.so';

export default function TestExternal() {
  describe('TestExternal', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    /* 
    * @tc.number    : Sub_Cangjie_arkts_interop_TestExternal_0100
    * @tc.name      : test00
    * @tc.desc      : Creates a MyObject_test_external_00 instance and checks its name property, then calls testExternal00 with the object.
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('test00', 0, () => {
      let student = new MyObject_test_external_00('tom', 19, 99);
      expect(student.name).assertEqual('tom');
      testExternal00(student);
    })
  })
}