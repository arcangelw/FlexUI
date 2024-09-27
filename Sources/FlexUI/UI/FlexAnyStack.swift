//
//  FlexAnyStack.swift
//
//
//  Created by arcangelw on 2024/9/27.
//

import FlexLayout
import UIKit

public protocol _FlexAnyStackType {
    @discardableResult
    func content(@_FlexViewBuilder content: () -> any _FlexViewType) -> Self
    @discardableResult
    func updateIfNeeded(reLayout: Bool) -> Self
}

public struct FlexAnyStack<View: UIView>: _FlexView, _FlexDefinable, _FlexViewType, _FlexAnyStackType {
    public let view: View
    public private(set) var children: UnsafeMutablePointer<any _FlexViewType>

    public init(_ view: View = FlexView() as UIView) {
        self.view = view
        children = UnsafeMutablePointer<any _FlexViewType>.allocate(capacity: 1)
        children.initialize(to: EmptyBuilder())
    }

    @discardableResult
    public func content(@_FlexViewBuilder content: () -> any _FlexViewType) -> Self {
        children.pointee = content()
        return self
    }

    @discardableResult
    public func updateIfNeeded(reLayout: Bool = true) -> Self {
        if reLayout {
            for subview in view.subviews {
                subview.removeFromSuperview()
            }
        }
        for child in children.value.flex_make() {
            child.define(superFlex: view.flex)
        }
        return self
    }

    @discardableResult
    public func define(superFlex: Flex) -> any _FlexView {
        let stack = superFlex.addItem(view)
        for child in children.value.flex_make() {
            child.define(superFlex: stack)
        }
        return self
    }
}

public extension FlexModifiedContent where Content: _FlexAnyStackType {
    @discardableResult
    func commit() -> Self {
        _ = flex_make()
        return self
    }

    @discardableResult
    func content(@_FlexViewBuilder content: () -> any _FlexViewType) -> Self {
        self.content.content(content: content)
        return self
    }

    @discardableResult
    func updateIfNeeded(reLayout: Bool = true) -> Self {
        content.updateIfNeeded(reLayout: reLayout)
        return self
    }
}

extension FlexAnyStack: _FlexLayoutDirectionModifierType {}
extension FlexAnyStack: _FlexDirectionModifierType {}
extension FlexAnyStack: _FlexWrapModifierType {}
extension FlexAnyStack: _FlexJustifyContentModifierType {}
extension FlexAnyStack: _FlexAlignItemsModifierType {}
extension FlexAnyStack: _FlexAlignSelfModifierType {}
extension FlexAnyStack: _FlexAlignContentModifierType {}
extension FlexAnyStack: _FlexBasisModifierType {}
extension FlexAnyStack: _FlexDisplayModifierType {}
extension FlexAnyStack: _FlexFrameModifierType {}
extension FlexAnyStack: _FlexSpacingModifierType {}
extension FlexAnyStack: _FlexGrowModifierType {}
extension FlexAnyStack: _FlexShrinkModifierType {}
extension FlexAnyStack: _FlexPaddingModifierType {}
extension FlexAnyStack: _FlexPositionModifierType {}
extension FlexAnyStack: _FlexViewVisualPropertiesModifierType {}
extension FlexAnyStack: _FlexViewLayoutModifierType {}
