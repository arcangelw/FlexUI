//
//  FlexSpace.swift
//
//
//  Created by arcangelw on 2024/9/27.
//

import FlexLayout
import UIKit

public struct FlexSpace: _FlexView, _FlexDefinable, _FlexViewType {
    public let view: UIView = FlexView()

    public let width: CGFloat?

    public let height: CGFloat?

    public init(size: CGSize) {
        width = size.width
        height = size.height
    }

    public init(width: CGFloat? = nil, height: CGFloat? = nil) {
        self.width = width
        self.height = height
    }

    @discardableResult
    public func define(superFlex: FlexLayout.Flex) -> any _FlexView {
        superFlex.addItem(view).width(width).height(height)
        return self
    }
}

extension FlexSpace: _FlexAlignSelfModifierType {}
extension FlexSpace: _FlexDisplayModifierType {}
extension FlexSpace: _FlexViewVisualPropertiesModifierType {}
