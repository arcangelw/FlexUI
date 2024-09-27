//
//  AlignSelf.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

public protocol _FlexAlignSelfModifierType {}

public struct FlexAlignSelfModifier: _FlexModifierType {
    let value: Flex.AlignSelf

    init(_ value: Flex.AlignSelf) {
        self.value = value
    }

    public func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
        element.view.flex.alignSelf(value)
        return element
    }
}

public extension _FlexViewType where Self: _FlexAlignSelfModifierType {
    @discardableResult
    func alignSelf(_ value: Flex.AlignSelf) -> FlexModifiedContent<Self, FlexAlignSelfModifier> {
        modifier(FlexAlignSelfModifier(value))
    }
}

public extension FlexModifiedContent where Content: _FlexAlignSelfModifierType {
    @discardableResult
    func alignSelf(_ value: Flex.AlignSelf) -> FlexModifiedContent<Content, FlexAlignSelfModifier> {
        modifier(FlexAlignSelfModifier(value))
    }
}
