# Custom Rendering (XComponent)

## Overview

The XComponent, as a rendering component, can be used for EGL/OpenGLES and media data writing. It renders visuals by utilizing the "NativeWindow" held by the XComponent, typically addressing developers' complex custom rendering needs such as camera preview stream display and game scene rendering. Different rendering methods can be achieved by specifying the `type` field, currently supporting the [XComponentType.SURFACE](../../../API_Reference/source_zh_cn/arkui-cj/cj-common-types.md#enum-xcomponenttype) type. For the SURFACE type, developers independently display customized drawing content on the screen.

Currently, the XComponent supports the XComponentController scenario, where SurfaceId acquisition, lifecycle callbacks, and event callbacks (touch, mouse, key events) are triggered on the Cangjie side.

## Self-Drawing Principle Explanation

The XComponent holds a surface. Developers can request and submit buffers to the graphics queue by calling NativeWindow interfaces, thereby transmitting self-drawn content to this surface. The XComponent integrates this surface into the UI interface, displaying the developer-transmitted self-drawn content.

> **Note:**
>
> When the transmitted drawing content contains transparent elements, the surface area's display effect will be composited with underlying content. For example, if the transmitted content is fully transparent, the XComponent's background color is set to black, and the Surface maintains its default size and position, the final display will show a black area.

## XComponentController Scenario

By acquiring the SurfaceId on the Cangjie side, layout information, lifecycle callbacks, and event callbacks (touch, mouse, key events) are triggered on the Cangjie side and passed to the Native side for processing as needed. Key development scenarios include:

- Creating a NativeWindow instance on the Native side using the SurfaceId obtained from the Cangjie side.
- Developing custom drawing content using NativeWindow and EGL interfaces, and requesting/submitting buffers to the graphics queue.
- Passing lifecycle and event information acquired on the Cangjie side to the Native side for processing.

## Native XComponent

The Native part requires calling the Native XComponent interfaces. For details, refer to [Native XComponent](https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/_o_h___native_x_component-V5).

## Example Code

The following steps, using the SURFACE type as an example, describe how to use the XComponent component to pass the SurfaceId from the Cangjie side, create a NativeWindow instance on the Native side, and then establish an EGL/GLES environment to draw graphics on the main page and change their colors. The code is divided into Cangjie and Native parts.

### Cangjie Code

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.convert.*

// Cangjie-Native interoperation functions, defined in cpp/exportffi.cpp

foreign {
    func FFIChangeColor(surfaceId: Int64): Unit
    func FFIDrawPattern(surfaceId: Int64): Unit
    func FFISetSurfaceId(surfaceId: Int64): Unit
    func FFIChangeSurface(surfaceId: Int64, width: Float64, height: Float64): Unit
    func FFIDestroySurface(surfaceId: Int64): Unit
    func FFIGetXComponentHasDraw(surface: Int64): Bool
    func FFIXComponentHasChangeColor(surface: Int64): Bool
}

// Override XComponentController to set lifecycle callbacks
class MyXComponentController <: XComponentController {
    protected override func onSurfaceCreated(surfaceId: String) {
        unsafe {
            FFISetSurfaceId(Int64.parse(surfaceId))
        }
    }
    protected override func onSurfaceChanged(surfaceId: String, rect: SurfaceRect) {
        // Call ChangeSurface in onSurfaceChanged to draw content
        unsafe {
            FFIChangeSurface(Int64.parse(surfaceId), 1134.0, 1002.0)
        }
    }

    protected override func onSurfaceDestroyed(surfaceId: String) {
    }
}

@Entry
@Component
class EntryView {
    @State
    var message: String = "Hello Cangjie"
    @State var hasDraw: Bool = false
    @State var hasColorChange: Bool = false
    @State var surfaceId: String = ""
    var myXComponentController: MyXComponentController = MyXComponentController()
    func build() {
        Column {
            Text("hasDraw: ${hasDraw}")
            Text("surfaceID: ${surfaceId}")
            Column {
                XComponent(id: "cjtest", `type`: XComponentType.SURFACE, controller: myXComponentController)
                .width(90.percent)
                .height(40.percent)
            }

            Button("GetSurfaceId").onClick { evt =>
                AppLog.info("GetSurfaceId start")
                surfaceId = myXComponentController.getXComponentSurfaceId()
            }.fontSize(20).height(40)

            Button("DrawStar").onClick { evt =>
                AppLog.info("DrawStar start")
                unsafe {
                    FFIDrawPattern(Int64.parse(surfaceId))
                }
            }.fontSize(20).height(40)

            Button("ChangeColor").onClick {
                evt => AppLog.info("Hello Cangjie")
                unsafe {
                    FFIChangeColor(Int64.parse(surfaceId))
                }
            }.fontSize(20).height(40)

            Button("SetSurfaceId").onClick {
                evt => AppLog.info("Hello Cangjie")
            }.fontSize(20).height(40)

        }.width(100.percent)
    }
}
```

### Native Code

#### Directory Structure

![xcomponent_dir](figures/xcomponent_dir.png)

Add the cpp directory to the project.

#### common.h

```cpp
#ifndef NATIVE_XCOMPONENT_COMMON_H
#define NATIVE_XCOMPONENT_COMMON_H

