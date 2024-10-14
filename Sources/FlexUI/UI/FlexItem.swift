//
//  FlexItem.swift
//
//
//  Created by arcangelw on 2024/9/27.
//

import FlexLayout
import UIKit

public struct FlexItem<View: UIView>: FlexView, _FlexViewType {
    public let view: View
    public init(_ view: View = _FlexView() as UIView) {
        self.view = view
    }

    @_spi(Internals)
    @discardableResult
    public func define(superFlex: FlexLayout.Flex) -> Self {
        superFlex.addItem(view)
        return self
    }
}

extension FlexItem: _FlexAlignSelfModifierType {}
extension FlexItem: _FlexDisplayModifierType {}
extension FlexItem: _FlexFrameModifierType {}
extension FlexItem: _FlexGrowModifierType {}
extension FlexItem: _FlexShrinkModifierType {}
extension FlexItem: _FlexPositionModifierType {}
extension FlexItem: _FlexViewVisualPropertiesModifierType {}
// extension FlexItem: _FlexViewLayoutModifierType {}
