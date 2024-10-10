//
//  FlexVGridStack.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/9.
//

import FlexLayout
import UIKit

public struct FlexVGridStack: _FlexView, _FlexDefinable, _FlexViewType {
    public let view: UIView = FlexVGridView()
    public let columnCount: Int
    public let lineSpacing: CGFloat
    public let interitemSpacing: CGFloat
    public let rowHeight: CGFloat?
    public let justifyContent: Flex.JustifyContent
    public let alignItems: Flex.AlignItems
    public let children: _FlexViewType

    public init(
        columnCount: Int = 2,
        lineSpacing: CGFloat = 0,
        interitemSpacing: CGFloat = 0,
        rowHeight: CGFloat? = nil,
        justifyContent: Flex.JustifyContent = .start,
        alignItems: Flex.AlignItems = .stretch,
        @_FlexViewBuilder content: () -> any _FlexViewType
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

    public func define(superFlex: FlexLayout.Flex) -> any _FlexView {
        // swiftlint:disable:next force_cast
        let view = view as! FlexVGridView
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
extension FlexVGridView: _FlexViewLayoutModifierType {}
