

import { worker, MessageEvents } from "@kit.ArkTS";
import { testCJ } from "libohos_app_cangjie_entry.so";


interface CJLib {
  testCJ(): number;

  testNumKey(): string;
}

function getCJNumber(): number {
  return testCJ()
}

interface Message {
  kind: number;
  result?: number;
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Tabs({ index: getCJNumber() }) {
        TabContent() {
          Row() {
            Text(this.message).id('result')
            Button("test number key").onClick(async () => {
              console.log("CangjieTest 1")
              console.log("CangjieTest 2")
              const result = await doSth1Async()
              console.log(`CangjieTest result = ${result}`)
              this.message = `${result}`
            }).id('click')
          }.width("100%")
        }
      }
    }.width("100%")
  }
}

function doSth1Async(): Promise<number> {
  return new Promise(resolve => {
    const myworker = new worker.ThreadWorker("entry/ets/workers/Worker.ets");
    myworker.onmessage = (e: MessageEvents) => {
      let res = e.data as Message;
      resolve(res.result!!)
    }
    const message: Message = {
      kind: 2
    };
    myworker.postMessage(message)
  })
}
