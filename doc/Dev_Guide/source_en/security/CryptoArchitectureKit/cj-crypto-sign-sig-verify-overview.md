# Introduction to Signature and Verification Algorithms

When it is necessary to determine whether received data has been tampered with or whether the data was sent by a specified entity, signature and verification operations can be used.

The following sections describe the algorithms currently supported by the system and their corresponding specifications.

## RSA

The cryptographic library framework currently provides two RSA signature and verification padding modes:

- [PKCS1](#padding-mode-pkcs1): Corresponds to the RSAES-PKCS1-V1_5 mode in RFC3447, equivalent to RSA_PKCS1_PADDING in OpenSSL.

  When using this mode, a digest (md) must be specified. The output length of the digest algorithm must be less than the RSA key length. For example, an RSA2048 key has a byte length of 256.

- [PSS](#padding-mode-pss): Corresponds to the RSASSA-PSS mode in RFC3447, equivalent to RSA_PKCS1_PSS_PADDING in OpenSSL.

  When using this mode, two digests (md and mgf1_md) must be specified, and the sum of the lengths of md and mgf1_md must be less than the RSA key length. For example, an RSA2048 key has a byte length of 256.

  This mode also allows additional configuration of the salt length (saltLen) for obtaining PSS-related parameters. (Unit: bytes)

  | PSS Parameters | Description |
  | :-------- | :-------- |
  | md | Digest algorithm. |
  | mgf | Mask generation algorithm. Currently, only MGF1 is supported. |
  | mgf1_md | Digest algorithm used in the MGF1 algorithm. |
  | saltLen | Salt length. (Unit: bytes) |
  | trailer_field | Integer used for encoding operations. Only supports the value 1. |

> **Note:**
>
> Using synchronous interfaces to generate RSA2048, RSA3072, RSA4096, or RSA8192 asymmetric keys or plaintext exceeding 2048 bytes will result in increased processing time.

### Padding Mode: PKCS1

To perform RSA signature and verification using string parameters, the specific "string parameter" is constructed by concatenating "asymmetric key type," "padding mode PKCS1," and "digest" with the "|" symbol. This is used to specify the asymmetric signature and verification algorithm specifications when creating an asymmetric signature and verification instance.

As shown in the table, only one option can be selected from each range (i.e., the content within `[]`) to complete the string concatenation. For example, when an asymmetric key type of RSA512, padding mode of PKCS1, and digest algorithm of MD5 are required, the string parameter is `"RSA512|PKCS1|MD5"`.

> **Note:**
>
> For RSA signature and verification, the output length of the digest algorithm must be less than the RSA key length. For example, when the RSA key is 512 bits, SHA512 is not supported.

| Asymmetric Key Type | Padding Mode | Digest Algorithm | API Version |
| :-------- | :-------- | :-------- | :-------- |
| RSA512 | PKCS1 | [MD5\|SHA1\|SHA224\|SHA256] | 12+ |
| RSA768 | PKCS1 | [MD5\|SHA1\|SHA224\|SHA256\|SHA384\|SHA512] | 12+ |
| RSA1024 | PKCS1 | [MD5\|SHA1\|SHA224\|SHA256\|SHA384\|SHA512] | 12+ |
| RSA2048 | PKCS1 | [MD5\|SHA1\|SHA224\|SHA256\|SHA384\|SHA512] | 12+ |
| RSA3072 | PKCS1 | [MD5\|SHA1\|SHA224\|SHA256\|SHA384\|SHA512] | 12+ |
| RSA4096 | PKCS1 | [MD5\|SHA1\|SHA224\|SHA256\|SHA384\|SHA512] | 12+ |
| RSA8192 | PKCS1 | [MD5\|SHA1\|SHA224\|SHA256\|SHA384\|SHA512] | 12+ |
| RSA | PKCS1 | Digest algorithm meeting length requirements | 12+ |

As shown in the last row of the table, to ensure compatibility with keys generated from key parameters, the RSA signature and verification parameters support omitting the key length when specifying the key type. The actual signature and verification operations depend on the length of the input key.

### Padding Mode: PSS

To perform RSA signature and verification using string parameters, the specific "string parameter" is constructed by concatenating "asymmetric key type," "padding mode PSS," "digest," and "mask digest" with the "|" symbol. This is used to specify the asymmetric signature and verification algorithm specifications when creating an asymmetric signature and verification instance.

As shown in the table, only one option can be selected from each range (i.e., the content within `[]`) to complete the string concatenation. For example, when an asymmetric key type of RSA2048, padding mode of PSS, digest algorithm of SHA256, and mask digest of MGF1_SHA256 are required, the string parameter is `"RSA2048|PSS|SHA256|MGF1_SHA256"`.

> **Note:**
>
> For RSA signature and verification in PSS mode, the sum of the lengths of md and mgf1_md must be less than the RSA key length. For example, when the RSA key is 512 bits, it cannot support both md and mgf1_md being SHA256.

| Asymmetric Key Type | Padding Mode | Digest | Mask Digest | API Version |
| :-------- | :-------- | :-------- | :-------- | :-------- |
| RSA512 | PSS | MD5 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256] | 12+ |
| RSA512 | PSS | SHA1 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256] | 12+ |
| RSA512 | PSS | SHA224 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256] | 12+ |
| RSA512 | PSS | SHA256 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224] | 12+ |
| RSA768 | PSS | MD5 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA768 | PSS | SHA1 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA768 | PSS | SHA224 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA768 | PSS | SHA256 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384] | 12+ |
| RSA768 | PSS | SHA384 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256] | 12+ |
| RSA768 | PSS | SHA512 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224] | 极客时间 | 12+ |
| RSA1024 | PSS | MD5 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA1024 | PSS | SHA1 | [MGF1_MD5\|MGF1_SHA1\|M极客时间F1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA1024 | PSS | SHA224 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA1024 | PSS | SHA256 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA1024 | PSS | SHA384 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA1024 | PSS | SHA512 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384] | 12+ |
| RSA2048 | PSS | MD5 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA2048 | PSS | SHA1 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA2048 | PSS | SHA224 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF极客时间1_SHA512] | 12+ |
| RSA2048 | PSS | SHA256 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA2048 | PSS | SHA384 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA2048 | PSS | SHA512 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA3072 | PSS | MD5 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA3072 | PSS | SHA1 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA3072 | PSS | SHA224 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA3072 | PSS | SHA256 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA3072 | PSS | SHA384 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA3072 | PSS | SHA512 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA4096 | PSS | MD5 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA4096 | PSS | SHA1 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA4096 | PSS | SHA224 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA4096 | PSS | SHA256 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA4096 | PSS | SHA384 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA4096 | PSS | SHA512 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA8192 | PSS | MD5 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA8192 | PSS | SHA1 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA8192 | PSS | SHA224 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA8192 | PSS | SHA256 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA8192 | PSS | SHA384 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA8192 | PSS | SHA512 | [MGF1_MD5\|MGF1_SHA1\|MGF1_SHA224\|MGF1_SHA256\|MGF1_SHA384\|MGF1_SHA512] | 12+ |
| RSA | PSS | Digest algorithm meeting length requirements | MGF1_Digest algorithm meeting length requirements | 12+ |

