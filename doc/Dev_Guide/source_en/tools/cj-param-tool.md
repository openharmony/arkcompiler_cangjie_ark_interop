# param Tool

param is a tool provided for developers to manage operating system parameters, supporting only standard systems.

## Environment Requirements

- Obtain the <!--Del-->[<!--DelEnd-->hdc tool<!--Del-->](https://docs.openharmony.cn/pages/v5.1/zh-cn/device-dev/subsystems/subsys-toolchain-hdc-guide.md)<!--DelEnd--> and execute `hdc shell`.
- Ensure the device is properly connected.

## param Command List

| Option | Description |
| ----------------- | ------------------------------------------ |
| -h | Display the list of supported param commands. |
| ls [-r] [name] | Display system parameter information matching the specified name. Use "-r" to retrieve information based on parameter permissions; omit "-r" to directly fetch parameter information. |
| get [name] | Retrieve the value of the specified system parameter. If no name is specified, returns all system parameters. |
| set name value | Set the value of the specified system parameter. |
| wait name [value] [timeout] | Synchronously wait for the specified system parameter to match the given value. Supports fuzzy matching (e.g., "*" for any value, "val*" for values starting with "val"). Timeout is in seconds (default: 30s). |
| save | Save persist parameters to the workspace. |

## Display Supported Commands

- To display the list of supported param commands, use the following format:

  ```bash
  param -h
  ```

## Retrieve System Parameter Information

- Display system parameter information matching the specified name:

  ```bash
  param ls [-r] [name]
  ```

  **Examples:**

  ![ls-integrity](./figures/param-ls-integrity.png)
  ![ls-part](./figures/param-ls-part.png)
  ![ls](./figures/param-ls.png)

## Get System Parameter Values

- Retrieve the value of the specified system parameter:

  ```bash
  param get [name]
  ```

  **Example:**

  ![get](./figures/param-get.png)

## Set System Parameter Values

- Set the value of the specified system parameter:

  ```bash
  param set name value
  ```

  **Example:**

  ![set](./figures/param-set.png)

## Wait for Parameter Value Match

- Synchronously wait for the specified system parameter to match the given value:

  ```bash
  param wait name [value] [timeout]
  ```

  **Example:**

  ![wait](./figures/param-wait.png)

## Save Persist Parameters

- Save persist parameters to the workspace:

  ```bash
  param save
  ```

  **Example:**

  ![save](./figures/param-save.png)