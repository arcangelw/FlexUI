//
//  Shrink.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout
import UIKit

/// 表示支持 `shrink` 修饰符的协议。
///
/// `_FlexShrinkModifierType` 协议作为标记协议，没有定义任何方法或属性，用于标识实现该协议的视图可以应用 `shrink` 修饰符。
public protocol _FlexShrinkModifierType {}

/// 一个用于修改 Flex 布局中 `shrink` 属性的修饰器。
///
/// `FlexShrinkModifier` 允许通过 Flex 布局系统的 `shrink` 属性设置视图的缩小比例。通过实现 `_FlexModifierType`，它可以应用到任何遵循 `FlexView` 的布局视图上。
public struct FlexShrinkModifier: _FlexModifierType {
    /// Flex 布局的 `shrink` 属性值，用于指定视图的缩小比例。
    let value: CGFloat

    /// 初始化方法。
    ///
    /// - Parameter value: `CGFloat` 值，定义布局视图的缩小比例，值越大缩小效果越明显。
    init(_ value: CGFloat) {
        self.value = value
    }

    /// 修改给定的 Flex 布局视图的 `shrink` 属性。
    ///
    /// - Parameter element: 需要被修改的视图，必须遵循 `FlexView` 协议。
    /// - Returns: 修改后的视图，应用了 `shrink` 属性。
    @_spi(Internals)
    public func modify(element: any FlexView) -> any FlexView {
        element.view.flex.shrink(value)
        return element
    }
}

public extension _FlexViewType where Self: _FlexShrinkModifierType {
    /// 为布局视图应用 `shrink` 修饰符。
    ///
    /// 该方法仅适用于符合 `_FlexShrinkModifierType` 协议的视图，允许设置 Flex 布局的 `shrink` 属性。
    ///
    /// - Parameter value: `CGFloat` 值，指定布局的缩小比例。
    /// - Returns: 包含应用了 `shrink` 修饰符的视图内容。
    @discardableResult
    func shrink(_ value: CGFloat) -> FlexModifiedContent<Self, FlexShrinkModifier> {
        modifier(FlexShrinkModifier(value))
    }
}

public extension FlexModifiedContent where Content: _FlexShrinkModifierType {
    /// 为已经应用修饰器的视图内容添加 `shrink` 修饰符。
    ///
    /// 允许在链式调用的基础上继续设置 Flex 布局的 `shrink` 属性。
    ///
    /// - Parameter value: `CGFloat` 值，指定布局的缩小比例。
    /// - Returns: 包含应用了 `shrink` 修饰符的视图内容。
    @discardableResult
    func shrink(_ value: CGFloat) -> FlexModifiedContent<Content, FlexShrinkModifier> {
        modifier(FlexShrinkModifier(value))
    }
}
