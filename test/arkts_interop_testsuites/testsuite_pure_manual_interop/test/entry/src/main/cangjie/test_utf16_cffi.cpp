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

#include <gtest/gtest.h>
#include <utf16string_cffi.h>
#include <utf16string_dfx.h>

static std::string Utf16ToUtf8(Utf16StringHandle handle)
{
    auto header = CJUtf16StringGetHeader(handle);
    std::string result;

    if (header.isLatin1) {
        result.resize(header.length);
    } else {
        result.resize(header.length << 2);
    }

    auto size = CJUtf16StringWriteToUtf8(handle, result.data());
    result.resize(size);
    return result;
}

TEST(Utf16StringCFFITest, Empty)
{
    Utf16StringScope local;
    auto empty = CJUtf16StringCreateEmpty();
    auto header = CJUtf16StringGetHeader(empty);
    EXPECT_TRUE(header.isConstObJ);
    EXPECT_TRUE(header.isLatin1);
    EXPECT_EQ(header.length, 0);
    EXPECT_EQ(local.GetRaise(), 0);
}

TEST(Utf16StringCFFITest, ToString)
{
    std::string cases[] = {
        "abcde123.[]",
        "阿萨德及哦",
        "阿萨🚂🔋😮123"
    };

    Utf16StringScope local;

    char buffer[100];
    for (const auto& s : cases){
        auto handle = CJUtf16StringCreate(s.data(), s.size(), false);
        auto ending = CJUtf16StringWriteToUtf8(handle, buffer);
        std::string result(buffer, ending);
        EXPECT_EQ(result, s);
        CJUtf16StringDelete(handle);
    }

    EXPECT_EQ(local.GetRaise(), 0);
}

TEST(Utf16StringCFFITest, Header)
{
    struct HeaderCase {
        std::string src;
        CJUtf16StringHeader header;
    };

    Utf16StringScope local;

    HeaderCase cases[] {
        {"ab23.[]", {false, true, 7}},
        {"你我他试试", {false, false, 5}},
        {"理论🚗🍹👌123", {false, false, 11}}
    };

    for (const auto& c : cases){
        auto handle = CJUtf16StringCreate(c.src.data(), c.src.size(), false);
        auto header = CJUtf16StringGetHeader(handle);
        EXPECT_EQ(header.isLatin1, c.header.isLatin1);
        EXPECT_EQ(header.length, c.header.length);
        CJUtf16StringDelete(handle);
    }

    EXPECT_EQ(local.GetRaise(), 0);
}

TEST(Utf16StringCFFITest, TotalChars)
{
    struct TotalCharsCase {
        std::string src;
        uint32_t totalChars;
    };

    TotalCharsCase cases[] {
        {"ab23.[]", 7},
        {"你我他试试", 5},
        {"理论🚗🍹👌123", 8}
    };

    Utf16StringScope local;

    for (const auto& c : cases) {
        auto handle = CJUtf16StringCreate(c.src.data(), c.src.size(), false);
        auto totalChars = CJUtf16StringTotalChars(handle);
        EXPECT_EQ(totalChars, c.totalChars);
        CJUtf16StringDelete(handle);
    }
    
    EXPECT_EQ(local.GetRaise(), 0);
}

TEST(Utf16StringCFFITest, Compare) {
    struct CompareCase {
        std::string a;
        std::string b;
    };
    CompareCase cases[]{
        {"123456", "1234567"},
        {"asdasfsafda", "1245678"},
        {"谢谢小星星","嘻嘻嘻嘻嘻"},
        {"谢谢谢谢","xxxxx"},
        {"xxxxx","谢谢谢谢"}
    };
    Utf16StringScope local;
    for (const auto& s : cases) {
        auto sa = CJUtf16StringCreate(s.a.data(), s.a.size(), false);
        auto sb = CJUtf16StringCreate(s.b.data(), s.b.size(), false);
        auto result = s.a.compare(s.b);
        EXPECT_EQ(result, CJUtf16StringCompare(sa, sb));
        CJUtf16StringDelete(sa);
        CJUtf16StringDelete(sb);
    }
    EXPECT_EQ(local.GetRaise(), 0);
}

