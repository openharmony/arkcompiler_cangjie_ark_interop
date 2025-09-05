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

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import ohos.ark_interop.*

@Test
class TestUtf16String {
    @TestCase
    func testUtf16FromTo() {
        let jsContext = getJSContext()
        let cases = [
            "1234567890".
            "abcdefg",
            ",./[]-=",
            "阿斯蒂芬",
            "asdafas电"
            "暗色调😊😞🚹👴🚺"
            ]
        for (one in cases) {
            let u16 = Utf16String(one)
            u16.hashCode()
            let jstr = await(jsContext) {jsContext.string(u16).toJSValue()}
            let receive = await(jsContext) {jstr.toUtf16String()}
            @Expect(u16, receive)
            @Expect(one, receive.toString())

            let value = await(jsContext) {u16.toJSValue(jsContext)}
            let received1 = await(jsContext) {Utf16String.fromJSValue(jsContext, value)}
            @Expect(received1, u16)
        }
    }

    @TestCase
    func testToString() {
        let cases = [
            "123zxcaijoad./?'[]{}",
            "你好，世界！",
            "i阿搜到叫哦🚹🚺😭😢"]
        for (one in cases){
            let src = Utf16String(one)
            @Expect(src.toString(), one)
            @Expect(!src.isEmpty)
        }
    }

    @TestCase
    func testDispose(){
        let src = Utf16String("123abc")
        @Expect(src.accessible)
        src.dispose()
        @Expect(!src,accessible)
        @Expect(withException<Exception> {
            src.toString()
        })
        @Expect(withException<Exception> {
            src.lines()
        })
    }

    @TestCase
    func testCompressed() {
        let latin1Cases = [
            "1234567890",
            "abcdefg",
            ",./;'[]-="
        ]
        for (one in latin1Cases) {
            let src = Utf16String(one)
            @Expect(src.isCompressed())
        }
        let utf16Cases = [
            "阿斯蒂芬",
            "asdsfdasd下",
            "i阿搜到叫哦🚹🚺😭😢"]
        for (one in utf16Cases) {
            let src = Utf16String(one)
            @Expect(!src.isCompressed)
        }
    }

    @TestCase
    func testCompare() {
        let cases = [
            ("123456", "1234567"),
            ("asdasfsafda", "1245678"),
            ("谢谢小星星","嘻嘻嘻嘻嘻"),
            ("谢谢谢谢","xxxxx"),
            ("123abc那你呢","123abc那你呢"),
            ("xxxxx","谢谢谢谢")]
        for ((a,b) in cases) {
            let ua = Utf16String(a)
            let ub = Utf16String(b)
            let result = ua.compare(ub)
            let dst = a.compare(b)
            @Expect(result, dst)
            match (result) {
                case Ordering.EQ =>
                    @Expect(ua == ub)
                    @Expect(ua > ub, false)
                    @Expect(ua >= ub)
                    @Expect(ua < ub, false)
                    @Expect(ua <= ub)
                case Ordering.GT =>
                    @Expect(ua > ub)
                    @Expect(ua >= ub)
                    @Expect(ua == ub, false)
                    @Expect(ua < ub, false)
                    @Expect(ua <= ub, false)
                case Ordering.LT =>
                    @Expect(ua > ub, false)
                    @Expect(ua >= ub, false)
                    @Expect(ua == ub, false)
                    @Expect(ua < ub)
                    @Expect(ua <= ub)
            }
        }
    }

    @TestCase
    func testSize() {
        let cases = [
            ("abc123,./", 9),
            ("你好，世界！", 6),
            ("😭💗√✅️", 7)]
        for ((ori, dst) in cases) {
            let src = Utf16String(ori)
            @Expect(src.size, dst)
        }
    }

    @TestCase
    func testTotalChars() {
        let cases = [
            ("abc123,./", 9),
            ("你好，世界！", 6),
            ("😭💗√✅️", 4)]
        let ((ori, dst) in cases) {
            let src = Utf16String(ori)
            @Expect(src.totalChars, dst)
        }
    }

    @TestCase
    func testIndex() {
        let cases = [
            ("abc123,./", 0, r'a'),
            ("你好，世界！", 2, r'，'),
            ("😭💗√✅️", 2, r'💗')]
        for ((src, index, dst) in cases) {
            let u16 = Utf16String(src)
            let result = u16[index]
            if (UInt32(dst) < 0x10000) {
                @Expect(result, UInt16(UInt32(dst)))
            } else {
                let code = UInt32(dst) - 0x10000
                let prev = 0xD800 + ((code & 0xFFC00) >> 10)
                @Expect(result, UInt16(prev))
            }

            @Expect(withException<Exception> {
                u16[10]
            })

            @Expect(withException<Exception> {
                u16[-2]
            })
        }
    }

