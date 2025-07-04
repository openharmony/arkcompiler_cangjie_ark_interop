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

import os
import re


def get_cangjie_package_name(cangjie_file: str) -> str:
    pattern = "package\s+(\S+)\s*"

    with open(cangjie_file, "r") as f:
        content = f.read()
        match_obj = re.search(pattern, content)
        if match_obj:
            return match_obj.group(1)
    raise Exception(f"{cangjie_file} failed to find package name!")


def get_all_cjpm_dir(dir_name, extension=".cj"):
    walk_nodes = os.walk(dir_name)
    result = {}
    for path, dir_list, file_list in walk_nodes:
        for file_name in file_list:
            if file_name.endswith(extension):
                # src 特殊处理
                cjpm_path = path
                cjpm_toml_src_dir = '.'
                if result.get(path):
                    continue
                if path.endswith("src"):
                    cjpm_path = os.path.dirname(path)
                    cjpm_toml_src_dir = "src"
                cjpm_toml_name = get_cangjie_package_name(os.path.join(path, file_name))
                result[path] = {
                    "src_dir": cjpm_toml_src_dir,
                    "name": cjpm_toml_name,
                    "cjpm_path": cjpm_path
                }
                print(f"{cjpm_path} => src_dir:{cjpm_toml_src_dir}  name:{cjpm_toml_name}")
    return result


def create_cjpm_toml_files(cjpm_info_dict: dict):
    # 定义cjpm.toml的固定内容
    toml_content = '''[dependencies]

[package]
  cjc-version = "0.61.4"
  compile-option = ""
  description = "nothing here"
  link-option = ""
  name = "{name}"
  output-type = "dynamic"
  override-compile-option = ""
  src-dir = "{src_dir}"
  target-dir = ""
  version = "1.0.0"
  package-configuration = {{}}
'''
    for _, toml in cjpm_info_dict.items():
        file_path = os.path.join(toml["cjpm_path"], 'cjpm.toml')
        content = toml_content.format(name=toml["name"], src_dir=toml["src_dir"])
        with open(file_path, 'w') as f:
            f.write(content)


def create_workspace_cjpm_toml(cjpm_info_dict: dict, base_path):
    members_str = ""
    for v in cjpm_info_dict.values():
        cjpm_path: str = v["cjpm_path"]
        members_str += f"\n    \"{cjpm_path}\","
    members_str = members_str.rstrip(',')
    toml_content = f'''[dependencies]

[workspace]
  build-members = []
  compile-option = ""
  link-option = ""
  members = [{members_str}
  ]
  override-compile-option = ""
  target-dir = ""
  test-members = []
'''
    file_path = os.path.join(base_path, 'cjpm.toml')
    print(file_path)
    with open(file_path, 'w') as f:
        f.write(toml_content)


if __name__ == '__main__':
    """
    PS: 最好配置下全局git ignore 忽略cjpm.toml, 下面步骤
    1. 创建 ~/global_ignore文件，内容为：
    !.gitkeep
    *.macrocall
    **/.cache/
    .vscode/
    **/.vscode/
    **/*.cj.macrocall
    .mm
    **/.mm/
    **/cjpm.toml

    2. 输入命令行 git config --global core.excludesfile `realpath ~/global_ignore`
    """
    py_path = os.path.split(os.path.realpath(__file__))[0]
    dir_info = get_all_cjpm_dir(f"{py_path}/api")
    create_cjpm_toml_files(dir_info)
    create_workspace_cjpm_toml(dir_info, py_path)