TEST(Utf16StringCFFITest, SubStr) {
    struct SubStrCase {
        std::string src;
        int start;
        int end;
        std::string dst;
    };

    SubStrCase cases[] {
        {"0123456789", 0, 5, "01234"},
        {"123456", 0, 10, "123456"},
        {"132", 1, 0, ""},
        {"你好世界，⏰️123", 2, 7, "世界，⏰️"},
        {"你好世界123", 4, 7, "123"},
        {"你好世界123456789", 4, 13, "123456789"},
        {"12中国", 1, 32, "2中国"},
    };
    Utf16StringScope local;
    for (const auto& c : cases) {
        const auto src = CJUtf16StringCreate(c.src.c_str(), c.src.size(), false);
        const auto sub = CJUtf16StringSubString(src, c.start, c.end);
        auto dst = CJUtf16StringCreate(c.dst.c_str(), c.dst.size(), false);
        EXPECT_EQ(CJUtf16StringCompare(sub, dst), 0);
        CJUtf16StringDelete(src);
        CJUtf16StringDelete(sub);
        CJUtf16StringDelete(dst);
    }
    EXPECT_EQ(local.GetRaise(), 0);
}

TEST(Utf16StringCFFITest, SubStrAdvanced) {
    struct SubStrCase {
        std::string src;
        int start;
        int end;
        std::string dst;
        bool isLatin1;
    };

    SubStrCase cases[] {
        {"你好世界，⏰️123", 2, 7, "世界，⏰️", false},
        {"你好世界，⏰️123", 7, 8, "1", true},
    };

    Utf16StringScope local;
    for (const auto& c : cases) {
        const auto src = CJUtf16StringCreate(c.src.data(), c.src.size(), false);
        const auto sub = CJUtf16StringSubString(src, c.start, c.end);
        auto dst = CJUtf16StringCreate(c.dst.data(), c.dst.size(), false);
        EXPECT_EQ(CJUtf16StringCompare(sub, dst), 0);
        EXPECT_EQ(sub->IsLatin1(), c.isLatin1);
        CJUtf16StringDelete(src);
        CJUtf16StringDelete(sub);
        CJUtf16StringDelete(dst);
    }
    EXPECT_EQ(local.GetRaise(), 0);
}

TEST(Utf16StringCFFITest, Split) {
    struct SplitCase {
        std::string src;
        std::string separator;
        int count;
        std::vector<std::string> dst;
    };
    SplitCase cases[] {
        {"😓😃😐🚲😄", "", 0, {"😓","😃","😐","🚲","😄"}},
        {"😓😃😐🚲😄", "", 2, {"😓","😃😐🚲😄"}},
        {"1234", "", 0, {"1","2","3","4"}},
        {"1234", "", 3, {"1","2","34"}},
        {"12你34🚲", "", 0, {"1","2","你","3","4","🚲"}},
        {"12你34🚲", "", 3, {"1","2","你34🚲"}},
        {"123456789", "1", 0, {"", "23456789"}},
        {"123456789", "1", 0, {"12345678", ""}},
        {"1 2 3 4 568", " ", 0, {"1","2","3","4","568"}}
    };
    Utf16StringScope local;

    for (const auto& c : cases) {
        auto src = CJUtf16StringCreate(c.src.c_str(), c.src.size(), false);
        auto spt = CJUtf16StringCreate(c.separator.data(), c.separator.size(), false);
        auto result = CJUtf16StringSplit(src, spt, c.count);
        EXPECT_EQ(result.length, c.dst.size());
        for (size_t i = 0; i < result.length; i++) {
            EXPECT_EQ(Utf16ToUtf8(result.values[i]), c.dst[i]);
            CJUtf16StringDelete(result.values[i]);
        }
        CJUtf16StringDelete(src);
        CJUtf16StringDelete(spt);
        CJUtf16StringArrayFree(result);
    }

    EXPECT_EQ(local.GetRaise(), 0);  
}

