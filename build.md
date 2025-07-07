# 分仓构建方案

## mac_aarch64




## linux

https://gitee.com/openharmony/manifest/pulls/2375

https://gitee.com/openharmony/build/pulls/5610



## cangjie路径
cjc_cangjie_sdk_path = "//prebuilts/cangjie-compiler"
cjc_cangjie_compiler_home_path = ""
if (is_mingw) {
 cjc_cangjie_compiler_home_path = "${cjc_cangjie_sdk_path}/windwos-x64/cangjie"
} else if (is_mac) {
if (host_cpu == "arm64") {
  cjc_cangjie_compiler_home_path = "${cjc_cangjie_sdk_path}/mac-aarch64/cangjie"
} else if (host_cpu == "x64") {
  cjc_cangjie_compiler_home_path = "${cjc_cangjie_sdk_path}/mac-x64/cangjie"
}
} else if (is_linux) {
  cjc_cangjie_compiler_home_path = "${cjc_cangjie_sdk_path}/linux-x64/cangjie"
} else {
  print("unsupported platform ${target_cpu}, is_mingw=${is_mingw}, is_mac=${is_mac}, host_cpu=${host_cpu}")
  assert(false && "unsupported platform ${target_cpu}, is_mingw=${is_mingw}, is_mac=${is_mac}, host_cpu=${host_cpu}")
}