#include <EGL/egl.h>
#include <EGL/eglext.h>
#include <EGL/eglplatform.h>
#include <GLES3/gl3.h>

namespace NativeXComponentSample {
/**
 * Log print domain.
 */
const unsigned int LOG_PRINT_DOMAIN = 0xFF00;
} // namespace NativeXComponentSample
#endif // NATIVE_XCOMPONENT_COMMON_H
```

#### plugin_manager.h

```cpp
#ifndef NATIVE_XCOMPONENT_PLUGIN_MANAGER_H
#define NATIVE_XCOMPONENT_PLUGIN_MANAGER_H

#include <js_native_api.h>
#include <js_native_api_types.h>
#include <unordered_map>
#include <native_window/external_window.h>
#include "../render/plugin_render.h"

namespace NativeXComponentSample {
// PluginManager encapsulates Native-side drawing behavior
class PluginManager {
public:
    ~PluginManager();
    static PluginRender* GetPluginRender(int64_t& id);
    static void* ChangeColor(int64_t surfaceId);
    static void* DrawPattern(int64_t surfaceId);
    static void* SetSurfaceId(int64_t surfaceId);
    static void* ChangeSurface(int64_t surfaceId, double width, double height);
    static void* DestroySurface(int64_t surfaceId);
    static bool GetXComponentHasDraw(int64_t surfaceId);
    static bool GetXComponentHasChangeColor(int64_t surfaceId);
public:
    static std::unordered_map<int64_t, PluginRender*> pluginRenderMap_;
    static std::unordered_map<int64_t, OHNativeWindow*> windowMap_;
};
} // namespace NativeXComponentSample
#endif // NATIVE_XCOMPONENT_PLUGIN_MANAGER_H
```

#### plugin_manager.cpp

```cpp
#include "plugin_manager.h"
#include <cstdint>
#include <hilog/log.h>
#include <string>
#include "../common/common.h"
#include <native_window/external_window.h>

namespace NativeXComponentSample {

std::unordered_map<int64_t, PluginRender*> PluginManager::pluginRenderMap_;
std::unordered_map<int64_t, OHNativeWindow*> PluginManager::windowMap_;

PluginManager::~PluginManager()
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "~PluginManager");
    for (auto iter = pluginRenderMap_.begin(); iter != pluginRenderMap_.end(); ++iter) {
        if (iter->second != nullptr) {
            delete iter->second;
            iter->second = nullptr;
        }
    }
    pluginRenderMap_.clear();
    for (auto iter = windowMap_.begin(); iter != windowMap_.end(); ++iter) {
        if (iter->second != nullptr) {
            delete iter->second;
            iter->second = nullptr;
        }
    }
    windowMap_.clear();
}

PluginRender* PluginManager::GetPluginRender(int64_t& id)
{
    if (pluginRenderMap_.find(id) != pluginRenderMap_.end()) {
        return pluginRenderMap_[id];
    }
    return nullptr;
}

void* PluginManager::SetSurfaceId(int64_t surfaceId)
{
    OHNativeWindow *nativeWindow;
    PluginRender *pluginRender;
    if (windowMap_.find(surfaceId) == windowMap_.end()) {
        OH_NativeWindow_CreateNativeWindowFromSurfaceId(surfaceId, &nativeWindow);
        windowMap_[surfaceId] = nativeWindow;
    }
    if (pluginRenderMap_.find(surfaceId) == pluginRenderMap_.end()) {
        pluginRender = new PluginRender(surfaceId);
        pluginRenderMap_[surfaceId] = pluginRender;
    }
    pluginRender->InitNativeWindow(nativeWindow);
    return nullptr;
}

void* PluginManager::DestroySurface(int64_t surfaceId)
{
    auto pluginRenderMapIter = pluginRenderMap_.find(surfaceId);
    if (pluginRenderMapIter != pluginRenderMap_.end()) {
        delete pluginRenderMapIter->second;
        pluginRenderMap_.erase(pluginRenderMapIter);
    }
    auto windowMapIter = windowMap_.find(surfaceId);
    if (windowMapIter != windowMap_.end()) {
        OH_NativeWindow_DestroyNativeWindow(windowMapIter->second);
        windowMap_.erase(windowMapIter);
    }
    return nullptr;
}

void* PluginManager::ChangeSurface(int64_t surfaceId, double width, double height)
{
    auto pluginRender = GetPluginRender(surfaceId);
    if (pluginRender == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "ChangeSurface: Get pluginRender failed");
        return nullptr;
    }
    pluginRender->UpdateNativeWindowSize(width, height);
    return nullptr;
}

