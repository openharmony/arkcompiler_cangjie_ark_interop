# Debugging Frontend Pages Using DevTools

Web components support debugging frontend pages using DevTools. DevTools is a web frontend development debugging tool that enables debugging mobile device frontend pages on a computer. Developers can enable Web component frontend page debugging capabilities through the `setWebDebuggingAccess()` interface. Using DevTools, they can debug frontend web pages on mobile devices from a computer. The device must be version 4.1.0 or higher.

## Debugging Steps

### Enable Web Debugging in Application Code

Before debugging a webpage, the application-side code must call the `setWebDebuggingAccess()` interface to enable Web debugging.

If the Web debugging switch is not enabled, DevTools cannot detect the webpage to be debugged.

1. Enable the Web debugging switch in the application code as follows:

    <!-- compile -->

    ```cangjie
    // index.cj
    import ohos.state_macro_manage.*
    import kit.ArkWeb.WebviewController
    import kit.UIKit.{Web, BusinessException}

    @Entry
    @Component
    class EntryView {
        let webController = WebviewController()

        public func aboutToAppear(): Unit {
            try {
                // Configure Web to enable debugging mode
                WebviewController.setWebDebuggingAccess(true)
            } catch (e: BusinessException) {
                AppLog.error("ErrorCode: ${e.code},  Message: ${e.message}")
            }
        }

      func build() {
          Column {
              Web(src: 'www.example.com', controller: this.webController)
          }
      }
    }
    ```

2. To enable debugging functionality, add the following permission to the `module.json5` file in the DevEco Studio application project's HAP module. For details on adding permissions, refer to [Declaring Permissions in Configuration Files](../security/AccessToken/cj-declare-permissions.md).

    ```json
    "requestPermissions":[
      {
        "name" : "ohos.permission.INTERNET"
      }
    ]
    ```

### Connect the Device to a Computer

Connect the device to a computer and enable Developer Mode to prepare for subsequent port forwarding operations.

1. Enable Developer Mode on the device and turn on USB debugging.

    (1) In the terminal system, check if "Developer Options" exists under "Settings > System." If not, go to "Settings > About" and tap "Version Number" seven times consecutively until the prompt "Enable Developer Mode" appears. Click "Confirm" and enter the PIN (if set). The device will restart automatically.

    (2) Connect the terminal to the computer using a USB cable. Under "Settings > System > Developer Options," toggle the "USB Debugging" switch. Click "Allow" in the "Allow USB Debugging" pop-up.

2. Use the `hdc` command to connect to the device.

    Open the command line and execute the following command to check if `hdc` can detect the device.

    ```shell
    hdc list targets
    ```

    - If the command returns the device ID, `hdc` has successfully connected to the device.

        ![hdc_list_targets_success](figures/devtools_resources_hdc_list_targets_success.png)

    - If the command returns `[Empty]`, `hdc` has not detected the device.

        ![hdc_list_targets_empty](figures/devtools_resources_hdc_list_targets_empty.jpg)

3. Enter the `hdc shell`.

    After the `hdc` command connects to the device, execute the following command to enter the `hdc shell`.

    ```shell
    hdc shell
    ```

### Port Forwarding

When the application code calls the `setWebDebuggingAccess` interface to enable Web debugging, the ArkWeb kernel starts a domain socket listener to implement DevTools' webpage debugging functionality.

However, Chrome browsers cannot directly access domain sockets on the device. Therefore, the domain socket on the device must be forwarded to the computer.

1. First, execute the following command in the `hdc shell` to query the domain socket created by ArkWeb on the device.

    ```shell
    cat /proc/net/unix | grep devtools
    ```

    - If the previous steps were executed correctly, this command will display the domain socket port for debugging.

        ![hdc_grep_devtools_38532](figures/devtools_resources_hdc_grep_devtools_38532.jpg)

    - If no results are returned, verify the following:

        (1) The application has enabled the Web debugging switch.

        (2) The application has loaded a webpage using the Web component.

2. Forward the queried domain socket to the computer's TCP port 9222.

    Execute `exit` to leave the `hdc shell`.

    ```shell
    exit
    ```

    Execute the following command in the command line to forward the port.

    ```shell
    hdc fport tcp:9222 localabstract:webview_devtools_remote_38532
    ```

    > **Note:**
    >
    > - The number after "webview_devtools_remote_" represents the process ID of the ArkWeb application. This number is not fixed. Replace it with the value you queried.
    > - If the application's process ID changes (e.g., the application restarts), port forwarding must be reconfigured.

    Successful execution of the command:

    ![hdc_fport_38532_success](figures/devtools_resources_hdc_fport_38532_success.jpg)

