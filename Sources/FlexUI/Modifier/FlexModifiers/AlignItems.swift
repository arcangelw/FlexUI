//
//  AlignItems.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

public protocol _FlexAlignItemsModifierType {}

public struct FlexAlignItemsModifier: _FlexModifierType {
    let value: Flex.AlignItems

    init(_ value: Flex.AlignItems) {
        self.value = value
    }

    public func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
        element.view.flex.alignItems(value)
        return element
    }
}

public extension _FlexViewType where Self: _FlexAlignItemsModifierType {
    @discardableResult
    func alignItems(_ value: Flex.AlignItems) -> FlexModifiedContent<Self, FlexAlignItemsModifier> {
        modifier(FlexAlignItemsModifier(value))
    }
}

public extension FlexModifiedContent where Content: _FlexAlignItemsModifierType {
    @discardableResult
    func alignItems(_ value: Flex.AlignItems) -> FlexModifiedContent<Content, FlexAlignItemsModifier> {
        modifier(FlexAlignItemsModifier(value))
    }
}