TEST(Utf16StringCFFITest, SplitAdvanced) {
    struct Element {
        std::string value;
        bool isLatin1;
    };

    struct SplitCase {
        std::string src;
        std::string separator;
        int count;
        std::vector<Element> dst;
    };

    SplitCase cases[] {
        {
            "0,j]你😄", "", 0, {
                {"0", true},
                {",", true},
                {"j", true},
                {"]", true},
                {"你", false},
                {"😄", false}
            }
        },
    };
    Utf16StringScope local;

    for (const auto& c : cases) {
        auto src = CJUtf16StringCreate(c.src.c_str(), c.src.size(), false);
        auto spt = CJUtf16StringCreate(c.separator.data(), c.separator.size(), false);
        auto result = CJUtf16StringSplit(src, spt, c.count);
        EXPECT_EQ(result.length, c.dst.size());
        for (size_t i = 0; i < result.length; i++) {
            EXPECT_EQ(Utf16ToUtf8(result.values[i]), c.dst[i].value);
            auto header = CJUtf16StringGetHeader(result.values[i]);
            EXPECT_EQ(header.isLatin1, c.dst[i].isLatin1);
            CJUtf16StringDelete(result.values[i]);
        }
        CJUtf16StringDelete(src);
        CJUtf16StringDelete(spt);
        CJUtf16StringArrayFree(result);
    }

    EXPECT_EQ(local.GetRaise(), 0);  
}

TEST(Utf16StringCFFITest, IndexOf) {
    struct IndexOfCase {
        std::string src;
        int offset;
        std::string target;
        int result;
    };
    IndexOfCase cases[] {
        {"🚑真实的自我132", 0, "我", 6},
        {"0123456", 0, "123", 1},
        {"黑012345634563456", 0, "1234563456345", 2},
        {"黑012345白345634561234545634564563456", 0, "1234563456345", -1},
        {"123456", 0, "我", -1},
        {"🚑真实的自我132", 0, "🚑", 0},
        {"真实的自我132", 0, "🚑", -1},
    };
    Utf16StringScope local;

    for (const auto& c : cases) {
        auto src = CJUtf16StringCreate(c.src.c_str(), c.src.size(), false);
        auto target = CJUtf16StringCreate(c.target.c_str(), c.target.size(), false);
        EXPECT_EQ(CJUtf16StringIndexOf(src, target, c.offset), c.result);
        CJUtf16StringDelete(src);
        CJUtf16StringDelete(target);
    }

    EXPECT_EQ(local.GetRaise(), 0);  
}

TEST(Utf16StringCFFITest, LastIndexOf) {
    struct LastIndexOfCase {
        std::string src;
        int offset;
        std::string target;
        int result;
    };
    LastIndexOfCase cases[] {
        {"🚗好🚗3456", 8, "345", 5},
        {"0123456", 7, "123", 1},
        {"0123456", 7, "我", -1},
        {"🚗好🚗3456", 8, "🚗", 3},
    };
    Utf16StringScope local;

    for (const auto& c : cases) {
        auto src = CJUtf16StringCreate(c.src.c_str(), c.src.size(), false);
        auto target = CJUtf16StringCreate(c.target.c_str(), c.target.size(), false);
        EXPECT_EQ(CJUtf16StringLastIndexOf(src, target, c.offset), c.result);
        CJUtf16StringDelete(src);
        CJUtf16StringDelete(target);
    }

    EXPECT_EQ(local.GetRaise(), 0);
}

TEST(Utf16StringCFFITest, CountOf) {
    struct CountCase {
        std::string src;
        std::string target;
        int result;
    };
    CountCase cases[] {
        {"0123456", "123", 1},
        {"012345781456789148578", "7", 3}
    };
    Utf16StringScope local;

    for (const auto& c : cases) {
        auto src = CJUtf16StringCreate(c.src.c_str(), c.src.size(), false);
        auto target = CJUtf16StringCreate(c.target.c_str(), c.target.size(), false);
        EXPECT_EQ(CJUtf16StringCountOf(src, target), c.result);
        CJUtf16StringDelete(src);
        CJUtf16StringDelete(target);
    }

    EXPECT_EQ(local.GetRaise(), 0);
}