void* PluginManager::ChangeColor(int64_t surfaceId)
{
    auto pluginRender = GetPluginRender(surfaceId);
    if (pluginRender == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "ChangeColor: Get pluginRender failed");
        return nullptr;
    }
    pluginRender->ChangeColor();
    return nullptr;
}

void* PluginManager::DrawPattern(int64_t surfaceId)
{
    auto pluginRender = GetPluginRender(surfaceId);
    if (pluginRender == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "DrawPattern: Get pluginRender failed");
        return nullptr;
    }
    pluginRender->DrawPattern();
    return nullptr;
}

bool PluginManager::GetXComponentHasDraw(int64_t surfaceId)
{
    auto pluginRender = GetPluginRender(surfaceId);
    if (pluginRender == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager",
                     "GetXComponentStatus: Get pluginRender failed");
        return false;
    }
    return pluginRender->HasDraw();
}

bool PluginManager::GetXComponentHasChangeColor(int64_t surfaceId)
{
    auto pluginRender = GetPluginRender(surfaceId);
    if (pluginRender == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager",
                     "GetXComponentStatus: Get pluginRender failed");
        return false;
    }
    return pluginRender->HasChangedColor();
}
} // namespace NativeXComponentSample
```

#### egl_core.h

```cpp
#ifndef NATIVE_XCOMPONENT_EGL_CORE_H
#define NATIVE_XCOMPONENT_EGL_CORE_H

#include <EGL/egl.h>
#include <EGL/eglext.h>
#include <GLES3/gl3.h>

namespace NativeXComponentSample {
class EGLCore {
public:
    explicit EGLCore() {};
    ~EGLCore() {}
    bool EglContextInit(void* window);
    bool CreateEnvironment();
    void Draw(int& hasDraw);
    void Background();
    void ChangeColor(int& hasChangeColor);
    void Release();
    void UpdateSize(int width, int height);

private:
    GLuint LoadShader(GLenum type, const char* shaderSrc);
    GLuint CreateProgram(const char* vertexShader, const char* fragShader);
    GLint PrepareDraw();
    bool ExecuteDraw(GLint position, const GLfloat* color, const GLfloat shapeVertices[], unsigned long vertSize);
    bool ExecuteDrawStar(GLint position, const GLfloat* color, const GLfloat shapeVertices[], unsigned long vertSize);
    bool ExecuteDrawNewStar(GLint position, const GLfloat* color,
                            const GLfloat shapeVertices[], unsigned long vertSize);
    void Rotate2d(GLfloat centerX, GLfloat centerY, GLfloat* rotateX, GLfloat* rotateY, GLfloat theta);
    bool FinishDraw();

private:
    EGLNativeWindowType eglWindow_;
    EGLDisplay eglDisplay_ = EGL_NO_DISPLAY;
    EGLConfig eglConfig_ = EGL_NO_CONFIG_KHR;
    EGLSurface eglSurface_ = EGL_NO_SURFACE;
    EGLContext eglContext_ = EGL_NO_CONTEXT;
    GLuint program_;
    bool flag_ = false;
    int width_;
    int height_;
    GLfloat widthPercent_;
};
} // namespace NativeXComponentSample
#endif // NATIVE_XCOMPONENT_EGL_CORE_H
```

#### egl_core.cpp

```cpp
#include "egl_core.h"

#include <EGL/egl.h>
#include <EGL/eglext.h>
#include <EGL/eglplatform.h>
#include <GLES3/gl3.h>
#include <cmath>
#include <cstdio>
#include <hilog/log.h>

#include "../common/common.h"
#include "plugin_render.h"

