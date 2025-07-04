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

package ohos.form.form_provider

import ohos.ffi.{cArr2cjArr}
import ohos.form.form_info.{FormInfoFilter, FormInfo, CFormInfo, CFormFilter, cFormInfo2FormInfo, CArrCFormInfo, 
    formKitCheckCodeAndThrow}
import ohos.app.form.formBindingData.{FormBindingData, CFormBindingData}
import ohos.labels.*

foreign {
    func FFIFormProviderGetFormsInfo(cfilter: CFormFilter, cArrformInfo: CPointer<CArrCFormInfo>): Int32

    func FFIFormProviderFreeCArrCFormInfo(cArrformInfo: CPointer<CArrCFormInfo>): Unit

    func FFIFormProviderSetFormNextRefreshTime(cFormId: CString, time: Int32): Int32

    func FFIFormProviderUpdateForm(cFormId: CString, cFormBindingData: CFormBindingData): Int32
}

/**
 * Interface of formProvider.
 *
 * @relation declare namespace formProvider;
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.Form"
]
public class FormProvider {
    /**
     * Get infos of all forms belonging to current bundle.
     * Client to communication with FormManagerService.
     *
     * @throws { IllegalArgumentException } - Parameter error.
     * @throws { BusinessException } 16500050 - IPC connection error.
     * @throws { BusinessException } 16500100 - Failed to obtain the configuration information.
     * @throws { BusinessException } 16501000 - An internal functional error occurred.
     * @relation function getFormsInfo(filter?: formInfo.FormInfoFilter): Promise<Array<formInfo.FormInfo>>;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public static func getFormsInfo(filter!: FormInfoFilter = FormInfoFilter("")): Array<FormInfo> {
        let ret: Array<FormInfo>
        let errCode: Int32
        unsafe {
            let cModuleName = LibC.mallocCString(filter.moduleName)
            var cArrformInfo = CArrCFormInfo(CPointer<CFormInfo>(), 0)
            errCode = FFIFormProviderGetFormsInfo(CFormFilter(cModuleName), inout cArrformInfo)
            LibC.free(cModuleName)
            ret = cArr2cjArr<CFormInfo, FormInfo>(
                cArrformInfo.size,
                cArrformInfo.head,
                cFormInfo2FormInfo
            )
            FFIFormProviderFreeCArrCFormInfo(inout cArrformInfo)
        }
        formKitCheckCodeAndThrow(errCode)
        return ret
    }

    /**
     * Set next update time for a specified form.
     *
     * @throws { IllegalArgumentException } - Parameter error.
     * @throws { BusinessException } 16500050 - IPC connection error.
     * @throws { BusinessException } 16500060 - Service connection error.
     * @throws { BusinessException } 16500100 - Failed to obtain the configuration information.
     * @throws { BusinessException } 16501000 - An internal functional error occurred.
     * @throws { BusinessException } 16501001 - The ID of the form to be operated does not exist.
     * @throws { BusinessException } 16501002 - The number of forms exceeds the maximum allowed.
     * @throws { BusinessException } 16501003 - The form cannot be operated by the current application.
     * @relation function setFormNextRefreshTime(formId: string, minute: number): Promise<void>;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public static func setFormNextRefreshTime(formId: String, minute: Int32): Unit {
        var errCode: Int32 = 0
        unsafe {
            try (cFormId = LibC.mallocCString(formId).asResource()) {
                errCode = FFIFormProviderSetFormNextRefreshTime(cFormId.value, minute)
            }
        }
        formKitCheckCodeAndThrow(errCode)
    }

    /**
     * Update a specified form.
     * Client to communication with FormManagerService.
     *
     * @throws { IllegalArgumentException } - Parameter error.
     * @throws { BusinessException } 16500050 - IPC connection error.
     * @throws { BusinessException } 16500060 - Service connection error.
     * @throws { BusinessException } 16500100 - Failed to obtain the configuration information.
     * @throws { BusinessException } 16501000 - An internal functional error occurred.
     * @throws { BusinessException } 16501001 - The ID of the form to be operated does not exist.
     * @throws { BusinessException } 16501003 - The form cannot be operated by the current application.
     * @relation function updateForm(formId: string, formBindingData: formBindingData.FormBindingData): Promise<void>;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public static func updateForm(formId: String, formBindingData: FormBindingData): Unit {
        var errCode: Int32 = 0
        unsafe {
            try (cFormId = LibC.mallocCString(formId).asResource()) {
                let cFormBindingData = CFormBindingData.fromFormBindingData(formBindingData)
                errCode = FFIFormProviderUpdateForm(cFormId.value, cFormBindingData)
                cFormBindingData.free()
            }
        }
        formKitCheckCodeAndThrow(errCode)
    }
}
