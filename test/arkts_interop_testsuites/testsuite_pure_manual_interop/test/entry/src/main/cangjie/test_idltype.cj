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

package ohos_app_cangjie_entry

import ohos.ark_interop.*
import std.unittest.testmacro.*
import std.unittest.common.*
import std.unittest.*
import std.collection.*

func doJSArrExTest(both: JSArrayEx<String>) {
    let jsContext = getJSContext()
    @Expect(await(jsContext){both.size}, 2)
    let firstOpt = await(jsContext) {both.get(0)}
    @Expect(firstOpt.isSome())
    @Expect(firstOpt.getOrThrow(), "aaa")
    await(jsContext) {both.set(0, "bbb")}
    @Expect(!await(jsContext){both.isEmpty()})
    @Expect(await(jsContext){both[0]}, "bbb")
    await(jsContext) {both[1] = "ccc"}
    @Expect(await(jsContext){both[1]}, "ccc")
    let cjArr = await(jsContext) {both.toArray()}
}

func doJSHashMapTest(map: JSHashMapEx<String, String>) {
    let jsContext = getJSContext()
    @Expect(await(jsContext){map.isEmpty()})
    @Expect(await(jsContext){map.get("a").isNone()})
    await(jsContext) {map.set("a", "b")}
    @Expect(await(jsContext){map.get("a").isSome()})
    @Expect(await(jsContext){map.size}, 1)
    @Expect(await(jsContext){map.has("a")})
    let curKeys = await(jsContext) {map.keys()}
    let values = await(jsContext) {map.values()}
    @Expect(await(jsContext){values.size}, 1)
    await(jsContext) {map["b"] = "c"}
    let bv = await(jsContext) {map["b"]}
    @Expect(bv, "c")
    await(jsContext) {map.delete("a")}
    @Expect(await(jsContext){map.size}, 1)
    await(jsContext) {map.setIfAbsent("a", "a")}
    await(jsContext) {map.setIfAbsent("a", "b")}
    @Expect(await(jsContext){map["a"]}, "a")
    await(jsContext) {map.setAll([("a", "b")])}
    @Expect(await(jsContext){map["a"]}, "b")
    await(jsContext) {map.deleteAll(["a"])}
    @Expect(await(jsContext){map.size}, 1)
    await(jsContext) {map["a"] = "c"}
    await(jsContext) {
        map.deleteIf {
            k, v => k == "d"
        }
    }
    @Expect(await(jsContext){map.size}, 2)
    await(jsContext) {
        map.deleteIf {
            k, v => v == "c"
        }
    }
    @Expect(await(jsContext){map.isEmpty()})
    let hh = await(jsContext) {map.toHashMap()}
    await(jsContext) {map["d"] = "a"}
    await(jsContext) {map.clear()}
    @Expect(await(jsContext){map.size}, 0)
}

func doJSInteropTypeTest<T>(jsContext: JSContext, value: T): Unit where T <: JSInteropType<T> & Equatable<T> {
    let jsValue = await(jsContext) {value.toJSValue(jsContext)}
    let received = await(jsContext) {T.fromJSValue(jsContext, jsValue)}
    @Expect(value, received)
}

@Test
class TestIDLType {
    @TestCase
    func testJSStringEx() {
        let jsContext = getJSContext()
        await(jsContext) {JSCurrentJSContext.set(jsContext)}
        let value = await(jsContext) {JSStringEx("abc")}
        let other = await(jsContext) {JSStringEx.fromJSValue(jsContext, value.toJSValue(jsContext))}
        @Expect(await(jsContext){value.size}, 3)
        @Expect(await(jsContext){value.toString()}, "abc")
        @Expect(await(jsContext){value == other})
        @Expect(JSStringEx.toArkTsType(), "string")
        JSCurrentJSContext.unset()
    }

    @TestCase
    func testJSArrayEx() {
        let jsContext = getJSContext()
        let array = await(jsContext) {JSArrayEx<String>("aaa")}
        let copy = await(jsContext) {array.clone()}
        let both = await(jsContext) {array.concat(copy)}
        let jsTy = await(jsContext) {
            JSArrayEx<String>
                .fromJSValue(jsContext, both.toJSValue(jsContext))
                .clone()
        }
        doJSArrExTest(both)
        doJSArrExTest(jsTy)
        @Expect(JSArrayEx<String>.toArkTsType(), "Array")
    }