namespace NativeXComponentSample {
namespace {
constexpr int32_t NUM_4 = 4;
/**
 * Vertex shader.
 */
const char VERTEX_SHADER[] = "#version 300 es\n"
                             "layout(location = 0) in vec4 a_position;\n"
                             "layout(location = 1) in vec4 a_color;   \n"
                             "out vec4 v_color;                       \n"
                             "void main()                             \n"
                             "{                                       \n"
                             "   gl_Position = a_position;            \n"
                             "   v_color = a_color;                   \n"
                             "}                                       \n";

/**
 * Fragment shader.
 */
const char FRAGMENT_SHADER[] = "#version 300 es\n"
                               "precision mediump float;                  \n"
                               "in vec4 v_color;                          \n"
                               "out vec4 fragColor;                       \n"
                               "void main()                               \n"
                               "{                                         \n"
                               "   fragColor = v_color;                   \n"
                               "}                                         \n";

/**
 * Background color #f4f4f4.
 */
const GLfloat BACKGROUND_COLOR[] = {244.0f / 255, 244.0f / 255, 244.0f / 255, 1.0f};

/**
 * Draw color #7E8FFB.
 */
const GLfloat DRAW_COLOR[] = {126.0f / 255, 143.0f / 255, 251.0f / 255, 1.0f};

/**
 * Change color #92D6CC.
 */
const GLfloat CHANGE_COLOR[] = {146.0f / 255, 214.0f / 255, 204.0f / 255, 1.0f};

/**
 * Background area.
 */
const GLfloat BACKGROUND_RECTANGLE_VERTICES[] = {
    -1.0f, 1.0f,
    1.0f, 1.0f,
    1.0f, -1.0f,
    -1.0f, -1.0f};

/**
 * Get context parameter count.
 */
const size_t GET_CONTEXT_PARAM_CNT = 1;

/**
 * Fifty percent.
 */
const float FIFTY_PERCENT = 0.5;

/**
 * Pointer size.
 */
const GLint POINTER_SIZE = 2;

/**
 * Triangle fan size.
 */
const GLsizei TRIANGLE_FAN_SIZE = 4;

/**
 * Egl red size default.
 */
const int EGL_RED_SIZE_DEFAULT = 8;

/**
 * Egl green size default.
 */
const int EGL_GREEN_SIZE_DEFAULT = 8;

/**
 * Egl blue size default.
 */
const int EGL_BLUE_SIZE_DEFAULT = 8;

/**
 * Egl alpha size default.
 */
const int EGL_ALPHA_SIZE_DEFAULT = 8;

/**
 * Default x position.
 */
const int DEFAULT_X_POSITION = 0;

/**
 * Default y position.
 */
const int DEFAULT_Y_POSITION = 0;

/**
 * Gl red default.
 */
const GLfloat GL_RED_DEFAULT = 0.0;

/**
 * Gl green default.
 */
const GLfloat GL_GREEN_DEFAULT = 0.0;

/**
 * Gl blue default.
 */
const GLfloat GL_BLUE_DEFAULT = 0.0;

/**
 * Gl alpha default.
 */
const GLfloat GL_ALPHA_DEFAULT = 1.0;

/**
 * Program error.
 */
const GLuint PROGRAM_ERROR = 0;

/**
 * Shape vertices size.
 */
const int SHAPE_VERTICES_SIZE = 8;

/**
 * Position handle name.
 */
const char POSITION_NAME[] = "a_position";

/**
 * Position error.
 */
const GLint POSITION_ERROR = -1;

/**
 * Config attribute list.
 */
const EGLint ATTRIB_LIST[] = {
    // Key,value.
    EGL_SURFACE_TYPE, EGL_WINDOW_BIT,
    EGL_RED_SIZE, EGL_RED_SIZE_DEFAULT,
    EGL_GREEN_SIZE, EGL_GREEN_SIZE_DEFAULT,
    EGL_BLUE_SIZE, EGL_BLUE_SIZE_DEFAULT,
    EGL_ALPHA_SIZE, EGL_ALPHA_SIZE_DEFAULT,
    EGL_RENDERABLE_TYPE, EGL_OPENGL_ES2_BIT,
    // End.
    EGL_NONE};

/**
 * Context attributes.
 */
const EGLint CONTEXT_ATTRIBS[] = {
    EGL_CONTEXT_CLIENT_VERSION, 2,
    EGL_NONE};
} // namespace
bool EGLCore::EglContextInit(void* window)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "EGLCore", "EglContextInit execute");
    eglWindow_ = static_cast<EGLNativeWindowType>(window);

    // Init display.
    eglDisplay_ = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    if (eglDisplay_ == EGL_NO_DISPLAY) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "eglGetDisplay: unable to get EGL display");
        return false;
    }

    EGLint majorVersion;
    EGLint minorVersion;
    if (!eglInitialize(eglDisplay_, &majorVersion, &minorVersion)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "eglInitialize: unable to get initialize EGL display");
        return false;
    }

    // Select configuration.
    const EGLint maxConfigSize = 1;
    EGLint numConfigs;
    if (!eglChooseConfig(eglDisplay_, ATTRIB_LIST, &eglConfig_, maxConfigSize, &numConfigs)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "eglChooseConfig: unable to choose configs");
        return false;
    }

    return CreateEnvironment();
}

bool EGLCore::CreateEnvironment()
{
    // Create surface.
    if (eglWindow_ == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "eglWindow_ is null");
        return false;
    }
    eglSurface_ = eglCreateWindowSurface(eglDisplay_, eglConfig_, eglWindow_, NULL);
    if (eglSurface_ == nullptr) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "eglCreateWindowSurface: unable to create surface");
        return false;
    }
    // Create context.
    eglContext_ = eglCreateContext(eglDisplay_, eglConfig_, EGL_NO_CONTEXT, CONTEXT_ATTRIBS);
    if (!eglMakeCurrent(eglDisplay_, eglSurface_, eglSurface_, eglContext_)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "eglMakeCurrent failed");
        return false;
    }
    // Create program.
    program_ = CreateProgram(VERTEX_SHADER, FRAGMENT_SHADER);
    if (program_ == PROGRAM_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "CreateProgram: unable to create program");
        return false;
    }
    return true;
}

