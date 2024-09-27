//
//  Basis.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

public protocol _FlexBasisModifierType {}

public struct FlexBasisModifier: _FlexModifierType {
    let value: CGFloat

    init(_ value: CGFloat) {
        self.value = value
    }

    public func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
        element.view.flex.basis(value)
        return element
    }
}

public extension _FlexViewType where Self: _FlexBasisModifierType {
    @discardableResult
    func basis(_ value: CGFloat) -> FlexModifiedContent<Self, FlexBasisModifier> {
        modifier(FlexBasisModifier(value))
    }
}

public extension FlexModifiedContent where Content: _FlexBasisModifierType {
    @discardableResult
    func basis(_ value: CGFloat) -> FlexModifiedContent<Content, FlexBasisModifier> {
        modifier(FlexBasisModifier(value))
    }
}
