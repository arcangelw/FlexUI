//
//  Grow.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout
import UIKit

/// 表示支持`grow`修饰符的协议。
///
/// `_FlexGrowModifierType` 协议作为标记协议，没有定义任何方法或属性，用于标识实现该协议的视图可以应用生长修饰符。
public protocol _FlexGrowModifierType {}

/// 一个用于修改 Flex 布局视图的生长比例修饰器。
///
/// `FlexGrowModifier` 允许通过 Flex 布局系统设置视图在可用空间中的生长比例。通过实现 `_FlexModifierType`，它可以应用到任何遵循 `FlexView` 的布局视图上。
public struct FlexGrowModifier: _FlexModifierType {
    /// Flex 布局的生长比例值，定义视图在可用空间中应占据的比例。
    let value: CGFloat

    /// 初始化方法。
    ///
    /// - Parameter value: `CGFloat` 值，表示视图的生长比例。
    init(_ value: CGFloat) {
        self.value = value
    }

    /// 修改给定的 Flex 布局视图的生长比例属性。
    ///
    /// - Parameter element: 需要被修改的视图，必须遵循 `FlexView` 协议。
    /// - Returns: 修改后的视图，应用了生长比例属性。
    @_spi(Internals)
    public func modify(element: any FlexView) -> any FlexView {
        element.view.flex.grow(value)
        return element
    }
}

public extension _FlexViewType where Self: _FlexGrowModifierType {
    /// 为布局视图应用生长修饰符。
    ///
    /// 该方法仅适用于符合 `_FlexGrowModifierType` 协议的视图，允许设置 Flex 布局的生长比例。
    ///
    /// - Parameter value: `CGFloat` 值，指定视图的生长比例。
    /// - Returns: 包含应用了生长修饰符的视图内容。
    @discardableResult
    func grow(_ value: CGFloat) -> FlexModifiedContent<Self, FlexGrowModifier> {
        modifier(FlexGrowModifier(value))
    }
}

public extension FlexModifiedContent where Content: _FlexGrowModifierType {
    /// 为已经应用修饰器的视图内容添加生长修饰符。
    ///
    /// 允许在链式调用的基础上继续设置 Flex 布局的生长比例。
    ///
    /// - Parameter value: `CGFloat` 值，指定视图的生长比例。
    /// - Returns: 包含应用了生长修饰符的视图内容。
    @discardableResult
    func grow(_ value: CGFloat) -> FlexModifiedContent<Content, FlexGrowModifier> {
        modifier(FlexGrowModifier(value))
    }
}
