

import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

interface Message {
  kind: number;
  result?: number;
}

/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * The event handler is executed in the worker thread.
 *
 * @param e message data
 */
workerPort.onmessage = (e: MessageEvents) => {
  let message = e.data as Message;
  switch (message.kind) {
    case 1: {
      // doSth();
      break;
    }
    case 2: {
      let res: Message = {
        kind: 2,
        result: soSth1()
      }
      workerPort.postMessage(res)
    }
  }
}

interface CJLib {
  testCJ(): number;
  testNumKey(a: number, b: number, callback: (result: number)=>void): string;
}

// function doSth(): void {
//   const key = testNumKey(1, 2, (r)=> {
//     console.log(r.toString())
//   })
// }

function soSth1(): number {
  return 0
}

/**
 * Defines the event handler to be called when the worker receives a message that cannot be deserialized.
 * The event handler is executed in the worker thread.
 *
 * @param e message data
 */
workerPort.onmessageerror = (e: MessageEvents) => {
}

/**
 * Defines the event handler to be called when an exception occurs during worker execution.
 * The event handler is executed in the worker thread.
 *
 * @param e error message
 */
workerPort.onerror = (e: ErrorEvent) => {
}

