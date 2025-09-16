import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { requireCJLib } from 'libark_interop_loader.so';

interface Lib {
  toggleGlobalValue(delta: number): void;

  getGlobalValue(): number;
}

export default function TestLoadCangjieSo() {
  describe('TestLoadCangjieSo', () => {
    it('test00', 0, () => {
      const lib = requireCJLib('libohos_app_cangjie_entry.so') as Lib;
      expect(lib.getGlobalValue()).assertEqual(0);
      lib.toggleGlobalValue(666);
      expect(lib.getGlobalValue()).assertEqual(666);
      let expectedValue = 666;
      for (let i = 0; i < 1000; i++) {
        const lib = requireCJLib('libohos_app_cangjie_entry.so') as Lib;
        expect(lib.getGlobalValue()).assertEqual(expectedValue);
        lib.toggleGlobalValue(1);
        expectedValue += 1;
        expect(lib.getGlobalValue()).assertEqual(expectedValue);
      }
      expect(lib.getGlobalValue()).assertEqual(1666);
    })
  })
}