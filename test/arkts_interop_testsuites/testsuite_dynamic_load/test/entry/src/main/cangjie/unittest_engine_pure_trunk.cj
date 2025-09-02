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

import ohos.test_runner.TestRunner
import ohos.hilog.HilogChannel
import ohos.ability_delegator_registry.AbilityDelegatorRegistry
import std.unittest.XmlReporter
import std.collection.filter
import std.fs
import std.collection.first
import std.collection.{forEach, none}
import std.convert.Parsable
import ohos.bundle_manager.BundleManager
import ohos.bundle_manager.BundleFlag
import std.collection.any
import std.collection.HashMap
import std.unittest.TestClass
import std.collection.HashSet
import std.collection.ArrayList
import std.unittest.TestSuite
import ohos.ability.Want
import std.process.Process
import ohos.ui_test.UITest
import ohos.component.Line
import std.unittest.common.Configuration
import ohos.ark_interop.*
import ohos.state_manage.AppStorage
import std.sync.*
import ohos.ui_test.*
import stdx.encoding.json.*
import ohos.component.{getInspectorByKey}
import ohos.ui_test
import std.time.DateTime
import ohos.file_fs.FileFs
import std.unittest.testmacro.*
import std.unittest.*
import std.unittest.common.*
import ohos.ability.AbilityContext
import ohos.ability.AbilityStageContext
import ohos.bundle_manager.BundleInfo
import ohos.ability_access_ctrl.Permissions
import ohos.ability_access_ctrl.AbilityAccessCtrl
import ohos.ability_access_ctrl.GrantStatus
import ohos.ability.getStageContext
import std.collection.collectArray
import ohos.resource_manager.ResourceManager
import ohos.ark_interop_helper.StageContext
import ohos.ability.ApplicationContext
import ohos.window.Window
import ohos.window.WindowStage
import ohos.window.WindowStage

let logger = HilogChannel(0, 0, "WBT_")

class OpenHarmonyTestRunner <: TestRunner {
    public let testDriver: () -> Unit
    public let testName: String
    private static var _driver: ?ui_test.Driver = None
    public static prop driver: ui_test.Driver {
        get() {
            match (OpenHarmonyTestRunner._driver) {
                case None =>
                    let newDriver = ui_test.Driver.create()
                    OpenHarmonyTestRunner._driver = newDriver
                    newDriver
                case Some(driver) => driver
            }
        }
    }
    public init(testName: String, testDriver: () -> Unit) {
        this.testDriver = testDriver
        this.testName = testName
    }
    public func onRun(): Unit {
        this.testDriver()
    }

    public func onPrepare() {
        logger.info("CJTestRunner onPrepare")
    }
}

let testList = ArrayList<() -> Unit>()

public interface UnitExtension {
    prop second: Duration
    prop milliSecond: Duration
}

extend Int64 <: UnitExtension {
    public prop second: Duration {
        get() {
            Duration.second * this
        }
    }
    public prop milliSecond: Duration {
        get() {
            Duration.millisecond * this
        }
    }
}

extend Float64 <: UnitExtension {
    public prop second: Duration {
        get() {
            Duration.second * this
        }
    }
    public prop milliSecond: Duration {
        get() {
            Duration.millisecond * this
        }
    }
}

public func sleepFor(someDuration: Duration): Unit {
    sleep(someDuration)
}

func getTestDriver(testName: String, testClassGenerator: () -> TestClass): () -> Unit {
    {
        =>
        let testClass = testClassGenerator()
        let testSuite = testClass.asTestSuite()
        let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
        let want = Want(bundleName: "com.example.myapplication", abilityName: "EntryAbility")
        delegator.startAbility(want).get()
        UITest.setup()
        spawn {
            try {
                sleepFor(3.second)
                testSuite.runTests().reportTo(XmlReporter(fs.Path("/data/storage/el1/base")))
                match (fs.Directory.readFrom("/data/storage/el1/base/tests") |>
                    filter<fs.FileInfo> {
                    fileInfo: fs.FileInfo => fileInfo.name == "test-default.${testName}.xml"
                } |> first) {
                    case None => throw Exception("not found")
                    case Some(fileInfo) =>
                        delegator.print("testDriver3")

                        let filePath = fileInfo.path.toString()
                        delegator.print("testDriver4")
                        FileFs.readText(filePath).split("\n", removeEmpty: true) |> forEach(logger.error<String>)
                        delegator.print("testDriver5")
                }
            } catch (e: Exception) {
                let sb = StringBuilder("An exception uncaught by unittest framework has occurred:\n${e.toString()}\n")
                e.getStackTrace() |>
                    forEach<StackTraceElement> {
                    s: StackTraceElement => sb.append(
                        "         at ${s.declaringClass}.${s.methodName}(${s.fileName}:${s.lineNumber})\n")
                }
                logger.error(sb.toString())
            }
            let _ = fs.File(
                fs.Path("/data/storage/el1/base/test_all_done"),
                fs.OpenMode.ReadWrite
            )
            delegator.finishTest("unittest done", 0)
        }
    }
}

