//
//  Properties.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/9.
//

import FlexLayout

public protocol _FlexViewVisualPropertiesModifierType {}

public extension _FlexViewType where Self: _FlexViewVisualPropertiesModifierType, Self: _FlexView {
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

public extension FlexModifiedContent where Content: _FlexViewVisualPropertiesModifierType, Content: _FlexView {
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
