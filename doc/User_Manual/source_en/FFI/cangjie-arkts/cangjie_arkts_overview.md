# Overview of Cangjie-ArkTS Interoperability

On the OpenHarmony system, to reuse the ArkTS ecosystem, Cangjie supports mutual calls with ArkTS, which is referred to as Cangjie-ArkTS interoperability. Cangjie-ArkTS interoperability is based on Cangjie CFFI (C Foreign Function Interface) and ArkTS runtime interfaces, providing users with library-level interoperability capabilities.

From a usage perspective, Cangjie-ArkTS interoperability can be divided into two scenarios: using ArkTS in Cangjie applications and using Cangjie in ArkTS applications. From a development approach, it can be categorized into declarative interoperability macro development and interoperability library development. The declarative interoperability macro approach has simpler development steps and is easier to get started with. The interoperability library approach is more flexible compared to the macro method and can achieve a wider range of functionalities, making it recommended for users with some understanding of interoperability. Using Cangjie in ArkTS applications can employ both development approaches, whereas using ArkTS in Cangjie applications can only use the interoperability library development approach.

Before introducing all usage methods, let's first discuss the interoperability library. The interoperability library is a standard library that assists in implementing interoperability features, primarily including some type representations corresponding to ArkTS in Cangjie and APIs within those types. Several core types (not exhaustive) of the interoperability library are:

1. `JSValue`: Represents a unified ArkTS data type, serving as a parameter in cross-language calls.
2. `JSContext`: Represents the ArkTS runtime context, assisting in converting `JSValue` to Cangjie data.
3. `JSCallInfo`: Represents the parameter collection of ArkTS function calls, including all input parameters and the `this` pointer.
4. `JSRuntime`: Represents the ArkTS runtime created by Cangjie.