void EGLCore::Background()
{
    GLint position = PrepareDraw();
    if (position == POSITION_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "Background get position failed");
        return;
    }

    if (!ExecuteDraw(position, BACKGROUND_COLOR,
                     BACKGROUND_RECTANGLE_VERTICES, sizeof(BACKGROUND_RECTANGLE_VERTICES))) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "Background execute draw failed");
        return;
    }

    if (!FinishDraw()) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "Background FinishDraw failed");
        return;
    }
}

void EGLCore::Draw(int& hasDraw)
{
    flag_ = false;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "EGLCore", "Draw");
    GLint position = PrepareDraw();
    if (position == POSITION_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "Draw get position failed");
        return;
    }

    if (!ExecuteDraw(position, BACKGROUND_COLOR,
                     BACKGROUND_RECTANGLE_VERTICES, sizeof(BACKGROUND_RECTANGLE_VERTICES))) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "Draw execute draw background failed");
        return;
    }

    // Divided into five quadrilaterals and calculate one of the quadrilateral's Vertices
    GLfloat rotateX = 0;
    GLfloat rotateY = FIFTY_PERCENT * height_;
    GLfloat centerX = 0;
    // Convert DEG(54° & 18°) to RAD
    GLfloat centerY = -rotateY * (M_PI / 180 * 54) * (M_PI / 180 * 18);
    // Convert DEG(18°) to RAD
    GLfloat leftX = -rotateY * (M_PI / 180 * 18);
    GLfloat leftY = 0;
    // Convert DEG(18°) to RAD
    GLfloat rightX = rotateY * (M_PI / 180 * 18);
    GLfloat rightY = 0;

    const GLfloat shapeVertices[] = { centerX / width_, centerY / height_, leftX / width_, leftY / height_,
        rotateX / width_, rotateY / height_, rightX / width_, rightY / height_ };

    if (!ExecuteDrawStar(position, DRAW_COLOR, shapeVertices, sizeof(shapeVertices))) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "Draw execute draw shape failed");
        return;
    }

    // Convert DEG(72°) to RAD
    GLfloat rad = M_PI / 180 * 72;
    // Rotate four times
    for (int i = 0; i < NUM_4; ++i) {
        Rotate2d(centerX, centerY, &rotateX, &rotateY, rad);
        Rotate2d(centerX, centerY, &leftX, &leftY, rad);
        Rotate2d(centerX, centerY, &rightX, &rightY, rad);

        const GLfloat shapeVertices[] = { centerX / width_, centerY / height_, leftX / width_, leftY / height_,
            rotateX / width_, rotateY / height_, rightX / width_, rightY / height_ };

        if (!ExecuteDrawStar(position, DRAW_COLOR, shapeVertices, sizeof(shapeVertices))) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "Draw execute draw shape failed");
            return;
        }
    }

    if (!FinishDraw()) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "Draw FinishDraw failed");
        return;
    }
    hasDraw = 1;

    flag_ = true;
}

void EGLCore::ChangeColor(int& hasChangeColor)
{
    if (!flag_) {
        return;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "EGLCore", "ChangeColor");
    GLint position = PrepareDraw();
    if (position == POSITION_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "ChangeColor get position failed");
        return;
    }

    if (!ExecuteDraw(position, BACKGROUND_COLOR,
                     BACKGROUND_RECTANGLE_VERTICES, sizeof(BACKGROUND_RECTANGLE_VERTICES))) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "ChangeColor execute draw background failed");
        return;
    }

    // Divided into five quadrilaterals and calculate one of the quadrilateral's Vertices
    GLfloat rotateX = 0;
    GLfloat rotateY = FIFTY_PERCENT * height_;
    GLfloat centerX = 0;
    // Convert DEG(54° & 18°) to RAD
    GLfloat centerY = -rotateY * (M_PI / 180 * 54) * (M_PI / 180 * 18);
    // Convert DEG(18°) to RAD
    GLfloat leftX = -rotateY * (M_PI / 180 * 18);
    GLfloat leftY = 0;
    // Convert DEG(18°) to RAD
    GLfloat rightX = rotateY * (M_PI / 180 * 18);
    GLfloat rightY = 0;

    const GLfloat shapeVertices[] = { centerX / width_, centerY / height_, leftX / width_, leftY / height_,
        rotateX / width_, rotateY / height_, rightX / width_, rightY / height_ };

    if (!ExecuteDrawNewStar(0, CHANGE_COLOR, shapeVertices, sizeof(shapeVertices))) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "Draw execute draw shape failed");
        return;
    }

    // Convert DEG(72°) to RAD
    GLfloat rad = M_PI / 180 * 72;
    // Rotate four times
    for (int i = 0; i < NUM_4; ++i) {
        Rotate2d(centerX, centerY, &rotateX, &rotateY, rad);
        Rotate2d(centerX, centerY, &leftX, &leftY, rad);
        Rotate2d(centerX, centerY, &rightX, &rightY, rad);
        const GLfloat shapeVertices[] = { centerX / width_, centerY / height_, leftX / width_, leftY / height_,
            rotateX / width_, rotateY / height_, rightX / width_, rightY / height_ };

        if (!ExecuteDrawNewStar(position, CHANGE_COLOR, shapeVertices, sizeof(shapeVertices))) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "Draw execute draw shape failed");
            return;
        }
    }

    if (!FinishDraw()) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "ChangeColor FinishDraw failed");
    }
    hasChangeColor = 1;
}