3. Execute the following command in the command line to check if port forwarding succeeded.

    ```shell
    hdc fport ls
    ```

    - If the command returns a port forwarding task, the port forwarding was successful.

        ![hdc_fport_ls_38532](figures/devtools_resources_hdc_fport_ls_38532.png)

    - If the command returns `[Empty]`, the port forwarding failed.

        ![hdc_fport_ls_empty](figures/devtools_resources_hdc_fport_ls_empty.jpg)

### Open the Debugging Tool Page in Chrome Browser

1. Enter the debugging tool address `chrome://inspect/#devices` in the Chrome browser's address bar on the computer and open the page.

2. Configure Chrome's debugging tool.

    To detect the webpage to be debugged from the local TCP port 9222, ensure "Discover network targets" is checked. Then configure the network settings.

    (1) Click the "Configure" button.

    (2) Add the local port `localhost:9222` to the "Target discovery settings."

    ![chrome_configure](figures/devtools_resources_chrome_configure.jpg)

3. To debug multiple applications simultaneously, add multiple port numbers in the "Devices" section under "configure" in Chrome's debugging tool page.

   ![debug-effect](figures/debug-domains.png)

### Wait for the Debugging Page to Be Detected

If the previous steps were executed successfully, Chrome's debugging page will soon display the webpage to be debugged.

![chrome_inspect](figures/devtools_resources_chrome_inspect.jpg)

### Start Webpage Debugging

![debug-effect](figures/debug-effect.png)

## Convenience Scripts

### Windows Platform

Copy the following information to create a `.bat` file and execute it after enabling the debugging application.

```bat
@echo off
setlocal enabledelayedexpansion

:: Initialize port number and PID list
set PORT=9222
set PID_LIST=

:: Get the list of all forwarded ports and PIDs
for /f "tokens=2,5 delims=:_" %%a in ('hdc fport ls') do (
    if %%a gtr !PORT! (
        set PORT=%%a
    )
    for /f "tokens=1 delims= " %%c in ("%%b") do (
        set PID_LIST=!PID_LIST! %%c
    )
)

:: Increment port number for next application
set temp_PORT=!PORT!
set /a temp_PORT+=1
set PORT=!temp_PORT!

:: Get the domain socket name of devtools
for /f "tokens=*" %%a in ('hdc shell "cat /proc/net/unix | grep devtools"') do (
    set SOCKET_NAME=%%a

    :: Extract process ID
    for /f "delims=_ tokens=4" %%b in ("!SOCKET_NAME!") do set PID=%%b

    :: Check if PID already has a mapping
    echo !PID_LIST! | findstr /C:" !PID! " >nul
    if errorlevel 1 (
        :: Add mapping
        hdc fport tcp:!PORT! localabstract:webview_devtools_remote_!PID!
        if errorlevel 1 (
            echo Error: Failed to add mapping.
            pause
            exit /b
        )

        :: Add PID to list and increment port number for next application
        set PID_LIST=!PID_LIST! !PID!
        set temp_PORT=!PORT!
        set /a temp_PORT+=1
        set PORT=!temp_PORT!
    )
)

:: If no process ID was found, prompt the user to open debugging in their application code and provide the documentation link
if "!SOCKET_NAME!"=="" (
    echo No process ID was found. Please open debugging in your application code using the corresponding interface.
    pause
    exit /b
)

:: Check mapping
hdc fport ls

echo.
echo Script executed successfully. Press any key to exit...
pause >nul

:: Try to open the page in Edge
start msedge chrome://inspect/#devices.com

:: If Edge is not available, then open the page in Chrome
if errorlevel 1 (
    start chrome chrome://inspect/#devices.com
)

endlocal
```

### Linux or Mac Platform

Copy the following information to create a `.sh` file. Note to run `chmod` and format conversion, then execute it after enabling the debugging application.

This script first deletes all port forwarding rules. If other tools (e.g., DevEco Studio) are also using port forwarding, they will be affected.