func registerTestSuite(testName: String, testClassGenerator: () -> TestClass) {
    let testDriver = getTestDriver(testName, testClassGenerator)
    TestRunner.registerCreator(testName) {
        => OpenHarmonyTestRunner(testName, testDriver)
    }
    testList.add(testDriver)
}

public enum Result<T, E> {
    | Ok(T)
    | Err(E)
}

public func await<T>(jsContext: JSContext, f: () -> T): T {
    let result = Box(None<Result<T, Exception>>)
    let monitor = Monitor()
    jsContext.postJSTask {
        => result.value = try {
            Result.Ok(f())
        } catch (e: Exception) {
            Result.Err(e)
        } finally {
            synchronized(monitor) {
                monitor.notify()
            }
        }
    }
    synchronized(monitor) {
        monitor.wait(timeout: Duration.second * 6)
    }
    match (result.value) {
        case None => throw Exception("await timeout")
        case Some(result) => match (result) {
            case Ok(value) => value
            case Err(err) => throw err
        }
    }
}

public func pressBack(): Unit {
    let driver = OpenHarmonyTestRunner.driver
    driver.pressBack()
}

public abstract class UiComponentNotFound <: Exception {
    public UiComponentNotFound(message: String) {
        super(message)
    }
}

public class UiComponentNotFoundById <: UiComponentNotFound {
    public UiComponentNotFoundById(id: String) {
        super("ui component not found by id \"${id}\"")
    }
}

public class UiComponentNotFoundByText <: UiComponentNotFound {
    public UiComponentNotFoundByText(text: String) {
        super("ui component not found by text \"${text}\"")
    }
}

public class AmbiguousUiComponentsFound <: Exception {
    public AmbiguousUiComponentsFound() {
        super("ambiguous ui components were found.")
    }
}

public class Screen {
    public static func findAllUiComponentsWhoseIdEqualsTo(id: String): Array<UiComponent> {
        let driver = OpenHarmonyTestRunner.driver
        let uiComponents = ArrayList<UiComponent>()
        try {
            let result = driver.findComponents(ui_test.On().id(id))
            result |> forEach<ui_test.UIComponent> {c => uiComponents.add(HybridUiComponent(c))}
        } catch (e: Exception) {
            //            logger.error(e.stackTrace)
        }
        uiComponents.toArray()
    }
    public static func findTheOnlyUiComponentWhoseIdEqualsTo(id: String): Option<UiComponent> {
        let uiComponents = Screen.findAllUiComponentsWhoseIdEqualsTo(id)
        match (uiComponents.size) {
            case 0 => None
            case 1 => uiComponents[0]
            case _ => throw AmbiguousUiComponentsFound()
        }
    }
    public static func getTheOnlyUiComponentWhoseIdEqualsTo(id: String): UiComponent {
        match (findTheOnlyUiComponentWhoseIdEqualsTo(id)) {
            case Some(uiComponent) => uiComponent
            case None => throw UiComponentNotFoundById(id)
        }
    }
    public static func findAllUiComponentsWhoseTextEqualsTo(someText: String): Array<UiComponent> {
        let driver = OpenHarmonyTestRunner.driver
        let uiComponents = ArrayList<UiComponent>()
        try {
            let result = driver.findComponents(ui_test.On().text(someText))
            result |> forEach<ui_test.UIComponent> {c => uiComponents.add(HybridUiComponent(c))}
        } catch (e: Exception) {
            //            logger.error(e.stackTrace)
        }
        uiComponents.toArray()
    }
    public static func findTheOnlyUiComponentWhoseTextEqualsTo(someText: String): Option<UiComponent> {
        let uiComponents = Screen.findAllUiComponentsWhoseTextEqualsTo(someText)
        match (uiComponents.size) {
            case 0 => None
            case 1 => uiComponents[0]
            case _ => throw AmbiguousUiComponentsFound()
        }
    }
    public static func getTheOnlyUiComponentWhoseTextEqualsTo(someText: String): UiComponent {
        match (findTheOnlyUiComponentWhoseTextEqualsTo(someText)) {
            case Some(uiComponent) => uiComponent
            case None => throw UiComponentNotFoundById(someText)
        }
    }
}

