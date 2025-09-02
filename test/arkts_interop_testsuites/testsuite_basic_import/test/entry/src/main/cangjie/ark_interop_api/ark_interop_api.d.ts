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

export declare interface ISomeObject {
    id: number
    foo: (a: number, b: number) => number
}

export declare interface ISomeObject {
    id: number
    foo: (a: number, b: number) => number
}

export declare interface CustomLib {
    doAdd(a: number, b: number): number
    doString(a: string, b: string): string
    doBool(a: boolean): boolean
    doUnit(a: (funcArg0: string) => void): void
    doFunc(a: (funcArg0: (funcArgfuncArg0: number) => number) => number, c: (funcArg0: (funcArgfuncArg0: (funcArgfuncArgfuncArg0: number) => number) => number) => number): number
    doOption(a: number | undefined): number | undefined
    doArrayBuffer(a: ArrayBuffer): Promise<ArrayBuffer>
    doAsync(): Promise<string>
    doInterface(a: ISomeObject): number
    doAdd(a: number, b: number): number
    doString(a: string, b: string): string
    doBool(a: boolean): boolean
    doUnit(a: (funcArg0: string) => void): void
    doFunc(a: (funcArg0: (funcArgfuncArg0: number) => number) => number, c: (funcArg0: (funcArgfuncArg0: (funcArgfuncArgfuncArg0: number) => number) => number) => number): number
    doOption(a: number | undefined): number | undefined
    doArrayBuffer(a: ArrayBuffer): Promise<ArrayBuffer>
    doAsync(): Promise<string>
    doInterface(a: ISomeObject): number
}