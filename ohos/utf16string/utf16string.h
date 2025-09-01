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

#ifndef ARKCOMPILER_CANGJIE_API_UTF16STRING_H
#define ARKCOMPILER_CANGJIE_API_UTF16STRING_H

#include <cstdint>
#include <atomic>
#include <string>
#include <vector>

using Utf16StringHandle = const struct Utf16String*;

struct Utf16String {
public:
    static Utf16StringHandle Create(const std::string& src);
    static Utf16StringHandle Create(const char* src, uint32_t length, bool isConst = false, bool isConstObJ = false);
    static Utf16StringHandle Create(bool isLatin1, uint32_t length);
    static void Destroy(Utf16StringHandle handle);
    template<template <typename _T, typename _A> typename Vec, typename A>
    static void DestroyList(const Vec<Utf16StringHandle, A>& list)
    {
        for (auto handle : list) {
            Destroy(handle);
        }
    }

    static void DestroyAll(Utf16StringHandle handle)
    {
        Destroy(handle);
    }

    template <typename A, typename ...ARGS>
    static void DestroyAll(A f, ARGS ...src)
    {
        Destroy(f);
        DestroyAll(src...);
    }

private:
    friend class Utf16StringRecorder;
    Utf16String(bool isLatin1, bool isConst, uint32_t length, const void* src, bool isConstObj = false);
    ~Utf16String();

    Utf16String(const Utf16String&) = delete;
    Utf16String& operator=(const Utf16String&) = delete;
    Utf16String(Utf16String&& other) = delete;
    Utf16String& operator=(Utf16String&& other) = delete;

    static Utf16StringHandle CreateSubstr(const Utf16String* src, uint32_t offset, uint32_t length);
    static Utf16StringHandle CreateLatin1(const char* src, uint32_t length, bool isConst, bool isConstObJ = false);
    static Utf16StringHandle CreateUtf16(const char16_t* src, uint32_t length, bool isConst, bool isConstObJ = false);
    static void CompressUtf16ToLatin1(uint8_t* dst, const char16_t* src, uint32_t length);
    static void Release(const Utf16String* src);
    static uint32_t Utf16ToUtf8(char* dst, const char16_t* src, uint32_t length);

    void SetParent(Utf16String* parent, uint32_t start);
    int32_t Latin1CompareLatin1(const Utf16String* other) const;
    int32_t Utf16CompareUtf16(const Utf16String* other) const;
    int32_t Utf16CompareLatin1(const Utf16String* other) const;
    int32_t CompareLength(const Utf16String* other) const;

    struct CharCode {
        enum Kind {
            LATIN1,
            CHAR16,
            CHAR16_X2,
            INVALID
        };
        Kind kind;
        char32_t value;
    };

    CharCode CharCodeAt(const uint32_t index) const;
    Utf16StringHandle RawSlice(uint32_t start, uint32_t length) const;
    int64_t RawIndexOf(const CharCode code, uint32_t start) const;
    int64_t RawLastIndexOf(const CharCode code, uint32_t start) const;
    uint32_t Write(Utf16StringHandle src, uint32_t offset);
    uint32_t CharIndex(uint32_t offset) const;
    uint32_t CharOffset(uint32_t index) const;

    /**
     * index start at 1
     */
    uint32_t RCharOffset(uint32_t index) const;
    std::vector<Utf16StringHandle> SplitEmpty(uint32_t maxCount) const;

    void IncRef();
    void DecRef();

    static uint32_t Utf8ToUtf16(char16_t* dst, const char* src, uint32_t length);

public:
    bool IsConstSrc() const
    {
        return isConstSrc_;
    }

    bool IsConstObJ() const
    {
        return isConstObj_;
    }

    uint32_t Length() const
    {
        return length_;
    }

    bool IsLatin1() const
    {
        return isLatin1_;
    }

    const void* GetData(uint32_t offset = 0) const
    {
        if (isLatin1_) {
            return reinterpret_cast<const char*>(src_) + offset;
        } else {
            return reinterpret_cast<const char16_t*>(src_) + offset;
        }
    }

    const char* Latin1Data() const
    {
        return reinterpret_cast<const char*>(src_);
    }

    const char16_t* Utf16Data() const
    {
        return reinterpret_cast<const char16_t*>(src_);
    }

    bool IsEmpty() const
    {
        return length_ == 0;
    }

    Utf16StringHandle RawSubstr(uint32_t start, uint32_t end) const;
    int64_t RawIndexOf(Utf16StringHandle separator, uint32_t start) const;
    int64_t RawLastIndexOf(Utf16StringHandle separator, uint32_t ending) const;
    bool RawStartsWith(Utf16StringHandle subject, uint32_t start = 0) const;
    bool RawEndsWith(Utf16StringHandle subject, uint32_t ending = 0) const;
    char16_t RawCharAt(uint32_t index) const
    {
        if (index >= length_) {
            return 0;
        }
        if (isLatin1_) {
            return Latin1Data()[index];
        } else {
            return Utf16Data()[index];
        }
    }

    Utf16StringHandle SubString(uint32_t start, uint32_t end) const;
    struct Range {
        uint32_t x;
        uint32_t y;

        size_t Distance() const
        {
            return y - x;
        }
    };
    Range GetUtf16Range(uint32_t start, uint32_t end) const;
    int64_t IndexOf(Utf16StringHandle separator, int64_t start) const;
    int64_t LastIndexOf(Utf16StringHandle separator, int64_t ending) const;
    char32_t operator[](int64_t index) const;

    uint32_t TotalChars() const;
    std::string ToString() const;
    uint32_t WriteToUtf8(char* dst) const;
    int32_t Compare(Utf16StringHandle other) const;
    size_t Hash() const;

    int64_t CountOf(Utf16StringHandle separator) const;
    std::vector<Utf16StringHandle> Split(Utf16StringHandle separator, uint32_t limit) const;
    Utf16StringHandle Replace(Utf16StringHandle search, Utf16StringHandle replacement, uint32_t count = 0) const;
    bool Contains(Utf16StringHandle separator) const;
    Utf16StringHandle Append(Utf16StringHandle subject) const;
    static Utf16StringHandle Empty;
    static Utf16StringHandle Join(const Utf16StringHandle* src, uint32_t length, Utf16StringHandle separator);

private:
    bool isLatin1_ = false;
    bool isConstSrc_ = false;
    bool isConstObj_ = false;
    uint32_t length_;
    const void* src_;
    const Utf16String* parent_ = nullptr;
    uint32_t parentOffset_ = 0;
    std::atomic<uint32_t> refCount_ = 1;
    uint8_t data_[0] {};
};

#endif // ARKCOMPILER_CANGJIE_API_UTF16STRING_H
