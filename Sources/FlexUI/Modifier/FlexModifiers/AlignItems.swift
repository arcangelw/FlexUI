//
//  AlignItems.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

/// 表示支持 `alignItems` 修饰符的协议。
///
/// `_FlexAlignItemsModifierType` 是一个标记协议，旨在标识实现该协议的视图可以应用对齐项目修饰符。
public protocol _FlexAlignItemsModifierType {}

/// 用于修改 Flex 布局视图的对齐项目修饰器。
///
/// `FlexAlignItemsModifier` 允许通过 Flex 布局系统设置视图的对齐项目属性。通过实现 `_FlexModifierType`，它可以应用到任何遵循 `FlexView` 的布局视图上。
public struct FlexAlignItemsModifier: _FlexModifierType {
    /// Flex 布局的对齐项目值，定义视图在交叉轴方向上的对齐方式。
    let value: Flex.AlignItems

    /// 初始化方法。
    ///
    /// - Parameter value: `Flex.AlignItems` 值，表示视图的对齐项目方式。
    init(_ value: Flex.AlignItems) {
        self.value = value
    }

    /// 修改给定的 Flex 布局视图的对齐项目属性。
    ///
    /// - Parameter element: 需要被修改的视图，必须遵循 `FlexView` 协议。
    /// - Returns: 修改后的视图，应用了对齐项目属性。
    @_spi(Internals)
    public func modify(element: any FlexView) -> any FlexView {
        element.view.flex.alignItems(value)
        return element
    }
}

public extension _FlexViewType where Self: _FlexAlignItemsModifierType {
    /// 为布局视图应用对齐项目修饰符。
    ///
    /// 该方法仅适用于符合 `_FlexAlignItemsModifierType` 协议的视图，允许设置 Flex 布局的对齐项目属性。
    ///
    /// - Parameter value: `Flex.AlignItems` 值，指定视图的对齐项目方式。
    /// - Returns: 包含应用了对齐项目修饰符的视图内容。
    @discardableResult
    func alignItems(_ value: Flex.AlignItems) -> FlexModifiedContent<Self, FlexAlignItemsModifier> {
        modifier(FlexAlignItemsModifier(value))
    }
}

public extension FlexModifiedContent where Content: _FlexAlignItemsModifierType {
    /// 为已经应用修饰器的视图内容添加对齐项目修饰符。
    ///
    /// 允许在链式调用的基础上继续设置 Flex 布局的对齐项目属性。
    ///
    /// - Parameter value: `Flex.AlignItems` 值，指定视图的对齐项目方式。
    /// - Returns: 包含应用了对齐项目修饰符的视图内容。
    @discardableResult
    func alignItems(_ value: Flex.AlignItems) -> FlexModifiedContent<Content, FlexAlignItemsModifier> {
        modifier(FlexAlignItemsModifier(value))
    }
}
