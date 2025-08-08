# Using AES Symmetric Key (ECB Mode) for Encryption and Decryption

For corresponding algorithm specifications, please refer to [Symmetric Key Encryption/Decryption Algorithm Specifications: AES](./cj-crypto-sym-encrypt-decrypt-spec.md#aes).

## Encryption

1. Call [createSymKeyGenerator](../../../../API_Reference/source_en/apis/CryptoArchitectureKit/cj-apis-crypto.md#func-createsymkeygeneratorstring) to generate a symmetric key (SymKey) with AES as the key algorithm and a key length of 128 bits.

   For guidance on generating an AES symmetric key, developers can refer to the example below, combined with [Symmetric Key Generation and Conversion Specifications: AES](./cj-crypto-sym-key-generation-conversion-spec.md#aes) and [Random Symmetric Key Generation](./cj-crypto-generate-sym-key-randomly.md). Note that reference documents may have parameter differences from the current example—please pay attention to these distinctions when reading.

2. Call [createCipher](../../../../API_Reference/source_en/apis/CryptoArchitectureKit/cj-apis-crypto.md#func-createcipherstring) with the string parameter 'AES128|ECB|PKCS7' to create a Cipher instance configured for AES128 symmetric key type, ECB block mode, and PKCS7 padding mode, which will be used to perform encryption operations.

3. Call [init](../../../../API_Reference/source_en/apis/CryptoArchitectureKit/cj-apis-crypto.md#func-initcryptomode-key-paramsspec) to set the mode to encryption (CryptoMode.ENCRYPT_MODE), specify the encryption key (SymKey), and initialize the encryption Cipher instance. For ECB mode, Params should be empty.

4. If the content to be encrypted is short, you can skip calling `update` and directly call [doFinal](../../../../API_Reference/source_en/apis/CryptoArchitectureKit/cj-apis-crypto.md#func-dofinaldatablob) to obtain the encrypted data.

## Decryption

1. Call [createCipher](../../../../API_Reference/source_en/apis/CryptoArchitectureKit/cj-apis-crypto.md#func-createcipherstring) with the string parameter 'AES128|ECB|PKCS7' to create a Cipher instance configured for AES128 symmetric key type, ECB block mode, and PKCS7 padding mode, which will be used to perform decryption operations.

2. Call [init](../../../../API_Reference/source_en/apis/CryptoArchitectureKit/cj-apis-crypto.md#func-initcryptomode-key-paramsspec) to set the mode to decryption (CryptoMode.DECRYPT_MODE), specify the decryption key (SymKey), and initialize the decryption Cipher instance. For ECB mode, Params should be empty.

3. If the content to be decrypted is short, you can skip calling `update` and directly call [doFinal](../../../../API_Reference/source_en/apis/CryptoArchitectureKit/cj-apis-crypto.md#func-dofinaldatablob) to obtain the decrypted data.

## Example

The synchronous method example is as follows:

<!-- compile -->

```cangjie
import kit.CryptoArchitectureKit.*
import ohos.base.BusinessException

// Encrypt a message.
func encryptMessage(symKey: SymKey, plainText: DataBlob) {
    let cipher = createCipher('AES128|ECB|PKCS7')
    cipher.`init`(ENCRYPT_MODE, symKey, None) // Params is None for ECB mode.
    let cipherData = cipher.doFinal(plainText)
    return cipherData
}

// Decrypt a message.
func decryptMessage(symKey: SymKey, cipherText: DataBlob) {
    let decoder = createCipher('AES128|ECB|PKCS7')
    decoder.`init`(DECRYPT_MODE, symKey, None) // Params is None for ECB mode.
    let decryptData = decoder.doFinal(cipherText)
    return decryptData
}

func genSymKeyByData(symKeyData: Array<UInt8>) {
    let symKeyBlob: DataBlob = DataBlob(symKeyData)
    let aesGenerator = createSymKeyGenerator('AES128')
    let symKey = aesGenerator.convertKey(symKeyBlob)
    AppLog.info('convertKey success')
    return symKey
}

func test() {
    try {
        let keyData: Array<UInt8> = [83, 217, 231, 76, 28, 113, 23, 219, 250, 71, 209, 210, 205, 97, 32, 159]
        let symKey = genSymKeyByData(keyData)
        let message = "This is a test"
        let plainText: DataBlob = DataBlob(message.toArray())
        let encryptText = encryptMessage(symKey, plainText)
        let decryptText = decryptMessage(symKey, encryptText)
        if (plainText.data.toString() == decryptText.data.toString()) {
            AppLog.info('decrypt ok')
            AppLog.info('decrypt plainText: ' + String.fromUtf8(decryptText.data))
        } else {
            AppLog.error('decrypt failed')
        }
    } catch (e: BusinessException) {
        AppLog.error("AES CBC ${e}, error code: ${e.code}")
    }
}
```