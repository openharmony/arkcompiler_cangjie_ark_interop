# 分仓构建方案

## SDK 构建
https://gitee.com/openharmony/manifest/pulls/2375
https://gitee.com/openharmony/build/pulls/5610



## ROM构建



## prebults cangjie路径
"//prebuilts/cangjie_sdk"
cangjie_home =>  //prebuilts/cangjie_sdk/mac-aarch64/cangjie
flatc 工具路径 => //prebuilts/cangjie_sdk/mac-aarch64/tools/flatc

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