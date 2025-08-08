# Key Export (Cangjie)

Used when a business needs to obtain the public key of a persistently stored asymmetric key. Currently supports exporting public keys for ECC/RSA/ED25519/X25519/SM2.

> **Note:**
>
> Lightweight devices only support RSA public key export.

## Development Steps

1. Specify the key alias `keyAlias`, with a maximum length of 128 bytes.

2. Call the interface [exportKeyItem](../../../../API_Reference/source_en/apis/UniversalKeystoreKit/cj-apis-security_huks.md#func-exportkeyitemstring-huksoptions), passing the parameters `keyAlias` and `options`. `options` is a reserved parameter and can currently be passed as empty.

3. The return value is an object of type [HuksReturnResult](../../../../API_Reference/source_en/apis/UniversalKeystoreKit/cj-apis-security_huks.md#class-huksreturnresult). The exported public key plaintext is stored in the `outData` field, encapsulated in the standard DER format of X.509 specification. For details, refer to [Public Key Material Format](./cj-huks-concepts.md#public-key-material-format).

## Example

<!--compile-->
```cangjie
import kit.UniversalKeystoreKit.*

/* 1. Set key alias */
let keyAlias = "keyAlias"

/* 2. Pass empty options object */
let emptyOptions: HuksOptions = HuksOptions([], None)

try {
    /* 3. Export key */
    let b = exportKeyItem(keyAlias, emptyOptions)
    AppLog.info("exportKeyItem success, data size = ${b.size}")
} catch (e: Exception) {
    AppLog.error("exportKeyItem input arg invalid, ${e.toString()}")
}
```