```shell
#!/bin/bash

# Get current fport rule list
CURRENT_FPORT_LIST=$(hdc fport ls)

# Delete the existing fport rule one by one
while IFS= read -r line; do
    # Extract the taskline
    IFS=' ' read -ra parts <<< "$line"
    taskline="${parts[1]} ${parts[2]}"

    # Delete the corresponding fport rule
    echo "Removing forward rule for $taskline"
    hdc fport rm $taskline
    result=$?

    if [ $result -eq 0 ]; then
        echo "Remove forward rule success, taskline:$taskline"
    else
        echo "Failed to remove forward rule, taskline:$taskline"
    fi

done <<< "$CURRENT_FPORT_LIST"

# Initial port number
INITIAL_PORT=9222

# Get the current port number, use initial port number if not set previously
CURRENT_PORT=${PORT:-$INITIAL_PORT}

# Get the list of all PIDs that match the condition
PID_LIST=$(hdc shell cat /proc/net/unix | grep webview_devtools_remote_ | awk -F '_' '{print $NF}')

if [ -z "$PID_LIST" ]; then
    echo "Failed to retrieve PID from the device"
    exit 1
fi

# Increment the port number
PORT=$CURRENT_PORT

# Forward ports for each application one by one
for PID in $PID_LIST; do
    # Increment the port number
    PORT=$((PORT + 1))

    # Execute the hdc fport command
    hdc fport tcp:$PORT localabstract:webview_devtools_remote_$PID

    # Check if the command executed successfully
    if [ $? -ne 0 ]; then
        echo "Failed to execute hdc fport command"
        exit 1
    fi
done

# List all forwarded ports
hdc fport ls
```

## Common Issues and Solutions

### hdc Cannot Detect Device

**Symptom**

No device ID is listed after executing the following command in the terminal:

```shell
hdc list targets
```

**Solution**

- Ensure USB debugging is enabled on the device.
- Verify the device is properly connected to the computer.

### hdc Command Shows Device as "Unauthorized"

**Symptom**

When executing hdc commands, the device is displayed as "未授权" or "unauthorized".

**Root Cause**

The device has not authorized the computer for debugging.

**Solution**

After connecting a device with USB debugging enabled to an unauthorized computer, a prompt will appear asking "Allow USB debugging?". Select "Allow".

### Cannot Find DevTools Domain Socket

**Symptom**

No results appear after executing the following command in hdc shell:

```shell
cat /proc/net/unix | grep devtools
```

**Solution**

- Ensure the application has [enabled web debugging](#application-code-enables-web-debugging).
- Verify the application uses Web components to load web pages.

### Port Forwarding Fails

**Symptom**

Previously configured forwarding tasks are not listed after executing:

```shell
hdc fport ls
```

**Solution**

- Confirm the domain socket exists on the device.
- Ensure the local tcp:9222 port on the computer is not occupied.

    - If tcp:9222 is occupied, forward the domain socket to another available TCP port (e.g., 9223).
    - If forwarding to a new TCP port, update the port number in the "Target discovery settings" of the Chrome browser on the computer.

### After Successful Port Forwarding, Chrome Cannot Detect Debuggable Web Page

**Symptom**

The Chrome browser on the computer cannot detect the debuggable web page.

**Root Cause**

Port forwarding may fail due to:

- Disconnection between device and computer, which clears all forwarding tasks in hdc.
- Restarting hdc service, which also clears all forwarding tasks.
- Process ID changes of the application on the device (e.g., app restart), making old forwarding tasks invalid.
- Abnormal configurations like multiple forwarding tasks using the same port.

**Solution**

- Ensure the local tcp:9222 (or other configured TCP port) on the computer is not occupied.
- Verify the domain socket still exists on the device.
- Confirm the process ID in the domain socket name matches the debuggable application's process ID.
- Remove unnecessary forwarding tasks in hdc.
- After successful forwarding, open http://localhost:9222/json in Chrome (replace 9222 with the actual TCP port used).

    - If the page displays content, port forwarding is successful. Wait for the debuggable page to appear in [Chrome's debugging interface](#wait-for-debuggable-page-to-appear).

      ![chrome_localhost](figures/devtools_resources_chrome_localhost.jpg)

    - If an error page appears, port forwarding has failed. Refer to [Port Forwarding Fails](#port-forwarding-fails) for solutions.

      ![chrome_localhost_refused](figures/devtools_resources_chrome_localhost_refused.jpg)

- Chrome's http://localhost:9222/json page displays content, but the debugging tool still cannot detect targets.
    - Ensure the port number in Chrome's debugging tool "Configure" matches the forwarded TCP port.
    - This document uses TCP port 9222 by default. If another port (e.g., 9223) is used, update both the [port forwarding](#port-forwarding) TCP port and the [Chrome debugging tool "Configure" port](#open-debugging-tool-page-in-chrome-browser).
```