//
//  FlexSpacer.swift
//
//
//  Created by arcangelw on 2024/9/27.
//

import FlexLayout
import UIKit

public struct FlexSpacer: FlexView, _FlexViewType {
    public let view: UIView = _FlexSpacerView()

    private let minLength: CGFloat

    private let flexGrow: CGFloat

    public init(minLength: CGFloat = 0, flexGrow: CGFloat = 1) {
        view.isHidden = true
        self.minLength = minLength
        self.flexGrow = flexGrow
    }

    @_spi(Internals)
    @discardableResult
    public func define(superFlex: FlexLayout.Flex) -> Self {
        superFlex.addItem(view).grow(flexGrow).basis(minLength)
        return self
    }
}

private class _FlexSpacerView: _FlexView {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        super.isHidden = true
    }
}
