//
//  Layout.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/9.
//

import FlexLayout
import UIKit

/// 表示支持布局修饰符的协议。
///
/// `_FlexViewLayoutModifierType` 协议作为标记协议，没有定义任何方法或属性，用于标识实现该协议的视图可以应用布局修饰符。
public protocol _FlexViewLayoutModifierType {}

public extension _FlexViewType where Self: _FlexViewLayoutModifierType, Self: FlexView {
    @discardableResult
    func applyLayout(mode: Flex.LayoutMode = .fitContainer) -> Self {
        view.flex.layout(mode: mode)
        return self
    }

    @discardableResult
    func isIncludedInLayout(_ included: Bool) -> Self {
        view.flex.isIncludedInLayout(included)
        return self
    }

    @discardableResult
    func markDirty() -> Self {
        view.flex.markDirty()
        return self
    }

    @discardableResult
    func sizeThatFits(size: CGSize = CGSize(width: CGFloat.nan, height: CGFloat.nan)) -> CGSize {
        return view.flex.sizeThatFits(size: size)
    }
}

public extension FlexModifiedContent where Content: _FlexViewLayoutModifierType, Content: FlexView {
    @discardableResult
    func applyLayout(mode: Flex.LayoutMode = .fitContainer) -> Self {
        content.view.flex.layout(mode: mode)
        return self
    }

    @discardableResult
    func isIncludedInLayout(_ included: Bool) -> Self {
        content.view.flex.isIncludedInLayout(included)
        return self
    }

    @discardableResult
    func markDirty() -> Self {
        content.view.flex.markDirty()
        return self
    }

    @discardableResult
    func sizeThatFits(size: CGSize = CGSize(width: CGFloat.nan, height: CGFloat.nan)) -> CGSize {
        return content.view.flex.sizeThatFits(size: size)
    }
}
