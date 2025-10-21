# 弹簧曲线

阻尼弹簧曲线（以下简称弹簧曲线）对应的阻尼弹簧系统中，偏离平衡位置的物体一方面受到弹簧形变产生的反向作用力，被迫发生振动。另一方面，阻尼的存在为物体振动提供阻力。除阻尼为0的特殊情况，物体在振动过程中振幅不断减小，且最终趋于0，其轨迹对应的动画曲线自然连续。

采用弹簧曲线的动画在达终点时动画速度为0，不会产生动画“戛然而止”的观感，以避免影响用户体验。

ArkUI提供了四种阻尼弹簧曲线接口。

- [springMotion](../../../reference/source_zh_cn/arkui-cj/cj-apis-curves.md#static-func-springmotionfloat32-float32-float32)：创建弹性动画，动画时长由曲线参数、属性变化值大小和弹簧初速度自动计算，开发者指定的动画时长不生效。<br> springMotion不提供速度设置接口，速度通过继承获得，无需开发者指定。对于某个属性，如果当前存在正在运行的springMotion或者responsiveSpringMotion类型动画，新创建的弹簧动画将停止正在运行的动画，并继承其当前时刻的动画属性值和速度作为新建动画的初始状态。此外，接口提供默认参数，便于开发者直接使用。

    ```cangjie
    public static func springMotion(response!: Float32 = 0.55, dampingFraction!: Float32 = 0.825,overlapDuration!: Float32 = 0.0): ICurve
    ```

- [responsiveSpringMotion](../../../reference/source_zh_cn/arkui-cj/cj-apis-curves.md#static-func-responsivespringmotionfloat32-float32-float32)：是springMotion动画的一种特例，仅默认参数不同。一般用于跟手做成动画的场景，离手时可用springMotion创建动画，此时离手阶段动画将自动继承跟手阶段动画速度，完成动画衔接。<br> 当新动画的overlapDuration参数不为0，且当前属性的上一个springMotion动画还未结束时，response和dampingFraction将在overlapDuration指定的时间内，从旧动画的参数值过渡到新动画的参数值。

    ```cangjie
    public static func responsiveSpringMotion(response!: Float32 = 0.15, dampingFraction!: Float32 = 0.86, overlapDuration!: Float32 = 0.25): ICurve
    ```

- [interpolatingSpring](../../../reference/source_zh_cn/arkui-cj/cj-apis-curves.md#static-func-interpolatingspringfloat32-float32-float32-float32)：适合于需要指定初速度的动效场景，动画时长同样由接口参数自动计算，开发者在动画接口中指定的时长不生效。<br> 曲线接口提供速度入参，且由于接口对应一条从0到1的阻尼弹簧曲线，实际动画值根据曲线进行插值计算。所以速度也应该为归一化速度，其值等于动画属性改变的绝对速度除以动画属性改变量。因此不适合于动画起点属性值和终点属性值相同的场景，此时动画属性改变量为0，归一化速度不存在。

    ```cangjie
    public static func interpolatingSpring(velocity: Float32, mass: Float32, stiffness: Float32, damping: Float32): ICurve
    ```

- [springCurve](../../../reference/source_zh_cn/arkui-cj/cj-apis-curves.md#static-func-springcurvefloat32-float32-float32-float32)：适合于需要直接指定动画时长的场景。springCurve接口与interpolatingSpring接口几乎一致，但是对于采用springCurve的动画，会将曲线的物理时长映射到指定的时长，相当于在时间轴上拉伸或压缩曲线，破坏曲线原本的物理规律，因此不建议开发者使用。

    ```cangjie
    public static func springCurve(velocity: Float32, mass: Float32, stiffness: Float32, damping: Float32): ICurve
    ```
