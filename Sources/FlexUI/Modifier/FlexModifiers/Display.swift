//
//  Display.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

public protocol _FlexDisplayModifierType {}

public struct FlexDisplayModifier: _FlexModifierType {
    let value: Flex.Display

    init(_ value: Flex.Display) {
        self.value = value
    }

    public func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
        element.view.flex.display(value)
        return element
    }
}

public extension _FlexViewType where Self: _FlexDisplayModifierType {
    @discardableResult
    func direction(_ value: Flex.Display) -> FlexModifiedContent<Self, FlexDisplayModifier> {
        modifier(FlexDisplayModifier(value))
    }
}

public extension FlexModifiedContent where Content: _FlexDisplayModifierType {
    @discardableResult
    func direction(_ value: Flex.Display) -> FlexModifiedContent<Content, FlexDisplayModifier> {
        modifier(FlexDisplayModifier(value))
    }
}
