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

package ohos_app_cangjie_entry.test

import std.unittest.*
import std.unittest.testmacro.*
import ohos.ark_interop.Utf16String

@Test
func compareLLT() {
    let cases = [
        ("123456", "1234567"),
        ("xxdfasdfa", "132456"),
        ("惺惺惜惺惺", "惺惺惜下惺"),
        ("谢谢谢谢", "xxxxx"),
        ("xxxxx", "谢谢谢谢") ]
    for ((a, b) in cases) {
        let ua = Utf16String(a)
        let ub = Utf16String(b)
        let bias = a.compare(b)
        let target = ua.compare(ub)
        @Expect(bias, target)
    }
}

@Test
func isLatin1LLT() {
    let cases = [
        ("123456你就", false),
        ("123\0456", false),
        ("123adf", true),
        ("zbd嘻嘻嘻", false)
        ]
    for ((src, isLatin1) in cases) {
        let utf16 = Utf16String(src)
        utf16.isLatin1Encoding()
        @Expect(isLatin1, utf16.isLatin1Encoding())
    }
}

struct SubstrCase {
    SubstrCase(
        let src: String,
        let range: Range<Int64>,
        let dst: String
    ) {}
}

@Test
func substrLLT() {
    let cases = [
        SubstrCase("0123", 0..0, ""),
        SubstrCase("0123456789", 0..5, "01234"),
        SubstrCase("你好🧭世界", 2..4, "🧭"),
        SubstrCase("你123", 1..2, "1"),
        SubstrCase("你12我", 3..4, "我")
    ]
    for (c in cases) {
        let src = Utf16String(c.src)
        let dst = src[c.range]
        @Expect(dst.toString(), c.dst)
    }
}

@Test
func substrHLT() {

    let cases = [
        SubstrCase("123", 0..4, ""),
        SubstrCase("123", -1..1, ""),
        SubstrCase("123", 2..1, ""),
        SubstrCase("🧭123", 0..1, "")
        ]
    for (c in cases) {
        let src = Utf16String(c.src)
        let hasException = try {
            src[c.range]
            false
        } catch (exp: Exception) {
            true
        }
        @Expect(hasException)
    }
}

@Test
func splitLLT() {
    let cases = [
        ("🤴⛩😁😘🚲", "", 0, ["🤴", "⛩", "😁", "😘", "🚲"]),
        ("🤴⛩😁😘🚲", "", 2, ["🤴", "⛩😁😘🚲"]),
        ("1234", "", 0, ["1", "2", "3", "4"]),
        ("1234", "", 3, ["1", "2", "34"]),
        ("0,h]你😎", "", 0, ["0", ",", "h", "]", "你", "😎"]),
        ("0,h]你😎", "", 3, ["0", ",", "h]你😎"]),
        ("123456789", "1", 0, ["", "23456789"]),
        ("123456789", "9", 0, ["12345678", ""]),
        ("1 2 3 4 568", " ", 0, ["1", "2", "3", "4", "568"])
        ]
    for ((src, spt, count, dst) in cases) {
        let uSrc = Utf16String(src)
        let uSpt = Utf16String(spt)
        let result = uSrc.split(uSpt, count)
        @Expect(result.size, dst.size)
        for (i in 0..result.size) {
            @Expect(result[i].toString(), dst[i])
        }
    }
}

@Test
func indexOfHLT() {

}

