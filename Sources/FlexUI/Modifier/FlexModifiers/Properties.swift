//
//  Properties.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/9.
//

import FlexLayout
import UIKit

/// 表示支持视觉属性修饰符的协议。
///
/// `_FlexViewVisualPropertiesModifierType` 协议作为标记协议，没有定义任何方法或属性，用于标识实现该协议的视图可以应用视觉属性修饰符。
public protocol _FlexViewVisualPropertiesModifierType {}

public extension _FlexViewType where Self: _FlexViewVisualPropertiesModifierType, Self: FlexView {
    @discardableResult
    func backgroundColor(_ color: UIColor) -> Self {
        view.flex.backgroundColor(color)
        return self
    }

    @discardableResult
    func cornerRadius(_ value: CGFloat) -> Self {
        view.flex.cornerRadius(value)
        return self
    }

    @discardableResult
    func border(_ width: CGFloat, _ color: UIColor) -> Self {
        view.flex.border(width, color)
        return self
    }
}

public extension FlexModifiedContent where Content: _FlexViewVisualPropertiesModifierType, Content: FlexView {
    @discardableResult
    func backgroundColor(_ color: UIColor) -> Self {
        content.view.flex.backgroundColor(color)
        return self
    }

    @discardableResult
    func cornerRadius(_ value: CGFloat) -> Self {
        content.view.flex.cornerRadius(value)
        return self
    }

    @discardableResult
    func border(_ width: CGFloat, _ color: UIColor) -> Self {
        content.view.flex.border(width, color)
        return self
    }
}
