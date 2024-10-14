//
//  Wrap.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

/// 表示支持 `wrap` 修饰符的协议。
///
/// `_FlexWrapModifierType` 协议作为标记协议，没有定义任何方法或属性，用于标识实现该协议的视图可以应用 `wrap` 修饰符。
public protocol _FlexWrapModifierType {}

/// 一个用于修改 Flex 布局中 `wrap` 属性的修饰器。
///
/// `FlexWrapModifier` 允许通过 Flex 布局系统的 `wrap` 属性设置视图的换行方式。通过实现 `_FlexModifierType`，它可以应用到任何遵循 `FlexView` 的布局视图上。
public struct FlexWrapModifier: _FlexModifierType {
    /// Flex 布局的 `wrap` 属性值，用于指定视图的换行方式。
    let value: Flex.Wrap

    /// 初始化方法。
    ///
    /// - Parameter value: `Flex.Wrap` 值，定义布局的换行方式（如 `.wrap`、`.noWrap` 等）。
    init(_ value: Flex.Wrap) {
        self.value = value
    }

    /// 修改给定的 Flex 布局视图的 `wrap` 属性。
    ///
    /// - Parameter element: 需要被修改的视图，必须遵循 `FlexView` 协议。
    /// - Returns: 修改后的视图，应用了 `wrap` 属性。
    @_spi(Internals)
    public func modify(element: any FlexView) -> any FlexView {
        element.view.flex.wrap(value)
        return element
    }
}

public extension _FlexViewType where Self: _FlexWrapModifierType {
    /// 为布局视图应用 `wrap` 修饰符。
    ///
    /// 该方法仅适用于符合 `_FlexWrapModifierType` 协议的视图，允许设置 Flex 布局的 `wrap` 属性。
    ///
    /// - Parameter value: `Flex.Wrap` 值，指定布局的换行方式。
    /// - Returns: 包含应用了 `wrap` 修饰符的视图内容。
    @discardableResult
    func wrap(_ value: Flex.Wrap) -> FlexModifiedContent<Self, FlexWrapModifier> {
        modifier(FlexWrapModifier(value))
    }
}

public extension FlexModifiedContent where Content: _FlexWrapModifierType {
    /// 为已经应用修饰器的视图内容添加 `wrap` 修饰符。
    ///
    /// 允许在链式调用的基础上继续设置 Flex 布局的 `wrap` 属性。
    ///
    /// - Parameter value: `Flex.Wrap` 值，指定布局的换行方式。
    /// - Returns: 包含应用了 `wrap` 修饰符的视图内容。
    @discardableResult
    func wrap(_ value: Flex.Wrap) -> FlexModifiedContent<Content, FlexWrapModifier> {
        modifier(FlexWrapModifier(value))
    }
}
