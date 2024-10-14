//
//  FlexVGridStack.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/9.
//

import FlexLayout
import UIKit

public struct FlexVGridStack: FlexView, _FlexViewType {
    public let view: UIView = _FlexVGridView()
    private let columnCount: Int
    private let lineSpacing: CGFloat
    private let interitemSpacing: CGFloat
    private let rowHeight: CGFloat?
    private let justifyContent: Flex.JustifyContent
    private let alignItems: Flex.AlignItems
    private let children: _FlexViewType

    public init(
        columnCount: Int = 2,
        lineSpacing: CGFloat = 0,
        interitemSpacing: CGFloat = 0,
        rowHeight: CGFloat? = nil,
        justifyContent: Flex.JustifyContent = .start,
        alignItems: Flex.AlignItems = .stretch,
        @FlexViewBuilder content: () -> any _FlexViewType
    ) {
        assert(columnCount >= 2, "columnCount must >= 2")
        self.columnCount = columnCount
        self.lineSpacing = lineSpacing
        self.interitemSpacing = interitemSpacing
        self.rowHeight = rowHeight
        self.justifyContent = justifyContent
        self.alignItems = alignItems
        children = content()
    }

    @_spi(Internals)
    @discardableResult
    public func define(superFlex: FlexLayout.Flex) -> Self {
        // swiftlint:disable:next force_cast
        let view = view as! _FlexVGridView
        let subviews = view.contentView.subviews
        for subview in subviews {
            subview.removeFromSuperview()
        }
        let children = children.flex_make()
        let remainder = (columnCount - children.count % columnCount) % columnCount
        let spacer = (0 ..< remainder).map { _ in FlexSpacer() }
        let percent = (100 / (columnCount + 1)) + 1
        superFlex.addItem(view).direction(.column).alignItems(.stretch).justifyContent(.start)
            .define { flex in
                flex.addItem(view.contentView).direction(.row).wrap(.wrap)
                    .justifyContent(justifyContent).alignItems(alignItems)
                    .rowGap(lineSpacing).columnGap(interitemSpacing)
                    .define { flex in
                        for child in children + spacer {
                            child.define(superFlex: flex).view.flex
                                .grow(1).shrink(1)
                                .minWidth(percent%).width(1).height(rowHeight)
                        }
                    }
            }
        return self
    }
}

extension FlexVGridStack: _FlexAlignSelfModifierType {}
extension FlexVGridStack: _FlexDisplayModifierType {}
extension FlexVGridStack: _FlexFrameModifierType {}
extension FlexVGridStack: _FlexGrowModifierType {}
extension FlexVGridStack: _FlexShrinkModifierType {}
extension FlexVGridStack: _FlexPaddingModifierType {}
extension FlexVGridStack: _FlexPositionModifierType {}
extension FlexVGridStack: _FlexViewVisualPropertiesModifierType {}
// extension FlexVGridStack: _FlexViewLayoutModifierType {}
