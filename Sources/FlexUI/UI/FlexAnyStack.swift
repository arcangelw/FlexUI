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
    func content(@FlexViewBuilder content: () -> any _FlexViewType) -> Self

    func updateIfNeeded(reLayout: Bool)
}

public struct FlexAnyStack<View: UIView>: FlexView, _FlexViewType, _FlexAnyStackType {
    public let view: View
    public private(set) var children: UnsafeMutablePointer<any _FlexViewType>

    public init(_ view: View = _FlexView() as UIView) {
        self.view = view
        children = UnsafeMutablePointer<any _FlexViewType>.allocate(capacity: 1)
        children.initialize(to: EmptyBuilder())
    }

    @discardableResult
    public func content(@FlexViewBuilder content: () -> any _FlexViewType) -> Self {
        children.pointee = content()
        return self
    }

    @discardableResult
    public func updateIfNeeded(reLayout: Bool = true) {
        if reLayout {
            // 移除所有子视图
            for subview in view.subviews {
                subview.removeFromSuperview()
            }
        }
        layoutDefine()
    }

    @discardableResult
    public func define(superFlex: FlexLayout.Flex) -> Self {
        superFlex.addItem(view)
        layoutDefine()
        return self
    }
}

public extension FlexModifiedContent where Content: _FlexAnyStackType {
    @discardableResult
    func content(@FlexViewBuilder content: () -> any _FlexViewType) -> Self {
        self.content.content(content: content)
        return self
    }

    func updateIfNeeded(reLayout: Bool = true) {
        _ = flex_make()
        content.updateIfNeeded(reLayout: reLayout)
    }
}

extension FlexAnyStack: _FlexLayoutDefinable {
    public func layoutDefine() {
        for child in children.value.flex_make() {
            child.define(superFlex: view.flex)
        }
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
// extension FlexAnyStack: _FlexViewLayoutModifierType {}
