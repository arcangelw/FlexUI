//
//  FlexVStack.swift
//
//
//  Created by arcangelw on 2024/9/27.
//

import FlexLayout
import UIKit

public struct FlexVStack<View: UIView>: _FlexView, _FlexDefinable, _FlexViewType {
    public let view: View
    public let spacing: CGFloat
    public let justifyContent: Flex.JustifyContent
    public let alignItems: Flex.AlignItems
    public let flexWrap: FlexWrap
    public let isReverse: Bool
    public let children: _FlexViewType

    public init(
        _ view: View = FlexView() as UIView,
        spacing: CGFloat = 0,
        justifyContent: Flex.JustifyContent = .start,
        alignItems: Flex.AlignItems = .stretch,
        flexWrap: FlexWrap = .noWrap,
        isReverse: Bool = false,
        @_FlexViewBuilder content: () -> any _FlexViewType
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
    public func define(superFlex: Flex) -> any _FlexView {
        let stack = superFlex.addItem(view).direction(isReverse ? .columnReverse : .column)
            .justifyContent(justifyContent)
            .alignItems(alignItems)
            .rowGap(spacing)
        if case let .wrap(lineSpacing, alignContent) = flexWrap {
            stack.wrap(.wrap).alignContent(alignContent).columnGap(lineSpacing)
        }
        for child in children.flex_make() {
            child.define(superFlex: stack)
        }
        return self
    }
}

extension FlexVStack: _FlexLayoutDirectionModifierType {}
extension FlexVStack: _FlexAlignItemsModifierType {}
extension FlexVStack: _FlexAlignSelfModifierType {}
extension FlexVStack: _FlexBasisModifierType {}
extension FlexVStack: _FlexDisplayModifierType {}
extension FlexVStack: _FlexFrameModifierType {}
extension FlexVStack: _FlexGrowModifierType {}
extension FlexVStack: _FlexShrinkModifierType {}
extension FlexVStack: _FlexPaddingModifierType {}
extension FlexVStack: _FlexPositionModifierType {}
extension FlexVStack: _FlexViewVisualPropertiesModifierType {}
extension FlexVStack: _FlexViewLayoutModifierType {}
