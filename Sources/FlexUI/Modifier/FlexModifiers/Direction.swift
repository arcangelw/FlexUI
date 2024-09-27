//
//  Direction.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

public protocol _FlexDirectionModifierType {}

public struct FlexDirectionModifier: _FlexModifierType {
    let value: Flex.Direction

    init(_ value: Flex.Direction) {
        self.value = value
    }

    public func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
        element.view.flex.direction(value)
        return element
    }
}

public extension _FlexViewType where Self: _FlexDirectionModifierType {
    @discardableResult
    func direction(_ value: Flex.Direction) -> FlexModifiedContent<Self, FlexDirectionModifier> {
        modifier(FlexDirectionModifier(value))
    }
}

public extension FlexModifiedContent where Content: _FlexDirectionModifierType {
    @discardableResult
    func direction(_ value: Flex.Direction) -> FlexModifiedContent<Content, FlexDirectionModifier> {
        modifier(FlexDirectionModifier(value))
    }
}