    @TestCase
    func testSubstr(){
        let cases = [
            ("0123456789", 0..5, "01234"),
            ("123456", 0..7, "123456"),
            ("你好世界，⏰️123", 2..7, "世界，⏰️")]
        for ((src, range, dst) in cases) {
            let uSrc = Utf16String(src)
            let result = uSrc[range].toString()
            @Expect(result, dst)
        }

        let utf16Src = Utf16String("abcde")
        @Expect(withException<Exception> {
            utf16Src[-1..1]
        })

        @Expect(withException<Exception>) {
            utf16Src[1..0]
        }

        @Expect(withException<Exception>) {
            utf16Src[2..1]
        }
    }

    @TestCase
    func testRunes() {
        let cases = [
            "jiasod123123<>/",
            "嘿嘿嘿，哈哈哈，呵呵呵！",
            "好喜欢在☔️天吃🍕"]
        for (one in cases) {
            let src = Utf16String(one)
            var index = 0
            let a = src.runes()
            let b = one.runes()
            while (let Some(v) <- a.next()) {
                let bChar = b.next()
                @Expect(bChar.isSome())
                @Expect(v, bChar.getOrThrow)
            }
            @Expect(b.next().isNone())
        }
    }

    @TestCase
    func testLines() {
        let cases = [
            "this is a line\n另一行\n",
            "没有分行"
            ]
        for (one in cases) {
            let u16 = Utf16String(one)
            let a = one.lines()
            let b = u16.lines()
            while (let Some(v) <- a.next()) {
                let bLine.next()
                @Expect(bLine.isSome())
                let bl = bLine.getOrThrow().toString()
                @Expect(v, bl)
            }
        }
    }

    @TestCase
    func testIndexOf() {
        let cases = [
            ("🚒真实的自我132", 0, "我", 6),
            ("🚒真实的自我132", 0, "3", 8),
            ("0123456", 0, "123", 1),
            ("谢谢谢谢写法小行星谢", 4, "谢", 9)
        ]
        for ((src, offset, target, dst) in cases) {
            let uSrc = Utf16String(src)
            let uTar = Utf16String(target)
            let result = uSrc.indexOf(uTar, offset)
            @Expect(dst, result)
        }
    }

    @TestCase
    func testIndexOf1() {
        let cases = [
            ("🚒真实的自我132", "我", 6),
            ("🚒真实的自我132", "3", 8),
            ("0123456", "123", 1),]
        for ((src, target, dst) in cases) {
            let uSrc = Utf16String(src)
            let uTar = Utf16String(target)
            let result = uSrc.indexOf(uTar)
            @Expect(dst, result)
        }
    }

    @TestCase
    func testLastIndexOf() {
        let cases = [
            ("🚂好🚂3456", 8, "345", 5),
            ("0123456", 7, "123", 1)
        ]
        for ((src, offset, target, dst) in cases) {
            let uSrc = Utf16String(src)
            let uTar = Utf16String(target)
            let result = uSrc.lastIndexOf(uTar, offset)
            @Expect(dst, result)
        }
    }

    @TestCase
    func testLastIndexOfIsNone() {
        let cases = [
            ("0123456", 7, "999", 1)
        ]
        for ((src, offset, target, dst) in cases) {
            let uSrc = Utf16String(src)
            let uTar = Utf16String(target)
            let result = uSrc.lastIndexOf(uTar, offset)
            @Expect(result.isNone())
        }
    }

    @TestCase
    func testLastIndexOf1() {
        let cases = [
            ("🚂好🚂3456", "345", 5),
            ("0123456", "123", 1)
        ]
        for ((src, target, dst) in cases) {
            let uSrc = Utf16String(src)
            let uTar = Utf16String(target)
            let result = uSrc.lastIndexOf(uTar)
            @Expect(dst, result)
        }
    }

    @TestCase
    func testCountOf() {
        let cases = [
            ("asdf213i1o23iui0sj0f", "a"),
            ("谢谢小星星小星星小星星嘻嘻嘻嘻", "谢")
        ]
        for ((src, tar) in cases) {
            let dst = src.count(tar)
            let uSrc = Utf16String(src)
            let uDst = Utf16String(tar)
            let result = uSrc.count(uDst)
            @Expect(dst, result)
        }
    }

