//
//  FlexHStack.swift
//
//
//  Created by arcangelw on 2024/9/27.
//

import FlexLayout
import UIKit

public struct FlexHStack<View: UIView>: FlexView, _FlexViewType {
    public let view: View
    public let spacing: CGFloat
    public let justifyContent: Flex.JustifyContent
    public let alignItems: Flex.AlignItems
    public let flexWrap: FlexWrap
    public let isReverse: Bool
    public let children: _FlexViewType

    public init(
        _ view: View = _FlexView() as UIView,
        spacing: CGFloat = 0,
        justifyContent: Flex.JustifyContent = .start,
        alignItems: Flex.AlignItems = .stretch,
        flexWrap: FlexWrap = .noWrap,
        isReverse: Bool = false,
        @FlexViewBuilder content: () -> any _FlexViewType
    ) {
        self.view = view
        self.spacing = spacing
        self.justifyContent = justifyContent
        self.alignItems = alignItems
        self.flexWrap = flexWrap
        self.isReverse = isReverse
        children = content()
    }

    @discardableResult
    public func define(superFlex: FlexLayout.Flex) -> Self {
        superFlex.addItem(view)
        layoutDefine()
        return self
    }
}

extension FlexHStack: _FlexLayoutDefinable {
    public func layoutDefine() {
        let stack = view.flex.direction(isReverse ? .rowReverse : .row)
            .justifyContent(justifyContent)
            .alignItems(alignItems)
            .columnGap(spacing)
            .wrap(flexWrap.wrap)
            .alignContent(flexWrap.alignContent)
            .rowGap(flexWrap.lineSpacing)

        for child in children.flex_make() {
            child.define(superFlex: stack)
        }
    }
}

extension FlexHStack: _FlexLayoutDirectionModifierType {}
extension FlexHStack: _FlexAlignItemsModifierType {}
extension FlexHStack: _FlexAlignSelfModifierType {}
extension FlexHStack: _FlexBasisModifierType {}
extension FlexHStack: _FlexDisplayModifierType {}
extension FlexHStack: _FlexFrameModifierType {}
extension FlexHStack: _FlexGrowModifierType {}
extension FlexHStack: _FlexShrinkModifierType {}
extension FlexHStack: _FlexPaddingModifierType {}
extension FlexHStack: _FlexPositionModifierType {}
extension FlexHStack: _FlexViewVisualPropertiesModifierType {}
// extension FlexHStack: _FlexViewLayoutModifierType {}
