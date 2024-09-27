//
//  Shrink.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

public protocol _FlexShrinkModifierType {}

public struct FlexShrinkModifier: _FlexModifierType {
    let value: CGFloat

    init(_ value: CGFloat) {
        self.value = value
    }

    public func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
        element.view.flex.shrink(value)
        return element
    }
}

public extension _FlexViewType where Self: _FlexShrinkModifierType {
    @discardableResult
    func shrink(_ value: CGFloat) -> FlexModifiedContent<Self, FlexShrinkModifier> {
        modifier(FlexShrinkModifier(value))
    }
}

public extension FlexModifiedContent where Content: _FlexShrinkModifierType {
    @discardableResult
    func shrink(_ value: CGFloat) -> FlexModifiedContent<Content, FlexShrinkModifier> {
        modifier(FlexShrinkModifier(value))
    }
}
