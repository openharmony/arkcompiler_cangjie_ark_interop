#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Copyright (c) 2021-2022 Huawei Device Co., Ltd.
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

import os
import sys
import optparse
import shutil
import subprocess

# /Users/p_cangjieci/Documents/ohos/prebuilts/cangjie-compiler/mac-aarch64/tools
#  ./flatc -t --raw-binary -o ./api ../ModuleFormat.fbs --  ~/Documents/ohos/out/sdk/cangjie_libraries/ohos/ohos.cjo
#  ./flatc -t --raw-binary -o ./api ../ModuleFormat.fbs --  ~/Documents/ohos/out/sdk/cangjie_libraries/ohos/ohos.request.agent.cjo
#  ./flatc -t --raw-binary -o ./api ../ModuleFormat.fbs --  ~/Documents/ohos/out/sdk/cangjie_libraries/ohos/ohos.request.agent.cjo
#  ./flatc -t --raw-binary -o ./kit ../ModuleFormat.fbs --  ~/Documents/ohos/out/sdk/cangjie_libraries/kit/kit.AVSessionKit.cjo

def convert_cjo_to_json(flatc, input, output_path, fbs):
    child = subprocess.Popen([flatc, "-t", "--raw-binary", "-o", output_path, fbs, "--", input], stdout=subprocess.PIPE)
    code = child.wait()
    if code != 0:
        raise Exception("failed to flatc -t --raw-binary -o [output-path] [fbs] -- [input]")

def convert_json_to_cjo(flatc, input, output_path, fbs):
    child = subprocess.Popen([flatc, "-b", "-o", output_path, fbs, input], stdout=subprocess.PIPE)
    code = child.wait()
    if code != 0:
        raise Exception("failed to flatc -b -o [output-path] [fbs] [input]")

def parse_args(args):
    parser = optparse.OptionParser()
    parser.add_option('--flatc', help='flatc path')
    parser.add_option('--fbs', help='schema.fbs path')
    parser.add_option('--input', help='cjo or json path')
    parser.add_option('--output-path', help='output path')
    options, _ = parser.parse_args(args)
    return options


def main(argv):
    options = parse_args(argv)
    if not options.input.endswith("cjo") and not options.input.endswith("json"):
        raise Exception("input is invalid, only support xxx.cjo or xxx.json.")
    if not os.path.exists(options.output_path):
        os.makedirs(options.output_path)
    
    if options.input.endswith("cjo"):
        convert_cjo_to_json(options.flatc_path, options.input, options.output_path, options.fbs)
    else:
        convert_json_to_cjo(options.flatc_path, options.input, options.output_path, options.fbs)


# 从指定的输入路径复制文件到输出路径，并在复制过程中 排除特定的文件夹。
if __name__ == "__main__":
    exit(main(sys.argv))
