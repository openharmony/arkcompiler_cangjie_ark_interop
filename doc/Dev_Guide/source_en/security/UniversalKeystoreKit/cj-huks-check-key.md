# Check Whether a Key Exists (Cangjie)

HUKS provides interfaces for applications to check whether a specified key exists.

## Development Procedure

1. Specify the key alias `keyAlias`. The maximum length of a key alias is 128 bytes.

2. Initialize the key property set. This is used to specify the [key property TAG](../../../../API_Reference/source_en/apis/UniversalKeystoreKit/cj-apis-security_huks.md#class-huksoptions) during the query. When querying a single key, the TAG field can be left empty.

3. Call the [isKeyItemExist](../../../../API_Reference/source_en/apis/UniversalKeystoreKit/cj-apis-security_huks.md#func-iskeyitemexiststring-huksoptions) interface to check whether the key exists.

## Example

<!--compile-->
```cangjie
import kit.UniversalKeystoreKit.*

/* 1. Determine the key alias */
let keyAlias = "test_is_key_item_exist"

/* 2. Check whether the key exists. a should be false */
var a = isKeyItemExist(keyAlias, HuksOptions.NONE)

let options = HuksOptions(
    [
        HuksParam(HuksTag.HUKS_TAG_ALGORITHM, HuksKeyAlg.HUKS_ALG_AES),
        HuksParam(HuksTag.HUKS_TAG_KEY_SIZE, HuksKeySize.HUKS_AES_KEY_SIZE_128),
        HuksParam(
            HuksTag.HUKS_TAG_PURPOSE,
            HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT | HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
        )
    ],
    Option.None
)

/* 3. Generate the key */
generateKeyItem(keyAlias, options)
/* 4. Check whether the key exists. a should now be true */
a = isKeyItemExist(keyAlias, HuksOptions.NONE)
```