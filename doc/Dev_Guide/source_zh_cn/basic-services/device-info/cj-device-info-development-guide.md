# 设备信息开发指导

## 简介

设备信息模块提供终端设备信息查询的接口。通过该模块，开发者可以获取设备类型信息、设备生产厂家信息、系统软件API版本信息以及设备udid信息等。

## 场景介绍

主要场景有：

- 获取当前设备类型信息
- 获取系统版本
- 获取系统软件API版本信息

## 接口说明

完整的仓颉 API 说明以及实例代码请参见：[设备信息接口](../../API_Reference/source_zh_cn/apis/BasicServicesKit/cj-apis-device_info.md)。

具体接口说明如下表。

| 接口名 | 功能描述 |
| ------------------------------------------ | ----------------------------------------------------------- |
| DeviceInfo.deviceType | 获取设备类型 |
| DeviceInfo.osFullName | 获取系统版本，版本格式OpenHarmony-x.x.x.x,x为数值 |
| DeviceInfo.productModel | 获取认证型号。 |
| DeviceInfo.brand | 获取设备品牌名称。 |
| DeviceInfo.udid | 获取设备udid |
| DeviceInfo.buildRootHash | 获取构建版本Hash |
| DeviceInfo.buildTime | 获取构建时间 |
| DeviceInfo.buildHost | 获取构建主机 |
| DeviceInfo.buildUser | 获取构建用户 |
| DeviceInfo.buildType | 获取构建类型 |
| DeviceInfo.sdkApiVersion | 获取系统软件API版本 |
| DeviceInfo.serial | 获取设备序列号SN(Serial Number) |
| DeviceInfo.marketName | 获取外部产品系列 |
| DeviceInfo.ODID | 获取开发者匿名设备标识符 |
| DeviceInfo.distributionOSName | 获取发行版系统名称 |
| DeviceInfo.distributionOSVersion | 获取发行版系统版本号 |
| DeviceInfo.distributionOSApiVersion | 获取发行版系统api版本 |
| DeviceInfo.distributionOSReleaseType | 获取发行版系统类型 |


## 开发示例

以下示例演示了如何使用设备信息模块查询设备信息。

### 获取设备信息

以下示例代码演示了如何获取设备信息。

<!-- compile -->

```cangjie
// index.cj
import kit.BasicServicesKit.*
import ohos.base.*

func getDeviceInfo(): Unit {
// index.cj

import kit.BasicServicesKit.*
import kit.PerformanceAnalysisKit.*

let osFullName = DeviceInfo.osFullName
Hilog.info(0, "deviceinfo", "the value of the osFullName is: :${osFullName}")

let sdkApiVersion = DeviceInfo.sdkApiVersion
Hilog.info(0, "deviceinfo", "the value of the sdkApiVersionis : :${sdkApiVersion}")

let marketName = DeviceInfo.marketName
Hilog.info(0, "deviceinfo", "the value of the marketName is: :${marketName}")
}
```
