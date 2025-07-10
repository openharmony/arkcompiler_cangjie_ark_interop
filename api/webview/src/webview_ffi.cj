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

package ohos.webview

import ohos.ffi.*
import ohos.base.*
import std.collection.*
import ohos.image.*

foreign {
    // WebviewController
    func FfiOHOSWebviewCtlConstructor(): Int64

    func FfiOHOSWebviewCtlConstructorWithWebTag(webTag: CString): Int64

    func FfiOHOSWebviewCtlSetWebDebuggingAccess(webDebuggingAccess: Bool): Unit

    func FfiOHOSWebviewCtlLoadUrl(id: Int64, url: CString): Int32

    func FfiOHOSWebviewCtlLoadUrlWithHeaders(id: Int64, url: CString, headers: ArrWebHeader): Int32

    func FfiOHOSWebviewCtlRefresh(id: Int64): Int32

    func FfiOHOSWebviewCtlGetUserAgent(id: Int64, errCode: CPointer<Int32>): CString

    func FfiOHOSWebviewCtlAccessBackward(id: Int64, errCode: CPointer<Int32>): Bool

    func FfiOHOSWebviewCtlSetCustomUserAgent(id: Int64, userAgent: CString): Int32

    func FfiOHOSWebviewCtlGetCustomUserAgent(id: Int64): RetDataCString

    func FfiOHOSWebviewCtlRunJavaScript(id: Int64, cScript: CString, funcId: Int64): Int32

    func FfiOHOSWebviewCtlRegisterJavaScriptProxy(id: Int64, cFuncIds: CArrI64, cName: CString, cMethodList: CArrString): Int32

    func FfiOHOSWebviewCtlGetUrl(id: Int64): RetDataCString

    func FfiOHOSWebviewCtlGetOriginalUrl(id: Int64): RetDataCString

    func FfiOHOSWebviewCtlPageUp(id: Int64, top: Bool): Int32

    func FfiOHOSWebviewCtlPageDown(id: Int64, bottom: Bool): Int32

    func FfiOHOSCookieMgrFetchCookieSync(url: CString, incognitoMode: Bool, errCode: CPointer<Int32>): CString

    func FfiOHOSCookieMgrConfigCookieSync(url: CString, value: CString, incognitoMode: Bool): Int32

    func FfiOHOSCookieMgrPutAcceptCookieEnabled(accept: Bool): Unit

    func FfiOHOSCookieMgrIsCookieAllowed(): Bool

    func FfiOHOSCookieMgrPutAcceptThirdPartyCookieEnabled(accept: Bool): Unit

    func FfiOHOSCookieMgrIsThirdPartyCookieAllowed(): Bool

    func FfiOHOSCookieMgrExistCookie(incognitoMode: Bool): Bool

    func FfiOHOSCookieMgrClearAllCookiesSync(incognitoMode: Bool): Unit

    func FfiOHOSCookieMgrClearSessionCookieSync(): Unit

    func FfiOHOSWebviewCtlScrollTo(id: Int64, x: Float32, y: Float32): Int32

    func FfiOHOSWebviewCtlScrollBy(id: Int64, deltaX: Float32, deltaY: Float32): Int32

    func FfiOHOSWebviewCtlScrollToWithAnime(id: Int64, x: Float32, y: Float32, duration: Int32): Int32

    func FfiOHOSWebviewCtlScrollByWithAnime(id: Int64, deltaX: Float32, deltaY: Float32, duration: Int32): Int32

    func FfiOHOSWebviewCtlForward(id: Int64): Int32

    func FfiOHOSWebviewCtlBackward(id: Int64): Int32

    func FfiOHOSWebviewCtlBackOrForward(id: Int64, step: Int32): Int32

    func FfiOHOSWebviewCtlGetPageHeight(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiOHOSWebviewCtlGetTitle(id: Int64): RetDataCString

    func FfiOHOSWebviewCtlZoom(id: Int64, factor: Float32): Int32

    func FfiOHOSWebviewCtlClearHistory(id: Int64): Int32

    func FfiOHOSWebviewCtlZoomIn(id: Int64): Int32

    func FfiOHOSWebviewCtlZoomOut(id: Int64): Int32

    func FfiOHOSWebviewCtlAccessStep(id: Int64, errCode: CPointer<Int32>, step: Int32): Bool

    func FfiOHOSWebviewCtlOnInactive(id: Int64): Int32

    func FfiOHOSWebviewCtlGetHitTest(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiOHOSWebviewCtlGetHitTestValue(id: Int64, errCode: CPointer<Int32>): RetDataCString

    func FfiOHOSWebviewCtlStoreWebArchive(id: Int64, cBaseName: CString, autoName: Bool, funcId: Int64): Int32

    func FfiOHOSWebviewCtlEnableSafeBrowsing(id: Int64, enable: Bool): Int32

    func FfiOHOSWebviewCtlIsSafeBrowsingEnabled(id: Int64, errCode: CPointer<Int32>): Bool

    func FfiOHOSWebviewCtlGetSecurityLevel(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiOHOSWebviewCtlIsIncognitoMode(id: Int64, errCode: CPointer<Int32>): Bool

    func FfiOHOSWebviewCtlRemoveCache(id: Int64, clearRom: Bool): Int32

    func FfiOHOSWebviewCtlGetBackForwardEntries(id: Int64, errCode: CPointer<Int32>): Int64

    func FfiOHOSWebviewCtlStop(id: Int64): Int32

    func FfiOHOSWebviewCtlPostUrl(id: Int64, cUrl: CString, bytes: CArrUI8): Int32

    func FfiOHOSWebviewCtlSetDownloadDelegate(id: Int64, delegateId: Int64): Int32

    func FfiOHOSWebviewCtlStartDownload(id: Int64, url: CString): Int32

    func FfiOHOSWebviewCtlGetWebId(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiOHOSWebviewCtlGetFavicon(id: Int64, errCode: CPointer<Int32>): Int64

    func FfiOHOSWebviewCtlRequestFocus(id: Int64): Int32

    func FfiOHOSWebviewCtlPrepareForPageLoad(url: CString, preconnectable: Bool, numSockets: Int32): Int32

    func FfiOHOSWebviewCtlSlideScroll(id: Int64, vx: Float32, vy: Float32): Int32

    func FfiOHOSWebviewCtlSetNetworkAvailable(id: Int64, enable: Bool): Int32

    func FfiOHOSWebviewCtlCreateWebMessagePorts(id: Int64, isExtentionType: Bool, errCode: CPointer<Int32>): CArrI64

    func FfiOHOSWebviewCtlPostMessage(id: Int64, name: CString, ports: CArrI64, uri: CString): Int32

    func FfiOHOSWebviewCtlHasImage(id: Int64, funcId: Int64): Int32

    func FfiOHOSWebviewCtlSerializeWebState(id: Int64, errCode: CPointer<Int32>): CArrUI8

    func FfiOHOSWebviewCtlRestoreWebState(id: Int64, cState: CArrUI8): Int32

    func FfiOHOSWebviewCtlGetCertificate(id: Int64, errCode: CPointer<Int32>): CArrString

    func FfiOHOSWebviewCtlGetCertificateByte(id: Int64, errCode: CPointer<Int32>): CCertByteData

    func FfiWebviewCtlCustomizeSchemes(schemes: CArrScheme): Int32

    func FfiOHOSWebviewCtlTerminateRenderProcess(id: Int64, errcode: CPointer<Int32>): Bool

    func FfiOHOSWebviewCtlCloseAllMediaPresentations(id: Int64): Int32

    func FfiOHOSWebviewCtlPauseAllMedia(id: Int64): Int32

    func FfiOHOSWebviewCtlResumeAllMedia(id: Int64): Int32

    func FfiOHOSWebviewCtlStopAllMedia(id: Int64): Int32

    func FfiOHOSWebviewCtlResumeAllTimers(): Unit

    func FfiOHOSWebviewCtlPauseAllTimers(): Unit

    func FfiOHOSWebviewCtlWarmupServiceWorker(cUrl: CString): Int32

    func FfiOHOSWebviewCtlGetMediaPlaybackState(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiOHOSWebviewCtlGetPrintBackground(id: Int64, errCode: CPointer<Int32>): Bool

    func FfiOHOSWebviewCtlSetPrintBackground(id: Int64, enable: Bool): Int32

    func FfiOHOSWebviewCtlGetScrollable(id: Int64, errCode: CPointer<Int32>): Bool

    func FfiOHOSWebviewCtlSetScrollable(id: Int64, enable: Bool): Int32

    func FfiOHOSWebviewCtlIsAdsBlockEnabledForCurPage(id: Int64): Bool

    func FfiOHOSWebviewCtlEnableAdsBlock(id: Int64, enable: Bool): Unit

    func FfiOHOSWebviewCtlIsAdsBlockEnabled(id: Int64): Bool

    func FfiOHOSWebviewCtlIsIntelligentTrackingPreventionEnabled(id: Int64, errCode: CPointer<Int32>): Bool

    func FfiOHOSWebviewCtlEnableIntelligentTrackingPrevention(id: Int64, enable: Bool): Int32

    func FfiOHOSWebviewCtlGetRenderProcessMode(): Int32

    func FfiOHOSWebviewCtlSetRenderProcessMode(mode: Int32): Unit

    func FfiOHOSWebviewCtlEnableWholeWebPageDrawing(): Int32

    func FfiOHOSWebviewCtlClearPrefetchedResource(cacheKeyList: CArrString): Int32

    func FfiOHOSWebviewCtlCloseCamera(id: Int64): Int32

    func FfiOHOSWebviewCtlStopCamera(id: Int64): Int32

    func FfiOHOSWebviewCtlStartCamera(id: Int64): Int32

    func FfiOHOSWebviewCtlClearHostIP(cHostName: CString): Int32

    func FfiOHOSWebviewCtlSetHostIP(cHostName: CString, cAddress: CString, aliveTime: Int32): Int32

    func FfiOHOSWebviewCtlGetLastJavascriptProxyCallingFrameUrl(id: Int64): RetDataCString

    func FfiOHOSWebviewCtlAddIntelligentTrackingPreventionBypassingList(hostList: CArrString): Int32

    func FfiOHOSWebviewCtlClearIntelligentTrackingPreventionBypassingList(): Unit

    func FfiOHOSWebviewCtlEnableBackForwardCache(nativeEmbed: Bool, mediaTakeOver: Bool): Unit

    func FfiOHOSWebviewCtlGetSurfaceId(id: Int64): RetDataCString

    func FfiOHOSWebviewCtlInjectOfflineResources(id: Int64, maps: CArrOfflineResourceMap): Int32

    func FfiOHOSWebviewCtlRemoveIntelligentTrackingPreventionBypassingList(hostList: CArrString): Unit

    func FfiOHOSWebviewCtlSetBackForwardCacheOptions(id: Int64, size: Int32, timeToLive: Int32): Int32

    func FfiOHOSWebviewCtlSetPathAllowingUniversalAccess(id: Int64, cPathList: CArrString): Int32

    func FfiOHOSWebviewCtlSetUrlTrustList(id: Int64, cUrl: CString): Int32

    func FfiOHOSWebviewCtlPrefetchResource(request: CRequestInfo, additionalHeaders: ArrWebHeader, cKey: CString,
        cacheValidTime: Int32): Int32

    func FfiOHOSWebviewCtlPrecompileJavaScript(id: Int64, cUrl: CString, cScript: CString, cCacheOptions: CCacheOptions): Int32

    func FfiOHOSWebviewCtlWebPageSnapshot(id: Int64, info: CSnapshotInfo, classId: Int64): Int32

    func FfiOHOSWebviewCtlClearServiceWorkerWebSchemeHandler(): Unit

    func FfiOHOSWebviewCtlSetServiceWorkerWebSchemeHandler(cScheme: CString, classId: Int64, errCode: CPointer<Int32>): Unit

    func FfiOHOSWebviewCtlClearWebSchemeHandler(id: Int64, errCode: Int32): Unit

    func FfiOHOSWebviewCtlSetWebSchemeHandler(id: Int64, cScheme: CString, classId: Int64, errCode: CPointer<Int32>): Unit

    func FfiOHOSWebviewCtlOnCreateNativeMediaPlayer(id: Int64, callbackId: Int64): Unit

    func FfiOHOSWebviewCtlGetScrollOffset(id: Int64, errCode: CPointer<Int32>): CScrollOffset

    func FfiOHOSWebviewCtlScrollByWithResult(id: Int64, deltaX: Float32, deltaY: Float32, errCode: CPointer<Int32>): Bool

    func FfiOHOSWebviewCtlSetScrollableEx(id: Int64, enable: Bool, scrollType: Int32): Int32

    //BackForwardList
    func FfiOHOSBackForwardListCurrentIndex(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiOHOSBackForwardListSize(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiOHOSGetItemAtIndex(id: Int64, index: Int32, errCode: CPointer<Int32>): CHistoryItem

    // WebDownloadItemImpl
    func FfiOHOSWebDownloadItemImplConstructor(): Int64

    func FfiOHOSWebDownloadItemImplGetGuid(id: Int64): RetDataCString

    func FfiOHOSWebDownloadItemImplGetCurrentSpeed(id: Int64, errCode: CPointer<Int32>): Int64

    func FfiOHOSWebDownloadItemImplGetPercentComplete(id: Int64, errCode: CPointer<Int32>): Int64

    func FfiOHOSWebDownloadItemImplGetTotalBytes(id: Int64, errCode: CPointer<Int32>): Int64

    func FfiOHOSWebDownloadItemImplGetReceivedBytes(id: Int64, errCode: CPointer<Int32>): Int64

    func FfiOHOSWebDownloadItemImplGetState(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiOHOSWebDownloadItemImplGetLastErrorCode(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiOHOSWebDownloadItemImplGetMethod(id: Int64): RetDataCString

    func FfiOHOSWebDownloadItemImplGetMimeType(id: Int64): RetDataCString

    func FfiOHOSWebDownloadItemImplGetUrl(id: Int64): RetDataCString

    func FfiOHOSWebDownloadItemImplGetSuggestedFileName(id: Int64): RetDataCString

    func FfiOHOSWebDownloadItemImplGetFullPath(id: Int64): RetDataCString

    func FfiOHOSWebDownloadItemImplStart(id: Int64, cDownloadPath: CString): Int32

    func FfiOHOSWebDownloadItemImplCancel(id: Int64): Int32

    func FfiOHOSWebDownloadItemImplPause(id: Int64): Int32

    func FfiOHOSWebDownloadItemImplResume(id: Int64): Int32

    func FfiOHOSWebDownloadItemImplSerialize(id: Int64, errCode: CPointer<Int32>): CArrUI8

    func FfiOHOSWebDownloadItemImplDeserialize(serializedData: CArrUI8, errCode: CPointer<Int32>): Int64

    // WebDownloadDelegateImpl
    func FfiOHOSWebDownloadDelegateImplConstructor(): Int64

    func FfiOHOSWebDownloadDelegateImplOnBeforeDownload(id: Int64, callbackId: Int64): Unit

    func FfiOHOSWebDownloadDelegateImplOnDownloadUpdated(id: Int64, callbackId: Int64): Unit

    func FfiOHOSWebDownloadDelegateImplOnDownloadFinish(id: Int64, callbackId: Int64): Unit

    func FfiOHOSWebDownloadDelegateImplOnDownloadFailed(id: Int64, callbackId: Int64): Unit

    // WebDownloadManagerImpl
    func FfiOHOSWebDownloadManagerImplSetDownloadDelegate(delegateId: Int64): Unit

    func FfiOHOSWebDownloadManagerImplResumeDownload(itemId: Int64): Int32

    //Database
    func FfiOHOSDBGetHttpAuthCredentials(host: CString, realm: CString): RetDataCArrString

    func FfiOHOSDBSaveHttpAuthCredentials(host: CString, realm: CString, username: CString, password: CString): Unit

    func FfiOHOSDBExistHttpAuthCredentials(): Bool

    func FfiOHOSDBDeleteHttpAuthCredentials(): Unit

    // WebMessagePort
    func FfiOHOSWebMessagePortPostMessageEvent(msgPortId: Int64, stringValue: CString, errCode: CPointer<Int32>): Unit

    func FfiOHOSWebMessagePortPostMessageEventArr(msgPortId: Int64, arrBuf: CArrUI8, errCode: CPointer<Int32>): Unit

    func FfiOHOSWebMessagePortPostMessageEventExt(msgPortId: Int64, msgExtId: Int64, errCode: CPointer<Int32>): Unit

    func FfiOHOSWebMessagePortIsExtentionType(msgPortId: Int64): Bool

    func FfiOHOSWebMessagePortOnMessageEvent(msgPortId: Int64, funcId: Int64, errCode: CPointer<Int32>): Unit

    func FfiOHOSWebMessagePortOnMessageEventExt(msgPortId: Int64, funcId: Int64, errCode: CPointer<Int32>): Unit

    func FfiOHOSWebMessagePortClose(msgPortId: Int64, errCode: CPointer<Int32>): Unit

    // WebMessageExt
    func FfiOHOSWebMessageExtImplConstructor(): Int64

    func FfiOHOSWebMessageExtImplGetType(msgExtId: Int64, errCode: CPointer<Int32>): Int32

    func FfiOHOSWebMessageExtImplGetString(msgExtId: Int64, errCode: CPointer<Int32>): CString

    func FfiOHOSWebMessageExtImplGetNumber(msgExtId: Int64, errCode: CPointer<Int32>): RetNumber

    func FfiOHOSWebMessageExtImplGetBoolean(msgExtId: Int64, errCode: CPointer<Int32>): Bool

    func FfiOHOSWebMessageExtImplGetArrayBuffer(msgExtId: Int64, errCode: CPointer<Int32>): CArrUI8

    func FfiOHOSWebMessageExtImplGetArray(msgExtId: Int64, errCode: CPointer<Int32>): CArrValue

    func FfiOHOSWebMessageExtImplGetError(msgExtId: Int64, errCode: CPointer<Int32>): CError
    // set
    func FfiOHOSWebMessageExtImplSetType(msgExtId: Int64, msgType: Int32, errCode: CPointer<Int32>): Unit

    func FfiOHOSWebMessageExtImplSetString(msgExtId: Int64, message: CString, errCode: CPointer<Int32>): Unit

    func FfiOHOSWebMessageExtImplSetNumber(msgExtId: Int64, value: Float64, errCode: CPointer<Int32>): Unit

    func FfiOHOSWebMessageExtImplSetBoolean(msgExtId: Int64, value: Bool, errCode: CPointer<Int32>): Unit

    func FfiOHOSWebMessageExtImplSetArrayBuffer(msgExtId: Int64, value: CArrUI8, errCode: CPointer<Int32>): Unit

    func FfiOHOSWebMessageExtImplSetError(msgExtId: Int64, value: CError, errCode: CPointer<Int32>): Unit

    func FfiOHOSWebMessageExtImplSetArrayString(msgExtId: Int64, value: CArrString, errCode: CPointer<Int32>): Unit

    func FfiOHOSWebMessageExtImplSetArrayInt(msgExtId: Int64, value: CArrI64, errCode: CPointer<Int32>): Unit

    func FfiOHOSWebMessageExtImplSetArrayDouble(msgExtId: Int64, value: CArrDouble, errCode: CPointer<Int32>): Unit

    func FfiOHOSWebMessageExtImplSetArrayBoolean(msgExtId: Int64, value: CArrBool, errCode: CPointer<Int32>): Unit

    // GeolocationPermissions
    func FfiOHOSGeolocationAllowGeolocation(origin: CString, incognito: Bool, errCode: CPointer<Int32>): Unit

    func FfiOHOSGeolocationDeleteGeolocation(origin: CString, incognito: Bool, errCode: CPointer<Int32>): Unit

    func FfiOHOSGeolocationGetAccessibleGeolocation(origin: CString, incognito: Bool, errCode: CPointer<Int32>): Bool

    func FfiOHOSGeolocationGetStoredGeolocation(incognito: Bool, errCode: CPointer<Int32>): CArrString

    func FfiOHOSGeolocationDeleteAllGeolocation(incognito: Bool, errCode: CPointer<Int32>): Unit

    // JsMessageExt
    func FfiOHOSJsMessageExtImplGetType(msgExtId: Int64, errCode: CPointer<Int32>): Int32

    func FfiOHOSJsMessageExtImplGetString(msgExtId: Int64, errCode: CPointer<Int32>): CString

    func FfiOHOSJsMessageExtImplGetNumber(msgExtId: Int64, errCode: CPointer<Int32>): RetNumber

    func FfiOHOSJsMessageExtImplGetBoolean(msgExtId: Int64, errCode: CPointer<Int32>): Bool

    func FfiOHOSJsMessageExtImplGetArrayBuffer(msgExtId: Int64, errCode: CPointer<Int32>): CArrUI8

    func FfiOHOSJsMessageExtImplGetArray(msgExtId: Int64, errCode: CPointer<Int32>): CArrValue
    // webStorage
    func FfiWebStorageDeleteOrigin(origin: CString): Int32

    func FfiWebStorageDeleteAllData(incognito: Bool): Unit

    func FfiWebStorageGetOriginUsage(origin: CString, errCode: CPointer<Int32>): Int64

    func FfiWebStorageGetOriginQuota(origin: CString, errCode: CPointer<Int32>): Int64

    func FfiWebStorageGetOrigins(errCode: CPointer<Int32>): CArrWebStorageOrigin

    // WebSchemeHandlerResponse
    func FfiWebSchemeHandlerResponseConstructor(): Int64

    func FfiWebSchemeHandlerResponseGetUrl(id: Int64): RetDataCString

    func FfiWebSchemeHandlerResponseGetStatusText(id: Int64): RetDataCString

    func FfiWebSchemeHandlerResponseGetMimeType(id: Int64): RetDataCString

    func FfiWebSchemeHandlerResponseGetEncoding(id: Int64): RetDataCString

    func FfiWebSchemeHandlerResponseGetHeaderByName(id: Int64, name: CString): RetDataCString

    func FfiWebSchemeHandlerResponseGetNetErrorCode(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiWebSchemeHandlerResponseGetStatus(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiWebSchemeHandlerResponseSetStatus(id: Int64, status: Int32): Int32

    func FfiWebSchemeHandlerResponseSetStatusText(id: Int64, statusText: CString): Int32

    func FfiWebSchemeHandlerResponseSetUrl(id: Int64, url: CString): Int32

    func FfiWebSchemeHandlerResponseSetMimeType(id: Int64, mimeType: CString): Int32

    func FfiWebSchemeHandlerResponseSetEncoding(id: Int64, encoding: CString): Int32

    func FfiWebSchemeHandlerResponseSetHeaderByName(id: Int64, name: CString, value: CString, overwrite: Bool): Int32

    func FfiWebSchemeHandlerResponseSetErrorCode(id: Int64, code: Int32): Int32

    // AdsBlockManager
    func FfiAdsBlockManagerSetAdsBlockRules(rulesFile: CString, replace: Bool): Int32

    func FfiAdsBlockManagerAddAdsBlockDisallowedList(domainSuffixes: CArrString): Int32

    func FfiAdsBlockManagerRemoveAdsBlockDisallowedList(domainSuffixes: CArrString): Int32

    func FfiAdsBlockManagerAddAdsBlockAllowedList(domainSuffixes: CArrString): Int32

    func FfiAdsBlockManagerRemoveAdsBlockAllowedList(domainSuffixes: CArrString): Int32

    func FfiAdsBlockManagerClearAdsBlockAllowedList(): Unit

    func FfiAdsBlockManagerClearAdsBlockDisallowedList(): Unit

    // WebHttpBodyStream
    func FfiWebHttpBodyStreamConstructor(): Int64

    func FfiWebHttpBodyStreaminitialize(id: Int64, errCode: CPointer<Int32>): Unit

    func FfiWebHttpBodyStreamRead(bufLen: Int32, id: Int64): Int32

    func FfiWebHttpBodyStreamIsChunked(id: Int64, errCode: CPointer<Int32>): Bool

    func FfiWebHttpBodyStreamIsEof(id: Int64, errCode: CPointer<Int32>): Bool

    func FfiWebHttpBodyStreamIsInMemory(id: Int64, errCode: CPointer<Int32>): Bool

    func FfiWebHttpBodyStreamGetPostion(id: Int64, errCode: CPointer<Int32>): UInt64

    func FfiWebHttpBodyStreamGetSize(id: Int64, errCode: CPointer<Int32>): UInt64

    // WebSchemeHandlerRequest
    func FfiWebSchemeHandlerRequestConstructor(): Int64

    func FfiWebSchemeHandlerRequestGetRequestResourceType(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiWebSchemeHandlerRequestHasGesture(id: Int64, errCode: CPointer<Int32>): Bool

    func FfiWebSchemeHandlerRequestIsMainFrame(id: Int64, errCode: CPointer<Int32>): Bool

    func FfiWebSchemeHandlerRequestGetRequestUrl(id: Int64): RetDataCString

    func FfiWebSchemeHandlerRequestGetMethod(id: Int64): RetDataCString

    func FfiWebSchemeHandlerRequestGetReferrer(id: Int64): RetDataCString

    func FfiWebSchemeHandlerRequestGetFrameUrl(id: Int64): RetDataCString

    func FfiWebSchemeHandlerRequestGetHttpBodyStream(id: Int64, errCode: CPointer<Int32>): Int64

    func FfiWebSchemeHandlerRequestGetHeader(id: Int64, errCode: CPointer<Int32>): ArrWebHeader

    // WebResourceHandler
    func FfiWebResourceHandlerConstructor(): Int64

    func FfiWebResourceHandlerDidReceiveResponse(id: Int64, errCode: CPointer<Int32>, responceid: Int64): Unit

    func FfiWebResourceHandlerDidReceiveResponseBody(id: Int64, errCode: CPointer<Int32>, buffer: CArrUI8, buflen: Int64): Unit

    func FfiWebResourceHandlerDidFinish(id: Int64, errCode: CPointer<Int32>): Unit

    func FfiWebResourceHandlerDidFail(id: Int64, errCode: CPointer<Int32>, errorcode: Int32): Unit

    // WebSchemeHandler
    func FfiWebSchemeHandlerConstructor(): Int64

    func FfiWebSchemeHandlerOnRequestStart(id: Int64, callbackId: Int64): Unit

    func FfiWebSchemeHandlerOnRequestStop(id: Int64, callbackId: Int64): Unit

    // NativeMediaPlayerHandler
    func FfiOHOSNmphhandleStatusChanged(id: Int64, status: Int32): Int32

    func FfiOHOSNmphConstructor(): Int64

    func FfiOHOSNmphhandleVideoSizeChanged(id: Int64, width: Float64, height: Float64): Int32

    func FfiOHOSNmphhandleError(id: Int64, error: Int32, errorMessage: CString): Int32

    func FfiOHOSNmphhandleSeekFinished(id: Int64): Int32

    func FfiOHOSNmphhandleSeeking(id: Int64): Int32

    func FfiOHOSNmphhandleFullscreenChanged(id: Int64, fullscreen: Bool): Int32

    func FfiOHOSNmphhandleReadyStateChanged(id: Int64, state: Int32): Int32

    func FfiOHOSNmphhandleNetworkStateChanged(id: Int64, state: Int32): Int32

    func FfiOHOSNmphhandleEnded(id: Int64): Int32

    func FfiOHOSNmphhandleBufferedEndTimeChanged(id: Int64, bufferedEndTime: Float64): Int32

    func FfiOHOSNmphhandleTimeUpdate(id: Int64, currentPlayTime: Float64): Int32

    func FfiOHOSNmphhandleDurationChanged(id: Int64, duration: Float64): Int32

    func FfiOHOSNmphhandlePlaybackRateChanged(id: Int64, playbackRate: Float64): Int32

    func FfiOHOSNmphhandleMutedChanged(id: Int64, muted: Bool): Int32

    func FfiOHOSNmphhandleVolumeChanged(id: Int64, volume: Float64): Int32
}

@C
struct CArrScheme {
    CArrScheme(
        let head: CPointer<CScheme>,
        let size: Int64
    ) {}

    init(arr: Array<WebCustomScheme>) {
        unsafe {
            this.head = cjArr2CArr<WebCustomScheme, CScheme>(arr, {cjScheme => CScheme(cjScheme)},
                {cScheme => cScheme.free()})
            this.size = arr.size
        }
    }

    func free() {
        if (head.isNull()) {
            return
        }
        for (i in 0..size) {
            unsafe {
                head.read(i).free()
            }
        }
        unsafe { LibC.free(head) }
    }
}

@C
struct CScheme {
    CScheme(
        let schemeName: CString,
        let isSupportCORS: Bool,
        let isSupportFetch: Bool,
        let isStandard: Bool,
        let isLocal: Bool,
        let isDisplayIsolated: Bool,
        let isSecure: Bool,
        let isCspBypassing: Bool,
        let isCodeCacheSupported: Bool
    ) {}

    init(webCustomScheme: WebCustomScheme) {
        unsafe {
            schemeName = LibC.mallocCString(webCustomScheme.schemeName)
            isSupportCORS = webCustomScheme.isSupportCORS
            isSupportFetch = webCustomScheme.isSupportFetch
            isStandard = webCustomScheme.isStandard
            isLocal = webCustomScheme.isLocal
            isDisplayIsolated = webCustomScheme.isDisplayIsolated
            isSecure = webCustomScheme.isSecure
            isCspBypassing = webCustomScheme.isCspBypassing
            isCodeCacheSupported = webCustomScheme.isCodeCacheSupported
        }
    }

    func free() {
        unsafe {
            LibC.free(schemeName)
        }
    }
}

@C
struct CArrWebStorageOrigin {
    CArrWebStorageOrigin(
        let cWebStorageOrigin: CPointer<CWebStorageOrigin>,
        let size: Int64
    ) {}

    unsafe func toArrWebStorageOriginAndFree(): Array<WebStorageOrigin> {
        if (cWebStorageOrigin.isNull()) {
            return Array<WebStorageOrigin>()
        }
        let ret = Array<WebStorageOrigin>(
            size,
            {
                i => cWebStorageOrigin.read(i).toWebStorageOriginAndFree()
            }
        )
        LibC.free<CWebStorageOrigin>(cWebStorageOrigin)
        return ret
    }
}

@C
struct CWebStorageOrigin {
    CWebStorageOrigin(
        let origin: CString,
        let quota: Int64,
        let usage: Int64
    ) {}

    unsafe func toWebStorageOriginAndFree(): WebStorageOrigin {
        let originString = this.origin.toString()
        LibC.free(this.origin)
        return WebStorageOrigin(originString, quota, usage)
    }
}

@C
struct LoadDatas {
    LoadDatas(
        let cData: CString,
        let cMimeType: CString,
        let cEncoding: CString,
        let cBaseUrl: CString,
        let cHistoryUrl: CString
    ) {}
}

@C
struct RetWebMessage {
    RetWebMessage(
        let messageStr: CString,
        let messageArr: CArrUI8
    ) {}
}

@C
struct CError {
    CError(
        let errorName: CString,
        let errorMsg: CString
    ) {}
}

@C
struct RetNumber {
    RetNumber(
        let numberInt: Int64,
        let numberDouble: Float64
    ) {}
}

@C
struct CArrValue {
    CArrValue(
        let strHead: CPointer<CString>,
        let intHead: CPointer<Int64>,
        let doubleHead: CPointer<Float64>,
        let boolHead: CPointer<Bool>,
        let size: Int64
    ) {}
}

@C
struct RetWebHeader {
    let headerKey: CString
    let headerValue: CString

    init(webHeader: WebHeader) {
        unsafe {
            this.headerKey = LibC.mallocCString(webHeader.headerKey)
            try {
                this.headerValue = LibC.mallocCString(webHeader.headerValue)
            } catch (e: IllegalMemoryException) {
                LibC.free(headerKey)
                throw e
            }
        }
    }

    func free() {
        unsafe {
            LibC.free(headerKey)
            LibC.free(headerValue)
        }
    }
}

@C
struct ArrWebHeader {
    let head: CPointer<RetWebHeader>
    let size: Int64

    init(arr: Array<WebHeader>, exceptHandle: () -> Unit) {
        unsafe {
            head = cjArr2CArr<WebHeader, RetWebHeader>(
                arr,
                {v: WebHeader => RetWebHeader(v)},
                {v: RetWebHeader => v.free()},
                exceptHandle
            )
            this.size = arr.size
        }
    }
}

@C
struct CHistoryItem {
    CHistoryItem(
        let icon: Int64,
        let historyUrl: CString,
        let historyRawUrl: CString,
        let title: CString
    ) {}

    func toHistoryItemAndFree(): HistoryItem {
        var url: String = ""
        var rawUrl: String = ""
        var titleStr: String = ""

        try {
            url = historyUrl.toString()
            rawUrl = historyRawUrl.toString()
            titleStr = title.toString()
        } finally {
            unsafe {
                LibC.free(historyUrl)
                LibC.free(historyRawUrl)
                LibC.free(title)
            }
        }
        var pixelIcon: ?PixelMap = None
        if (icon > 0) {
            pixelIcon = PixelMap(icon)
        }

        return HistoryItem(pixelIcon, url, rawUrl, titleStr)
    }
}

func freeArrWebHeader(ptr: CPointer<RetWebHeader>, len: Int64) {
    for (i in 0..len) {
        unsafe {
            ptr.read(i).free()
        }
    }
    unsafe { LibC.free(ptr) }
}

@C
struct CCacheOptions {
    let responseHeaders: ArrWebHeader

    init(cacheOptions: CacheOptions) {
        unsafe {
            let WebHeader = cacheOptions.responseHeaders
            this.responseHeaders = ArrWebHeader(WebHeader) {}
        }
    }

    func free() {
        freeArrWebHeader(responseHeaders.head, responseHeaders.size)
    }
}

@C
struct CRequestInfo {
    CRequestInfo(
        let url: CString,
        let method: CString,
        let formData: CString
    ) {}
}

@C
struct COfflineResourceMap {
    var urlList: CArrString
    var resource: CPointer<UInt8>
    var resourceSize: Int64
    var responseHeaders: ArrWebHeader
    var _type: Int32

    init() {
        urlList = CArrString(CPointer<CString>(), 0)
        resource = CPointer<UInt8>()
        resourceSize = 0
        responseHeaders = ArrWebHeader(Array<WebHeader>()) {}
        _type = 0
    }

    func free() {
        unsafe {
            if (urlList.head.isNotNull()) {
                for (i in 0..urlList.size) {
                    LibC.free(urlList.head.read(i))
                }
                LibC.free(urlList.head)
            }
            LibC.free(resource)
            for (i in 0..responseHeaders.size) {
                freeArrWebHeader(responseHeaders.head, i)
            }
        }
    }
}

@C
struct CArrOfflineResourceMap {
    CArrOfflineResourceMap(
        let head: CPointer<COfflineResourceMap>,
        let size: Int64
    ) {}

    init(arr: Array<OfflineResourceMap>) {
        unsafe {
            this.head = LibC.malloc<COfflineResourceMap>(count: arr.size)
            if (this.head.isNull()) {
                throw IllegalMemoryException("Failed to allocate memory")
            }
            for (i in 0..arr.size) {
                try {
                    let cMap = arr[i].toCOfflineResourceMap()
                    head.write(i, cMap)
                } catch (e: IllegalMemoryException) {
                    freeArrOfflineResourceMap(head, i)
                    throw e
                }
            }
            this.size = arr.size
        }
    }
}

@C
struct CSnapshotInfo {
    let id: CString
    let width: Int32
    let height: Int32
    let widthType: Int32
    let heightType: Int32

    init(sInfo: SnapshotInfo) {
        unsafe {
            this.id = LibC.mallocCString(sInfo.id)
        }
        this.width = Int32(sInfo.size.width.value)
        this.height = Int32(sInfo.size.height.value)
        this.widthType = Int32(sInfo.size.width.unitType.getValue())
        this.heightType = Int32(sInfo.size.height.unitType.getValue())
    }

    func free() {
        unsafe {
            LibC.free(id)
        }
    }
}

@C
struct CSnapshotResult {
    CSnapshotResult(
        var id: CString,
        var imageId: Int64,
        var status: Bool,
        var width: Int32,
        var height: Int32,
        var widthType: Int32,
        var heightType: Int32
    ) {}

    func toSnapshotResult(): SnapshotResult {
        unsafe {
            let resId = id.toString()
            let image = PixelMap(imageId)
            let resStatus = status
            var resWidth = generateLength(width, widthType)
            var resHeight = generateLength(height, heightType)
            var resSize = SizeOptions(width: resWidth, height: resHeight)
            return SnapshotResult(Some(resId), Some(image), Some(resStatus), Some(resSize))
        }
    }

    func generateLength(value: Int32, typeLength: Int32): Length {
        return match (typeLength) {
            case 0 => Float64(value).px
            case 1 => Float64(value).vp
            case 2 => Float64(value).fp
            case 3 => Float64(value).percent
            case 4 => Float64(value).lpx
            case _ => Float64(value).vp
        }
    }

    func free() {
        unsafe {
            LibC.free(id)
        }
    }
}

@C
struct CScrollOffset {
    CScrollOffset(
        let x: Float32,
        let y: Float32
    ) {}
}

@C
struct RetDataCSnapshotResult {
    RetDataCSnapshotResult(
        let code: Int32,
        let data: CSnapshotResult
    ) {}
}

@C
protected struct CCertByteData {
    protected CCertByteData(
        protected let head: CPointer<CArrUI8>,
        protected let size: Int64
    ) {}

    func toByteArray(): Array<Array<Byte>> {
        unsafe {
            Array<Array<Byte>>(size) {
                i => Array<Byte>(head.read(i).size) {
                    j => head.read(i).head.read(j)
                }
            }
        }
    }

    func free() {
        if (head.isNull()) {
            return
        }
        for (index in 0..size) {
            unsafe { head.read(index).free() }
        }
        unsafe { LibC.free(head) }
    }
}
