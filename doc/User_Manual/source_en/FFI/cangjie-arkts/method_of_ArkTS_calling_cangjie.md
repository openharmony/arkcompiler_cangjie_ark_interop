# Introduction to Invoking Cangjie Methods in ArkTS

When developing ArkTS for invoking Cangjie, the process can be divided into two steps: first, implementing interoperability code on the Cangjie side, and second, utilizing the interoperability code on the ArkTS side.

There are two approaches to implementing interoperability code on the Cangjie side:

- **Cangjie-ArkTS Declarative Interop Macro Approach**: Uses static declarations to simplify usage, with lower difficulty level, suitable for beginners.
- **Cangjie-ArkTS Interop Library Approach**: Provides dynamic type interfaces, suitable for mutual invocation between JavaScript and TypeScript, offering flexibility and variability, designed for users with some foundational knowledge of interoperability.

There are two ways to use interoperability code on the ArkTS side, as detailed in [utilizing the interoperability code on the ArkTS side](./arkts_import_cangjie.md).