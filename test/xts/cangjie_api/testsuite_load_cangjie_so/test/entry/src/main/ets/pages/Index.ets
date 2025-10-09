

import { createInteropBenchmark } from '../bench_interop';
import {
  doGC, doSync, readStrToJ, readStrToC, createStdLaint1, createStdUtf16, createNewLaint1, createNewUtf16, createString, benchGC, testString
} from "libohos_app_cangjie_entry.so";

/*import {requireCJLib} from "libark_interop_loader.so"
interface CJLib {
  doGC(): void;
  doSync(callback: ()=>void): number;
  readStrToJ(src: string): void
  readStrToC(src: string): void
  createStdLaint1(length: number): [()=>void, ()=>string, ()=>void]
  createStdUtf16(length: number): [()=>void, ()=>string, ()=>void]
  createNewLaint1(length: number): [()=>void, ()=>string, ()=>void]
  createNewUtf16(length: number): [()=>void, ()=>string, ()=>void]
  createString(encoding: number, length: number): string
  benchGC(repeat: number): void
  testString(): void
}
const cjlib = requireCJLib("libohos_app_cangjie_entry.so") as CJLib
*/

@Entry
@Component
struct Index {
  @State current: number = 0;
  @State executing: boolean = false
  benchmarkSets: string[] = []
  @State sub: number = 0.1

  @State isBenchStarted: boolean = false
  @State benchLoop: number = 0

  build() {
    Row() {
      Column() {
        Text("testString").fontSize(50).onClick(()=> {
          testString()
        })
        if (this.executing) {
          Text(`benchmarking`)
            .fontSize(40).fontWeight(FontWeight.Bold)
          Text(`${this.current}/${this.benchmarkSets.length} | ${(this.sub * 100).toFixed(0)}%`)
            .fontSize(40).fontWeight(FontWeight.Bold)
          Text(`${this.benchmarkSets[this.current]}`).fontSize(30)
        } else {
          Text("start benchmark")
            .fontSize(40).fontWeight(FontWeight.Bold)
            .onClick(async ()=> {
              if (this.executing) {
                return;
              }
              this.executing = true
              const framework = createInteropBenchmark()
              this.benchmarkSets = framework.getCatalog()
              await framework.execute((cur, sub)=> {
                this.sub = sub
                this.current = cur[0];
              })
              this.executing = false
            })
        }

      }.width("100%")
    }.height("100%")
  }

  async benchGC() {
    while (true) {
      this.benchLoop++;
      benchGC(500000)
      doGC()
      await sleep(1000)
      ArkTools.forceFullGC()
      await sleep(50)
    }
  }
}

declare class ArkTools {
  static forceFullGC(): void;
}

async function sleep(ms: number): Promise<void> {
  return new Promise(resolve => {
    setTimeout(resolve, ms)
  })
}
