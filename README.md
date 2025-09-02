# Cangjie Interop API Public Repository

## Introduction

The Cangjie ArkTS Interop Library API is used to provide cross-language interoperability between Cangjie and ArkTS, includes the common interfaces, interop macro interfaces, and JSON and CFFI interfaces provided by the Cangjie Interop Library, hoping to provide developers with cross-language interop solutions that take into account both development efficiency and operational efficiency, provide a simple interop development paradigm, and reduce cross-language interop overhead.

Framework architecture:
![cangjie interop API](./figures/cangjie-interop_eng.png)

For interop scenarios, Cangjie provides ark_interop libraries to achieve interop with ArkTS. The library mainly provides the following key data structures:

- JSValue: It is used to represent objects (such as numbers, strings, objects, functions) from ArkTS, which is a bridge between Cangjie and ArkTS type conversion;
- JSContext: Used to represent context interoperable with ArkTS, providing module loading, JSValue creation, and more;
- JSCallInfo: Used to represent a set of parameters that are called when an ArkTS interop call occurs;

## Directory

```text
arkcompiler/cangjie_ark_interop
├── api                  # Public repository code for Cangjie Interop API
├── doc                  # Cangjie documentation including API reference, development guide and user manual
    ├── API_Reference    # Cangjie api reference
    └── Dev_Guide        # Cangjie developer guide
    └── release-notes    # Cangjie release notes
    └── User_Manual      # Cangjie user manual
├── test                 # Cangjie interop testcases
```

## Constraints

- The security cangjie interface currently under development only supports standard devices.

## Build Guide

1. Initialize

    ```text
    repo init -u https://gitcode.com/openharmony-sig/manifest.git -b master -m cangjie_oh.xml --no-repo-verify
    repo sync -c
    ```

2. Pre-download

    ```text
    bash build/prebuilts_download.sh
    ```

3. Build products

    ```text
    // build rom
    ./build.sh --product-name rk3568 -ccache --target-cpu=arm64

    // build oh-sdk：
    ./build.sh --product-name ohos-sdk --ccache --build-target out/sdk/gen/build/ohos/sdk:cangjie

Build products are typically found at: out/generic_generic_arm_64only/hisi_newbaltimore_hmscore_standard/packages/hmos-sdk directory.

## Usage Scenarios

It contains the Cangjie-ArkTS interoperation library, which is used for Cangjie-ArkTS interoperation. The json library/APILevel/cffi library are basic function libraries, providing public capabilities for subsystems such as Cangjie API/Cangjie UI.

### Typical scenario one: ArkTS calls Cangjie

For the demands of scenario one, an interoperability library can be used to implement an interface that can be interoperable and invoked on the Cangjie side. The example is as follows:

In OpenHarmony application development, there is a demand for hybrid development of Cangjie and ArkTS, such as the following scenarios:

- Scenario one: When using ArkTS for development, the code modules developed by Cangjie are called through cross-language interop to give full play to Cangjie's high performance and high concurrency advantages and improve the application performance experience.
- Scenario two: When using Cangjie for development, call the ArkTS library through cross-language interoperability to reuse the rich library ecosystem of ArkTS.

At the same time, in response to the development complexity brought about by interop, Cangjie provides a declarative interoperability macro ark_interop_macro, which allows developers to use the macro "@Interop[ArkTS]" to mark the functions or types that need to be exported to ArkTS in the Cangjie code, and automatically generate the interoperability "glue layer" code and ArkTS interface declarations during the compilation stage, reducing the complexity of the developer's handwritten interoperability code.

![Cangjie interoperability flow chart](./figures/api_eng.png)

Module Description:
- Interop Libraries: Developers can call APIs provided by Interop to achieve cross-language parameter passing, function calling, and other capabilities.
- Interop macros: Developers use interoperability macros to mark Cangjie interfaces that need to be called by ArkTS code, and can automatically generate interop "glue" code and ArkTS interface declarations.


## Code Contribution

Developers are welcome to contribute code, documentation, etc. For specific contribution processes and methods, please refer to [Code Contribution](https://gitcode.com/openharmony/docs/blob/master/en/contribute/code-contribution.md).

## Related Repositories

[arkui_napi](https://gitee.com/openharmony/arkui_napi)
