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
import sys
import os


def get_sources(dir, relative, extension):
    walk_nodes = os.walk(dir)
    result = []
    for path, dir_list, file_list in walk_nodes:
        for file_name in file_list:
            if file_name.endswith(extension):
                file_path = os.path.join(path, file_name)
                result.append(os.path.relpath(file_path, relative))
    return "\n".join(result)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--source_dir', required=True)
    parser.add_argument('--relate_dir', required=True)
    parser.add_argument("--extension", default="cj")
    args = parser.parse_args()
    extension = ".{}".format(args.extension)
    result = get_sources(args.source_dir, args.relate_dir, extension)
    sys.stdout.write(result)
    return 0

if __name__ == '__main__':
    sys.exit(main())