public class UiComponentTree {
    public static func findAllUiComponentsWhoseIdEqualsTo(id: String): Array<UiComponent> {
        []
    }
    public static func findTheOnlyUiComponentWhoseIdEqualsTo(id: String): Option<UiComponent> {
        match (Screen.findTheOnlyUiComponentWhoseIdEqualsTo(id)) {
            case Some(uiComponent) => uiComponent
            case None => UiComponentById(id)
        }
    }
    public static func getTheOnlyUiComponentWhoseIdEqualsTo(id: String): UiComponent {
        match (findTheOnlyUiComponentWhoseIdEqualsTo(id)) {
            case Some(uiComponent) => uiComponent
            case None => throw UiComponentNotFoundById(id)
        }
    }
}

public func enterPage(scrollerId!: String, buttonId!: String): Unit {
    let scroller = Screen.getTheOnlyUiComponentWhoseIdEqualsTo(scrollerId)
    for (_ in 0..100) {
        if (let Some(button) <- Screen.findTheOnlyUiComponentWhoseIdEqualsTo(buttonId)) {
            click(at: button.centerPoint)
            sleep(Duration.second * 1)
            break
        }
        swipe(
            from: scroller.centerPoint,
            to: Point(
                scroller.centerPoint.x,
                scroller.centerPoint.y - 80
            )
        )
    }
}

public func click(at!: Point): Unit {
    let driver = OpenHarmonyTestRunner.driver
    driver.click(at.x, at.y)
}

public func swipe(from!: Point, to!: Point): Unit {
    let driver = OpenHarmonyTestRunner.driver
    driver.swipe(from.x, from.y, to.x, to.y)
}

public interface UiComponent <: Hashable & Equatable<UiComponent> {
    prop centerPoint: Point
    func getAttribute(remainingAttributePath: String, remainingAttributeObject: JsonObject): JsonValue {
        match (remainingAttributePath.indexOf(".")) {
            case Some(indexOfFirstDot) => match (remainingAttributeObject.get(remainingAttributePath[..indexOfFirstDot])) {
                case None => throw Exception("属性${remainingAttributePath}未找到")
                case Some(result) => getAttribute(remainingAttributePath[indexOfFirstDot + 1..], result.asObject())
            }
            case None => match (remainingAttributeObject.get(remainingAttributePath)) {
                case None => throw Exception("属性${remainingAttributePath}未找到")
                case Some(result) => result
            }
        }
    }
    func getAttribute(attributePath: String): String {
        let inspectorInfoJsonString = getInspectorByKey(this.id.toString())
        if (inspectorInfoJsonString.isEmpty()) {
            throw Exception("UI组件树上未找到任何组件ID为\"${this.id}\"的UI组件")
        }
        let inspectorInfo = JsonValue.fromStr(inspectorInfoJsonString).asObject()
        let result = getAttribute(
            attributePath,
            inspectorInfo.get("$attrs").getOrThrow().asObject()
        )
        match (result.kind()) {
            case JsonKind.JsString => result.asString().toString()
            case _ => result.toString()
        }
    }
    func dump(): Unit {
        let info = StringBuilder()
        let inspectorInfoJsonString = getInspectorByKey(this.id.toString())
        let inspectorInfo = JsonValue.fromStr(inspectorInfoJsonString).asObject()
        info.append("start====${this.id}====\n")
        inspectorInfo.get("$attrs").getOrThrow().asObject().getFields() |>
            forEach {
            attribute =>
            let attributeName = attribute[0]
            let attributeValue = attribute[1].toString()
            info.append("${attributeName}-${attributeValue}\n")
        }
        info.append("end====${this.id}====\n")
        logger.error(info.toString())
    }
    operator func [](attributePath: String): String {
        getAttribute(attributePath)
    }
    prop text: String
    prop id: String
    func hashCode(): Int64 {
        this.id.hashCode()
    }
    operator func ==(anotherUiComponent: UiComponent): Bool {
        this.hashCode() == anotherUiComponent.hashCode()
    }
    operator func !=(anotherUiComponent: UiComponent): Bool {
        this.hashCode() != anotherUiComponent.hashCode()
    }
    func perform(action: MyAction): Unit {
        action.bePerformedOn(this)
    }
}

