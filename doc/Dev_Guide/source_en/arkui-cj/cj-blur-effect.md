# Blur

Animation effects can enrich interface details, enhancing the realism and quality of the UI. For example, blur and shadow effects can make objects appear more three-dimensional, bringing animations to life. ArkUI provides a rich set of effect APIs, enabling developers to quickly create refined and personalized effects. This chapter introduces commonly used effect APIs such as blur, shadow, and color effects.

Blur can be used to convey depth in interface space and distinguish hierarchical relationships between front and back elements.

| API                                                                                                                         | Description                                                                 |
| :-------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------- |
| [backdropBlur](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-background.md#func-backdropblurfloat64)     | Adds a background blur effect to the current component. The input parameter is the blur radius. |
| [blur](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-imageeffect.md#func-blurfloat64)                    | Adds a content blur effect to the current component. The input parameter is the blur radius. |
| [backgroundBlurStyle](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-background.md#func-backgroundblurstyleblurstyle-optionbackgroundblurstyleoptions) | Adds a background blur effect to the current component. The input parameter is the blur style. |
| [foregroundBlurStyle](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-foregroundblurstyle.md#func-foregroundblurstyleforegroundblurstyle-optionforegroundblurstyleoptions) | Adds a content blur effect to the current component. The input parameter is the blur style. |
| [motionBlur](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-motionblur.md#func-motionblurmotionbluroptions) | Adds a dynamic blur effect during motion caused by scaling or displacement changes to the current component. The input parameters are the blur radius and anchor coordinates. |

> **Note:**
>
> The above APIs are real-time blur interfaces that render frame by frame, resulting in higher performance overhead. When neither the blur content nor the blur radius needs to change, it is recommended to use the static blur API `blur`.