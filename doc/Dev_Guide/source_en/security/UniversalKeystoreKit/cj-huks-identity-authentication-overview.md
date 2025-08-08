# Introduction to User Identity Authentication Access Control

HUKS provides comprehensive key access control capabilities to ensure that keys stored in HUKS are accessed legally and correctly:

- Services can only access their own keys, meaning they can only access keys generated or imported through HUKS.

- Supports user identity authentication access control for keys. For high-security-level keys that protect sensitive data, users are required to verify their screen lock password or biometrics in real-time when using the key. The key can only be used after successful verification.

- Supports strict restrictions on key usage purposes. For example, AES keys can only be used for encryption/decryption, while RSA keys can only be used for signature verification.

> **Note:**
>
> Lightweight devices do not support user identity authentication access control.

## Usage Scenarios and Development Process

The entire user identity authentication access control involves multiple steps, including:

- User identity authentication
- Setting authorized access types
- Supporting challenge value verification
- Secondary authentication key access control

### User Identity Authentication

When generating/importing keys, it can be specified that the key must undergo user identity authentication before use. Applications can specify a subset of credentials (screen lock password, fingerprint, face) used to unlock the device for identity authentication. For details, refer to [Detailed Specifications of User Identity Authentication and Authorized Access Types](#detailed-specifications-of-user-identity-authentication-and-authorized-access-types).

After generating/importing keys, even if the application process is attacked, unauthorized key access by users will not occur. This is generally used for highly sensitive and high-security scenarios, such as password-free login, password-free payment, and automatic password filling protection.

### Setting Authorized Access Types

In addition to user identity authentication, applications must set the key's authorized access type (i.e., invalidation conditions) to one of the following three types:

- **Keys become permanently invalid after clearing the screen lock password.**

  After generating/importing keys, once the screen lock password is cleared, such keys will become permanently invalid. Changing the password will not cause invalidation.

  Prerequisite: The current user has already set a screen lock password.

  Applicable scenarios: Protecting user-strongly-related data, screen lock password-authorized access to certain functions.

- **Keys under this feature become permanently invalid after the user enrolls new biometrics.**

  After generating/importing keys, once new biometrics are enrolled, such keys under this feature will become permanently invalid. Merely deleting biometrics will not cause invalidation.

  This means that under this authorized access type, enrolling new biometrics of the same type will render such keys unusable, while other authentication methods (other biometrics, screen lock password) can still use such keys normally. Note that if the screen lock password is cleared, keys of this authorized access type will also become permanently invalid.

  Prerequisite: The current user has enrolled at least one biometric (e.g., fingerprint).

  Applicable scenarios: Password-free login, password-free payment, etc.

- **User keys are always valid.**

  Keys generated in this mode will remain permanently valid unless the user actively deletes them.

  This means that no matter how the user clears or changes the screen lock password and biometrics, as long as user identity authentication is successful, such keys can always be used.

  When generating keys, they will be bound to the foreground user ID. When using keys generated in this mode, only the foreground user ID will be verified.

### Supporting Challenge Value Verification

Additionally, to ensure the validity of user authentication results (non-replayable) when using keys, HUKS supports challenge value verification.

Before identity authentication, a challenge value must be obtained from HUKS and passed to the user identity authentication method. Then, during key operations, the challenge value of the authentication token is verified.

### Secondary Authentication Key Access Control

Furthermore, secondary authentication key access control includes the following three methods:

- **Access Control Based on AuthToken**

  ![Access Control(2)](./figures/访问控制(2).png)

  The user identity authentication access control process is as shown above.

  Among them, the AT KEY (symmetric key) is re-derived by the HUKS TA each time it starts, based on the device's secure root key. The interaction between UserIAM and HUKS occurs within the TEE environment.

- **Allowing One-Time Authentication for Multiple Authorizations**

  Key management supports one-time authentication for multiple authorizations, allowing access control authorization for multiple keys to be completed through a single authentication.

  Applicable scenarios: For example, phone cloning, where data needs to be exported in one go, only requiring one screen lock password verification.

  Usage: HUKS generates an 8-byte Challenge each time, while the Challenge passed to UserIAM can be extended to 32 bytes, thus supporting authorization for up to 4 keys at once. The service calls HUKS to generate an 8-byte Challenge for each key, then concatenates multiple Challenges into one Challenge and passes it to UserIAM for authentication.

- **Supporting Timestamp-Based Access Control**

  For certain special scenarios, such as high-performance scenarios, timestamp-based Challenge-free implementation is supported. When generating a key, a timeout period is set. When the service uses the key, it directly requests UserIAM to initiate authentication, then passes the AuthToken containing the timestamp to HUKS. HUKS verifies the AuthToken and compares the difference between the current time and the timestamp to determine whether the key can be used.

## Detailed Specifications of User Identity Authentication and Authorized Access Types

For convenience, corresponding abbreviations are used in the table to refer to specific user authentication types, with the following mappings:

- HUKS_USER_AUTH_TYPE_PIN, i.e., screen lock password. Abbreviated as PIN.
- HUKS_USER_AUTH_TYPE_FACE, i.e., biometrics (face). Abbreviated as FACE.
- HUKS_USER_AUTH_TYPE_FINGERPRINT, i.e., biometrics (fingerprint). Abbreviated as FINGERPRINT.

Secure access control types are abbreviated as:

- HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD, i.e., keys become permanently invalid after clearing the screen lock password. Abbreviated as INVALID_CLEAR_PASSWORD.
- HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL, i.e., keys under this feature become permanently invalid after the user enrolls new biometrics. Abbreviated as INVALID_NEW_BIO_ENROLL.
- HUKS_AUTH_ACCESS_ALWAYS_VALID, i.e., user keys are always valid. Abbreviated as ALWAYS_VALID.

| User Identity Authentication       | Authorized Access Type     | Description                                                  |
| :--------------------------------- | :------------------------- | :----------------------------------------------------------- |
| PIN                                | INVALID_CLEAR_PASSWORD     | Currently, only screen lock password is supported for identity authentication. Keys become permanently invalid after clearing the screen lock password. |
| FACE                               | INVALID_CLEAR_PASSWORD     | Currently, only face is supported for identity authentication. Keys become permanently invalid after clearing the screen lock password. |
| FINGERPRINT                        | INVALID_CLEAR_PASSWORD     | Currently, only fingerprint is supported for identity authentication. Keys become permanently invalid after clearing the screen lock password. |
| PIN \| FACE                        | INVALID_CLEAR_PASSWORD     | Currently, either screen lock password or face can be used for identity authentication. Keys become permanently invalid after clearing the screen lock password. |
| PIN \| FINGERPRINT                 | INVALID_CLEAR_PASSWORD     | Currently, either screen lock password or fingerprint can be used for identity authentication. Keys become permanently invalid after clearing the screen lock password. |
| PIN \| FACE \| FINGERPRINT         | INVALID_CLEAR_PASSWORD     | Currently, either screen lock password, face, or fingerprint can be used for identity authentication. Keys become permanently invalid after clearing the screen lock password. |
| FACE                               | INVALID_NEW_BIO_ENROLL     | Currently, only face is supported for identity authentication. Keys become permanently invalid after enrolling a new face. |
| FINGERPRINT                        | INVALID_NEW_BIO_ENROLL     | Currently, only fingerprint is supported for identity authentication. Keys become permanently invalid after enrolling a new fingerprint. |
| PIN \| FACE                        | INVALID_NEW_BIO_ENROLL     | Currently, either screen lock password or face can be used for identity authentication. After enrolling a new face, users cannot use the key via face credentials but can still use it via screen lock password. Keys become permanently invalid after clearing the screen lock password. |
| PIN \| FINGERPRINT                 | INVALID_NEW_BIO_ENROLL     | Currently, either screen lock password or fingerprint can be used for identity authentication. After enrolling a new fingerprint, users cannot use the key via fingerprint credentials but can still use it via screen lock password. Keys become permanently invalid after clearing the screen lock password. |
| FACE \| FINGERPRINT                | INVALID_NEW_BIO_ENROLL     | Currently, either face or fingerprint can be used for identity authentication. After enrolling new biometrics, users cannot use the key via that biometric credential, but other credentials remain unaffected. |
| PIN \| FACE \| FINGERPRINT         | INVALID_NEW_BIO_ENROLL     | Currently, either screen lock password, face, or fingerprint can be used for identity authentication. After enrolling new biometrics, users cannot use the key via that biometric credential, but other credentials remain unaffected. Keys become permanently invalid after clearing the screen lock password. |
| PIN                                | ALWAYS_VALID               | Currently, only screen lock password is supported for identity authentication. Keys remain permanently valid. |
| FACE                               | ALWAYS_VALID               | Currently, only face is supported for identity authentication. Keys remain permanently valid. |
| FINGERPRINT                        | ALWAYS_VALID               | Currently, only fingerprint is supported for identity authentication. Keys remain permanently valid. |
| PIN \| FACE                        | ALWAYS_VALID               | Currently, either screen lock password or face can be used for identity authentication. Keys remain permanently valid. |
| PIN \| FINGERPRINT                 | ALWAYS_VALID               | Currently, either screen lock password or fingerprint can be used for identity authentication. Keys remain permanently valid. |
| FACE \| FINGERPRINT                | ALWAYS_VALID               | Currently, either face or fingerprint can be used for identity authentication. Keys remain permanently valid. |
| PIN \| FACE \| FINGERPRINT         | ALWAYS_VALID               | Currently, either screen lock password, face, or fingerprint can be used for identity authentication. Keys remain permanently valid. |