/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { requireCJLib } from "libark_interop_loader.so"
import { worker, MessageEvents } from "@kit.ArkTS";


interface CJLib {
  testCJ(): number;

  testNumKey(): string;
}

function getCJNumber(): number {
  const lib = requireCJLib("libohos_app_cangjie_entry.so") as CJLib
  return lib.testCJ()
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
              console.log("wbt 1")
              const lib = requireCJLib("libohos_app_cangjie_entry.so") as CJLib
              console.log("wbt 2")
              const result = await doSth1Async()
              console.log(`wbt result = ${result}`)
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