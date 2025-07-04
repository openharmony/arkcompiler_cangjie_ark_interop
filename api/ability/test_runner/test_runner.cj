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

package ohos.test_runner

import std.collection.*
import ohos.ffi.*
import ohos.labels.*

@C
struct CJTestRunnerFuncs {
    CJTestRunnerFuncs(
        let createTestRunner: CFunc<(CString) -> Int64>,
        let releaseTestRunner: CFunc<(Int64) -> Unit>,
        let testRunnerOnRun: CFunc<(Int64) -> Unit>,
        let testRunnerOnPrepare: CFunc<(Int64) -> Unit>
    ) {}
}

@C
func createTestRunner(name: CString): Int64 {
    let optTestRunner = TestRunner.create(name.toString())
    match (optTestRunner) {
        case None =>
            TEST_RUNNER_LOG.error("Failed to load TestRunner: " + name.toString())
            0
        case Some(testRunner) =>
            FFIDataManager.getInstance().register(testRunner)
            testRunner.getID()
    }
}

@C
func releaseTestRunner(id: Int64): Unit {
    let optTestRunner = FFIDataManager.getInstance().getData<TestRunner>(id)
    match (optTestRunner) {
        case None =>
            TEST_RUNNER_LOG.error("No such TestRunner: " + id.toString())
            throw Exception("No such TestRunner: " + id.toString())
        case Some(testRunner) => TEST_RUNNER_LOG.info("Release abilityContext end")
    }
    FFIDataManager.getInstance().releaseData(id)
    TEST_RUNNER_LOG.info("Release ability end")
}

@C
func testRunnerOnRun(id: Int64): Unit {
    let optTestRunner = FFIDataManager.getInstance().getData<TestRunner>(id)
    match (optTestRunner) {
        case None =>
            TEST_RUNNER_LOG.error("No such TestRunner: " + id.toString())
            throw NoneValueException("No such TestRunner: " + id.toString())
        case Some(testRunner) => testRunner.onRun()
    }
}

@C
func testRunnerOnPrepare(id: Int64): Unit {
    let optTestRunner = FFIDataManager.getInstance().getData<TestRunner>(id)
    match (optTestRunner) {
        case None =>
            TEST_RUNNER_LOG.error("No such TestRunner: " + id.toString())
            throw NoneValueException("No such TestRunner: " + id.toString())
        case Some(testRunner) => testRunner.onPrepare()
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public open class TestRunner <: FFIData {
    private static let CREATORS = HashMap<String, () -> TestRunner>()

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public static func registerCreator(name: String, creator: () -> TestRunner): Unit {
        let optCreator = CREATORS.get(name)
        match (optCreator) {
            case None =>
                CREATORS.add(name, creator)
                TEST_RUNNER_LOG.info("Register creator of " + name + " successfully.")
            case Some(creatorFunc) => TEST_RUNNER_LOG.error(
                "Repeated registration for TestRunner in " + name + ", please check.")
        }
    }

    // protected function: available only for this package.
    static func create(name: String): Option<TestRunner> {
        let optCreator = CREATORS.get(name)
        match (optCreator) {
            case None =>
                TEST_RUNNER_LOG.error("No such create functions for Ability: " + name)
                Option<TestRunner>.None
            case Some(creator) => creator()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func onRun(): Unit {}
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func onPrepare(): Unit {}
}

@C
func testRunnerCjFuncsRegister(result: CPointer<CJTestRunnerFuncs>): Unit {
    let atCFuncs = CJTestRunnerFuncs(
        createTestRunner,
        releaseTestRunner,
        testRunnerOnRun,
        testRunnerOnPrepare
    )
    unsafe { result.write(atCFuncs) }
}

foreign func RegisterCJTestRunnerFuncs(funcs: CFunc<(CPointer<CJTestRunnerFuncs>) -> Unit>): Unit

let REGISTER_TESTRUNNER = unsafe { RegisterCJTestRunnerFuncs(testRunnerCjFuncsRegister) }
