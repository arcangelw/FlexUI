//
//  Display.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

/// 表示支持 `display` 修饰符的协议。
///
/// `_FlexDisplayModifierType` 是一个标记协议，旨在标识实现该协议的视图可以应用显示修饰符。
/// 通过该协议，视图可以调整其在 Flex 布局中的显示状态，例如设置为 `none` 以隐藏元素。
public protocol _FlexDisplayModifierType {}

/// 用于修改 Flex 布局视图的显示修饰器。
///
/// `FlexDisplayModifier` 允许通过 Flex 布局系统设置视图的显示属性。该修饰器封装了 `Flex.Display` 的显示值，
/// 通过实现 `_FlexModifierType`，可以应用到任何符合 `FlexView` 协议的视图上，以灵活控制视图的显示方式。
public struct FlexDisplayModifier: _FlexModifierType {
    /// Flex 布局的显示值，定义视图的显示方式。
    ///
    /// 该属性用于控制视图在 Flex 布局中的显示状态，如 `flex`、`none` 等，允许开发者灵活控制元素的可见性。
    let value: Flex.Display

    /// 使用指定的显示方式初始化修饰器。
    ///
    /// - Parameter value: `Flex.Display` 值，表示视图的显示方式，如 `.none` 用于隐藏视图。
    init(_ value: Flex.Display) {
        self.value = value
    }

    /// 修改给定的 Flex 布局视图的显示属性。
    ///
    /// - Parameter element: 需要被修改的视图，必须遵循 `FlexView` 协议。
    /// - Returns: 返回应用了显示属性的视图，支持链式调用。
    ///
    /// - Note: 该方法将通过 `Flex` 布局的 `display(_:)` 方法设置视图的显示属性，允许隐藏或显示视图。
    public func modify(element: any FlexView) -> any FlexView {
        element.view.flex.display(value)
        return element
    }
}

public extension _FlexViewType where Self: _FlexDisplayModifierType {
    /// 为布局视图应用显示修饰符。
    ///
    /// 该方法仅适用于符合 `_FlexDisplayModifierType` 协议的视图，允许设置 Flex 布局的显示属性。
    /// 可用于显示或隐藏视图，或通过不同的显示属性控制视图的布局方式。
    ///
    /// - Parameter value: `Flex.Display` 值，指定视图的显示方式，如 `.none`、`.flex` 等。
    /// - Returns: 返回应用了显示修饰符的视图内容，支持链式调用。
    ///
    /// - Note: 该方法将视图的 `display` 属性设置为指定的值，并且返回经过修改的视图，便于进一步操作。
    @discardableResult
    func display(_ value: Flex.Display) -> FlexModifiedContent<Self, FlexDisplayModifier> {
        modifier(FlexDisplayModifier(value))
    }
}

public extension FlexModifiedContent where Content: _FlexDisplayModifierType {
    /// 为已经应用修饰器的视图内容添加显示修饰符。
    ///
    /// 允许在链式调用的基础上继续设置 Flex 布局的显示属性。可通过 `display(_:)` 方法动态改变视图的显示状态，增强布局的灵活性。
    ///
    /// - Parameter value: `Flex.Display` 值，指定视图的显示方式，如 `.none` 隐藏视图。
    /// - Returns: 返回应用了显示修饰符的视图内容，支持链式调用。
    ///
    /// - Note: 该方法可用于在已有的布局修改链上进一步调整视图的显示状态，例如通过设置 `display(.none)` 隐藏视图。
    @discardableResult
    func display(_ value: Flex.Display) -> FlexModifiedContent<Content, FlexDisplayModifier> {
        modifier(FlexDisplayModifier(value))
    }
}
