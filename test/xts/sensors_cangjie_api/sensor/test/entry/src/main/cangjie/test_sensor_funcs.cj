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


package ohos_app_cangjie_entry

import std.unittest.testmacro.*
import std.math.*
import kit.SensorServiceKit.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import ohos.base.*
import ohos.business_exception.*
import kit.PerformanceAnalysisKit.Hilog

@Test
class TestSensorGetGeomagneticInfo {
    let GEOMAGNETIC_COMPONENT_YEAR_RESULT: Array<Array<Float32>> = [
        [6570.3935546875, -146.3289337158203, 54606.0078125, -1.2758207321166992, 83.13726043701172, 6572.02294921875,
            55000.0703125],
        [6554.17041015625, -87.19947052001953, 54649.078125, -0.7622424364089966, 83.16046905517578, 6554.75048828125,
            55040.7734375],
        [6537.99169921875, -28.231582641601562, 54692.02734375, -0.24740631878376007, 83.18303680419922, 6538.052734375,
            55081.4296875],
        [6521.81201171875, 30.73670768737793, 54734.97265625, 0.2700277864933014, 83.20502471923828, 6521.88427734375,
            55122.15625],
        [6505.6328125, 89.70511627197266, 54777.90625, 0.7899921536445618, 83.22642517089844, 6506.2509765625,
            55162.9453125]
    ]


    @TestCase
    @Tag[APILevel19, TestLevel0]
    func test_GetGeomagneticInfo_BasicFunction_Success(): Unit {
        let timeMillis = [1580486400000, 1612108800000, 1643644800000, 1675180800000, 1706716800000]

        var index: Int64 = 0
        for (time in timeMillis) {

            index++
        }
    }
}

const getGeomagneticDipResult: VArray<Float32, $4> = [0.8760581016540527, 0.862170, -953042337792.0, 44330.0]

extend Sensor {
    public operator func ==(other: Sensor): Bool {
        this.sensorId == other.sensorId && this.sensorName == other.sensorName && this.vendorName == other.vendorName &&
            this.firmwareVersion == other.firmwareVersion && this.hardwareVersion == other.hardwareVersion &&
            this.maxRange == other.maxRange && this.minSamplePeriod == other.minSamplePeriod && this.maxSamplePeriod == other
            .maxSamplePeriod && this.precision == other.precision && this.power == other.power
    }

    public operator func !=(other: Sensor): Bool {
        !(this == other)
    }
}

@Test
class TestSensorGetSensorList {
    /*
    * @tc.number    : Sub_Cangjie_Sensor_TestSensorGetGeomagneticInfo_1200
    * @tc.name      : test_GetSensorList_BasicFunction_Success
    * @tc.desc      : test Sensor test_GetSensorList_BasicFunction_Success
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel19, TestLevel0]
    func test_GetSensorList_BasicFunction_Success(): Unit {
        sleepFor(1.second) // wait for sensor init
        let sensors = getSensorList()
        @Expect(sensors.size > 0)
    }

    /*
    * @tc.number    : Sub_Cangjie_Sensor_TestSensorGetGeomagneticInfo_1300
    * @tc.name      : test_GetSingleSensor_NotSupportSensor_ThrowException
    * @tc.desc      : test Sensor test_GetSingleSensor_NotSupportSensor_ThrowException
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel19, TestLevel0]
    func test_GetSingleSensor_NotSupportSensor_ThrowException(): Unit {
        try {
            getSingleSensor(SensorId.Gravity)
        } catch (e: BusinessException) {
            @Expect(e.code, 14500102)
        }
    }
}
