# HAR  

HAR (Harmony Archive) is a static shared package that can contain code, C++ libraries, resources, and configuration files. It enables multiple modules or projects to share Cangjie components, resources, and related code.  

## Usage Scenarios  

- Supports intra-application sharing and can be published as a second-party library (SDK) or third-party library (SDK) for use by other applications.  

- As a second-party library (SDK), it can be published to the [OHPM Private Repository](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-ohpm-repo) for use by other applications within the company.  

- As a third-party library (SDK), it can be published to the [OHPM Central Repository](https://ohpm.openharmony.cn/) for use by other applications.  

## Constraints  

- HAR cannot be installed or run independently on a device; it can only be referenced as a dependency of an application module.  

- HAR does not support declaring `pages` in configuration files, but it can include `pages` and navigate via the `Navigation` method.  

- HAR cannot reference resources in the `AppScope` directory. During compilation, content in `AppScope` is not packaged into the HAR, which may cause HAR resource references to fail.  

- When multiple packages (HAPs) reference the same HAR, it results in duplicated code and resources across packages, increasing the application size.  

- HAR can depend on other HARs, but circular dependencies and transitive dependencies are not supported.  

- When a HAP references a HAR, the system automatically merges their permission configurations during compilation. Developers do not need to redundantly request the same permissions in both HAP and HAR.  

- When integrating a Cangjie binary HAR<!-- add link -->, the project must use the same SDK version as the one used to compile the binary HAR.  

- If a module contains custom macros and needs to expose them to other modules, neither this module nor dependent modules can be compiled into a binary HAR. They must be compiled into a source-code format Cangjie HAR<!-- add link -->.  

- Binary HAR packages must use `hapTasks` imported from `@ohos/cangjie-build-support` in the `hvigorfile.ts` of the final integrated HAP module. Otherwise, only source-code format Cangjie HARs can be used.  

> **Note:**  
>  
> **Circular Dependency**: For example, with three HARs—HAR-A, HAR-B, and HAR-C—a circular dependency occurs if HAR-A depends on HAR-B, HAR-B depends on HAR-C, and HAR-C depends on HAR-A.  
>  
> **Transitive Dependency**: For example, with three HARs—HAR-A, HAR-B, and HAR-C—if HAR-A depends on HAR-B and HAR-B depends on HAR-C, HAR-A can use HAR-B's methods and components but cannot directly use HAR-C's methods and components.  

## Creation  

Developers can create a HAR module using DevEco Studio. For details, refer to [Creating a Library Module](#)<!-- add link -->.  

## Development  

This section explains how to export Cangjie components, interfaces, and resources from a HAR for use by other applications or modules within the same application.  

Interfaces and other elements to be exported from a HAR can be marked with the `public` modifier.  

> **Note:**  
>  
> When a HAR is compiled with its host application, the HAR's code is directly compiled into the host application. The HAR package is an intermediate compilation artifact, not a final runtime entity. At runtime, the HAR operates under the identity of its host application, and system behavior is distinguished based on the host application's version. If version-specific behavior differentiation is required within the HAR, developers can call the [`getBundleInfoForSelf`](../../../../API_Reference/source_en/apis/AbilityKit/cj-apis-bundle_manager.md#static-func-getbundleinfoforselfint32) interface to retrieve the host application's `targetVersion` and implement logic accordingly.  

### Exporting Cangjie Components  

Use `public` to export Cangjie components. Example:  

```cangjie  
// library/src/main/cangjie/mainPage.cj  
package ohos_app_cangjie_library  

import ohos.base.*  
import ohos.component.Text  
import ohos.component.Column  
import ohos.component.CustomView  
import ohos.state_manage.LocalStorage  
import ohos.state_manage.ObservedProperty  
import ohos.state_manage.SubscriberManager  
import ohos.state_manage.ViewStackProcessor  
import ohos.state_macro_manage.State  
import ohos.state_macro_manage.Component  
import ohos.state_macro_manage.r  
import ohos.component.Flex  
import ohos.component.Row  
import ohos.component.FlexParams  
import ohos.component.FontWeight  
import ohos.component.ItemAlign  
import ohos.component.FlexAlign  
import ohos.component.Image  
import ohos.resource_manager.__GenerateResource__  

@Component  
public class MainPage {  
    @State  
    var message: String = "Hello"  

    public func build() {  
        Column() {  
            Row() {  
                Text(this.message).fontSize(32).fontWeight(FontWeight.Bold)  
            }.margin(32).height(56).width(624)  
            Flex(  
                FlexParams(justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center,  
                    alignContent: FlexAlign.Center)) {  
                    Column() {  
                        Image(@r(app.media.pic_empty)).width(33.percent)  
                        Text(@r(app.string.empty)).fontSize(14).fontColor(@r(app.color.text_color))  
                    }  
            }.width(100.percent).height(90.percent)  
        }.width(100.percent).height(100.percent).backgroundColor(@r(app.color.page_background))  
    }  
}  
```  

### Exporting Classes and Methods  

Use `public` to export classes and methods. Multiple classes and methods can be exported. Example:  

```cangjie  
// library/src/main/cangjie/classFunc.cj  
package ohos_app_cangjie_library  

public class Log {  
    public static func info(msg: String) {  
        msg  
    }  
}  

public func harFunc() {  
  return 'har func'  
}  

public func harFunc2() {  
  return 'har func2'  
}  
```  

### Exporting Resources  

When compiling a HAP, DevEco Studio collects resource files from the HAP module and its dependencies. If resource files with the same name conflict across modules, DevEco Studio resolves them based on the following priority (highest to lowest):  

- `AppScope` (supported only in the Stage model).  
- The HAP module itself.  
- Dependent HAR modules. If multiple HARs have resource conflicts, the order of dependencies in the project's `oh-package.json5` determines priority (earlier dependencies take precedence). For example, in the snippet below, if `dayjs` and `lottie` contain files with the same name, `dayjs` resources are prioritized.  

> **Note:**  
>  
> If resources are configured in the internationalization directories of `AppScope`, HAP modules, or HAR modules, the same priority rules apply under the same locale qualifiers. Additionally, locale-specific configurations take precedence over `base` configurations. For example, if a resource field is configured in `AppScope/base` and the same field is configured in `HAR/en_US`, the HAR's configuration is prioritized in `en_US` contexts.  

```json5  
// oh-package.json5  
{  
    "dependencies": {  
        "dayjs": "^1.10.4",  
        "lottie": "^2.0.0"  
    }  
}  
```  

## Usage  

This section explains how to configure HAR dependencies and reference HAR Cangjie components, interfaces, and resources.  

Before referencing a HAR, configure its dependency. For details, refer to [Referencing HAR Files and Resources](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-har-import).  

### Referencing HAR Cangjie Components  

After configuring HAR dependencies, you can reference its Cangjie components. Use `import` to reference exported components. Example:  

```cangjie  
// entry/src/main/cangjie/index.cj  
package ohos_app_cangjie_entry  

import ohos.base.LengthProp  
import ohos.component.Column  
import ohos.component.Row  
import ohos.component.CustomView  
import ohos.component.CJEntry  
import ohos.component.loadNativeView  
import ohos.state_manage.ObservedProperty  
import ohos.state_manage.LocalStorage  
import ohos.state_macro_manage.Entry  
import ohos.state_macro_manage.Component  
import ohos.state_manage.ViewStackProcessor  
import ohos.state_manage.SubscriberManager  
import ohos.component.LegalCallCheck  
import ohos.component.ReuseParams  
import ohos.component.ViewBuilder  
import ohos.component.__Recycle__  
import ohos.component.FakeComponent  
import ohos_app_cangjie_library.MainPage  

@Entry  
@Component  
class EntryView {  
    func build() {  
        Row {  
           // Reference HAR Cangjie component  
           MainPage()  
        }.height(100.percent)  
    }  
}  
```  

### Referencing HAR Classes and Methods  

Use `import` to reference exported classes and methods. Example:  

```cangjie  
// entry/src/main/cangjie/index2.cj  
package ohos_app_cangjie_entry  

import ohos.base.LengthProp  
import ohos.component.Column  
import ohos.component.Row  
import ohos.component.Text  
import ohos.component.CustomView  
import ohos.component.CJEntry  
import ohos.component.loadNativeView  
import ohos.component.FontWeight  
import ohos.state_manage.SubscriberManager  
import ohos.state_manage.ObservedProperty  
import ohos.state_manage.LocalStorage  
import ohos.state_macro_manage.Entry  
import ohos.state_macro_manage.Component  
import ohos.state_macro_manage.State  
import ohos_app_cangjie_library.Log  
import ohos_app_cangjie_library.harFunc  

@Entry  
@Component  
class EntryView2 {  
    @State  
    var message: String = "Hello World"  

    func build() {  
        Row {  
            Column {  
                Text(this.message)  
                    .fontSize(50)  
                    .fontWeight(FontWeight.Bold)  
                    .onClick {  
                        evt =>  
                        // Reference HAR class and method  
                        Log.info("har msg")  
                        this.message = "func return: ${harFunc()}"  
                    }  
            }.width(100.percent)  
        }.height(100.percent)  
    }  
}  
```  

### Referencing HAR Resources  

Use `@r` to reference HAR resources. For example, if a string resource (`name: hello_har` in `string.json`) and an image resource (`icon_har.png`) are added to `src/main/resources` in the HAR module, they can be referenced in the Entry module as follows:  

```cangjie  
// entry/src/main/cangjie/index3.cj  
package ohos_app_cangjie_entry  

import ohos.base.LengthProp  
import ohos.component.Column  
import ohos.component.Row  
import ohos.component.Text  
import ohos.component.CustomView  
import ohos.component.CJEntry  
import ohos.component.loadNativeView  
import ohos.component.FontWeight  
import ohos.state_manage.SubscriberManager  
import ohos.state_manage.ObservedProperty  
import ohos.state_manage.LocalStorage  
import ohos.state_macro_manage.Entry  
import ohos.state_macro_manage.Component  
import ohos.state_macro_manage.State  
import ohos.state_macro_manage.r  
import ohos.resource_manager.__GenerateResource__  
import ohos.component.Image  
import ohos.component.List  
import ohos.component.ListItem  
import ohos.component.ListItemAlign  

@Entry  
@Component  
class EntryView3 {  
    @State  
    var message: String = "Hello World"  

    func build() {  
        Row {  
            Column {  
                // Reference HAR string resource  
                Text(@r(app.string.hello_har))  
                    .fontSize(50)  
                    .fontWeight(FontWeight.Bold)  
                    .onClick {  
                        evt => this.message = "Hello Cangjie"  
                    }  
                List() {  
                    ListItem() {  
                        // Reference HAR image resource  
                        Image(@r(app.media.icon_har)).id('iconHar').borderRadius(48.px)  
                    }.margin(5.percent).width(312.px)  
                }.alignListItem(ListItemAlign.Center)  
            }.width(100.percent)  
        }.height(100.percent)  
    }  
}  
```

## Compilation

HAR can be provided to other applications as a second-party or third-party library.

## Release

For details, see [Publishing HAR](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ide-har-publish).