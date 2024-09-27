//
//  Position.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

public protocol _FlexPositionModifierType {}

public struct FlexPositionModifier: _FlexModifierType {
    let value: Flex.Position

    init(_ value: Flex.Position) {
        self.value = value
    }

    public func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
        element.view.flex.position(value)
        return element
    }
}

public extension _FlexViewType where Self: _FlexPositionModifierType {
    @discardableResult
    func position(_ value: Flex.Position) -> FlexModifiedContent<Self, FlexPositionModifier> {
        modifier(FlexPositionModifier(value))
    }
}

public extension FlexModifiedContent where Content: _FlexPositionModifierType {
    @discardableResult
    func position(_ value: Flex.Position) -> FlexModifiedContent<Content, FlexPositionModifier> {
        modifier(FlexPositionModifier(value))
    }
}
