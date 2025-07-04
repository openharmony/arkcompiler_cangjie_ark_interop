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

package ohos.cj_leakwatcher

import ohos.labels.*
import ohos.base.*
import std.collection.*
import std.fs.*
import std.time.DateTime
import std.sync.*
import std.ref.*
import std.runtime.*
import std.io.{ByteBuffer, readToEnd}

func checkAlive<T>(cache: WeakRef<T>): Bool where T <: Object {
    match (cache.value) {
        case Some(x) => true
        case None => false
    }
}

class WatchDesc<T> where T <: Object {
    private static var idx = 0
    let msg: String
    let index: Int64
    let ref: WeakRef<T>
    init(value: T, str: String) {
        msg = str
        index = idx
        idx++
        ref = WeakRef<T>(value, CleanupPolicy.EAGER)
    }
    func getMsg(): String {
        return msg
    }
    func getWeakRef(): WeakRef<T> {
        return ref
    }
    func getIndex(): Int64 {
        return index
    }
}

@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.HiviewDFX.HiChecker"
]
public class CJLeakWatcher<T> where T <: Object {
    var isEnable: Bool = false
    var watchObjMap = HashMap<Int64, WatchDesc<T>>()

    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiChecker"
    ]
    public func enable(flag: Bool): Unit {
        isEnable = flag
        if (!isEnable) {
            watchObjMap.clear();
        }
    }

    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiChecker"
    ]
    public func watch(obj: T, msg: String): Unit {
        if (!isEnable) {
            return
        }
        var desc = WatchDesc(obj, msg)
        watchObjMap[desc.getIndex()] = desc
    }

    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiChecker"
    ]
    public func check(): ArrayList<String> {
        var leakObjList = ArrayList<String>()
        if (!isEnable) {
            return leakObjList
        }

        for ((K, V) in watchObjMap) {
            if (checkAlive(V.getWeakRef())) {
                var str = "{\"Msg\":\"" + V.getMsg() + "\"}"
                leakObjList.add(str)
            }
        }
        return leakObjList
    }

    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.HiviewDFX.HiChecker"
    ]
    public func dump(path: String): ArrayList<String> {
        let fileArray = ArrayList<String>()
        if (!isEnable) {
            return fileArray;
        }

        var leakObjList = ArrayList<String>()
        for ((K, V) in watchObjMap) {
            if (checkAlive(V.getWeakRef())) {
                var str = "{\"Msg\":\"" + V.getMsg() + "\"}"
                leakObjList.add(str)
            }
        }

        try {
            let now = DateTime.now().toUnixTimeStamp().toMilliseconds().toString()
            let heapDataPath = Path(path + "/" + now + ".dumpHeapData")
            let leakListPath = Path(path + "/" + now + ".leakList")
            File.create(heapDataPath)
            File.create(leakListPath)
            dumpHeapData(heapDataPath)

            let file = File(leakListPath, Write)
            file.write(leakObjList.toString().toArray())

            fileArray.add(heapDataPath.toString())
            fileArray.add(leakListPath.toString())
        } catch (e: Exception) {
            AppLog.error("CJleakWatcher: dump heap data failed.")
            throw e
        }

        return fileArray
    }
}
