//
//  AlignContent.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

/// 表示支持 `alignContent` 修饰符的协议。
///
/// `_FlexAlignContentModifierType` 是一个标记协议，旨在标识实现该协议的视图可以应用对齐内容修饰符。
public protocol _FlexAlignContentModifierType {}

/// 用于修改 Flex 布局视图的对齐内容修饰器。
///
/// `FlexAlignContentModifier` 允许通过 Flex 布局系统设置视图的对齐内容属性。通过实现 `_FlexModifierType`，它可以应用到任何遵循 `FlexView` 的布局视图上。
public struct FlexAlignContentModifier: _FlexModifierType {
    /// Flex 布局的对齐内容值，定义视图在主轴方向上的对齐方式。
    let value: Flex.AlignContent

    /// 初始化方法。
    ///
    /// - Parameter value: `Flex.AlignContent` 值，表示视图的对齐内容方式。
    init(_ value: Flex.AlignContent) {
        self.value = value
    }

    /// 修改给定的 Flex 布局视图的对齐内容属性。
    ///
    /// - Parameter element: 需要被修改的视图，必须遵循 `FlexView` 协议。
    /// - Returns: 修改后的视图，应用了对齐内容属性。
    @_spi(Internals)
    public func modify(element: any FlexView) -> any FlexView {
        element.view.flex.alignContent(value)
        return element
    }
}

public extension _FlexViewType where Self: _FlexAlignContentModifierType {
    /// 为布局视图应用对齐内容修饰符。
    ///
    /// 该方法仅适用于符合 `_FlexAlignContentModifierType` 协议的视图，允许设置 Flex 布局的对齐内容属性。
    ///
    /// - Parameter value: `Flex.AlignContent` 值，指定视图的对齐内容方式。
    /// - Returns: 包含应用了对齐内容修饰符的视图内容。
    @discardableResult
    func alignContent(_ value: Flex.AlignContent) -> FlexModifiedContent<Self, FlexAlignContentModifier> {
        modifier(FlexAlignContentModifier(value))
    }
}

public extension FlexModifiedContent where Content: _FlexAlignContentModifierType {
    /// 为已经应用修饰器的视图内容添加对齐内容修饰符。
    ///
    /// 允许在链式调用的基础上继续设置 Flex 布局的对齐内容属性。
    ///
    /// - Parameter value: `Flex.AlignContent` 值，指定视图的对齐内容方式。
    /// - Returns: 包含应用了对齐内容修饰符的视图内容。
    @discardableResult
    func alignContent(_ value: Flex.AlignContent) -> FlexModifiedContent<Content, FlexAlignContentModifier> {
        modifier(FlexAlignContentModifier(value))
    }
}