public class MyAction {
    public MyAction(public let bePerformedOn: (UiComponent) -> Unit) {}
}

public func click(): MyAction {
    MyAction {uiComponent: UiComponent => click(at: uiComponent.centerPoint)}
}

public class UiComponentById <: UiComponent {
    public UiComponentById(public let _id: String) {}
    public prop centerPoint: Point {
        get() {
            throw Exception("the ui component with id \"${this._id}\" is not shown.")
        }
    }
    public prop text: String {
        get() {
            throw Exception("the ui component with id \"${this._id}\" is not shown.")
        }
    }
    public prop id: String {
        get() {
            this._id
        }
    }
}

public open class HybridUiComponent <: UiComponent {
    public HybridUiComponent(public let _uiComponent: ui_test.UIComponent) {}
    public prop centerPoint: Point {
        get() {
            let a = this._uiComponent.getBoundsCenter()
            Point(Int32(a.x), Int32(a.y))
        }
    }
    public prop text: String {
        get() {
            this._uiComponent.getText()
        }
    }
    public prop id: String {
        get() {
            this._uiComponent.getId()
        }
    }
}

public class Point <: ToString {
    public Point(public let x: Int32, public let y: Int32) {}
    public func toString(): String {
        "Point[${this.x}, ${this.y}]"
    }
}

extend Exception {
    public prop stackTrace: String {
        get() {
            let sb = StringBuilder("exception: ${this.toString()}\n")
            this.getStackTrace() |>
                forEach {
                s => sb.append("         at ${s.declaringClass}.${s.methodName}(${s.fileName}:${s.lineNumber})\n")
            }
            sb.toString()
        }
    }
}

public class Event {
    public Event(public let timeStamp: DateTime, public let name: String, public let content: String) {}
}

public class LogManager {
    public let eventSequence = ArrayList<Event>()
    public let eventMap = HashMap<String, Event>()
    private let mutex = Mutex()
    public func appendEvent(event: Event): Unit {
        synchronized(this.mutex) {
            this.eventSequence.add(event)
            this.eventMap.add(event.name, event)
        }
    }
    public func findEventWithName(eventName: String): Option<Event> {
        synchronized(this.mutex) {
            match (this.eventMap.get(eventName)) {
                case None => None
                case Some(event) => event
            }
        }
    }
}

public let logManager = LogManager()

public func logEvent(eventName: String, eventContent: String): Unit {
    let timeStamp = DateTime.now()
    let event = Event(timeStamp, eventName, eventContent)
    logManager.appendEvent(event)
    logger.info("[${eventName}]: ${eventContent}")
}

public func waitForEventWithName(eventName: String, timeOut!: Duration = Duration.Max, processor!: (Event) -> Unit): Unit {
    let monitor = Monitor()
    let result = Box(None<Event>)
    let checker = Timer.repeat(Duration.Zero, Duration.millisecond * 1,
        {
            => match (logManager.findEventWithName(eventName)) {
                case None => ()
                case Some(event) =>
                    result.value = event
                    synchronized(monitor) {
                        monitor.notify()
                    }
            }
        })
    synchronized(monitor) {
        monitor.wait(timeout: timeOut)
    }
    checker.cancel()
    match (result.value) {
        case None => @Assert("timed out after ${timeOut}." == "xxx")
        case Some(event) => processor(event)
    }
}

public func getAbilityContext(): AbilityContext {
    match (AppStorage.get<AbilityContext>("abilityContext")) {
        case None => throw Exception("failed to get ability context")
        case Some(abilityContext) => abilityContext
    }
}

