//
//  LayoutDirection.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

/// 表示支持`layoutDirection`修饰符的协议。
///
/// `_FlexLayoutDirectionModifierType` 协议作为标记协议，没有定义任何方法或属性，用于标识实现该协议的视图可以应用布局方向修饰符。
public protocol _FlexLayoutDirectionModifierType {}

/// 一个用于修改 Flex 布局方向的修饰器。
///
/// `FlexLayoutDirectionModifier` 允许通过 Flex 布局系统设置视图的布局方向。通过实现 `_FlexModifierType`，它可以应用到任何遵循 `FlexView` 的布局视图上。
public struct FlexLayoutDirectionModifier: _FlexModifierType {
    /// Flex 布局的方向属性值，用于指定视图的布局方向。
    let value: Flex.LayoutDirection

    /// 初始化方法。
    ///
    /// - Parameter value: `Flex.LayoutDirection` 值，定义布局视图的方向。
    init(_ value: Flex.LayoutDirection) {
        self.value = value
    }

    /// 修改给定的 Flex 布局视图的方向属性。
    ///
    /// - Parameter element: 需要被修改的视图，必须遵循 `FlexView` 协议。
    /// - Returns: 修改后的视图，应用了布局方向属性。
    public func modify(element: any FlexView) -> any FlexView {
        element.view.flex.layoutDirection(value)
        return element
    }
}

public extension _FlexViewType where Self: _FlexLayoutDirectionModifierType {
    /// 为布局视图应用布局方向修饰符。
    ///
    /// 该方法仅适用于符合 `_FlexLayoutDirectionModifierType` 协议的视图，允许设置 Flex 布局的方向属性。
    ///
    /// - Parameter value: `Flex.LayoutDirection` 值，指定布局视图的方向。
    /// - Returns: 包含应用了布局方向修饰符的视图内容。
    @discardableResult
    func layoutDirection(_ value: Flex.LayoutDirection) -> FlexModifiedContent<Self, FlexLayoutDirectionModifier> {
        modifier(FlexLayoutDirectionModifier(value))
    }
}

public extension FlexModifiedContent where Content: _FlexLayoutDirectionModifierType {
    /// 为已经应用修饰器的视图内容添加布局方向修饰符。
    ///
    /// 允许在链式调用的基础上继续设置 Flex 布局的方向属性。
    ///
    /// - Parameter value: `Flex.LayoutDirection` 值，指定布局视图的方向。
    /// - Returns: 包含应用了布局方向修饰符的视图内容。
    @discardableResult
    func layoutDirection(_ value: Flex.LayoutDirection) -> FlexModifiedContent<Content, FlexLayoutDirectionModifier> {
        modifier(FlexLayoutDirectionModifier(value))
    }
}
