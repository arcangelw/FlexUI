//
//  FlexZStack.swift
//
//
//  Created by arcangelw on 2024/9/27.
//

import FlexLayout
import UIKit

public struct FlexZStack: FlexView, _FlexViewType {
    public let view: UIView = _FlexZStackView()
    private let children: _FlexViewType

    public init(
        @FlexViewBuilder content: () -> any _FlexViewType
    ) {
        children = content()
    }

    @_spi(Internals)
    @discardableResult
    public func define(superFlex: FlexLayout.Flex) -> Self {
        // swiftlint:disable:next force_cast
        let view = view as! _FlexZStackView
        superFlex.addItem(view)
        switch superFlex.direction {
        case .row, .rowReverse:
            view.flexibleMode = .flexibleWidth
        default:
            view.flexibleMode = .flexibleHeight
        }

        for child in children.flex_make() {
            let flex = child.define(superFlex: view.contentView.flex)
            flex.view.flex.position(.absolute).start(0)
            if case .flexibleHeight = view.flexibleMode {
                flex.view.flex.end(0)
            }
        }
        return self
    }
}

extension FlexZStack: _FlexLayoutDirectionModifierType {}
extension FlexZStack: _FlexAlignSelfModifierType {}
extension FlexZStack: _FlexDisplayModifierType {}
extension FlexZStack: _FlexFrameModifierType {}
extension FlexZStack: _FlexGrowModifierType {}
extension FlexZStack: _FlexShrinkModifierType {}
extension FlexZStack: _FlexPositionModifierType {}
extension FlexZStack: _FlexViewVisualPropertiesModifierType {}
// extension FlexZStack: _FlexViewLayoutModifierType {}