TEST(Utf16StringCFFITest, Replace) {
    struct ReplaceCase {
        std::string src;
        std::string from;
        std::string to;
        int count;
        std::string result;
    };
    ReplaceCase cases[] {
        {"abcdefg", "cde", "123", 0, "ab123fg"},
        {"amd 解决 amd", "amd", "nvidia", 0, "nvidia 解决 nvidia"},
        {"amd 解决 amd", "amd", "nvidia", 1, "nvidia 解决 amd"},
        {"", "", "nvidia", 0, ""},
    };
    Utf16StringScope local;

    for (const auto& c : cases) {
        const auto src = CJUtf16StringCreate(c.src.data(), c.src.size(), false);
        const auto from = CJUtf16StringCreate(c.from.data(), c.from.size(), false);
        const auto to = CJUtf16StringCreate(c.to.data(), c.to.size(), false);
        auto result = CJUtf16StringReplace(src, from, to, c.count);
        EXPECT_EQ(Utf16ToUtf8(result), c.result);
        CJUtf16StringDelete(src);
        CJUtf16StringDelete(to);
        CJUtf16StringDelete(from);
        CJUtf16StringDelete(result);
    }

    EXPECT_EQ(local.GetRaise(), 0);
}

TEST(Utf16StringCFFITest, Contains) {
    struct ContainsCase {
        std::string src;
        std::string target;
        bool result;
    };
    ContainsCase cases[] {
        {"123456789", "0254", false},
        {"123145456", "1454", true},
        {"你12看5678", "56", true},
        {"你12看看线性5678", "看线", true}
    };
    Utf16StringScope local;
    EXPECT_EQ(local.GetRaise(), 0);
    for (const auto& c : cases) {
        auto src = CJUtf16StringCreate(c.src.data(), c.src.size(), false);
        auto dst = CJUtf16StringCreate(c.target.data(), c.target.size(), false);
        auto contains = CJUtf16StringIndexOf(src, dst, 0) != -1;
        EXPECT_EQ(contains, c.result);
        CJUtf16StringDelete(src);
        CJUtf16StringDelete(dst);
    }

    EXPECT_EQ(local.GetRaise(), 0);
}

TEST(Utf16StringCFFITest, StartsWith) {
    struct StartsWithCase {
        std::string src;
        std::string target;
        bool result;
    };

    StartsWithCase cases[] {
        {"abcd123", "abc", true},
        {"abcd您那你", "abc", true},
    };
    Utf16StringScope local;
    EXPECT_EQ(local.GetRaise(), 0);
    for (const auto& c : cases) {
        auto src = CJUtf16StringCreate(c.src.data(), c.src.size(), false);
        auto target = CJUtf16StringCreate(c.target.data(), c.target.size(), false);
        EXPECT_EQ(CJUtf16StringStartsWith(src, target, 0), c.result);
        CJUtf16StringDelete(src);
        CJUtf16StringDelete(target);
    }

    EXPECT_EQ(local.GetRaise(), 0);
}

TEST(Utf16StringCFFITest, EndsWith) {
    struct StartsWithCase {
        std::string src;
        std::string target;
        bool result;
    };
    StartsWithCase cases[] {
        {"abcd123", "abc", false},
        {"abcd123", "123", true},
        {"在这种这地方12354x", "54x", true},
        {"吱吱吱吱中", "5454", false},
    };
    Utf16StringScope local;
    EXPECT_EQ(local.GetRaise(), 0);
    for (const auto& c : cases) {
        auto src = CJUtf16StringCreate(c.src.data(), c.src.size(), false);
        auto target = CJUtf16StringCreate(c.target.data(), c.target.size(), false);
        EXPECT_EQ(CJUtf16StringEndsWith(src, target, 0), c.result);
        CJUtf16StringDelete(src);
        CJUtf16StringDelete(target);
    }

    EXPECT_EQ(local.GetRaise(), 0);
}

