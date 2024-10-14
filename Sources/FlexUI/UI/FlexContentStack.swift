//
//  FlexContentStack.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/11.
//

import FlexLayout
import UIKit

public protocol _FlexContentViewType {
    @discardableResult
    func content(@FlexViewBuilder content: () -> any _FlexViewType) -> Self
}

public struct FlexContentStack: FlexView, _FlexViewType, _FlexContentViewType {
    public let view: UIView

    private var children: UnsafeMutablePointer<any _FlexViewType>

    init(_ view: UIView) {
        self.view = view
        children = .init(value: EmptyBuilder())
    }

    @discardableResult
    public func content(@FlexViewBuilder content: () -> any _FlexViewType) -> Self {
        children.value = content()
        return self
    }

    @_spi(Internals)
    public func define(superFlex _: FlexLayout.Flex) -> Self {
        return self
    }
}

extension FlexContentStack: _FlexLayoutDefinable {
    @_spi(Internals)
    public func layoutDefine() {
        for child in children.value.flex_make() {
            child.define(superFlex: view.flex)
        }
    }
}

extension FlexModifiedContent: _FlexContentViewType where Content: _FlexContentViewType {
    @discardableResult
    public func content(@FlexViewBuilder content: () -> any _FlexViewType) -> Self {
        self.content.content(content: content)
        return self
    }
}

extension FlexContentStack: _FlexLayoutDirectionModifierType {}
extension FlexContentStack: _FlexDirectionModifierType {}
extension FlexContentStack: _FlexWrapModifierType {}
extension FlexContentStack: _FlexJustifyContentModifierType {}
extension FlexContentStack: _FlexAlignItemsModifierType {}
extension FlexContentStack: _FlexAlignContentModifierType {}
extension FlexContentStack: _FlexBasisModifierType {}
extension FlexContentStack: _FlexSpacingModifierType {}
extension FlexContentStack: _FlexPaddingModifierType {}
extension FlexContentStack: _FlexViewVisualPropertiesModifierType {}

public protocol _FlexContentStackType {
    @discardableResult
    func contentStack(closure: (_ contentStack: inout FlexContentStack) -> any _FlexContentViewType) -> Self
}

public extension FlexModifiedContent where Content: _FlexContentStackType {
    @discardableResult
    func contentStack(closure: (_ contentStack: inout FlexContentStack) -> any _FlexContentViewType) -> Self {
        content.contentStack(closure: closure)
        return self
    }
}
