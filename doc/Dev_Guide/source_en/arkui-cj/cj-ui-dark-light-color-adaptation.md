# Dark and Light Mode Adaptation  

## Overview  

The current system supports both dark and light display modes. To provide users with a better experience, applications should adapt to these modes. From the perspective of application-system configuration association, dark/light mode adaptation can be divided into the following scenarios:  

- [Application Follows System Dark/Light Mode](#application-follows-system-darklight-mode)  
- [Application Actively Sets Dark/Light Mode](#application-actively-sets-darklight-mode)  

## Application Follows System Dark/Light Mode  

1. **Color Adaptation**  

    - **Custom Resource Implementation**  

      Add a dark mode qualifier directory (named `dark`) under the `resources` directory and create a `color.json` file to configure dark mode color resources. For details, refer to [Resource Classification and Access](#).  

      Example `resources` directory structure:  

      ![colorJsonDir](./figures/colorJsonDir.png)  

      For example, developers can define the same color name in both files with different values.  

      `base/element/color.json`:  
      ```json
      {
        "color": [
          {
            "name": "app_title_color",
            "value": "0x000000"
          }
        ]
      }
      ```  

      `dark/element/color.json`:  
      ```json
      {
        "color": [
          {
            "name": "app_title_color",
            "value": "0xFFFFFF"
          }
        ]
      }
      ```  

    - **Using System Resources**  

      Developers can directly use predefined system resources (layered parameters), where the same resource ID returns different values based on device type, dark/light mode, etc. By leveraging system resources, applications can achieve consistent visual styles without customizing dual color sets. The system automatically switches colors in dark/light modes.  

      Example:  
      ```cangjie
      Text('Use system-defined colors')
        .fontColor(@r(sys.color.ohos_id_color_text_primary))
      ```  

2. **Image Resource Adaptation**  

    Use resource qualifier directories. Similar to color adaptation, place dark-mode images in `dark/media` and load them via `$r`. The system automatically selects the correct resource during mode switches.  

    For simple SVG icons, use the [`fillColor`](./cj-graphics-display.md#display-vector-graphics) property with system resources to modify colors dynamically, avoiding dual image sets.  

    Example:  
    ```cangjie
    Image(@r(app.media.pic_svg))
      .width(50)
      .fillColor(@r(sys.color.ohos_id_color_text_primary))
    ```  

3. **Web Component Adaptation**  

    Web components support dark mode configuration for frontend pages. Refer to [Web Component Dark Mode](../../Dev_Guide/source_en/web/cj-web-set-dark-mode.md) for setup.  

4. **Listening to Dark/Light Mode Changes**  

    Applications can actively monitor system mode changes for custom logic (e.g., resource initialization). This works regardless of whether the app follows system mode.  

    a. In `AbilityStage`'s `onCreate()`, save the initial color mode to `AppStorage`:  
    ```cangjie
    public override func onCreate(): Unit {
        Hilog.info(0x0000, 'testTag', 'Ability onCreate');
        AppStorage.setOrCreate("currentColorMode", this.context.config.colorMode)
    }
    ```  

    b. In `onConfigurationUpdate()`, update `AppStorage` with the latest mode:  
    ```cangjie
    public override func onConfigurationUpdate(newConfig: AbilityConfiguration): Unit {
        AppStorage.setOrCreate("currentColorMode", newConfig.colorMode)
        Hilog.info(0x0000, 'testTag', "the newConfig.colorMode is "+AppStorage.get<ConfigurationColorMode>('currentColorMode').toString())
    }
    ```  

    c. In a Page, use `@StorageProp + @Watch` to track mode changes:  
    ```cangjie
    @StorageLink["currentColorMode"] @Watch[onColorModeChange] var currentMode: ConfigurationColorMode = ConfigurationColorMode.COLOR_MODE_LIGHT
    ```  

    d. In `aboutToAppear`, initialize state based on the current mode:  
    ```cangjie
    protected override func aboutToAppear() {
      if (this.currentMode == ConfigurationColorMode.COLOR_MODE_LIGHT) {
            Hilog.info(0x0000, 'aboutToAppear', 'COLOR_MODE_LIGHT');
            // Light mode initialization logic
      }else {
            Hilog.info(0x0000, 'aboutToAppear', 'COLOR_MODE_DARK');
            // Dark mode initialization logic
      }
    }
    ```  

    e. In the `@Watch` callback, repeat the adaptation logic:  
    ```cangjie
    func onColorModeChange(){
        if (this.currentMode == ConfigurationColorMode.COLOR_MODE_LIGHT) {
            Hilog.info(0x0000, 'onColorModeChange', 'COLOR_MODE_LIGHT');
            // Light mode logic
      }else {
            Hilog.info(0x0000, 'onColorModeChange', 'COLOR_MODE_DARK');
            // Dark mode logic
      }
    }
    ```  

## Application Actively Sets Dark/Light Mode  

By default, apps follow system mode. To enforce a fixed mode (ignoring system changes), use:  
```cangjie
public override func onCreate(): Unit {
    Hilog.info(0x0000, 'testTag', 'Ability onCreate');
    this.context.getApplicationContext().setColorMode(ConfigurationColorMode.COLOR_MODE_LIGHT)
}
```  

## System Default Rules  

1. If `setColorMode` is called, the app prioritizes the manually set mode.  

2. Without `setColorMode`:  
    - If `dark` directory contains resources, system components auto-switch in dark mode.  
    - If no dark resources exist, components remain in light mode.  

      ![darkDir](./figures/darkDir.png)  

For apps using only system components/colors that should follow system mode, reset the mode:  
```cangjie
public override func onCreate(): Unit {
    this.context.getApplicationContext().setColorMode(ConfigurationColorMode.COLOR_MODE_NOT_SET)
}
```