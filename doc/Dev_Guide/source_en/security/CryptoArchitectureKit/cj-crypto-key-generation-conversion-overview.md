# Key Generation and Conversion Introduction

The following scenarios often require key generation operations:

1. Randomly generate cryptographic library key objects. These objects can be used for subsequent encryption/decryption operations.

2. Generate cryptographic library key objects from specified data (i.e., converting external or stored binary data into cryptographic library key objects). These objects can be used for subsequent encryption/decryption operations.

3. Generate specified cryptographic library key objects based on key parameters. These objects can be used for subsequent encryption/decryption operations.

4. Obtain binary data of cryptographic library key objects for storage or transmission.

5. For asymmetric keys, obtain parameter attributes of key objects for storage or transportation.

Here, key objects (Key) include symmetric keys (SymKey) and asymmetric keys (public keys PubKey and private keys PriKey), where public and private keys together form a key pair (KeyPair).