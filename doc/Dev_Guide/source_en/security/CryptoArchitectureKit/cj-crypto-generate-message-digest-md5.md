# Message Digest Calculation MD5

For corresponding algorithm specifications, please refer to [Message Digest Calculation Algorithm Specifications](./cj-crypto-generate-message-digest-overview.md#supported-algorithms-and-specifications).

## Development Steps

When passing data through the update interface, you can either [pass all data at once](#digest-algorithm-single-pass) or manually segment the data and perform [segmented updates](#segmented-digest-algorithm). For the same segment of data, the calculation results will be identical. For large volumes of data, developers can choose whether to pass data in segments based on actual requirements.

Example codes for both approaches are provided below.

### Digest Algorithm (Single Pass)

1. Call [createMd](../../../../API_Reference/source_en/apis/CryptoArchitectureKit/cj-apis-crypto.md#func-createmdstring), specify the MD5 digest algorithm to generate a digest instance (Md).

2. Call [update](../../../../API_Reference/source_en/apis/CryptoArchitectureKit/cj-apis-crypto.md#func-updatedatablob-2), pass custom message data for digest update calculation. There is no length restriction for single update operations.

3. Call [digest](../../../../API_Reference/source_en/apis/CryptoArchitectureKit/cj-apis-crypto.md#func-digest) to obtain the digest calculation result.

4. Call [getMdLength](../../../../API_Reference/source_en/apis/CryptoArchitectureKit/cj-apis-crypto.md#func-getmdlength) to get the digest calculation length in bytes.

### Example: Single Pass Data Input for Digest Calculation

<!-- compile -->

```cangjie
import kit.CryptoArchitectureKit.*

func doMd() {
    let mdAlgName = 'MD5' // Digest algorithm name.
    let message = 'mdTestMessage' // Data to be digested.
    let md = createMd(mdAlgName)
    // For small data volumes, a single update with all data can be performed. The interface imposes no length restrictions on input parameters.
    md.update(DataBlob(message.toArray()))
    let mdResult = md.digest()
    AppLog.info('[Sync]:Md result: ${mdResult.data}')
    let mdLen = md.getMdLength()
    AppLog.info("md len: ${mdLen}")
}
```

### Segmented Digest Algorithm

1. Call [createMd](../../../../API_Reference/source_en/apis/CryptoArchitectureKit/cj-apis-crypto.md#func-createmdstring), specify the MD5 digest algorithm to generate a digest instance (Md).

2. Pass custom message data, setting the single-pass data volume to 20 bytes, and call [update](../../../../API_Reference/source_en/apis/CryptoArchitectureKit/cj-apis-crypto.md#func-updatedatablob-2) multiple times for segmented digest update calculations.

3. Call [digest](../../../../API_Reference/source_en/apis/CryptoArchitectureKit/cj-apis-crypto.md#func-digest) to obtain the digest calculation result.

4. Call [getMdLength](../../../../API_Reference/source_en/apis/CryptoArchitectureKit/cj-apis-crypto.md#func-getmdlength) to get the digest calculation length in bytes.

### Example: Segmented Data Input for Digest Calculation

<!-- compile -->

```cangjie
import kit.CryptoArchitectureKit.*

func doLoopMd() {
    let mdAlgName = "MD5" // Digest algorithm name.
    let md = createMd(mdAlgName)
    // Assuming the total message is 43 bytes, which remains 43 bytes after UTF-8 decoding.
    let messageText = "aaaaa.....bbbbb.....ccccc.....ddddd.....eee"
    let messageData = messageText.toArray()
    let updateLength = 20 // Hypothetically segmenting updates in 20-byte units (no actual requirement exists).
    let size = messageData.size
    for (i in 0..size : updateLength) {
        let len = if (i + updateLength > size) {
            size
        } else {
            i + updateLength
        }
        let updateMessage = messageData[i..len]
        let updateMessageBlob: DataBlob = DataBlob(updateMessage)
        md.update(updateMessageBlob)
    }
    let mdOutput = md.digest()
    AppLog.info('[Sync]:Md result: ${mdOutput.data}')
    let mdLen = md.getMdLength()
    AppLog.info("md len: ${mdLen}")
}
```