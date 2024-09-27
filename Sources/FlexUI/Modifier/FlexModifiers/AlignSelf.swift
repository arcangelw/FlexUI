//
//  AlignSelf.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

/// 表示支持 `alignSelf` 修饰符的协议。
///
/// `_FlexAlignSelfModifierType` 是一个标记协议，旨在标识实现该协议的视图可以应用自身对齐修饰符。
public protocol _FlexAlignSelfModifierType {}

/// 用于修改 Flex 布局视图的自身对齐修饰器。
///
/// `FlexAlignSelfModifier` 允许通过 Flex 布局系统设置视图的自身对齐属性。通过实现 `_FlexModifierType`，它可以应用到任何遵循 `FlexView` 的布局视图上。
public struct FlexAlignSelfModifier: _FlexModifierType {
    /// Flex 布局的自身对齐值，定义视图在交叉轴方向上的自身对齐方式。
    let value: Flex.AlignSelf

    /// 初始化方法。
    ///
    /// - Parameter value: `Flex.AlignSelf` 值，表示视图的自身对齐方式。
    init(_ value: Flex.AlignSelf) {
        self.value = value
    }

    /// 修改给定的 Flex 布局视图的自身对齐属性。
    ///
    /// - Parameter element: 需要被修改的视图，必须遵循 `FlexView` 协议。
    /// - Returns: 修改后的视图，应用了自身对齐属性。
    public func modify(element: any FlexView) -> any FlexView {
        element.view.flex.alignSelf(value)
        return element
    }
}

public extension _FlexViewType where Self: _FlexAlignSelfModifierType {
    /// 为布局视图应用自身对齐修饰符。
    ///
    /// 该方法仅适用于符合 `_FlexAlignSelfModifierType` 协议的视图，允许设置 Flex 布局的自身对齐属性。
    ///
    /// - Parameter value: `Flex.AlignSelf` 值，指定视图的自身对齐方式。
    /// - Returns: 包含应用了自身对齐修饰符的视图内容。
    @discardableResult
    func alignSelf(_ value: Flex.AlignSelf) -> FlexModifiedContent<Self, FlexAlignSelfModifier> {
        modifier(FlexAlignSelfModifier(value))
    }
}

public extension FlexModifiedContent where Content: _FlexAlignSelfModifierType {
    /// 为已经应用修饰器的视图内容添加自身对齐修饰符。
    ///
    /// 允许在链式调用的基础上继续设置 Flex 布局的自身对齐属性。
    ///
    /// - Parameter value: `Flex.AlignSelf` 值，指定视图的自身对齐方式。
    /// - Returns: 包含应用了自身对齐修饰符的视图内容。
    @discardableResult
    func alignSelf(_ value: Flex.AlignSelf) -> FlexModifiedContent<Content, FlexAlignSelfModifier> {
        modifier(FlexAlignSelfModifier(value))
    }
}
