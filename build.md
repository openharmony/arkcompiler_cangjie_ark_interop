# wsl/ubuntu 版本仓颉分仓构建方案

## 提前准备

### 手动下载cangjie sdk 构建工具链
1. 下载
从 https://gitcode.com/Cangjie/cangjie-ci-test/releases/0.61.10-OHOS

下载后放到指定目录
cangjie-linux-x64-0.61.10.zip  =>  //prebuilts/cangjie_sdk/linux-x64/cangjie
cangjie-windows-x64-0.61.10.zip =>  //prebuilts/cangjie_sdk/windows-x64/cangjie
cangjie-tools-linux-x64.zip => prebuilts/cangjie_sdk/linux-x64/tools

➜  cangjie_sdk tree -L 2
prebuilts/cangjie_sdk
├── linux-x64
│   ├── cangjie
│   └── tools
├── mac-aarch64
│   ├── cangjie
│   └── tools
├── mac-x64
│   ├── cangjie
│   └── tools
└── windows-x64
    ├── cangjie
    └── tools

### 下载构建仓颉社区仓

## SDK 构建
https://gitee.com/openharmony/manifest/pulls/2375
https://gitee.com/openharmony/build/pulls/5610

### 构建命令行
 ./build.sh --product-name ohos-sdk --gn-args full_mini_debug=false --keep-ninja-going --gn-args is_use_check_deps=false --gn-args=sdk_build_public=true -ccache --build-target out/sdk/gen/build/ohos/sdk:cangjie

## ROM构建
