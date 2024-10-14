//
//  Basis.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout
import UIKit

/// 表示支持 `basis` 修饰符的协议。
///
/// `_FlexBasisModifierType` 是一个标记协议，旨在标识实现该协议的视图可以应用基础宽度修饰符。
public protocol _FlexBasisModifierType {}

/// 用于修改 Flex 布局视图的基础宽度修饰器。
///
/// `FlexBasisModifier` 允许通过 Flex 布局系统设置视图的基础宽度属性。通过实现 `_FlexModifierType`，它可以应用到任何遵循 `FlexView` 的布局视图上。
public struct FlexBasisModifier: _FlexModifierType {
    /// Flex 布局的基础宽度值，定义视图的初始宽度。
    let value: CGFloat

    /// 初始化方法。
    ///
    /// - Parameter value: `CGFloat` 值，表示视图的基础宽度。
    init(_ value: CGFloat) {
        self.value = value
    }

    /// 修改给定的 Flex 布局视图的基础宽度属性。
    ///
    /// - Parameter element: 需要被修改的视图，必须遵循 `FlexView` 协议。
    /// - Returns: 修改后的视图，应用了基础宽度属性。
    @_spi(Internals)
    public func modify(element: any FlexView) -> any FlexView {
        element.view.flex.basis(value)
        return element
    }
}

public extension _FlexViewType where Self: _FlexBasisModifierType {
    /// 为布局视图应用基础宽度修饰符。
    ///
    /// 该方法仅适用于符合 `_FlexBasisModifierType` 协议的视图，允许设置 Flex 布局的基础宽度属性。
    ///
    /// - Parameter value: `CGFloat` 值，指定视图的基础宽度。
    /// - Returns: 包含应用了基础宽度修饰符的视图内容。
    @discardableResult
    func basis(_ value: CGFloat) -> FlexModifiedContent<Self, FlexBasisModifier> {
        modifier(FlexBasisModifier(value))
    }
}

public extension FlexModifiedContent where Content: _FlexBasisModifierType {
    /// 为已经应用修饰器的视图内容添加基础宽度修饰符。
    ///
    /// 允许在链式调用的基础上继续设置 Flex 布局的基础宽度属性。
    ///
    /// - Parameter value: `CGFloat` 值，指定视图的基础宽度。
    /// - Returns: 包含应用了基础宽度修饰符的视图内容。
    @discardableResult
    func basis(_ value: CGFloat) -> FlexModifiedContent<Content, FlexBasisModifier> {
        modifier(FlexBasisModifier(value))
    }
}