As shown in the last row of the table, to ensure compatibility with keys generated from key parameters, the RSA signature and verification parameters support omitting the key length when specifying the key type. The actual signature and verification operations depend on the length of the input key.

### Get/Set PSS Padding Mode Parameters

Currently, when RSA uses PSS padding mode, the following parameters can be retrieved or configured. A "√" indicates support for retrieving or setting the parameter.

| PSS Parameter | Enum Value | Get | Set |
| :-------- | :-------- | :-------- | :-------- |
| md | PSS_MD_NAME_STR | √ | - |
| mgf | PSS_MGF_NAME_STR | √ | - |
| mgf1_md | PSS_MGF1_MD_STR | √ | - |
| saltLen | PSS_SALT_LEN_NUM | √ | √ |
| trailer_field | PSS_TRAILER_FIELD_NUM | √ | - |

### Signature Mode: OnlySign

The cryptographic library framework currently provides an RSA signature function that performs signing without digesting.

To perform RSA signing using string parameters, the specific "string parameter" is constructed by concatenating "asymmetric key type," "padding mode," "digest," and "signature mode" with the "|" symbol. This is used to specify the asymmetric signature algorithm specifications when creating an asymmetric signature instance.

As shown in the table, only one option can be selected from each range (i.e., the content within `[]`) to complete the string concatenation. For example, when an asymmetric key type of RSA2048, padding mode of PKCS1, digest algorithm of SHA256, and signature mode of OnlySign are required, the string parameter is `"RSA2048|PKCS1|SHA256|OnlySign"`.

> **Note:**
>
> - For RSA signing without digesting, there are length requirements for the data to be signed:
>   - PKCS1 padding mode with NoHash (no digest algorithm): The data must be less than the RSA key byte length minus 11 (PKCS1 padding length).
>   - PKCS1 padding mode with any digest algorithm: The data to be signed must be the corresponding digest data.
>   - NoPadding (no padding mode) with NoHash (no digest algorithm): The data to be signed must equal the RSA key byte length and its value must be less than the RSA modulus.

| Asymmetric Key Type | Padding Mode | Digest Algorithm | Signature Mode | API Version |
| :-------- | :-------- | :-------- | :-------- | :-------- |
| RSA512 | PKCS1 | [NoHash\|MD5\|SHA1\|SHA224\|SHA256] | OnlySign | 12+ |
| RSA768 | PKCS1 | [NoHash\|