# Cangjie Interop API Public Repository

## Introduction

The Cangjie Interop API public Repository includes the common interfaces, interop macro interfaces, and JSON and CFFI interfaces provided by the Cangjie Interop Library, hoping to provide developers with cross-language interop solutions that take into account both development efficiency and operational efficiency, provide a simple interop development paradigm, and reduce cross-language interop overhead.

Framework architecture:
![cangjie interop API](./figures/api_eng.png)

## Directory

```text
.
├── api                  # Public repository code for Cangjie Interop API
├── doc                   # Cangjie documentation including API reference, development guide and user manual
├── mocks                 # FFI mock stubs during SDK build
├── generate_mock.py      # Build script for generating mocks
├── bundle.json
└── LICENSE
```

## Usage Scenarios

It contains the Cangjie-ArkTS interoperation library, which is used for Cangjie-ArkTS interoperation. The json library/APILevel/cffi library are basic function libraries, providing public capabilities for subsystems such as Cangjie API/Cangjie UI.

### Typical scenario one: ArkTS calls Cangjie

For the demands of scenario one, an interoperability library can be used to implement an interface that can be interoperable and invoked on the Cangjie side. The example is as follows:

In OpenHarmony application development, there is a demand for hybrid development of Cangjie and ArkTS, such as the following scenarios:

- Scenario one: When using ArkTS for development, the code modules developed by Cangjie are called through cross-language interop to give full play to Cangjie's high performance and high concurrency advantages and improve the application performance experience.
- Scenario two: When using Cangjie for development, call the ArkTS library through cross-language interoperability to reuse the rich library ecosystem of ArkTS.

For interop scenarios, Cangjie provides ark_interop libraries to achieve interop with ArkTS. The library mainly provides the following key data structures:

- JSValue: It is used to represent objects (such as numbers, strings, objects, functions) from ArkTS, which is a bridge between Cangjie and ArkTS type conversion;
- JSContext: Used to represent context interoperable with ArkTS, providing module loading, JSValue creation, and more;
- JSCallInfo: Used to represent a set of parameters that are called when an ArkTS interop call occurs;

At the same time, in response to the development complexity brought about by interop, Cangjie provides a declarative interoperability macro ark_interop_macro, which allows developers to use the macro "@Interop[ArkTS]" to mark the functions or types that need to be exported to ArkTS in the Cangjie code, and automatically generate the interoperability "glue layer" code and ArkTS interface declarations during the compilation stage, reducing the complexity of the developer's handwritten interoperability code.

## Related Repositories

[arkui_napi](https://gitee.com/openharmony/arkui_napi)
