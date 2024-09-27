//
//  Direction.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

/// 表示支持 `direction` 修饰符的协议。
///
/// `_FlexDirectionModifierType` 是一个标记协议，旨在标识实现该协议的视图可以应用方向修饰符。
public protocol _FlexDirectionModifierType {}

/// 用于修改 Flex 布局视图的方向修饰器。
///
/// `FlexDirectionModifier` 允许通过 Flex 布局系统设置视图的布局方向。通过实现 `_FlexModifierType`，它可以应用到任何遵循 `FlexView` 的布局视图上。
public struct FlexDirectionModifier: _FlexModifierType {
    /// Flex 布局的方向值，定义视图的布局方向。
    let value: Flex.Direction

    /// 初始化方法。
    ///
    /// - Parameter value: `Flex.Direction` 值，表示视图的布局方向。
    init(_ value: Flex.Direction) {
        self.value = value
    }

    /// 修改给定的 Flex 布局视图的方向属性。
    ///
    /// - Parameter element: 需要被修改的视图，必须遵循 `FlexView` 协议。
    /// - Returns: 修改后的视图，应用了方向属性。
    public func modify(element: any FlexView) -> any FlexView {
        element.view.flex.direction(value)
        return element
    }
}

public extension _FlexViewType where Self: _FlexDirectionModifierType {
    /// 为布局视图应用方向修饰符。
    ///
    /// 该方法仅适用于符合 `_FlexDirectionModifierType` 协议的视图，允许设置 Flex 布局的方向属性。
    ///
    /// - Parameter value: `Flex.Direction` 值，指定视图的布局方向。
    /// - Returns: 包含应用了方向修饰符的视图内容。
    @discardableResult
    func direction(_ value: Flex.Direction) -> FlexModifiedContent<Self, FlexDirectionModifier> {
        modifier(FlexDirectionModifier(value))
    }
}

public extension FlexModifiedContent where Content: _FlexDirectionModifierType {
    /// 为已经应用修饰器的视图内容添加方向修饰符。
    ///
    /// 允许在链式调用的基础上继续设置 Flex 布局的方向属性。
    ///
    /// - Parameter value: `Flex.Direction` 值，指定视图的布局方向。
    /// - Returns: 包含应用了方向修饰符的视图内容。
    @discardableResult
    func direction(_ value: Flex.Direction) -> FlexModifiedContent<Content, FlexDirectionModifier> {
        modifier(FlexDirectionModifier(value))
    }
}
