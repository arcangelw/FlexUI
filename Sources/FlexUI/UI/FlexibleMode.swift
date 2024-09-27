//
//  FlexibleMode.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/10.
//

/// 定义视图在 Flex 布局中的灵活模式。
///
/// `FlexibleMode` 枚举用于指定视图在 Flex 布局中的可伸缩方向。可以选择在宽度或高度方向上具有灵活性，帮助视图根据父视图或内容调整自身尺寸。
public enum FlexibleMode {
    /// 视图在宽度方向上是可伸缩的。
    case flexibleWidth

    /// 视图在高度方向上是可伸缩的。
    case flexibleHeight
}