GLint EGLCore::PrepareDraw()
{
    if ((eglDisplay_ == nullptr) || (eglSurface_ == nullptr) || (eglContext_ == nullptr) ||
        (!eglMakeCurrent(eglDisplay_, eglSurface_, eglSurface_, eglContext_))) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "PrepareDraw: param error");
        return POSITION_ERROR;
    }

    // The gl function has no return value.
    glViewport(DEFAULT_X_POSITION, DEFAULT_Y_POSITION, width_, height_);
    glClearColor(GL_RED_DEFAULT, GL_GREEN_DEFAULT, GL_BLUE_DEFAULT, GL_ALPHA_DEFAULT);
    glClear(GL_COLOR_BUFFER_BIT);
    glUseProgram(program_);

    return glGetAttribLocation(program_, POSITION_NAME);
}

bool EGLCore::ExecuteDraw(GLint position, const GLfloat* color, const GLfloat shapeVertices[], unsigned long vertSize)
{
    if ((position > 0) || (color == nullptr) || (vertSize / sizeof(shapeVertices[0])) != SHAPE_VERTICES_SIZE) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "ExecuteDraw: param error");
        return false;
    }

    // The gl function has no return value.
    glVertexAttribPointer(position, POINTER_SIZE, GL_FLOAT, GL_FALSE, 0, shapeVertices);
    glEnableVertexAttribArray(position);
    glVertexAttrib4fv(1, color);
    glDrawArrays(GL_TRIANGLE_FAN, 0, TRIANGLE_FAN_SIZE);
    glDisableVertexAttribArray(position);

    return true;
}

bool EGLCore::ExecuteDrawStar(
    GLint position, const GLfloat* color, const GLfloat shapeVertices[], unsigned long vertSize)
{
    if ((position > 0) || (color == nullptr) || (vertSize / sizeof(shapeVertices[0])) != SHAPE_VERTICES_SIZE) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "ExecuteDraw: param error");
        return false;
    }

    // The gl function has no return value.
    glVertexAttribPointer(position, POINTER_SIZE, GL_FLOAT, GL_FALSE, 0, shapeVertices);
    glVertexAttribPointer(1, POINTER_SIZE, GL_FLOAT, GL_FALSE, 0, color);
    glEnableVertexAttribArray(position);
    glEnableVertexAttribArray(1);
    glVertexAttrib4fv(1, color);
    glDrawArrays(GL_TRIANGLE_FAN, 0, TRIANGLE_FAN_SIZE);
    glDisableVertexAttribArray(position);
    glDisableVertexAttribArray(1);

    return true;
}

bool EGLCore::ExecuteDrawNewStar(
    GLint position, const GLfloat* color, const GLfloat shapeVertices[], unsigned long vertSize)
{
    if ((position > 0) || (color == nullptr) || (vertSize / sizeof(shapeVertices[0])) != SHAPE_VERTICES_SIZE) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "ExecuteDraw: param error");
        return false;
    }

    // The gl function has no return value.
    glVertexAttribPointer(position, POINTER_SIZE, GL_FLOAT, GL_FALSE, 0, shapeVertices);
    glEnableVertexAttribArray(position);
    glVertexAttrib4fv(1, color);
    glDrawArrays(GL_TRIANGLE_FAN, 0, TRIANGLE_FAN_SIZE);
    glDisableVertexAttribArray(position);

    return true;
}

void EGLCore::Rotate2d(GLfloat centerX, GLfloat centerY, GLfloat* rotateX, GLfloat* rotateY, GLfloat theta)
{
    GLfloat tempX = cos(theta) * (*rotateX - centerX) - sin(theta) * (*rotateY - centerY);
    GLfloat tempY = sin(theta) * (*rotateX - centerX) + cos(theta) * (*rotateY - centerY);
    *rotateX = tempX + centerX;
    *rotateY = tempY + centerY;
}

bool EGLCore::FinishDraw()
{
    // The gl function has no return value.
    glFlush();
    glFinish();
    return eglSwapBuffers(eglDisplay_, eglSurface_);
}

