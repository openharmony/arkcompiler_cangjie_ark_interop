# Obtaining Key Attributes (Cangjie)

HUKS provides interfaces for applications to retrieve relevant attributes of specified keys. Before obtaining attributes of a specified key, ensure that the key has been generated or imported into HUKS with persistent storage.

> **Note:**
>
> Lightweight devices do not support the key attribute retrieval functionality.

## Development Steps

1. Specify the key alias `keyAlias` to be queried. The maximum length of a key alias is 128 bytes.

2. Call the interface [`getKeyItemProperties`](../../../../API_Reference/source_en/apis/UniversalKeystoreKit/cj-apis-security_huks.md#func-getkeyitempropertiesstring-huksoptions), passing the parameters `keyAlias` and `options`. The `options` parameter is reserved and currently can be passed as empty.

3. The return value is an object of type [`HuksReturnResult`](../../../../API_Reference/source_en/apis/UniversalKeystoreKit/cj-apis-security_huks.md#class-huksreturnresult). The retrieved attribute set is contained in the `properties` field.

## Example

<!--compile-->
```cangjie
import kit.UniversalKeystoreKit.*

/* 1. Set the key alias */
let keyAlias = "keyAlias"
/* Pass an empty options object */
let emptyOptions: HuksOptions = HuksOptions([], None)
try {
    /* 2. Retrieve key attributes */
    getKeyItemProperties(keyAlias, emptyOptions)
    AppLog.info("getKeyItemProperties success")
} catch (e: Exception) {
    AppLog.error("getKeyItemProperties input arg invalid, ${e.toString()}")
}
```