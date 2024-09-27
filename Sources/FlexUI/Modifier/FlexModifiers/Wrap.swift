//
//  Wrap.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

public protocol _FlexWrapModifierType {}

public struct FlexWrapModifier: _FlexModifierType {
    let value: Flex.Wrap

    init(_ value: Flex.Wrap) {
        self.value = value
    }

    public func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
        element.view.flex.wrap(value)
        return element
    }
}

public extension _FlexViewType where Self: _FlexWrapModifierType {
    @discardableResult
    func wrap(_ value: Flex.Wrap) -> FlexModifiedContent<Self, FlexWrapModifier> {
        modifier(FlexWrapModifier(value))
    }
}

public extension FlexModifiedContent where Content: _FlexWrapModifierType {
    @discardableResult
    func wrap(_ value: Flex.Wrap) -> FlexModifiedContent<Content, FlexWrapModifier> {
        modifier(FlexWrapModifier(value))
    }
}
