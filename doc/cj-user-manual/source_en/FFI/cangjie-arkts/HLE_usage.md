# HLE Tool Command Line Usage  

The Cangjie language supports efficient cross-language interoperability with ArkTS, allowing developers to call ArkTS third-party libraries in Cangjie code. By using the HLE (Hyper-Lang Extension) tool, users can parse ArkTS interfaces and automatically generate cross-language wrapper code for Cangjie invocation.  

## Usage  

HLE command-line parameter descriptions:  

| Parameter       | Description                                     | Type      | Remarks               |  
| --------------- | ---------------------------------------------- | --------- | --------------------- |  
| `-i`            | Absolute path to the input .d.ts or .d.ets file | Optional  | Mutually exclusive or combinable with `-d` |  
| `-r`            | Absolute path to the TypeScript compiler       | Required  |                       |  
| `-d`            | Absolute path to the folder containing .d.ts or .d.ets files | Optional  | Mutually exclusive or combinable with `-i` |  
| `-o`            | Output directory for the interoperability code  | Optional  | Defaults to the current directory |  
| `-j`            | Path to the analysis file for .d.ts or .d.ets files | Optional  |                       |  
| `--module-name` | Custom Cangjie package name for the generated code | Optional  |                       |  
| `--lib`         | Generate third-party library code              | Optional  |                       |  
| `--help`        | Help option                                    | Optional  |                       |  

## Example  

The following demonstrates detailed steps for generating Cangjie glue layer code for the [lz4js](https://ohpm.openharmony.cn/#/cn/detail/lz4js) third-party library using the HLE tool.  

1. **Install HLE Tool Dependencies**  

    Navigate to the `dtsparser` directory in the Cangjie SDK tools:  

    ![hle_install](../../figures/HLE_install.png)  

    Execute the installation command:  

    ```sh  
    npm install  
    ```  

2. **Configure lz4js Third-Party Library Dependency**  

    Add the lz4js dependency to `package.json` in the `dtsparser` directory:  

    ```json  
    "dependencies": {  
        // ...  
        "lz4js": "^0.2.0",  
        "@types/lz4js": "^0.2.1"  
        // ...  
    },  
    ```  

3. **Generate Cangjie Wrapper Layer via Command Line**  

    Navigate to the `bin` directory in the Cangjie SDK tools. For Windows, execute:  

    ```sh  
    .\hle.exe -j /path/to/tools/dtsparser/analysis.js -i /path/to/index.d.ts --lib --module-name lz4cj -o /path/to/output  
    ```  

    - `-j`: Specifies the path to the analysis file for ArkTS source code.  
    - `-i`: Specifies the absolute path to the .d.ts or .d.ets file.  
    - `--lib`: Indicates generation of Cangjie glue code for ArkTS third-party libraries.  
    - `--module-name`: Specifies the Cangjie package name for the generated code.  
    - `-o`: Specifies the output directory for the generated Cangjie glue layer code.