//
//  JustifyContent.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

/// 表示支持`justifyContent`修饰符的协议。
///
/// `_FlexJustifyContentModifierType` 协议作为标记协议，没有定义任何方法或属性，用于标识实现该协议的视图可以应用对齐内容修饰符。
public protocol _FlexJustifyContentModifierType {}

/// 一个用于修改 Flex 布局内容对齐方式的修饰器。
///
/// `FlexJustifyContentModifier` 允许通过 Flex 布局系统设置视图的内容对齐方式。通过实现 `_FlexModifierType`，它可以应用到任何遵循 `FlexView` 的布局视图上。
public struct FlexJustifyContentModifier: _FlexModifierType {
    /// Flex 布局的对齐内容属性值，用于指定视图的内容对齐方式。
    let value: Flex.JustifyContent

    /// 初始化方法。
    ///
    /// - Parameter value: `Flex.JustifyContent` 值，定义内容的对齐方式。
    init(_ value: Flex.JustifyContent) {
        self.value = value
    }

    /// 修改给定的 Flex 布局视图的对齐内容属性。
    ///
    /// - Parameter element: 需要被修改的视图，必须遵循 `FlexView` 协议。
    /// - Returns: 修改后的视图，应用了对齐内容属性。
    @_spi(Internals)
    public func modify(element: any FlexView) -> any FlexView {
        element.view.flex.justifyContent(value)
        return element
    }
}

public extension _FlexViewType where Self: _FlexJustifyContentModifierType {
    /// 为布局视图应用对齐内容修饰符。
    ///
    /// 该方法仅适用于符合 `_FlexJustifyContentModifierType` 协议的视图，允许设置 Flex 布局的内容对齐方式。
    ///
    /// - Parameter value: `Flex.JustifyContent` 值，指定内容的对齐方式。
    /// - Returns: 包含应用了对齐内容修饰符的视图内容。
    @discardableResult
    func justifyContent(_ value: Flex.JustifyContent) -> FlexModifiedContent<Self, FlexJustifyContentModifier> {
        modifier(FlexJustifyContentModifier(value))
    }
}

public extension FlexModifiedContent where Content: _FlexJustifyContentModifierType {
    /// 为已经应用修饰器的视图内容添加对齐内容修饰符。
    ///
    /// 允许在链式调用的基础上继续设置 Flex 布局的内容对齐方式。
    ///
    /// - Parameter value: `Flex.JustifyContent` 值，指定内容的对齐方式。
    /// - Returns: 包含应用了对齐内容修饰符的视图内容。
    @discardableResult
    func justifyContent(_ value: Flex.JustifyContent) -> FlexModifiedContent<Content, FlexJustifyContentModifier> {
        modifier(FlexJustifyContentModifier(value))
    }
}