GLuint EGLCore::LoadShader(GLenum type, const char* shaderSrc)
{
    if ((type <= 0) || (shaderSrc == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "glCreateShader type or shaderSrc error");
        return PROGRAM_ERROR;
    }

    GLuint shader = glCreateShader(type);
    if (shader == 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "glCreateShader unable to load shader");
        return PROGRAM_ERROR;
    }

    // The gl function has no return value.
    glShaderSource(shader, 1, &shaderSrc, nullptr);
    glCompileShader(shader);

    GLint compiled;
    glGetShaderiv(shader, GL_COMPILE_STATUS, &compiled);
    if (compiled != 0) {
        return shader;
    }

    GLint infoLen = 0;
    glGetShaderiv(shader, GL_INFO_LOG_LENGTH, &infoLen);
    if (infoLen <= 1) {
        glDeleteShader(shader);
        return PROGRAM_ERROR;
    }

    char* infoLog = (char*)malloc(sizeof(char) * (infoLen + 1));
    if (infoLog != nullptr) {
        memset(infoLog, 0, infoLen + 1);
        glGetShaderInfoLog(shader, infoLen, nullptr, infoLog);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "glCompileShader error = %s", infoLog);
        free(infoLog);
        infoLog = nullptr;
    }
    glDeleteShader(shader);
    return PROGRAM_ERROR;
}

GLuint EGLCore::CreateProgram(const char* vertexShader, const char* fragShader)
{
    if ((vertexShader == nullptr) || (fragShader == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "createProgram: vertexShader or fragShader is null");
        return PROGRAM_ERROR;
    }

    GLuint vertex = LoadShader(GL_VERTEX_SHADER, vertexShader);
    if (vertex == PROGRAM_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "createProgram vertex error");
        return PROGRAM_ERROR;
    }

    GLuint fragment = LoadShader(GL_FRAGMENT_SHADER, fragShader);
    if (fragment == PROGRAM_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "createProgram fragment error");
        return PROGRAM_ERROR;
    }

    GLuint program = glCreateProgram();
    if (program == PROGRAM_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "createProgram program error");
        glDeleteShader(vertex);
        glDeleteShader(fragment);
        return PROGRAM_ERROR;
    }

    // The gl function has no return value.
    glAttachShader(program, vertex);
    glAttachShader(program, fragment);
    glLinkProgram(program);

    GLint linked;
    glGetProgramiv(program, GL_LINK_STATUS, &linked);
    if (linked != 0) {
        glDeleteShader(vertex);
        glDeleteShader(fragment);
        return program;
    }

    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "createProgram linked error");
    GLint infoLen = 0;
    glGetProgramiv(program, GL_INFO_LOG_LENGTH, &infoLen);
    if (infoLen > 1) {
        char* infoLog = (char*)malloc(sizeof(char) * (infoLen + 1));
        memset(infoLog, 0, infoLen + 1);
        glGetProgramInfoLog(program, infoLen, nullptr, infoLog);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "glLinkProgram error = %s", infoLog);
        free(infoLog);
        infoLog = nullptr;
    }
    glDeleteShader(vertex);
    glDeleteShader(fragment);
    glDeleteProgram(program);
    return PROGRAM_ERROR;
}

void EGLCore::UpdateSize(int width, int height)
{
    width_ = width;
    height_ = height;
    if (width_ > 0) {
        widthPercent_ = FIFTY_PERCENT * height_ / width_;
    }
}

void EGLCore::Release()
{
    if ((eglDisplay_ == nullptr) || (eglSurface_ == nullptr) || (!eglDestroySurface(eglDisplay_, eglSurface_))) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "Release eglDestroySurface failed");
    }

    if ((eglDisplay_ == nullptr) || (eglContext_ == nullptr) || (!eglDestroyContext(eglDisplay_, eglContext_))) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "Release eglDestroyContext failed");
    }

    if ((eglDisplay_ == nullptr) || (!eglTerminate(eglDisplay_))) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "EGLCore", "Release eglTerminate failed");
    }
}
} // namespace NativeXComponentSample
```

#### plugin_render.h

```cpp
#ifndef NATIVE_XCOMPONENT_PLUGIN_RENDER_H
#define NATIVE_XCOMPONENT_PLUGIN_RENDER_H

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <native_window/external_window.h>
#include "egl_core.h"

namespace NativeXComponentSample {
class PluginRender {
public:
    explicit PluginRender(int64_t& id);
    ~PluginRender()
    {
        if (eglCore_ != nullptr) {
            eglCore_->Release();
            delete eglCore_;
            eglCore_ = nullptr;
        }
    }
    void ChangeColor();
    void DrawPattern();
    int32_t HasDraw();
    int32_t HasChangedColor();
    void InitNativeWindow(OHNativeWindow* window);
    void UpdateNativeWindowSize(int width, int height);
private:
    EGLCore* eglCore_;
    int64_t id_;
    int32_t hasDraw_;
    int32_t hasChangeColor_;
};
} // namespace NativeXComponentSample
#endif // NATIVE_XCOMPONENT_PLUGIN_RENDER_H
```

#### plugin_render.cpp

```cpp
#include <cstdint>
#include "plugin_render.h"
#include <cstdint>
#include "plugin_render.h"