public func getAbilityStageContext(): AbilityStageContext {
    match (AppStorage.get<AbilityStageContext>("abilityStageContext")) {
        case None => throw Exception("failed to get ability stage context")
        case Some(abilityStageContext) => abilityStageContext
    }
}

func getFullBundleInfo(): BundleInfo {
    let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION.getValue() | GET_BUNDLE_INFO_WITH_HAP_MODULE.getValue(
    ) | GET_BUNDLE_INFO_WITH_ABILITY.getValue() | GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY.getValue() |
        GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION.getValue() | GET_BUNDLE_INFO_WITH_METADATA.getValue() |
        GET_BUNDLE_INFO_WITH_DISABLE.getValue() | GET_BUNDLE_INFO_WITH_SIGNATURE.getValue() |
        GET_BUNDLE_INFO_WITH_MENU.getValue()
    BundleManager.getBundleInfoForSelf(bundleFlags)
}

public func getRequiredPermissions(requiredPermissions: Array<Permissions>) {
    let bundleInfo = BundleManager.getBundleInfoForSelf(GET_BUNDLE_INFO_WITH_APPLICATION.getValue())
    let applicationInfo = bundleInfo.appInfo
    let accessTokenId = applicationInfo.accessTokenId
    let requestedPermissions = HashSet<Permissions>()
    let accessTokenManager = AbilityAccessCtrl.createAtManager()
    for (permission in requiredPermissions) {
        let permissionGrantState = accessTokenManager.checkAccessToken(UInt32(accessTokenId), permission)
        match (permissionGrantState) {
            case GrantStatus.PERMISSION_GRANTED => logger.error("权限${permission}已被授予，无需申请")
            case GrantStatus.PERMISSION_DENIED =>
                logger.error("权限${permission}尚未被授予，需要用户弹窗授予")
                requestedPermissions.add(permission)
            case _ => ()
        }
    }
    let numberOfRequestedPermissions = requestedPermissions.size
    if (numberOfRequestedPermissions == 0) {
        logger.error("无需向用户申请任何权限")
        return
    }
    let stageContext = getStageContext(getAbilityContext())
    accessTokenManager.requestPermissionsFromUser(stageContext, requestedPermissions |> collectArray) {
        error, data => match (error) {
            case Some(err) => logger.error("弹窗权限申请发生内部错误，错误码${err.code}")
            case None => match (data) {
                case Some(permissionRequestResult) => for (index in 0..numberOfRequestedPermissions) {
                    let grantStatus = permissionRequestResult.authResults[index]
                    let permissionName = permissionRequestResult.permissions[index]
                    match (grantStatus) {
                        case 0 =>
                            logger.error("权限${permissionName.toString()}即将被用户授予")

                            logger.error("权限${permissionName.toString()}已被用户授予")
                        case -1 => logger.error("用户拒绝授予权限${permissionName.toString()}")
                        case _ => logger.error("unreachable")
                    }
                }
                case None => logger.error("???")
            }
        }
    }
}

public func getResourceManager(): ResourceManager {
    ResourceManager.getResourceManager(getStageContext(getAbilityContext()))
}

public func getStageContext(): StageContext {
    getStageContext(getAbilityContext())
}

public func waitFor(timeOut: Duration, f: () -> Bool): Unit {
    let monitor = Monitor()
    let result = Box(None<Bool>)
    let checker = Timer.repeat(Duration.Zero, Duration.millisecond * 1,
        {
            => if (f()) {
                synchronized(monitor) {
                    monitor.notify()
                }
            }
        })
    synchronized(monitor) {
        monitor.wait(timeout: timeOut)
    }
    checker.cancel()
    match (result.value) {
        case None => throw Exception("timed out after ${timeOut}.")
        case Some(event) => @Assert(event)
    }
}

public func getApplicationContext(): ApplicationContext {
    getAbilityContext().getApplicationContext()
}

public func pick<T>(p: (T) -> Bool): (Iterable<T>) -> T {
    {
        a: Iterable<T> =>
        for (i in a) {
            if (p(i)) {
                return i
            }
        }
        throw Exception("not found")
    }
}

public func getMainWindow(): Window {
    getWindowStage().getMainWindow()
}

public func getWindowStage(): WindowStage {
    match (AppStorage.get<WindowStage>("windowStage")) {
        case None => throw Exception("failed to get window stage")
        case Some(windowStage) => windowStage
    }
}
