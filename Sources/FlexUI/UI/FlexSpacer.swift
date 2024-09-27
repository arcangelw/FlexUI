//
//  FlexSpacer.swift
//
//
//  Created by arcangelw on 2024/9/27.
//

import FlexLayout
import UIKit

public struct FlexSpacer: _FlexView, _FlexDefinable, _FlexViewType {
    public let view: UIView = FlexView()

    private let minLength: CGFloat

    private let flexGrow: CGFloat

    public init(minLength: CGFloat = 0, flexGrow: CGFloat = 1) {
        view.isHidden = true
        self.minLength = minLength
        self.flexGrow = flexGrow
    }

    @discardableResult
    public func define(superFlex: FlexLayout.Flex) -> any _FlexView {
        let flex = superFlex.addItem(view).grow(flexGrow)
        switch superFlex.direction {
        case .row, .rowReverse:
            flex.width(minLength)
        default:
            flex.height(minLength)
        }
        return self
    }
}
