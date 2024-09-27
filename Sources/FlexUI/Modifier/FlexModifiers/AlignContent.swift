//
//  AlignContent.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

public protocol _FlexAlignContentModifierType {}

public struct FlexAlignContentModifier: _FlexModifierType {
    let value: Flex.AlignContent

    init(_ value: Flex.AlignContent) {
        self.value = value
    }

    public func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
        element.view.flex.alignContent(value)
        return element
    }
}

public extension _FlexViewType where Self: _FlexAlignContentModifierType {
    @discardableResult
    func alignSelf(_ value: Flex.AlignContent) -> FlexModifiedContent<Self, FlexAlignContentModifier> {
        modifier(FlexAlignContentModifier(value))
    }
}

public extension FlexModifiedContent where Content: _FlexAlignContentModifierType {
    @discardableResult
    func alignSelf(_ value: Flex.AlignContent) -> FlexModifiedContent<Content, FlexAlignContentModifier> {
        modifier(FlexAlignContentModifier(value))
    }
}
