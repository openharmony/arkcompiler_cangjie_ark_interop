

import { worker, MessageEvents } from "@kit.ArkTS";
import { testCJ } from "libohos_app_cangjie_entry.so";


// function getCJNumber(): number {
//   return testCJ()
// }

interface Message {
  kind: number;
  result?: number;
}

export default function doSth1Async(): Promise<number> {
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

