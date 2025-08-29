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

#ifndef ARKCOMPILER_CANGJIE_API_UTF16STRING_CFFI_H
#define ARKCOMPILER_CANGJIE_API_UTF16STRING_CFFI_H

#include <cstdint>
#include <cstddef>

#define EXPORT __attribute__((visibility("default")))

extern "C" {
typedef const struct Utf16String* CJUtf16StringHandle;
typedef struct {
    bool isConstObJ;
    bool isLatin1;
    uint32_t length;
    const void* data;
} CJUtf16StringHeader;
typedef struct {
    size_t length;
    CJUtf16StringHandle* values;
} CJUtf16StringArray;

EXPORT CJUtf16StringHandle CJUtf16StringCreateEmpty();
EXPORT CJUtf16StringHandle CJUtf16StringCreate(const char* src, uint32_t size, bool isConst);
EXPORT CJUtf16StringHandle CJUtf16StringCreateWithoutData(bool isLatin1, uint32_t length);
EXPORT void CJUtf16StringDelete(CJUtf16StringHandle handle);
EXPORT CJUtf16StringHeader CJUtf16StringGetHeader(CJUtf16StringHandle handle);
EXPORT uint32_t CJUtf16StringWriteToUtf8(CJUtf16StringHandle handle, char* dst);
EXPORT uint32_t CJUtf16StringTotalChars(CJUtf16StringHandle handle);
EXPORT int32_t CJUtf16StringCompare(CJUtf16StringHandle a, CJUtf16StringHandle b);
EXPORT size_t CJUtf16StringHash(CJUtf16StringHandle handle);
EXPORT CJUtf16StringHandle CJUtf16StringSubString(CJUtf16StringHandle handle, uint32_t start, uint32_t end);
EXPORT CJUtf16StringArray CJUtf16StringSplit(CJUtf16StringHandle handle, CJUtf16StringHandle seperator, uint32_t limit);
EXPORT void CJUtf16StringArrayFree(CJUtf16StringArray array);
EXPORT int64_t CJUtf16StringIndexOf(CJUtf16StringHandle handle, CJUtf16StringHandle target, int64_t start);
EXPORT int64_t CJUtf16StringLastIndexOf(CJUtf16StringHandle handle, CJUtf16StringHandle target, int64_t ending);
EXPORT int64_t CJUtf16StringCountOf(CJUtf16StringHandle handle, CJUtf16StringHandle target);
EXPORT bool CJUtf16StringStartsWith(CJUtf16StringHandle handle, CJUtf16StringHandle target, uint32_t start);
EXPORT bool CJUtf16StringEndsWith(CJUtf16StringHandle handle, CJUtf16StringHandle target, uint32_t ending);
EXPORT CJUtf16StringHandle CJUtf16StringConcat(CJUtf16StringHandle a, CJUtf16StringHandle b);
EXPORT char32_t CJUtf16StringGetCharAtIndex(CJUtf16StringHandle handle, int64_t index);
EXPORT CJUtf16StringHandle CJUtf16StringJoin(const CJUtf16StringHandle* src, uint32_t length,
    CJUtf16StringHandle delimiter);
EXPORT CJUtf16StringHandle CJUtf16StringReplace(CJUtf16StringHandle handle, CJUtf16StringHandle from,
    CJUtf16StringHandle to, uint32_t count);
}

#endif // ARKCOMPILER_CANGJIE_API_UTF16STRING_CFFI_H
