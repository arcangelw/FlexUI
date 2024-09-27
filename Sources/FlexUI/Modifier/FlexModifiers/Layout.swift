//
//  Layout.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/9.
//

import FlexLayout

public protocol _FlexViewLayoutModifierType {}

public extension _FlexViewType where Self: _FlexViewLayoutModifierType, Self: _FlexView {
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

public extension FlexModifiedContent where Content: _FlexViewLayoutModifierType, Content: _FlexView {
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