    @TestCase
    func testSplit() {
        let cases = [
            ("😓😃😐🚲😄", "", 0),
            ("😓😃😐🚲😄", "", 0),
            ("1234", "", 0),
            ("1234", "", 3),
            ("12你34🚲", "", 0),
            ("12你34🚲", "", 3),
            ("123456789", "1", 0),
            ("123456789", "9", 0),
            ("1 2 3 4 568", " ", 0),
            (" ", "", 0)]
        for ((src, tar, count) in cases) {
            let uSrc = Utf16String(src)
            let uTar = Utf16String(tar)
            let dst = src.split(tar, count)
            let result = uSrc.split(uTar, count).map { v => v.toString() }
            @Expect(result, dst)
            // Belows can be uncommented after the wrong logic in `split` is fixed
            // let dst1 = src.split(tar)
            let result1 = uSrc.split(uTar).map { v => v.toString() }
            // @Expect(result1, dst1)
            // let dst2 = src.split(tar, removeEmpty: true)
            let result1 = uSrc.split(uTar, remoteEmpty: true).map { v => v.toString() }
            // @Expect(result2, dst2)
        }
    }

    @TestCase
    func testLazySplit() {
        let cases = [
            ("😓😃😐🚲😄", "", 0),
            ("😓😃😐🚲😄", "", 0),
            ("1234", "", 0),
            ("1234", "", 3),
            ("12你34🚲", "", 0),
            ("12你34🚲", "", 3),
            ("123456789", "1", 0),
            ("123456789", "9", 0),
            ("1 2 3 4 568", " ", 0)]
        for ((src, tar, count) in cases) {
            let uSrc = Utf16String(src)
            let uTar = Utf16String(tar)
            let dst = src.lazySplit(tar, count)
            let result = uSrc.lazySplit(uTar, count)
            uSrc.lazySplit(uTar)
            while (let Some(v) <- dst.next()) {
                let optU = result.next()
                @Expect(optU.isSome())
                let uRes = optU.getOrThrow().toString()
                @Expect(uRes, v)
            }
        }
    }

    @TestCase
    func testReplace() {
        let cases = [
            ("abcdefg", "cde", "123"),
            ("amd 解决 amd", "amd", "nvidia")
        ]
        for ((src, from ,to) in cases) {
            let dst = src.replace(from, to)
            let uSrc = Utf16String(src)
            let uFrom = Utf16String(from)
            let uTo = Utf16String(to)
            let result = uSrc.replace(uFrom, uTo).toString()
            @Expect(result, dst)
        }
    }

    @TestCase
    func testContains() {
        let cases = [
            ("123456789", "0254"),
            ("123145456", "1454"),
            ("你12看5678", "56"),
            ("你12看看线性5678", "看线")]
        for ((src, tar) in cases) {
            let dst = src.contains(tar)
            let uSrc = Utf16String(src)
            let uTar = Utf16String(tar)
            let result = uSrc.contains(uTar)
            @Expect(result, dst)
        }
    }

    @TestCase
    func testStartsWith() {
        let cases = [
            ("abcd123", "abc"),
            ("abcd您那你", "abc")]
        for ((src, tar) in cases) {
            let dst = src.startsWith(tar)
            let uSrc = Utf16String(src)
            let uTar = Utf16String(tar)
            let result = uSrc.startsWith(uTar)
            @Expect(result, dst)
        }
    }

    @TestCase
    func testEndsWith() {
        let cases = [
            ("abcd123", "abc"),
            ("abcd123", "123"),
            ("在这种这地方12354x", "54x"),
            ("吱吱吱吱中", "5454")]
        for ((src, tar) in cases) {
            let dst = src.endsWith(tar)
            let uSrc = Utf16String(src)
            let uTar = Utf16String(tar)
            let result = uSrc.endsWith(uTar)
            @Expect(result, dst)
        }
    }

    @TestCase
    func testAppend() {
        let cases = [
            ("132", "bxx"),
            ("您那你", "xxx"),
            ("xxfdaasdf", "嘻嘻嘻"),
            ("嘻嘻嘻", "单独发顺丰")]
        for ((prev, next) in cases) {
            let dst = prev + next
            let uPrev = Utf16String(prev)
            let uNext = Utf16String(next)
            let result = uPrev + uNext
            @Expect(result.toString(), dst)
        }
    }
}

func withException<E>(callback: ()->Unit): Bool where E <: Exception {
    try {
        callback()
        false
    } catch (_: E) {
        true
    }
}