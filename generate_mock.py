#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Copyright (c) 2025 Huawei Device Co., Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import argparse


def get_identifier(src):
    id = src[0:len(src) - 1]
    if not id.isidentifier():
        raise "invalid identifier: " + id
    return id


def gen_mock_source(args):
    outtxt = "extern void* OHOSFFICallMockFunc(const char* funcName);\n"
    with open(args.input, "r") as f:
        for line in f.readlines():
            line = line.strip()
            if (line.startswith("#")):
                continue
            if not line.endswith(";"):
                continue
            funcName = get_identifier(line)
            outtxt += "void* " + funcName + "() {return OHOSFFICallMockFunc(\"" + funcName + "\");}\n"
    with open(args.output, "w") as f:
        f.write(outtxt)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", required=True, help="a text file lists library exports")
    parser.add_argument("--output", required=True, help="output source path")
    options = parser.parse_args()
    gen_mock_source(options)
