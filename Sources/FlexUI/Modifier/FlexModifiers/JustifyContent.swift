//
//  JustifyContent.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

public protocol _FlexJustifyContentModifierType {}

public struct FlexJustifyContentModifier: _FlexModifierType {
    let value: Flex.JustifyContent

    init(_ value: Flex.JustifyContent) {
        self.value = value
    }

    public func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
        element.view.flex.justifyContent(value)
        return element
    }
}

public extension _FlexViewType where Self: _FlexJustifyContentModifierType {
    @discardableResult
    func justifyContent(_ value: Flex.JustifyContent) -> FlexModifiedContent<Self, FlexJustifyContentModifier> {
        modifier(FlexJustifyContentModifier(value))
    }
}

public extension FlexModifiedContent where Content: _FlexJustifyContentModifierType {
    @discardableResult
    func justifyContent(_ value: Flex.JustifyContent) -> FlexModifiedContent<Content, FlexJustifyContentModifier> {
        modifier(FlexJustifyContentModifier(value))
    }
}
