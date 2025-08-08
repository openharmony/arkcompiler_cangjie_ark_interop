# Introduction to Key Derivation and Algorithm Specifications

A key derivation function (KDF) refers to the use of a pseudorandom function to derive one or more keys from a secret value. Key derivation functions can be used to extend keys into longer keys or obtain keys in the desired format.

## PBKDF2 Algorithm

PBKDF (Password-Based Key Derivation Function) is a key derivation function with variable computational cost, and PBKDF2 is one of the standards in the PKCS series.

PBKDF2 uses a pseudorandom function PRF (Pseudo-Random Function, such as hash-based [HMAC](./cj-crypto-compute-mac.md)), takes a plaintext password and salt value as input, and performs repeated operations to derive keys.

Currently, key derivation using string parameters is supported. The specific "string parameter" is formed by concatenating the "key derivation function" and the "HMAC function digest algorithm" with the "|" symbol, which is used to specify the algorithm specification when creating a key derivation function generator.

| Key Derivation Algorithm | HMAC Function Digest Algorithm | String Parameter | API Version |
| :-------- | :-------- | :-------- | :-------- |
| PBKDF2 | SHA1 | PBKDF2\|SHA1 | 12+ |
| PBKDF2 | SHA224 | PBKDF2\|SHA224 | 12+ |
| PBKDF2 | SHA256 | PBKDF2\|SHA256 | 12+ |
| PBKDF2 | SHA384 | PBKDF2\|SHA384 | 12+ |
| PBKDF2 | SHA512 | PBKDF2\|SHA512 | 12+ |
| PBKDF2 | SM3 | PBKDF2\|SM3 | 12+ |

## HKDF Algorithm

HKDF (HMAC-based Extract-and-Expand Key Derivation Function) is a simple key derivation based on [HMAC](./cj-crypto-compute-mac.md) message authentication code. It takes the original key material and salt value for extraction and the original key material and expansion information for expansion. It is a key derivation function used to derive longer output keys from shorter input keys.

HKDF includes three modes: extract (EXTRACT_ONLY), expand (EXPAND_ONLY), and extract-and-expand (EXTRACT_AND_EXPAND).

- **Extract**: Uses the original key material to derive a cryptographically strong pseudorandom key.
- **Expand**: Extends a short key into a longer one, using the extracted pseudorandom key to expand into a key of the specified length while ensuring randomness.
- **Extract and Expand**: Derives a pseudorandom key and expands it into a key of the specified length.

Currently, key derivation using string parameters is supported. The specific "string parameter" is formed by concatenating the "key derivation function," "HMAC function digest algorithm," and "mode" with the "|" symbol, which is used to specify the algorithm specification when creating a key derivation function generator.

| Key Derivation Algorithm | HMAC Function Digest Algorithm | Mode | String Parameter | API Version |
| :-------- | :-------- | :-------- | :-------- | :-------- |
| HKDF | SHA1 | [EXPAND_ONLY\|EXTRACT_ONLY\|EXTRACT_AND_EXPAND] | HKDF\|SHA1 | 12+ |
| HKDF | SHA224 | [EXPAND_ONLY\|EXTRACT_ONLY\|EXTRACT_AND_EXPAND] | HKDF\|SHA224 | 12+ |
| HKDF | SHA256 | [EXPAND_ONLY\|EXTRACT_ONLY\|EXTRACT_AND_EXPAND] | HKDF\|SHA256 | 12+ |
| HKDF | SHA384 | [EXPAND_ONLY\|EXTRACT_ONLY\|EXTRACT_AND_EXPAND] | HKDF\|SHA384 | 12+ |
| HKDF | SHA512 | [EXPAND_ONLY\|EXTRACT_ONLY\|EXTRACT_AND_EXPAND] | HKDF\|SHA512 | 12+ |
| HKDF | SM3 | [EXPAND_ONLY\|EXTRACT_ONLY\|EXTRACT_AND_EXPAND] | HKDF\|SM3 | 12+ |