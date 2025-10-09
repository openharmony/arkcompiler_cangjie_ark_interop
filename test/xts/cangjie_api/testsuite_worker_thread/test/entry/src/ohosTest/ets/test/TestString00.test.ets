

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, DataDriver } from '@ohos/hypium';

import { worker, MessageEvents } from "@kit.ArkTS";
import f from '../../../main/ets/pages/TestWorker'
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';

interface Lib {
  testString00(s: string): void;
}

interface Message {
  kind: number;
  result?: number;
}


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
    * @tc.desc      : Test whether the worker thread is successfully executed
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('test00', 0, async () => {
      let driver = Driver.create();
      await driver.delayMs(1000);
      const delegator = abilityDelegatorRegistry.getAbilityDelegator()
      await delegator.executeShellCommand('aa start -b com.example.myapplication -a EntryAbility').then(result => {
        console.info('Uitest, start ability finished:' + result)
      })
      await driver.delayMs(5000)
      const button = await driver.findComponent(ON.id('click'))
      await button.click()
      await driver.delayMs(5000)
      const resultText = await driver.findComponent(ON.id('result'))
      const result = await resultText.getText()
      expect(result).assertEqual('0')
    })
  })
}