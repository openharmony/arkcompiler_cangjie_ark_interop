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

package dependency

public interface Constructable<T> {
    static func construct(): T
}

extend Unit <: Constructable<Unit> {
    public static func construct(): Unit {
        ()
    }
}

extend Bool <: Constructable<Bool> {
    public static func construct(): Bool {
        true
    }
}

extend Int8 <: Constructable<Int8> {
    public static func construct(): Int8 {
        1i8
    }
}

extend Int16 <: Constructable<Int16> {
    public static func construct(): Int16 {
        1i16
    }
}

extend Int32 <: Constructable<Int32> {
    public static func construct(): Int32 {
        1i32
    }
}

extend Int64 <: Constructable<Int64> {
    public static func construct(): Int64 {
        123i64
    }
}

extend UInt8 <: Constructable<UInt8> {
    public static func construct(): UInt8 {
        1u8
    }
}

extend UInt16 <: Constructable<UInt16> {
    public static func construct(): UInt16 {
        1u16
    }
}

extend UInt32 <: Constructable<UInt32> {
    public static func construct(): UInt32 {
        1u32
    }
}

extend UInt64 <: Constructable<UInt64> {
    public static func construct(): UInt64 {
        123u64
    }
}

extend Float32 <: Constructable<Float32> {
    public static func construct(): Float32 {
        114.514000f32
    }
}

extend Float64 <: Constructable<Float64> {
    public static func construct(): Float64 {
        114.514000f64
    }
}
