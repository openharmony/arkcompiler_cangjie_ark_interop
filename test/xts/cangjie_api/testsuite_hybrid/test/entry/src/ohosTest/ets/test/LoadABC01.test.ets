

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { testLoadAbc00 } from 'libohos_app_cangjie_entry.so';

// interface Lib {
//   testLoadAbc00(): void;
// }

export default function LoadABC01() {
  describe('LoadABC01', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /* 
    * @tc.number    : Sub_Cangjie_arkts_interop_LoadABC01_0100
    * @tc.name      : test00
    * @tc.desc      : Tests ABC file existence and retrieves JS runtime.
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */

    it('test00', 0, () => {
      testLoadAbc00();
    })
  })
}