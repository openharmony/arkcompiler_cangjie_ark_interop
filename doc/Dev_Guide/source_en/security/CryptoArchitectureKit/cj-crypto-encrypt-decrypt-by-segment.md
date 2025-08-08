# Segment Encryption and Decryption Instructions

During the encryption and decryption process, the algorithm library does not impose size limits on single or cumulative data input. However, when handling large data volumes (e.g., exceeding 2MB), developers are advised to segment the data and perform segmented encryption/decryption for improved efficiency.

## Symmetric Encryption and Decryption

For symmetric key segmented encryption/decryption, implement it by calling the [update](../../../../API_Reference/source_en/apis/CryptoArchitectureKit/cj-apis-crypto.md#func-updatedatablob) function.

Developers can customize the data volume per input (e.g., `updateLength` in examples) and invoke `update` multiple times for data transmission.

The current maximum supported single input length is `INT_MAX` (maximum length of Uint8Array type).

**Development Example:** [Segmented AES Symmetric Key Encryption/Decryption (GCM Mode)](./cj-crypto-aes-sym-encrypt-decrypt-gcm-by-segment.md)

**Development Example:** [Segmented SM4 Symmetric Key Encryption/Decryption (GCM Mode)](./cj-crypto-sm4-sym-encrypt-decrypt-gcm-by-segment.md)

## Asymmetric Encryption and Decryption

Asymmetric encryption/decryption does not support `update` operations. Simply call [init](../../../../API_Reference/source_en/apis/CryptoArchitectureKit/cj-apis-crypto.md#func-initcryptomode-key-paramsspec) to complete the process.

Segmented encryption with asymmetric keys refers to splitting plaintext into appropriately sized segments when it exceeds the single-encryption data length limit (specific lengths are detailed in [Asymmetric Key Encryption/Decryption Algorithm Specifications](./cj-crypto-asym-encrypt-decrypt-spec.md)). Each segment undergoes encryption by creating a Cipher and invoking the [init](../../../../API_Reference/source_en/apis/CryptoArchitectureKit/cj-apis-crypto.md#func-initcryptomode-key-paramsspec) interface.

Technically, this constitutes split-data encryption/decryption, where the single input data length correlates with key specifications:

- **RSA**: Input data rules vary by padding mode. Refer to [RSA Algorithm Specifications](./cj-crypto-asym-encrypt-decrypt-spec.md#rsa) for permissible single input lengths.
- **SM2**: Encryption length must adhere to fixed parameters. See [SM2 Algorithm Specifications](./cj-crypto-asym-encrypt-decrypt-spec.md#sm2) for details.

## Frequently Asked Questions

**Does the data volume per update in segmented encryption/decryption relate to the encryption mode?**

   The data volume per update is developer-defined and independent of encryption modes.

   Different encryption modes only affect cryptographic parameters. Each mode uses distinct parameters, as specified in [ParamsSpec](../../../../API_Reference/source_en/apis/CryptoArchitectureKit/cj-apis-crypto.md#interface-paramsspec).