    @TestCase
    func testJSHashMapEx() {
        let jsContext = getJSContext()
        await(jsContext) {JSCurrentJSContext.set(jsContext)}
        let hashmap = await(jsContext) {JSHashMapEx<String, String>()}
        let src = HashMap<String, String>()
        let hashmap1 = await(jsContext) {JSHashMapEx<String, String>(src)}
        let hashmap2 = await(jsContext) {
            JSHashMapEx<String, String>.fromJSValue(jsContext, hashmap.toJSValue(jsContext))
        }
        doJSHashMapTest(hashmap)
        doJSHashMapTest(hashmap1)
        doJSHashMapTest(hashmap2)
        @Expect(JSHashMapEx<String, String>.toArkTsType(), "Map")
        JSCurrentJSContext.unset()
    }

    @TestCase
    func testJSInteropType() {
        let jsContext = getJSContext()
        @Expect(Int8.toArkTsType(), "number")
        doJSInteropTypeTest<Int8>(jsContext, 0);
        doJSInteropTypeTest<Int8>(jsContext, Int8.Max);
        doJSInteropTypeTest<Int8>(jsContext, Int8.Min);
        @Expect(UInt8.toArkTsType(), "number")
        doJSInteropTypeTest<UInt8>(jsContext, 0);
        doJSInteropTypeTest<UInt8>(jsContext, UInt8.Max);
        doJSInteropTypeTest<UInt8>(jsContext, UInt8.Min);
        @Expect(UInt16.toArkTsType(), "number")
        doJSInteropTypeTest<UInt16>(jsContext, 0);
        doJSInteropTypeTest<UInt16>(jsContext, UInt16.Max);
        doJSInteropTypeTest<UInt16>(jsContext, UInt16.Min);
        @Expect(Int16.toArkTsType(), "number")
        doJSInteropTypeTest<Int16>(jsContext, 0);
        doJSInteropTypeTest<Int16>(jsContext, Int16.Max);
        doJSInteropTypeTest<Int16>(jsContext, Int16.Min);
        @Expect(Int32.toArkTsType(), "number")
        doJSInteropTypeTest<Int32>(jsContext, 0);
        doJSInteropTypeTest<Int32>(jsContext, Int32.Max);
        doJSInteropTypeTest<Int32>(jsContext, Int32.Min);

        @Expect(Int64.toArkTsType(), "number")
        doJSInteropTypeTest<Int64>(jsContext, 0);
        doJSInteropTypeTest<Int64>(jsContext, Int64(Int32.Max));
        doJSInteropTypeTest<Int64>(jsContext, Int64(Int32.Min));
        @Expect(UInt64.toArkTsType(), "number")
        doJSInteropTypeTest<UInt64>(jsContext, 0);
        doJSInteropTypeTest<UInt64>(jsContext, UInt64(UInt32.Max));
        doJSInteropTypeTest<UInt64>(jsContext, UInt64(UInt32.Min));
        @Expect(Float16.toArkTsType(), "number")
        doJSInteropTypeTest<Float16>(jsContext, 0.0);
        doJSInteropTypeTest<Float16>(jsContext, Float16.Max);
        doJSInteropTypeTest<Float16>(jsContext, Float16.Min);
        @Expect(Float32.toArkTsType(), "number")
        doJSInteropTypeTest<Float32>(jsContext, 0.0);
        @Expect(Float64.toArkTsType(), "number")
        doJSInteropTypeTest<Float64>(jsContext, 0.0);
        @Expect(Bool.toArkTsType(), "boolean")
        doJSInteropTypeTest<Bool>(jsContext, true);
        doJSInteropTypeTest<Bool>(jsContext, false);
        @Expect(String.toArkTsType(), "string")
        doJSInteropTypeTest<Bool>(jsContext, true);
        doJSInteropTypeTest<Bool>(jsContext, false);
        @Expect(Unit.toArkTsType(), "undefined")
        doJSInteropTypeTest<Unit>(jsContext, ());
        @Expect(Option<String>.toArkTsType(), "union")
        doJSInteropTypeTest<?String>(jsContext, None<String>);
        doJSInteropTypeTest<?String>(jsContext, "abc");
        @Expect(Array<Byte>.toArkTsType(), "ArrayBuffer")
        doJSInteropTypeTest<Array<Byte>>(jsContext, [1, 3, 4]);
        @Expect(JSString.toArkTsType(), "string")
    }

    @TestCase
    func testJSInteropTypeUInt32() {
        let jsContext = getJSContext()
        @Expect(UInt32.toArkTsType(), "number")
        doJSInteropTypeTest<UInt32>(jsContext, 0);
        doJSInteropTypeTest<UInt32>(jsContext, UInt32.Max);
        doJSInteropTypeTest<UInt32>(jsContext, UInt32.Min);
    }
}
