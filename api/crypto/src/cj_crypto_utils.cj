/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package ohos.crypto

import std.collection.HashMap
import ohos.ffi.*
import ohos.base.*

const SPEC_ITEM_TYPE_BIG_INT = 1i32
const SPEC_ITEM_TYPE_NUM = 2i32
const SPEC_ITEM_TYPE_STR = 3i32
const DSA_ASY_KEY_SPEC = "DSA"
const ECC_ASY_KEY_SPEC = "ECC"
const RSA_ASY_KEY_SPEC = "RSA"
const X25519_ASY_KEY_SPEC = "X25519"
const ED25519_ASY_KEY_SPEC = "Ed25519"
const DH_ASY_KEY_SPEC = "DH"
const SM2_ASY_KEY_SPEC = "SM2"
let ASY_KEY_SPEC_RELATION_MAP = HashMap<Int32, Int32>(
    [
        (DSA_P_BN.value, SPEC_ITEM_TYPE_BIG_INT),
        (DSA_Q_BN.value, SPEC_ITEM_TYPE_BIG_INT),
        (DSA_G_BN.value, SPEC_ITEM_TYPE_BIG_INT),
        (DSA_SK_BN.value, SPEC_ITEM_TYPE_BIG_INT),
        (DSA_PK_BN.value, SPEC_ITEM_TYPE_BIG_INT),
        (ECC_FP_P_BN.value, SPEC_ITEM_TYPE_BIG_INT),
        (ECC_A_BN.value, SPEC_ITEM_TYPE_BIG_INT),
        (ECC_B_BN.value, SPEC_ITEM_TYPE_BIG_INT),
        (ECC_G_X_BN.value, SPEC_ITEM_TYPE_BIG_INT),
        (ECC_G_Y_BN.value, SPEC_ITEM_TYPE_BIG_INT),
        (ECC_N_BN.value, SPEC_ITEM_TYPE_BIG_INT),
        (ECC_H_NUM.value, SPEC_ITEM_TYPE_NUM), // warning: ECC_H_NUM in CJ
        (ECC_SK_BN.value, SPEC_ITEM_TYPE_BIG_INT),
        (ECC_PK_X_BN.value, SPEC_ITEM_TYPE_BIG_INT),
        (ECC_PK_Y_BN.value, SPEC_ITEM_TYPE_BIG_INT),
        (ECC_FIELD_TYPE_STR.value, SPEC_ITEM_TYPE_STR),
        (ECC_FIELD_SIZE_NUM.value, SPEC_ITEM_TYPE_NUM), // warning: ECC_FIELD_SIZE_NUM in CJ
        (ECC_CURVE_NAME_STR.value, SPEC_ITEM_TYPE_STR),
        (RSA_N_BN.value, SPEC_ITEM_TYPE_BIG_INT),
        (RSA_SK_BN.value, SPEC_ITEM_TYPE_BIG_INT),
        (RSA_PK_BN.value, SPEC_ITEM_TYPE_BIG_INT),
        (DH_P_BN.value, SPEC_ITEM_TYPE_BIG_INT),
        (DH_G_BN.value, SPEC_ITEM_TYPE_BIG_INT),
        (DH_L_NUM.value, SPEC_ITEM_TYPE_NUM),
        (DH_PK_BN.value, SPEC_ITEM_TYPE_BIG_INT),
        (DH_SK_BN.value, SPEC_ITEM_TYPE_BIG_INT),
        (ED25519_SK_BN.value, SPEC_ITEM_TYPE_BIG_INT),
        (ED25519_PK_BN.value, SPEC_ITEM_TYPE_BIG_INT),
        (X25519_SK_BN.value, SPEC_ITEM_TYPE_BIG_INT),
        (X25519_PK_BN.value, SPEC_ITEM_TYPE_BIG_INT)
    ]
)

func getAsyKeySpecType(targetItemType: Int32): Int32 {
    return ASY_KEY_SPEC_RELATION_MAP.get(targetItemType) ?? throw BusinessException(ERR_PARAMETER_ERROR,
        "AsyKeySpecItem not support!")
}

unsafe func mallocCString(str: Option<String>): CString {
    if (let Some(v) <- str) {
        return LibC.mallocCString(v)
    }
    return CString(CPointer<UInt8>())
}
