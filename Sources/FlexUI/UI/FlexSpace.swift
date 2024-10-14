//
//  FlexSpace.swift
//
//
//  Created by arcangelw on 2024/9/27.
//

import FlexLayout
import UIKit

public struct FlexSpace: FlexView, _FlexViewType {
    public let view: UIView = _FlexView()

    private let width: CGFloat?

    private let height: CGFloat?

    public init(size: CGSize) {
        width = size.width
        height = size.height
    }

    public init(width: CGFloat? = nil, height: CGFloat? = nil) {
        self.width = width
        self.height = height
    }

    @_spi(Internals)
    @discardableResult
    public func define(superFlex: FlexLayout.Flex) -> Self {
        superFlex.addItem(view).width(width).height(height)
        return self
    }
}

extension FlexSpace: _FlexAlignSelfModifierType {}
extension FlexSpace: _FlexDisplayModifierType {}
extension FlexSpace: _FlexViewVisualPropertiesModifierType {}
