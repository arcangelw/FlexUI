//
//  Grow.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

public protocol _FlexGrowModifierType {}

public struct FlexGrowModifier: _FlexModifierType {
    let value: CGFloat

    init(_ value: CGFloat) {
        self.value = value
    }

    public func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
        element.view.flex.grow(value)
        return element
    }
}

public extension _FlexViewType where Self: _FlexGrowModifierType {
    @discardableResult
    func grow(_ value: CGFloat) -> FlexModifiedContent<Self, FlexGrowModifier> {
        modifier(FlexGrowModifier(value))
    }
}

public extension FlexModifiedContent where Content: _FlexGrowModifierType {
    @discardableResult
    func grow(_ value: CGFloat) -> FlexModifiedContent<Content, FlexGrowModifier> {
        modifier(FlexGrowModifier(value))
    }
}
