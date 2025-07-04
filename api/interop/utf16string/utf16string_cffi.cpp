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

#include "utf16string_cffi.h"

#include "utf16string.h"

CJUtf16StringHandle CJUtf16StringCreateEmpty()
{
    return Utf16String::Empty;
}

CJUtf16StringHandle CJUtf16StringCreate(const char* src, uint32_t size, bool isConst)
{
    return Utf16String::Create(src, size, isConst);
}

CJUtf16StringHandle CJUtf16StringCreateWithoutData(bool isLatin1, uint32_t length)
{
    return Utf16String::Create(isLatin1, length);
}

void CJUtf16StringDelete(CJUtf16StringHandle handle)
{
    Utf16String::Destroy(handle);
}

CJUtf16StringHeader CJUtf16StringGetHeader(CJUtf16StringHandle handle)
{
    return {
            handle->IsConstObJ(),
            handle->IsLatin1(),
            handle->Length(),
            handle->GetData()
    };
}

uint32_t CJUtf16StringWriteToUtf8(CJUtf16StringHandle handle, char* dst)
{
    return handle->WriteToUtf8(dst);
}

uint32_t CJUtf16StringTotalChars(CJUtf16StringHandle handle)
{
    return handle->TotalChars();
}

int32_t CJUtf16StringCompare(CJUtf16StringHandle a, CJUtf16StringHandle b)
{
    return a->Compare(b);
}

size_t CJUtf16StringHash(CJUtf16StringHandle handle)
{
    return handle->Hash();
}

CJUtf16StringHandle CJUtf16StringSubString(CJUtf16StringHandle handle, uint32_t start, uint32_t end)
{
    return handle->RawSubstr(start, end);
}

CJUtf16StringArray CJUtf16StringSplit(CJUtf16StringHandle handle, CJUtf16StringHandle seperator, uint32_t limit)
{
    auto result = handle->Split(seperator, limit);
    auto values = new Utf16StringHandle[result.size()];
    for (uint32_t i = 0; i < result.size(); i++) {
        values[i] = result[i];
    }
    return {result.size(), values};
}

void CJUtf16StringArrayFree(CJUtf16StringArray array)
{
    delete [] array.values;
}

int64_t CJUtf16StringIndexOf(CJUtf16StringHandle handle, CJUtf16StringHandle target, int64_t start)
{
    return handle->RawIndexOf(target, start);
}

int64_t CJUtf16StringLastIndexOf(CJUtf16StringHandle handle, CJUtf16StringHandle target, int64_t ending)
{
    return handle->RawLastIndexOf(target, ending);
}

int64_t CJUtf16StringCountOf(CJUtf16StringHandle handle, CJUtf16StringHandle target)
{
    return handle->CountOf(target);
}

bool CJUtf16StringStartsWith(CJUtf16StringHandle handle, CJUtf16StringHandle target, uint32_t start)
{
    return handle->RawStartsWith(target, start);
}

bool CJUtf16StringEndsWith(CJUtf16StringHandle handle, CJUtf16StringHandle target, uint32_t ending)
{
    return handle->RawEndsWith(target, ending);
}

CJUtf16StringHandle CJUtf16StringConcat(CJUtf16StringHandle a, CJUtf16StringHandle b)
{
    return a->Append(b);
}

char32_t CJUtf16StringGetCharAtIndex(CJUtf16StringHandle handle, int64_t index)
{
    return (*handle)[index];
}

CJUtf16StringHandle CJUtf16StringJoin(const CJUtf16StringHandle* src, uint32_t length, CJUtf16StringHandle delimiter)
{
    return Utf16String::Join(src, length, delimiter);
}

CJUtf16StringHandle CJUtf16StringReplace(CJUtf16StringHandle handle, CJUtf16StringHandle from, CJUtf16StringHandle to, uint32_t count)
{
    return handle->Replace(from, to, count);
}
