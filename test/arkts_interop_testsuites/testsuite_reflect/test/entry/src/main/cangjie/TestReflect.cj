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

/**
 * Created on 2025/5/26
 */
package ohos_app_cangjie_entry

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import std.reflect.*
import dependency.*

@Annotation
public class MyAnnotation {
    public const MyAnnotation(public let p0: Int64, public let p1: ClassType0, public let p2: StructType0,
        public let p3: InterfaceType) {}
}

@MyAnnotation[114514, ClassType0(), StructType0(), 114514i32]
public class ClassType {
    public ClassType(public let p0: Int64) {}
    public func instanceMemberFunction(): Unit {}
    public static func staticMemberFunction(): Unit {}
    public prop instanceMemberProperty: Bool {
        get() {
            true
        }
    }
    public static prop staticMemberProperty: Bool {
        get() {
            true
        }
    }
    public var instanceMemberVariable: Bool = true
    public static var staticMemberVariable: Bool = false
}

public class ClassType0 {
    public const ClassType0() {}
}

public interface InterfaceType {}

extend Int32 <: InterfaceType {}

public struct StructType {}

public struct StructType0 {
    public const StructType0() {}
}

public enum EnumType {
    | A
}

@Test
class TestReflect {
    @TestCase
    func testCase00(): Unit {
        let moduleInfo = PackageInfo.get("dependency")
        @Expect(TypeInfo.of<Int64>().toString(), "Int64")
        @Expect(TypeInfo.of<ClassType>().toString(), "ohos_app_cangjie_entry.ClassType")
        @Expect(TypeInfo.of<InterfaceType>().toString(), "ohos_app_cangjie_entry.InterfaceType")
        @Expect(TypeInfo.of<StructType>().toString(), "ohos_app_cangjie_entry.StructType")
        try {
            TypeInfo.of<EnumType>()
            @Expect(false)
        } catch (e: ReflectException) {
            @Expect(e.message, "Type \"ohos_app_cangjie_entry.EnumType\" is not supported")
        }
        @Expect(TypeInfo.of<ClassType>().instanceFunctions.toArray().toString(), "[func instanceMemberFunction(): Unit]")
        @Expect(TypeInfo.of<ClassType>().instanceProperties.toArray().toString(), "[prop instanceMemberProperty: Bool]")
        @Expect(TypeInfo.of<ClassType>().staticFunctions.toArray().toString(), "[static func staticMemberFunction(): Unit]")
        @Expect(TypeInfo.of<ClassType>().staticProperties.toArray().toString(), "[static prop staticMemberProperty: Bool]")
        @Expect(TypeInfo.of<ClassType>().findAnnotation<MyAnnotation>().getOrThrow().p0, 114514)
        @Expect((ClassTypeInfo.of<ClassType>().construct([114514i64]) as ClassType).getOrThrow().p0, 114514)
    }
}
