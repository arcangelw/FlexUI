//
//  FlexItem.swift
//
//
//  Created by arcangelw on 2024/9/27.
//

import FlexLayout
import UIKit

public struct FlexItem<View: UIView>: _FlexView, _FlexDefinable, _FlexViewType {
    public let view: View
    public init(_ view: View = FlexView() as UIView) {
        self.view = view
    }

    @discardableResult
    public func define(superFlex: Flex) -> any _FlexView {
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
extension FlexItem: _FlexViewLayoutModifierType {}