TEST(Utf16StringCFFITest, Append) {
    struct AppendCase {
        std::string head;
        std::string back;
    };

    AppendCase cases[] {
        {"132", "bxx"},
        {"您那你", "xxx"},
        {"xxfdaasdf", "嘻嘻嘻"},
        {"嘻嘻嘻", "单独发顺丰"},
        {"132", ""},
        {"", ""},
        {"", "132"}
    };

    Utf16StringScope local;
    EXPECT_EQ(local.GetRaise(), 0);

    for (const auto& c : cases) {
        auto s = CJUtf16StringCreate(c.head.data(), c.head.size(), false);
        auto t = CJUtf16StringCreate(c.back.data(), c.back.size(), false);
        auto r = CJUtf16StringConcat(s, t);
        EXPECT_EQ(Utf16ToUtf8(r), c.head + c.back);
        CJUtf16StringDelete(s);
        CJUtf16StringDelete(t);
        CJUtf16StringDelete(r);
    }

    EXPECT_EQ(local.GetRaise(), 0);
}

TEST(Utf16StringCFFITest, Index) {
    struct IndexCase {
        std::string src;
        std::vector<char32_t> dst;
    };

    IndexCase cases[] {
        {"a1,和🚗", {'a', '1', ',', U'和', U'🚗'}},
    };

    Utf16StringScope local;

    for (const auto& c : cases) {
        auto src = CJUtf16StringCreate(c.src.data(), c.src.size(), false);
        for (int32_t i = 0, il = c.dst.size() ; i < il ; i++) {
            auto dst = CJUtf16StringGetCharAtIndex(src, i);
            EXPECT_EQ(dst, c.dst[i]);
        }  
        CJUtf16StringDelete(src);
    }

    EXPECT_EQ(local.GetRaise(), 0);
}

TEST(Utf16StringCFFITest, RIndex) {
    struct IndexCase {
        std::string src;
        std::vector<char32_t> dst;
    };

    IndexCase cases[] {
        {"a1,和🚗", {U'🚗', U'和', ',', '1', 'a'}},
        {"abcd", {'d', 'c', 'b', 'a'}},
    };

    Utf16StringScope local;

    for (const auto& c : cases) {
        auto src = CJUtf16StringCreate(c.src.data(), c.src.size(), false);
        for (int32_t i = 0, il = c.dst.size() ; i < il ; i++){
            auto dst = CJUtf16StringGetCharAtIndex(src, -(i + 1));
            EXPECT_EQ(dst, c.dst[i]);
        }  
        CJUtf16StringDelete(src);
    }

    EXPECT_EQ(local.GetRaise(), 0);
}

TEST(Utf16StringCFFITest, Join) {
    struct JoinCase {
        std::vector<std::string> src;
        std::string delimiter;
        std::string dst;
    };

    Utf16StringScope local;

    JoinCase cases[]{
        {{"a", "1", ",", "你", "🚗"}, "", "a1,你🚗"},
        {{"a", "1", ",", "你", "🚗"}, " ", "a 1 , 你 🚗"},
        {{"a", "1", ","}, "🚗", "a🚗1🚗,"},
    };

    for (const auto& c : cases) {
        std::vector<Utf16StringHandle> src;
        for (const auto& s : c.src){
            src.push_back(CJUtf16StringCreate(s.data(), s.size(), false));
        }
        auto delimiter = CJUtf16StringCreate(c.delimiter.data(), c.delimiter.size(), false);
        auto dst = CJUtf16StringJoin(src.data(), src.size(), delimiter);
        EXPECT_EQ(Utf16ToUtf8(dst), c.dst);
        for (uint32_t i = 0; i < src.size(); i++) {
            CJUtf16StringDelete(src[i]);    
        }
        CJUtf16StringDelete(dst);
        CJUtf16StringDelete(delimiter);
    }

    EXPECT_EQ(local.GetRaise(), 0);
}