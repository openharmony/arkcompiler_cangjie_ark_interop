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

package ohos_app_cangjie_entry

let _ = testsuite()

func testsuite(): Unit {
    registerTestSuite("TestDistinct_1", {
        => TestDistinct_1()
    })    
    registerTestSuite("TestEndsWith_1", {
        => TestEndsWith_1()
    })    
    registerTestSuite("TestEndWrap_1", {
        => TestEndWrap_1()
    })    
    registerTestSuite("TestEqualTo_1", {
        => TestEqualTo_1()
    })    
    registerTestSuite("TestGetAsset_1", {
        => TestGetAsset_1()
    })    
    registerTestSuite("TestGetBlob_1", {
        => TestGetBlob_1()
    }) 
    registerTestSuite("TestDeleteRdbStore1_1", {
        => TestDeleteRdbStore1_1()
    })
    registerTestSuite("TestDeleteRdbStore_1", {
        => TestDeleteRdbStore_1()
    })
    registerTestSuite("TestGetRdbStore_1", {
        => TestGetRdbStore_1()
    })
    registerTestSuite("TestAnd_1", {
        => TestAnd_1()
    })
    registerTestSuite("TestBeginWrap_1", {
        => TestBeginWrap_1()
    })
    registerTestSuite("TestBeginsWith_1", {
        => TestBeginsWith_1()
    })
    registerTestSuite("TestContains_1", {
        => TestContains_1()
    })
    registerTestSuite("TestGlob_1", {
        => TestGlob_1()
    })
    registerTestSuite("TestGreaterThan_1", {
        => TestGreaterThan_1()
    })
    registerTestSuite("TestGreaterThanOrEqualTo_1", {
        => TestGreaterThanOrEqualTo_1()
    })
    registerTestSuite("TestGroupBy_1", {
        => TestGroupBy_1()
    })
    registerTestSuite("TestInAllDevices_1", {
        => TestInAllDevices_1()
    })
    registerTestSuite("TestIsNotNull_1", {
        => TestIsNotNull_1()
    })
    registerTestSuite("TestIsNull_1", {
        => TestIsNull_1()
    })
    registerTestSuite("TestLike_1", {
        => TestLike_1()
    })
    registerTestSuite("TestLimitAs_1", {
        => TestLimitAs_1()
    })
    registerTestSuite("TestNotBetween_1", {
        => TestNotBetween_1()
    })
    registerTestSuite("TestOffSetAs_1", {
        => TestOffSetAs_1()
    })
    registerTestSuite("TestOr_1", {
        => TestOr_1()
    })
    registerTestSuite("TestOrderByAsc_1", {
        => TestOrderByAsc_1()
    })
    registerTestSuite("TestOrderByDesc_1", {
        => TestOrderByDesc_1()
    })


    registerTestSuite("TestGetColumnIndex_1", {
        => TestGetColumnIndex_1()
    })
    registerTestSuite("TestGetColumnName_1", {
        => TestGetColumnName_1()
    })
    registerTestSuite("TestGetLong_1", {
        => TestGetLong_1()
    })
    registerTestSuite("TestGetRow_1", {
        => TestGetRow_1()
    })
    registerTestSuite("TestGetString_1", {
        => TestGetString_1()
    })
    registerTestSuite("TestGoTo_1", {
        => TestGoTo_1()
    })
    registerTestSuite("TestGoToFirstRow_1", {
        => TestGoToFirstRow_1()
    })
    registerTestSuite("TestGoToLastRow_1", {
        => TestGoToLastRow_1()
    })
    registerTestSuite("TestGoToNextRow_1", {
        => TestGoToNextRow_1()
    })
    registerTestSuite("TestGoToPreviousRow_1", {
        => TestGoToPreviousRow_1()
    })
    registerTestSuite("TestGoToRow_1", {
        => TestGoToRow_1()
    })
    registerTestSuite("TestIsColumnNull_1", {
        => TestIsColumnNull_1()
    })
    registerTestSuite("TestRdbStore_backup_1", {
        => TestRdbStore_backup_1()
    })
    registerTestSuite("TestRdbStore_commit_1", {
        => TestRdbStore_commit_1()
    })
    registerTestSuite("TestRdbStore_delete_1", {
        => TestRdbStore_delete_1()
    })
    registerTestSuite("TestRdbStore_emit_1", {
        => TestRdbStore_emit_1()
    })
    registerTestSuite("TestRdbStore_on_off_1", {
        => TestRdbStore_on_off_1()
    })
}