namespace NativeXComponentSample {

PluginRender::PluginRender(int64_t& id)
{
    this->id_ = id;
    this->eglCore_ = new EGLCore();
    hasDraw_ = 0;
    hasChangeColor_ = 0;
}

void PluginRender::ChangeColor()
{
    eglCore_->ChangeColor(hasChangeColor_);
}

void PluginRender::DrawPattern()
{
    eglCore_->Draw(hasDraw_);
}

void PluginRender::InitNativeWindow(OHNativeWindow *window)
{
    eglCore_->EglContextInit(window);
}

void PluginRender::UpdateNativeWindowSize(int width, int height)
{
    eglCore_->UpdateSize(width, height);
    if (!hasChangeColor_ && !hasDraw_) {
        eglCore_->Background();
    }
}

int32_t PluginRender::HasDraw()
{
    return hasDraw_;
}

int32_t PluginRender::HasChangedColor()
{
    return hasChangeColor_;
}
} // namespace NativeXComponentSample
```

#### CMakeLists.txt

```text
# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(XComponent)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
add_definitions(-DOHOS_PLATFORM)

include_directories(
    ${NATIVERENDER_ROOT_PATH}
    ${NATIVERENDER_ROOT_PATH}/include
)

add_library(nativerender SHARED
    render/egl_core.cpp
    render/plugin_render.cpp
    manager/plugin_manager.cpp
    exportffi.cpp
#    napi_init.cpp
)

find_library(
    # Sets the name of the path variable.
    EGL-lib
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    EGL
)

find_library(
    # Sets the name of the path variable.
    GLES-lib
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    GLESv3
)

find_library(
    # Sets the name of the path variable.
    hilog-lib
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    hilog_ndk.z
)

find_library(
    # Sets the name of the path variable.
    libace-lib
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    ace_ndk.z
)

find_library(
    # Sets the name of the path variable.
    libuv-lib
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    uv
)

target_link_libraries(nativerender PUBLIC
    ${EGL-lib} ${GLES-lib} ${hilog-lib} ${libace-lib} ${libuv-lib} libnative_window.so)
```

#### exportffi.cpp

The FFI functions exposed to Cangjie serve as the glue layer between C++ code and Cangjie code.

```cpp
#include <hilog/log.h>

#include "common/common.h"
#include "manager/plugin_manager.h"

#ifndef CJ_EXPORT
#ifdef WINDOWS_PLATFORM
#define CJ_EXPORT __declspec(dllexport)
#else
#define CJ_EXPORT __attribute__((visibility("default")))
#endif
#endif

namespace NativeXComponentSample {
EXTERN_C_START
CJ_EXPORT void FFIChangeColor(int64_t surfaceId)
{
    PluginManager::ChangeColor(surfaceId);
}

CJ_EXPORT void FFIDrawPattern(int64_t surfaceId)
{
    PluginManager::DrawPattern(surfaceId);
}

CJ_EXPORT void FFISetSurfaceId(int64_t surfaceId)
{
    PluginManager::SetSurfaceId(surfaceId);
}

CJ_EXPORT void FFIChangeSurface(int64_t surfaceId, double width, double height)
{
    PluginManager::ChangeSurface(surfaceId, width, height);
}

CJ_EXPORT void FFIDestroySurface(int64_t surfaceId)
{
    PluginManager::DestroySurface(surfaceId);
}

CJ_EXPORT bool FFIGetXComponentHasDraw(int64_t surfaceId)
{
    return PluginManager::GetXComponentHasDraw(surfaceId);
}

CJ_EXPORT bool FFIXComponentHasChangeColor(int64_t surfaceId)
{
    return PluginManager::GetXComponentHasChangeColor(surfaceId);
}
EXTERN_C_END

} // namespace NativeXComponentSample
```

### Build Configuration

xcomponent_dir.png

The native output libnativerender.so serves as a dependency for Cangjie and needs to be compiled and packaged into the application.
To compile the C++ output, modify the corresponding module's build-profile.json5 by adding the following configuration to the "builderOption" section.

```json
"externalNativeOptions": {
    "path": "./src/main/cpp/CMakeLists.txt",
    "arguments": "",
    "cppFlags": "",
    "abiFilters": ["arm64-v8a"]
},
```

The above configuration enables native output compilation during the build process. Additionally, you need to modify the cjpm configuration to include the native output as a dependency for Cangjie. Refer to the DevEco Studio Guide's "Build Configuration"<!--add link--> chapter for details.

![xcomponent](figures/xcomponent.png)
```