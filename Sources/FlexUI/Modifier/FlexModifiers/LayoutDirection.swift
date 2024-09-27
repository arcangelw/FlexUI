//
//  LayoutDirection.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

public protocol _FlexLayoutDirectionModifierType {}

public struct FlexLayoutDirectionModifier: _FlexModifierType {
    let value: Flex.LayoutDirection

    init(_ value: Flex.LayoutDirection) {
        self.value = value
    }

    public func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
        element.view.flex.layoutDirection(value)
        return element
    }
}

public extension _FlexViewType where Self: _FlexLayoutDirectionModifierType {
    @discardableResult
    func layoutDirection(_ value: Flex.LayoutDirection) -> FlexModifiedContent<Self, FlexLayoutDirectionModifier> {
        modifier(FlexLayoutDirectionModifier(value))
    }
}

public extension FlexModifiedContent where Content: _FlexLayoutDirectionModifierType {
    @discardableResult
    func layoutDirection(_ value: Flex.LayoutDirection) -> FlexModifiedContent<Content, FlexLayoutDirectionModifier> {
        modifier(FlexLayoutDirectionModifier(value))
    }
}
